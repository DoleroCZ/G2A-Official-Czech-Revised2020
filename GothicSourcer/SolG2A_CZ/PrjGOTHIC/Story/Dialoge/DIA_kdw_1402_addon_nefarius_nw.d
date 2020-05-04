
instance DIA_ADDON_NEFARIUS_EXIT(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 999;
	condition = dia_addon_nefarius_exit_condition;
	information = dia_addon_nefarius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_nefarius_exit_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_NEFARIUS_HALLO(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_hallo_condition;
	information = dia_addon_nefarius_hallo_info;
	description = "Tak co?";
};


func int dia_addon_nefarius_hallo_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Tak co?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tady dÏl·ö? To je p¯ekvapenÌ.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myslel jsem, ûe tÏ zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Skoro.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Byl kolem tebe velk˝ poprask, vÌö to? Nemohl jsem Saturase v˘bec poznat, byl vzteky bez sebe.
};


instance DIA_ADDON_NEFARIUS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_keineahnung_condition;
	information = dia_addon_nefarius_keineahnung_info;
	description = "Co je to za port·l?";
};


func int dia_addon_nefarius_keineahnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Co je to za port·l?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//P¯edpokl·d·me, ûe vede do ztracenÈho ˙dolÌ, ve kterÈm jsou postavena mÏsta star˝ch kultur.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ten k·men za port·lem je z masivnÌ sk·ly.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//NenÌ tu ani zmÌnka o teleportaËnÌ magii. Velmi z·hadnÈ ...
};


instance DIA_ADDON_NEFARIUS_WIEMECHANIK(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_wiemechanik_condition;
	information = dia_addon_nefarius_wiemechanik_info;
	description = "VÌte, jak ho aktivovat?";
};


func int dia_addon_nefarius_wiemechanik_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_wiemechanik_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//VÌte, jak ho aktivovat?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z tÏch chybÏjÌcÌch ornament˘ vypad· jakou nÏjak˝ druh klÌËe.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Budeme pot¯ebovat krouûek, abychom se dostali d·l.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//MusÌ sedÏt t·mhle do tÈ jamky vedle port·lu.
};


instance DIA_ADDON_NEFARIUS_SCBRINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_scbringornaments_condition;
	information = dia_addon_nefarius_scbringornaments_info;
	description = "M·m tady Ë·st ornamentu.";
};


func int dia_addon_nefarius_scbringornaments_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_scbringornaments_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Nesu kousek toho ornamentu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(nadöenÏ) Fakt? Tak to je perfektnÌ.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//M·ö nÏjakÈ vodÌtko, kterÈ by mi pomohlo najÌt ty ostatnÌ Ë·sti?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Podle tady toho n·pisu se rozbil na Ëty¯i Ë·sti.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//A vypad· to, jako by byly st·le jeötÏ tady na tomhle ostrovÏ.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Merdarion mi pomohl p¯eloûit nÏco z tÏch n·pis˘ tady.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Je tam nÏjak· stopa, podle kterÈ by se daly ty Ë·sti najÌt.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Tady. Na tÈhle mapÏ jsem oznaËil nÏjak· mÌsta.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon,1);
	b_giveinvitems(self,other,itwr_map_newworld_ornaments_addon,1);
	MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"M·govÈ Vody naöli port·l, kter˝ pr˝ vede do neprob·dan˝ch oblastÌ Khorinisu.");
	b_logentry(TOPIC_ADDON_ORNAMENT,"Nefarius pl·nuje aktivovat port·l s pomocÌ ornamentovÈho kruhu. St·le jeöte pot¯ebuje 3 Ë·sti ke sloûenÌ kruhu. M˝m ukolem je mu je donÈst. Dal mi mapu s oznaËen˝mi mÌsty, kde p¯edpokl·d·, ûe by zbylÈ Ë·sti mÏly b˝t.");
	b_startotherroutine(bau_4300_addon_cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//PorozhlÈdni se tam.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//MÏl bys ses hlavnÏ zamÏ¯it na starÈ budovy a struktury. MÏl bys je poznat na prvnÌ pohled.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//M˘ûe to b˝t cokoliv - bludn˝ balvan, kamenn˝ kruh, mauzoleum ... prostÏ nÏco takovÈho.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale proË ti to vlastnÏ ¯Ìk·m. StejnÏ to najdeö. HodnÏ zdaru.
};


instance DIA_ADDON_NEFARIUS_WHYPORTALCLOSED(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_whyportalclosed_condition;
	information = dia_addon_nefarius_whyportalclosed_info;
	description = "ProË se ten ornament rozbil?";
};


