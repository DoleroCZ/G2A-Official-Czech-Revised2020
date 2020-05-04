
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Vítej v mém obchodì, cizinèe.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jmenuji se Bosper. Vyrábím luky a obchoduji s koešinami.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co tì pøivádí do Khorinisu?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Bosper vyrábí luky a obchoduje s kùemi. Jeho obchod najdu v dolní èásti mìsta, u jiní brány.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "Musím se dostat do horní ètvrti.";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Musím se dostat do horní ètvrti.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam, kde sídlí paladinové? Tak na to rovnou zapomeò.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Nejdøív se musíš stát ctihodnım mìšanem, nebo si aspoò najít slušné zamìstnání.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Jako cizinec se tam rozhodnì dostat nemùeš.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//To jsem taky zjistil.
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Pokud se chci dostat do horní ètvrti, musím se stát buïto váenım obèanem, nebo si najít práci.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "Hledám práci!";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Hledám práci!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Hmm - novı uèedník by se mi hodil.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Ten poslední to vzdal zrovna pøedevèírem.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Víš aspoò nìco o lovu?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Noooo...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Mùu tì nauèit, jak stahovat zvíøata.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Za kadou kùi, kterou mi pøineseš, ti dobøe zaplatím.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Mùu ti dát pár kùí, jestli o nì máš zájem.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Vıbornì! Pøines mi tolik zvíøecích kùi, kolik mùeš - koupím je od tebe za dobrou cenu.
	};
	b_logentry(TOPIC_LEHRLING,"Bosper hledá nového uèedníka - mohl bych u nìj zaèít pracovat.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "Chci se stát tvım uèedníkem!";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chci se stát tvım uèedníkem!
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(zakøení se) Skvìlé! Øekl bych, e základy u máš.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad si myslí, e jsi dobrı èlovìk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Ale Harad není o tvıch schopnostech zrovna pøesvìdèen.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad tì prı ještì nikdy nevidìl.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben ti dal své poehnání. Já sice nejsem tak pobonı, ale váím si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben ti dá poehnání jen tehdy, pokud si vyprosíš boí smilování.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben nemá ponìtí, kdo jsi.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino prohlašuje, e se mùeš zapsat, u koho chceš
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino prohlašuje, es byl obvinìnı ze zloèinu - doufám, e šlo jen o nìjakou banalitu.
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Sna se to co nejdøív urovnat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino o tobì ještì ani neslyšel.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//A Matteo praví, e by tì mìli vyvaovat zlatem.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//A Matteo se zmínil o nìjaké pùjèce - a u tím myslel cokoliv, mìl by sis s ním radši promluvit.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo tvrdí, e s tebou o téhle vìci zatím nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo tvrdí, e tì ještì nikdy v ivotì nevidìl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//To znamená, es získal doporuèení ode všech mistrù!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Nyní tì doporuèují ètyøi mistøi - to postaèí, abys mohl k nìkomu vstoupit do uèení.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Mùeš pro mì zaèít pracovat, kdykoliv budeš chtít.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Dobøe - rozmyslím si to.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"Jdu do toho!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Chceš-li k nìkomu v dolní èásti mìsta vstoupit do uèení, potøebuješ souhlas alespoò ètyø mistrù.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Take by sis mìl promluvit se všemi, kteøí ti zatím souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Ještì ne tì pøijmu, musím samozøejmì vìdìt, jestli jsi aspoò k nìèemu dobrı.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Vrátil jsi mi mùj luk, ale to o tvém loveckém talentu moc nevypovídá.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nebudeš toho litovat! Myslím, e se nám bude dobøe spolupracovat.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	Npc_ExchangeRoutine(lothar,"START");
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Bosper mì pøijal za uèedníka. Nyní mám pøístup do horní ètvrti.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Dobøe - rozmyslím si to.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Jen se nerozhodni špatnì! Byl bys pro mì úplnì ideální.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "Co kdy se budu chtít zapsat u nìkterého z ostatních mistrù?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//Co kdy se budu chtít zapsat u nìkterého z ostatních mistrù?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(mrzutì) Nesmysl!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad a Matteo u uèedníky mají.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchymista Constantino je starı samotáø - ten ádného uèedníka nepøijal u celé roky.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//A co se tıèe Thorbena, tak o nìm kadı ví, e je úplnì švorc - nejspíš by ti nemohl zaplatit ani mìïák.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Ovšem já velmi nutnì potøebuji uèedníka - a taky dobøe platím.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale a u se chceš zapsat u kohokoliv, budeš k tomu potøebovat souhlas všech ostatních mistrù z dolní èásti mìsta.
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "Proè to tvùj minulı uèedník vzdal?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Proè to tvùj minulı uèedník vzdal?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Nechal se slyšet, e je tu poslední dobou pøíliš nebezpeèno.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Jestli tì to ale opravdu zajímá, mùeš se ho zeptat sám.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Jmenuje se Bartok a nejspíš se bude potloukat kolem Coragonovy krèmy.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Kdy z kovárny vyjdeš podchodem, ocitneš se skoro pøímo pøed hospodou.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "Dáš mi svùj souhlas, abych se mohl zapsat u jiného mistra?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Dáš mi svùj souhlas, abych se mohl zapsat u jiného mistra?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(zklamanì) Doufal jsem, e se rozhodneš pro mì.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale kdy to chceš takhle...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Tím mi chceš naznaèit, e mì nedoporuèíš?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Kdy ostatní mistøi nebudou proti, pak ano.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Kdy u nic jiného, aspoò jsi mi vrátil luk.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale urèitì by z tebe byl dobrı lovec.
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Bosper mi dá doporuèení, kdy se budu chtít stát uèedníkem u nìkoho jiného.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(povzdychne si) No dobøe! Pøimluvím se za tebe - ale s jednou podmínkou.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj pro mì, alespoò chvíli.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Tak zjistíš, jestli se ti moje øemeslo zamlouvá, nebo ne.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kdo ví - moná se ti zalíbí natolik, e zùstaneš u mì.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//A kdy jsi dost dobrı, abych tì pøijal JÁ, urèitì si povedeš dobøe i u ostatních.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "Co mám pro tebe udìlat?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co mám pro tebe udìlat?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Nauèím tì, jak stahovat kùi ze zvíøat, a ty mi pak pøineseš, øeknìme, pùl tuctu vlèích kùí.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Bosper mì nauèí stahovat zvíøecí kùe.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Pøines mi pùl tuctu vlèích kùí.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Tak poznám, e ses své øemeslo nauèil.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Pokud ti to nepotrvá vìènost a jestli ty kùe budou ve slušném stavu, pøijmu tì, kdy budeš chtít.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Nebo (povzdech) mùeš zaèít u nìkterého z ostatních mistrù - budeš-li si to opravdu pøát.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"Musím Bosperovi pøinést šest vlèích kùí - pak pro nìj budu moci pracovat, nebo mì doporuèí, abych mohl vstoupit do uèení u jiného mistra.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"Mìl bych ho pøimìt, aby mì nauèil stahovat zvíøecí kùe.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "Co se tıèe tìch vlèích kùí...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Co se tıèe tìch vlèích kùí...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//U jsi vstoupil do uèení k jinému mistrovi. Kùe od tebe proto odkoupím u jenom za bìnou cenu.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Mám je - tady.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Skvìlé! Já vìdìl, e se pro tuhle práci hodíš!
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Tady máš peníze, jak jsem ti slíbil.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//No a? Co si myslíš? Není to lepší práce, ne se celé dny ohánìt meèem nebo se v nevìtraném kutlochu patlat s nìjakımi lahvièkami?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Bosper mì pøijme do uèení, pokud s tím budou souhlasit i ostatní z mistrù.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Dohodli jsme se na pùltuctu - ještì máš ale èas. Pokraèuj a opatøi mi ty kùe.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Vysvìtli mi, jak stahovat zvíøata z kùe!";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Vysvìtli mi, jak stahovat zvíøata z kùe!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//No tak poslouchej, je to jednoduché, opravdu.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Staèí vzít ostrı nù a rozøíznout zvíøeti bøicho. Pak po stranách trochu naøízni kùi na nohou a mùeš celou koišinu smìle stáhnout.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Pøines mi vlèí kùe a pak se uvidí.
			b_logentry(TOPIC_BOSPERWOLF,"Bosper mì nauèil stahovat zvíøecí kùe.");
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = "Uka mi své zboí.";
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Uka mi své zboí.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Nejsi tady, aby sis prohlíel moje zboí - máš mi pøece pøinést ty kùe!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Tak pokraèuj!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "Slyšel jsem, e tì prı nìkdo okradl.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Slyšel jsem, e tì prı nìkdo okradl.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kdo ti to øekl? Nejspíš Bartok, e? To ti nemohl povìdìt nic lepšího? No tak jo.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Øeknu ti, a se ten hajzl modlí, abych ho nedostal do ruky!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Jen na chvilièku jsem odešel z krámu a kdy jsem se vrátil, spatøil jsem jenom, jak utíká - s mım lukem na rameni.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Okamitì jsem zavolal stráe, ale ten lump bìel smìrem k pøístavu. A tam se jim ztratil.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Trochu jsem jim pøipálil koudel u zadku, take prohledali celou pøístavní ètvr, ale nenašli vùbec nic.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Jsou to prostì mamlasové!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Vsadím se, e mùj luk bude poøád ještì nìkde ve mìstì. Informoval jsem stráe u obou mìstskıch bran, a tak by nikoho s mım lukem ven nepustili.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Kdybych jen toho šmejda dostal do rukou...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"Bosperovi nìkdo ukradl luk. Zlodìj uprchl do pøístavu, ale pak nìkam zmizel. Domobrana prohledala celou ètvr, ale nikdo nic nenašel, i kdy luk musí bıt stále ještì kdesi ve mìstì.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "Mám pocit, e tenhle luk je tvùj.";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Mám pocit, e tenhle luk je tvùj.
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Mùj luk! Kdes ho našel?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//V èerné díøe plné krys.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Doufám, es s tím nemìl nìjaké trable.
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Ne - s takovımi vìcmi u jsem se vypoøádal døív.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hm, a je to, jak chce, dìkuji ti. Jsem tvım dluníkem!
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "Co novıho ve mìstì?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Co novıho ve mìstì?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Jestli nás skøeti opravdu obklíèí, zaène to tu bıt velmi nepøíjemné.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//Jediná loï, která tu kotví, patøí paladinùm a ti si ji taky poøádnì hlídají. A nemyslím, e by ji pouili na záchranu mìšanù.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Nedá se odsud dostat ještì nìjak jinak?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Ne, nikdo z nás odsud bez lodi neunikne.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Zatím se nic nového nepøihodilo. Stav se pozdìji.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Take ty ses pøidal k domobranì?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Ne e by mi to nìjak vadilo. Kromì skøetù a banditù mùeš vdycky ulovit i pár vlkù (ušklíbne se).
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Koukám, e tvoje kariéra letí rychle vzhùru, královskı paladine!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//A u odsud pùjdeš kamkoliv, nezapomeò na svého starého mistra.
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Tak tys vstoupil do kláštera, jo? Doufám, e tì obèas taky pustí ven, abys mì mohl i nadále zásobovat kùemi.
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Kde ses tak dlouho flákal?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Potøebuji další kùe, pøinesls mi je?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Tak tì tu máme zas...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "Jaké mám jako uèedník povinnosti?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Jaké mám jako uèedník povinnosti?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Je to jednoduché - pøines mi co nejvíc koešin.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Zaplatím ti za nì daleko lepší cenu, ne jakou by ti mohli nabídnout ostatní obchodníci.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Kromì toho se nemusíš v obchodì moc ukazovat - zvládnu to klidnì všechno sám.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//A kde mám spát?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Bohuel tu pro tebe nemám ádnı volnı pokoj. Ale v hotelu na trišti tì nìkam uloit musí.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Bosper mi za zvíøecí kùe zaplatí velmi pøíznivou cenu.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "Mám tu pro tebe pár kùí.";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Mám tu pro tebe pár kùí.
	if((Npc_HasItems(other,itat_sheepfur) > 0) || (Npc_HasItems(other,itat_wolffur) > 0) || (Npc_HasItems(other,itat_wargfur) > 0) || (Npc_HasItems(other,itat_shadowfur) > 0) || (Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0) || (Npc_HasItems(other,itat_addon_keilerfur) > 0))
	{
		if(Npc_HasItems(other,itat_addon_keilerfur) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_addon_keilerfur) * VALUE_KEILERFUR);
			b_giveinvitems(other,self,itat_addon_keilerfur,Npc_HasItems(other,itat_addon_keilerfur));
		};
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Ovèí kùe? Doufám, es tu ovci nezabil nìjakému sedlákovi na pastvì.
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//To by mì ani ve snu nenapadlo.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Vlèí kùe, ty jsou dobré.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Kùe ze skøetího psa? To jsou pìkné bestie.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Páni, dokonce kùe stínové šelmy - ty jsou velmi cenné.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co je ksakru TOHLE za kùi?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Tu jsem stáhl z trola.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//... ta má cenu celého jmìní!
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Další velká trolí kùe - tos ty potvory vánì zabil?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//To víš - kdy narazím na nìjakou nestvùru, prostì chytím pøíleitost za paèesy.
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//A dokonce kùe z èerného trola!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Dobrá práce. Pøijï zase, a seeneš další.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Ale vdy víš, e mì zajímají pouze kùe z vlkù, stínovıch šelem a tak podobnì.
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "Vidím, e máš na prodej nìjaké dùlní akcie.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Vidím, e máš na prodej nìjaké dùlní akcie.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Ehm, o tom nic nevím. Klidnì si je vezmi, jestli chceš.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

