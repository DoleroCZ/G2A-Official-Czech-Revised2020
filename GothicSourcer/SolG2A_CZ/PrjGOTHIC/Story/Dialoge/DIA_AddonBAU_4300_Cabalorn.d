
func int c_bragobanditsdead()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		return TRUE;
	};
};


instance DIA_ADDON_CAVALORN_EXIT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 999;
	condition = dia_addon_cavalorn_exit_condition;
	information = dia_addon_cavalorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cavalorn_exit_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_PICKPOCKET(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 900;
	condition = dia_addon_cavalorn_pickpocket_condition;
	information = dia_addon_cavalorn_pickpocket_info;
	permanent = TRUE;
	description = "(Tyto šípy se dají snadno štípnout)";
};


func int dia_addon_cavalorn_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_BACK,dia_addon_cavalorn_pickpocket_back);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_PICKPOCKET,dia_addon_cavalorn_pickpocket_doit);
};

func void dia_addon_cavalorn_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		b_giveinvitems(self,other,itrw_arrow,44);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_addon_cavalorn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
};


instance DIA_ADDON_CAVALORN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_meetingisrunning_condition;
	information = dia_addon_cavalorn_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_cavalorn_meetingisrunning_onetime;

func int dia_addon_cavalorn_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_meetingisrunning_info()
{
	if(DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Vítej v 'Kruhu' pøíteli.
		DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras mi dal jinej úkol.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_HALLO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_hallo_condition;
	information = dia_addon_cavalorn_hallo_info;
	description = "Problémy?";
};


func int dia_addon_cavalorn_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Problémy?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Zatracenì. Nevìdìl jsem, kde se schovávaj. Dostal jsi jednoho a za chvíli budou zpátky.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(uliènicky) Moment. Já tì znám. Ty jsi ten chlápek, kterı u mì stále ebral v kolonii šípy.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Jmenuješ se Cavalorn, e?",dia_addon_cavalorn_hallo_ja);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Tìko si vzpomínám.",dia_addon_cavalorn_hallo_weissnicht);
};

func void dia_addon_cavalorn_hallo_weissnicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Tìko si vzpomínám.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//No tak! Uèil jsem tì lukostøelbu a plíení v mé chatrèi blízko Starého tábora. U ti svítá?
};

func void dia_addon_cavalorn_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Jmenuješ se Cavalorn, e?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Á. Vidím, e jsi na mì nezapomnìl po tom všem, èím jsme prošli v té zatracené kolonii.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Kam jinak jdeš?
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nemám ádnı urèitı cíl.",dia_addon_cavalorn_hallo_keinziel);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Zpátky do Hornického údolí. ",dia_addon_cavalorn_hallo_bauern);
	if(mil_310_stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_hallo,"Do mìsta.",dia_addon_cavalorn_hallo_stadt);
	};
};

func void dia_addon_cavalorn_hallo_stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do mìsta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(smìje se) To vidím. Do mìsta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//Mùeš se dostat do problémù s mìstskou stráí. Nenechají kdekoho projít po tom, co bylo tohle místo zamoøeno bandity.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Jeden z tìch starıch Sektáøù z Hornického údolí pøišel pøed nìkolika dny. Øekl, e se dostane do Khorinisu a ven kdy chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Vydal se do údolí pod tou velkou vìí. Nìkde tam blízko vodopádu musí bıt cesta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Moná by sis s ním mìl promluvit.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Zpátky do Hornického údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(pøekvapenì) Opravdu? Hmm. Rád bych, mùu tì následovat, ale musím si ještì vyjasnit pár vìcí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Pokud se dostaneš do Hornického údolí - mohl bys zjistit jestli má chatrè ještì stojí? Rád bych se tam jednoho dne vrátil.
	MIS_ADDON_CAVALORN_THEHUT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Lovec Cavalorn mì poádal, abych se v pøípadì, e se dostanu do hornického údolí, podíval, jestli ještì stojí jeho lovecká chata, leící severnì od bıvalého Starého tábora.");
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_keinziel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nemám ádnı urèitı cíl.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nechceš mi to øíct - správnì? ádnı problém.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};


instance DIA_ADDON_CAVALORN_BEUTEL(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_beutel_condition;
	information = dia_addon_cavalorn_beutel_info;
	description = "Byl jsem v tvé chatrèi v Hornickém údolí.";
};


