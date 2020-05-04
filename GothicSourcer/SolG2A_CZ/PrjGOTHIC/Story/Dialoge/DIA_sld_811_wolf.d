
instance DIA_WOLF_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_exit_condition;
	information = dia_wolf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_wolf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_HALLO(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_hallo_condition;
	information = dia_wolf_hallo_info;
	permanent = FALSE;
	description = "Jsi v po¯·dku?";
};


func int dia_wolf_hallo_condition()
{
	return TRUE;
};

func void dia_wolf_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Jsi v po¯·dku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, j· tÏ zn·m! Z kolonie!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Co tady chceö?
};


instance DIA_WOLF_WANNAJOIN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 5;
	condition = dia_wolf_wannajoin_condition;
	information = dia_wolf_wannajoin_info;
	permanent = FALSE;
	description = "P¯iöel jsem se k v·m p¯idat.";
};


func int dia_wolf_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_wolf_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//P¯iöel jsem se k v·m p¯idat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//ProË ne, j· proti tobÏ nic nem·m. Vûdyù jsi z naöeho dolu kdysi vyhnal str·ûe.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Ale nepoËÌtej s tÌm, ûe tÏ takhle snadno p¯ijmou i ostatnÌ.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Od tÈ doby sem p¯iöla spousta nov˝ch lidÌ a nÏkte¯Ì sta¯Ì ûold·ci uû se na tebe asi ani nebudou pamatovat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//J· tÏ taky skoro nepoznal, jsi nÏjak˝ zruchan˝.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Kdyû bariÈra padla, sotva jsem si zachr·nil hol˝ ûivot.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Tak tos mÏl teda ötÏstÌ.
	b_logentry(TOPIC_SLDRESPEKT,"Wolfovi nebude vadit, kdyû se p¯ipojÌm k ûoldnÈ¯˘m.");
};


instance DIA_WOLF_WANNABUY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 6;
	condition = dia_wolf_wannabuy_condition;
	information = dia_wolf_wannabuy_info;
	permanent = FALSE;
	description = "Nem·ö nÏco na prodej?";
};


func int dia_wolf_wannabuy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannabuy_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Nem·ö nÏco na prodej?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//¡le, ani se neptej.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//O zbranÏ a zbroj se teÔ star· Bennet, jeden z tÏch nov˝ch chl·pk˘.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//V kolonii jsem vedl celou Leeovu zbrojÌrnu a pak si p¯ijde nÏjak˝ ökolen˝ kov·¯ a b·c, jsem bez pr·ce.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Zoufale pot¯ebuju novou pr·ci, i kdyû tu nedÏl·m nic jinÈho, neû hlÌd·m polnosti.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Ale nevadÌ mi to, aspoÚ tu nemusÌm sedÏt s rukama v klÌnÏ.
};


instance DIA_WOLF_WANNALEARN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 7;
	condition = dia_wolf_wannalearn_condition;
	information = dia_wolf_wannalearn_info;
	permanent = FALSE;
	description = "M˘ûu se u tebe nÏËemu p¯iuËit?";
};


func int dia_wolf_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannalearn_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//M˘ûu se u tebe nÏËemu p¯iuËit?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jestli chceö, m˘ûu ti poradit p·r trik˘ v zach·zenÌ s lukem. Nic lepöÌho teÔ stejnÏ dÏlat nem˘ûu.
	WOLF_TEACHBOW = TRUE;
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Wolf mÏ nauËÌ zach·zet s luky.");
};


var int wolf_merke_bow;

instance DIA_WOLF_TEACH(C_INFO)
{
	npc = sld_811_wolf;
	nr = 8;
	condition = dia_wolf_teach_condition;
	information = dia_wolf_teach_info;
	permanent = TRUE;
	description = "ChtÏl bych se trochu vylepöit ve st¯elbÏ.";
};


func int dia_wolf_teach_condition()
{
	if(WOLF_TEACHBOW == TRUE)
	{
		return TRUE;
	};
};

func void dia_wolf_teach_info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//ChtÏl bych se trochu vylepöit ve st¯elbÏ.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Co bych tÏ mÏl nauËit?
	WOLF_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_back()
{
	if(WOLF_MERKE_BOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//A je to. Uû m·ö zase o nÏco p¯esnÏjöÌ ruku.
	};
	Info_ClearChoices(dia_wolf_teach);
};

func void dia_wolf_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};


instance DIA_WOLF_PERM(C_INFO)
{
	npc = sld_811_wolf;
	nr = 9;
	condition = dia_wolf_perm_condition;
	information = dia_wolf_perm_info;
	permanent = TRUE;
	description = "Tak co? Uû sis naöel novou pr·ci?";
};