func int dia_addon_nefarius_whyportalclosed_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_scbringornaments))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_whyportalclosed_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//ProË se ten ornament rozbil?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Aù uû to udÏlal kdokoli, chtÏl zabr·nit tomu, aby byl port·l znovu aktivov·n.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//»Ìm vÌce si prohlÌûÌm tyto n·pisy, tÌm vÌc pozn·v·m, ûe knÏûÌ starÈ kultury, nebyli v˘bec û·dnÌ hlup·ci.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Museli mÌt dobr˝ d˘vod, aby tu oblast za port·lem uchovali uzav¯enou.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//NevÌme, co n·s tam m˘ûe Ëekat. Ale urËitÏ to nenÌ nic dobrÈho ...
};


instance DIA_ADDON_NEFARIUS_MISSINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_missingornaments_condition;
	information = dia_addon_nefarius_missingornaments_info;
	permanent = TRUE;
	description = "OhlednÏ tÏch Ë·stÌ ...";
};


func int dia_addon_nefarius_missingornaments_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int missingornamentscounter;
const int ADDON_NEFARIUSSMISSINGORNAMENTSOFFER = 100;

func void dia_addon_nefarius_missingornaments_info()
{
	var int missingornamentscount;
	var int xp_addon_bringmissingornaments;
	var int missingornamentsgeld;
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//OhlednÏ tÏch Ë·stÌ ...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//(s nadÏjÌ v hlase) Ano?
	if(Npc_HasItems(other,itmi_ornament_addon) >= 1)
	{
		missingornamentscount = Npc_HasItems(other,itmi_ornament_addon);
		if(missingornamentscount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Tady. M·m dalöÌ.
			b_giveplayerxp(XP_ADDON_BRINGMISSINGORNAMENT);
			Npc_RemoveInvItems(other,itmi_ornament_addon,1);
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Naöel jsem je.
			Npc_RemoveInvItems(other,itmi_ornament_addon,missingornamentscount);
			concattext = ConcatStrings(IntToString(missingornamentscount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			xp_addon_bringmissingornaments = missingornamentscount * XP_ADDON_BRINGMISSINGORNAMENT;
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + missingornamentscount;
			b_giveplayerxp(xp_addon_bringmissingornaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//PerfektnÌ.
		if(MISSINGORNAMENTSCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Ale po¯·d jeötÏ dva chybÌ. Snad je takÈ najdeö.
		}
		else if(MISSINGORNAMENTSCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Uû jen jeden, pak je budeme mÌt vöechny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//KoneËnÏ jsou vöechny. TeÔ uû je jen spojit.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Abychom vöak ty Ë·sti mohli opÏt spojit v kruh, musÌme spojit i naöe sÌly.
			MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Tady. NÏjakÈ zlaù·ky za tvÈ ˙silÌ.
		missingornamentsgeld = missingornamentscount * ADDON_NEFARIUSSMISSINGORNAMENTSOFFER;
		CreateInvItems(self,itmi_gold,missingornamentsgeld);
		b_giveinvitems(self,other,itmi_gold,missingornamentsgeld);
		if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//PojÔ za mnou!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			b_startotherroutine(kdw_1400_addon_saturas_nw,"PreRingritual");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"PreRingritual");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"PreRingritual");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"PreRingritual");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Kolik jich bylo?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Dohromady Ëty¯i ...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//OstatnÌ bys mÏl najÌt tam, kde jsem ti to oznaËil na mapÏ.
	};
};


instance DIA_ADDON_NEFARIUS_RINGRITUAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritual_condition;
	information = dia_addon_nefarius_ringritual_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritual_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritual_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//TeÔ ustup.
	Npc_SetRefuseTalk(self,60);
	RITUALRINGRUNS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Donesl jsem Nefariovi vöechny ztracenÈ Ë·sti ornamentu. M·govÈ Vody je chtÏjÌ sloûit zpÏt do kruhu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Ringritual");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Ringritual");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Ringritual");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Ringritual");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Ringritual");
};


instance DIA_ADDON_NEFARIUS_RINGRITUALENDS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritualends_condition;
	information = dia_addon_nefarius_ringritualends_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritualends_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RITUALRINGRUNS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritualends_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Ornamenty byly spojeny.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Protoûe si n·m p¯inesl nepostradatelnÈ Ë·sti, mÏl bys tedy vloûit ornament do port·lu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//ÿekni Saturasovi, aù ti d· ten ornamentov˝ kruh.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Potom se snad port·l otev¯e.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Start");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Start");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Start");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Start");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Start");
	RITUALRINGRUNS = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Ornamentov˝ kruh je zase sloûen˝. Vzal jsem si ho od Saturase.");
};


instance DIA_ADDON_NEFARIUS_OPENEDPORTAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_openedportal_condition;
	information = dia_addon_nefarius_openedportal_info;
	description = "Co d·l?";
};


func int dia_addon_nefarius_openedportal_condition()
{
	if(RITUALRINGRUNS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_openedportal_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//Co d·l?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co Ëek·ö? Jdi a otev¯i ten port·l.
};