func int dia_addon_cavalorn_beutel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || (SC_OPENEDCAVALORNSBEUTEL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_beutel_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Byl jsem v tvé chatrèi v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Take to stále stojí.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Ano. A také vím, co jsi tam chtìl.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Našel jsi to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Pokud myslíš tvùj sáèek s hrudkami rudy ... ano, mám ho.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Jsi starej lišák, víš o tom.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//Co dalšího chceš z té staré chatrèe. Nic tam nezbylo.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Máš to s sebou? Dám ti za to 100 zlaákù.
	TOPIC_END_CAVALORNTHEHUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Jasnì.",dia_addon_cavalorn_beutel_ja);
	}
	else if(Npc_HasItems(other,itmi_nugget))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Ne, ale mám tady tuhle hroudu rudy.",dia_addon_cavalorn_beutel_jaerz);
	};
	Info_AddChoice(dia_addon_cavalorn_beutel,"Ne.",dia_addon_cavalorn_beutel_no);
};

func void dia_addon_cavalorn_beutel_back()
{
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Doufám, e to brzy dostanu zpìt.
};

func void dia_addon_cavalorn_beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Ne, ale mám tady tuhle hroudu rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Taky dobøe.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, proè jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Jasnì.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Super.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, proè jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Tak se vra pro tu vìc ZNOVU. Pøes veškeré úsilí pro to asi budu muset do toho zatraceného údolí sám.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jsem tak dotèen.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, proè jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Tak jako tak, proè jsi si to nevzal?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kdo si mohl myslet, e ruda je tady v Khorinisu tak cenná?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//V kolonii jsi nedostal za takovouhle hrudku rudy ani místo na spaní.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//V pøístavu ti témeø rozbijou hlavu, pokud zjití, e máš u sebe rudu.
};


instance DIA_ADDON_CAVALORN_ERZGEBEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_erzgeben_condition;
	information = dia_addon_cavalorn_erzgeben_info;
	description = "Dej mi 100 zlaákù, pak ti vrátím rudu.";
};


func int dia_addon_cavalorn_erzgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_beutel) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || Npc_HasItems(other,itmi_nugget)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_erzgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Dej mi 100 zlaákù, pak ti vrátím rudu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Ujednáno. Tady máš.
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	if(b_giveinvitems(other,self,itse_addon_cavalornsbeutel,1) == FALSE)
	{
		b_giveinvitems(other,self,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Jsi opravdovı pøítel. Dìkuji ti.
	MIS_ADDON_CAVALORN_THEHUT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_CAVALORNSBEUTEL);
};


instance DIA_ADDON_CAVALORN_WASMACHSTDU(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_wasmachstdu_condition;
	information = dia_addon_cavalorn_wasmachstdu_info;
	description = "Co tady dìláš?";
};


func int dia_addon_cavalorn_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Uvízl jsem. Kdyby to nebylo tìch zatracenım banditù, asi bych tu nebyl.
};


instance DIA_ADDON_CAVALORN_BANDITEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 10;
	condition = dia_addon_cavalorn_banditen_condition;
	information = dia_addon_cavalorn_banditen_info;
	description = "Co banditi?";
};


func int dia_addon_cavalorn_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_wasmachstdu) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_banditen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Co banditi?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Zaspal jsi snad celı minulı tıden?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ehm ...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mluvím o té havìti z trestanecké kolonie - rozlézají se po krajinì, drancují a vradí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(povzdech) Jsem rád, e mì nechali naivu. Jednou nedávám pozor a oni mì praští zezadu do hlavy.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nenapadá mì ádnı zpùsob, jak dostat moje vìci zpìt.
	};
};


instance DIA_ADDON_CAVALORN_ARTEFAKT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_artefakt_condition;
	information = dia_addon_cavalorn_artefakt_info;
	description = "Ty jsi byl okraden bandity?";
};


func int dia_addon_cavalorn_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (MIS_ADDON_CAVALORN_KILLBRAGO != LOG_SUCCESS) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_artefakt_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Ty jsi byl okraden bandity?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(zachmuøenì) Jo. Srazili mì a nechali jako jídlo pro gobliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Byly tam zatracenì dùleité vìci. Dopis a všechny moje peníze. Prostì to musím dostat zpìt.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nicménì, bez podpory tam nejdu. Ta zbabìlá tlupa kriminálníkù ...
};