func int dia_wolf_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_perm_info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Tak co? Uû sis naöel novou pr·ci?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Ne, zatÌm ne. Dej mi vÏdÏt, jestli na nÏco natrefÌö.
};


instance DIA_WOLF_STADT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 10;
	condition = dia_wolf_stadt_condition;
	information = dia_wolf_stadt_info;
	permanent = FALSE;
	description = "Zkouöel sis nÏco najÌt ve mÏstÏ?";
};


func int dia_wolf_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_stadt_info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Zkouöel sis nÏco najÌt ve mÏstÏ?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//Ve mÏstÏ? (smÏje se) Tam by mÏ nedostali ani p·rem vol˘!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Nebo si myslÌö, ûe bych tam mÏl dÏlat nÏjakÈho voj·ka z domobrany? Nedovedu si p¯edstavit, ûe bych nosil uniformu jak nÏjak˝ dvo¯an.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//A pak ta slep· posluönost. Ne, zapomeÚ na to - moûn· tady na farmÏ nem·m moc co na pr·ci, ale aspoÚ si m˘ûu dÏlat, co chci.
};


var int mis_wolf_bringcrawlerplates;
var int wolf_makearmor;
var int player_gotcrawlerarmor;

instance DIA_WOLF_ABOUTCRAWLER(C_INFO)
{
	npc = sld_811_wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawler_condition;
	information = dia_wolf_aboutcrawler_info;
	permanent = FALSE;
	description = "Slyöel jsem, ûe umÌö vykovat zbroj z ËervÌch krun˝¯˘?";
};


func int dia_wolf_aboutcrawler_condition()
{
	if((KAPITEL >= 2) && (WOLF_PRODUCECRAWLERARMOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawler_info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Slyöel jsem, ûe umÌö vykovat zbroj z ËervÌch krun˝¯˘?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//To je fakt. Od koho ses to dozvÏdÏl?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//ÿekl mi to lovec jmÈnem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Dok·zal bys takovou zbroj vyrobit?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//JasnÏ. P¯ines mi 10 ËervÌch krun˝¯˘ a j· ti ji vyrobÌm.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//A kolik za ni budeö chtÌt?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Na placenÌ zapomeÚ, udÏl·m ti ji gr·tis, na pam·tku star˝ch dobr˝ch Ëas˘.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_RUNNING);
	b_logentry(TOPIC_WOLF_BRINGCRAWLERPLATES,"Wolf mi z 10 ËervÌch krun˝¯˘ vykov· zbroj.");
};


instance DIA_WOLF_TEACHCRAWLERPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_teachcrawlerplates_condition;
	information = dia_wolf_teachcrawlerplates_info;
	permanent = TRUE;
	description = b_buildlearnstring("M˘ûeö mÏ nauËit, jak ËervÌ krun˝¯e oddÏlit?",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE));
};


func int dia_wolf_teachcrawlerplates_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_teachcrawlerplates_info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//M˘ûeö mÏ nauËit, jak ËervÌ krun˝¯e oddÏlit?
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To je jednoduchÈ. ZadnÌ krun˝¯e jsou totiû na tÏle pevnÏ p¯ichyceny pouze na okrajÌch. StaËÌ je ostr˝m noûem od¯Ìznout a je to.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Ch·peö?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To je jednoduchÈ.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//Vûdyù to povÌd·m.
	};
};


instance DIA_WOLF_BRINGPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 3;
	condition = dia_wolf_bringplates_condition;
	information = dia_wolf_bringplates_info;
	permanent = TRUE;
	description = "Sehnal jsem ty ËervÌ krun˝¯e na brnÏnÌ.";
};


func int dia_wolf_bringplates_condition()
{
	if((MIS_WOLF_BRINGCRAWLERPLATES == LOG_RUNNING) && (Npc_HasItems(other,itat_crawlerplate) >= 10))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplates_info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty ËervÌ krun˝¯e na brnÏnÌ.
	b_giveinvitems(other,self,itat_crawlerplate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//SkvÏlÈ, tak je sem dej!
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_SUCCESS;
};


var int wolf_armor_day;

instance DIA_WOLF_ARMORREADY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_armorready_condition;
	information = dia_wolf_armorready_info;
	permanent = TRUE;
	description = "Prima, a kdy ta zbroj bude?";
};


