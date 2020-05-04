
instance DIA_ADDON_GREG_NW_EXIT(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 999;
	condition = dia_addon_greg_nw_exit_condition;
	information = dia_addon_greg_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOGREGNW = TRUE;
};


instance DIA_ADDON_GREG_NW_HALLO(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_hallo_condition;
	information = dia_addon_greg_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_greg_nw_hallo_condition()
{
	if(GREGLOCATION == GREG_FARM1)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Ssst. Hej ty. Pojï sem na chvilku.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//Co se dìje?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Na cestì do mìsta? Na dùleitém úkolu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(slizce) Poslouchej. Vypadáš jako chytrı chlapec. Vsadím se, e se v ivotì dostaneš daleko.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Nedáš se lehce oblbnout. Mùu mluvit pøímo.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Nechtìl by sis vydìlat nìjaké peníze?
	PLAYERTALKEDTOGREGNW = TRUE;
	SC_MEETSGREGTIME = 1;
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Musím jít.",dia_addon_greg_nw_hallo_weg);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Pøestaò kuòkat. Øekni mi co chceš.",dia_addon_greg_nw_hallo_schleim);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Nevypadáš, e bys mìl zlato.",dia_addon_greg_nw_hallo_vorsicht);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Skrıváš se nìkomu?",dia_addon_greg_nw_hallo_hide);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Proè ne?",dia_addon_greg_nw_hallo_ja);
};

func void dia_addon_greg_nw_hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Musím jít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(naštvanì) Take mi nechceš pomoci. Budu si to pamatovat kámo. Uvidíme se znova.
	AI_StopProcessInfos(self);
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_FAILED;
};

func void dia_addon_greg_nw_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Proè ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Musíš prominout starému nevzdìlanému moøskému vlkovi. Jsem tu novı a neznám zákony téhle zemì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Hoøce jsem zjistil, e cestující z daleka nejsou v tomto mìstì vítáni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(alostnì) Teï jsem ale úpnì ztracenı a nemùu se dostat do mìsta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Musím se zùèastnit velice dùleitého obchodu a moji spoleèníci nepøijmou odloení dobøe, jestli víš, co tím myslím.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Mohl bys mi pomoci dostat se pøes tyhle mìstské stráe?
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Podivnı chlap s klípcem na oku se chce dostat do mìsta. Pøedpokládám, e bych ho mìl dostat pøes mìstské stráe.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_RUNNING;
};

func void dia_addon_greg_nw_hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nevypadáš, e by jsi mìl zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(skromnì) Já nemám takové znamosti, jako má sir jako ty.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Jistì neodmítneš menší pøíspìvek, k tvému znaènému bohatství, e ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Dobrá, øekni mi! Mùu se na tebe spoléhnout?
};

func void dia_addon_greg_nw_hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Pøestaò kuòkat. Øekni mi, co chceš.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Vidíš, to je pøesnì to, co mám na mysli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Pár fantaskních slov ti nepomùe.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//Vìdìl jsem hned, e to pùjde. Obchoduji zde s tuhım obchodníkem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//Kdy jsi tak podnikavı, musíš se zajímat o vydìlání trocha prašulí do tvé penìenky.
};

func void dia_addon_greg_nw_hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Schováváš se nìkomu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Nikdy. To je smìšnı. Opravdu rád se schovávám za stromy, aby mi vítr nefoukal pøímo do oblièeje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Tak co to má bıt? Chceš práci?
};


instance DIA_ADDON_GREG_NW_STADTWACHEN(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_stadtwachen_condition;
	information = dia_addon_greg_nw_stadtwachen_info;
	permanent = TRUE;
	description = "O mìstskıch stráích ...";
};


func int dia_addon_greg_nw_stadtwachen_condition()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};


var int dia_addon_greg_nw_stadtwachen_choiceclose_geld;
var int dia_addon_greg_nw_stadtwachen_choiceclose_schein;
var int dia_addon_greg_nw_stadtwachen_choiceclose_constantino;