instance DIA_ADDON_CAVALORN_HELFEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_helfen_condition;
	information = dia_addon_cavalorn_helfen_info;
	description = "Mùu ti pomoci s bandity?";
};


func int dia_addon_cavalorn_helfen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_artefakt) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_helfen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Mùu ti pomoci s bandity?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(uliènicky) Moná. Ale z tvého ztrápeného zjevu ti mùu øíct, e jsi nedrel opravdovı meè celé tıdny.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Dobrá. Pravdìpodobnì nemám jinou volbu ne pøijmout tvoji nabídku. Nemám moc èasu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Take poslouchej. Dole po tehle cestì je jedna z tìch špinavıch dìr v zemi, ve kterıch se banditi rádi schovávají.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Ti kriminálníci tady, jsou ti, kteøí mi ukradli moje vìci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Øekni mi a budeš pøipraven a pùjdem na tu paká.
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLBRAGO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLBRAGO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLBRAGO,"Cavalorn byl okraden bandity o velmi dùleité vìci. Odmítá s nimi bojovat sám a tak mì poádal o pomoc.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_CAVALORN_AUSRUESTUNG(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ausruestung_condition;
	information = dia_addon_cavalorn_ausruestung_info;
	description = "Potøebuju lepší vybavení.";
};


func int dia_addon_cavalorn_ausruestung_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO != 0) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ausruestung_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Potøebuju lepší vybavení.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Ty prasata mì toho moc nenechali.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Mùu ti dát vlèí nù. Staèí to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Nù staèí.
	CreateInvItems(self,itmw_addon_knife01,1);
	b_giveinvitems(self,other,itmw_addon_knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//Ale co nìjaké lektvary?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zbyly mi dva léèivé lektvary. Máš zájem?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Jasnì. Vezmu si je.
	CreateInvItems(self,itpo_health_01,2);
	b_giveinvitems(self,other,itpo_health_01,2);
};


instance DIA_ADDON_CAVALORN_LETSKILLBANDITS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_letskillbandits_condition;
	information = dia_addon_cavalorn_letskillbandits_info;
	description = "Pojïme zabít ty flákaèe.";
};


func int dia_addon_cavalorn_letskillbandits_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_letskillbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Pojïme zabít ty flákaèe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobrá. Prostì mi hlídej záda, jasné?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//To mají za to sprosté pøepadení.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(BDT_1013_AWAY == FALSE)
	{
		ambusher_1013.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	ambusher_1014.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	ambusher_1015.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void b_addon_cavalorn_vatrasbrief()
{
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Na poslední chvíli mùu svoje poslání dokonèit. U jsem ztratil moc èasu.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jakı rozkaz?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(pro sebe) Oh. Ano. Musím se dostat do mìsta a pozdìji ...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(povzdech) Jenom nevím, jak to splnit vèas.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co já?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(pøemıšlí) Hmm. Proè ne. Ty mùeš doruèit dopis do mìsta.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//To mì dá trochu èasu, abych se mohl podívat po svém vybavení.
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z banditù by mìl mít dopis v kapse.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Dones to Vatrasovi, mágovi Vody ve mìstì. Zastihneš ho v Adanosovì chrámu, kde celı den káe.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Øekni mu, e jsem to nezvládl vèas.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A kdy se zeptá, kde jsem - øekni mu, e míøím na místo setkání.
		b_logentry(TOPIC_ADDON_KDW,"Mága Vody Vatrase mùu najít v pøístavním mìstì Khorinis. Dìlá kázání v Adanosovì chrámu.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//A ještì jedna vìc: Kup si nìjakı vhodnı odìv od farmáøe.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Jinak si budou myslet, e jsi bandita. Tady máš trochu penìz.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
	};
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_SUCCESS;
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS == 0)
	{
		MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_RUNNING;
	};
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_ADDON_CAVALORN_KILLBRAGO);
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_ADDON_CAVALORN_BRAGOKILLED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_bragokilled_condition;
	information = dia_addon_cavalorn_bragokilled_info;
	important = TRUE;
};


func int dia_addon_cavalorn_bragokilled_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bragokilled_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Tak je to odbytı. Hehe. Nemìli si se mnou hrát.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_PCKILLEDBRAGO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_pckilledbrago_condition;
	information = dia_addon_cavalorn_pckilledbrago_info;
	description = "Banditi jsou usmaení.";
};


