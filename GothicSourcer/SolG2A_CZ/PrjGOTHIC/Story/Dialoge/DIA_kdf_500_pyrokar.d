
instance DIA_PYROKAR_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_exit_condition;
	information = dia_pyrokar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_WELCOME(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_welcome_condition;
	information = dia_pyrokar_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_welcome_info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//Tak ty jsi ten nov� novic. Dobr�, p�edpokl�d�m, �e u� t� s tv�mi povinnostmi obezn�mil otec Parlan.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(lehce k�rav�) V�, �e ka�d� �len Spole�enstva ohn� by m�l sv� povinnosti plnit v souladu s Innosovou v�l�.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "Mus�m mluvit s paladiny. Dost to sp�ch�.";
};


func int dia_pyrokar_hagen_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_pyrokar_hagen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Mus�m mluvit s paladiny. Dost to sp�ch�.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//A �ekne� n�m, pro� s nimi chce� mluvit?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//M�m pro n� d�le�itou zpr�vu.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//Co by to jako m�lo b�t za zpr�vu?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//V Hornick�m �dol� se shroma��uje arm�da zla veden� draky! Mus�me je zastavit, dokud m��eme.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hm. Budeme o tv�ch slovech p�em��let, novici. A� nadejde �as, d�me ti v�d�t, jak rada rozhodla.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//Mezit�m by sis m�l l�pe hled�t povinnost� novice.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Dobr�, u� t� nebudeme d�le zdr�ovat od tv� pr�ce - m��e� j�t.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_AUGE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_auge_condition;
	information = dia_pyrokar_auge_info;
	permanent = FALSE;
	description = "Hled�m Innosovo oko.";
};


func int dia_pyrokar_auge_condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_auge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Hled�m Innosovo oko.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Ka�d�, kdo si mysl�, �e by mohl svat� amulet nejen naj�t, ale dokonce ho i pou��vat, je hlup�k.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//Amulet si s�m vyb�r� sv�ho majitele - nikdo, krom� toho, komu je to p�edur�eno, ho nen� schopen nosit.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Jsem ochotn� to zkusit.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Povinnosti novice t� maj� nau�it poko�e - ne ��dostivosti.
	b_logentry(TOPIC_INNOSEYE,"Nemysl�m, �e by to bylo tak t�k�, ale Pyrokar mi Oko dobrovoln� a bez pomoci paladin� nevyd�.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Dobr�, u� t� nebudeme d�l zdr�ovat od tv� pr�ce - m��e� j�t.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_PYROKAR_MISSINGPEOPLE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_addon_pyrokar_missingpeople_condition;
	information = dia_addon_pyrokar_missingpeople_info;
	description = "N�kte�� ob�an� Khorinisu zmizeli za podivn�ch okolnost�.";
};


