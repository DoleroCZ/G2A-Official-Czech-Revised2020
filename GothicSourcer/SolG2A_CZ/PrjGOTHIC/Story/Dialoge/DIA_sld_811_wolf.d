
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
	description = "Jsi v po��dku?";
};


func int dia_wolf_hallo_condition()
{
	return TRUE;
};

func void dia_wolf_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Jsi v po��dku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, j� t� zn�m! Z kolonie!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Co tady chce�?
};


instance DIA_WOLF_WANNAJOIN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 5;
	condition = dia_wolf_wannajoin_condition;
	information = dia_wolf_wannajoin_info;
	permanent = FALSE;
	description = "P�i�el jsem se k v�m p�idat.";
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
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//P�i�el jsem se k v�m p�idat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Pro� ne, j� proti tob� nic nem�m. V�dy� jsi z na�eho dolu kdysi vyhnal str�e.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Ale nepo��tej s t�m, �e t� takhle snadno p�ijmou i ostatn�.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Od t� doby sem p�i�la spousta nov�ch lid� a n�kte�� sta�� �old�ci u� se na tebe asi ani nebudou pamatovat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//J� t� taky skoro nepoznal, jsi n�jak� zruchan�.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Kdy� bari�ra padla, sotva jsem si zachr�nil hol� �ivot.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Tak tos m�l teda �t�st�.
	b_logentry(TOPIC_SLDRESPEKT,"Wolfovi nebude vadit, kdy� se p�ipoj�m k �oldn���m.");
};


instance DIA_WOLF_WANNABUY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 6;
	condition = dia_wolf_wannabuy_condition;
	information = dia_wolf_wannabuy_info;
	permanent = FALSE;
	description = "Nem� n�co na prodej?";
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
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Nem� n�co na prodej?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//�le, ani se neptej.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//O zbran� a zbroj se te� star� Bennet, jeden z t�ch nov�ch chl�pk�.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//V kolonii jsem vedl celou Leeovu zbroj�rnu a pak si p�ijde n�jak� �kolen� kov�� a b�c, jsem bez pr�ce.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Zoufale pot�ebuju novou pr�ci, i kdy� tu ned�l�m nic jin�ho, ne� hl�d�m polnosti.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Ale nevad� mi to, aspo� tu nemus�m sed�t s rukama v kl�n�.
};


instance DIA_WOLF_WANNALEARN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 7;
	condition = dia_wolf_wannalearn_condition;
	information = dia_wolf_wannalearn_info;
	permanent = FALSE;
	description = "M��u se u tebe n��emu p�iu�it?";
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
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//M��u se u tebe n��emu p�iu�it?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jestli chce�, m��u ti poradit p�r trik� v zach�zen� s lukem. Nic lep��ho te� stejn� d�lat nem��u.
	WOLF_TEACHBOW = TRUE;
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Wolf m� nau�� zach�zet s luky.");
};


var int wolf_merke_bow;

instance DIA_WOLF_TEACH(C_INFO)
{
	npc = sld_811_wolf;
	nr = 8;
	condition = dia_wolf_teach_condition;
	information = dia_wolf_teach_info;
	permanent = TRUE;
	description = "Cht�l bych se trochu vylep�it ve st�elb�.";
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
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Cht�l bych se trochu vylep�it ve st�elb�.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Co bych t� m�l nau�it?
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
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//A je to. U� m� zase o n�co p�esn�j�� ruku.
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
	description = "Tak co? U� sis na�el novou pr�ci?";
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
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Tak co? U� sis na�el novou pr�ci?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Ne, zat�m ne. Dej mi v�d�t, jestli na n�co natref�.
};


