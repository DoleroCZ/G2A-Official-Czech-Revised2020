
instance DIA_ADDON_SKINNER_EXIT(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 999;
	condition = dia_addon_skinner_exit_condition;
	information = dia_addon_skinner_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skinner_exit_condition()
{
	return TRUE;
};

func void dia_addon_skinner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKINNER_PICKPOCKET(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 900;
	condition = dia_addon_skinner_pickpocket_condition;
	information = dia_addon_skinner_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_skinner_pickpocket_condition()
{
	return c_beklauen(100,200);
};

func void dia_addon_skinner_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skinner_pickpocket);
	Info_AddChoice(dia_addon_skinner_pickpocket,DIALOG_BACK,dia_addon_skinner_pickpocket_back);
	Info_AddChoice(dia_addon_skinner_pickpocket,DIALOG_PICKPOCKET,dia_addon_skinner_pickpocket_doit);
};

func void dia_addon_skinner_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};

func void dia_addon_skinner_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
	b_say(self,self,"$AWAKE");
};


instance DIA_ADDON_SKINNER_HI(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 2;
	condition = dia_addon_skinner_hi_condition;
	information = dia_addon_skinner_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skinner_hi_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_skinner_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_00");	//Pro� jsi m� vzbudil? Vsad�m se, �e ani nev� pro� ...
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_01");	//Ne, neodpov�dej. Je pozd� na prominut�.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_02");	//M� dv� mo�nosti. Bojuj proti mn� a m� Betty, nebo se pokus o �t�k.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_03");	//Na tv�m m�st� bych se pokusil o �t�k ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_SKINNER_ATTENTAT(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 9;
	condition = dia_addon_skinner_attentat_condition;
	information = dia_addon_skinner_attentat_info;
	permanent = FALSE;
	description = "O pokusu o vra�du ...";
};


func int dia_addon_skinner_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skinner_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Skinner_Attentat_15_00");	//O pokusu o vra�du ...
	AI_Output(self,other,"DIA_Addon_Skinner_Attentat_08_01");	//Co ode mn� chce�?
	Info_ClearChoices(dia_addon_skinner_attentat);
	Info_AddChoice(dia_addon_skinner_attentat,"Chci aby jsme se zbavili Estebana.",dia_addon_skinner_attentat_addon_contra);
	Info_AddChoice(dia_addon_skinner_attentat,"Zabiji toho, kdo n�s zradil.",dia_addon_skinner_attentat_addon_pro);
};

func void dia_addon_skinner_attentat_addon_contra()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");	//Chci, aby jsme se zbavili Estebana.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//Super.
	JUDAS_COUNTER = JUDAS_COUNTER + 1;
	Info_ClearChoices(dia_addon_skinner_attentat);
};

func void dia_addon_skinner_attentat_addon_pro()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");	//Zabiji toho, kdo n�s zradil.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//K sakru.
	Info_ClearChoices(dia_addon_skinner_attentat);
};

