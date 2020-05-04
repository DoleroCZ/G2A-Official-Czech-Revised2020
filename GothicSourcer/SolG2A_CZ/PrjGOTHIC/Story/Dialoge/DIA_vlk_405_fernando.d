
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = "(Krádež jeho portmonky by byla dosti riskantní.)";
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nic moc. Když ještì stála bariéra, bylo to lepší èasy.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Trestanci dodávali tuny a tuny rudy z dolù a mé lodì ji pak odvážely na pevninu.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//A zpátky zase pøivážely potraviny a jiné zboží.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Ale teï jsme odøíznuti od pevniny a jsme se zásobami závislí na farmáøích.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "Z èeho teï žiješ?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z èeho teï žiješ?
	if(FERNANDO_IMKNAST == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if(FERNANDO_HATSZUGEGEBEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nevím. Vyhýbám se èernému trhu.
	}
	else if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Zrovna teï žiju ze svých zásob. Ale jestli se zase nezaène obchodovat, dožiju se strašných èasù.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Je ze mì žebrák. Mìl jsem poslechnout svého otce a držet se od toho hornického kšeftu dál.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE) && (FERNANDO_HATSZUGEGEBEN == FALSE) && (FERNANDO_IMKNAST == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hej ty - poèkej chvilku. Máš namíøeno do Hornického údolí, že ano?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//A?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Mám pro tebe nabídku. Ty mi dáš vìdìt, jak se to má s rudou a já ti pak za to dám...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... prsten, co posílí tvou životní energii.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Uvidím, co se dá dìlat.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Obchodník Fernando chce vìdìt, co se v Hornickém údolí dìje s rudou.");
};


instance DIA_ADDON_FERNANDO_BANDITTRADER(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_addon_fernando_bandittrader_condition;
	information = dia_addon_fernando_bandittrader_info;
	description = "Prodávals zbranì banditùm.";
};


func int dia_addon_fernando_bandittrader_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))))
	{
		return TRUE;
	};
};

func void dia_addon_fernando_bandittrader_info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Prodávals zbranì banditùm.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(pøekvapenì) Huh. Jak jsi pøišel na ten nápad?
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Fernando, zámoøský kupec, pøiznal, že dodává zbranì banditùm.");
	b_giveplayerxp(XP_ADDON_FERNANDO_HATSZUGEGEBEN);
	FERNANDO_HATSZUGEGEBEN = TRUE;
	if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//To je soupis zboží. Dostal jsem ho od banditù. Je na nìm tvùj podpis.
	};
	if(Npc_HasItems(other,itri_addon_bandittrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Našel jsem také tento prsten u zámoøského prùvodce Araxosose. A ty jsi zámoøský obchodník.
		if(Npc_HasItems(other,itmw_addon_bandittrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//A meèe banditù jsou podepsány tvým iniciálem 'F'.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Meèe banditù jsou podepsány tvým iniciálem 'F'
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nemusíš zapírat. Odkryl jsem tvou nekalou èinnost.
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Tak tos byl ty? Tys mì zradil. Za to zaplatíš.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Myslím, že odtud poputuješ nìkam jinam. Nicménì, jsem si jist, že tì nenechají jít zase tak brzy na svìtlo.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(nazlobenì) Mùj èas nadešel.
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(žebravì) Musíš mi vìøit, že jsem to nechtìl udìlat!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(žebravì) Prvnì to bylo pouze jídlo, co chtìli. Mùj obchod nešlapal zrovna tak, jak by mìl, tak jsem souhlasil.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(žebravì) A èasem mi zaèali vyhrožovat, že mì zabijí, pokud jim nebudu dodávat víc a víc meèù.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(žebravì) Nemùžeš mì vinit z toho, co jsem udìlal. Jsem pouze obì!
		if(FERNANDO_IMKNAST == FALSE)
		{
			Info_ClearChoices(dia_addon_fernando_bandittrader);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Kolik mi zaplatíš, pokud tì nechám uprchnout?",dia_addon_fernando_bandittrader_preis);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Zaène se o tebe zajímat domobrana.",dia_addon_fernando_bandittrader_mil);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Oh, to mì opravdu rozesmutnìlo.",dia_addon_fernando_bandittrader_uptown);
		};
	};
};

func void dia_addon_fernando_bandittrader_uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Oh, to mì fakt rozesmutnìlo. Víš, jsi docela hnusný na nìkoho, kdo žije v horní ètvrti.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Prodat svou duši za pár kusù zlata.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Musím si vydìlat na živobytí. Když nepokryju náklady, vyhodí mì z pøístavu. Stane se ze mì chátra.
};

func void dia_addon_fernando_bandittrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Domobrana se o tebe zaène zajímat.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Nemùžeš to udìlat!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Jistì, že mùžu.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Ve jménu Innosovì, jsem na mizinì.
	b_npcclearobsessionbydmt(self);
};

func void dia_addon_fernando_bandittrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Kolik mi zaplatíš, pokud tì nechám uprchnout?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Znáš mou situaci. Nemohu ti moc zaplatit.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Co tak 200 zlata a cenný prsten?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//To je vše, co ti mohu dát. Dáš mi teï ten seznam?
	Info_ClearChoices(dia_addon_fernando_bandittrader);
	Info_AddChoice(dia_addon_fernando_bandittrader,"No, nechystám se ti to dát.",dia_addon_fernando_bandittrader_nein);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Okay. Ujednáno.",dia_addon_fernando_bandittrader_ja);
};

func void dia_addon_fernando_bandittrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Okay. Dohodnuto.
	b_giveplayerxp(XP_AMBIENT);
	Npc_RemoveInvItems(hero,itmw_addon_bandittrader,Npc_HasItems(other,itmw_addon_bandittrader));
	Npc_RemoveInvItem(hero,itri_addon_bandittrader);
	Npc_RemoveInvItem(hero,itwr_addon_bandittrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Dobrá, tady je zlato.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//A prsten. Nyní jsme dohodnuti.
	CreateInvItems(self,itri_prot_point_01,1);
	b_giveinvitems(self,other,itri_prot_point_01,1);
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};

func void dia_addon_fernando_bandittrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Ne, nechystám se ti to dát.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobrá. Vem si to, ale nezkoušej mì podvést...
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "Byl jsem v Hornickém údolí.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Byl jsem v Hornickém údolí.
	if(FERNANDO_IMKNAST == FALSE)
	{
		FERNANDO_ERZ = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//A? Jak se to tam má?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Všechny doly jsou vytìženy, je tam sotva pár truhel rudy. Nemá cenu tam vùbec kopat.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To nemùže být pravda! To znamená, že je ze mì žebrák.
		if(FERNANDO_HATSZUGEGEBEN == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co naše dohoda?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Teï k tvé odmìnì...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Tady, vezmi si ten runový kámen.
				b_giveinvitems(self,other,itmi_runeblank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Tady je tvùj prsten.
				b_giveinvitems(self,other,itri_hp_02,1);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_FERNANDO,LOG_OBSOLETE);
		b_logentry(TOPIC_FERNANDO,"Fernando doesn't want the information anymore. And I don't want to get any other fee neither.");
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Jsi v poøádku?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "Ty jsi posedlý!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ty jsi posedlý!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Jdi pryè. Tak jdi už.
	b_npcclearobsessionbydmt(self);
};