func int dia_addon_cavalorn_pckilledbrago_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == 0) && Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pckilledbrago_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Banditi jsou usmaení
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_JUNGS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_jungs_condition;
	information = dia_addon_cavalorn_jungs_info;
	description = "Zajímavé brnìní, co nosíš. U nepatøíš ke Stínùm?";
};


func int dia_addon_cavalorn_jungs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_jungs_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Zajímavé brnìní, co nosíš. U nepatøíš ke Stínùm?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Stínové? Ti u neexistují po tom, co padla bariéra.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//V momentì, kdy jsme mohli opustit Hornické údolí, nebyl ádnı dùvod lpìt na tom.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Teï pracuji pro mágy Vody. Patøím do 'Kruhu vody'.
	SC_KNOWSRANGER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Cavalorn mi øekl o tajné gildì, do které sám patøí. O takzvaném 'Kruhu vody'.");
	CAVALORN_RANGERHINT = TRUE;
};


instance DIA_ADDON_CAVALORN_RING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ring_condition;
	information = dia_addon_cavalorn_ring_info;
	permanent = FALSE;
	description = "Øekni mi více o 'Kruhu Vody'.";
};


func int dia_addon_cavalorn_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ring_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Øekni mi více o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nemám povolení se o tom s tebou bavit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Všechno co mùu udìlat, je poslat tì za Vatrasem. Je zástupcem mágù Vody v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Bude nejlepší, kdy si s ním promluvíš. Øekni mu, e jsem tì poslal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Moná, e tì pøijme do Kruhu. Zoufale potøebujeme dobré lidi ...
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Mág Vody Vatras mì mùe pøíjmout do 'Kruhu vody'. Mám se u nìj zastavit a øíct, e mì posílá Cavalorn.");
};


instance DIA_ADDON_CAVALORN_FEINDE(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_feinde_condition;
	information = dia_addon_cavalorn_feinde_info;
	permanent = FALSE;
	description = "Nebyl jsi ty a vaši lidé nepøátelmi mágù Vody?.";
};


func int dia_addon_cavalorn_feinde_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_feinde_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Nebyl jsi ty a vaši lidé nepøátelé mágù Vody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Ta debilní minulost skonèila. U není ádnı "Novı" nebo "Starı" tábor.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Teï - protoe u není ádná trestanecká kolonie, kadı je zodpovìdnı sám za sebe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Mnoho z bıvalıch trestancù je ale poøád ještì stíháno.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Mágové Vody byli schopní pro mì sehnat odpuštìní - take se mùu teï volnì pohybovat.
};


instance DIA_ADDON_CAVALORN_KDWTASK(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_kdwtask_condition;
	information = dia_addon_cavalorn_kdwtask_info;
	permanent = FALSE;
	description = "Co dìlají mágové Vody teï?";
};


func int dia_addon_cavalorn_kdwtask_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_kdwtask_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co dìlají mágové Vody teï?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Jdou po nìèem velkém. Je to o neznámé èásti ostrova.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Neznámá èást? Kde mùe bıt?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nemùu ti øíct víc. Promluv si s Vatrasem v Khorinisu.
};


instance DIA_ADDON_CAVALORN_BROUGHTLETTER(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_broughtletter_condition;
	information = dia_addon_cavalorn_broughtletter_info;
	description = "Dal jsem Vatrasovi tvùj dopis.";
};


func int dia_addon_cavalorn_broughtletter_condition()
{
	if((MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_broughtletter_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Dal jsem Vatrasovi tvùj dopis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Neoèekával jsem od tebe nic jiného. Dìkuju ti.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_CAVALORN_ORNAMENT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_ornament_condition;
	information = dia_addon_cavalorn_ornament_info;
	description = "Hledáš nìco?";
};


func int dia_addon_cavalorn_ornament_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Hledáš nìco?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Tak zøejmé? Ano, poslali mì mágové Vody, abych našel ornamenty.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//To je náhoda. Dostal jsem ten samı úkol od Nefaria.
	if(SC_KNOWSRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Ty tedy patøíš do 'Kruhu vody'?
		if(SC_ISRANGER == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Ano.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Zatím ne, ale pracuji na tom.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To je dobøe. Pak to nemusím dìlat sám.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//U jsi našel ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Našel jsem místo, kde pravdìpodobnì jeden najdeme.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Tyhle kamenné kruhy mùou bıt jedny z tìch stavení, které Nefarius popisoval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Teï potøebujeme jen najít mechanismus.
};


instance DIA_ADDON_CAVALORN_TRIGGERED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_triggered_condition;
	information = dia_addon_cavalorn_triggered_info;
	description = "Aktivoval jsem mechanizmus. Nic se ale nestalo.";
};


func int dia_addon_cavalorn_triggered_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_triggered_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Aktivoval jsem mechanizmus. Nic se ale nestalo.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Potom mìli Lobartovi rolníci pravdu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Øekli, e nìkdo jinı se potloukal okolo tìch kamenù.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Najednou se objevil kamennı stráce a zaútoèil na nì.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farmáøi zavolali pro domobranu, vojáci domobrany paladiny, kteøí pøišli a znièili to monstrum.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//U jsem prohledal celé okolí. Jestli tady byl oranment, mají ho teï paladinové.
	Info_ClearChoices(dia_addon_cavalorn_triggered);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Pak se jeden z nás musí dostat do horní èásti mìsta.",dia_addon_cavalorn_triggered_pal);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Pak za nimi zajdu a získám ornament.",dia_addon_cavalorn_triggered_oback);
};

