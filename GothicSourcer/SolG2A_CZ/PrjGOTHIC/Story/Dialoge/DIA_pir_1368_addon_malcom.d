
instance DIA_ADDON_MALCOM_EXIT(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 999;
	condition = dia_addon_malcom_exit_condition;
	information = dia_addon_malcom_exit_info;
	permanent = TRUE;
	description = "Musím jít.";
};


func int dia_addon_malcom_exit_condition()
{
	return TRUE;
};

func void dia_addon_malcom_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Musím jít.
	if(MALCOMBOTSCHAFT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Nenech se nìèím sežrat. Je velmi nebezpeèné, se kolem jen tak potulovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hej, jestli pùjdeš do tábora, vyøiï Henrymu ode mì nìco.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Stromy tady kolem jsou velmi nezdolné.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Nemìl by oèekávat døevo v blízké dobì. Øekni mu to.
		MALCOMBOTSCHAFT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MALCOM_PICKPOCKET(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 900;
	condition = dia_addon_malcom_pickpocket_condition;
	information = dia_addon_malcom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_malcom_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_malcom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_BACK,dia_addon_malcom_pickpocket_back);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_PICKPOCKET,dia_addon_malcom_pickpocket_doit);
};

func void dia_addon_malcom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};

func void dia_addon_malcom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};


instance DIA_ADDON_MALCOM_HELLO(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 1;
	condition = dia_addon_malcom_hello_condition;
	information = dia_addon_malcom_hello_info;
	important = TRUE;
};


func int dia_addon_malcom_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Ty nejsi odtud, že ne?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Zdá se, že jsi cestoval pomìrnì dlouho, aby ses sem dostal.
};


instance DIA_ADDON_MALCOM_WASMACHEN(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 2;
	condition = dia_addon_malcom_wasmachen_condition;
	information = dia_addon_malcom_wasmachen_info;
	description = "Zaneprázdnìn?";
};


func int dia_addon_malcom_wasmachen_condition()
{
	return TRUE;
};

func void dia_addon_malcom_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Zaneprázdnìn?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//Neruš mì. Henry chce, abych zde pokácel co nejvíc stromù.
	if(henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Vede naši skupinu.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Stojí pøed vstupem do tábora a mírnì kontroluje pøíchozí.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Stará se o bezpeènost nášeho tábora.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Pochopitelnì ale nemùže ovlivnit každého.
};


instance DIA_ADDON_MALCOM_ENTERTRUPP(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 5;
	condition = dia_addon_malcom_entertrupp_condition;
	information = dia_addon_malcom_entertrupp_info;
	description = "Henry je tvùj vùdce?";
};


func int dia_addon_malcom_entertrupp_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_entertrupp_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry je tvùj vùdce?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Ano, vùdce naší skupiny.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//Náš KAPITÁN je ale Greg.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Ale nyní je zrovna pryè.
	};
};


instance DIA_ADDON_MALCOM_LAGER(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 3;
	condition = dia_addon_malcom_lager_condition;
	information = dia_addon_malcom_lager_info;
	description = "Kde je tvùj tábor?";
};


func int dia_addon_malcom_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Kde je tvùj tábor?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Jen bìž touto cestou na západ.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Tam uvidíš Henryho, jak postává kolem.
};