instance DIA_WOLF_STADT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 10;
	condition = dia_wolf_stadt_condition;
	information = dia_wolf_stadt_info;
	permanent = FALSE;
	description = "Zkou�el sis n�co naj�t ve m�st�?";
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
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Zkou�el sis n�co naj�t ve m�st�?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//Ve m�st�? (sm�je se) Tam by m� nedostali ani p�rem vol�!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Nebo si mysl�, �e bych tam m�l d�lat n�jak�ho voj�ka z domobrany? Nedovedu si p�edstavit, �e bych nosil uniformu jak n�jak� dvo�an.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//A pak ta slep� poslu�nost. Ne, zapome� na to - mo�n� tady na farm� nem�m moc co na pr�ci, ale aspo� si m��u d�lat, co chci.
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
	description = "Sly�el jsem, �e um� vykovat zbroj z �erv�ch krun���?";
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
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Sly�el jsem, �e um� vykovat zbroj z �erv�ch krun���?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//To je fakt. Od koho ses to dozv�d�l?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//�ekl mi to lovec jm�nem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Dok�zal bys takovou zbroj vyrobit?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasn�. P�ines mi 10 �erv�ch krun��� a j� ti ji vyrob�m.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//A kolik za ni bude� cht�t?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Na placen� zapome�, ud�l�m ti ji gr�tis, na pam�tku star�ch dobr�ch �as�.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_RUNNING);
	b_logentry(TOPIC_WOLF_BRINGCRAWLERPLATES,"Wolf mi z 10 �erv�ch krun��� vykov� zbroj.");
};


instance DIA_WOLF_TEACHCRAWLERPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_teachcrawlerplates_condition;
	information = dia_wolf_teachcrawlerplates_info;
	permanent = TRUE;
	description = b_buildlearnstring("M��e� m� nau�it, jak �erv� krun��e odd�lit?",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE));
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
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//M��e� m� nau�it, jak �erv� krun��e odd�lit?
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To je jednoduch�. Zadn� krun��e jsou toti� na t�le pevn� p�ichyceny pouze na okraj�ch. Sta�� je ostr�m no�em od��znout a je to.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Ch�pe�?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To je jednoduch�.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//V�dy� to pov�d�m.
	};
};


instance DIA_WOLF_BRINGPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 3;
	condition = dia_wolf_bringplates_condition;
	information = dia_wolf_bringplates_info;
	permanent = TRUE;
	description = "Sehnal jsem ty �erv� krun��e na brn�n�.";
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
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty �erv� krun��e na brn�n�.
	b_giveinvitems(other,self,itat_crawlerplate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Skv�l�, tak je sem dej!
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
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji d�m dohromady. Vra� se z�tra.
		}
		else
		{
			CreateInvItems(self,itar_djg_crawler,1);
			Npc_RemoveInvItems(self,itat_crawlerplate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//U� je hotov� - tady je.
			b_giveinvitems(self,other,itar_djg_crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Jak tak kouk�m, to proveden� je fakt skv�l�.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//D�ky!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Nen� za�.
			PLAYER_GOTCRAWLERARMOR = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ty vtip�lku, nejd��v pot�ebuju ty �erv� krun��e.
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
	description = "Mo�n� jsem ti na�el pr�ci u Bengara na statku.";
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
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Mo�n� jsem ti na�el pr�ci u Bengara na statku.
	if(DIA_WOLF_BENGAR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak pov�dej.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//P��mo u Bengarova statku �st� pr�smyk do Hornick�ho �dol�, kter�m se po��d sna�� prodrat n�jak� obludy. Nemus�m ani dod�vat, �e z nich m� ten sedl�k p�kn� t�kou hlavu.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je t�eba, aby Bengar�v statek n�kdo st�e�il.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Na tom by mohlo n�co b�t. Aspo� budu venku na poli a nebudu muset po��d okoun�t tady u kov�rny.
		DIA_WOLF_BENGAR_ONETIME = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Souhlas�m. A kdy� jsi te� jedn�m z n�s, ud�l�m ti dobrou cenu. Dej mi 300 zla��k� a j� tam hned vyraz�m.
		WOLF_BENGAR_GELD = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Dob�e. D�l� to 800 zla��k�.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To je po��dn� bal�k.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//No, pro n�koho z n�s bych to ud�lal za babku, ale pro tebe...
		WOLF_BENGAR_GELD = 800;
	};
	Info_ClearChoices(dia_wolf_bengar);
	Info_AddChoice(dia_wolf_bengar,"Budu o tom p�em��let.",dia_wolf_bengar_nochnicht);
	Info_AddChoice(dia_wolf_bengar,"Tady je zlato.",dia_wolf_bengar_geld);
};

func void dia_wolf_bengar_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Tady je zlato.
	if(b_giveinvitems(other,self,itmi_gold,WOLF_BENGAR_GELD))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a te� p�jdu dohl�dnout na ty nestv�ry. Uvid�me, jestli se mi na t� farm� poda�� je�t� n�koho naverbovat.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zat�m m�j.
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
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//No, kdybys m�l dost pen�z, u� bych byl d�vno na cest�.
	};
	Info_ClearChoices(dia_wolf_bengar);
};

