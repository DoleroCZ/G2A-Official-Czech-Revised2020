
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = "Musím jít!";
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Musím jít!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Jak je libo.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//To od tebe bylo opravdu hloupé, e jsi mì napadl.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(posmìšnì) To sis myslel, e mì pøemùeš tak snadno?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Buï mi to nìjak vynahradíš, nebo se budu dívat na to, jak hoøce lituješ svıch èinù!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//A co pøesnì myslíš?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"Nemìl jsem toho tolik!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"Tady je zlato - zapomeneme na tu vìc!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Tady je zlato - zapomeneme na tu vìc!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//To je od tebe hodnì rozumné!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//Nemìl jsem toho tolik!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Tak proè plıtváš mım èasem?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Tak kohopak to tu máme?
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Jsi na cestì do mìsta, nemám pravdu?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Moná.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Hm! (odfrkne) Vypadáš jako uprchlík! Všichni uprchlíci mají namíøeno do mìsta.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Dokonce bys mohl bıt bıvalım vìznìm z hornické kolonie.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(kvapnì) Je mi jedno, odkud jdeš. Ale vìøím, e bych pro tebe mìl zajímavou nabídku.
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde práce, rolníku?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"Vypadám snad jako farmáø?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"Nemohu si stìovat.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Co pro tebe mohu udìlat?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nemùu si stìovat.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Mùu pro tebe nìco udìlat?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Vypadám snad jako rolník?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Pøesnì jako rolník. Ale nemluvíš tak!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(hloubavì) Jestli nejsem úplnì mimo, tak bych pro tebe mìl zajímavou nabídku.
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "Co je to za nabídku?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Co je to za nabídku?
	if(CANTHAR_GOTME == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Tak, jak si to ty pøedstavuješ, tì stráe do mìsta nikdy nepustí.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//(ironicky) Jestli budeš v oèích stráí tak "pøesvìdèivı" jako v tìch mıch, nikdy tì do mìsta nepustí.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//Mùu ti pomoct dostat se do mìsta.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//Mám tady kousek papíru. S královskou peèetí a podpisem místodrícího. Propustku.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//S timhle kouskem papíru v kapse mùeš vypadat tak otrhanì, jak se ti zachce, a stráe tì nechají na pokoji.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Máš zájem?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"Ne! Nech si ten papír!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"Co za tu propustku chceš?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"Jak se dostaneš do mìsta TY?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"V tom musí bıt nìjakı háèek ...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Jsem obchodní cestující. Prodávám od kadého trochu.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Canthar obchoduje se vším monım zboím.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//V tom musí bıt nìjakı háèek.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//(pøehrává) Ne. ádnı háèek. Jenom mi budeš dluit laskavost.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//Jak se dostaneš do mìsta TY?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Stráe u mì znají. Prostì jim øeknu, e jsem svoji propustku ztratil.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Co za tu propustku chceš?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(spokojenì) VÌDÌL JSEM, e ty jsi ten pravı!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Poslouchej. Teï ode mì dostaneš tu propustku.
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Jen tak?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Jen tak. ALE: A tì ve mìstì potkám, mám u tebe laskavost.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Dohodnuto?
	Info_AddChoice(dia_canthar_whatoffer,"Jasnì. Dej mi ten papír.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Jasnì. Dej mi ten papír.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Tady. Buï na to opatrnı, je to velmi cenné.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//Ještì jedna vìc: Ani nepomysli na to, e bys porušil slovo!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Jako obchodník se ve mìstì tìším velké vánosti - nedopadlo by to pro tebe dobøe, vìø mi!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Od obchodníka Canthara jsem dostal propustku, s její pomocí mohu vejít do mìsta. A ho tam potkám, dluím mu za to protislubu.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Ne! Nech si ten papír!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Hm. Vypadá to, e jsem se v tobì spletl, co?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Dobrá. Chceš ještì nìco? Mùu ti ukázat své zboí?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = "Uka mi své zboí!";
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Uka mi své zboí!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Vyber si.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//Ještì stále mi dluíš laskavost. Pøišel èas splatit dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Hej, ty. Mám pro tebe úkol.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Co chceš?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Chci zpátky svùj stánek na trišti. Sarah mi ho ukradla.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//Ale u to místo zabírala dost dlouho. Chci, aby mi ho vrátila.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//A co já s tím?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//Dám ti dopis, co jí strèíš do kapsy.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Pak pùjdeš za lordem Andrem a øekneš mu, e Sarah prodává zbranì Onarovi.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Skonèí ve vìzení, ty shrábneš peníze a já dostanu zpátky svùj stánek.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//Máš na to dva dny.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//Co z toho budu mít?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Jakmile budu mít zpátky stánek, dostaneš ode mì zbraò - zatracenì dobrou zbraò.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"Ne, nechci s tím nic mít.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"NO tak dobøe, udìlám to.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"Co se stane, kdy odmítnu?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//Co se stane, kdy odmítnu?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//To by od tebe bylo opravdu hloupé. Vím, e jsi bıvalı trestanec.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Pokud se to roznese, mùe to ošklivì ublíit tvé povìsti ve mìstì.
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Ne, nechci s tím nic mít.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//To bylo špatné rozhodnutí, chlapèe. Ještì si spolu promluvíme.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//Dobrá, vypadá to, e nemám na vybranou.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Chytrej kluk. Tady máš ten dopis.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//Jak jí ten dopis mám podstrèit?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Nech ji, a ti ukáe své zboí -  a mezitím k ní ten dopis schovej.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//A nezapomeò, e mám ve mìstì znaènı vliv, take ádné hlouposti.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"Canthar po mnì nyní chce tu laskavost, kterou mu stále dluím.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"Canthar mi za onu laskavost slíbil pìknou zbraò.");
	};
	b_logentry(TOPIC_CANTHAR,"Mám obchodnici Sarah nenápadnì podstrèit dopis, kterı budí zdání, e prodává zbranì Onarovi. Pak mám zajít za lordem Andreem a udat ji.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "Pokud jde o Sarah...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//Nemáš co na práci?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Nejdøív ten dopis podstrè Sarah, pak zajdi za Andrem a obviò ji.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Udìlej to a nepokoušej se mì podvést. Litoval bys toho.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//Utíká ti èas. Zaèni s tím u!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Sarah je mrtvá.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Opravdu? Vıbornì. Tak to jsi splnil polovinu našeho malého plánu.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "Pokud jde o Sarah...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Dobrá práce. Sarah je tam, kde si zaslouí.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//Pøevezmu její zboí, take jestli potøebuješ zbraò, stav se u mì.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Chystal ses mi dát zbraò.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Správnì. Tady, tahle zbraò je mistrovskım kouskem kováøského umìní.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Hm, ty jsi tu znovu.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Jak to, e nejsi ve vìzení?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Byl jsem propuštìn. Jak u jsem ti øíkal - mám ve mìstì velkı vliv.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//A mezitím jsem se se Sarah dohodl sám. Mùeš na tu vìc s dopisem zapomenout.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Copak jsem tì nevaroval? Bylo by líp, kdybys udìlal, co jsem ti øekl.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Teï se mezi obchodníky povídá, e jsi trestanec.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Politováníhodná vìc - teï tady na trišti nedostaneš ani kousek chleba.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//Samozøejmì bych tu vìc mohl zase urovnat, øeknìme...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Zaplatíš?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"No tak dobøe, zaplatím...",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"Nemám u sebe dost penìz ...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"Kolik e to bylo?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Dobrá, zaplatím. Nedáváš mi jinou monost.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(smìje se) Vıbornì. Tak to bych se mìl podívat na to, aby tvá reputace mezi obchodníky zase stoupla.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//Nemám u sebe dost penìz.
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Tak si je seeò.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Kolik e to bylo?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Varoval jsem tì, ale tys neposlouchal. Probereme to pozdìji.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//A teï se ztra, chci si odpoèinout.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "Prodáváš nelegální dùlní akcie!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Prodáváš nelegální dùlní akcie!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//No a? Co teda! Kdybych to nedìlal já, chytne se toho nìkdo jinı.
	b_giveplayerxp(XP_AMBIENT);
};

