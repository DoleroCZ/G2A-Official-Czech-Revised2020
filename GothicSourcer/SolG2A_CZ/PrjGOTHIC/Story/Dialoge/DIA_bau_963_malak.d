
instance DIA_MALAK_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_exit_condition;
	information = dia_malak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_HALLO(C_INFO)
{
	npc = bau_963_malak;
	nr = 3;
	condition = dia_malak_hallo_condition;
	information = dia_malak_hallo_info;
	description = "Je všechno v poøádku?";
};


func int dia_malak_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_hallo_info()
{
	AI_Output(other,self,"DIA_Malak_HALLO_15_00");	//Je všechno v poøádku?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_01");	//Další nádeník, co neví, kam by se vrtnul? Žádný problém. Promluv si s Bengarem, naším farmáøem.
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_02");	//Jasnì.
	};
};


instance DIA_MALAK_WASMACHSTDU(C_INFO)
{
	npc = bau_963_malak;
	nr = 4;
	condition = dia_malak_wasmachstdu_condition;
	information = dia_malak_wasmachstdu_info;
	description = "Co tady dìláš?";
};


func int dia_malak_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Malak_WASMACHSTDU_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_01");	//Jsem ovèák. Není to zrovna nároèná práce.
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_02");	//Ale teï si musíš dávat poøádný pozor. Zvláš, když se dostaneš blízko k prùsmyku.
};


instance DIA_MALAK_PASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 5;
	condition = dia_malak_pass_condition;
	information = dia_malak_pass_info;
	description = "Co víš o tom prùsmyku?";
};


func int dia_malak_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_pass_info()
{
	AI_Output(other,self,"DIA_Malak_PASS_15_00");	//Co víš o tom prùsmyku?
	AI_Output(self,other,"DIA_Malak_PASS_08_01");	//Nic moc. Jen to, že vede do Hornického údolí, co ještì pøed pár týdny uzavírala magická bariéra.
	AI_Output(self,other,"DIA_Malak_PASS_08_02");	//Ale jinak jediná vìc, na kterou si my farmáøi musíme dávat pozor, jsou karavany, co každý mìsíc vozí do Hornického údolí všechno možné.
	AI_Output(self,other,"DIA_Malak_PASS_08_03");	//Ti hrdloøezové nám dokážou poøádnì znepøíjemnit život.
};


instance DIA_MALAK_WOPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 6;
	condition = dia_malak_wopass_condition;
	information = dia_malak_wopass_info;
	description = "Kde najdu prùsmyk do Hornického údolí?";
};


func int dia_malak_wopass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wopass_info()
{
	AI_Output(other,self,"DIA_Malak_WOPASS_15_00");	//Kde najdu prùsmyk do Hornického údolí?
	AI_Output(self,other,"DIA_Malak_WOPASS_08_01");	//Poblíž vodopádù na druhé stranì náhorních pastvin.
};


instance DIA_MALAK_MINENTAL(C_INFO)
{
	npc = bau_963_malak;
	nr = 7;
	condition = dia_malak_minental_condition;
	information = dia_malak_minental_info;
	description = "Co se povídá o Hornickém údolí?";
};


func int dia_malak_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_minental_info()
{
	AI_Output(other,self,"DIA_Malak_MINENTAL_15_00");	//Co se povídá o Hornickém údolí?
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_01");	//Všechno možné. Nìkteøí z chlapù slyšeli v noci køik, nìkteøí vidìli podivná svìtla nad horami.
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_02");	//Ale jestli to chceš vìdìt, tak to všechno jsou jen babský povídaèky.
};


instance DIA_MALAK_WARSTDUSCHONDA(C_INFO)
{
	npc = bau_963_malak;
	nr = 8;
	condition = dia_malak_warstduschonda_condition;
	information = dia_malak_warstduschonda_info;
	description = "Už jsi nìkdy byl v Hornickém údolí?";
};


func int dia_malak_warstduschonda_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_warstduschonda_info()
{
	AI_Output(other,self,"DIA_Malak_WARSTDUSCHONDA_15_00");	//Už jsi nìkdy byl v Hornickém údolí?
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_01");	//Ne. Ale jednou za èas se k nìmu dostanu. To vždycky vidím ty dva paladiny, co stojí u brány a drží stráž.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_02");	//Vypadá to, jako by se ujišovali, že se z údolí nic nedostane ven.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_03");	//Ale jinak je Hornické údolí vlastnì takové pøirozené vìzení. Jakmile tam jedou vejdeš, ven už se nedostaneš.
};


