
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(Ukrast tento klíè bude zatracenì tìké)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Mohu ti nìjak pomoci?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "Pøinesl jsem kopu zlata.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Pøinesl jsem kopu zlata.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(pln oèekávání) Ach - pøinášíš dar Innosovi. Velmi dobøe, mùj synu.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Pouiju tvùj dar ve prospìch kláštera, jak si Innos pøeje.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi s tím zlatem udìlal? Utratils ho? Pøines ho sem!
	};
};


instance DIA_ADDON_GORAX_DARONSSTATUE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_addon_gorax_daronsstatue_condition;
	information = dia_addon_gorax_daronsstatue_info;
	permanent = TRUE;
	description = "Mám tady sošku, kterou mìl Daron doruèit do kláštera.";
};


func int dia_addon_gorax_daronsstatue_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gorax_daronsstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Mám tady sošku, kterou mìl Daron doruèit do kláštera.
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(povzdychne) Je to hanebné, e takovı vzácnı kus sem musí pøinést novic.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//A pøece, je to svìdectví o tvém odhodlaní slouit Innosovi.
		if(b_giveinvitems(other,self,itmi_lostinnosstatue_daron,1))
		{
			Npc_RemoveInvItems(self,itmi_lostinnosstatue_daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Buï si jistı mou vdìèností, mladı novici.
		MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_RETURNEDLOSTINNOSSTATUE_DARON);
		DIA_GORAX_GOLD_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Soška? Nevidím ádnou sošku. Dones mi ji a já budu veøit tvému malému pøíbehu.
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "Hledám místo, kde bych se mohl vyspat.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Hledám místo, kde bych se mohl vyspat.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Hned vedle dveøí je volná postel. První napravo, vedle vchodu. Mùeš spát tam.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Svoje vìci si mùeš dát do nìkteré z nepouívanıch truhel.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//A nezapomeò - v lonicích mágù nemáš co pohledávat. Také nesmíš vstupovat do knihovny, leda e bys mìl vıslovné povolení.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "Máš pro mì nìjakı úkol?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//Máš pro mì nìjakı úkol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Vy novicové v poslední dobì pracujete tvrdì. A ti, kdo hodnì pracují, by také mìli hodnì jíst.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Tady máš klíè od spiírny. Najdeš tam skopové klobásy. Rozdìl je mezi novice - ale spravedlivì!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//A budeš hotov, zase za mnou pøijï.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Mistr Gorax chce, abych skopové klobásy ze spiírny spravedlivì rozdìlil mezi novice. Kromì mì jich klášter obıvá celkem tøináct.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "Rozdìlil jsem ty klobásy.";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Rozdìlil jsem ty klobásy.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//A uèinil jsi tak spravedlivì. Vezmi si tenhle svitek s léèivım kouzlem - a bì si zase po své práci.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Vánì? V tom pøípadì ses ale pøi plnìní toho úkolu moc nesnail.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Buï jsi ty klobásy snìdl sám, nebo jsi nìkomu dal víc, ne mu náleelo.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Poslouchej, protoe jsi novı, nechám to protentokrát bıt. Ale pøíštì budu pøísnìjší!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "Máš pro mì nìjakı další úkol?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//Máš pro mì nìjakı další úkol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Ano. Jak víš, dìláme tady vıborné víno a také je prodáváme.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, majitel hostince "U Mrtvé harpyje", si objednal dodávku. Dohodli jsme se, e za ty láhve zaplatí 240 zlatıch.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Dones mu tyto láhve - ale nenech se ošidit.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Mistr Gorax chce, abych hospodskému Orlanovi doruèil dvanáct lahví vína. Cena za kus èiní 240 zlaákù.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "Byl jsem za Orlanem.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Byl jsem za Orlanem.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//A dostal jsi 240 zlatıch?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"Ten šizuòk mì ošulil! (Pøedat 100 zlaákù.)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"Tady je zlato. (Odevzdat 240 zlaákù.)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi s tím zlatem udìlal? Utratils ho? Pøines ho sem!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Dal mi ménì!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Tys mu to prodal lacinìji? To ne, proè jen jsem ze všech lidí posílal právì TEBE?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Jsi naprosto a totálnì neschopnı. Bì mi z oèí.
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Dostal jsem ty peníze.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Vıbornì. Jsi vánì schopnı. Jako odmìnu si vezmi tenhle svitek s léèivım kouzlem. A teï bì a najdi si nìjakou další práci.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Ale èást tìch penìz jsi u staèil utratit, co? Jsi k nièemu - zmiz!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "Co tu máš na práci?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//Co tu máš na práci?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Mé úkoly jsou mnohé a rùznorodé. Nejsem jen správce, jsem té strácem pokladnice.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Navíc dohlíím na vinnı sklep a starám se o klášterní zásoby jídla.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Take pokud budeš nìco potøebovat, mùeš za mnou kdykoliv zajít a dostaneš to - samozøejmì za rozumnou protihodnotu.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistr Gorax mì mùe zásobit vším, co bych mohl v klášteøe upotøebit.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potøebuji pár vìcí.";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Potøebuji pár vìcí.
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "Potøebuji nové místo na spaní.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Potøebuji nové místo na spaní.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//Napravo odsud je volnı pokoj. Vezmi si tenhle klíè. Najdeš tam všechno, co potøebuješ.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Poèkej, oldáku. Potøebuji si s tebou promluvit.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Klášter se ocitl ve velice delikátní situaci.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//Momentálnì se zdá, e nikdo nevìøí nikomu. A potom ta vìc s Pedrem, to je navısost... (polkne)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//Mám pro tebe úkol pøímo z nejvyšších míst. Nejsi èlenem Bratrstva ohnì, a tedy jedinı, kdo tu vìc mùe zaøídit.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Ale musím tì varovat. Pokud ti ten úkol zadám, budeš jej muset splnit. Jakmile se dozvíš, o co se jedná, nebudeš u mít na vıbìr. Rozumíš?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Zapomeò na to. Je to na mì pøíliš riskantní.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"Øekni, co chceš.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Zapomeò na to. Je to na mì pøíliš riskantní.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//V poøádku. V tom pøípadì zapomeò, e bych cokoliv øíkal.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Øekni, co chceš.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Dobrá. Poslouchej dobøe, protoe to øeknu jenom jednou.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes chce, abys Pedra za jeho zradu potrestal smrtí, jakmile se ti dostane do rukou.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Jakmile svùj úkol splníš, dostaneš zaplaceno.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Nikdy jsem to neøekl. A tys také nic neslyšel, rozumíš?
	b_logentry(TOPIC_TRAITORPEDRO,"Gorax mi vyøídil vzkaz od Serpenta, e pokud narazím na zrádce Pedra, mám ho bez okolkù zabít.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};

