
instance DIA_ADDON_JUAN_EXIT(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 999;
	condition = dia_addon_juan_exit_condition;
	information = dia_addon_juan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_juan_exit_condition()
{
	return TRUE;
};

func void dia_addon_juan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_JUAN_PICKPOCKET(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 900;
	condition = dia_addon_juan_pickpocket_condition;
	information = dia_addon_juan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_juan_pickpocket_condition()
{
	return c_beklauen(65,73);
};

func void dia_addon_juan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_BACK,dia_addon_juan_pickpocket_back);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_PICKPOCKET,dia_addon_juan_pickpocket_doit);
};

func void dia_addon_juan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_juan_pickpocket);
};

func void dia_addon_juan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
};


instance DIA_ADDON_JUAN_HI(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_hi_condition;
	information = dia_addon_juan_hi_info;
	permanent = FALSE;
	description = "Nìjaký blafy?";
};


func int dia_addon_juan_hi_condition()
{
	return TRUE;
};

func void dia_addon_juan_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Nìjaký blafy?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Co otravuješ? Chceš mi nìco øíct? Jestli ne, tak si dej odchod.
	if(!Npc_IsDead(freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Moji kamádi by si tì mohli hodit do parády, tak co ode mì chceš.
		b_startotherroutine(freund,"STAND");
	};
};


instance DIA_ADDON_JUAN_LOSUNG(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_losung_condition;
	information = dia_addon_juan_losung_info;
	permanent = FALSE;
	description = "Slyšel jsem, že máš zajímavý zboží.";
};


func int dia_addon_juan_losung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_hi) && ((TOM_TELLS == TRUE) || (MIS_HUNO_STAHL == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void dia_addon_juan_losung_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Slyšel jsem, že máš zajímavý zboží.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//Co? Esteban na mì nìco zkouší? Mám plno práce a kùži sedøenou, jsem poøád v dole a makám, slyšíš MAKÁM.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//...a on nìkoho pošle pro materiál? Já nejsem skladištì!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No? Tak to není mùj problém.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//UDÌLÁM z toho TVÙJ problém. Chceš tedy zásilku - ok, mùžeš si ji koupit.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Vem si zlato od Estbana nebo Ravena nebo jinýho, je mi to jedno, ale kdo nìco chce, ten si za to zaplatí.
};


instance DIA_ADDON_JUAN_AUFSMAUL(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_aufsmaul_condition;
	information = dia_addon_juan_aufsmaul_info;
	permanent = FALSE;
	description = "Nejsem estebanùv poskok!";
};


func int dia_addon_juan_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nejsem estebanùv poskok!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Oh? Dobrá ...  eh ... poèkej! Postùj tu na chvíli...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_JUAN_TRADE(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 99;
	condition = dia_addon_juan_trade_condition;
	information = dia_addon_juan_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_juan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_trade_info()
{
	b_say(other,self,"$TRADE_3");
};