func void dia_addon_greg_nw_stadtwachen_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//O mìstskıch stráích ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Ano. Máš nápad?
	Info_ClearChoices(dia_addon_greg_nw_stadtwachen);
	Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Musím si to promyslet.",dia_addon_greg_nw_stadtwachen_nochnicht);
	if(DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Co takhle zkusit malı úplatek?",dia_addon_greg_nw_stadtwachen_geld);
	};
	if((DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN == FALSE) && Npc_HasItems(other,itwr_passierschein))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Mám propustku do mìsta.",dia_addon_greg_nw_stadtwachen_schein);
	};
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0) && (DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO == FALSE))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Sbìraèi bylinek jsou vpuštìni.",dia_addon_greg_nw_stadtwachen_constantino);
	};
	if(Npc_HasItems(other,itar_bau_l) || Npc_HasItems(other,itar_bau_m))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"S tímhle farmáøskım odìvem tì pustí do mìsta.",dia_addon_greg_nw_stadtwachen_klamotten);
	};
};

func void dia_addon_greg_nw_stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//S tímhle farmáøskım obleèením tì pustí dovnitø.
	if(Npc_HasItems(other,itar_bau_l))
	{
		b_giveinvitems(other,self,itar_bau_l,1);
	}
	else
	{
		b_giveinvitems(other,self,itar_bau_m,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//To je pøesnì to, co potøebuju. Chlape, vìdìl jsem, e s tebou mùu poèítat.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(šklebí se) V pøevleèení za zdejšího venkovského balíka se na mì nikdo dvakrát nepodívá. Ha ha!
	if(Npc_HasItems(self,itar_bau_l))
	{
		AI_EquipArmor(self,itar_bau_l);
	}
	else
	{
		AI_EquipArmor(self,itar_bau_m);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Super. Vymyslel si to dobøe. Tady je odmìna, kterou jsem slíbil.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	b_giveplayerxp(XP_GREG_NW_GIVEBAUARMOR);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(nespokojenì) Co to ...? 50 mizernıch zlaákù? Chceš mì podvést.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(blahosklonnì) Zlato není všechno pøíteli. Buï šasten s tímto pro tuhle chvíli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//Mám takovı pocit, e se brzy znovu setkáme.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//A kdo ví? Moná budu víc pøipravenı. Mìj se.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	b_logentry(TOPIC_ADDON_GREG_NW,"Dal jsem mu farmáøské obleèení. Mùe se dostat pøes stráe v pøestrojení.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_SUCCESS;
};

func void dia_addon_greg_nw_stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Musím o tom popøemıšlet.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Tak se stane. Ale a ti to netrvá pøíliš dlouho. Nemùu ztratit další èas.
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_nw_stadtwachen_schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//Mám propustku do mìsta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynicky) Jasnì. Budu se tváøit, e jsem obyvatel tohodle poctivého mìsta, mìl bych?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(pohoršenì) Podívej se na mì poøádnì chlapèe. Tady není slepı ebrák, mùu je takhle podvést?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Sbìraèi bylinek jsou vpuštìni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(naštvanì) Co? Vypadám, jako kdy si vykraèuju po lese a sbírám kyièky?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Co takhle malı úplatek?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(rozmarnì) Ano, jestli to bude fungovat, mìl bych to jít zkusit.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD = TRUE;
};


instance DIA_ADDON_GREG_NW_PERM(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_perm_condition;
	information = dia_addon_greg_nw_perm_info;
	permanent = TRUE;
	description = "Ještì jedna vìc ...";
};


func int dia_addon_greg_nw_perm_condition()
{
	if(((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Ještì jedna vìc ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arogantnì) Poslouchej synu. Musím se teï postarat o dùleitı obchod.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(vıhrunì) Pokecáme pozdìji. Pochopils?
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_MEETGREGSECONDTIME(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_meetgregsecondtime_condition;
	information = dia_addon_greg_nw_meetgregsecondtime_info;
	important = TRUE;
};


func int dia_addon_greg_nw_meetgregsecondtime_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_meetgregsecondtime_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Podívejme koho nám koèka pøitáhla.
	if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Venkovského kluka.
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Blázen, kterı se rozhodnul mì odmítnout. Neèekal jsi, e mì uvidíš znova, e?
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(nevrle) Myslel jsem, e mì chceš pomoci. A co jsi udìlal? Prostì odprejsknul.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Myslel jsi, e jsem tam uvízl navdy, eh?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Tady to máš. Pomo si sám, protoe nikdo nepomùe. Znovu se z toho tak lehce nevyvlékneš, chytnu tì teï za slovo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Tak to je, prostì potøebuju nìkoho, jako tebe..
	SC_SAWGREGINTAVERNE = TRUE;
};


instance DIA_ADDON_GREG_NW_WER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wer_condition;
	information = dia_addon_greg_nw_wer_info;
	description = "A kdo vlastnì jsi?";
};


func int dia_addon_greg_nw_wer_condition()
{
	if(GREGLOCATION >= GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//A kdo vlastnì jsi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To není tvoje vìc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Kdybych ti chtìl øíct, kdo jsem, byl bych s tím rychle hotovı, jasné?
};


instance DIA_ADDON_GREG_NW_WAS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_was_condition;
	information = dia_addon_greg_nw_was_info;
	description = "Co ode mì chceš?";
};


func int dia_addon_greg_nw_was_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void b_greg_search_dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Hledám partnera. Nemohl jsem ho najít nikde ve mìstì, a tihle hlupáci beztak nic nevìdí.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Je hubenı, èernovlası a nosí èervené brnìní.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Myslím, e byl vìzeò ve staré kolonii. Myslím, e jeho jméno zaèíná na "D".
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Mu se záplatou na oku hledá nìkoho, jeho jméno zaèíná na 'D'.");
	SC_KNOWSGREGSSEARCHSDEXTER = TRUE;
};

func void dia_addon_greg_nw_was_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Co ode mnì chceš?
	if(MIS_ADDON_GREG_BRINGMETOTHECITY != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//Stále máš problémy s mìstkou stráí?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(útoènì) Mùu ti udìlat problém v minutì ty pitomèe.
	};
	b_greg_search_dexter();
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"Mluvíš o Diegovi?",dia_addon_greg_nw_was_diego);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_addon_greg_nw_was,"Mùe to bıt Dexter?",dia_addon_greg_nw_was_dexter);
	};
	Info_AddChoice(dia_addon_greg_nw_was,"Neznám nikoho, kdo by odpovídal tvému popisu.",dia_addon_greg_nw_was_no);
};

