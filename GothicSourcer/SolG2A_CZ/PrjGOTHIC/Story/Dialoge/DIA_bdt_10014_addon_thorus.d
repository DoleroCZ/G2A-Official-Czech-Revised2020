
instance DIA_ADDON_BDT_10014_THORUS_EXIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 999;
	condition = dia_addon_thorus_exit_condition;
	information = dia_addon_thorus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_thorus_exit_condition()
{
	return TRUE;
};

func void dia_addon_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10014_THORUS_HI(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 2;
	condition = dia_addon_thorus_hi_condition;
	information = dia_addon_thorus_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_hi_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Znáš pravidla. Bez èervené kamenné desky se nikdo do dolu nedostane.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapomeò na dùl - musím se dostat k Ravenovi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//I tak. Máme pravidla, která platí pro každého. I pro tebe.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Vra se. Pokud se pokusíš vstoupit do horní èásti bez povolení, stráže tì zabijí. TO jsou pravidla.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Pokud chceš mít námitky, promluv si s Estebanem. Je zodpovìdný za tábor.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BDT_10014_THORUS_RAVEN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 3;
	condition = dia_addon_thorus_raven_condition;
	information = dia_addon_thorus_raven_info;
	permanent = FALSE;
	description = "Je velmi dùležité, abych se dostal k Ravenovi ...";
};


func int dia_addon_thorus_raven_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raven_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Je velmi dùležité, abych se dostal k Ravenovi ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Ano? Opravdu veøíš, že se k nìmu dostaneš?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jeho stráže mají rozkaz nikoho nevpouštìt. Budeš mrtev døiv, než ho vùbec spatøíš.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Tak na to zapomeò.
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven je vùdce banditù. Budu muset se k nìmu dostat podle pravidel, která tu jsou.");
};


instance DIA_ADDON_BDT_10014_THORUS_ZEIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_zeit_condition;
	information = dia_addon_thorus_zeit_info;
	permanent = FALSE;
	description = "Vzpomínáš si na mì? Ze Starého tábora ...";
};


func int dia_addon_thorus_zeit_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_zeit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Vzpomínáš si na mì? Ze Starého tábora ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jsi jeden z vìzòù? Možná jsi byl jeden z mých stráží. Ano? Dìlá to z nás spojence?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Ne, nedìlá.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Možná jsi èlovìk, který strhl bariéru - možná jsi zabil moje lidi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//Tak co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Tyhle dny jsou pryè.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chceš vstoupit? Získej èervený kámen a už neplýtvej mým èasem.
	};
};


var int thorus_goodoldperm;

instance DIA_ADDON_BDT_10014_THORUS_GOODOLDPERM(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_goodoldperm_condition;
	information = dia_addon_thorus_goodoldperm_info;
	permanent = TRUE;
	description = "No tak, pus mì. Kvùli starým dobrým èasùm.";
};


func int dia_addon_thorus_goodoldperm_condition()
{
	if((MIS_SEND_BUDDLER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_bdt_10014_thorus_zeit) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_goodoldperm_info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//No tak, pus mì. Kvùli starým dobrým èasùm.
	if(THORUS_GOODOLDPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Dobrá - nech mì to vysvìtlit. Víš, proè jsem stále naživu?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Protože jsem byl vždy loajální ke svým lidem.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nemám rád to, co Raven dìlá. Ale budu se držet pravidel.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//A ty taky budeš!
		THORUS_GOODOLDPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(rozhodný) NE!
	};
};

func int c_playerhaswrongtoken()
{
	if((c_schasmagicstoneplate() == TRUE) || (Npc_HasItems(hero,itwr_stoneplatecommon_addon) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_02) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_03) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_04) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_05) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_ADDON_BDT_10014_THORUS_STEIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_stein_condition;
	information = dia_addon_thorus_stein_info;
	permanent = TRUE;
	description = "Mám pro tebe kamennou desku ...";
};


func int dia_addon_thorus_stein_condition()
{
	if((c_playerhaswrongtoken() == TRUE) && (RAVENISDEAD == FALSE) && (MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Mám pro tebe kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Ta je špatná. Poèítá se jen èervená.
};


instance DIA_ADDON_BDT_10014_THORUS_REIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_rein_condition;
	information = dia_addon_thorus_rein_info;
	permanent = FALSE;
	description = "Mám èervenou kamennou desku ...";
};


func int dia_addon_thorus_rein_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_rein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Mám èervenou kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Dobrá.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Vyøídil jsi Estebana - to znamená, že ty teï dìláš jeho práci.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//V dole mají pár problému s dùlními èervy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Tøi kopáèi jsou již po smrti. Je tvùj úkol opatøit nové.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A kdy se mùžu koneènì dostat do toho zatraceného dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Udìlej svoji práci - potom mùžeš dìlat, co chceš.
	MIS_SEND_BUDDLER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BUDDLER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BUDDLER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BUDDLER,"Protože jsem teï dostal Estebanùv úkol, mìl bych poslat tøi kopáèe do dolu.");
};