func int dia_addon_pyrokar_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_pyrokar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//N�kte�� ob�an� Khorinisu zmizeli za podivn�ch okolnost�.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Jsem si toho v�dom a je to politov�n�hodn�. Nicm�n� jsme souhlasili s m�gy Vody, �e na tu v�c dohl�dnou.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//To sam� se t�ka t� z�le�istosti s t�mi podivn�mi zem�t�esen�my v severov�chodn� oblasti Khorinosu.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//V tomto okam�iku nic nenasv�d�uje tomu, �e na�e zakro�en� by m�lo zaru�en� v�sledek. Z tohoto d�vodu se nebudeme do ni�eho pou�t�t.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Ano, ale ...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//��dn� ALE! Budeme pokra�ovat jak uzn�me za vhodn� a douf�m, �e i TY bude� respektovat toto usnesen�.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"M�gov� Ohn� lituj� zmizel�ch ob�an� Khorinosu . Nicm�n� ��kaj�, �e by to byl �kol pro m�gy Vody. Neo�ek�vejte tedy pomoc od kl�tera ohniv�ch m�g�.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_GOAWAY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_goaway_condition;
	information = dia_pyrokar_goaway_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_goaway_condition()
{
	if((Npc_KnowsInfo(hero,dia_addon_pyrokar_missingpeople) == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_pyrokar_hagen) && Npc_KnowsInfo(hero,dia_pyrokar_auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_goaway_info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(rozzloben�) Poslu�nost pat�� mezi ctnosti, kter�ch se m� je�t� co u�it. A� tak, �i tak.
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "Cht�l bych podstoupit Zkou�ku ohn�.";
};


func int dia_pyrokar_fire_condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_fire_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Cht�l bych podstoupit Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(p�ekvapen�) Tak ty o tom v�... ty chce� podstoupit Zkou�ku ohn�?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Ano, pro�etl jsem si Pr�vo ohn�, kde se ��k�...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(p��k�e p�eru��) My zn�me Pr�vo ohn�. Taky jsme ale vid�li mnoho novic� b�hem toho testu zem��t. M�l bys sv� rozhodnut� je�t� zv�it.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//To jsem u� ud�lal. Chci tu zkou�ku - a jsem p�ipraven j� proj�t.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(varovn�) Kdy� na tom bezpodm�ne�n� trv�, tak t� Rada k t� zkou�ce p�izve.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Trv�m na tom, abych byl p�izv�n ke Zkou�ce ohn�.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//V tom p��pad� - a� je po tv�m. A� bude� p�ipraven, dostane� od ka�d�ho m�ga Rady �kol, jej� mus� splnit.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Nech� se Innos slituje nad tvou du��.
	b_logentry(TOPIC_FIRECONTEST,"Po��dal jsem Pyrokara o Zkou�ku ohn�. Nyn� mus�m splnit t�i �koly, kter� mi zad� Nejvy��� rada.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.";
};


func int dia_pyrokar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_test_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//A jedin� Innos s�m v�, jestli j� projde�. Podstupuje� stejnou zkou�ku, jak� je ur�ena vyvolen�m novic�m.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Zkou�ka magie. (odm��en�) Asi v�, �e zkou�kou m��e proj�t pouze jeden jedin� novic.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//To v�m. Tak kdo jsou moji soupe�i?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Innos ve sv� moudrosti vybral t�i novice, kte�� se tak� chystaj� proj�t testem: Agon, Igaraz a Ulf. U� za�ali s hled�n�m.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(�se�n�) Ale dost u� o tom! Sly� slova t�to zkou�ky: 'N�sleduj Innosova znamen� a dones n�m, co v���c� nalezl na konci cesty.'
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Bude� pot�ebovat tenhle kl��.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//To je v�e, co ti k tomu �ekneme.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Pyrokar pro m� p�ipravuje zkou�ku magie - stejnou jako je ta, kterou podstoup� zvolen� novicov� Ulf, Igaraz a Agon.");
	b_logentry(TOPIC_SCHNITZELJAGD,"Mus�m n�sledovat Innosova znamen� a p�in�st to, co v���c� najde na sv� cest�. Dostal jsem k tomu i kl��.");
	CreateInvItems(self,itke_magicchest,1);
	b_giveinvitems(self,other,itke_magicchest,1);
	b_startotherroutine(igaraz,"CONTEST");
	AI_Teleport(igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(igaraz,itke_magicchest,1);
	igaraz.aivar[AIV_DROPDEADANDKILL] = TRUE;
	igaraz.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(nov607,"EXCHANGE");
	b_startotherroutine(agon,"GOLEMDEAD");
	AI_Teleport(agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(agon,itke_magicchest,1);
	agon.aivar[AIV_DROPDEADANDKILL] = TRUE;
	agon.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(ulf,"SUCHE");
	AI_Teleport(ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(ulf,itke_magicchest,1);
	ulf.aivar[AIV_DROPDEADANDKILL] = TRUE;
	ulf.aivar[AIV_NEWSOVERRIDE] = TRUE;
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNNING(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 20;
	condition = dia_pyrokar_running_condition;
	information = dia_pyrokar_running_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pyrokar_running_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",itmi_runeblank))
	{
		return TRUE;
	};
};

func void dia_pyrokar_running_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Dokud bude� pracovat na zkou�ce, nesm�me ti nic ��ct.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Co tady je�t� post�v�? B� se vypo��dat se svou zkou�kou!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Nade�el �as porovnat tv� velk� slova s tv�mi skutky. Nemysl�, novici?
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_SUCCESS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_success_condition;
	information = dia_pyrokar_success_info;
	permanent = FALSE;
	description = "Na�el jsem ten runov� k�men.";
};


func int dia_pyrokar_success_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",itmi_runeblank) && ((Npc_HasItems(other,itmi_runeblank) >= 1) || (Npc_HasItems(other,itru_firebolt) >= 1)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_success_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Na�el jsem ten runov� k�men.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(nev���cn�) Ty... dok�zal jsi to?! Sledoval jsi znamen� a objevil ukryt� port�l...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... a taky jsem porazil v�echna ta stvo�en�, co m� pova�ovala za p��jemnou sva�inku.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//A co ostatn� novicov�? Co Agon? Neusp�l d��v ne� ty?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Neobst�li. P�edpokl�d�m, �e jim zkou�ka nebyla p�edur�ena.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Dobr�, tak�e vyhl�s�me, �e jsi pro�el zkou�kou. A ten runov� k�men si m��e� ponechat.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_SCHNITZELJAGD);
};


instance DIA_PYROKAR_TODO(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_todo_condition;
	information = dia_pyrokar_todo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_todo_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_todo_info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Pro�el jsi zkou�kou, kterou jsem ti p�ichystal.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Ale...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... ale je�t� mus� splnit Uthlar�v �kol.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... je�t� mus� dokon�it Serpentes�v test.
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MAGICAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_magican_condition;
	information = dia_pyrokar_magican_info;
	permanent = FALSE;
	description = "A budu te� p�ijat do Spole�enstva m�g�?";
};


func int dia_pyrokar_magican_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_magican_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//A budu te� p�ijat do Spole�enstva m�g�?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Dok�zal jsi to. Pro�el jsi Zkou�kou ohn�. Celou dobu jsme si tv�m �sp�chem byli jist�.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(ne�stupn�) Tak jako je jist�, �e ze sebe vyd� to nejlep��, aby ses mohl st�t ctihodn�m slu�ebn�kem Innose.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Tak�e pokud jsi p�ipraven slo�it P��sahu ohn�, p�ijmeme t� mezi sebe jako m�ga.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "Jsem p�ipraven vstoupit to Kruhu ohn�.";
};


func int dia_pyrokar_oath_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_magican) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_oath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Jsem p�ipraven vstoupit to Kruhu ohn�.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Dobr�, tak slo� svatou P��sahu ohn�.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(v�n�) P��sah� p�ed Innosem, kter� je na��m V�emohouc�m, jeho slu�ebn�ky a Svat�m plamenem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... �e od nyn�j�ka nav�dy bude cel� tv�j �ivot zasv�cen ohni...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... dokud tv� t�lo a tv� du�e nenalezne odpo�inku v jeho svat�ch komnat�ch a plamen tv�ho �ivota nevyhasne?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//P��sah�m.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Vy��en�m slov p��sahy jsi vstoupil do svazku s ohn�m.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Nos tuto r�bu jako symbol v��n�ho pouta.
	CreateInvItems(hero,itar_kdf_l,1);
	AI_EquipArmor(hero,itar_kdf_l);
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine(lothar,"START");
	Npc_SetTrueGuild(other,GIL_KDF);
	FIRE_CONTEST = TRUE;
	Snd_Play("LEVELUP");
	KDF_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_BECOMEMAGE);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Te�, kdy� jsme t� p�ijali mezi n�s, si m��e� promluvit s lordem Hagenem, nejvy���m velitelem paladin�.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Taky bychom velmi r�di v�d�li, jak on hodnot� situaci. Tak�e je ti dovoleno odej�t do Khorinisu.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//O�ek�v�me, �e n�m odpov�� donese� neprodlen�.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "Co v�echno se te� m��u nau�it?";
};


func int dia_pyrokar_lernen_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_pyrokar_lernen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Co v�echno se te� m��u nau�it?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Hlavn� m� te� pr�vo dozv�d�t se v�e, co se t�k� magick�ch kruh�. Daj� ti moc, kterou bude� pot�ebovat k pou��v�n� magick�ch run.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//��m vy���ho magick�ho kruhu dos�hne�, t�m siln�j�� kouzla bude� moci pou��vat.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//Od bratr� v kl�te�e se m��e� nau�it magick�m formul�m. Ka�d� z nich se zam��uje na ur�itou oblast, o kter� t� mohou hodn� nau�it.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Nap��klad Karras je mistrem vz�v�n� a vyvol�v�n�. Hyglas t� zase zasv�t� do ohniv� magie.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Nikdo toho o s�le mrazu nev� v�c ne� Marduk. Parlan t� m��e nau�it v�echna ostatn� zakl�nadla - a zasv�t� t� do prvn�ch kruh�.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//Ale mohou t� nau�it jen magick�m formul�m - runy si bude� muset vyrobit s�m.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan m� uvede do prvn�ch magick�ch kruh�.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Karras vyu�uje formule pro invoka�n� a vyvol�vac� kouzla.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Hyglas mi p�ibl�� tajemstv� ohn�.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Marduk m� sezn�m� s moc� ledu a bou��.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan vyu�uje r�zn� dal�� formule.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "Cht�l bych vyslovit jedno p��n�.";
};