func int dia_wolf_armorready_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_GOTCRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorready_info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Prima, a kdy ta zbroj bude?
	if(Npc_HasItems(self,itat_crawlerplate) >= 10)
	{
		if(WOLF_MAKEARMOR == FALSE)
		{
			WOLF_ARMOR_DAY = Wld_GetDay() + 1;
			WOLF_MAKEARMOR = TRUE;
		};
		if((WOLF_MAKEARMOR == TRUE) && (WOLF_ARMOR_DAY > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji d·m dohromady. Vraù se zÌtra.
		}
		else
		{
			CreateInvItems(self,itar_djg_crawler,1);
			Npc_RemoveInvItems(self,itat_crawlerplate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Uû je hotov· - tady je.
			b_giveinvitems(self,other,itar_djg_crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Jak tak kouk·m, to provedenÌ je fakt skvÏlÈ.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//DÌky!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//NenÌ zaË.
			PLAYER_GOTCRAWLERARMOR = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ty vtip·lku, nejd¯Ìv pot¯ebuju ty ËervÌ krun˝¯e.
		WOLF_MAKEARMOR = FALSE;
		MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	};
};


instance DIA_WOLF_KAP3_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap3_exit_condition;
	information = dia_wolf_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_wolf_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_BENGAR(C_INFO)
{
	npc = sld_811_wolf;
	nr = 31;
	condition = dia_wolf_bengar_condition;
	information = dia_wolf_bengar_info;
	permanent = TRUE;
	description = "Moûn· jsem ti naöel pr·ci u Bengara na statku.";
};


func int dia_wolf_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (MIS_BENGARSHELPINGSLD == LOG_RUNNING) && (KAPITEL >= 3) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_bengar_onetime;
var int wolf_bengar_geld;

func void dia_wolf_bengar_info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Moûn· jsem ti naöel pr·ci u Bengara na statku.
	if(DIA_WOLF_BENGAR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak povÌdej.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//P¯Ìmo u Bengarova statku ˙stÌ pr˘smyk do HornickÈho ˙dolÌ, kter˝m se po¯·d snaûÌ prodrat nÏjakÈ obludy. NemusÌm ani dod·vat, ûe z nich m· ten sedl·k pÏknÏ tÏûkou hlavu.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je t¯eba, aby Bengar˘v statek nÏkdo st¯eûil.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Na tom by mohlo nÏco b˝t. AspoÚ budu venku na poli a nebudu muset po¯·d okounÏt tady u kov·rny.
		DIA_WOLF_BENGAR_ONETIME = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//SouhlasÌm. A kdyû jsi teÔ jednÌm z n·s, udÏl·m ti dobrou cenu. Dej mi 300 zlaù·k˘ a j· tam hned vyrazÌm.
		WOLF_BENGAR_GELD = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Dob¯e. DÏl· to 800 zlaù·k˘.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To je po¯·dn˝ balÌk.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//No, pro nÏkoho z n·s bych to udÏlal za babku, ale pro tebe...
		WOLF_BENGAR_GELD = 800;
	};
	Info_ClearChoices(dia_wolf_bengar);
	Info_AddChoice(dia_wolf_bengar,"Budu o tom p¯em˝ölet.",dia_wolf_bengar_nochnicht);
	Info_AddChoice(dia_wolf_bengar,"Tady je zlato.",dia_wolf_bengar_geld);
};

func void dia_wolf_bengar_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Tady je zlato.
	if(b_giveinvitems(other,self,itmi_gold,WOLF_BENGAR_GELD))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a teÔ p˘jdu dohlÌdnout na ty nestv˘ry. UvidÌme, jestli se mi na tÈ farmÏ poda¯Ì jeötÏ nÏkoho naverbovat.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zatÌm mÏj.
		MIS_BENGARSHELPINGSLD = LOG_SUCCESS;
		b_giveplayerxp(XP_BENGARSHELPINGSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		b_startotherroutine(sld_815_soeldner,"BengarsFarm");
		b_startotherroutine(sld_817_soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//No, kdybys mÏl dost penÏz, uû bych byl d·vno na cestÏ.
	};
	Info_ClearChoices(dia_wolf_bengar);
};

func void dia_wolf_bengar_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Budu o tom p¯em˝ölet.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Fajn, ale ne abys mÏ shodil.
	Info_ClearChoices(dia_wolf_bengar);
};


instance DIA_WOLF_PERMKAP3(C_INFO)
{
	npc = sld_811_wolf;
	nr = 80;
	condition = dia_wolf_permkap3_condition;
	information = dia_wolf_permkap3_info;
	permanent = TRUE;
	description = "Tak co, vöechno v cajku?";
};


func int dia_wolf_permkap3_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_permkap3_onetime;

func void dia_wolf_permkap3_info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Tak co, vöechno v cajku?
	if(Npc_IsDead(bengar) && (DIA_WOLF_PERMKAP3_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//M˘j zamÏstnavatel je mrtv˝. No, a j· si vûdycky p¯·l mÌt vlastnÌ statek.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_WOLF_PERMKAP3_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//No jasnÏ! Vöude ticho jako v chr·mu!
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP4_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap4_exit_condition;
	information = dia_wolf_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_wolf_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP5_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap5_exit_condition;
	information = dia_wolf_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_wolf_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


var int wolf_saidno;

instance DIA_WOLF_SHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_ship_condition;
	information = dia_wolf_ship_info;
	description = "NelÌbilo by se ti odsud vyplout na lodi?";
};


func int dia_wolf_ship_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_ship_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//NelÌbilo by se ti odsud vyplout na lodi?
	if((MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && !Npc_IsDead(bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Ne, uû ne. KoneËnÏ jsem si naöel pr·ci. Moûn· nÏkdy jindy.
		WOLF_SAIDNO = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//No jasnÏ, pojÔme odsud. M˘ûu ti pomoct s obranou lodi. A kam m·me namÌ¯eno?
		MIS_BENGARSHELPINGSLD = LOG_OBSOLETE;
		Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
		b_logentry(TOPIC_CREW,"Wolf uû m· tohoto ostrova plnÈ zuby a udÏlal by cokoliv, jen aby se odsud dostal. Je to dobr˝ bojovnÌk.");
	};
};


instance DIA_WOLF_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_knowwhereenemy_condition;
	information = dia_wolf_knowwhereenemy_info;
	permanent = TRUE;
	description = "Chci se dostat na ostrov nedaleko odsud.";
};


func int dia_wolf_knowwhereenemy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_ship) && (WOLF_SAIDNO == FALSE) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (WOLF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Chci se dostat na ostrov nedaleko odsud.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No tak na co jeötÏ Ëek·me? Na mo¯i tÏ m˘ûu trochu pocviËit ve st¯elbÏ z luku a kuöe.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//VlastnÏ jsem si zrovna uvÏdomil, ûe uû m·m dost lidÌ.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(naötvanÏ) Tak TAKHLE to je! Nejd¯Ìv prudÌö, aù se pohnu, a pak z toho nic nenÌ, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Jdi do hajzlu! Douf·m, ûe se ta tvoje koc·bka brzo potopÌ.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(dia_wolf_knowwhereenemy);
		Info_AddChoice(dia_wolf_knowwhereenemy,"MusÌm o tom jeötÏ trochu pop¯em˝ölet.",dia_wolf_knowwhereenemy_no);
		Info_AddChoice(dia_wolf_knowwhereenemy,"VÌtej na palubÏ!",dia_wolf_knowwhereenemy_yes);
	};
};

