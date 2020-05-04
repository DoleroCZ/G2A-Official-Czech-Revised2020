
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Vidím, e ses pøidal na stranu práva a øádu.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Nevadí, e ses stal sluebníkem Innose. Jsi jedním z nás. A já doufám, e se nìjakı zpùsob najde.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Tak teï patøíš k Innosovì církvi. Fajn, ale ještì poøád jsi jedním z nás - doufám, e jsi na to nezapomnìl.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Tvùj èas vypršel. Nemìl ses vracet.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Vidím, e jsi dostal náš dar. Jsem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Dobrá, Cassio, tak mi øekni, proè jsem tady.
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Upoutal jsi naši pozornost tím, e jsi dokázal získat dùvìru jednoho z našich pøátel.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//A my ti chceme dát šanci. Mùeš se k nám pøidat.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//To se podívejme, kdo sem našel cestu. Attila tì podcenil. Nehodlám udìlat stejnou chybu.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co to tady kujete?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chceme tì pøipravit o ivot za to, e jsi donášel na našeho pøítele. Proto jsme poslali Attilu.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Nicménì, tvá pøítomnost tady nám poskytuje nové monosti...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... co mi chceš nabídnout?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Mùeš se k nám pøidat.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "Øekni mi o vaší organizaci víc.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Øekni mi o vaší organizaci víc.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Lidé z mìsta jsou námi trochu znepokojeni. Ale nikdo nezná náš úkryt.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta hrstka lidí, co ví o existenci stok, vìøí, e jsou zamèené a nikdo se do nich nemùe dostat.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//A dokud se do nich nikdo nedostane, mùeme v klidu pracovat.
};


instance DIA_CASSIA_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_missingpeople_condition;
	information = dia_cassia_missingpeople_info;
	permanent = FALSE;
	description = "Je tu nìco, co mi mùeš øíct o ztracenıch obyvatelích?";
};