func void dia_addon_greg_nw_was_gregunsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//To mùe bıt jeho jméno, nejsem si jistı.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Musím pravdìpodobnì poèkat, dokud nebudu stát pøed ním.
};

func void dia_addon_greg_nw_was_unnun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Ještì nìco?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(kysele) Jasnì ty hlupáku. Ještì nìco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Potøebuju zbranì. Potøebuju zajištìní. Ani zlato nebude na škodu.
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"Nemùu ti s tím pomoct.",dia_addon_greg_nw_was_nohelp);
	Info_AddChoice(dia_addon_greg_nw_was,"Obstarání? Jsi v hospodì!",dia_addon_greg_nw_was_orlan);
	Info_AddChoice(dia_addon_greg_nw_was,"Zbranì? oldáci mají zbranì.",dia_addon_greg_nw_was_sld);
	Info_AddChoice(dia_addon_greg_nw_was,"Tady je 10 zlaákù.",dia_addon_greg_nw_was_hiergold);
	Info_AddChoice(dia_addon_greg_nw_was,"Nebyli ve mìstì ádní obchodníci se zbranìmi?",dia_addon_greg_nw_was_waffenhaendler);
	Info_AddChoice(dia_addon_greg_nw_was,"Zlato? Všichni chceme zlato.",dia_addon_greg_nw_was_gold);
};

func void dia_addon_greg_nw_was_nohelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nemùu ti s tím pomoci.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(rozlobenì) Je to tak? Ty JENOM nechceš.
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//To je podruhé, co mì necháváš na holièkách.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Dám ti radu. Ujisti se, e se nepotkáme znovu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Zapamatuji si to. Mùeš s tím poèítat.
	};
	MIS_ADDON_GREG_RAKECAVE = LOG_OBSOLETE;
	GREGLOCATION = GREG_BIGCROSS;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};