func void dia_wolf_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//VÌtej na palubÏ!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//P¯ijÔ dol˘ do p¯Ìstavu, uû brzo vyplujeme.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Uû jdu.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	WOLF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void dia_wolf_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//MusÌm o tom jeötÏ trochu pop¯em˝ölet.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Hele, vÌö co si myslÌm? ée se jenom tak vytahujeö. NevÏ¯Ìm ti ani slovo, vysmahni!
	WOLF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_wolf_knowwhereenemy);
};


instance DIA_WOLF_LEAVEMYSHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 55;
	condition = dia_wolf_leavemyship_condition;
	information = dia_wolf_leavemyship_info;
	permanent = TRUE;
	description = "StejnÏ uû mi nejsi k niËemu.";
};


func int dia_wolf_leavemyship_condition()
{
	if((WOLF_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_leavemyship_info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//StejnÏ uû mi nejsi k niËemu.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Nejd¯Ìv mi d·ö nadÏji a pak mÏ takhle odmÌtneö. Ty svinÏ, za tohle zaplatÌö!
	WOLF_ISONBOARD = LOG_FAILED;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_WOLF_SHIPOFF(C_INFO)
{
	npc = sld_811_wolf;
	nr = 56;
	condition = dia_wolf_shipoff_condition;
	information = dia_wolf_shipoff_info;
	permanent = TRUE;
	description = "Poslouchej.";
};


func int dia_wolf_shipoff_condition()
{
	if(WOLF_ISONBOARD == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_wolf_shipoff_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Poslouchej.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Jdi do prdele, ty zkurvysynu!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_WOLF_KAP6_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap6_exit_condition;
	information = dia_wolf_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_wolf_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf;
	nr = 900;
	condition = dia_wolf_pickpocket_condition;
	information = dia_wolf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_wolf_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_pickpocket);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_BACK,dia_wolf_pickpocket_back);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_PICKPOCKET,dia_wolf_pickpocket_doit);
};

func void dia_wolf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_pickpocket);
};

func void dia_wolf_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_pickpocket);
};