func int dia_pyrokar_wunsch_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wunsch_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Cht�l bych vyslovit jedno p��n�.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//Pot�, co je ka�d� m�g p�ijat do Spole�enstva, m� pr�vo prvn�ho skutku.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Tak co ud�l� jako prvn� v�c v roli m�ga?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"Nic.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Nech� se nov�m kl�tern�m zahradn�kem stane Babo.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"A� m� novic Opolos p��stup do knihovny.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Kdyby tak Dyrian z�stal i nad�le v kl�te�e.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Nic.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(u�asle) Tak tedy budi�. Nov� m�g se vzdal sv�ho �inu.
	b_startotherroutine(dyrian,"NOFAVOUR");
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//A� novic Dyrian z�stane v kl�te�e.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Jak si p�eje�.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Novicovi bude dovoleno z�stat v kl�te�e a bude zast�vat funkci zahradn�ka, kter� je pr�v� k dispozici.
	b_giveplayerxp(XP_HELPDYRIAN);
	b_startotherroutine(dyrian,"FAVOUR");
	MIS_HELPDYRIAN = LOG_SUCCESS;
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_babo()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//A� se novic Babo star� o kl�tern� zahradu.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Jak si p�eje�.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Novicovi Babovi se s okam�itou platnost� sv��uje do p��e kl�tern� zahrada.
	b_giveplayerxp(XP_HELPBABO);
	b_startotherroutine(babo,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPBABO = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_opolos()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//A� m� novic Opolos p��stup do knihovny.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Jak si p�eje�.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//Odte� m��e novic Opolos studovat Innosovo p�smo.
	b_giveplayerxp(XP_HELPOPOLOS);
	b_startotherroutine(opolos,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPOPOLOS = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};


instance DIA_PYROKAR_NACHRICHT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_nachricht_condition;
	information = dia_pyrokar_nachricht_info;
	permanent = FALSE;
	description = "M�m zpr�vy od lorda Hagena...";
};


func int dia_pyrokar_nachricht_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pyrokar_nachricht_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//M�m zpr�vy od lorda Hagena. Po�aduje d�kazy o p��tomnosti drak� a arm�dy zla.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//Tak�e vyraz�m do Hornick�ho �dol� a p�inesu jim ten d�kaz.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Dobr�. Tak tedy spl� tento �kol. Paladin Sergio t� doprovod� do pr�smyku.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Nech� t� Innos ochra�uje.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Tak�e vyraz�m p��mo do Hornick�ho �dol�.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Dobr�. Jeliko� cestu do Hornick�ho �dol� u� zn�, nebude� pot�ebovat ��dn� doprovod.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Postarej se o tu z�le�itost pro lorda Hagena - nech� t� Innos prov�z�.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "Nau� m� posledn� magick� kruh.";
};


func int dia_pyrokar_teach_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Nau� m� posledn� magick� kruh.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Uplynulo mnoho �asu od chv�le, co jsi vstoupil do svazku s ohn�m. P�ihodilo se mnoh� a na odpo�inek nikdy nebylo p��li� �asu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Jsi Innosov�m Vyvolen�m. Proto bude� pot�ebovat v�echnu svou s�lu, abys obst�l ve v�ech nadch�zej�c�ch bitv�ch.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Te� se ode m� do�k� zasv�cen�, Vyvolen�. Vstupuje� do �est�ho kruhu - �i� sv�tlo a rozptyluj temnotu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Te� se ode m� m��e� nau�it magick� formule posledn�ho kruhu. Pokud po tom tedy tou��.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ach. A je�t� jedna v�c - chv�li mi trvalo, ne� jsem t� poznal.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//M�l jsi u sebe ten dopis, co ti dali, kdy� t� uvrhli za bari�ru.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Ano, u�et�il jsi mi tak spoustu t�ch soudn�ch kec�.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//A ty jsi Innosov�m Vyvolen�m.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//P�ijmi te� ode m� po�ehn�n�, � Vyvolen�!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innosi, sv�tlo slunce a ohni sv�ta, po�ehnej tomuto mu�i, tv�mu vyvolen�mu slu�ebn�kovi.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Dej mu odvahu, s�lu a moudrost, aby mohl p�ijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//�as je�t� nenade�el. Jakmile po cest�, kterou ti Innos ukazuje, dojde� trochu d�l, pak t� za�nu u�it.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "Instruuj m� (vytvo�en� run)";
};


func int dia_pyrokar_spells_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_spells_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Nau� m� n��emu.
	Info_ClearChoices(dia_pyrokar_spells);
	Info_AddChoice(dia_pyrokar_spells,DIALOG_BACK,dia_pyrokar_spells_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_pyrokar_spells_firerain);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_pyrokar_spells_breathofdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_pyrokar_spells_massdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_pyrokar_spells_shrink);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//Nen� nic dal��ho, �emu bych t� mohl je�t� nau�it.
	};
};

func void dia_pyrokar_spells_back()
{
	Info_ClearChoices(dia_pyrokar_spells);
};

func void dia_pyrokar_spells_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_pyrokar_spells_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_pyrokar_spells_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_pyrokar_spells_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_PYROKAR_PARLAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_parlan_condition;
	information = dia_pyrokar_parlan_info;
	permanent = FALSE;
	description = "Pos�l� m� Parlan...";
};


func int dia_pyrokar_parlan_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (PARLAN_SENDS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_parlan_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Pos�l� m� Parlan. Cht�l bych pos�lit svoji magickou moc.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Dobr�, u� ses dost nau�il a zna�n� jsi zes�lil. Odte� se bude� u�it ode m�.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "Cht�l bych pos�lit svoji magickou moc.";
};


func int dia_pyrokar_teach_mana_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,dia_pyrokar_parlan))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Cht�l bych pos�lit svoji magickou moc.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//C�t�m, �e tebou magick� moc proch�z� v pln� s�le. Dokonce u� nejsem schopen ti uk�zat, jak bys ji mohl je�t� v�ce pos�lit.
	};
	Info_ClearChoices(dia_pyrokar_teach_mana);
};

func void dia_pyrokar_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};


instance DIA_PYROKAR_PERM(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_perm_condition;
	information = dia_pyrokar_perm_info;
	permanent = TRUE;
	description = "(Po�ehn�n�)";
};


func int dia_pyrokar_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pyrokar_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Po�ehnej mi, Mist�e.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Co takhle mal� po�ehn�n�? Opravdu by se mi hodilo.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Nech� je tv� posledn� bitva proti na�emu arcinep��teli korunov�na �sp�chem. Innos bu� s tebou.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Nech� je Innos s tebou a za�ehn� v�echny pekeln� cesty, kter� se ti otev�ou.
	};
};


instance DIA_PYROKAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap3_exit_condition;
	information = dia_pyrokar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_BACKFROMOW(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_backfromow_condition;
	information = dia_pyrokar_backfromow_info;
	description = "P�ich�z�m z Hornick�ho �dol�.";
};