instance DIA_MALAK_PALADINE(C_INFO)
{
	npc = bau_963_malak;
	nr = 9;
	condition = dia_malak_paladine_condition;
	information = dia_malak_paladine_info;
	description = "Rád bych se dozvìdìl nìco o paladinech.";
};


func int dia_malak_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_minental) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_paladine_info()
{
	AI_Output(other,self,"DIA_Malak_PALADINE_15_00");	//Øekni mi víc o tìch paladinech. Jak dlouho už tam jsou?
	AI_Output(self,other,"DIA_Malak_PALADINE_08_01");	//Týden, dva. Myslím. Pøesnì to nevím.
	AI_Output(self,other,"DIA_Malak_PALADINE_08_02");	//Nedávno se jich tu potloukala celá skupina a pak zmizeli v prùsmyku. Od té doby už jsem je nevidìl.
};


instance DIA_MALAK_KEINEFRAUEN(C_INFO)
{
	npc = bau_963_malak;
	nr = 10;
	condition = dia_malak_keinefrauen_condition;
	information = dia_malak_keinefrauen_info;
	description = "Nevidìl jsem tady žádnou ženu.";
};


func int dia_malak_keinefrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_keinefrauen_info()
{
	AI_Output(other,self,"DIA_Malak_KEINEFRAUEN_15_00");	//Nevidìl jsem tady žádnou ženu.
	AI_Output(self,other,"DIA_Malak_KEINEFRAUEN_08_01");	//Tak to máš pravdu. Tohle je farma pro chlapy, abych tak øekl. Hodnì práce, øekl bych.
};


instance DIA_MALAK_PERMKAP1(C_INFO)
{
	npc = bau_963_malak;
	nr = 11;
	condition = dia_malak_permkap1_condition;
	information = dia_malak_permkap1_info;
	permanent = TRUE;
	description = "S tou prací to nepøehánìj.";
};


func int dia_malak_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && Npc_KnowsInfo(other,dia_malak_wasmachstdu) && Npc_KnowsInfo(other,dia_malak_pass) && Npc_KnowsInfo(other,dia_malak_minental) && Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_paladine) && Npc_KnowsInfo(other,dia_malak_keinefrauen) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_permkap1_info()
{
	AI_Output(other,self,"DIA_Malak_PERMKAP1_15_00");	//S tou prací to nepøehánìj.
	AI_Output(self,other,"DIA_Malak_PERMKAP1_08_01");	//Pokusím se.
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_KAP3_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap3_exit_condition;
	information = dia_malak_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_malak_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_FLEEFROMPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 30;
	condition = dia_malak_fleefrompass_condition;
	information = dia_malak_fleefrompass_info;
	description = "Co tady dìláš?";
};


func int dia_malak_fleefrompass_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_malak_fleefrompass_info()
{
	if((NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild == GIL_KDF))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_00");	//Co tady dìláš?
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_01");	//Utekl jsem sem z Bengarovy farmy. Nechtìlo se mi èekat, až mì rozsápe nìkterá z tìch nestvùr, co pøicházejí z prùsmyku.
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_02");	//Nedokážeš si pøedstavit, co se za posledních nìkolik dnù odtamtud všechno vyvalilo.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//Ale dokážu.
		b_logentry(TOPIC_BENGARALLEIN,"Malak se usadil na jihu, nebo se bojí nestvùr, které nahoru na pastviny pøicházejí z prùsmyku.");
		b_giveplayerxp(XP_FOUNDMALAKFLEEFROMPASS);
	};
};


instance DIA_MALAK_HEILUNG(C_INFO)
{
	npc = bau_963_malak;
	nr = 55;
	condition = dia_malak_heilung_condition;
	information = dia_malak_heilung_info;
	permanent = TRUE;
	description = "Potøebuješ pomoct.";
};


func int dia_malak_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_MALAK == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};


var int dia_malak_heilung_onetime;

func void dia_malak_heilung_info()
{
	AI_Output(other,self,"DIA_Malak_Heilung_15_00");	//Potøebuješ pomoct.
	if(DIA_MALAK_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_01");	//(plaètivì) Jen bych chtìl jít domù. Vrátím se k Bengarovi. Doufám, že je ještì naživu.
		b_npcclearobsessionbydmt(self);
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(bau_962_bauer,"Start");
		b_startotherroutine(bau_964_bauer,"Start");
		b_startotherroutine(bau_965_bauer,"Start");
		b_startotherroutine(bau_966_bauer,"Start");
		b_startotherroutine(bau_967_bauer,"Start");
		b_startotherroutine(bau_968_bauer,"Start");
		b_startotherroutine(bau_969_bauer,"Start");
		DIA_MALAK_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_02");	//Nech mì na pokoji, mágu. Poradím si sám.
		b_npcclearobsessionbydmt(self);
	};
};


