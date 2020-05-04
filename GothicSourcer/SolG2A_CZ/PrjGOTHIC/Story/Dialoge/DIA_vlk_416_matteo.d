
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Co pro tebe mohu udÏlat?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "Co prod·v·ö?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Co prod·v·ö?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Mohu ti nabÌdnout vöechno, co pot¯ebujeö pro p¯eûitÌ v divoËinÏ. ZbranÏ, pochodnÏ, z·soby - dokonce i zbroj.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//TakÈ tu m·m i nÏjakÈ zvl·ötnÌ zboûÌ.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Dvojn·sob tvrzenou zbroj z chÚapavËÌ k˘ûe - nepouûitou. Nem·ö z·jem?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matte˘v obchod leûÌ u jiûnÌ mÏstskÈ br·ny. Prod·v· vybavenÌ, zbranÏ i potraviny.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "Ukaû mi svÈ zboûÌ.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Ukaû mi svÈ zboûÌ.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Od tÈ doby, co ûold·ci oddÏlali paladina Lothara, to tu ti jeho kamar·dÌËkovÈ proöùour·vajÌ mnohem p¯ÌsnÏji.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Douf·m, ûe aû vraha povÏsÌ, tak se to zlepöÌ.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Vypad· to, ûe paladinovÈ to tentokr·t myslÌ v·ûnÏ - dokonce odvolali i str·ûe z lodÌ.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//JeötÏ ûe n·m zase obnovujeö z·soby. Kdo vÌ, jestli p¯ÌötÌ t˝den bude naöe mÏsto jeötÏ st·t.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Koupit koûenou zbroj. Ochrana: zbranÏ 25, öÌpy 20. (250 zlaù·k˘)";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Dob¯e, tak mi tu zbroj dej.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Bude se ti moc lÌbit. (uöklÌbne se)
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Zbroj m· svou cenu - a opravdu za to stojÌ. Takûe se vraù, aû d·ö dohromady dost zlata.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "Co vÌö o paladinech?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Co vÌö o paladinech?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Od chvÌle, kdy ti bastardi dorazili do mÏsta, nezn·m nic jinÈho neû samÈ trampoty.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//PoslednÏ jsem mÌ¯il do hornÌ Ë·sti mÏsta, ale str·ûe mi zastoupily cestu a chtÏly vÏdÏt, co tam pohled·v·m!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//A?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Samoz¯ejmÏ mÏ pak pustili dovnit¯!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//M˘j obchod ve mÏstÏ st·l jeötÏ d¯Ìv, neû ti nabub¯elÌ hejhulovÈ d¯evÏn˝m meËem zapichovali podsvinËata!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//A vËera sem ti bastardi jen tak mÌrnyx-t˝rnyx p¯iöli a zabavili mi p˘lku zboûÌ!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "PaladinovÈ ti zabavili zboûÌ?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//PaladinovÈ ti zabavili zboûÌ?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Vöecko, co jsem mÏl uskladnÏnÈ vzadu na dvorku.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//ProstÏ ke vchodu na dv˘r postavily str·û.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//M·m kliku, ûe mi nesebrali ˙plnÏ vöecko - aspoÚ tu zbroj tu mohli nechat.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "M˘ûeö mi pomoci proniknout do hornÌ Ëtvrti?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//M˘ûeö mi pomoci proniknout do hornÌ Ëtvrti?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(udivenÏ) Coûe? A co TAM chceö dÏlat?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//Nesu nÏjakou d˘leûitou zpr·vu.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//No, vÌö... Uû ses zkouöel dostat p¯es str·ûe?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(ho¯k˝ ˙smÏv) ZapomeÚ na to, chlape!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(usmÏje se) To je pro ty manÌky TYPICK…!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Nech·pu, proË bych to mÏl v˘bec zkouöet.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//NejspÌö m·ö pravdu.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//NevÌm, JAK d˘leûit· ta tvoje zpr·va je, a vlastnÏ mi do toho ani nic nenÌ.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Ale i kdyû jim ¯ekneö, ûe v p¯Ìstavu pr·vÏ zakotvila loÔ pln· sk¯et˘, stejnÏ tÏ poölou pryË.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Protoûe majÌ svÈ ROZKAZY.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Zd· se, ûe ti na tom opravdu z·leûÌ.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(potutelnÏ) Ot·zka znÌ, JAK MOC ti na tom z·leûÌ.
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//O co ti jde?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Mohu ti pomoci - koneckonc˘ tu pat¯Ìm k nejvlivnÏjöÌm lidem.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Ale nebude to zadarmo.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "Takûe mi m˘ûeö pomoci proniknout do hornÌ Ëtvrti?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Takûe mi m˘ûeö pomoci proniknout do hornÌ Ëtvrti?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Pomoz mi vstoupit do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘!";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Co za svou pomoc chceö?
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "Co za svou pomoc chceö?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Co za svou pomoc chceö?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 zlat˝ch.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"To je zatracenÏ hodnÏ...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"Ty chamtivËe!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//KlÌdek - nemyslÌm zrovna TVOJE zlato!
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//Ale?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//V z·sadÏ jde o MOJE zlato.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Tesa¯ova nete¯ Gritta mi totiû uû celÈ vÏky nezaplatila, co mi dluûÌ.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//A p¯itom se tu ten mal˝ spratek producÌruje kaûdou chvÌli v nov˝ch hadrech - to znamen·, ûe penÏz m· dost.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//R·d bych to z nÌ vyml·til, ale mistr Thorben - tesa¯ - tu m· taky dost velk˝ vliv.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Kdyû mi d·ö ty penÌze, pom˘ûu ti.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Gritta, nete¯ tesa¯e Thorbena, dluûÌ Matteovi 100 zlaù·k˘. Kdyû mu je vr·tÌm, pom˘ûe mi v cestÏ do hornÌ Ëtvrti.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ty chamtivËe!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//To je zatracenÏ hodnÏ...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Kde bych tu Grittu naöel?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Kde bych tu Grittu naöel?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Jak jsem ¯ekl, je to tesa¯ova nete¯. Jeho d˘m najdeö dole v ulici, poslednÌ stavenÌ napravo p¯ed kov·rnou.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Tady m·ö tÏch 100 zlaù·k˘!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Tady m·ö tÏch 100 zlaù·k˘!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//Na tom zlatÏ je Grittina krev! J· ti p¯ece ani v nejmenöÌm nenak·zal, abys ji zabil!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//S tÌm nechci nic mÌt - a na naöi ˙mluvu rovnou zapomeÚ! A uû na mÏ vÌckr·t nemluv!
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//Tak co? DÏlala nÏjakÈ problÈmy?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Nic, co by st·lo za zmÌnku.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Dob¯e. Svou Ë·st ˙mluvy jsi tedy dodrûel.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ty to za ni chceö zaplatit? Hmm, dal bych spÌö p¯ednost tomu, kdybys to vym·Ëkl p¯Ìmo z nÌ!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Ale - 100 zlaù·k˘ je po¯·d 100 zlaù·k˘.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Svou Ë·st ˙mluvy jsi tÌm dodrûel.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//PoËÌt·nÌ nenÌ zrovna tvoje siln· str·nka, co? Vûdyù ty tÏch 100 zlaù·k˘ nem·ö.
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Pomoz mi vstoupit do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Pomoz mi vstoupit do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//é·dnÈ strachy - j· svou Ë·st dohody dodrûÌm.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//OstatnÌm mistr˘m budu o tobÏ vykl·dat jenom to nejlepöÌ.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Matteo bude souhlasit, budu-li chtÌt vstoupit do uËenÌ u nÏkoho jinÈho.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Jedno po druhÈm. Nejd¯Ìv splÚ svou Ë·st dohody a p¯ines mi zlato!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "Co KONKR…TNÃ pro mne m˘ûeö udÏlat?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Co KONKR…TNÃ pro mne m˘ûeö udÏlat?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//To je jednoduchÈ. Vyuûiju sv˘j vliv a p¯esvÏdËÌm jednoho z mÌstnÌch ¯emeslnÌk˘, aby tÏ p¯ijal jako uËednÌka.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Tak se prakticky staneö mÏöùanem a budeö moci vstoupit i do hornÌ Ëtvrti. A krom toho si i trochu p¯ivydÏl·ö.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Matteo mi m˘ûe pomoci, aby mÏ nÏkter˝ z ¯emeslnick˝ch mistr˘ p¯ijal do uËenÌ.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "Kde bych tedy mohl vstoupit do uËenÌ?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Kde bych tedy mohl vstoupit do uËenÌ?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//VlastnÏ ke komukoliv z mistr˘ tady na hlavnÌ ulici.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//M˘ûe to b˝t kov·¯ Harad, v˝robce luk˘ Bosper, tesa¯ Thorben nebo alchymista Constantino.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Jeden z nich tÏ musÌ p¯ijmout.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Ale d˘leûitÈ je, aby s tÌm souhlasili i ostatnÌ mist¯i. Tak je to tady v Khorinisu zvykem.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Mohu vstoupit do uËenÌ k v˝robci luk˘ Bosperovi, kov·¯i Haradovi, tesa¯i Thorbenovi, nebo k alchymistovi Constantinovi.");
	b_logentry(TOPIC_LEHRLING,"JeötÏ neû k nÏkomu vstoupÌm do uËenÌ, musÌm zÌskat svolenÌ ostatnÌch mistr˘.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "Jak zÌsk·m souhlas ostatnÌch mistr˘?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Jak zÌsk·m souhlas ostatnÌch mistr˘?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//ProstÏ je musÌö nÏjak p¯esvÏdËit. Zastav se u nich a promluv si s nimi.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Ale jestli si proti sobÏ popudÌö vÌc jak jednoho, nebudeö mÌt öanci! Tak se koukej chovat sluönÏ!
	b_logentry(TOPIC_LEHRLING,"OstatnÌ mist¯i mi dajÌ svÈ doporuËenÌ pouze za p¯edpokladu, ûe jim dok·ûu svou cenu.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "A proË mÏ do uËenÌ nep¯ijmeö TY?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//A proË mÏ do uËenÌ nep¯ijmeö TY?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//R·d bych - ale museli by s tÌm souhlasit i ostatnÌ mist¯i.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Ned·vno jsem p¯ijal jinÈho uËednÌka.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "Existuje i jin˝ zp˘sob, jak se dostat do hornÌ Ëtvrti?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Existuje i jin˝ zp˘sob, jak se dostat do hornÌ Ëtvrti?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Snad ano - jestli na nÏco p¯ijdu, d·m ti vÏdÏt.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "Mezi tv˝m zboûÌm vidÌm i nÏjakÈ d˘lnÌ akcie. Kdo ti je prodal?";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Mezi tv˝m zboûÌm vidÌm i nÏjakÈ d˘lnÌ akcie. Kdo ti je prodal?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(nervÛznÏ) D˘lnÌ akcie? Jejda, kde se tu vzaly? Nem·m ponÏtÌ, jak jsem k nim p¯iöel. »estnÈ slovo, na mou duöi.
	b_giveplayerxp(XP_AMBIENT);
};

