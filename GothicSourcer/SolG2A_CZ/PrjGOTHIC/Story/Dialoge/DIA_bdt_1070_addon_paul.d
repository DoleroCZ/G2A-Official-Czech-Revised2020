
instance DIA_ADDON_PAUL_EXIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 999;
	condition = dia_addon_paul_exit_condition;
	information = dia_addon_paul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_paul_exit_condition()
{
	return TRUE;
};

func void dia_addon_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_PICKPOCKET(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 900;
	condition = dia_addon_paul_pickpocket_condition;
	information = dia_addon_paul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_paul_pickpocket_condition()
{
	return c_beklauen(22,19);
};

func void dia_addon_paul_pickpocket_info()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_BACK,dia_addon_paul_pickpocket_back);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_PICKPOCKET,dia_addon_paul_pickpocket_doit);
};

func void dia_addon_paul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_paul_pickpocket);
};

func void dia_addon_paul_pickpocket_back()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
};


instance DIA_ADDON_PAUL_HI(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 1;
	condition = dia_addon_paul_hi_condition;
	information = dia_addon_paul_hi_info;
	permanent = FALSE;
	description = "Prodáváš také kováøské náèiní?";
};


func int dia_addon_paul_hi_condition()
{
	return TRUE;
};

func void dia_addon_paul_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Prodáváš také kováøské náèiní?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno mùže nabídnout nìjakou ocel na kování. Já mám pouze pár kouskù rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale ta není na prodej, je to jediná cenná vìc, kterou vlastním.
};


instance DIA_ADDON_PAUL_HUNO(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_huno_condition;
	information = dia_addon_paul_huno_info;
	permanent = FALSE;
	description = "Pracuješ pro Huna?";
};


func int dia_addon_paul_huno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hi))
	{
		return TRUE;
	};
};

func void dia_addon_paul_huno_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracuješ pro Huna?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chci si vydìlat trochu penìz a zaèít pracovat pro Huna. Ale nedostal jsem nic od Estebana od té doby.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//Øekl mi, že tam není práce pro mne.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Tak pracovat pro Huna je jediná možnost volby.
};


instance DIA_ADDON_PAUL_ATTENTAT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 3;
	condition = dia_addon_paul_attentat_condition;
	information = dia_addon_paul_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_paul_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_paul_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nic! Já s tím nemám nic spoleèného. Co ode mì chceš?
};


instance DIA_ADDON_PAUL_HUNOVERDACHT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 4;
	condition = dia_addon_paul_hunoverdacht_condition;
	information = dia_addon_paul_hunoverdacht_info;
	permanent = FALSE;
	description = "Huno je podezøíván ze zapletení se do úkladné vraždy...";
};


func int dia_addon_paul_hunoverdacht_condition()
{
	if(((FINN_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoverdacht_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno je podezøíván ze zapletení se do úkladné vraždy...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Nic o tom nevím.
};


instance DIA_ADDON_PAUL_HUNOARBEIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_hunoarbeit_condition;
	information = dia_addon_paul_hunoarbeit_info;
	permanent = FALSE;
	description = "Pracuješ pro nìj. Musíš nìco vìdìt!!!";
};


func int dia_addon_paul_hunoarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno) && Npc_KnowsInfo(other,dia_addon_paul_hunoverdacht) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoarbeit_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracuješ pro nìj. Musíš nìco vìdìt!!!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(zoufale) Nic nevím - opravdu! Musím pokraèovat v práci.
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_FEARESTEBAN(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_fearesteban_condition;
	information = dia_addon_paul_fearesteban_info;
	permanent = FALSE;
	description = "Víš, co ti udìlá Esteban, když se doví, že kryješ Huna?";
};


func int dia_addon_paul_fearesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hunoarbeit) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_fearesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Víš, co ti udìlá Esteban, když se doví, že kryješ Huna?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Prosím, nech mì. Já do toho nejsem zapleten!
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_MAULPAUL(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_maulpaul_condition;
	information = dia_addon_paul_maulpaul_info;
	permanent = FALSE;
	description = "Dobøe, tak mi øekni vše, co víš.";
};


func int dia_addon_paul_maulpaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_fearesteban) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_maulpaul_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(pøátelsky) Dobøe, teï mi øekneš vše, co víš, nebo tì budu muset zmlátit!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Hej, nemùžeš se mnou jednat jen tak jen proto, že pracuješ pro šéfa!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(pøátelsky) Ale mùžu!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Nechoï blíž!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(netrpìlivì) Paul ...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(vzrušenì) Vše, co vím je, že Huno nemá rád Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(vzrušenì) Zaèíná mi jít na nervy, jak Esteban stále nièí Hunùv obchod...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//Já se opravdu nikdy nemíchám do tìchto vìcí.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Tak bych øekl, že to nebylo ani tak tìžké.
	Npc_ExchangeRoutine(self,"START");
	PAUL_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Paul øíká, že Huno nesnáší Estebana za to, že ruinuje jeho práci.");
};


instance DIA_ADDON_BDT_1070_PAUL_MINE(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_mine_condition;
	information = dia_addon_paul_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_paul_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_paul_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Koneènì! Zde je tvá ruda.
	b_giveinvitems(self,other,itmi_nugget,2);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_PAUL_PERM(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 99;
	condition = dia_addon_paul_perm_condition;
	information = dia_addon_paul_perm_info;
	permanent = TRUE;
	description = "Vše v poøádku?";
};


func int dia_addon_paul_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno))
	{
		return TRUE;
	};
};

func void dia_addon_paul_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//Vše v poøádku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Ano, chystám se dostat zlato z té skály!
	}
	else if((PAUL_TELLALL == TRUE) && (HUNO_ZUSNAF == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//Už jsem ti øekl vše, co jsem vìdìl!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Hej já zde chci pouze pracovat!
	};
};