instance DIA_MALAK_PERMCASTLE(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_permcastle_condition;
	information = dia_malak_permcastle_info;
	permanent = TRUE;
	description = "A co tady?";
};


func int dia_malak_permcastle_condition()
{
	if((Npc_GetDistToWP(self,"CASTLEMINE") < 4000) && (MIS_GETMALAKBACK != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_permcastle_info()
{
	AI_Output(other,self,"DIA_Malak_PERMCASTLE_15_00");	//A co tady?
	AI_Output(self,other,"DIA_Malak_PERMCASTLE_08_01");	//Tady mám jen potíže s bandity. Poøád lepší než ty zrùdy.
};


instance DIA_MALAK_BACKTOBENGAR(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_backtobengar_condition;
	information = dia_malak_backtobengar_info;
	permanent = TRUE;
	description = "Bengar tì potøebuje.";
};


func int dia_malak_backtobengar_condition()
{
	if((MIS_GETMALAKBACK == LOG_RUNNING) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (Npc_IsDead(bengar) == FALSE) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_backtobengar_info()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_00");	//Bengar tì potøebuje. Chce, aby ses vrátil na farmu.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_01");	//Nejsem blázen. Dokud nebude farma dobøe zabezpeèena, nehodlám odsud vystrèit nos!
	b_logentry(TOPIC_BENGARALLEIN,"Malak se nemíní vrátit na Bengarùv statek, dokud zùstává nechránìný.");
	if(MIS_BENGARSHELPINGSLD == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_02");	//Najal jsem žoldáka. Dává na farmu pozor.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_03");	//Tak to je samozøejmì jiná. Ale poèkat. Kdo toho chlapíka platí, he?
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_04");	//To je mùj problém.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_05");	//(zvìdavì) Mmh. Asi neni šance, že bys mi to øekl, co?
		Info_AddChoice(dia_malak_backtobengar,"Ne",dia_malak_backtobengar_los);
	};
};

func void dia_malak_backtobengar_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//Ne.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_los_08_01");	//Fajn. Tak se vrátím. Doufám, že ten chlap k nìèemu bude.
	MIS_GETMALAKBACK = LOG_SUCCESS;
	b_giveplayerxp(XP_MALAK_BACKTOBENGAR);
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(bau_962_bauer,"Start");
	b_startotherroutine(bau_964_bauer,"Start");
	b_startotherroutine(bau_965_bauer,"Start");
	b_startotherroutine(bau_966_bauer,"Start");
	b_startotherroutine(bau_967_bauer,"Start");
	b_startotherroutine(bau_968_bauer,"Start");
	b_startotherroutine(bau_969_bauer,"Start");
};


instance DIA_MALAK_BACK(C_INFO)
{
	npc = bau_963_malak;
	nr = 32;
	condition = dia_malak_back_condition;
	information = dia_malak_back_info;
	permanent = TRUE;
	description = "Zùstaneš teï na Bengarovì farmì?";
};


func int dia_malak_back_condition()
{
	if((MIS_GETMALAKBACK == LOG_SUCCESS) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_back_info()
{
	AI_Output(other,self,"DIA_Malak_BACK_15_00");	//Zùstaneš teï na Bengarovì farmì?
	AI_Output(self,other,"DIA_Malak_BACK_08_01");	//Jasnì. Nìjak to zvládneme.
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP4_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap4_exit_condition;
	information = dia_malak_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_malak_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP5_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap5_exit_condition;
	information = dia_malak_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_malak_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP6_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap6_exit_condition;
	information = dia_malak_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_malak_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_PICKPOCKET(C_INFO)
{
	npc = bau_963_malak;
	nr = 900;
	condition = dia_malak_pickpocket_condition;
	information = dia_malak_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_malak_pickpocket_condition()
{
	return c_beklauen(43,40);
};

func void dia_malak_pickpocket_info()
{
	Info_ClearChoices(dia_malak_pickpocket);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_BACK,dia_malak_pickpocket_back);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_PICKPOCKET,dia_malak_pickpocket_doit);
};

func void dia_malak_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_malak_pickpocket);
};

func void dia_malak_pickpocket_back()
{
	Info_ClearChoices(dia_malak_pickpocket);
};