func int dia_pyrokar_backfromow_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_backfromow_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//P�ich�z�m z Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Co p�in�� za zpr�vy?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Nep��tel se spojil se sk�et� arm�dou a s draky.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//To u� jsme se dozv�d�li od Miltena - ale co kr�lovsk� n�klad rudy?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Doly, ve kter�ch se t�ilo pro Garonda, nemohou uspokojit kr�lovy po�adavky.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Dny jsou st�le zast�en�j�� a slune�n� sv�tlo sl�bne.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//Byl jsem napaden mu�i v �ern�ch k�p�ch.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//J� v�m. To jsou P�tra�i. Nohsledi z Beliarovy podsv�tn� ��e. Sna�� se nad tebou z�skat moc.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Jakmile se t� zmocn�, u� to nebude� ty. Jedin� tady v kl�te�e ti pak bude pomoci. Tak�e bu� opatrn�.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar mi vypr�v�l o P�tra��ch, mu��ch v �ern�ch h�bitech, kte�� jsou Beliarov�mi nohsledy. Varoval m�, �e dok�� ovl�dat a posednout druh�. M�m se vr�tit p��mo do kl�tera, aby se mi to n�hodou nestalo tak�.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Po��dal jsem Karrase, aby se na tu z�le�itost pod�val. Ur�it� brzy dojde k n��emu, co n�m dopom��e k lep��mu pochopen� toho v�eho.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar nak�zal Karrasovi, aby se vypo��dal s hrozbou P�tra��.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//Tady - pokud bude� pot�ebovat na�i pomoc, p�enese t� tahle runa p��mo do kl�tera.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Pamatuj, mus�me z�stat ostra�it�, nebo budeme odsouzeni k z�hub�.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "P�i�el jsem si pro Innosovo oko.";
};


func int dia_pyrokar_giveinnoseye_condition()
{
	if((KAPITEL == 3) && Npc_HasItems(other,itwr_permissiontowearinnoseye_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//P�i�el jsem si pro Innosovo oko.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Vid�m, �e t� lord Hagen pov��il �d�lem n�st Innosovo oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Boj�m se, �e t� mus�m zklamat. Stali jsme se ob�t� zr�dn�ho spiknut� nep��tele.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Innosovo oko bylo n�siln� odebr�no z t�chto svat�ch zd�.
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kdo se opov�il, pane?",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kdo to byl?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Kdo se opov�il, pane?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Kdo to byl?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Zlo je vychytral� a v�dycky pracuje v utajen�. Jen velmi vz�cn� se ti poda�� odhalit jeho intriky na denn�m sv�tle.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//Ale v t�chto dnech je to jin� v�c. Nep��tel se ukazuje zcela otev�en� na ulic�ch, v ka�d�m dom� a na ka�d�m n�m�st�.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//To m��e znamenat jen to, �e u� se neboj� ��dn�ho nep��tele a nezastav� se p�ed ni��m.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Jeden z na�ich v�rn�ch n�sledovn�k�, kandid�t na nositele r�by vyvolen�ch m�g� ohn�, ne�ekan� zm�nil p�edm�t sv� v�rnosti a propadl oby�ej�m zla. Pedro.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Nep��tel se zmocnil jeho mysli a p�ivedl n�s tak ke stra�n� proh�e.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro se probil na�imi nejsvat�j��mi komnatami a ukradl Oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Boj�m se, �e tr�vil p��li� mnoho �asu o samot� mimo kl�ter, a tedy mimo dosah jeho ochrann�ch zd�. Vystavoval se tak mnoh�mu nebezpe��.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabedn�nci z kl�tera zat�m dopustili, aby jim n�jak� novic p��mo p�ed nosem vyfoukl Innosovo oko. Te� mi nezb�v� nic jin�ho, ne� j�t po tom zr�dci Pedrovi a doufat, �e je je�t� nikomu neprodal.");
	b_logentry(TOPIC_TRAITORPEDRO,"Innosovo oko ukradl z kl�tera zr�dce Pedro. M�m pocit, �e ohniv� m�gov� by ho a� moc r�di dostali do rukou.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "M�te tu�en�, kam ten zlod�j utekl?";
};


func int dia_pyrokar_novizenchase_condition()
{
	if((KAPITEL == 3) && (PEDRO_TRAITOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_novizenchase_info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//M�te tu�en�, kam ten zlod�j utekl?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro zne�kodnil n�kolik dal��ch novic�, kte�� se ho pokou�eli zastavit, a zmizel v rann� mlze.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//U� se za n�m vydalo mnoho novic�, aby mohli Oko vr�tit v po��dku na sv� m�sto.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Pokud ho chce� dopadnout, mus� si posp�it, dokud Pedro nezmiz� z tv�ho dosahu.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "Nalezl jsem Innosovo oko. Je rozbit�.";
};


func int dia_pyrokar_foundinnoseye_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_foundinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Nalezl jsem Innosovo oko. Je rozbit�.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Ale... to nejde. Co se stalo?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Padlo do rukou t�ch odporn�ch zr�d. Stejn� jsem u� p�i�el pozd�.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//P�ipravovali tam naho�e v les�ch podivn� zakl�nadlo pro n�jak� m�s��n� ritu�l.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Innos s n�mi. Znesv�tili n� kruh Slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Ani ve sv�ch nejhor��ch no�n�ch m�r�ch jsem si nikdy nep�edstavoval, �e se zmocn� takov�ho druhu moci.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co budeme d�lat te�?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Co budeme d�lat te�?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Nep��tel se stal velmi siln�m. Je�t� st�le v�ak pro n�j tenhle artefakt p�edstavuje mocnou hrozbu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Mus�me Innosovo oko opravit a navr�tit mu jeho starou s�lu. Ale �as je proti n�m.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Nedok�u si p�edstavit, co se s n�mi v�emi stane. Bez ochrany Oka jsme nep��teli vyd�ni na milost.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Zajdi do m�sta za Vatrasem, vodn�m m�gem. Za t�chto stra�n�ch okolnost� si bude v�d�t rady jedin� on. Vezmi Oko k n�mu a posp� si.
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Pro� Vatras?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co je to kruh Slunce?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Pyrokar chce, abych ve m�st� poprosil o radu m�gy vody a ot�zal se jich, co d�lat s po�kozen�m Okem.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Pro� Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Privilegium nosit r�bu ti je�t� neoprav�uje k tomu, aby ses vypt�val na d�vody m�ch instrukc�, brat�e.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras je Adan�v slu�ebn�k. V�domosti toho vodn�ho m�ga n�m p�inesou trochu sv�tla do tohoto temn�ho �asu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//To je v�e, co pot�ebuje� v�d�t.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Co je to kruh Slunce?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Ka�doro�n� se v �ase slunovratu v�ichni m�gov� a novicov� kl�tera vyd�vaj� na cestu na toto m�sto, aby tak p�iv�tali po��tek nov�ho cyklu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//To m�sto zapl�uje nesm�rn� moc Slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Nikdy jsem ani nepomyslel na to, �e by tato moc mohla b�t zvr�cena. A te� se pr�v� tohle stalo.
};

func void dia_pyrokar_foundinnoseye_weiter()
{
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
};


instance DIA_PYROKAR_SPOKETOVATRAS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_spoketovatras_condition;
	information = dia_pyrokar_spoketovatras_info;
	description = "Mluvil jsem s Vatrasem.";
};


func int dia_pyrokar_spoketovatras_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_spoketovatras_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Mluvil jsem s Vatrasem.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//V�born�. Kde je?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//P�ipravuje ve slune�n�m kruhu ritu�l pot�ebn� k oprav� Innosova oka.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Pokud je to pravda, tak n�m je�t� mo�n� z�stala jisk�i�ka nad�je.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras chce, abyste mu s t�m ty a Xardas pomohli.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//CO? Xardas tam bude taky? To nem��e� myslet v�n�.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Hele. J� o tom nerozhodl. Po�aduje to Vatras.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Po��d ten Xardas. U� m� za��n� unavovat. Jen t�ko to mohlo dopadnout h��.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Jak m�m v�d�t, �e Xardas nen� ve spolku s nep��telem?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Nem��u Xardasovi v��it a je jedno, jak moc ho pot�ebujeme.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Je mi l�to, ale za t�chto okolnost� nemohu Vatrasovi pomoci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "Bez tebe to nep�jde. Vatras nen� schopen ten ritu�l jinak p�ipravit.";
};


func int dia_pyrokar_xardasvertrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_spoketovatras) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_xardasvertrauen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Bez tebe to nep�jde. Vatras nen� schopen ten ritu�l jinak p�ipravit.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Bude� muset Xardasovi v��it.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Nem��u nic d�lat, sly��? Nem�m ani nejmen�� d�kaz toho, �e Xardas nepracuje proti n�m. Nem��u to ud�lat.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//A co kdy� ti n�jak� d�kaz se�enu?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//Boj�m se, �e to je nemo�n�. To by m� opravdu p�ekvapilo.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//A m�m zna�n� pochybnosti o tom, �e by m� Xardas je�t� mohl n���m p�ekvapit. I p�i jeho nevypo�itatelnosti.
	b_logentry(TOPIC_INNOSEYE,"Pyrokar m� z Xardase po��dn� strach. Mus�m s Xardasem prodiskutovat, jak ho p�im�t k ��asti na ritu�lu kruhu Slunce.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "P�inesl jsem od Xardase tuhle knihu.";
};


