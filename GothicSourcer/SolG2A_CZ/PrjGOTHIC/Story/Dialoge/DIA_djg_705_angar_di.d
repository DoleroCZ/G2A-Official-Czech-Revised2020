
instance DIA_ANGAR_DI_EXIT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 999;
	condition = dia_angar_di_exit_condition;
	information = dia_angar_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_di_exit_condition()
{
	return TRUE;
};

func void dia_angar_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_HALLO(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 10;
	condition = dia_angar_di_hallo_condition;
	information = dia_angar_di_hallo_info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int dia_angar_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_angar_di_hallo_info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//Jak se máš?
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//Od tý doby, co jsme na ostrovì, je ta bolest èím dál tím nesnesitelnìjší.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//Èert aby to spral. Už by to snad mohlo skonèit.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//Nedìlej si se mnou starosti. Prostì odsud vypadni.
	};
};


instance DIA_ANGAR_DI_ORKS(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_orks_condition;
	information = dia_angar_di_orks_info;
	important = TRUE;
};


func int dia_angar_di_orks_condition()
{
	if((ORKSTURMDI == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_orks_info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//Mìli bysme sebou zatracenì mrsknout. Další skøetí útok nás bude stát život.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//Dìlám, co mùžu.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//To nestaèí.
	Info_ClearChoices(dia_angar_di_orks);
	Info_AddChoice(dia_angar_di_orks,"Klídek",dia_angar_di_orks_no);
	Info_AddChoice(dia_angar_di_orks,"Tak mi pomoz.",dia_angar_di_orks_follow);
};

func void dia_angar_di_orks_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//Tak mi pomoz a pøestaò skuèet.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//Jo. Jdi první. Hni se.
	AI_StopProcessInfos(self);
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FollowDI");
	ANGAR_DI_PARTY = LOG_RUNNING;
};

func void dia_angar_di_orks_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//Klídek.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//To se ti snadno øekne. Nejspíš se tady z toho zblázním.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_FOLLOW(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_follow_condition;
	information = dia_angar_di_follow_info;
	permanent = TRUE;
	description = "Zùstaò vzadu.";
};


func int dia_angar_di_follow_condition()
{
	if(ANGAR_DI_PARTY == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_angar_di_follow_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//Zùstaò vzadu.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//O zbytek se postarám sám.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//Hodnì štìstí.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		ANGAR_DI_PARTY = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//Jasná vìc.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		else if(Npc_IsDead(firedragonisland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		else if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(troll_di))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	ANGAR_DI_PARTY = LOG_OBSOLETE;
};


instance DIA_ANGAR_DI_FOLLOWAGAIN(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followagain_condition;
	information = dia_angar_di_followagain_info;
	permanent = TRUE;
	description = "Pojï za mnou.";
};


func int dia_angar_di_followagain_condition()
{
	if(ANGAR_DI_PARTY == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_angar_di_followagain_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//Pojï za mnou.
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//Jdi první.
	ANGAR_DI_PARTY = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_ANGAR_DI_FOLLOWSTOP(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followstop_condition;
	information = dia_angar_di_followstop_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_angar_di_followstop_condition()
{
	if((ANGAR_DI_PARTY == LOG_RUNNING) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(firedragonisland) == FALSE)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void dia_angar_di_followstop_info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//Aarh! Ta bolest mì pøivádí k šílenství!
};


instance DIA_ANGAR_DI_UNDEADDRGDEAD(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 2;
	condition = dia_angar_di_undeaddrgdead_condition;
	information = dia_angar_di_undeaddrgdead_info;
	description = "Dostal ses z toho.";
};


func int dia_angar_di_undeaddrgdead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_angar_di_undeaddrgdead_info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//Dostal ses z toho.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//Mùžeme už odsud koneènì vypadnout?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//Jo. Nepøítel byl poražen.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//Tak to nesmíme dál ztrácet èas. Zajdi kapitánovi øíct, aby zvednul kotvy.
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//Doufám, že vás, odpadlých èlenù sekty, není víc.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//Všechno je možné. I když Pátraèi byli velmi dùkladní. Dokonce málem dostali i mì. Kdo ví?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//Co budeš dìlat dál?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//Možná se usadím na venkovì a zaènu farmaøit. Válèení už mì dost unavuje.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_DI_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 900;
	condition = dia_angar_di_pickpocket_condition;
	information = dia_angar_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_di_pickpocket_condition()
{
	return c_beklauen(47,45);
};

func void dia_angar_di_pickpocket_info()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_BACK,dia_angar_di_pickpocket_back);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_PICKPOCKET,dia_angar_di_pickpocket_doit);
};

func void dia_angar_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_di_pickpocket);
};

func void dia_angar_di_pickpocket_back()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
};


instance DIA_ANGAR_DI_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 7;
	condition = dia_angar_di_foundamulett_condition;
	information = dia_angar_di_foundamulett_info;
	description = "Našel jsem tvùj amulet.";
};


func int dia_angar_di_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_foundamulett_info()
{
	b_angarsamulettabgeben();
};

