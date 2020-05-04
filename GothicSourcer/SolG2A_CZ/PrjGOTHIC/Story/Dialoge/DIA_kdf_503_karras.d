
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Co pro tebe mohu udìlat, novici?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Co pro tebe mohu udìlat, bratøe?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Do tìchto komnat zavítají ctihodní Innosovi váleèníci jen zøídka.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Co pro tebe mohu udìlat?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(nedùvìøivì) Co tady dìláš?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "Pøišel jsem si pøeèíst nìjaké svaté texty.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Pøišel jsem si pøeèíst nìjaké svaté texty.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Rozumím. Jestli se ti podaøí najít mezi nároèným studiem nìjaký volný èas, stav se za mnou.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Je tady ještì jedna záležitost, ke které bych potøeboval diskrétního novice.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "Máš pro mì nìjaký úkol?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//Máš pro mì nìjaký úkol?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Ano. Týká se to toho bláznivého Ignaze. Žije v Khorinisu a experimentuje s rùznými lektvary a léèivými odvary. Ale také s kouzly a magií.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//A to mì trápí. Ptám se sám sebe, jestli se jeho magie neprotiví Innosovi.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Abych se mohl pøesvìdèit, potøebuji nìjaké jeho kouzelné svitky.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Chci, abys šel do mìsta a získal pro mì tøi jeho magické svitky.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Ale nikomu ani muk - je to jasné?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Jasnì.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Tady máš 150 zlatých. To by mìlo pokrýt tvé výdaje.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Mistr Karras mì poslal do mìsta, kde mu mám obstarat tøi svitky s kouzly, které vyrábí a prodává Ignaz.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Tady jsou ty magické svitky, které jsi chtìl.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Tady jsou ty magické svitky, které jsi chtìl.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Velmi dobøe, mùj mladý pøíteli.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//Ale teï je na èase, aby ses vìnoval svým studiím.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//Za odmìnu si vezmi tenhle èarovný svitek.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "Co máš pøesnì na starosti?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//Co máš pøesnì na starosti?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Mým úkolem je cvièit mágy v umìní sférické manifestace.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Co to znamená?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//No, uèím je, jak vyvolávat stvoøení z jiných sfér.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Vìtšinou se tomu øíká prostì vyvolávání, i když tenhle výraz naprosto nestaèí k popsání umìní stvoøení služebníka.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Navíc mám nìkolik zajímavých svitkù s kouzly, které u Goraxe nenajdeš.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//Ale nabízím je jen èlenùm našeho Øádu.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistr Karras z kláštera mì mùže zásobit svitky s kouzly - pokud se tedy stanu mágem ohnì.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "Rád bych se od tebe nìèemu pøiuèil (vytvoøit runy).";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//Uè mì.
	Info_ClearChoices(dia_karras_teach);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//V tuhle chvíli není nic, co by ses ode mì mohl nauèit.
	}
	else
	{
		Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = "Chtìl bych se nauèit ètvrtý Kruh magie.";
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Chtìl bych se nauèit ètvrtý Kruh magie.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Dobrá. Všechna znamení jsou splnìna. Vstup nyní do ètvrtého kruhu, aby se v tobì probudila síla nové magie.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Prošel jsi dlouhou cestou a Innos bude i nadále osvìtlovat tvou stezku.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Ještì stále není vše hotovo.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = "Chtìl bych se nauèit pátý Kruh magie.";
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Chtìl bych se nauèit pátý Kruh magie.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//V tom pøípadì nyní vstup do pátého Kruhu magie. Budeš vládnout ještì silnìjší magií, než kdykoliv pøedtím.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//Užívej její moc s rozvahou, bratøe - temnota je stále pøíliš silná a naši nepøátelé též.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Do šestého a nejvyššího Kruhu magie tì doprovodit nemohu. Až pøijde správný èas, zasvìtí tì sám Pyrokar.
			b_logentry(TOPIC_KLOSTERTEACHER,"Mistr Pyrokar mì zasvìtí do šestého kruhu magie.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Èas ještì nedozrál.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Nesmíš ztrácet èas, bratøe. Musíš dohonit Pedra a vrátit klášteru Innosovo oko.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Pokud nebude Oko navráceno, budeme všichni ztraceni.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Co tady dìláš? Nemìl bys být na cestì za tím bezpáteøním zrádcem Pedrem?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"Pozdìji. Nejprve si musím nìco zaøídit..",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"Nedostane se nijak daleko.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Pozdìji. Nejprve si musím nìco zaøídit.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Uvìdomuješ si vùbec, co tahle ztráta pro klášter znamená? Innosovo oko je mocná zbraò.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Nikdo nemùže tušit, co s tím amuletem nepøítel zamýšlí, ale nìco rozhodnì plánuje a my mu to musíme pøekazit.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Takže se okamžitì vydej na cestu za tím zlodìjem!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Nedostane se nijak daleko.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//To doufám, pro tvoje vlastní dobro. Pokud by mìl uniknout jen proto, že se tady poflakuješ, sám tì dokopu pøed tribunál.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//Z èeho bys mì obvinil?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//Ze spolèování s nepøítelem. Nepotøebuješ velkou fantazii, aby sis dokázal pøedstavit, jaký by tì za to potkal trest.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//Takže už neztrácej èas, protože tvùj další osud bude záviset na tom, za jakých okolností se pøíštì setkáme.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Víš všechno, co potøebuješ. A už jsi na cestì!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "Pøinesl jsem zpátky Innosovo oko.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Pøinesl jsem zpátky Innosovo oko.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//To mi spadl kámen ze srdce, že se ti podaøilo Innosovo oko nepøíteli uzmout.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Ale nebezpeèí nebylo odvráceno. Zlo kuje další plány a pokraèuje s nebývalou agresivitou.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//To už mi také došlo.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Nedìlej si ze mì šprouchlata. Situace je vážná, velice vážná, a nemùžeme vìdìt, komu je možné dùvìøovat.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Nepøíteli se už podaøilo uvést v pokušení novice Pedra a mùže se mu to podaøit u mnohých dalších.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "Jak pokraèují tvá studia?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Jak pokraèují tvá studia?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Podaøilo se mi pøijít na nìco ohlednì Pátraèù.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//A co to má být?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Jsou zcela jasnì démonického pùvodu. Tedy, pøinejmenším jsou, nebo alespoò byli pod vlivem démonù.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Když na nì narazíš, buï opatrný.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//Jak novátorský pøístup.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Je mi líto, ale nemám dost materiálù, abych mohl vyvozovat pøesnìjší stanoviska.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Ale kdyby se ti podaøilo získat z nich nìco, co bych mohl podrobit zkoumání...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Karras potøebuje nìco, co bylo v pøímém kontaktu s Pátraèi. Jen tak bude moci pokraèovat ve svých výzkumech.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"Uvidím, co se dá dìlat.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Mohl by do toho být nìjakým zpùsobem zapletený Spáè?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"A jaké materiály bys potøeboval?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Ještì stále pracuji na interpretaci dùkazù souvisejících s Pátraèi.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Samozøejmì, že jakmile nìco zjistím, dám ti okamžitì vìdìt.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//Nepøítel má mnoho tváøí. Je strašnì obtížné urèit, která z nich pøedstavuje pro klášter nejvìtší nebezpeèí.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Mohl by do toho být nìjakým zpùsobem zapletený Spáè?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//Ten pøíbìh o Spáèovi jsem slyšel. Ale tak obecnì, že k tomu nemám co øíci.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//Démonù je bezpoèet a zapletený do toho mùže být kterýkoliv z nich.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Takže chceš, abych ti pøinesl mrtvolu?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Ne, copak ses zbláznil? Nebezpeèí, které by pøedstavovala pøítomnost démonického stvoøení za zdmi kláštera, by bylo pøíliš velké.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Bude staèit, když najdeš nìjaké pøedmìty, které jsou pro tyto tvory typické.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Zbytky démonické aury, která je obklopuje, by mìly pro bližší zkoumání staèit.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//A jaké materiály bys potøeboval?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Co já vím - nìjaké pøedmìty, které jsou pro tato stvoøení typické.
	Info_AddChoice(dia_karras_kap3_perm,"Takže chceš, abych ti pøinesl mrtvolu?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Pokusím se.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//To by bylo opravdu výborné. Mezitím se budu vìnovat mému vlastnímu výzkumu.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "Mám u sebe Almanach posedlých. Možná by se ti mohl k nìèemu hodit.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Mám u sebe Almanach posedlých. Možná by se ti mohl k nìèemu hodit.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Ukaž mi ho.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Ano, to by mìlo staèit. Prozkoumám tu knihu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//Ale jedním si už jsem jistý.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//Pátraèi jsou podle mì zcela zvrácená forma života vytvoøená Beliarem.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//Ta stvoøení jsou èásteènì démonického a èásteènì lidského pùvodu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Ale poøád nedokážu pøesnì urèit, jestli stojíme pøed typickou duchovní posedlostí, nebo èistì fyzickou mutací.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Pøijï pozdìji. Pak budu urèitì vìdìt nìco víc.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras pro svùj další výzkum potøebuje almanach posedlých. Vrátím se k nìmu pozdìji.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "Už jsi pøišel na nìco nového ohlednì Pátraèù?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Už jsi pøišel na nìco nového ohlednì Pátraèù?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Ano. Už vím, kdo nebo co Pátraèi skuteènì jsou zaè.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Nenapínej mì!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Kdysi to bývali lidé, jako ty nebo já. Udìlali osudnou chybu, když zasvìtili svùj život neèisté magii velice mocného arcidémona.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Pod vlivem tohoto arcidémona a velice mocných drog žili pouze proto, aby mu sloužili, až se z nich staly jen pouhé stíny sebe sama.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Dnes nejsou nic víc než nástroje zla bez vlastní vùle, a nikdy nepøestanou lovit následovníky Innose.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Musíme být opatrní. Zdá se sice, že se zatím vyhýbají tìmto posvátným Innosovým síním.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Ale pokud bude jejich moc nadále rùst, netuším, jestli tu budeme v bezpeèí.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Díky. To bylo vážnì povzbudivé.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Opravdu? To ovšem nastoluje další otázky. Napøíklad, kým byli pøedtím, a jaký arcidémon z nich udìlal to, èím jsou dnes?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//Mám jisté podezøení. Celé to zní jako Bratrstvo Spáèe. Znám ty chlapíky.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Doufám, že víš, do èeho se to zaplétáš. Dávej na sebe pozor, bratøe.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//Abych nezapomnìl. Tady je tvùj almanach. Už ho nebudu potøebovat.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karrasovy studie byly úspìšné. Vypadá to, že Pátraèi jsou nìjak spojeni se Spáèovým bratrstvem.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Pracuji na tom. Pøijï pozdìji.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Existuje zpùsob, jak se ochránit pøed mentálními útoky Pátraèù?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Existuje zpùsob, jak se ochránit pøed mentálními útoky Pátraèù?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Jistì. Amulet s kamenem z posvátné pùdy by mìl mít požadovaný ochranný efekt.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Bohužel nemám dostatek takových kamenù.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Jsou z nich postaveny nìkteré ze svatyní, které jsme vybudovali.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Dobrá. Však já už nìjaké nìkde splaším.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Ano, udìlej to. Ale a tì ani nenapadne nìjak poškodit ty svatynì, slyšíš?
		b_logentry(TOPIC_DEMENTOREN,"Karras mì mùže pøed mentálními útoky Pátraèù trochu ochránit. Potøebuje k tomu ale kámen z posvátné pùdy, jaký lze získat v nìkterých svatyních.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Nemám tušení. Stále toho vím pøíliš málo, než abych znal odpovìï. Zeptej se mì pozdìji.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "Mám nìkolik kamenù z posvìcené pùdy.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Mám nìkolik kamenù z posvìcené pùdy.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Výbornì. Doufám, že všechny svatynì jsou stále na svých místech.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Dobrá. Udìlám ti ochranný amulet proti èernému pohledu Pátraèù.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Dej mi trochu èasu. Dám se hned do práce.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras mi dal amulet, který mì ochrání pøed mentálními útoky Pátraèù. Teï už bude všechno mnohem jednodušší.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "Tak co je s tím ochranným amuletem, cos mi slíbil?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Tak co je s tím ochranným amuletem, cos mi slíbil?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//Jsem hotov. Tady je, podívej. Vypadá nakonec nádhernì.
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Nos ho stále u sebe a Pátraèi tì nebudou moci stáhnout do své duševní propasti.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Dìkuji.
		b_logentry(TOPIC_DEMENTOREN,"Karras mi dal amulet, který mì ochrání pøed èernými pohledy Pátraèù.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Trpìlivost. Ještì na tom pracuji.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

