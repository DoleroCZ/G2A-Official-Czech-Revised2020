
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
	description = "Prod�v� tak� kov��sk� n��in�?";
};


func int dia_addon_paul_hi_condition()
{
	return TRUE;
};

func void dia_addon_paul_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Prod�v� tak� kov��sk� n��in�?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno m��e nab�dnout n�jakou ocel na kov�n�. J� m�m pouze p�r kousk� rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale ta nen� na prodej, je to jedin� cenn� v�c, kterou vlastn�m.
};


instance DIA_ADDON_PAUL_HUNO(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_huno_condition;
	information = dia_addon_paul_huno_info;
	permanent = FALSE;
	description = "Pracuje� pro Huna?";
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
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracuje� pro Huna?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chci si vyd�lat trochu pen�z a za��t pracovat pro Huna. Ale nedostal jsem nic od Estebana od t� doby.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//�ekl mi, �e tam nen� pr�ce pro mne.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Tak pracovat pro Huna je jedin� mo�nost volby.
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
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nic! J� s t�m nem�m nic spole�n�ho. Co ode m� chce�?
};


instance DIA_ADDON_PAUL_HUNOVERDACHT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 4;
	condition = dia_addon_paul_hunoverdacht_condition;
	information = dia_addon_paul_hunoverdacht_info;
	permanent = FALSE;
	description = "Huno je podez��v�n ze zapleten� se do �kladn� vra�dy...";
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
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno je podez��v�n ze zapleten� se do �kladn� vra�dy...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Nic o tom nev�m.
};


instance DIA_ADDON_PAUL_HUNOARBEIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_hunoarbeit_condition;
	information = dia_addon_paul_hunoarbeit_info;
	permanent = FALSE;
	description = "Pracuje� pro n�j. Mus� n�co v�d�t!!!";
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
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracuje� pro n�j. Mus� n�co v�d�t!!!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(zoufale) Nic nev�m - opravdu! Mus�m pokra�ovat v pr�ci.
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
	description = "V�, co ti ud�l� Esteban, kdy� se dov�, �e kryje� Huna?";
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
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//V�, co ti ud�l� Esteban, kdy� se dov�, �e kryje� Huna?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Pros�m, nech m�. J� do toho nejsem zapleten!
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
	description = "Dob�e, tak mi �ekni v�e, co v�.";
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
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(p��telsky) Dob�e, te� mi �ekne� v�e, co v�, nebo t� budu muset zml�tit!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Hej, nem��e� se mnou jednat jen tak jen proto, �e pracuje� pro ��fa!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(p��telsky) Ale m��u!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Necho� bl�!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(netrp�liv�) Paul ...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(vzru�en�) V�e, co v�m je, �e Huno nem� r�d Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(vzru�en�) Za��n� mi j�t na nervy, jak Esteban st�le ni�� Hun�v obchod...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//J� se opravdu nikdy nem�ch�m do t�chto v�c�.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Tak bych �ekl, �e to nebylo ani tak t�k�.
	Npc_ExchangeRoutine(self,"START");
	PAUL_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Paul ��k�, �e Huno nesn�� Estebana za to, �e ruinuje jeho pr�ci.");
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
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Kone�n�! Zde je tv� ruda.
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
	description = "V�e v po��dku?";
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
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//V�e v po��dku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Ano, chyst�m se dostat zlato z t� sk�ly!
	}
	else if((PAUL_TELLALL == TRUE) && (HUNO_ZUSNAF == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//U� jsem ti �ekl v�e, co jsem v�d�l!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Hej j� zde chci pouze pracovat!
	};
};

