
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "Tak co, chlapeèku?";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Tak co, chlapeèku?
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Takhle se mnou žádnej usoplenej rolník nebude mluvit - kolikrát ti to ještì budu pøipomínat?
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"Nejsem rolník.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Ty to tady vedeš?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ty to tady vedeš?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//(ustrašenì) Eh. Ne, jsem jen Sekobùv syn. Ale až mùj starý otec jednou nebude mezi námi, bude mi to tu všechno patøit.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Úžasné!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nejsem rolník.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//A co tady chceš? Nemáme nic. Takže zase mùžeš jít.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Takhle jednáš se všemi rolníky?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Takhle jednáš se všemi rolníky?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Jasnì - potøebujou to. A není proè se pohoršovat, takhle to prostì funguje.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "Potøebuju mluvit s tvým otcem.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Potøebuju mluvit s tvým otcem.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//Nemá èas. Ale já ho zastupuju. Jak ti mùžu pomoct?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Pøedstav mì svému otci.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Ty jsi opravdu neústupný chlapík a zøejmì i dobrý bojovník, co?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Ten nejlepší.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Tak to asi bude lepší, když tì za ním vezmu.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Nedìlej si starosti, hochu. Najdu ho sám. Urèitì.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Když to øíkáš.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "Tak co dìláš, když si zrovna nehraješ na pána farmy?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//Tak co dìláš, když si zrovna nehraješ na pána farmy?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Hlídám.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Ta mizerná domobrana z mìsta leze na náš pozemek èím dál tím èastìjc a krade všechno, co se dá odnést.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Byli tu minulý týden a vzali si nìkolik našich ovcí.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Kdyby se mi nìkdo z nich dostal do rukou, udìlal bych s ním krátký proces.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Ale jistì!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "Proè vám proti domobranì nepomùžou žoldáci?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Proè vám proti domobranì nepomùžou žoldáci?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Než ty se na nìco zmùžou, já už je dávno zaženu sám.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(Zeptat se na Bronca.)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Je tady chlápek, co chce po každém kolemjdoucím mýtné a tvrdí o sobì, že je farmáø.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(rozpaèitì) Eh. Ano. Já vím. To je Bronco. Dìlá si, co chce.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Jako bych ho milionkrát nedokopával k tomu, aby se vrátil do práce.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Ale?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Prostì to neudìlal.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Mùj otec je na mì pìknì naštvaný, že jsem ho ještì nedokázal pøinutit, aby se vrátil do práce.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Možná bych ti mohl pomoct.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Možná bych ti mohl pomoct.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Myslíš s ním? Fajn, poslouchej, když se ti podaøí Bronca dostat zpátky do práce, zaplatím ti. Øeknìme 10 zlatých. Co øíkáš?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"Žádný problém. Ale chci víc penìz.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"Budu o tom pøemýšlet.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Budu o tom pøemýšlet.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Jak je libo.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//Dobrá. Uvidím, co se dá dìlat.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Ale pospìš si s tím.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Till nedokáže Bronca pøimìt k práci, a proto mì požádal, abych se o to pokusil.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Chci víc.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Žádný problém. Ale chci víc penìz.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//Dobrá. Tak teda 20 zlatých.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci víc.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci víc.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Možná... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci víc.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Fajn. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci víc.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Tak dobøe, dobøe! Dám ti 100 zlatých. Ale to je všechno, co mám.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobrá. Uvidím, co se dá dìlat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Bronco se vrátil do práce.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronco se vrátil do práce.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Vážnì? To je úžasný.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Jo. A teï k mojí odmìnì.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(váhavì) Mmh. dobrá. Obchod je obchod, co?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Bohužel, nemám tolik penìz. Ale za tvou pomoc jsem ti velmi zavázán.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(Otravovat Tilla.)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Daleko od domova, že ano? Tady ti tvùj tatík nepomùže.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Nebude to dlouho trvat a zavøu tu tvojí nevymáchanou hubu.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ty bøídile, ještì budeš mluvit o štìstí, když tì nechám naživu.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Tak mì nech na pokoji.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Možná bys mìl víc jíst, abys víc vyrostl a stal se silnìjším.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Jednou ti ukážu.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ty mizernej malej...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Prostì vypadni.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Máš nìkoho, kdo ti dneska bude foukat na nosánek?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Nech mì být, ty pitomèe.
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};