func void dia_addon_greg_nw_was_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Zlato? Všichni chceme zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Moná. A co s ním udìláš? Promrháš ho na pití a dole v bordelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A ty máš lepší plán, e?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(naštvanì) Budeš se plazit pod skálou, pokud budeš vìdìt o vìcech, co jsem udìlal ve svém ivotì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Nebuï tak blbı, nebo ti budu muset zavøít hubu.
};

func void dia_addon_greg_nw_was_waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Ve mìstì nebyl ádnı obchodník se zbranìmi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Ty musíš vtipkovat, e? Vše co mají je harampádí.
};

func void dia_addon_greg_nw_was_hiergold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Tady je 10 zlaákù.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(smìje se) Ty nešastníku. Nech si svoji almunu. Mám lepší nápad.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Nedaleko je jeskynì! U jsem tam byl a schoval jsem nìjakou sadu na jednotlivıch místech.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Jeskynì je pro mne samotného trochu nebezpeèná. Musíš mi pomoci.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Nabídnul jsem mui se záplatou na oku trochu zlata, ale nechtìl ho. Chce, abych ho následoval do jeho jeskynì.");
	MIS_ADDON_GREG_RAKECAVE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_greg_nw_was);
};

func void dia_addon_greg_nw_was_sld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Zbranì? oldáci mají zbranì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Zajímavé. Slyšel jsem, e Onar, velkostatkáø, najímá oldáky.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(smìje se) To není špatné na suchozemskou krysu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//To není špatnı nápad. Moná bych jim mìl zaplatit za prohlídku.
};

func void dia_addon_greg_nw_was_orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Obstarání? Jsi v hospodì!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten uhozenı hospodskı tì nenechá ani na nic mrknout, dokud mu nezaplatíš.
};

func void dia_addon_greg_nw_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Znám nìkoho, kdo by odpovídal tvému popisu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//Mìl bych to vìdìt.
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Mluvíš o Diegovi.
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Mùe bıt jeho jméno Dexter?
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};


instance DIA_ADDON_GREG_NW_RAKECAVELOS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavelos_condition;
	information = dia_addon_greg_nw_rakecavelos_info;
	description = "Pojïme do té jeskynì.";
};


func int dia_addon_greg_nw_rakecavelos_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavelos_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Pojïme do té jeskynì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Jdeme.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void b_greg_gonow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(komanduje) Na co èekáš? Jdi dovnitø a získej mé cetky.
};


instance DIA_ADDON_GREG_NW_RAKECAVETHERE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavethere_condition;
	information = dia_addon_greg_nw_rakecavethere_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecavethere_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavethere_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Tady pøíteli. To je ta jeskynì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Tady máš krumpáè.
	b_giveinvitems(self,other,itmw_2h_axe_l_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Zahrabal jsem to tam nìkde. Místo jsem oznaèil køíem.
	b_greg_gonow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//A co ty?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Nìkdo ti musí hlídat záda. Teï je to na tobì.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Ten chlap chce, abych se v jeskyni porozhlédl po jeho vìcech. Zahrabal je a místo oznaèil køíem. Také mi dal krumpáè.");
	MIS_ADDON_GREG_RAKECAVE_DAY = Wld_GetDay();
};