func void dia_wolf_bengar_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Fajn, ale ne abys m� shodil.
	Info_ClearChoices(dia_wolf_bengar);
};


instance DIA_WOLF_PERMKAP3(C_INFO)
{
	npc = sld_811_wolf;
	nr = 80;
	condition = dia_wolf_permkap3_condition;
	information = dia_wolf_permkap3_info;
	permanent = TRUE;
	description = "Tak co, v�echno v cajku?";
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
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Tak co, v�echno v cajku?
	if(Npc_IsDead(bengar) && (DIA_WOLF_PERMKAP3_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//M�j zam�stnavatel je mrtv�. No, a j� si v�dycky p��l m�t vlastn� statek.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_WOLF_PERMKAP3_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//No jasn�! V�ude ticho jako v chr�mu!
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
	description = "Nel�bilo by se ti odsud vyplout na lodi?";
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
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nel�bilo by se ti odsud vyplout na lodi?
	if((MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && !Npc_IsDead(bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Ne, u� ne. Kone�n� jsem si na�el pr�ci. Mo�n� n�kdy jindy.
		WOLF_SAIDNO = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//No jasn�, poj�me odsud. M��u ti pomoct s obranou lodi. A kam m�me nam��eno?
		MIS_BENGARSHELPINGSLD = LOG_OBSOLETE;
		Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
		b_logentry(TOPIC_CREW,"Wolf u� m� tohoto ostrova pln� zuby a ud�lal by cokoliv, jen aby se odsud dostal. Je to dobr� bojovn�k.");
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
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No tak na co je�t� �ek�me? Na mo�i t� m��u trochu pocvi�it ve st�elb� z luku a ku�e.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Vlastn� jsem si zrovna uv�domil, �e u� m�m dost lid�.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(na�tvan�) Tak TAKHLE to je! Nejd��v prud�, a� se pohnu, a pak z toho nic nen�, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Jdi do hajzlu! Douf�m, �e se ta tvoje koc�bka brzo potop�.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(dia_wolf_knowwhereenemy);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Mus�m o tom je�t� trochu pop�em��let.",dia_wolf_knowwhereenemy_no);
		Info_AddChoice(dia_wolf_knowwhereenemy,"V�tej na palub�!",dia_wolf_knowwhereenemy_yes);
	};
};

func void dia_wolf_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//V�tej na palub�!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//P�ij� dol� do p��stavu, u� brzo vyplujeme.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//U� jdu.
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
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Mus�m o tom je�t� trochu pop�em��let.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Hele, v� co si mysl�m? �e se jenom tak vytahuje�. Nev���m ti ani slovo, vysmahni!
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
	description = "Stejn� u� mi nejsi k ni�emu.";
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
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Stejn� u� mi nejsi k ni�emu.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Nejd��v mi d� nad�ji a pak m� takhle odm�tne�. Ty svin�, za tohle zaplat�!
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

