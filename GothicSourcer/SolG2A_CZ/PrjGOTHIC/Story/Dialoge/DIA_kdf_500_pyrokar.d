
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
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//Tak ty jsi ten novı novic. Dobrá, pøedpokládám, e u tì s tvımi povinnostmi obeznámil otec Parlan.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(lehce káravì) Víš, e kadı èlen Spoleèenstva ohnì by mìl své povinnosti plnit v souladu s Innosovou vùlí.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "Musím mluvit s paladiny. Dost to spìchá.";
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
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Musím mluvit s paladiny. Dost to spìchá.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//A øekneš nám, proè s nimi chceš mluvit?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//Mám pro nì dùleitou zprávu.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//Co by to jako mìlo bıt za zprávu?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//V Hornickém údolí se shromaïuje armáda zla vedená draky! Musíme je zastavit, dokud mùeme.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hm. Budeme o tvıch slovech pøemıšlet, novici. A nadejde èas, dáme ti vìdìt, jak rada rozhodla.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//Mezitím by sis mìl lépe hledìt povinností novice.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Dobrá, u tì nebudeme déle zdrovat od tvé práce - mùeš jít.
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
	description = "Hledám Innosovo oko.";
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
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Hledám Innosovo oko.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Kadı, kdo si myslí, e by mohl svatı amulet nejen najít, ale dokonce ho i pouívat, je hlupák.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//Amulet si sám vybírá svého majitele - nikdo, kromì toho, komu je to pøedurèeno, ho není schopen nosit.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Jsem ochotnı to zkusit.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Povinnosti novice tì mají nauèit pokoøe - ne ádostivosti.
	b_logentry(TOPIC_INNOSEYE,"Nemyslím, e by to bylo tak tìké, ale Pyrokar mi Oko dobrovolnì a bez pomoci paladinù nevydá.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Dobrá, u tì nebudeme dál zdrovat od tvé práce - mùeš jít.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_PYROKAR_MISSINGPEOPLE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_addon_pyrokar_missingpeople_condition;
	information = dia_addon_pyrokar_missingpeople_info;
	description = "Nìkteøí obèané Khorinisu zmizeli za podivnıch okolností.";
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
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Nìkteøí obèané Khorinisu zmizeli za podivnıch okolností.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Jsem si toho vìdom a je to politováníhodné. Nicménì jsme souhlasili s mágy Vody, e na tu vìc dohlídnou.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//To samé se tıka té záleistosti s tìmi podivnımi zemìtøesenímy v severovıchodní oblasti Khorinosu.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//V tomto okamiku nic nenasvìdèuje tomu, e naše zakroèení by mìlo zaruèenı vısledek. Z tohoto dùvodu se nebudeme do nièeho pouštìt.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Ano, ale ...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//ádné ALE! Budeme pokraèovat jak uznáme za vhodné a doufám, e i TY budeš respektovat toto usnesení.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Mágové Ohnì litují zmizelıch obèanù Khorinosu . Nicménì øíkají, e by to byl úkol pro mágy Vody. Neoèekávejte tedy pomoc od kláštera ohnivıch mágù.");
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
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(rozzlobenì) Poslušnost patøí mezi ctnosti, kterıch se máš ještì co uèit. A tak, èi tak.
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "Chtìl bych podstoupit Zkoušku ohnì.";
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
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Chtìl bych podstoupit Zkoušku ohnì.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(pøekvapenì) Tak ty o tom víš... ty chceš podstoupit Zkoušku ohnì?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Ano, proèetl jsem si Právo ohnì, kde se øíká...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(pøíkøe pøeruší) My známe Právo ohnì. Taky jsme ale vidìli mnoho novicù bìhem toho testu zemøít. Mìl bys své rozhodnutí ještì zváit.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//To jsem u udìlal. Chci tu zkoušku - a jsem pøipraven jí projít.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(varovnì) Kdy na tom bezpodmíneènì trváš, tak tì Rada k té zkoušce pøizve.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Trvám na tom, abych byl pøizván ke Zkoušce ohnì.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//V tom pøípadì - a je po tvém. A budeš pøipraven, dostaneš od kadého mága Rady úkol, jej musíš splnit.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Nech se Innos slituje nad tvou duší.
	b_logentry(TOPIC_FIRECONTEST,"Poádal jsem Pyrokara o Zkoušku ohnì. Nyní musím splnit tøi úkoly, které mi zadá Nejvyšší rada.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "Jsem pøipraven podrobit se tvé zkoušce, Mistøe.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Jsem pøipraven podrobit se tvé zkoušce, Mistøe.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//A jedinì Innos sám ví, jestli jí projdeš. Podstupuješ stejnou zkoušku, jaká je urèena vyvolenım novicùm.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Zkouška magie. (odmìøenì) Asi víš, e zkouškou mùe projít pouze jeden jedinı novic.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//To vím. Tak kdo jsou moji soupeøi?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Innos ve své moudrosti vybral tøi novice, kteøí se také chystají projít testem: Agon, Igaraz a Ulf. U zaèali s hledáním.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(úseènì) Ale dost u o tom! Slyš slova této zkoušky: 'Následuj Innosova znamení a dones nám, co vìøící nalezl na konci cesty.'
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Budeš potøebovat tenhle klíè.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//To je vše, co ti k tomu øekneme.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Pyrokar pro mì pøipravuje zkoušku magie - stejnou jako je ta, kterou podstoupí zvolení novicové Ulf, Igaraz a Agon.");
	b_logentry(TOPIC_SCHNITZELJAGD,"Musím následovat Innosova znamení a pøinést to, co vìøící najde na své cestì. Dostal jsem k tomu i klíè.");
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
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Dokud budeš pracovat na zkoušce, nesmíme ti nic øíct.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Co tady ještì postáváš? Bì se vypoøádat se svou zkouškou!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Nadešel èas porovnat tvá velká slova s tvımi skutky. Nemyslíš, novici?
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
	description = "Našel jsem ten runovı kámen.";
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
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Našel jsem ten runovı kámen.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(nevìøícnì) Ty... dokázal jsi to?! Sledoval jsi znamení a objevil ukrytı portál...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... a taky jsem porazil všechna ta stvoøení, co mì povaovala za pøíjemnou svaèinku.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//A co ostatní novicové? Co Agon? Neuspìl døív ne ty?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Neobstáli. Pøedpokládám, e jim zkouška nebyla pøedurèena.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Dobrá, take vyhlásíme, e jsi prošel zkouškou. A ten runovı kámen si mùeš ponechat.
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
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Prošel jsi zkouškou, kterou jsem ti pøichystal.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Ale...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... ale ještì musíš splnit Uthlarùv úkol.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... ještì musíš dokonèit Serpentesùv test.
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
	description = "A budu teï pøijat do Spoleèenstva mágù?";
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
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//A budu teï pøijat do Spoleèenstva mágù?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Dokázal jsi to. Prošel jsi Zkouškou ohnì. Celou dobu jsme si tvım úspìchem byli jistí.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(neústupnì) Tak jako je jisté, e ze sebe vydáš to nejlepší, aby ses mohl stát ctihodnım sluebníkem Innose.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Take pokud jsi pøipraven sloit Pøísahu ohnì, pøijmeme tì mezi sebe jako mága.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "Jsem pøipraven vstoupit to Kruhu ohnì.";
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
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Jsem pøipraven vstoupit to Kruhu ohnì.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Dobrá, tak slo svatou Pøísahu ohnì.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(vánì) Pøísaháš pøed Innosem, kterı je naším Všemohoucím, jeho sluebníky a Svatım plamenem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... e od nynìjška navdy bude celı tvùj ivot zasvìcen ohni...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... dokud tvé tìlo a tvá duše nenalezne odpoèinku v jeho svatıch komnatách a plamen tvého ivota nevyhasne?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Pøísahám.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Vyøèením slov pøísahy jsi vstoupil do svazku s ohnìm.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Nos tuto róbu jako symbol vìèného pouta.
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
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Teï, kdy jsme tì pøijali mezi nás, si mùeš promluvit s lordem Hagenem, nejvyšším velitelem paladinù.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Taky bychom velmi rádi vìdìli, jak on hodnotí situaci. Take je ti dovoleno odejít do Khorinisu.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Oèekáváme, e nám odpovìï doneseš neprodlenì.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "Co všechno se teï mùu nauèit?";
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
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Co všechno se teï mùu nauèit?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Hlavnì máš teï právo dozvìdìt se vše, co se tıká magickıch kruhù. Dají ti moc, kterou budeš potøebovat k pouívání magickıch run.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Èím vyššího magického kruhu dosáhneš, tím silnìjší kouzla budeš moci pouívat.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//Od bratrù v klášteøe se mùeš nauèit magickım formulím. Kadı z nich se zamìøuje na urèitou oblast, o které tì mohou hodnì nauèit.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Napøíklad Karras je mistrem vzıvání a vyvolávání. Hyglas tì zase zasvìtí do ohnivé magie.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Nikdo toho o síle mrazu neví víc ne Marduk. Parlan tì mùe nauèit všechna ostatní zaklínadla - a zasvìtí tì do prvních kruhù.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//Ale mohou tì nauèit jen magickım formulím - runy si budeš muset vyrobit sám.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan mì uvede do prvních magickıch kruhù.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Karras vyuèuje formule pro invokaèní a vyvolávací kouzla.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Hyglas mi pøiblíí tajemství ohnì.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Marduk mì seznámí s mocí ledu a bouøí.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan vyuèuje rùzné další formule.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "Chtìl bych vyslovit jedno pøání.";
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Chtìl bych vyslovit jedno pøání.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//Poté, co je kadı mág pøijat do Spoleèenstva, má právo prvního skutku.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Tak co udìláš jako první vìc v roli mága?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"Nic.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Nech se novım klášterním zahradníkem stane Babo.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"A má novic Opolos pøístup do knihovny.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Kdyby tak Dyrian zùstal i nadále v klášteøe.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Nic.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(uasle) Tak tedy budi. Novı mág se vzdal svého èinu.
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//A novic Dyrian zùstane v klášteøe.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Jak si pøeješ.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Novicovi bude dovoleno zùstat v klášteøe a bude zastávat funkci zahradníka, která je právì k dispozici.
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//A se novic Babo stará o klášterní zahradu.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Jak si pøeješ.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Novicovi Babovi se s okamitou platností svìøuje do péèe klášterní zahrada.
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//A má novic Opolos pøístup do knihovny.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Jak si pøeješ.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//Odteï mùe novic Opolos studovat Innosovo písmo.
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
	description = "Mám zprávy od lorda Hagena...";
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
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Mám zprávy od lorda Hagena. Poaduje dùkazy o pøítomnosti drakù a armády zla.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//Take vyrazím do Hornického údolí a pøinesu jim ten dùkaz.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Dobrá. Tak tedy splò tento úkol. Paladin Sergio tì doprovodí do prùsmyku.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Nech tì Innos ochraòuje.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Take vyrazím pøímo do Hornického údolí.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Dobrá. Jeliko cestu do Hornického údolí u znáš, nebudeš potøebovat ádnı doprovod.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Postarej se o tu záleitost pro lorda Hagena - nech tì Innos provází.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "Nauè mì poslední magickı kruh.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Nauè mì poslední magickı kruh.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Uplynulo mnoho èasu od chvíle, co jsi vstoupil do svazku s ohnìm. Pøihodilo se mnohé a na odpoèinek nikdy nebylo pøíliš èasu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Jsi Innosovım Vyvolenım. Proto budeš potøebovat všechnu svou sílu, abys obstál ve všech nadcházejících bitvách.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Teï se ode mì doèkáš zasvìcení, Vyvolenı. Vstupuješ do šestého kruhu - šiø svìtlo a rozptyluj temnotu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Teï se ode mì mùeš nauèit magické formule posledního kruhu. Pokud po tom tedy touíš.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ach. A ještì jedna vìc - chvíli mi trvalo, ne jsem tì poznal.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//Mìl jsi u sebe ten dopis, co ti dali, kdy tì uvrhli za bariéru.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Ano, ušetøil jsi mi tak spoustu tìch soudních kecù.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//A ty jsi Innosovım Vyvolenım.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Pøijmi teï ode mì poehnání, ó Vyvolenı!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innosi, svìtlo slunce a ohni svìta, poehnej tomuto mui, tvému vyvolenému sluebníkovi.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Dej mu odvahu, sílu a moudrost, aby mohl pøijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Èas ještì nenadešel. Jakmile po cestì, kterou ti Innos ukazuje, dojdeš trochu dál, pak tì zaènu uèit.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "Instruuj mì (vytvoøení run)";
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
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Nauè mì nìèemu.
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
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//Není nic dalšího, èemu bych tì mohl ještì nauèit.
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
	description = "Posílá mì Parlan...";
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
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Posílá mì Parlan. Chtìl bych posílit svoji magickou moc.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Dobrá, u ses dost nauèil a znaènì jsi zesílil. Odteï se budeš uèit ode mì.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "Chtìl bych posílit svoji magickou moc.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Chtìl bych posílit svoji magickou moc.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Cítím, e tebou magická moc prochází v plné síle. Dokonce u nejsem schopen ti ukázat, jak bys ji mohl ještì více posílit.
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
	description = "(Poehnání)";
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
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Poehnej mi, Mistøe.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Co takhle malé poehnání? Opravdu by se mi hodilo.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Nech je tvá poslední bitva proti našemu arcinepøíteli korunována úspìchem. Innos buï s tebou.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Nech je Innos s tebou a zaehná všechny pekelné cesty, které se ti otevøou.
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
	description = "Pøicházím z Hornického údolí.";
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
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Pøicházím z Hornického údolí.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Co pøinášíš za zprávy?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Nepøítel se spojil se skøetí armádou a s draky.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//To u jsme se dozvìdìli od Miltena - ale co královskı náklad rudy?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Doly, ve kterıch se tìilo pro Garonda, nemohou uspokojit královy poadavky.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Dny jsou stále zastøenìjší a sluneèní svìtlo slábne.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//Byl jsem napaden mui v èernıch kápích.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Já vím. To jsou Pátraèi. Nohsledi z Beliarovy podsvìtní øíše. Snaí se nad tebou získat moc.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Jakmile se tì zmocní, u to nebudeš ty. Jedinì tady v klášteøe ti pak bude pomoci. Take buï opatrnı.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar mi vyprávìl o Pátraèích, muích v èernıch hábitech, kteøí jsou Beliarovımi nohsledy. Varoval mì, e dokáí ovládat a posednout druhé. Mám se vrátit pøímo do kláštera, aby se mi to náhodou nestalo také.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Poádal jsem Karrase, aby se na tu záleitost podíval. Urèitì brzy dojde k nìèemu, co nám dopomùe k lepšímu pochopení toho všeho.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar nakázal Karrasovi, aby se vypoøádal s hrozbou Pátraèù.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//Tady - pokud budeš potøebovat naši pomoc, pøenese tì tahle runa pøímo do kláštera.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Pamatuj, musíme zùstat ostraití, nebo budeme odsouzeni k záhubì.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "Pøišel jsem si pro Innosovo oko.";
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
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//Pøišel jsem si pro Innosovo oko.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Vidím, e tì lord Hagen povìøil údìlem nést Innosovo oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Bojím se, e tì musím zklamat. Stali jsme se obìtí zrádného spiknutí nepøítele.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Innosovo oko bylo násilnì odebráno z tìchto svatıch zdí.
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kdo se opováil, pane?",dia_pyrokar_giveinnoseye_wer);
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
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Kdo se opováil, pane?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Kdo to byl?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Zlo je vychytralé a vdycky pracuje v utajení. Jen velmi vzácnì se ti podaøí odhalit jeho intriky na denním svìtle.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//Ale v tìchto dnech je to jiná vìc. Nepøítel se ukazuje zcela otevøenì na ulicích, v kadém domì a na kadém námìstí.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//To mùe znamenat jen to, e u se nebojí ádného nepøítele a nezastaví se pøed nièím.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Jeden z našich vìrnıch následovníkù, kandidát na nositele róby vyvolenıch mágù ohnì, neèekanì zmìnil pøedmìt své vìrnosti a propadl obyèejùm zla. Pedro.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Nepøítel se zmocnil jeho mysli a pøivedl nás tak ke strašné prohøe.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro se probil našimi nejsvatìjšími komnatami a ukradl Oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Bojím se, e trávil pøíliš mnoho èasu o samotì mimo klášter, a tedy mimo dosah jeho ochrannıch zdí. Vystavoval se tak mnohému nebezpeèí.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabednìnci z kláštera zatím dopustili, aby jim nìjakı novic pøímo pøed nosem vyfoukl Innosovo oko. Teï mi nezbıvá nic jiného, ne jít po tom zrádci Pedrovi a doufat, e je ještì nikomu neprodal.");
	b_logentry(TOPIC_TRAITORPEDRO,"Innosovo oko ukradl z kláštera zrádce Pedro. Mám pocit, e ohniví mágové by ho a moc rádi dostali do rukou.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "Máte tušení, kam ten zlodìj utekl?";
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
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Máte tušení, kam ten zlodìj utekl?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro zneškodnil nìkolik dalších novicù, kteøí se ho pokoušeli zastavit, a zmizel v ranní mlze.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//U se za ním vydalo mnoho novicù, aby mohli Oko vrátit v poøádku na své místo.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Pokud ho chceš dopadnout, musíš si pospíšit, dokud Pedro nezmizí z tvého dosahu.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "Nalezl jsem Innosovo oko. Je rozbité.";
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
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Nalezl jsem Innosovo oko. Je rozbité.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Ale... to nejde. Co se stalo?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Padlo do rukou tìch odpornıch zrùd. Stejnì jsem u pøišel pozdì.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//Pøipravovali tam nahoøe v lesích podivné zaklínadlo pro nìjakı mìsíèní rituál.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Innos s námi. Znesvìtili náš kruh Slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Ani ve svıch nejhorších noèních mùrách jsem si nikdy nepøedstavoval, e se zmocní takového druhu moci.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co budeme dìlat teï?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Co budeme dìlat teï?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Nepøítel se stal velmi silnım. Ještì stále však pro nìj tenhle artefakt pøedstavuje mocnou hrozbu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Musíme Innosovo oko opravit a navrátit mu jeho starou sílu. Ale èas je proti nám.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Nedokáu si pøedstavit, co se s námi všemi stane. Bez ochrany Oka jsme nepøíteli vydáni na milost.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Zajdi do mìsta za Vatrasem, vodním mágem. Za tìchto strašnıch okolností si bude vìdìt rady jedinì on. Vezmi Oko k nìmu a pospìš si.
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Proè Vatras?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co je to kruh Slunce?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Pyrokar chce, abych ve mìstì poprosil o radu mágy vody a otázal se jich, co dìlat s poškozenım Okem.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Proè Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Privilegium nosit róbu ti ještì neopravòuje k tomu, aby ses vyptával na dùvody mıch instrukcí, bratøe.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras je Adanùv sluebník. Vìdomosti toho vodního mága nám pøinesou trochu svìtla do tohoto temného èasu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//To je vše, co potøebuješ vìdìt.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Co je to kruh Slunce?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Kadoroènì se v èase slunovratu všichni mágové a novicové kláštera vydávají na cestu na toto místo, aby tak pøivítali poèátek nového cyklu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//To místo zaplòuje nesmírná moc Slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Nikdy jsem ani nepomyslel na to, e by tato moc mohla bıt zvrácena. A teï se právì tohle stalo.
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
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//Vıbornì. Kde je?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Pøipravuje ve sluneèním kruhu rituál potøebnı k opravì Innosova oka.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Pokud je to pravda, tak nám ještì moná zùstala jiskøièka nadìje.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras chce, abyste mu s tím ty a Xardas pomohli.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//CO? Xardas tam bude taky? To nemùeš myslet vánì.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Hele. Já o tom nerozhodl. Poaduje to Vatras.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Poøád ten Xardas. U mì zaèíná unavovat. Jen tìko to mohlo dopadnout hùø.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Jak mám vìdìt, e Xardas není ve spolku s nepøítelem?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Nemùu Xardasovi vìøit a je jedno, jak moc ho potøebujeme.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Je mi líto, ale za tìchto okolností nemohu Vatrasovi pomoci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "Bez tebe to nepùjde. Vatras není schopen ten rituál jinak pøipravit.";
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
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Bez tebe to nepùjde. Vatras není schopen ten rituál jinak pøipravit.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Budeš muset Xardasovi vìøit.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Nemùu nic dìlat, slyšíš? Nemám ani nejmenší dùkaz toho, e Xardas nepracuje proti nám. Nemùu to udìlat.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//A co kdy ti nìjakı dùkaz seenu?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//Bojím se, e to je nemoné. To by mì opravdu pøekvapilo.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//A mám znaèné pochybnosti o tom, e by mì Xardas ještì mohl nìèím pøekvapit. I pøi jeho nevypoèitatelnosti.
	b_logentry(TOPIC_INNOSEYE,"Pyrokar má z Xardase poøádnı strach. Musím s Xardasem prodiskutovat, jak ho pøimìt k úèasti na rituálu kruhu Slunce.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "Pøinesl jsem od Xardase tuhle knihu.";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Pøinesl jsem od Xardase tuhle knihu.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//Je to symbol jeho dùvìryhodnosti.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Uka mi to.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(vzrušenì) Ale to je neuvìøitelné. Máš ty vùbec ponìtí, co je to, cos mi právì dal?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ehm. Ne.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(podrádìnì) Tohle je starobylá, velmi dlouho ztracená kniha z èasù dávno minulıch.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//Mìli jsme za to, e je ztracena jednou provdy, ale teï vidím, e Xardas celou tu dobu vìdìl, co se s ní stalo.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Take souhlasíš s tím rituálem?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Ano, mìl bych vyrazit ke sluneènímu kruhu, ale rozhodnì ne proto, e bych byl pøesvìdèenı o Xardasovıch dobrıch úmyslech.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//Vlastnì se chystám z toho psa dostat vysvìtlení, kde tolik let ukrıval tu knihu. Tentokrát zašel pøíliš daleko.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Uvidíme se u sluneèního kruhu.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Pyrokar koneènì souhlasil, e navštíví kruh Slunce.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "Myslíš, e mùeš Innosovo oko opravit?";
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
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Myslíš, e mùeš Innosovo oko opravit?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Tìko øíct. Poèkáme a uvidíme.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "Dokázal jsi to. Innosovo oko je zase v poøádku.";
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
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Dokázal jsi to. Innosovo oko je zase v poøádku.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//Jen stìí mùu uvìøit, e je nìco takového moné.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Ano, mistøe.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//U jsi mnohokrát prokázal, e jsi hoden Vyššího øádu ohnivıch mágù.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//Od tohoto dne jsi èlenem Rady a budeš nás øád reprezentovat po celém svìte. Teï jsi jedním z vyšších ohnivıch mágù.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Uívej róbu vyvolenıch s dùstojností a pøines øádu slávu a bohatství, mùj bratøe.
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
	description = "Co tu ještì musím uèinit?";
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
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Co tu ještì musím uèinit?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Neplıtvej svım èasem na malichernosti. Bì porazit draky. Tady, vezmi si Oko.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Nezapomeò, e musíš s drakem nejprve promluvit, ne ho napadneš.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Moc Oka pøinutí draka promluvit a øíkat pravdu.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Také ti, pokud ho máš na sobì, poskytuje ochranu proti jejich útokùm.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Nicménì, moc Oka není nevyèerpatelná. Budeš ho muset doplòovat magickou energií.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//Budeš k tomu potøebovat esenci z draèího srdce, kterou mùeš s Okem spojit za pomoci alchymistické kolony.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Jedinì pak se mùeš odváit postavit drakovi.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Díky. Budu si to pamatovat.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Teï máš vše, co potøebuješ. Tak jdi. U ti nezbıvá mnoho èasu.
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"Teï u mohu bez obav èelit drakùm - staèí si pøi boji nasadit Innosovo oko a mohu je všechny postupnì znièit. Pøed bojem si ale musím s drakem vdycky promluvit, jinak nemám šanci. Problém je, e kadı takovı rozhovor pøipravuje Oko o èást moci. Obnovit ji mohu pouze s alchymistickou kolonou s pomocí draèího srdce a prázdné laboratorní baòky, kde s pomocí extraktu z draèího srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dalšímu obludnému ještìrovi.");
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
	description = "Nalezl jsem podivnı almanach.";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Nalezl jsem podivnı almanach.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Opravdu? Co je to za almanach?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Nejsem si jistı. Mìl jsem dojem, e ty budeš vìdìt, k èemu to je.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//Vìru, to je velmi znepokojivé. Jsem rád, es mi to pøinesl. To od tebe bylo opravdu moudré.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Pøedpokládám, e tam toho bude víc. Bì a najdi více tìchto knih zatracení.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Vypadá to, e je to nástroj moci Pátraèù.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Pouívají jej k ovládání ztracenıch duší svıch obìtí.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Obvykle si do tìch knih zapisují jména tìch, kterıch se chtìjí zmocnit.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Poslouchej. Dám ti tenhle magickı svitek. Ukáe ti jména, která jsou zanesená do tìch knih.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Najdi ty obìti a pøines mi jejich knihy. Mìl bych je zprovodit ze svìta.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Ale nejprve bys mìl alespoò jednu z nich ukázat Karrasovi. Moná se mu bude pøi jeho studiích k nìèemu hodit.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Neudìlej hloupost a nepokoušej se je nièit sám. Ještì nejsi schopen odolat jejich moci.
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedlıch. Dal mi proto seznam všech, které Pátraèi hodlají ovládnout - postupem èasu se mùe rozrùstat o další jména.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Nepøibliuj se k Pátraèùm, jinak tì proklejí.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Pokud nebudeš schopen odolávat jejich volání, vra se ke mnì, jak nejrychleji to bude moné.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Pouze tady v klášteøe je tvá duše v bezpeèí.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Neexistuje proti tìm mentálním útokùm nìjaké ochrana?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Moné to je. Karras by o tom mohl nìco vìdìt.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"S Karrasovou pomocí prı mohu najít ochranu pøed mentálními útoky Pátraèù.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Vyléèit posedlost)";
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
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Vyleè mì, pane, byl jsem proklet.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//Budi! Vezmi si tenhle lektvar. To tì zbaví tvıch noèních mùr.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Nech je ti Innosova spása ochranou.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Jednej v jeho jménu a støez se zlého nepøítelova pohledu.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Ale abych tì varoval - pokud budeš jejich vlivu vystaven pøíliš èasto, u pro tebe za jistıch okolností nebude návratu. Vdycky na to pamatuj.
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Mám dojem, e jsem byl proklet. Mùeš mì vyléèit?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Ne bez dùkazu tvého respektu k tomuto klášteru, mùj synu. 300 zlatıch.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"To je pøíliš.",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"Vıbornì. Tady jsou peníze.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Ale vdy ty ještì jeden léèivı lektvar máš. Vra se, a budeš mou pomoc opravdu potøebovat.
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Vıbornì. Tady jsou peníze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Tady, vypij tohle. Nech je ti Innosova spása ochranou.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Pøines mi ty peníze a dostane se ti pomoci.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//To je pøíliš.
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "Mùu ti o tom prokletí øíct i nìco víc.";
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
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Mùu ti o tom prokletí øíct i nìco víc.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Mluv, bratøe.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Nalezl jsem další almanach.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Mám pro tebe tìch Spáèovıch knih ještì víc.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Dobrá. Nicménì se obávám, e je jich k nalezení mnohem víc. Pokraèuj v hledání.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Nalezli jsme jich u mnoho. Nemyslím si však, e to jsou úplnì všechny.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//U jsi mi pøinesl spoustu tìch nepøátelskıch knih.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Docela by mì pøekvapilo, kdyby mezi sebou mìli ještì nìjakou.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Vezmi si tohle. Je to dárek od kláštera, kterı ti pomùe pokadé, kdy se støetneš se zlem.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//A nezapomeò se jednou za èas podívat do mého magického svitku.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Je docela dobøe moné, e se pokusí to samé provést i nìkomu jinému, jeho jméno jsme v tìch knihách nenašli.
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
	description = "Všichni draci jsou mrtví.";
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
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//To je bezesporu dobrá zpráva. Ale na situaci to nic nemìní. Vypadá to dost beznadìjnì.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Pátraèi ještì poøád nezmizeli. Právì naopak. Slyšel jsem mnoho zvìstí o tom, e se posledních pár dní jejich poèet ještì zvıšil.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Vybití drakù mìlo nepøítele zneškodnit, ale asi to nestaèilo. Musíme to zlo vyrvat i s koøeny.
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
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//Co øíkali?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Povídali o moci jejich Pána a o tom, e se usadil Irdorathskıch síních.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Innos s námi. Temnı chrám znovu nabyl svou sílu a teï vysílá své posluhovaèe do našeho svìta.
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "Co jsou to ty Irdorathské sínì?";
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
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Co jsou to ty Irdorathské sínì?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//Vıchodní chrám vzıvání boha Beliara. V zemi Myrtana jsou celkem ètyøi. Ale tenhle je pravdìpodobnì nejdìsivìjší ze všech.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Asi pøed 40 lety byly znièeny chrámy tohoto strašného bostva na západì a na severu.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//Stateèní rytíøi tìch èasù srovnali ty mocné stavby se zemí.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Pak se èerné hordy nepøátel staly proti pøevaze hrdinské odvahy rytíøù a paladinù bezmocnımi.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Nemìlo by bıt pøíliš tìké znièit i ty zbylé dva chrámy a oèistit tak navdy zemi od zla.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... ale poté, co druhı chrám padl, prostì zmizely.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(posmìšnì) Zmizely. Celé chrámy. Jo, jasnì.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Nesmìj se. Situace je váná. Pokud Irdorathské sínì znovu nabyly své moci, pak nebude nijak snadné nepøítele porazit.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Proto ho budeš muset najít a povaovat to za svùj další a ještì tìší úkol.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Uvidíme.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Podle Pyrokara jsou Irdoratské sínì ztracenım chrámem, kde uctívaèi vzıvali boha Beliara. Musím jej najít.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Xardasova kniha, která byla povaována za ztracenou - kde je?";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Xardasova kniha, která byla povaována za ztracenou - kde je?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Èekal jsem, e se na to zeptáš. Ale obávám se, e ti to k nièemu nebude.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Byla magicky zapeèetìna. Ukryl jsem ji do jedné z našich podzemních skrıší. Dokonce jsme se u pokoušeli ji otevøít. Marnì.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Ten zpropadenı Xardas s námi hraje špinavou hru.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Mùu se na tu knihu podívat?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Jak je libo. Nedokáu si pøedstavit, e bys uspìl, kdy se to nepovedlo nejvìtším mistrùm kláštera.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Ale klidnì bì a zkus to, Talamon ti nebude bránit.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardasova kniha Irdoratské sínì je ukryta ve sklepeních kláštera, kde ji støeí Talamon. Mágové ji ale nedokáí otevøít - její magickou peèe prı má na svìdomí sám Xardas.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "Podaøilo se mi otevøít Xardasovu knihu.";
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
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Podaøilo se mi otevøít Xardasovu knihu.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Co? Jak jsi to dokázal? Málem mì to pøivedlo k zoufalství.
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Xardas mi to prozradil.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Øekl bych, e štìstí si prostì jednou sedne i na vola, nic jiného.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Øekl bych, e štìstí si prostì jednou sedne i na vola, nic jiného.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Nevykládej nesmysly. Štìstí!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Mnì se to vùbec nezdaøilo a pak je to pro nìkoho jako ty úplná hraèka...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... proto mám o èem pøemıšlet.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Jinak. Jeliko jsi byl jedinım, kdo to dokázal otevøít, asi bude nejlepší, kdy ti bude svìøena do péèe. Alespoò do té doby, ne pøekonáme tuhle krizi.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas mi to prozradil.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Á, tak je to. Jak zajímavé. Jen ve tvém vlastním zájmu doufám, e tì Xardasùv špatnı vliv ještì nezkazil.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Varuju tì. Nepodlehni úskokùm toho starého zla. Mohl bys toho pozdìji litovat.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "V té knize je zmínka o tajné knihovnì.";
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
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//V té knize je zmínka o tajné knihovnì.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//O èem to mluvíš?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//O knihovnì tady za tou zdí. Trefil jsem se?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Ne. Kde jsi øíkal, e by ta knihovna mìla bıt?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Rozumím. Nemáš tušení. Mmh.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pyrokar o tajné knihovnì nic neví - pravdìpodobnì do ní mìl pøístup pouze Xardas.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "Vím, kde hledat Irdorathské sínì.";
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
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Vím, kde hledat Irdorathské sínì.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Ten chrám je na ostrovì. Nalezl jsem námoøní mapu, na které je zachycena cesta.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//To je skvìlé. Tak to budeš potøebovat loï a posádku, aby ses mohl postavit nepøíteli.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Ale nezapomeò, e se musíš dobøe pøipravit, abys byl schopen porazit Pána Irdorathu.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Kde najdu nìjakou posádku?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Tvoje posádka by mìla sestávat z muù, kterım se dá vìøit.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Promluv si se svımi pøáteli a popøemıšlej, kdo by se ti mohl hodit, a budeš na ostrovì.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Taky budeš potøebovat mága. Ale bohuel, já nemùu nikoho z kláštera postrádat.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Budeš se muset zeptat nìjakého mága, co neije v klášteøe.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Jorgen je zkušenım námoøníkem. Mohl by mi pomoci dostat se na ostrov Irdorath.";
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
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen je zkušenım námoøníkem. Mohl by mi pomoci dostat se na ostrov Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Obávám se, e to nebude tak snadné.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Upsal se práci pro bratrstvo. Nesloil nám ani poplatek, ani nám nepøivedl ovci.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen musí nejprve dokonèit svou práci a pak si ho mùeš odvést, pokud budeš mít zájem.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Jak dlouho to bude trvat?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Spotøeboval tolik zásob, kolik by novicovi staèilo pøinejmenším na tøi tıdny. A to za jeden den.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Take ho nemùu nechat jít døív, ne si v naší zahradì tvrdì odpracuje tøi mìsíce.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "Co musím udìlat, abych si mohl Jorgena odvést hned teï?";
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
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//Co musím udìlat, abych si mohl Jorgena odvést hned teï?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Mmh. Jasnì, e je tu jedna vìc, kterou bys mohl udìlat. Mohly by ti s tím pomoct tvoje dobré vztahy s Xardasem.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Všiml jsem si, e se posledních pár dní dìjí na jeho vìi divné vìci.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Mnoho lidí øíká, e odtamtud v noci vycházejí rùzné skøeky a e nad jeho vìí tancují divná svìtla.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Jako bychom nemìli dost svıch vlastních starostí. Bì zjistit, co se tam dìje, a zaøiï, a to pøestane.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Pak dostaneš Jorgena.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"V Xardasovì vìi se dìjí divné vìci. Pokud se o nì postarám, mohu vzít Jorgena s sebou.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "Povauj tu vìc s Xardasovou vìí za vyøízenou.";
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
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Povauj tu vìc s Xardasovou vìí za vyøízenou.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//Tak co se tam dìlo... ne, poèkej, radši to nechci vìdìt.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Jestli poøád chceš Jorgena, tak bì a vezmi ho s sebou na tu svou cestu.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Nech tì Innos ochraòuje.
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
	description = "Proroctví se zmiòuje o posvátné Innosovì auøe.";
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
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//Proroctví se zmiòuje o posvátné Innosovì auøe.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Innosova aura je amulet, kterı je povoleno nosit jen nejvìtším mágùm své doby.
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
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//Coe? Co s ním chceš dìlat?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Postavit se drakovi.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Ano, samozøejmì. Dám ti ten amulet, ale zacházej s ním opatrnì.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Jo, jasnì.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Nerad bych jej musel pozdìji vykupovat od nìjakého kupce.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Pouívej ho moudøe, a nech tì Innos stále ochraòuje.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Co je to za amulet?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Øíká se, e ho ukul sám Innos a dal jej lidstvu jako dar.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Ochraòuje toho, kdo jej nosí, pøed jakoukoliv újmou.
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
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//Innosovy slzy jsou jen souèástí staré báchorky pro dìti. Vypráví o tom, jak na poèátku èasù zaèala bitva mezi Innosem a Beliarem.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Aha.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Našel jsem tenhle lektvar.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Aha.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Nevím, jestli si jsi plnì vìdom toho, jaká je naše situace, ale tìko dokáu uvìøit tomu, e bys doufal, e nepøítele porazíme pohádkou pro dìti.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Našel jsem tenhle lektvar.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//To není moné. Tomu nemùu uvìøit.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//Co se dìje?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Pokud jsou tohle skuteèné Innosovy slzy, pak...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(skoèí do øeèi) Tìko.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Nepøerušuj mì. Pokud jsou tohle skuteèné Innosovy slzy, pak máme proti našemu nepøíteli mocnou zbraò.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Tak co jsou ty Innosovy slzy?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Co myslíš tím 'zbraò'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Tak co jsou ty Innosovy slzy?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Kdy si Innos uvìdomil, e aby zachránil svìt, musí bojovat proti Beliarovi, svému vlastnímu bratrovi, byl jeho zármutek nevyslovitelnı.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Zaèal plakat a jeho slzy spadly dolù na svìt. Bylo jich mnoho, protoe jeho srdce bylo tak plné zármutku, e plakal celıch 13 let.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Jdi pøímo k vìci.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Všechny, kdo tyto slzy našli a okusili je, rázem naplnila nadpøirozená síla a bystrost. Poznali moudrost Innosova stvoøení a zaèali mu slouit.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Byli to první èlenové Spoleèenstva ohnì. Ty slzy jim daly sílu, odvahu a moudrost. Ale to u bylo velice dávno, a u více ne 250 let nikdo Innosovy slzy nespatøil.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Co myslíš tím "zbraò"?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legenda vypráví, e pod vlivem této látky dokázali Innosovi váleèníci vykonávat témìø nadlidské skutky.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Nedotkla se jich ádná únava a byli silní jako dva medvìdi.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Nejvìtší hrdinské èiny starıch dnù bylo moné vykonat jen s pomocí Innosovıch slz.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Rozumím.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Avšak ty slzy mohou pøinést také utrpení a smrt. Tento lektvar mohou pít jen èlenové našeho øádu.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Kohokoliv jiného - dokonce i paladiny našeho Pána - by okamitì potkala krutá smrt.
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