instance DIA_ADDON_GREG_NW_RAKECAVEPLUNDERED(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecaveplundered_condition;
	information = dia_addon_greg_nw_rakecaveplundered_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecaveplundered_condition()
{
	if(((MIS_ADDON_GREG_RAKECAVE_DAY <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Co ti tak trvalo? Našel jsi nìco?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Ano. Vykopal jsem tam sáèek se zlatem.",dia_addon_greg_nw_rakecaveplundered_gold);
	};
	Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Ne.",dia_addon_greg_nw_rakecaveplundered_no);
};

func void dia_addon_greg_nw_rakecaveplundered_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Ne.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Dìláš si srandu?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(pøedstírá) Tam OPRAVDU nic nebylo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Zatracenì. Vìdìl jsem to. Tihle chlápci mì za to znovu zbuší.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Tak dobrá. To nevadí, nic se nedìje,prcku. Musím na cestu. Uvidíme se pozdìji.
	AI_StopProcessInfos(self);
	GREGLOCATION = GREG_BIGCROSS;
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};


var int b_greg_rakeplacebriefing_onetime;

func void b_greg_rakeplacebriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobrá. Na malém jezeøe se dvìma vodopády je ostrùvek. Tam by mìl bıt ukrytı další.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//Dále nahoøe na pastvinì jsou další dvì místa, kde jsem nìco ukryl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Jeden flek je tam za farmou a druhı je blízko vchodu do údolí u vodopádù.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//Jsou tam schody vedoucí dolù z polí horního farmáøe k Onarovi.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//V roklinì na dnì schodù je další flek.
	if(b_greg_rakeplacebriefing_onetime == FALSE)
	{
		b_logentry(TOPIC_ADDON_GREG_NW,"Jsou tady další poklady. 1) Na ostrùvku v jezeøe s dvìma vodopády. 2) Nahoøe na pastvinì za farmou. 3) Vedle vchodu do prùsmyku u vodopádù. 4) V kotlinì pod schody. Vedou z náhorní pastviny, k jednomu z velkıch farmáøù. Musím jeho sadu dostat nazpátek. Bude èekat na køiovatce mezi poli.");
		b_greg_rakeplacebriefing_onetime = TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Ano. Vykopal jsem tam sáèek se zlatem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(chamtivì) Dej mi to.
	if(Npc_HasItems(other,itse_goldpocket25) || (Npc_HasItems(other,itmi_gold) >= 25))
	{
		if(b_giveinvitems(other,self,itse_goldpocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Tady máš.
		}
		else if(b_giveinvitems(other,self,itmi_gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Uvnitø bylo 25 zlaákù, tady je máš.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Dobrá, to znamená, e tu stále jsou.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Vypadá to, e jsi nakonec k nìèemu dobrı.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Dobrá, poslouchej. Ukryl jsem toho víc. A ty to pro mì získáš.
		b_greg_rakeplacebriefing();
		GREG_SUCHWEITER = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Poèkám na tebe na køíovatce mezi poli toho velkého farmáøe. Nezklam mì. Mohl bys toho litovat, jasné?
		AI_StopProcessInfos(self);
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_giveplayerxp(XP_ADDON_RAKECAVEPLUNDERED);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//U to nemám.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Nech toho. Nebo to mám z tebe vytøískat?
		AI_StopProcessInfos(self);
		MIS_ADDON_GREG_RAKECAVE = LOG_FAILED;
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_ADDON_GREG_NW_LAKECAVE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 100;
	condition = dia_addon_greg_nw_lakecave_condition;
	information = dia_addon_greg_nw_lakecave_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_greg_nw_lakecave_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (GREG_SUCHWEITER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_lakecave_info()
{
	b_greg_gonow();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_WHERETREASURES(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 10;
	condition = dia_addon_greg_nw_wheretreasures_condition;
	information = dia_addon_greg_nw_wheretreasures_info;
	permanent = TRUE;
	description = "Kdee pøesnì jsi ty vìci ukryl?";
};


func int dia_addon_greg_nw_wheretreasures_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wheretreasures_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Kdee pøesnì jsi ty vìci ukryl?
	b_greg_rakeplacebriefing();
};


instance DIA_ADDON_GREG_NW_PERMTAVERNE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 99;
	condition = dia_addon_greg_nw_permtaverne_condition;
	information = dia_addon_greg_nw_permtaverne_info;
	permanent = TRUE;
	description = "Ještì jedna vìc ...";
};


func int dia_addon_greg_nw_permtaverne_condition()
{
	if(((GREGLOCATION == GREG_BIGCROSS) && (Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS))) || ((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_waswillstdu)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_permtaverne_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Ještì jedna vìc ...
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Nejdøív musíš získat moje ukryté vìci. Pak si mùeme promluvit o jinıch vìcech.
	}
	else if(MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Jsem šastnı, e jsi mi pomohl. To ale neznamená, e jsme teï pøátelé, chápeš?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//U jsme kecali dost.
	};
};


instance DIA_ADDON_GREG_NW_BIGCROSS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_bigcross_condition;
	information = dia_addon_greg_nw_bigcross_info;
	description = "Všechno v poøádku?";
};


func int dia_addon_greg_nw_bigcross_condition()
{
	if((GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_bigcross_info()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED) || (MIS_ADDON_GREG_RAKECAVE == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Koho to tu máme? Nespokojeného.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Všechno v poøádku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Ne doopravdy. oldáci nebyli moc dobrá pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Myslel jsem, e budou mít aspoò nìco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale kdy se ptáš, je to jen banda tupcù a kecalù.
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Tak jak pokraèuje hledání mıch vìcí? U jsi je našel?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Ne, ne všechny.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Tak jdi na to. Nemùe to bıt tak tìké.
		};
	};
};


instance DIA_ADDON_GREG_NW_WHATWANTFROMSLD(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_whatwantfromsld_condition;
	information = dia_addon_greg_nw_whatwantfromsld_info;
	description = "Co jsi chtìl od oldákù?";
};


func int dia_addon_greg_nw_whatwantfromsld_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_whatwantfromsld_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Co jsi chtìl od oldákù?
	if(SC_KNOWSGREGSSEARCHSDEXTER == FALSE)
	{
		b_greg_search_dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//Víš co chci. Jdu po tom døevorubci v èerveném brnìní.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale tihle idioti beztak nic nevìdí.
	};
};


instance DIA_ADDON_GREG_NW_DEXTERFOUND(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_dexterfound_condition;
	information = dia_addon_greg_nw_dexterfound_info;
	description = "Myslím, e hledáš chlápka jménem Dexter.";
};


func int dia_addon_greg_nw_dexterfound_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && ((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_dexterfound_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Myslím, e hledáš chlápka jménem Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Zatracenì. Nevím, jak se jmenuje.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Jenom myslím, e jsem mìl.",dia_addon_greg_nw_dexterfound_weg);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Co takhle, kdyby jsme tam šli spoleènì?",dia_addon_greg_nw_dexterfound_together);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Vím, kde ho mùeš najít.",dia_addon_greg_nw_dexterfound_wo);
};

func void dia_addon_greg_nw_dexterfound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Myslím, e já jo.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
};

func void dia_addon_greg_nw_dexterfound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Vím, kde ho mùeš najít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(pøekvapenì) Opravdu? MLUV!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Nedaleko odtud.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Vypadá to, e je vùdcem hnusné bandy banditù.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sarkasticky se smìje) HAHA. Ano. To je on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Vedìl jsem, e je tady nìkde zalezlı. Ten starı døevorubec.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Vše co musím udìlat, je mrknout se do krysích pelechù a špinavıch dìr v okolí.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Teï ten praseèí mor najdu. U nepotøebuji tvoji pomoc.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_greg_nw_dexterfound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Co kdyby jsme tam šli spoleènì.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Jdu ho vykostit. To mùu udìlat sám.
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter_condition;
	information = dia_addon_greg_nw_caughtdexter_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(øve) Kde je to prase?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kdo? Kapitán? Je tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(øve) Tak mi uhni z cesty.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_ADDON_GREG_NW_WODENNNU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wodennnu_condition;
	information = dia_addon_greg_nw_wodennnu_info;
	important = TRUE;
};


func int dia_addon_greg_nw_wodennnu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wodennnu_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(kysele) Kam pùjde teï?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Byl tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//(komanduje) Tak jdi a najdi ho!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER2(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter2_condition;
	information = dia_addon_greg_nw_caughtdexter2_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter2_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter2_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Dobrá. Dexter je pryè, he?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Vypadá to, e je mrtvı.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Bylo na èase. Zkontroluj, jestli nìco nemá.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_RAVENSLETTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_ravensletter_condition;
	information = dia_addon_greg_nw_ravensletter_info;
	description = "Dexter mìl u sebe jenom tenhle dopis.";
};


func int dia_addon_greg_nw_ravensletter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_caughtdexter2) && Npc_HasItems(other,itwr_ravenskidnappermission_addon) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_ravensletter_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Dexter mìl jenom tenhle dopis.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Uka.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Á, zatracenì. To mi stejnì moc nepomùe.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Nemìli jsme ho nechat odejít jen tak rychle.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Potøebuji vìdìt, jak nìkdo mùe pøejít hory na severo-vıchodì Khorinisu.
	if((nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (saturas_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Moná skrz podzemní tunel. Mágové Vody studují portál, kterı vede do hor na severo-vıchodì.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(nevrle) Co to je za blbost?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(vysmívá se) Hah. Mágové Vody. Nemáš lepší plán, e?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Ne.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(povzdech) Potom jsem tu uvízl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter byla moje poslední nadìje.
};


instance DIA_ADDON_GREG_NW_WASWILLSTDU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_waswillstdu_condition;
	information = dia_addon_greg_nw_waswillstdu_info;
	description = "Co jsi chtìl od Dextera?";
};


func int dia_addon_greg_nw_waswillstdu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_ravensletter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_waswillstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co jsi chtìl od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//Pøišel jsem z míst za horami na severo-vıchodì ostrova. A mám v úmyslu se tam vrátit.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Doufal jsem, e ten darebák zná cestu bez lodi.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(dia_addon_greg_nw_waswillstdu);
	Info_AddChoice(dia_addon_greg_nw_waswillstdu,"Co je na druhé stranì hor?",dia_addon_greg_nw_waswillstdu_da);
	if(skip_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_waswillstdu,"Vidìl jsem piráta jménem Skip nedaleko pøístavu.",dia_addon_greg_nw_waswillstdu_skip);
	};
};