instance DIA_ADDON_BDT_10014_THORUS_SENT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_sent_condition;
	information = dia_addon_thorus_sent_info;
	permanent = FALSE;
	description = "Poslal jsem tøi chlapy.";
};


func int dia_addon_thorus_sent_condition()
{
	if((PLAYER_SENTBUDDLER >= 3) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_sent_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Poslal jsem tøi chlapy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Dobrá. Dokud se tady o to starám já, tak mùžeš dovnitø.
	MIS_SEND_BUDDLER = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BDT_10014_THORUS_ARMOR(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_armor_condition;
	information = dia_addon_thorus_armor_info;
	permanent = FALSE;
	description = "Hej, a co tvoje brnìní? Kde dostanu takové?";
};


func int dia_addon_thorus_armor_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_armor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co tvoje brnìní? Kde dostanu takové?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nikde. Zbroj je urèena pro Ravenovy stráže.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nevìøím, že je tu možnost, pro nové žadatele. Ale koneèné rozhodnutí není moje, ale spíše na Ravenovi.
};


instance DIA_ADDON_THORUS_GEFANGENE(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 88;
	condition = dia_addon_thorus_gefangene_condition;
	information = dia_addon_thorus_gefangene_info;
	permanent = FALSE;
	description = "A co s vìzni?";
};


func int dia_addon_thorus_gefangene_condition()
{
	if(!Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_gefangene_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//A co je s vìzni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Mmh, jejich práce skonèila. Co já vím, tak teï dolují zlato.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A pokud se pokusí o útìk ... ?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//... Bloodwyn za nimy pošle své stráže. Ale nevìøím, že jsou dost šílení, aby se pokusili o útìk.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Jestliže ...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Jestliže co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... je nìkdo jiný nebude podporovat. Ale vím, že nikdo není tak blbý, aby to udìlal ... v každém pøípadì, dokud je tu Bloodwyn.
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_THORUS_SPEECH(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_speech_condition;
	information = dia_addon_thorus_speech_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_speech_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_speech_info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co máš vlastnì v úmyslu dìlat?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Co??
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Teï jsi odstranil z cesty Bloodvyna. Ptám se sám sebe: Kdo další. Raven? Nebo já?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Bojíš se?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Nebojím se bitvy. Ale dùsledku tvých èinù.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Tenhle tábor je jediná vìc, co nám zbyla.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nepracuje to sice tak, aby to každého uspokojilo - Ale PRACUJE to.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A s každým chlapem, kterého zabiješ se naše kolonie tenèí.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jsme bandité. Zadržovaní, nezákonní, opovrhovaní.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Kamkoli jdeme, loví nás, vìzní nás, zabíjí nás.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Není lepšího místa, než tohohle, a lepší èas než teï.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Tak co tedy chceš?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Tihle muži potøebují nìkoho, kdo by je vedl. Kdo by to mìl dìlat? Ty? Nìkdo, kdo neustále chodí z místa na místo?
};


instance DIA_ADDON_THORUS_ANSWER(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_answer_condition;
	information = dia_addon_thorus_answer_info;
	permanent = FALSE;
	description = "Dobrá - proè se ty nestaneš vùdcem v táboøe?";
};


func int dia_addon_thorus_answer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_thorus_speech))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_answer_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dobrá - proè se ty nestaneš vùdcem v táboøe?
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobrá, ale co Raven?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Raven bude mít brzy jiné problémy. Postarám se o to.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//A postarej se, že vìzni budou moci odejít.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Oukej. Postarám se o všechny stráže venku.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn je mrtev a Thorus bude mít starosti, že otroci budou moci odejít.");
	if(!Npc_IsDead(prisonguard))
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Teï si promluvím ještì jednou s 'Otroèí hlídkou', potom mùže Patrick a jeho hoši zmizet.");
	}
	else
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Poté co jsem promluvil s 'Otroèí hlídkou', Patrick a jeho chlapi mùžou zmizet.");
	};
};


instance DIA_ADDON_THORUS_RAVENTOT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_raventot_condition;
	information = dia_addon_thorus_raventot_info;
	permanent = FALSE;
	description = "Dokázal jsem to. Raven je mrtev.";
};


func int dia_addon_thorus_raventot_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raventot_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Dokázal jsem to. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//Tím jsi zkrvavil Beliarovi nos.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Pùjdeš teï?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Moje práce v tomhle údolí skonèila. Mùžu pár dní odpoèívat.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(smìje se) Ano, jsi stále na cestì? (vážnì) Pøeji dobrou cestu.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kdo ví, možná na sebe znovu natrefíme.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kdo ví. Je tady mnoho bran a dveøí, kterými projdeš. A u nìkteré z nich mì najdeš ...
	AI_StopProcessInfos(self);
};

