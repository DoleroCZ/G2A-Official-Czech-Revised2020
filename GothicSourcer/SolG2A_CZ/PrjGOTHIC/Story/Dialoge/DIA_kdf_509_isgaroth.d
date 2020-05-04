
instance DIA_ISGAROTH_EXIT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 999;
	condition = dia_isgaroth_exit_condition;
	information = dia_isgaroth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_isgaroth_exit_condition()
{
	return TRUE;
};

func void dia_isgaroth_exit_info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//Nechù nad tebou Innos bdÌ.
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_HELLO(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_hello_condition;
	information = dia_isgaroth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_isgaroth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_isgaroth_hello_info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Innos tÏ doprov·zej. Co pro tebe mohu udÏlat, poutnÌËe?
};


instance DIA_ISGAROTH_SEGEN(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 10;
	condition = dia_isgaroth_segen_condition;
	information = dia_isgaroth_segen_info;
	permanent = TRUE;
	description = "Poûehnej mi!";
};


func int dia_isgaroth_segen_condition()
{
	return TRUE;
};

func void dia_isgaroth_segen_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Poûehnej mi!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//éehn·m ti jmÈnem Innosov˝m. Nechù ve tvÈm srdci plane oheÚ naöeho P·na a nechù ti d· sÌlu ¯Ìdit se jeho spravedlivostÌ.
	ISGAROTH_SEGEN = TRUE;
};


instance DIA_ISGAROTH_WOLF(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_wolf_condition;
	information = dia_isgaroth_wolf_info;
	permanent = FALSE;
	description = "PosÌl· mÏ Sergio...";
};


func int dia_isgaroth_wolf_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (SERGIO_SENDS == TRUE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_isgaroth_wolf_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//PosÌl· mÏ Sergio. P¯evzal jsem jeho ˙kol. Tak, o co jde?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//PoslednÌ dobou se po okolÌ toul· Ëern˝ vlk. Vystopuj jej a zabij ho.
	MIS_ISGAROTHWOLF = LOG_RUNNING;
	b_logentry(TOPIC_ISGAROTHWOLF,"Kolem svatynÏ se potuluje temn˝ vlk. MÏl bych ho najÌt a zabÌt.");
};


instance DIA_ISGAROTH_TOT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_tot_condition;
	information = dia_isgaroth_tot_info;
	permanent = TRUE;
	description = "Zabil jsem toho vlka.";
};


func int dia_isgaroth_tot_condition()
{
	WOLFI = Hlp_GetNpc(blackwolf);
	if((MIS_ISGAROTHWOLF == LOG_RUNNING) && Npc_IsDead(wolfi))
	{
		return TRUE;
	};
};

func void dia_isgaroth_tot_info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//Zabil jsem toho vlka.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Dobr· pr·ce, novici. Jsi stateËn˝ muû. TeÔ se vraù do kl·ötera a vÏnuj se sv˝m povinnostem.
	MIS_ISGAROTHWOLF = LOG_SUCCESS;
	b_giveplayerxp(XP_ISGAROTHWOLF);
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_JOB(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 4;
	condition = dia_isgaroth_job_condition;
	information = dia_isgaroth_job_info;
	permanent = FALSE;
	description = "Co tady dÏl·ö?";
};


func int dia_isgaroth_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_isgaroth_job_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//Co tady dÏl·ö?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//Jsem ohniv˝ m·g. KnÏz naöeho boha Innose.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//Toto mÌsto je zasvÏcenÈ JEMU, nejvyööÌmu bohu, stvo¯iteli ohnÏ a p·novi spravedlnosti.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//LidÈ sem p¯ich·zejÌ, aby se modlili k Innosovi a obdrûeli poûehn·nÌ.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//Za nÏjak˝ ten drobn˝ ode mÏ takÈ m˘ûeö dostat mnohÈ uûiteËnÈ vÏci.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Ve svatyni p¯ed kl·öterem sÌdlÌ mistr Isgaroth, kter˝ prod·v· uûiteËnÈ magickÈ p¯edmÏty.");
};


instance DIA_ISGAROTH_TRADE(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 99;
	condition = dia_isgaroth_trade_condition;
	information = dia_isgaroth_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaû mi svÈ zboûÌ.";
};


func int dia_isgaroth_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_isgaroth_job))
	{
		return TRUE;
	};
};

func void dia_isgaroth_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Ukaû mi svÈ zboûÌ.
};


instance DIA_ISGAROTH_KLOSTER(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_kloster_condition;
	information = dia_isgaroth_kloster_info;
	permanent = FALSE;
	description = "Kam mÏ tahle cesta dovede?";
};


func int dia_isgaroth_kloster_condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_isgaroth_kloster_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Kam mÏ tahle cesta dovede?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//Tahle cesta vede do kl·ötera ohniv˝ch m·g˘. Vstup do nÏj je ovöem povolen jen sluûebnÌk˘m Innose.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//A jestli chceö b˝t do kl·ötera p¯ijat jako novic, musÌö s sebou p¯ivÈst ovci a...
		b_say_gold(self,other,SUMME_KLOSTER);
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Chci-li se st·t novicem v InnosovÏ svatyni, pot¯ebuji ovci a 1000 zlaù·k˘.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Protoûe ses ovöem jiû rozhodl spojit se s jinou skupinou, bude ti vstup odep¯en.
	};
};


instance DIA_ISGAROTH_VATRAS(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_vatras_condition;
	information = dia_isgaroth_vatras_info;
	permanent = TRUE;
	description = "Nesu zpr·vu od Vatrase.";
};


func int dia_isgaroth_vatras_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && ((Npc_HasItems(other,itwr_vatrasmessage) == 1) || (Npc_HasItems(other,itwr_vatrasmessage_open) == 1)))
	{
		return TRUE;
	};
};

func void dia_isgaroth_vatras_info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//Nesu zpr·vu od Vatrase.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//Co je to za zpr·vu?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//Je to dopis. Tady.
	if(Npc_HasItems(other,itwr_vatrasmessage) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Dobr·, m˘ûeö Vatrasovi vy¯Ìdit, ûe jsem tu zpr·vu obdrûel.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Vezmi si tyhle lektvary jako odmÏnu za svÈ sluûby, urËitÏ se ti budou hodit.
		CreateInvItems(self,itpo_health_02,2);
		b_giveinvitems(self,other,itpo_health_02,2);
		b_giveplayerxp(XP_AMBIENT * 2);
	}
	else if(Npc_HasItems(other,itwr_vatrasmessage_open) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage_open,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage_open,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//PeËeù je rozlomen·. Na cos myslel, ty bl·zne!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//BÏû a vy¯iÔ Vatrasovi, ûe jsem jeho zpr·vu obdrûel.
		AI_StopProcessInfos(self);
	};
	VATRAS_RETURN = TRUE;
};


instance DIA_ISGAROTH_PICKPOCKET(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 900;
	condition = dia_isgaroth_pickpocket_condition;
	information = dia_isgaroth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_isgaroth_pickpocket_condition()
{
	return c_beklauen(48,50);
};

func void dia_isgaroth_pickpocket_info()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_BACK,dia_isgaroth_pickpocket_back);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_PICKPOCKET,dia_isgaroth_pickpocket_doit);
};

func void dia_isgaroth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

func void dia_isgaroth_pickpocket_back()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