func void b_cavalorn_triggered_wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Pùjdu teï do mìsta. Setkáme se u Vatrase.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Jeden ze ztracenıch ornamentù mají paladinové ve mìstì.");
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_RUNNING;
	self.flags = 0;
};

func void dia_addon_cavalorn_triggered_oback()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Pak za nimi zajdu a získám ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Dobøe.
	b_cavalorn_triggered_wohin();
};

func void dia_addon_cavalorn_triggered_pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Pak se jeden z nás musí dostat do horní èásti mìsta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//Já na to nemám èas. Musíš to udìlat ty.
	b_cavalorn_triggered_wohin();
};


instance DIA_ADDON_CAVALORN_GOTORNAFROMHAGEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_gotornafromhagen_condition;
	information = dia_addon_cavalorn_gotornafromhagen_info;
	description = "Získal jsem chybìjící ornament od Lorda Hagena.";
};


func int dia_addon_cavalorn_gotornafromhagen_condition()
{
	if(LORD_HAGEN_GOTORNAMENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_gotornafromhagen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Získal jsem chybìjící ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Vidíš? Já vìdìl, e ho paladinové mají.
	b_giveplayerxp(XP_AMBIENT);
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_SUCCESS;
};


instance DIA_ADDON_CAVALORN_WANNALEARN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 7;
	condition = dia_addon_cavalorn_wannalearn_condition;
	information = dia_addon_cavalorn_wannalearn_info;
	permanent = FALSE;
	description = "Mùeš mì nìco nauèit?";
};


func int dia_addon_cavalorn_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Mùeš mì nìco nauèit?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Jasnì. Znám to. Chlape - pronásledovali tì za dobré, co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Nic si nepamatuješ, e?
	CAVALORN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_CAVALORN_TEACH);
};


var int addon_cavalorn_merke_bow;
var int addon_cavalorn_merke_1h;

instance DIA_ADDON_CAVALORN_TEACH(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 8;
	condition = dia_addon_cavalorn_teach_condition;
	information = dia_addon_cavalorn_teach_info;
	permanent = TRUE;
	description = "Chci se nauèit tvoje schopnosti.";
};


func int dia_addon_cavalorn_teach_condition()
{
	if(CAVALORN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_teach_choices()
{
	Info_ClearChoices(dia_addon_cavalorn_teach);
	Info_AddChoice(dia_addon_cavalorn_teach,DIALOG_BACK,dia_addon_cavalorn_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring("Plíení",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_addon_cavalorn_teach_sneak);
	};
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_cavalorn_teach_bow_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_cavalorn_teach_bow_5);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_cavalorn_teach_1h_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_cavalorn_teach_1h_5);
};

func void dia_addon_cavalorn_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chci se nauèit tvoje schopnosti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Jasnì, co chceš vìdìt?
	ADDON_CAVALORN_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	ADDON_CAVALORN_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//S lehkım našlapováním, budeš mít lepší šanci se k nepøíteli dostat nezpozorován.
	};
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_back()
{
	if((ADDON_CAVALORN_MERKE_BOW < other.hitchance[NPC_TALENT_BOW]) || (ADDON_CAVALORN_MERKE_1H < other.hitchance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Mnohem lepší. Zapomnìl jsi hodnì, ale dostaneme tì zpìt do formy.
	};
	Info_ClearChoices(dia_addon_cavalorn_teach);
};