func int dia_pyrokar_buchzurueck_condition()
{
	if(Npc_HasItems(other,itwr_xardasbookforpyrokar_mis) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchzurueck_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//P�inesl jsem od Xardase tuhle knihu.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//Je to symbol jeho d�v�ryhodnosti.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Uka� mi to.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(vzru�en�) Ale to je neuv��iteln�. M� ty v�bec pon�t�, co je to, cos mi pr�v� dal?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ehm. Ne.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(podr�d�n�) Tohle je starobyl�, velmi dlouho ztracen� kniha z �as� d�vno minul�ch.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//M�li jsme za to, �e je ztracena jednou prov�dy, ale te� vid�m, �e Xardas celou tu dobu v�d�l, co se s n� stalo.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Tak�e souhlas� s t�m ritu�lem?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Ano, m�l bych vyrazit ke slune�n�mu kruhu, ale rozhodn� ne proto, �e bych byl p�esv�d�en� o Xardasov�ch dobr�ch �myslech.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//Vlastn� se chyst�m z toho psa dostat vysv�tlen�, kde tolik let ukr�val tu knihu. Tentokr�t za�el p��li� daleko.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Uvid�me se u slune�n�ho kruhu.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Pyrokar kone�n� souhlasil, �e nav�t�v� kruh Slunce.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "Mysl�, �e m��e� Innosovo oko opravit?";
};


func int dia_pyrokar_preritual_condition()
{
	if((PYROKAR_GOESTORITUALINNOSEYE == TRUE) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_preritual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Mysl�, �e m��e� Innosovo oko opravit?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//T�ko ��ct. Po�k�me a uvid�me.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "Dok�zal jsi to. Innosovo oko je zase v po��dku.";
};


func int dia_pyrokar_augegeheilt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_augegeheilt_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Dok�zal jsi to. Innosovo oko je zase v po��dku.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//Jen st�� m��u uv��it, �e je n�co takov�ho mo�n�.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Ano, mist�e.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//U� jsi mnohokr�t prok�zal, �e jsi hoden Vy���ho ��du ohniv�ch m�g�.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//Od tohoto dne jsi �lenem Rady a bude� n�s ��d reprezentovat po cel�m sv�te. Te� jsi jedn�m z vy���ch ohniv�ch m�g�.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//U��vej r�bu vyvolen�ch s d�stojnost� a p�ines ��du sl�vu a bohatstv�, m�j brat�e.
		CreateInvItem(hero,itar_kdf_h);
		AI_EquipArmor(hero,itar_kdf_h);
		HEROGIL_KDF2 = TRUE;
	};
};


instance DIA_PYROKAR_KAP3_READY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_kap3_ready_condition;
	information = dia_pyrokar_kap3_ready_info;
	description = "Co tu je�t� mus�m u�init?";
};


func int dia_pyrokar_kap3_ready_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_pyrokar_augegeheilt))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_ready_info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Co tu je�t� mus�m u�init?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Nepl�tvej sv�m �asem na malichernosti. B� porazit draky. Tady, vezmi si Oko.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Nezapome�, �e mus� s drakem nejprve promluvit, ne� ho napadne�.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Moc Oka p�inut� draka promluvit a ��kat pravdu.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Tak� ti, pokud ho m� na sob�, poskytuje ochranu proti jejich �tok�m.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Nicm�n�, moc Oka nen� nevy�erpateln�. Bude� ho muset dopl�ovat magickou energi�.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//Bude� k tomu pot�ebovat esenci z dra��ho srdce, kterou m��e� s Okem spojit za pomoci alchymistick� kolony.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Jedin� pak se m��e� odv�it postavit drakovi.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//D�ky. Budu si to pamatovat.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Te� m� v�e, co pot�ebuje�. Tak jdi. U� ti nezb�v� mnoho �asu.
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"Te� u� mohu bez obav �elit drak�m - sta�� si p�i boji nasadit Innosovo oko a mohu je v�echny postupn� zni�it. P�ed bojem si ale mus�m s drakem v�dycky promluvit, jinak nem�m �anci. Probl�m je, �e ka�d� takov� rozhovor p�ipravuje Oko o ��st moci. Obnovit ji mohu pouze s alchymistickou kolonou s pomoc� dra��ho srdce a pr�zdn� laboratorn� ba�ky, kde s pomoc� extraktu z dra��ho srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dal��mu obludn�mu je�t�rovi.");
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PYROKAR_BUCHDERBESSENEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 39;
	condition = dia_pyrokar_buchderbessenen_condition;
	information = dia_pyrokar_buchderbessenen_info;
	description = "Nalezl jsem podivn� almanach.";
};


