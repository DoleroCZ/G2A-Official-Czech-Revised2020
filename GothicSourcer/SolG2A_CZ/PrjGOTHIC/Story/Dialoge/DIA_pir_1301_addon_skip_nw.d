
instance DIA_ADDON_SKIP_NW_EXIT(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 999;
	condition = dia_addon_skip_nw_exit_condition;
	information = dia_addon_skip_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOSKIPNW = TRUE;
};


instance DIA_ADDON_SKIP_NW_HALLO(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 1;
	condition = dia_addon_skip_nw_hallo_condition;
	information = dia_addon_skip_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_skip_nw_hallo_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//(podrádìnì) Tady jsi, koneènì. Èekal jsem tu hodiny.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(zmatenì) Poèkat. Ty nakonec nejsi obchodník z mìsta, e?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//(kysele) Kde je Baltram?
};


instance DIA_ADDON_SKIP_NW_WERBISTDU(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_werbistdu_condition;
	information = dia_addon_skip_nw_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_addon_skip_nw_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nevím, co ti je do toho. Ale ... pokud to chceš opravdu vìdìt, moje jméno je Skip. Zazvonil nìjakı zvonec?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//(jako kdyby nepochopil) Kdo?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Neøíkej mi, e jsi neslyšel jméno Skip. Boe, odkud vlastnì jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jsem jeden z nejhledanìjších kriminálníkù v Khorinisu. Já a mí hoši jsme se plavili tìmito vodami okolo tohoto ostrùvku po mnoho let.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//(pobouøenì) U jsi o tom musel slyšet.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Ty jsi pirát.",dia_addon_skip_nw_werbistdu_pirat);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Mìl bych tì znát?",dia_addon_skip_nw_werbistdu_keineahnung);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Ano, jasnì. U si vzpomínám.",dia_addon_skip_nw_werbistdu_ja);
};

func void dia_addon_skip_nw_werbistdu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ano, jasnì. U si vzpomínám.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//(uasle) Èestnì? Ty u jsi o mì slyšel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Oh do prdele! Uvaoval jsem, jestli se nemám potloukat okolo mìsta.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Pak je štìstí, e jsem to neudìlal.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Domobrana by mì rychle nìkam zamkla.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Ty jsi mì nepøišel uvìznit, e?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Nooooo ...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Vìø mi, to není moudré. Kdokoli, kdo si zaène se starım Skipem skonèí jako krmivo pro ryby.
	};
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_keineahnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Mìl bych tì znát?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Dej bacha na to, co øíkáš chlapèe, nebo poznáš nepøátelskou stranu starého Skipa.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ty jsi pirát.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//(rozlobenì) Ano, zatracenì. Nemùeš to øíct? A rozlobennı z toho.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Mùu kousat do fošen jenom z nudy.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};


instance DIA_ADDON_SKIP_NW_BALTRAM(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_baltram_condition;
	information = dia_addon_skip_nw_baltram_info;
	description = "Baltram? Èekáš na obchodníka?";
};


func int dia_addon_skip_nw_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_baltram_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? Èekáš na obchodníka?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Ty jsi mi ale chytrı, e?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//To jsem øekl, nebo ne?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Vypadá to, e tenhle špatnı podomní obchodník na mì zapomnìl.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Rád bych na nìj poloil své ruce, to ti øeknu.
	Log_CreateTopic(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Pirát Skip mi øekl, e mìstskı obchodník Baltram dìlá obchody s piráty.");
	SCKNOWSBALTRAMASPIRATETRADER = TRUE;
};


instance DIA_ADDON_SKIP_BALTRAMPAKET(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_baltrampaket_condition;
	information = dia_addon_skip_baltrampaket_info;
	description = "Mám pro tebe balík od Baltrama.";
};


