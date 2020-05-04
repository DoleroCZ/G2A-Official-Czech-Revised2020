
instance DIA_IGARANZ_KAP1_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap1_exit_condition;
	information = dia_igaraz_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_HELLO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_hello_condition;
	information = dia_igaraz_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_igaraz_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_igaraz_hello_info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co pro tebe mohu udìlat, bratøe?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co pro tebe mùžu udìlat?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "Nemám èas, musím rozdìlovat klobásy.";
};


func int dia_igaraz_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Nemám èas, musím rozdìlovat klobásy.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Takže pracuješ pro Goraxe, co? Tak fajn, dej mi tu klobásu.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_IGARANZ_NOTWORK(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 3;
	condition = dia_igaraz_notwork_condition;
	information = dia_igaraz_notwork_info;
	permanent = FALSE;
	description = "Proè nepracuješ?";
};


func int dia_igaraz_notwork_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_notwork_info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Proè nepracuješ?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Mám dovoleno studovat Innosovy lekce. Hledám moudrost v jeho slovech.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Jednoho dne si mì vyvolí - a pak projdu zkouškou magie a vstoupím do Kruhu ohnì.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Kdo jsou Vyvolení?";
};


func int dia_igaraz_choosen_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_choosen_info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kdo jsou Vyvolení?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Novicové, kterým Innos pøikázal projít zkouškou magie.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Ten, kdo jí projde, bude pøijat mezi ohnivé mágy.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"Co je ta Zkouška magie?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"Jak se mùžu stát vyvoleným?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Co je ta Zkouška magie?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Zkouška, kterou oznámí nejvyšší rada všem vybraným novicùm.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Je to úkol, bìhem kterého se projeví jejich víra a moudrost.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Úèastní se všichni vybraní novicové - úspìšnì však mùže zkoušku složit jen jeden z nich.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak se mùžu stát vyvoleným?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Na to nemùžeš mít žádný vliv. Své novice si vybírá sám Innos a jeho vùli oznamuje Nejvyšší rada.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "Jak mùžu studovat svaté spisy?";
};


func int dia_igaraz_studyinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (PARLAN_ERLAUBNIS == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_studyinnos_info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak mùžu studovat svaté spisy?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Musíš získat pøístup do knihovny.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Mistr Parlan ti ale dá klíè až ve chvíli, kdy poprvé splníš všechny své povinnosti.
};


instance DIA_IGARAZ_IMTHEMAN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_imtheman_condition;
	information = dia_igaraz_imtheman_info;
	important = TRUE;
};


func int dia_igaraz_imtheman_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_imtheman_info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(hrdì) Již se tak stalo. Innos mì vybral a budu se úèastnit zkoušky magie.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "Já mám taky trochu potíže...";
};


var int dia_igaraz_metoo_noperm;

func int dia_igaraz_metoo_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_metoo_info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//To mì taky - požadoval jsem Zkoušku ohnì.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Co jsi UDÌLAL? Buï jsi Innosùv oblíbenec, nebo naprosto šílený.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Už jsem udìlal dost šílených vìcí, takže bych øekl, že zvládnu i tohle.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Innos nade mnou drží ochrannou ruku - jeho zkouškou tedy projdu.
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Možná bychom mohli pracovat spoleènì.",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"Tak co, už jsi nìco vyzvìdìl?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Vidìl jsi Agona nebu Ulfa?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//A už jsi nìco objevil?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Protože stejnì nemáš žádnou šanci, klidnì ti mùžu øíct tohle:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Don't bother looking near the farms - there is nothing there that will get you anywhere.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Možná bychom mohli pracovat spoleènì...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapomeò na to. Splním tenhle úkol sám. Akorát bys mì brzdil.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Vidìl jsi Agona nebu Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozdìlili jsme se u hostince. Šel jsem na farmy a ti dva vyrazili spolu - ale kam, to vážnì nevím.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Nevíš nìco o 'oživlém kameni'?";
};


func int dia_igaraz_add_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE) && (Npc_KnowsInfo(other,dia_igaraz_stein) == FALSE) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_add_info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Nevíš nìco o "oživlém kameni"?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(zachichotá se) Ne! Byl to Serpentes, kdo ti dal tuhle zkoušku?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Ano, proè?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Dovedu si pøedstavit, co má za lubem.
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nebyl bys první, kdo by v téhle zkoušce neobstál.
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Kde pøesnì najdu tu živoucí skálu?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Jdi dál po téhle cestì. Po docela dlouhé dobì dojdeš k øece.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Jdi dál a cesta tì zavede do hor. Nìkde tam by to mìlo být.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Když dojdeš k mostu, tak už jsi moc daleko.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(zasmìje se) Tedy, POKUD se dostaneš tak daleko...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To je všechno, co ti k tomu øeknu. (sarkasticky) Je to konec koncù tvoje ZKOUŠKA!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "Už jsi objevil nìco nového?";
};