func int dia_pyrokar_buchderbessenen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_backfromow) && Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchderbessenen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Nalezl jsem podivn� almanach.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Opravdu? Co je to za almanach?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Nejsem si jist�. M�l jsem dojem, �e ty bude� v�d�t, k �emu to je.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//V�ru, to je velmi znepokojiv�. Jsem r�d, �es mi to p�inesl. To od tebe bylo opravdu moudr�.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//P�edpokl�d�m, �e tam toho bude v�c. B� a najdi v�ce t�chto knih zatracen�.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Vypad� to, �e je to n�stroj moci P�tra��.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Pou��vaj� jej k ovl�d�n� ztracen�ch du�� sv�ch ob�t�.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Obvykle si do t�ch knih zapisuj� jm�na t�ch, kter�ch se cht�j� zmocnit.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Poslouchej. D�m ti tenhle magick� svitek. Uk�e ti jm�na, kter� jsou zanesen� do t�ch knih.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Najdi ty ob�ti a p�ines mi jejich knihy. M�l bych je zprovodit ze sv�ta.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Ale nejprve bys m�l alespo� jednu z nich uk�zat Karrasovi. Mo�n� se mu bude p�i jeho studi�ch k n��emu hodit.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Neud�lej hloupost a nepokou�ej se je ni�it s�m. Je�t� nejsi schopen odolat jejich moci.
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedl�ch. Dal mi proto seznam v�ech, kter� P�tra�i hodlaj� ovl�dnout - postupem �asu se m��e rozr�stat o dal�� jm�na.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Nep�ibli�uj se k P�tra��m, jinak t� proklej�.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Pokud nebude� schopen odol�vat jejich vol�n�, vra� se ke mn�, jak nejrychleji to bude mo�n�.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Pouze tady v kl�te�e je tv� du�e v bezpe��.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Neexistuje proti t�m ment�ln�m �tok�m n�jak� ochrana?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Mo�n� to je. Karras by o tom mohl n�co v�d�t.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"S Karrasovou pomoc� pr� mohu naj�t ochranu p�ed ment�ln�mi �toky P�tra��.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Vyl��it posedlost)";
};


func int dia_pyrokar_scobsessed_condition()
{
	if(SC_ISOBSESSED == TRUE)
	{
		return TRUE;
	};
};


var int got_healobsession_day;

func void dia_pyrokar_scobsessed_info()
{
	if(((GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2)) || (GOT_HEALOBSESSION_DAY == 0)) && (Npc_HasItems(other,itpo_healobsession_mis) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Vyle� m�, pane, byl jsem proklet.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//Budi�! Vezmi si tenhle lektvar. To t� zbav� tv�ch no�n�ch m�r.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Nech� je ti Innosova sp�sa ochranou.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Jednej v jeho jm�nu a st�ez se zl�ho nep��telova pohledu.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Ale abych t� varoval - pokud bude� jejich vlivu vystaven p��li� �asto, u� pro tebe za jist�ch okolnost� nebude n�vratu. V�dycky na to pamatuj.
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//M�m dojem, �e jsem byl proklet. M��e� m� vyl��it?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Ne bez d�kazu tv�ho respektu k tomuto kl�teru, m�j synu. 300 zlat�ch.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"To je p��li�.",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"V�born�. Tady jsou pen�ze.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Ale v�dy� ty je�t� jeden l��iv� lektvar m�. Vra� se, a� bude� mou pomoc opravdu pot�ebovat.
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//V�born�. Tady jsou pen�ze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Tady, vypij tohle. Nech� je ti Innosova sp�sa ochranou.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//P�ines mi ty pen�ze a dostane se ti pomoci.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//To je p��li�.
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "M��u ti o tom proklet� ��ct i n�co v�c.";
};


func int dia_pyrokar_almanachbringen_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pyrokar_buchderbessenen))
	{
		return TRUE;
	};
};


var int almanachcounter;
var int dia_pyrokar_almanachbringen_onetime;

func void dia_pyrokar_almanachbringen_info()
{
	var int almanachcount;
	var int xp_kdf_bringalmanachs;
	var int almanachgeld;
	var int pyrokarsalmanachoffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//M��u ti o tom proklet� ��ct i n�co v�c.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Mluv, brat�e.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Nalezl jsem dal�� almanach.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//M�m pro tebe t�ch Sp��ov�ch knih je�t� v�c.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Dobr�. Nicm�n� se ob�v�m, �e je jich k nalezen� mnohem v�c. Pokra�uj v hled�n�.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Nalezli jsme jich u� mnoho. Nemysl�m si v�ak, �e to jsou �pln� v�echny.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//U� jsi mi p�inesl spoustu t�ch nep��telsk�ch knih.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Docela by m� p�ekvapilo, kdyby mezi sebou m�li je�t� n�jakou.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Vezmi si tohle. Je to d�rek od kl�tera, kter� ti pom��e poka�d�, kdy� se st�etne� se zlem.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//A nezapome� se jednou za �as pod�vat do m�ho magick�ho svitku.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Je docela dob�e mo�n�, �e se pokus� to sam� prov�st i n�komu jin�mu, jeho� jm�no jsme v t�ch knih�ch nena�li.
		DIA_PYROKAR_ALMANACHBRINGEN_ONETIME = TRUE;
	};
	almanachgeld = almanachcount * pyrokarsalmanachoffer;
	CreateInvItems(self,itmi_gold,almanachgeld);
	b_giveinvitems(self,other,itmi_gold,almanachgeld);
};


instance DIA_PYROKAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap4_exit_condition;
	information = dia_pyrokar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap5_exit_condition;
	information = dia_pyrokar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_DRACHENTOT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_drachentot_condition;
	information = dia_pyrokar_drachentot_info;
	description = "V�ichni draci jsou mrtv�.";
};


func int dia_pyrokar_drachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_drachentot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//V�ichni draci jsou mrtv�.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//To je bezesporu dobr� zpr�va. Ale na situaci to nic nem�n�. Vypad� to dost beznad�jn�.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//P�tra�i je�t� po��d nezmizeli. Pr�v� naopak. Sly�el jsem mnoho zv�st� o tom, �e se posledn�ch p�r dn� jejich po�et je�t� zv��il.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Vybit� drak� m�lo nep��tele zne�kodnit, ale asi to nesta�ilo. Mus�me to zlo vyrvat i s ko�eny.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "Mluvil jsem s draky.";
};


func int dia_pyrokar_dermeister_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_dermeister_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Mluvil jsem s draky.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//Co ��kali?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Pov�dali o moci jejich P�na a o tom, �e se usadil Irdorathsk�ch s�n�ch.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Innos s n�mi. Temn� chr�m znovu nabyl svou s�lu a te� vys�l� sv� posluhova�e do na�eho sv�ta.
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "Co jsou to ty Irdorathsk� s�n�?";
};


