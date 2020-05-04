
instance DIA_ADDON_CARLOS_EXIT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 999;
	condition = dia_addon_carlos_exit_condition;
	information = dia_addon_carlos_exit_info;
	permanent = TRUE;
	description = "Uvidíme se pozdìji.";
};


func int dia_addon_carlos_exit_condition()
{
	return TRUE;
};

func void dia_addon_carlos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CARLOS_PICKPOCKET(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 900;
	condition = dia_addon_carlos_pickpocket_condition;
	information = dia_addon_carlos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_carlos_pickpocket_condition()
{
	return c_beklauen(71,85);
};

func void dia_addon_carlos_pickpocket_info()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_BACK,dia_addon_carlos_pickpocket_back);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_PICKPOCKET,dia_addon_carlos_pickpocket_doit);
};

func void dia_addon_carlos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};

func void dia_addon_carlos_pickpocket_back()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};


instance DIA_ADDON_CARLOS_HI(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 1;
	condition = dia_addon_carlos_hi_condition;
	information = dia_addon_carlos_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_carlos_hi_condition()
{
	if(Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_carlos_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Carlos_HI_12_00");	//Hej, ty jsi ten, kdo zabil Franca?
	Info_ClearChoices(dia_addon_carlos_hi);
	Info_AddChoice(dia_addon_carlos_hi,"Co? Ja? Ne!",dia_addon_carlos_hi_no);
	Info_AddChoice(dia_addon_carlos_hi,"Ano, proè?",dia_addon_carlos_hi_yes);
};

func void dia_addon_carlos_hi_yes()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_Yes_15_00");	//Jo, proè?
	AI_Output(self,other,"DIA_Addon_Carlos_HI_Yes_12_01");	//(nazlobenì) Protože jsem ten, kdo mìl dìlat jeho práci. Opravdu, díky moc.
	Info_ClearChoices(dia_addon_carlos_hi);
};

func void dia_addon_carlos_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_No_15_00");	//Co? Já? Ne!
	AI_Output(self,other,"DIA_Addon_Carlos_HI_No_12_01");	//Ah, vidím. Nechtìl jsem tì rušit.
	Info_ClearChoices(dia_addon_carlos_hi);
};


instance DIA_ADDON_CARLOS_ATTENTAT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 2;
	condition = dia_addon_carlos_attentat_condition;
	information = dia_addon_carlos_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_carlos_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_carlos_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_00");	//Thorus mi øekl, abych dostal nìkoho nového do tábora po tom, co byl vrah zabit.
	if(LOGAN_INSIDE == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_01");	//A Franco poslal Logana.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_02");	//A Franco poslal nové chlapy.
	};
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_03");	//Hej, pouze dìlám, co Thorus chce. Nevím nic o tom atentátu. Skuteènì.
};


instance DIA_ADDON_CARLOS_PERM(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 3;
	condition = dia_addon_carlos_perm_condition;
	information = dia_addon_carlos_perm_info;
	permanent = TRUE;
	description = "Tak jaké to je být šéfem lovcù?";
};


func int dia_addon_carlos_perm_condition()
{
	return TRUE;
};

func void dia_addon_carlos_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Carlos_PERM_15_00");	//Tak jaké to je být šéfem lovcù?
	AI_Output(self,other,"DIA_Addon_Carlos_PERM_12_00");	//Nehrab se v tom!
	AI_StopProcessInfos(self);
};

