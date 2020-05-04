
instance DIA_ADDON_TONAK_NW_EXIT(C_INFO)
{
	npc = strf_1125_addon_tonak_nw;
	nr = 999;
	condition = dia_addon_tonak_nw_exit_condition;
	information = dia_addon_tonak_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tonak_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_tonak_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TONAK_NW_HI(C_INFO)
{
	npc = strf_1125_addon_tonak_nw;
	nr = 2;
	condition = dia_addon_tonak_nw_hi_condition;
	information = dia_addon_tonak_nw_hi_info;
	permanent = TRUE;
	description = "Vracíš se zpátky na pole, že?";
};


func int dia_addon_tonak_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_tonak_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Tonak_NW_Hi_15_00");	//Vracíš se zpátky na pole, že?
	AI_Output(self,other,"DIA_Addon_Tonak_NW_Hi_03_01");	//Hej, mùj zachránèe! Ano, teï jsem zpátky, abych si upracoval prsty až na kost.
	if(!Npc_IsDead(egill) && !Npc_IsDead(ehnim))
	{
		AI_Output(self,other,"DIA_Addon_Tonak_NW_Hi_03_02");	//Hlavnì s tìmihle bratry. Chlape, bylo to opravdu tak špatné u TÌCH banditù ...
	};
};


instance DIA_ADDON_TONAK_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1125_addon_tonak_nw;
	nr = 900;
	condition = dia_addon_tonak_nw_pickpocket_condition;
	information = dia_addon_tonak_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_tonak_nw_pickpocket_condition()
{
	return c_beklauen(80,160);
};

func void dia_addon_tonak_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_tonak_nw_pickpocket);
	Info_AddChoice(dia_addon_tonak_nw_pickpocket,DIALOG_BACK,dia_addon_tonak_nw_pickpocket_back);
	Info_AddChoice(dia_addon_tonak_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_tonak_nw_pickpocket_doit);
};

func void dia_addon_tonak_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_tonak_nw_pickpocket);
};

func void dia_addon_tonak_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_tonak_nw_pickpocket);
};