func int dia_addon_skip_baltrampaket_condition()
{
	if((MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skip_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co? Teï posílá poslíèka?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Zdìsil se, e? Hehe, jo, co jiného jsem taky mohl èekat od všivého obchodníka?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Øíkal, e za to chce 3 láhve rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(smìje se) To by se mu líbilo, huh? Nechal mì tu èekat navdy, nepøišel k èlovìku, kterému na tom záleelo.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Tady, dej mu 2 láhve. Ta nula teï bude šastná.
	CreateInvItems(self,itfo_addon_rum,2);
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_NW_WOHER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_woher_condition;
	information = dia_addon_skip_nw_woher_info;
	description = "Odkud jsi pøišel?";
};


func int dia_addon_skip_nw_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_woher_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Odkud jsi pøišel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chceš vìdìt, kde máme skrıš?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Proè bych to mìl øíkat chlapovi z domobrany jen tak?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Kdy ti to øeknu, bude to jako, kdybych se šel do Khorinisu dobrovolnì vzdát.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//To ti nepomùe, pokud jsi pomıšlel o našem narušení.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Ostrov Khorinis je velkı a to, kde jsme my, je pro ostatní nepøístupné tak jako tak. Jestlie nemáš loï.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Ani pak, musíš znát cestu skrz útesy. Nikdo se pøes nì nedostal, pokud neznali tajnou cestu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Jsou jen dva lidé, kteøí znají cestu a ty nejsi jeden z nich.
};


instance DIA_ADDON_SKIP_SCSAWGREG(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_scsawgreg_condition;
	information = dia_addon_skip_scsawgreg_info;
	description = "Znáš nìkoho se záplatou na oku?";
};


func int dia_addon_skip_scsawgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (SC_KNOWSCONNECTIONSKIPGREG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_scsawgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Znáš nìkoho se záplatou na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Znám mnoho muù se záplatou na oku.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Tady je nìkdo, kdo se potuluje po Khorinisu, a vypadá to, e tì dobøe zná.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Nedovedu si to pøedstavit. Lidé, které znám nejsou farmáøi.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale ...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Nech to bejt, opravdu mì to nezajímá.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SKIP_NW_MISSINGPEOPLE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_missingpeople_condition;
	information = dia_addon_skip_nw_missingpeople_info;
	description = "Spousta lidí z mìsta zmizela. A spouta lidí øíká, e ty v tom máš taky prsty.";
};


func int dia_addon_skip_nw_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Spousta lidí z mìsta zmizela. A spouta lidí øíká, e ty v tom máš taky prsty.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//(cítí se bezradnı) Er ... zatracenì. Ale není to tak, jak si myslíš.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Vypadám jako otrokáø? Ne, já pøeváím vìci. Co je to za vìci, nebo odkud jsou, není moje vìc.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Pøeváíme všechny moné vìci pro ty prasata.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na zaèátku to bylo jenom obyèejné zboí. Jasnì, bylo to pašované zboí.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Poté ale zaèali unášet lidi z mìsta. Nevím, co od nich chtìli.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Prostì jsme je pøeplavili.
};


instance DIA_ADDON_SKIP_NW_DEXTER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_dexter_condition;
	information = dia_addon_skip_nw_dexter_info;
	description = "O kom mluvíš?";
};


func int dia_addon_skip_nw_dexter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_dexter_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//O kom mluvíš?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//O banditech chlape. Kdo jinı? Ta spodina, která se teï rozlézá po celé zemi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//A není to jen okolo Khorinisu.
};

func void b_skip_saysdextersname()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Vzpomnìl jsem si na jeho jméno. Dexter. Ano, myslím, e jeho jméno je Dexter.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Zmizelí lidé byli uneseni bandity na pøíkaz vùdce banditù Dextera. Øíká se, e se skrıvá nìkde na západì od Onarovy farmy.");
	SC_KNOWSDEXTERASKIDNAPPER = TRUE;
	RANGER_SCKNOWSDEXTER = TRUE;
};


instance DIA_ADDON_SKIP_NW_NAME(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_name_condition;
	information = dia_addon_skip_nw_name_info;
	description = "Bandité! To nestaèí. Chci jména ...";
};


func int dia_addon_skip_nw_name_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_dexter) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_name_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Bandité! To nestaèí. Chci jména ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Jména? Chceš vìdìt, kdo je hlava banditù? Zatracenì, jak se to psisko vlastnì jmenovalo ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Hhm. Nemùu si vzpomenout na jméno toho chlapa. I kdy myslím, e to bylo lehké na zapamatování.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale mùu ti ukázat, kde najít velitele banditù v této èásti ostrova.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Máš s sebou dobrou mapu?
	if(Npc_HasItems(other,itwr_map_newworld) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Tady, mám mapu.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//U to bylo oznaèeno. Je to sranda ti nièit mapu.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Ne.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//Tak ti to mám tedy popsat?
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Daleko na vıchodì je rozlehlá farma. Myslím, e farmáø se jmenuje Onar.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Má tam pìknì velká pole. Na západì od tìch polí je malá pevnost na vršku vysokého útesu.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//A tam je tvùj mu.
		b_skip_saysdextersname();
	};
};


instance DIA_ADDON_SKIP_NW_LANDKARTE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_landkarte_condition;
	information = dia_addon_skip_nw_landkarte_info;
	description = "Tady, mám mapu.";
};


func int dia_addon_skip_nw_landkarte_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_name) && Npc_HasItems(other,itwr_map_newworld) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_landkarte_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Tady, mám mapu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//To je dobøe. Vyznaèím ti, kde asi ten chlap pobıvá.
	b_giveinvitems(other,self,itwr_map_newworld,1);
	b_skip_saysdextersname();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Tady. Tvoje mapa.
	Npc_RemoveInvItems(self,itwr_map_newworld,1);
	CreateInvItems(self,itwr_map_newworld_dexter,1);
	b_giveinvitems(self,other,itwr_map_newworld_dexter,1);
};


instance DIA_ADDON_SKIP_NW_WOHIN(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 99;
	condition = dia_addon_skip_nw_wohin_condition;
	information = dia_addon_skip_nw_wohin_info;
	permanent = TRUE;
	description = "Kam jsi odvezl lidi?";
};


func int dia_addon_skip_nw_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_wohin_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Kam jsi odvezl lidi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//U jsem ti øekl, e ti neøeknu, kde máme pøístav.
};

