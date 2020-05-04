
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(káravì) Odvažuješ se oslovit mì, novici? Vra se ke své práci.
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"Zrovna jsem na odchodu. (KONEC)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"Mám ještì jednu otázku ...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//Mám ještì jednu otázku.
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(vztekle) Zdá se, že to nechápeš. Já sám si rozhodnu, kdy s tebou budu mluvit. Kdo si myslíš, že jsi?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//A teï si bìž po svém!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Tvoje pøítomnost dokazuje nejen nedostatek úcty, ale také tvou hloupost, novici!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi složil Zkoušku ohnì.";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Slyšel jsem, že jsi složil Zkoušku ohnì.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//(samolibì) To ti pøi vší skromnosti mohu øíct. Kdokoliv jiný, kdo se o to pokoušel, zemøel.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(blahosklonnì) Vážnì bys nemìl tu zkoušku podstupovat. Tvùj duch je slabý. Lepší bude, když budeš sloužit nìkolik let v klášteøe, tøeba budeš bìhem nìkolika let vyvolen.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Já tu zkoušku složím.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Pokud to je vùle Innosova, tak ano. Ale jestli ne - pak selžeš.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "Jsem pøipraven podrobit se tvé zkoušce, Mistøe.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Jsem pøipraven podrobit se tvé zkoušce, Mistøe.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Takže chceš tu zkoušku podstoupit. O nìco takového mùže žádat jen odvážný novic. Odvaha však není vše, co je zapotøebí.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Jsi dost chytrý na to, abys tu zkoušku složil? Jsi dost silný, aby ses postavil nebezpeèím, jež na tebe èekají?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Jestli ne, zaplatíš za to životem.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//A nyní poslouchej znìní zkoušky: Na Místì Kamenù hledej toho, kdo nebyl nikdy zrozen - najdeš toho, kdo byl kdysi pøivolán.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Pøemož toho, koho pøemoci nelze - utkej se s živoucí skálou, bojuj s neumírajícím kamenem - a zniè jej.
	Wld_InsertNpc(magicgolem,"FP_MAGICGOLEM");
	MAGIC_GOLEM = Hlp_GetNpc(magicgolem);
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Serpentes mì podrobil zkoušce. Mám najít 'toho, kdo byl kdysi vyvolán', oživlý kámen, a pøemoci jej.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "Co to mùže být za bytost?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//Živoucí skála? Co to mùže být za stvoøení?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Øekl jsem ti vše. (výsmìšnì) Nebo se ti zdá ta zkouška pøíliš obtížná?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Nyní poznáš, co to obnáší podstoupit Zkoušku ohnì - na žádné další tvé otázky už nebudu odpovídat.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(opovržlivì) Bìž a splò svùj úkol, novici!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "Porazil jsem toho golema.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Porazil jsem toho golema.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Cože? Vážnì jsi to dokázal? Ale bez Innosova kladiva bys golema nemohl nikdy pøemoci.
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(triumfálnì) Ale teï ses sám prozradil! Byls to ty, kdo zabil Garwiga!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//ÈEKÁ TÌ TREST ZA VRAŽDU INNOSOVA SLUŽEBNÍKA!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(lítostivì) Ale musím uznat, že úkol, který jsem ti zadal, jsi splnil.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//Mìl jsem to kladivo vzít sám.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "Chceš mi øíct ještì nìco?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Chceš mi øíct ještì nìco?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Ne. Teï ne, bratøe.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Odchod. Víš, co musíš udìlat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Ne tak rychle. Mám pro tebe ještì jeden úkol.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(s povzdychem) A to?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Teï, když jsi èlenem Bratrstva ohnì, musíš splnit své povinnosti související s tím, když se staneš jedním z nás.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Církev nezajímají jen vìci kolem magie - jak sám víš, je to také nejvyšší autorita v oblastech práva.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Poslední pøípad pøed námi otevírá bezednou propast a jednou provždy se s ním musíme vypoøádat.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Už takhle mám dost svých starostí. Najdi si nìkoho jiného.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"O co jde?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Není to snad záležitost domobrany?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Nájemný žoldák tvého kalibru by nám v tom mohl pomoci.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Už takhle mám dost svých starostí. Najdi si nìkoho jiného.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"Koho mám zabít?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Není to snad záležitost domobrany?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Domobrana je zodpovìdná jen za mìsto. Tahle záležitost má ovšem dalekosáhlé dùsledky.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//Už takhle mám dost svých starostí. Najdi si nìkoho jiného.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(rozzlobenì) To je urážka. Nikdy se nedostaneš do vyšších magických kruhù, pokud nejsi ochoten vykonat službu pro svoje Bratrstvo.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Ukládám ti dùtku. Doufám, že se to už víckrát nestane - jinak by to s tebou špatnì dopadlo.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Ve mìstì je nìkdo, kdo prodal falešné podíly na rudné doly v bývalé trestanecké kolonii.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Ty papíry jsou zcela bezcenné a nemají žádný význam, vážnì. Pøesto by mohly mezi lidem vyvolat potíže, což si nyní nemùžeme dovolit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Ten švindlíø nejspíš oslovil všechny významné obchodníky ve mìstì a okolí a dokonce se mu evidentnì podaøilo nìkterým z nich èást tìch falešných podílových listù prodat.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Najdi toho padoucha a pøiveï jej pøed tribunál. V takovýchto tìžkých èasech nemùžeme trpìt takovéhle podvodníky a mrchožrouty.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Musíme ho exemplárnì potrestat, abychom odradili ostatní podobné zlotøilce.
	Info_AddChoice(dia_serpentes_minenanteile,"Zkusím tu záležitost nìjak vyøídit.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Zkusím tu záležitost nìjak vyøídit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Ještì jedna vìc. Až budeš ty obchodníky navštìvovat, nedej najevo, že se pídíš po tìch podílových listech.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Øekl bych, že je budou chtít prodat dál a rozhodnì by ti je nenabízeli, pokud jim dojde, že jednáš z rozkazu církve, rozumíš?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Ano.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Tak vzhùru do práce. Pøeji ti brzký úspìch, bratøe.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Nìjaký tuneláø tu obchodníkùm prodává ilegální akcie rudných dolù a vydìlává na tom poøádný balík. Musím zjistit, kdo za tím vìzí a Serpentovi pak musím všechny ty padìlky odevzdat.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Koho mám zabít?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//Innosi, slituj se. Nikoho, samozøejmì. Tahle záležitost vyžaduje trošku jemnìjší jednání, ty neomalený hulváte.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, alchymista z horního konce mìsta, se provinil vážným zloèinem a musí za nìj být potrestán.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Odmítl však pøijít do kláštera, kde mìl stanout pøed soudem. Pøiveï ho sem.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Jak to udìláš, to už je na tobì. Samozøejmì, že za to dostaneš odpovídající odmìnu.
	Info_AddChoice(dia_serpentes_minenanteile,"Není to snad záležitost domobrany?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"Žádný problém. Postarám se o to.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//Žádný problém. Postarám se o to.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Dobrá. Oèekáváme, že to bìhem nìkolika dní zaøídíš.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Musím pøed soud do kláštera pøivést Salandrila, alchymistu z horní khorinisské ètvrti. Nemusí mì zajímat, co vlastnì spáchal, hlavnì když za to dostanu zaplaceno.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "Co se týèe tìch padìlaných dùlních akcií...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Podaøilo se mi získat ty podílové listy.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Podaøilo se mi získat nìkolik podílových listù.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Velmi dobøe. Musíš stáhnout z obìhu úplnì všechny. Je to pro naše lidi jako jed. Pøines mi je všechny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Dám ti vše potøebné.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Myslím, že by to mìly být všechny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Dobrá práce. Zasloužíš si svou odmìnu.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Vezmi si tenhle ochranný amulet. Pomùže ti na cestách, na nìž se ještì budeš muset vypravit.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Je tohle opravdu poslední?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "Vím, kdo vypustil ty podílové listy do obìhu.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Vím, kdo vypustil ty podílové listy do obìhu. Byl to Salandril, alchymista z horní èásti mìsta.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Tak jej pøiveï sem. Musíme s ním probrat pár vìcí.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "Salandril je tady, v klášteøe.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Salandril je tady, v klášteøe.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Dobrá práce. Vyøídíme to s ním pozdìji.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Tady je tvoje odmìna. A nikomu ani slovo, rozumíš?
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "Salandril je mrtvý.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril je mrtvý.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Inu, v tom pøípadì zùstane jeho skutek nepotrestán. Nech se Innos slituje nad jeho ubohou duší.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

