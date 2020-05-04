
instance DIA_ADDON_PATRICK_NW_EXIT(C_INFO)
{
	npc = strf_1123_addon_patrick_nw;
	nr = 999;
	condition = dia_addon_patrick_nw_exit_condition;
	information = dia_addon_patrick_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_patrick_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_patrick_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PATRICK_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1123_addon_patrick_nw;
	nr = 900;
	condition = dia_addon_patrick_nw_pickpocket_condition;
	information = dia_addon_patrick_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_patrick_nw_pickpocket_condition()
{
	return c_beklauen(35,50);
};

func void dia_addon_patrick_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_patrick_nw_pickpocket);
	Info_AddChoice(dia_addon_patrick_nw_pickpocket,DIALOG_BACK,dia_addon_patrick_nw_pickpocket_back);
	Info_AddChoice(dia_addon_patrick_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_patrick_nw_pickpocket_doit);
};

func void dia_addon_patrick_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_patrick_nw_pickpocket);
};

func void dia_addon_patrick_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_patrick_nw_pickpocket);
};


instance DIA_ADDON_PATRICK_NW_HI(C_INFO)
{
	npc = strf_1123_addon_patrick_nw;
	nr = 2;
	condition = dia_addon_patrick_nw_hi_condition;
	information = dia_addon_patrick_nw_hi_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_patrick_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_01");	//Skvìle. Mágové Vody nám pomohli dostat se bezpeènì z tohoto prokletého údolí.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_02");	//A co máš teï v plánu?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_03");	//Opìt se pøidám k Leemu a jednoho dne opustíme tento ostrov ...
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_04");	//A pak?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_05");	//Uvidíme. Jestli bude stále zuøit válka, budu bojovat se skøety. Ale to bude až potom.
};