func int dia_cassia_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Je tu nìco, co mi mùeš øíct o ztracenıch obyvatelích?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Proè bys to chtìl vìdet?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Rád bych zjistil, co se jim stalo.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Kdy budeš opouštet stoku, plav mírnì doprava po pobreí.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam najdeš odpovìdi na své otázky ...
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "Co z toho budu mít, kdy se k vám pøidám?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Co z toho budu mít, kdy se k vám pøidám?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Mùeš se od nás nauèit pár zajímavejch vìcí - schopnosti, které ti umoní ít v pøepychu.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nemusím se skrıvat tady dole, nebo jo?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(tichı smích) Ne. Musíš jen dodrovat naše pravidla. To je všechno.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "Co se od vás mùu nauèit?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Co se od vás mùu nauèit?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper je mistrem v plíení. Ukáe ti, jak se nehluènì pohybovat.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez je vıjimeènì nadanı zlodìj. Jeho ruèièkám neodolá ádnı zámek.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A já tì nauèím, jak si pøivlastòovat obsahy kapes. Cizích.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Taky ti pomùu s tím, jak dosáhnout vìtší obratnosti. Protoe obratnost je klíèem ke tvım schopnostem.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Cassia mì nauèí kapsáøství a pomùe mi zvıšit obratnost.");
	b_logentry(TOPIC_CITYTEACHER,"Ramirez mì nauèí, jak páèit zámky.");
	b_logentry(TOPIC_CITYTEACHER,"Jesper mì nauèí plíení.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "Jaká jsou vaše pravidla?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jaká jsou vaše pravidla?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Za prvé: Nešpitneš o nás ani slùvko. Nikomu. Nikdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Za druhé: Nenecháš se chytit.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Za tøetí: Jestli tady dole na nìkoho vytáhneš zbraò, zabijeme tì.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//A ètvrté, poslední pravidlo je: Kadı, kdo se k nám chce pøidat, musí prokázat, e k nìèemu je.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "Co se stane, kdy mì chytnou?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co se stane, kdy mì chytnou?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Prostì se nenech chytit, jasné?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "Jak mám dokázat, e jsem co k èemu?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak mám dokázat, e jsem co k èemu?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Tak pøidáš se k nám, nebo ne?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten palièatej starej alchymista - Constantino - má nádhernı prsten.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Ale jemu vánì není k nièemu. Chci, aby zdobil mou ruku.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Cassia po mnì chce, abych jí pøinesl Constantinùv prsten.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "Dobrá, jdu do toho.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobrá, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Vıbornì. Dostal jsi šanci prokázat, co v tobì vìzí. A jestli se chceš od nás nìèemu pøiuèit, jsi tady vítán.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "A co kdy se k vám nebudu chtít pøidat...?";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co kdy se k vám nebudu chtít pøidat...?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Zahazuješ šanci, která se naskytne jen jednou, ale mùeš jít.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(vánì) A ani nepomysli na to, e bys nás nìkomu prozradil. Mohl bys toho trpce litovat.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, jdu do toho.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Musím si to rozmyslet.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//V tom pøípadì tì zabiju.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, jdu do toho.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"No tak si mì zkus zabít.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobrá, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(usmívá se) Uèinil jsi správné rozhodnutí. Jestli uspìješ ve zkoušce, mùeš rozšíøit naše øady.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Jestli se chceš nejprve nauèit zlodìjské dovednosti, poslu si - budeš je potøebovat.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//No tak si mì zkus zabít.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//To je zlé. Mìla jsem dojem, e jsi chytøejší.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Musím si to rozmyslet.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Jak chceš. Dávám ti dva dny na rozmyšlenou. Po uplynutí lhùty u se tu nesmíš ukázat.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "Mùeš mì nìco nauèit?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Mùeš mì nìco nauèit?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Jasnì, ádnı problém. Prostì mi dej vìdìt, a budeš pøipraven.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Jasnì. Kapsáøství a obratnost tì bude kadá stát 100 zlatıch.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Moná pozdìji... (ZPÌT)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chtìl bych se nauèit kapsáøskému umìní (zaplatit 100 zlaákù).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chci se stát obratnìjším (zaplatit 100 zlaákù).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Chci dosáhnout vìtší obratnosti. Tady je zlato.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Mùeme zaèít hned, jak budeš pøipraven.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Vra se, a budeš mít zlato.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Chci se dozvìdìt nìco o kapsáøství. Tady je zlato.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Mùeme zaèít hned, jak budeš pøipraven.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Vra se, a budeš mít zlato.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "Chtìl bych bıt o nìco obratnìjší.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Chtìl bych bıt o nìco obratnìjší.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Uka mi, jak vybírat kapsy. (10 LP)";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Uka mi, jak se vybírají kapsy.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Jestli chceš nìkomu vyprázdnit kapsy, rozptyl ho. Prostì si s ním zaèni povídat, hoïte øeè.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Zatímco na nìj mluvíš, poøádnì si ho odhadni. Všímej si nacpanıch kapes, šperkù nebo koenıch øemínkù kolem krku. A hlavnì si hlídej, jak moc je ten chlápek všímavı.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Obrat nalitého nádeníka není to samé jako okrást ostraitého obchodníka, mìj to na pamìti.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Kdy budeš neohrabanı, tak samozøejmì bude èuchat zradu. Tak hlavnì klídek.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "Dostal jsem Constantinùv prsten.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Dostal jsem Constantinùv prsten.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratuluju. Prošel jsi vstupní zkouškou. Teï jsi opravdu jedním z nás.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Vezmi si tenhle klíè. Je od dveøí od hotelu. (úsmìv) Tak nebudeš muset pokadé plavat.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Taky bys mìl vìdìt, e máme tajné znamení. Zvláštní kıvnutí.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Pøesnì. Kdy budeš mluvit s tím pravım èlovìkem a udìláš tenhle posunek, bude vìdìt, e jsi jedním z nás.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Byj jsem pøijat do zlodìjského cechu.");
	b_logentry(TOPIC_DIEBESGILDE,"Nauèil jsem se zlodìjskı signál - kdy jej ukáu tìm správnım lidem, poznají, e jsem jedním z nich.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "Tak kde ukrıváte svou koøist?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Tak kde ukrıváte svou koøist?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Hele, snad si vánì nemyslíš, e ti tohle øeknu?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//Budeš mít dost pøíleitostí, aby sis uil své vlastní koøisti. Pamatuj - kdo je moc nenasytnı, skonèí s prázdnıma rukama.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "Máš pro mì práci?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Máš pro mì práci?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Ne do té doby, co tì ve mìstì budou znát jako zlodìje.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Nejdøív uklidni situaci - zapla pokutu nebo se zbav svìdkù, je mi to jedno. Prostì to nìjak vyøeš.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Ano. Je tady sada kalichù. Je jich šest.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Král Rhobar je získal na jedné ze svıch váleènıch vıprav -  ale obìtoval mnoho muù na to, aby si je mohl odvézt. Proto se jim øíká Krvavé kalichy.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//ádnı z tìch kalichù nemá sám o sobì velkou cenu - ale všech šest pohromadì pøedstavuje celé jmìní.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Kde jsou ty kalichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Jsou tady, ve mìstì - patøí bohatım obchodníkùm z horní ètvrti.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Pøines mi je. Já se zatím pokusím sehnat na nì kupce.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co z toho budu mít?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Buï polovinu zisku, nebo si mùeš vzít jeden zajímavı pøedmìt z mé koøisti.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Cassia mì poádala, abych jí pøinesl šest krvavıch kalichù. Nejspíš je všechny najdu kdesi ve mìstì.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "O Krvavıch kalichách...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//O Krvavıch kalichách...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//Mám všech šest kalichù.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobrá práce. Já jsem zatím našel kupce.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Mùeš hned vzít svou odmìnu. Dík, es to pro mì udìlal.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//U pro tebe nemám nic na práci - ale mùeš se ode mì kdykoli nìèemu nauèit. A navíc, na tomhle ostrovì je toho dost, co jen èeká, a si to nìkdo vezme. (usmívá se)
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Mùu ty kalichy prodat jen jako sadu. Pøines mi je všechny.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "Pøišel jsem si pro svoji odmìnu.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Pøišel jsem si pro svoji odmìnu.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co sis vybral?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 zlaákù.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 elixíry hojivé síly",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Dej mi zlato.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Dej mi lektvary.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Dej mi prsten.
	b_giveinvitems(self,other,itri_hp_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