func int dia_pyrokar_wasistirdorath_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(other,dia_pyrokar_dermeister))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wasistirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Co jsou to ty Irdorathsk� s�n�?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//V�chodn� chr�m vz�v�n� boha Beliara. V zemi Myrtana jsou celkem �ty�i. Ale tenhle je pravd�podobn� nejd�siv�j�� ze v�ech.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Asi p�ed 40 lety byly zni�eny chr�my tohoto stra�n�ho bo�stva na z�pad� a na severu.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//State�n� ryt��i t�ch �as� srovnali ty mocn� stavby se zem�.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Pak se �ern� hordy nep��tel staly proti p�evaze hrdinsk� odvahy ryt��� a paladin� bezmocn�mi.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Nem�lo by b�t p��li� t�k� zni�it i ty zbyl� dva chr�my a o�istit tak nav�dy zemi od zla.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... ale pot�, co druh� chr�m padl, prost� zmizely.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(posm�n�) Zmizely. Cel� chr�my. Jo, jasn�.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Nesm�j se. Situace je v�n�. Pokud Irdorathsk� s�n� znovu nabyly sv� moci, pak nebude nijak snadn� nep��tele porazit.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Proto ho bude� muset naj�t a pova�ovat to za sv�j dal�� a je�t� t잚� �kol.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Uvid�me.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Podle Pyrokara jsou Irdoratsk� s�n� ztracen�m chr�mem, kde uct�va�i vz�vali boha Beliara. Mus�m jej naj�t.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Xardasova kniha, kter� byla pova�ov�na za ztracenou - kde je?";
};


func int dia_pyrokar_buchirdorath_condition()
{
	if((KAPITEL == 5) && (ITWR_HALLSOFIRDORATHISOPEN == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_wasistirdorath))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Xardasova kniha, kter� byla pova�ov�na za ztracenou - kde je?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//�ekal jsem, �e se na to zept�. Ale ob�v�m se, �e ti to k ni�emu nebude.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Byla magicky zape�et�na. Ukryl jsem ji do jedn� z na�ich podzemn�ch skr���. Dokonce jsme se u� pokou�eli ji otev��t. Marn�.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Ten zpropaden� Xardas s n�mi hraje �pinavou hru.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//M��u se na tu knihu pod�vat?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Jak je libo. Nedok�u si p�edstavit, �e bys usp�l, kdy� se to nepovedlo nejv�t��m mistr�m kl�tera.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Ale klidn� b� a zkus to, Talamon ti nebude br�nit.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardasova kniha Irdoratsk� s�n� je ukryta ve sklepen�ch kl�tera, kde ji st�e�� Talamon. M�gov� ji ale nedok�� otev��t - jej� magickou pe�e� pr� m� na sv�dom� s�m Xardas.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "Poda�ilo se mi otev��t Xardasovu knihu.";
};


func int dia_pyrokar_irdorathbookopen_condition()
{
	if((ITWR_HALLSOFIRDORATHISOPEN == TRUE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_irdorathbookopen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Poda�ilo se mi otev��t Xardasovu knihu.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Co? Jak jsi to dok�zal? M�lem m� to p�ivedlo k zoufalstv�.
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Xardas mi to prozradil.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"�ekl bych, �e �t�st� si prost� jednou sedne i na vola, nic jin�ho.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//�ekl bych, �e �t�st� si prost� jednou sedne i na vola, nic jin�ho.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Nevykl�dej nesmysly. �t�st�!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Mn� se to v�bec nezda�ilo a pak je to pro n�koho jako ty �pln� hra�ka...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... proto m�m o �em p�em��let.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Jinak. Jeliko� jsi byl jedin�m, kdo to dok�zal otev��t, asi bude nejlep��, kdy� ti bude sv��ena do p��e. Alespo� do t� doby, ne� p�ekon�me tuhle krizi.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas mi to prozradil.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//�, tak je to. Jak zaj�mav�. Jen ve tv�m vlastn�m z�jmu douf�m, �e t� Xardas�v �patn� vliv je�t� nezkazil.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Varuju t�. Nepodlehni �skok�m toho star�ho zla. Mohl bys toho pozd�ji litovat.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "V t� knize je zm�nka o tajn� knihovn�.";
};


func int dia_pyrokar_geheimebibliothek_condition()
{
	if((ITWR_SCREADSHALLSOFIRDORATH == TRUE) && (KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_geheimebibliothek_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//V t� knize je zm�nka o tajn� knihovn�.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//O �em to mluv�?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//O knihovn� tady za tou zd�. Trefil jsem se?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Ne. Kde jsi ��kal, �e by ta knihovna m�la b�t?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Rozum�m. Nem� tu�en�. Mmh.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pyrokar o tajn� knihovn� nic nev� - pravd�podobn� do n� m�l p��stup pouze Xardas.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "V�m, kde hledat Irdorathsk� s�n�.";
};


func int dia_pyrokar_scknowswaytoirdorath_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scknowswaytoirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//V�m, kde hledat Irdorathsk� s�n�.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Ten chr�m je na ostrov�. Nalezl jsem n�mo�n� mapu, na kter� je zachycena cesta.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//To je skv�l�. Tak to bude� pot�ebovat lo� a pos�dku, aby ses mohl postavit nep��teli.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Ale nezapome�, �e se mus� dob�e p�ipravit, abys byl schopen porazit P�na Irdorathu.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Kde najdu n�jakou pos�dku?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Tvoje pos�dka by m�la sest�vat z mu��, kter�m se d� v��it.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Promluv si se sv�mi p��teli a pop�em��lej, kdo by se ti mohl hodit, a� bude� na ostrov�.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Taky bude� pot�ebovat m�ga. Ale bohu�el, j� nem��u nikoho z kl�tera postr�dat.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Bude� se muset zeptat n�jak�ho m�ga, co ne�ije v kl�te�e.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Jorgen je zku�en�m n�mo�n�kem. Mohl by mi pomoci dostat se na ostrov Irdorath.";
};


func int dia_pyrokar_scwilljorgen_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_pyrokar_scknowswaytoirdorath) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scwilljorgen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen je zku�en�m n�mo�n�kem. Mohl by mi pomoci dostat se na ostrov Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Ob�v�m se, �e to nebude tak snadn�.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Upsal se pr�ci pro bratrstvo. Neslo�il n�m ani poplatek, ani n�m nep�ivedl ovci.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen mus� nejprve dokon�it svou pr�ci a pak si ho m��e� odv�st, pokud bude� m�t z�jem.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Jak dlouho to bude trvat?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Spot�eboval tolik z�sob, kolik by novicovi sta�ilo p�inejmen��m na t�i t�dny. A to za jeden den.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Tak�e ho nem��u nechat j�t d��v, ne� si v na�� zahrad� tvrd� odpracuje t�i m�s�ce.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "Co mus�m ud�lat, abych si mohl Jorgena odv�st hned te�?";
};


func int dia_pyrokar_machdtfrei_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_scwilljorgen) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_machdtfrei_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//Co mus�m ud�lat, abych si mohl Jorgena odv�st hned te�?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Mmh. Jasn�, �e je tu jedna v�c, kterou bys mohl ud�lat. Mohly by ti s t�m pomoct tvoje dobr� vztahy s Xardasem.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//V�iml jsem si, �e se posledn�ch p�r dn� d�j� na jeho v�i divn� v�ci.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Mnoho lid� ��k�, �e odtamtud v noci vych�zej� r�zn� sk�eky a �e nad jeho v�� tancuj� divn� sv�tla.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Jako bychom nem�li dost sv�ch vlastn�ch starost�. B� zjistit, co se tam d�je, a za�i�, a� to p�estane.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Pak dostane� Jorgena.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"V Xardasov� v�i se d�j� divn� v�ci. Pokud se o n� postar�m, mohu vz�t Jorgena s sebou.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "Pova�uj tu v�c s Xardasovou v�� za vy��zenou.";
};


