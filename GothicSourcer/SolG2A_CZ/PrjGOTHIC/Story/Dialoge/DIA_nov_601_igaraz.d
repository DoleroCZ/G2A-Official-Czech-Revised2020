
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
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co pro tebe mohu ud�lat, brat�e?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co pro tebe m��u ud�lat?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "Nem�m �as, mus�m rozd�lovat klob�sy.";
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
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Nem�m �as, mus�m rozd�lovat klob�sy.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Tak�e pracuje� pro Goraxe, co? Tak fajn, dej mi tu klob�su.
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
	description = "Pro� nepracuje�?";
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
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Pro� nepracuje�?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//M�m dovoleno studovat Innosovy lekce. Hled�m moudrost v jeho slovech.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Jednoho dne si m� vyvol� - a pak projdu zkou�kou magie a vstoup�m do Kruhu ohn�.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Kdo jsou Vyvolen�?";
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
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kdo jsou Vyvolen�?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Novicov�, kter�m Innos p�ik�zal proj�t zkou�kou magie.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Ten, kdo j� projde, bude p�ijat mezi ohniv� m�gy.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"Co je ta Zkou�ka magie?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"Jak se m��u st�t vyvolen�m?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Co je ta Zkou�ka magie?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Zkou�ka, kterou ozn�m� nejvy��� rada v�em vybran�m novic�m.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Je to �kol, b�hem kter�ho se projev� jejich v�ra a moudrost.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//��astn� se v�ichni vybran� novicov� - �sp�n� v�ak m��e zkou�ku slo�it jen jeden z nich.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak se m��u st�t vyvolen�m?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Na to nem��e� m�t ��dn� vliv. Sv� novice si vyb�r� s�m Innos a jeho v�li oznamuje Nejvy��� rada.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "Jak m��u studovat svat� spisy?";
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
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak m��u studovat svat� spisy?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Mus� z�skat p��stup do knihovny.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Mistr Parlan ti ale d� kl�� a� ve chv�li, kdy poprv� spln� v�echny sv� povinnosti.
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
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(hrd�) Ji� se tak stalo. Innos m� vybral a budu se ��astnit zkou�ky magie.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "J� m�m taky trochu pot�e...";
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
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//To m� taky - po�adoval jsem Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Co jsi UD�LAL? Bu� jsi Innos�v obl�benec, nebo naprosto ��len�.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//U� jsem ud�lal dost ��len�ch v�c�, tak�e bych �ekl, �e zvl�dnu i tohle.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Innos nade mnou dr�� ochrannou ruku - jeho zkou�kou tedy projdu.
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Mo�n� bychom mohli pracovat spole�n�.",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"Tak co, u� jsi n�co vyzv�d�l?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Vid�l jsi Agona nebu Ulfa?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//A u� jsi n�co objevil?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Proto�e stejn� nem� ��dnou �anci, klidn� ti m��u ��ct tohle:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Don't bother looking near the farms - there is nothing there that will get you anywhere.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Mo�n� bychom mohli pracovat spole�n�...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapome� na to. Spln�m tenhle �kol s�m. Akor�t bys m� brzdil.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Vid�l jsi Agona nebu Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozd�lili jsme se u hostince. �el jsem na farmy a ti dva vyrazili spolu - ale kam, to v�n� nev�m.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Nev� n�co o 'o�ivl�m kameni'?";
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
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Nev� n�co o "o�ivl�m kameni"?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(zachichot� se) Ne! Byl to Serpentes, kdo ti dal tuhle zkou�ku?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Ano, pro�?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Dovedu si p�edstavit, co m� za lubem.
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nebyl bys prvn�, kdo by v t�hle zkou�ce neobst�l.
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Kde p�esn� najdu tu �ivouc� sk�lu?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Jdi d�l po t�hle cest�. Po docela dlouh� dob� dojde� k �ece.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Jdi d�l a cesta t� zavede do hor. N�kde tam by to m�lo b�t.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Kdy� dojde� k mostu, tak u� jsi moc daleko.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(zasm�je se) Tedy, POKUD se dostane� tak daleko...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To je v�echno, co ti k tomu �eknu. (sarkasticky) Je to konec konc� tvoje ZKOU�KA!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "U� jsi objevil n�co nov�ho?";
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
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//U� jsi objevil n�co nov�ho?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Je�t� ne, ale st�le hled�m.
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
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, po�kej. M�li bychom si promluvit.
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//No, j� si to nemysl�m.
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Na tuhle zkou�ku jsme �ekali cel� l�ta. Innos je se mnou a j� ji MUS�M splnit.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//To mi zn� pov�dom�.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nejsi s�m, kdo tohle ��k�.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Dost tlach�n�. Pot�ebuji, co jsi na�el. Nade�el tedy �as, abys zem�el!
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
	description = "M�li bychom si promluvit o Babovi.";
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
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//M�li bychom si promluvit o Babovi.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(opatrn�) Ano, co se d�je?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "M� n�co, co pat�� Babovi.";
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
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//M� n�co, co pat�� Babovi.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//Co by to tak asi mohlo b�t?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//P�r pap�r�. Babo by je r�d dostal zp�tky.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(v�sm�n�) No, tak tomu docela v���m. Dovedu si to p�edstavit. Ale j� si je nane�t�st� rad�ji ponech�m, co� n�s stav� p�ed pon�kud nep��jemn� dilema.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "M� ty pap�ry?";
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
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//M� ty pap�ry?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(arogantn�) No, nem�m je samoz�ejm� u sebe. Ob�v�m se, �e ti nemohu pomoci.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Kde jsou?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Zamknul jsem je na bezpe�n�m m�st�. A kl�� ode m� nikdy nedostane�.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "Co pro tebe m�l Babo ud�lat?";
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
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co pro tebe m�l Babo ud�lat?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Kdybych v�d�l, �e se ten maz�nek nedok�e postarat o trochu tr�vy z ba�in, za��dil bych, aby kl�tern� zahradu dostal na starost n�kdo jin�.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//On m� za �kol p�stovat tr�vu z ba�in?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Samoz�ejm�. Od doby, co u� zpoza bari�ry ��dn� nep�ich�z�, se jej� cena ve m�st� ztrojn�sobila.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//To m��e b�t docela dobr� k�eft pro ka�d�ho, kdo se do toho d�. Ale Babo se necht�l zapojit.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "Kolik chce� za ty pap�ry?";
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
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Kolik chce� za ty pap�ry?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(zasm�je se) Ha, ve skute�nosti jsou naprosto nedoceniteln�. N�co takov�ho se tady moc �asto nevid�.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Nerad bych ale s�zel celou svou budoucnost jen proti p�r zla��k�m.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 zlat�ch a m��e� si d�lat s t�mi pap�ry co chce�.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "Cht�l bych ty pap�ry koupit.";
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
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Cht�l bych ty pap�ry koupit.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Pod�vej, nem��u odsud jen tak odej�t. D�m ti kl�� od m� truhly, stejn� v n� nic jin�ho nen�.
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
	description = "(Tenhle kl�� lze snadno ukr�st)";
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
	description = "M� pro m� n�co zaj�mav�ho?";
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
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//M� pro m� n�co zaj�mav�ho?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... ne.
	AI_StopProcessInfos(self);
};

