
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
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tady d�l�? To je p�ekvapen�.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myslel jsem, �e t� zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Skoro.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Byl kolem tebe velk� poprask, v� to? Nemohl jsem Saturase v�bec poznat, byl vzteky bez sebe.
};


instance DIA_ADDON_NEFARIUS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_keineahnung_condition;
	information = dia_addon_nefarius_keineahnung_info;
	description = "Co je to za port�l?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Co je to za port�l?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//P�edpokl�d�me, �e vede do ztracen�ho �dol�, ve kter�m jsou postavena m�sta star�ch kultur.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ten k�men za port�lem je z masivn� sk�ly.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Nen� tu ani zm�nka o teleporta�n� magii. Velmi z�hadn� ...
};


instance DIA_ADDON_NEFARIUS_WIEMECHANIK(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_wiemechanik_condition;
	information = dia_addon_nefarius_wiemechanik_info;
	description = "V�te, jak ho aktivovat?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//V�te, jak ho aktivovat?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z t�ch chyb�j�c�ch ornament� vypad� jakou n�jak� druh kl��e.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Budeme pot�ebovat krou�ek, abychom se dostali d�l.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Mus� sed�t t�mhle do t� jamky vedle port�lu.
};


instance DIA_ADDON_NEFARIUS_SCBRINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_scbringornaments_condition;
	information = dia_addon_nefarius_scbringornaments_info;
	description = "M�m tady ��st ornamentu.";
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
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(nad�en�) Fakt? Tak to je perfektn�.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//M� n�jak� vod�tko, kter� by mi pomohlo naj�t ty ostatn� ��sti?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Podle tady toho n�pisu se rozbil na �ty�i ��sti.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//A vypad� to, jako by byly st�le je�t� tady na tomhle ostrov�.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Merdarion mi pomohl p�elo�it n�co z t�ch n�pis� tady.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Je tam n�jak� stopa, podle kter� by se daly ty ��sti naj�t.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Tady. Na t�hle map� jsem ozna�il n�jak� m�sta.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon,1);
	b_giveinvitems(self,other,itwr_map_newworld_ornaments_addon,1);
	MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"M�gov� Vody na�li port�l, kter� pr� vede do neprob�dan�ch oblast� Khorinisu.");
	b_logentry(TOPIC_ADDON_ORNAMENT,"Nefarius pl�nuje aktivovat port�l s pomoc� ornamentov�ho kruhu. St�le je�te pot�ebuje 3 ��sti ke slo�en� kruhu. M�m ukolem je mu je don�st. Dal mi mapu s ozna�en�mi m�sty, kde p�edpokl�d�, �e by zbyl� ��sti m�ly b�t.");
	b_startotherroutine(bau_4300_addon_cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Porozhl�dni se tam.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//M�l bys ses hlavn� zam��it na star� budovy a struktury. M�l bys je poznat na prvn� pohled.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//M��e to b�t cokoliv - bludn� balvan, kamenn� kruh, mauzoleum ... prost� n�co takov�ho.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale pro� ti to vlastn� ��k�m. Stejn� to najde�. Hodn� zdaru.
};


instance DIA_ADDON_NEFARIUS_WHYPORTALCLOSED(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_whyportalclosed_condition;
	information = dia_addon_nefarius_whyportalclosed_info;
	description = "Pro� se ten ornament rozbil?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Pro� se ten ornament rozbil?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//A� u� to ud�lal kdokoli, cht�l zabr�nit tomu, aby byl port�l znovu aktivov�n.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//��m v�ce si prohl��m tyto n�pisy, t�m v�c pozn�v�m, �e kn�� star� kultury, nebyli v�bec ��dn� hlup�ci.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Museli m�t dobr� d�vod, aby tu oblast za port�lem uchovali uzav�enou.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nev�me, co n�s tam m��e �ekat. Ale ur�it� to nen� nic dobr�ho ...
};


instance DIA_ADDON_NEFARIUS_MISSINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_missingornaments_condition;
	information = dia_addon_nefarius_missingornaments_info;
	permanent = TRUE;
	description = "Ohledn� t�ch ��st� ...";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Ohledn� t�ch ��st� ...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//(s nad�j� v hlase) Ano?
	if(Npc_HasItems(other,itmi_ornament_addon) >= 1)
	{
		missingornamentscount = Npc_HasItems(other,itmi_ornament_addon);
		if(missingornamentscount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Tady. M�m dal��.
			b_giveplayerxp(XP_ADDON_BRINGMISSINGORNAMENT);
			Npc_RemoveInvItems(other,itmi_ornament_addon,1);
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Na�el jsem je.
			Npc_RemoveInvItems(other,itmi_ornament_addon,missingornamentscount);
			concattext = ConcatStrings(IntToString(missingornamentscount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			xp_addon_bringmissingornaments = missingornamentscount * XP_ADDON_BRINGMISSINGORNAMENT;
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + missingornamentscount;
			b_giveplayerxp(xp_addon_bringmissingornaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//Perfektn�.
		if(MISSINGORNAMENTSCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Ale po��d je�t� dva chyb�. Snad je tak� najde�.
		}
		else if(MISSINGORNAMENTSCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//U� jen jeden, pak je budeme m�t v�echny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Kone�n� jsou v�echny. Te� u� je jen spojit.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Abychom v�ak ty ��sti mohli op�t spojit v kruh, mus�me spojit i na�e s�ly.
			MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Tady. N�jak� zla��ky za tv� �sil�.
		missingornamentsgeld = missingornamentscount * ADDON_NEFARIUSSMISSINGORNAMENTSOFFER;
		CreateInvItems(self,itmi_gold,missingornamentsgeld);
		b_giveinvitems(self,other,itmi_gold,missingornamentsgeld);
		if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Poj� za mnou!
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
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Dohromady �ty�i ...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Ostatn� bys m�l naj�t tam, kde jsem ti to ozna�il na map�.
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
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//Te� ustup.
	Npc_SetRefuseTalk(self,60);
	RITUALRINGRUNS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Donesl jsem Nefariovi v�echny ztracen� ��sti ornamentu. M�gov� Vody je cht�j� slo�it zp�t do kruhu.");
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
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Proto�e si n�m p�inesl nepostradateln� ��sti, m�l bys tedy vlo�it ornament do port�lu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//�ekni Saturasovi, a� ti d� ten ornamentov� kruh.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Potom se snad port�l otev�e.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Start");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Start");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Start");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Start");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Start");
	RITUALRINGRUNS = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Ornamentov� kruh je zase slo�en�. Vzal jsem si ho od Saturase.");
};


instance DIA_ADDON_NEFARIUS_OPENEDPORTAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_openedportal_condition;
	information = dia_addon_nefarius_openedportal_info;
	description = "Co d�l?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//Co d�l?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co �ek�? Jdi a otev�i ten port�l.
};