func void dia_addon_greg_nw_waswillstdu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co je na druhé stranì hor??
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Mùu ti doporuèit snad jen to, abys tam nechodil.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Je to tvrdé místo. Slaboch jako ty by tam dlouho nepøeil.
};

func void dia_addon_greg_nw_waswillstdu_skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Vidìl jsem piráta jménem Skip nedaleko pøístavu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Ten idiot. Èekal jsem tam 3 dny. Proè pøijel a teï?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Hned jak se mi vrátí síla, dostane co proto.
	SC_KNOWSCONNECTIONSKIPGREG = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_FOUNDTREASURE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_foundtreasure_condition;
	information = dia_addon_greg_nw_foundtreasure_info;
	permanent = TRUE;
	description = "Našel jsem tvoji zahrabanou soupravu.";
};


func int dia_addon_greg_nw_foundtreasure_condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_foundtreasure_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Našel jsem tvoji zahrabanou soupravu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Mìl bys mít 100 zlaákù, zlatı kalich, støíbrnou vázu a amulet u sebe. Je to moje. Dej mi je.
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Nemám to teï sebou.",dia_addon_greg_nw_foundtreasure_not);
	if((Npc_HasItems(other,itse_goldpocket100) || (Npc_HasItems(other,itmi_gold) >= 100)) && Npc_HasItems(other,itmi_goldcup) && Npc_HasItems(other,itmi_silverchalice) && Npc_HasItems(other,itam_prot_point_01))
	{
		Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Tady jsou tvé vìci.",dia_addon_greg_nw_foundtreasure_ja);
	};
};

func void dia_addon_greg_nw_foundtreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady jsou tvé vìci.
	if(b_giveinvitems(other,self,itse_goldpocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Váèek se 100 zlaáky.
	}
	else if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 zlaákù.
	};
	if(b_giveinvitems(other,self,itmi_goldcup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlatı kalich.
	};
	if(b_giveinvitems(other,self,itmi_silverchalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Støíbrná mísa.
	};
	if(b_giveinvitems(other,self,itam_prot_point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//Amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dobøe. Máš šestí, e nejsi dostateènì blbı, abys s tím utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady máš díl na koøisti.
	b_giveinvitems(self,other,itmi_gold,30);
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	MIS_ADDON_GREG_RAKECAVE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GREG_RAKECAVE);
};

func void dia_addon_greg_nw_foundtreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nemám to sebou.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak ty vìci získej, nebo se rozlobím.
	AI_StopProcessInfos(self);
};

