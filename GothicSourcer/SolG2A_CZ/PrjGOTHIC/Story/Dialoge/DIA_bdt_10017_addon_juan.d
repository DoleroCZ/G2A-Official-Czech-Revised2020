
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
	description = "N�jak� blafy?";
};


func int dia_addon_juan_hi_condition()
{
	return TRUE;
};

func void dia_addon_juan_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//N�jak� blafy?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Co otravuje�? Chce� mi n�co ��ct? Jestli ne, tak si dej odchod.
	if(!Npc_IsDead(freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Moji kam�di by si t� mohli hodit do par�dy, tak co ode m� chce�.
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
	description = "Sly�el jsem, �e m� zaj�mav� zbo��.";
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
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Sly�el jsem, �e m� zaj�mav� zbo��.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//Co? Esteban na m� n�co zkou��? M�m plno pr�ce a k��i sed�enou, jsem po��d v dole a mak�m, sly�� MAK�M.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//...a on n�koho po�le pro materi�l? J� nejsem skladi�t�!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No? Tak to nen� m�j probl�m.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//UD�L�M z toho TV�J probl�m. Chce� tedy z�silku - ok, m��e� si ji koupit.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Vem si zlato od Estbana nebo Ravena nebo jin�ho, je mi to jedno, ale kdo n�co chce, ten si za to zaplat�.
};


instance DIA_ADDON_JUAN_AUFSMAUL(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_aufsmaul_condition;
	information = dia_addon_juan_aufsmaul_info;
	permanent = FALSE;
	description = "Nejsem esteban�v poskok!";
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
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nejsem esteban�v poskok!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Oh? Dobr� ...  eh ... po�kej! Post�j tu na chv�li...
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

