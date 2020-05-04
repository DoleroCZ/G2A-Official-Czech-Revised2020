
instance DIA_ADDON_WACHE_02_EXIT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 999;
	condition = dia_addon_wache_02_exit_condition;
	information = dia_addon_wache_02_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_wache_02_exit_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WACHE_02_PICKPOCKET(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 900;
	condition = dia_addon_wache_02_pickpocket_condition;
	information = dia_addon_wache_02_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_wache_02_pickpocket_condition()
{
	return c_beklauen(38,101);
};

func void dia_addon_wache_02_pickpocket_info()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_BACK,dia_addon_wache_02_pickpocket_back);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_PICKPOCKET,dia_addon_wache_02_pickpocket_doit);
};

func void dia_addon_wache_02_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};

func void dia_addon_wache_02_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};


instance DIA_ADDON_WACHE_02_HI(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_hi_condition;
	information = dia_addon_wache_02_hi_info;
	permanent = FALSE;
	description = "V�echno v po��dku?";
};


func int dia_addon_wache_02_hi_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Hi_15_00");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_01");	//Po�kej chv�li - nezn�me se odn�kud?
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_02");	//Hmmm..ne. Ty nejsi on. Ztra� se.
};


instance DIA_ADDON_WACHE_02_ATTENTAT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_attentat_condition;
	information = dia_addon_wache_02_attentat_info;
	permanent = FALSE;
	description = "Co v� o tom pokusu vra�dy?";
};


func int dia_addon_wache_02_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Attentat_15_00");	//Co v� o tom pokusu vra�dy?
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_01");	//Co o tom v�m? (Sm�ch) Zlomil jsem mu ob� nohy.
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_02");	//(v�hru�n�) a ud�l�m to komukoliv, kdo se chce dostat do pot�� s Estebanem...
};


instance DIA_ADDON_WACHE_02_PERM(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 99;
	condition = dia_addon_wache_02_perm_condition;
	information = dia_addon_wache_02_perm_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_addon_wache_02_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_perm_15_00");	//N�co nov�ho?
	AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_01");	//V�ude ticho.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_02");	//Ty najde� zr�dce - a pak se s n�m vypo��d�me ...
	};
};