func int dia_pyrokar_dtcleared_condition()
{
	if(Npc_IsDead(xardas_dt_demon1) && Npc_IsDead(xardas_dt_demon2) && Npc_IsDead(xardas_dt_demon3) && Npc_IsDead(xardas_dt_demon4) && Npc_IsDead(xardas_dt_demon5) && Npc_IsDead(xardas_dt_demonlord) && (MIS_PYROKARCLEARDEMONTOWER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pyrokar_dtcleared_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Pova�uj tu v�c s Xardasovou v�� za vy��zenou.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//Tak co se tam d�lo... ne, po�kej, rad�i to nechci v�d�t.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Jestli po��d chce� Jorgena, tak b� a vezmi ho s sebou na tu svou cestu.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Nech� t� Innos ochra�uje.
	MIS_PYROKARCLEARDEMONTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_PYROKARCLEARDEMONTOWER);
};


var int pyro_gives_aura;

instance DIA_PYROKAR_AMULETTOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_amulettofdeath_condition;
	information = dia_pyrokar_amulettofdeath_info;
	permanent = TRUE;
	description = "Proroctv� se zmi�uje o posv�tn� Innosov� au�e.";
};


func int dia_pyrokar_amulettofdeath_condition()
{
	if((PLAYERGETSAMULETTOFDEATH == TRUE) && (PYRO_GIVES_AURA == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_amulettofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//Proroctv� se zmi�uje o posv�tn� Innosov� au�e.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Innosova aura je amulet, kter� je povoleno nosit jen nejv�t��m m�g�m sv� doby.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Mohl bych ho dostat?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Co je to za amulet?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Mohl bych ho dostat?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//Co�e? Co s n�m chce� d�lat?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Postavit se drakovi.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Ano, samoz�ejm�. D�m ti ten amulet, ale zach�zej s n�m opatrn�.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Jo, jasn�.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Nerad bych jej musel pozd�ji vykupovat od n�jak�ho kupce.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Pou��vej ho moud�e, a nech� t� Innos st�le ochra�uje.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Co je to za amulet?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//��k� se, �e ho ukul s�m Innos a dal jej lidstvu jako dar.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Ochra�uje toho, kdo jej nos�, p�ed jakoukoliv �jmou.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "Co jsou Innosovy slzy?";
};


func int dia_pyrokar_potionofdeath_condition()
{
	if(Npc_HasItems(other,itpo_potionofdeath_01_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_potionofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Co jsou Innosovy slzy?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//Innosovy slzy jsou jen sou��st� star� b�chorky pro d�ti. Vypr�v� o tom, jak na po��tku �as� za�ala bitva mezi Innosem a Beliarem.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Aha.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Na�el jsem tenhle lektvar.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Aha.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Nev�m, jestli si jsi pln� v�dom toho, jak� je na�e situace, ale t�ko dok�u uv��it tomu, �e bys doufal, �e nep��tele poraz�me poh�dkou pro d�ti.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Na�el jsem tenhle lektvar.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//To nen� mo�n�. Tomu nem��u uv��it.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//Co se d�je?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Pokud jsou tohle skute�n� Innosovy slzy, pak...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(sko�� do �e�i) T�ko.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Nep�eru�uj m�. Pokud jsou tohle skute�n� Innosovy slzy, pak m�me proti na�emu nep��teli mocnou zbra�.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Tak co jsou ty Innosovy slzy?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Co mysl� t�m 'zbra�'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Tak co jsou ty Innosovy slzy?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Kdy� si Innos uv�domil, �e aby zachr�nil sv�t, mus� bojovat proti Beliarovi, sv�mu vlastn�mu bratrovi, byl jeho z�rmutek nevysloviteln�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Za�al plakat a jeho slzy spadly dol� na sv�t. Bylo jich mnoho, proto�e jeho srdce bylo tak pln� z�rmutku, �e plakal cel�ch 13 let.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Jdi p��mo k v�ci.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//V�echny, kdo tyto slzy na�li a okusili je, r�zem naplnila nadp�irozen� s�la a bystrost. Poznali moudrost Innosova stvo�en� a za�ali mu slou�it.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Byli to prvn� �lenov� Spole�enstva ohn�. Ty slzy jim daly s�lu, odvahu a moudrost. Ale to u� bylo velice d�vno, a u� v�ce ne� 250 let nikdo Innosovy slzy nespat�il.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Co mysl� t�m "zbra�"?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legenda vypr�v�, �e pod vlivem t�to l�tky dok�zali Innosovi v�le�n�ci vykon�vat t�m�� nadlidsk� skutky.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Nedotkla se jich ��dn� �nava a byli siln� jako dva medv�di.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Nejv�t�� hrdinsk� �iny star�ch dn� bylo mo�n� vykonat jen s pomoc� Innosov�ch slz.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Rozum�m.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Av�ak ty slzy mohou p�in�st tak� utrpen� a smrt. Tento lektvar mohou p�t jen �lenov� na�eho ��du.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Kohokoliv jin�ho - dokonce i paladiny na�eho P�na - by okam�it� potkala krut� smrt.
	Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
	CreateInvItems(hero,itpo_potionofdeath_02_mis,1);
};


instance DIA_PYROKAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap6_exit_condition;
	information = dia_pyrokar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_PICKPOCKET(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_pickpocket_condition;
	information = dia_pyrokar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_pyrokar_pickpocket_condition()
{
	return c_beklauen(108,550);
};

func void dia_pyrokar_pickpocket_info()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_BACK,dia_pyrokar_pickpocket_back);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_PICKPOCKET,dia_pyrokar_pickpocket_doit);
};

func void dia_pyrokar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

func void dia_pyrokar_pickpocket_back()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

