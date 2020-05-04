
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_firstexit_condition;
	information = dia_bdt_1013_bandit_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_firstexit_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_firstexit_info()
{
	if((BDT13_FRIEND == TRUE) && !Npc_IsDead(ambusher_1014) && !Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Bejt tebou, nahoru do jeskynì nechodím - mí kámoši tam z tebe stáhnou kùži. A vìø tomu, že bojovat umí.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_exit_condition;
	information = dia_bdt_1013_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void dia_bdt_1013_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_bdt_1013_bandit_where_condition;
	information = dia_bdt_1013_bandit_where_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bdt_1013_bandit_where_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_where_info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej, odkud to jdeš, hm?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Z hor..",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem u Xardase ...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Z hor.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//Pøesnì. Pøišel jsi z hor. A to je pro tebe zlé.
	b_usefakescroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Velmi zlé.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Hledají tì - celá banda zlejch chlapù.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Je tady nìkdo, s kým by sis mìl za každou cenu promluvit. Pojï za mnou!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná pozdìji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Kdo se po mnì shání?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Byl jsem u Xardase...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//To je ten starý èarodìj? Øíkají mu Xardas... To bude Braga zajímat.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Fajn! Jdi první!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Tak pojï za mnou, Jeskynì je hned tady nahoøe.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Kdo se po mnì shání?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Jde po tobì pùlka Khorinisu a ty mi chceš tvrdit, že o tom nic nevíš?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Á! Už vím! Ty o tom prostì se mnou nechceš mluvit, hm? Jak chceš - je to tvoje vìc.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//Tak jdeš, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná pozdìji ... ",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"S kým bych to mìl mluvit?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//S kým bych to mìl mluvit?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//S mým šéfem. Jmenuje se Brago. Vysvìtlí ti to líp než já.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//Tak jak - jdeme?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná pozdìji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Jak mám vìdìt, že to není past?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Jak mám vìdìt, že to není past?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Hele, už mì zaèínáš unavovat. Když o mou pomoc nestojíš, ta si jdi do mìsta a nech se strèit do basy!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Buï se mnou pùjdeš hned, nebo na to mùžeme rovnou zapomenout, jasný?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná pozdìji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Pomalu, kámo! Podruhý se napálit nenechám.",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Pomalu, kámo! Podruhý se napálit nenechám.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Hm?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Jeden chlapík navrhnul, abysme spoleènì získali nìjakej amulet a pak se rozdìlili o to, co z toho kápne.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Jakmile se nám to podaøilo, spoleènì s pøáteli mì napadl.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Tak to tak vypadá, že ses zapletl se špatnými lidmi - kde se to stalo?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Na tom až tak nezáleží.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem vìznìm v trestanecké kolonii.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//Byl jsem vìznìm v tìžaøské kolonii.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(ohromenì) Ty jsi pøišel zpoza bariéry? Chlape, tak to jsme tam byli spoleènì.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nevím...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//Byl jsem kopáèem ve Starém táboøe. Nemìl jsem s tím vším moc co do èinìní.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(spiklenecky) Ale co je teï dùležitìjší - jsi v pìknym maléru!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Nìkdo nabídl za tvou hlavu slušnou odmìnu. A vyvìsil nìkolik oznámení - s tvým ksichtem!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Bejt tebou, tak jsem velmi, velmi opatrný. Je mezi náma pár lidí, co by pro prachy zabili i vlastní mámu.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale mám dojem, že my chlapi z kolonie bysme mìli držet spolu!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Tak to abych ti radìji podìkoval.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Za nic. Prostì koukej zùstat naživu.
	BDT13_FRIEND = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//Na tom až tak nezáleží.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak je libo. Tak jdeme, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná pozdìji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Možná pozdìji.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Žádné pozdìji neexistuje, kámo!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_ambush_condition;
	information = dia_1013_bandit_ambush_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1013_bandit_ambush_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (BDT13_FRIEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_ambush_info()
{
	if(Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//To od tebe byla pìkná blbost, žes šel za mnou.
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej lidi, koukejte, koho jsem vám pøivedl.
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_name_condition;
	information = dia_1013_bandit_name_info;
	permanent = FALSE;
	description = "Kdo je ten chlápek, co nabídl odmìnu?";
};


func int dia_1013_bandit_name_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_name_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kdo je ten chlápek, co nabídl odmìnu?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//To nevím, u nás to ví jen jeden jediný.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kdo to jako má být?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hele, chlape, tak tohle ti fakt øíct nemùžu. Víš, jak to chodí.
	Log_CreateTopic(TOPIC_BANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BANDITS,LOG_RUNNING);
	b_logentry(TOPIC_BANDITS,"Jdou po mnì nìjací banditi, kteøí chtìjí získat odmìnu, vypsanou na mou hlavu. Zajímalo by mì, co za tím vším vìzí.");
	MIS_STECKBRIEFE = LOG_RUNNING;
};


instance DIA_1013_BANDIT_DEXTER(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_dexter_condition;
	information = dia_1013_bandit_dexter_info;
	permanent = TRUE;
	description = "10 zlatých za jméno toho, co vypsal tu odmìnu.";
};


func int dia_1013_bandit_dexter_condition()
{
	if((BDT13_FRIEND == TRUE) && (BDT13_DEXTER_VERRATEN == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_dexter_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 zlatých za jméno toho, co vypsal tu odmìnu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Ach jo, chlape, tohle fakt nemùžu udìlat.
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Tak už to vyklop!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(s hlubokým povzdechem) Ale, chlape! No dobrá. Jmenuje se Dexter. Poblíž farmy velkostatkáøe narazíš na takovou strmou skálu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//Úplnì nahoøe je strážní vìž a nìkolik dolù. Nìkde poblíž má svùj úkryt.
	b_logentry(TOPIC_BANDITS,"Bandity vede Dexter. Skrývá se v dolu poblíž velkostatkáøova sídla.");
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Ani to nebolelo, co. Tady je zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//NÉ - Teï jsem si vzpomnìl, že vlastnì nemám 10 zlatých, co bych mohl postrádat.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co?! Já... Hm - zapomeò na to - je to moje chyba. Nemìl jsem ti to jméno øíkat døív, než jsi mi ukázal zlato.
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//A hlavnì jim neøíkej, kdo ti vyklopil.
	BDT13_DEXTER_VERRATEN = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 2;
	condition = dia_1013_bandit_pic_condition;
	information = dia_1013_bandit_pic_info;
	permanent = FALSE;
	description = "Mùžu dostat ten obrázek?";
};


func int dia_1013_bandit_pic_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_pic_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Mùžu dostat ten obrázek?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasnì (smìje se) - konec koncù, je tam TVÙJ ksicht.
	b_giveinvitems(self,other,itwr_poster_mis,1);
};


instance DIA_1013_BANDIT_FROMMALETH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_frommaleth_condition;
	information = dia_1013_bandit_frommaleth_info;
	permanent = FALSE;
	description = "Jeden z farmáøù z venkova mì poslal.";
};


func int dia_1013_bandit_frommaleth_condition()
{
	if((BDT13_FRIEND == TRUE) && ((MIS_MALETH_BANDITS == LOG_RUNNING) || (MIS_MALETH_BANDITS == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_frommaleth_info()
{
	var C_NPC b14;
	var C_NPC b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Jeden z farmáøù z venkova mì poslal.
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co? Farmáøi o tom úkrytu vìdí?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Všimli si, že jim mizejí ovce.
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Sakra! Tak to bych sebou mìl hodit. Když našli ten úkryt prázdný, možná po mnì ještì pátrají.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//Chtìjí tì vidìt mrtvého.
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Poèkej - nehodláš mì oddìlat, že ne - po tom, co jsem ti pomohl?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Jen do toho, pozabíjej všechny ostatní, když tak bažíš po krvi - já s tím nechci nic mít!
	};
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FROMCAVALORN(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_fromcavalorn_condition;
	information = dia_1013_bandit_fromcavalorn_info;
	permanent = FALSE;
	description = "Brzo tu bude hodnì dusno!";
};


func int dia_1013_bandit_fromcavalorn_condition()
{
	if((BDT13_FRIEND == TRUE) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_fromcavalorn_info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Brzo zde bude hodnì dusno!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co se dìje?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Znáš Cavalorna? Chystá se na tebe!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//K sakru! Je na živu? Já mizím.
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_gossip_wildnis;

instance DIA_1013_BANDIT_PERM(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 4;
	condition = dia_1013_bandit_perm_condition;
	information = dia_1013_bandit_perm_info;
	permanent = TRUE;
	description = "Je tu ještì nìco dalšího, co by mì mìlo zajímat?";
};


func int dia_1013_bandit_perm_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_perm_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Je tu ještì nìco dalšího, co by mì mìlo zajímat?
	if(BDT13_GOSSIP_WILDNIS == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Myslíš tady v okolí? Jestli chceš zùstat naživu, nescházej z cesty.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Èím dál zajdeš do divoèiny, tím vìtší na tebe bude èíhat nebezpeèí.
		BDT13_GOSSIP_WILDNIS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Už jsem ti øekl všechno, co jsem vìdìl.
	};
};