func int dia_igaraz_pruefung_condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) < 1) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_pruefung_info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Už jsi objevil nìco nového?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Ještì ne, ale stále hledám.
	AI_StopProcessInfos(self);
	if(IGARAZ_WAIT == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		IGARAZ_WAIT = TRUE;
	};
};


instance DIA_IGARAZ_STEIN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 1;
	condition = dia_igaraz_stein_condition;
	information = dia_igaraz_stein_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_igaraz_stein_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_66") <= 3500) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_stein_info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, poèkej. Mìli bychom si promluvit.
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//No, já si to nemyslím.
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Na tuhle zkoušku jsme èekali celé léta. Innos je se mnou a já ji MUSÍM splnit.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//To mi zní povìdomì.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nejsi sám, kdo tohle øíká.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Dost tlachání. Potøebuji, co jsi našel. Nadešel tedy èas, abys zemøel!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_IGARANZ_KAP2_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap2_exit_condition;
	information = dia_igaraz_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP3_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap3_exit_condition;
	information = dia_igaraz_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_TALKABOUTBABO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_talkaboutbabo_condition;
	information = dia_igaraz_talkaboutbabo_info;
	permanent = FALSE;
	description = "Mìli bychom si promluvit o Babovi.";
};


func int dia_igaraz_talkaboutbabo_condition()
{
	if(MIS_BABOSDOCS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_igaraz_talkaboutbabo_info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Mìli bychom si promluvit o Babovi.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(opatrnì) Ano, co se dìje?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "Máš nìco, co patøí Babovi.";
};


func int dia_igaraz_babosbelongings_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_talkaboutbabo))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosbelongings_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//Máš nìco, co patøí Babovi.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//Co by to tak asi mohlo být?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Pár papírù. Babo by je rád dostal zpátky.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(výsmìšnì) No, tak tomu docela vìøím. Dovedu si to pøedstavit. Ale já si je naneštìstí radìji ponechám, což nás staví pøed ponìkud nepøíjemné dilema.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "Máš ty papíry?";
};


func int dia_igaraz_wheredocs_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_wheredocs_info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Máš ty papíry?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(arogantnì) No, nemám je samozøejmì u sebe. Obávám se, že ti nemohu pomoci.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Kde jsou?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Zamknul jsem je na bezpeèném místì. A klíè ode mì nikdy nedostaneš.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "Co pro tebe mìl Babo udìlat?";
};


func int dia_igaraz_babosjob_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosjob_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co pro tebe mìl Babo udìlat?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Kdybych vìdìl, že se ten mazánek nedokáže postarat o trochu trávy z bažin, zaøídil bych, aby klášterní zahradu dostal na starost nìkdo jiný.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//On má za úkol pìstovat trávu z bažin?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Samozøejmì. Od doby, co už zpoza bariéry žádná nepøichází, se její cena ve mìstì ztrojnásobila.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//To mùže být docela dobrý kšeft pro každého, kdo se do toho dá. Ale Babo se nechtìl zapojit.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "Kolik chceš za ty papíry?";
};


func int dia_igaraz_price_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_price_info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Kolik chceš za ty papíry?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(zasmìje se) Ha, ve skuteènosti jsou naprosto nedocenitelné. Nìco takového se tady moc èasto nevidí.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Nerad bych ale sázel celou svou budoucnost jen proti pár zlaákùm.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 zlatých a mùžeš si dìlat s tìmi papíry co chceš.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "Chtìl bych ty papíry koupit.";
};


func int dia_igaraz_buyit_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_price) && (Npc_HasItems(other,itmi_gold) >= 300))
	{
		return TRUE;
	};
};

func void dia_igaraz_buyit_info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Chtìl bych ty papíry koupit.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Podívej, nemùžu odsud jen tak odejít. Dám ti klíè od mé truhly, stejnì v ní nic jiného není.
	b_giveinvitems(other,self,itmi_gold,300);
	b_giveinvitems(self,other,itke_igarazchest_mis,1);
};


instance DIA_IGARAZ_PICKPOCKET(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 900;
	condition = dia_igaraz_pickpocket_condition;
	information = dia_igaraz_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle klíè lze snadno ukrást)";
};


func int dia_igaraz_pickpocket_condition()
{
	if((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_igarazchest_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_igaraz_pickpocket_info()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_BACK,dia_igaraz_pickpocket_back);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_PICKPOCKET,dia_igaraz_pickpocket_doit);
};

func void dia_igaraz_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_igaraz_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_igaraz_pickpocket_back()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
};


instance DIA_IGARANZ_KAP4_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap4_exit_condition;
	information = dia_igaraz_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP5_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap5_exit_condition;
	information = dia_igaraz_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_PERM(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_perm_condition;
	information = dia_igaraz_perm_info;
	permanent = FALSE;
	description = "Máš pro mì nìco zajímavého?";
};


func int dia_igaraz_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF) && (MIS_BABOSDOCS != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_igaraz_perm_info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Máš pro mì nìco zajímavého?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... ne.
	AI_StopProcessInfos(self);
};

