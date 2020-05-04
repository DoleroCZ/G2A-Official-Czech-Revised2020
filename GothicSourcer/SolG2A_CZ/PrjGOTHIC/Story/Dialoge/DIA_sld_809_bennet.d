
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Neprodávám ádné zbranì. Khaled je prodává. Je v domì s Onarem.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Khaled prodává zbranì.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "Mùeš mi prodat nìjaké vìci na kování?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//Mùeš mi prodat nìjaké vìci na kování?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Co potøebuješ?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Bennet prodává kováøské náèiní.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "Jaké zbranì vyrábíš?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jaké zbranì vyrábíš?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//V tuhle chvíli obyèejné meèe, nic jiného.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale kdybych mìl trochu magické rudy, mohl bych ukovat zbranì, které jsou mnohem lepší ne všechny srovnatelné zbranì vyrobené z normální staré oceli.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nevíš náhodou, kde bych tady v okolí nìjakou našel? (smìje se) Mám na mysli kromì Hornického údolí samozøejmì.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Samozøejmì ne.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Jsi s farmáøema, nebo oldákama?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jsi s farmáøema, nebo oldákama?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ty si ze mì utahuješ, e jo?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Byl jsem jenom zvìdavı.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//U jsi nìkdy vidìl farmáøe kovat zbranì?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Tak proè mi dáváš tak hloupé otázky?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "Chci se pøidat k oldnéøùm!";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chci se pøidat k oldnéøùm!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Pøestaò vanit, bì za Torlofem a nech ho, a ti dá test.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Prošel jsem zkouškou.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dobøe, tak to pro tebe budu hlasovat.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "Mùeš mì nauèit, jak ukovat meè?";
};


func int dia_bennet_wannasmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Mùeš mì nauèit, jak ukovat meè?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasnì.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//To tì bude nìco stát. Øeknìme 30 zlatıch.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Moná pozdìji.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Dobøe. Tady máš 30 zlatek.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Dobøe. Tady máš 30 zlatek.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//A to byla taky zatracenì dobrá cena! Mùeme zaèít jakmile budeš pøipraven.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Bennet nauèí kováøskému umìní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Pøestaò se chovat jako naivka. Øíkám 30 a ani o minci míò.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Moná pozdìji.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nauèit se kováøství",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON));
};


func int dia_bennet_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Nauè mne ukovat meè!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Je to celkem jednoduché: Vezmi kus surového eleza a dr ho v ohni do doby, ne se nerozhaví.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Pak ho polo na kovadlinu a roztepej èepel do potøebného tvaru.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Hlavnì musíš dávat pozor, aby èepel pøíliš nevychladla. Na opracování zbranì máš vdycky jenom pár minut èasu.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Na zbytek pøijdeš sám - je to jenom otázka praxe.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Nauè mne kovat zbranì z magické rudy!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Nauè mne kovat zbranì z magické rudy!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty neznáš vùbec ani základy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Nejdøíve se musíš nauèit ukovat obyèejnı meè. Pak uvidíme.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Protoe nejsi jedním z nás, tak bych byl v háji, kdybych ti vyzradil tajemství zbraní z magické rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Pouze velmi málo kováren tohle všechno umí, a já vìøím, e to nedokáí dokonce ani kováøi ve mìstì.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//A to je taky dobøe. Jinak by všichni ty mìstskı ochlastové ve strái nosili magické meèe.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nic proti tobì. (køení se) Vypadáš bıt v pohodì.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Kdybych mìl magickou rudu, dokonce i já bych to tak udìlal.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ale, no táák - jsem s oldákama, a umím kovat - co jiného chceš?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Mùeš mi tedy potom øíct, jak mám ukovat zbraò z magické rudy bez pouití magické rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Noooo...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//To jsem si myslel. Potøebuju nejménì 5 hroudek této rudy - nebo na to rovnou zapomeò.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Skvìle, pøinesl jsi mi rudu a také víš, jak ukovat normální meè.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//No, tak tedy povídej.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Nejdùleitìjší vìc je: Nezáleí na tom, zdali je tvá celá zbraò vyrobená z magické rudy, nebo jestli máš pokrytou jen obyèejnou ocelovou èepel vrstvou rudy. Povrch je to, na èem záleí.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A protoe je ten mizernej materiál tak drahej, popadni ocelovej prut a pouij pár hrud rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Pøirozenì z toho nevznikne nic jinıho, ne e to jenom pokryje hotovı meè magickou rudou. Budeš muset ukovat ten meè od zaèátku.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//Všechno ostatní závisí na zbrani, kterou chceš vyrobit.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "Kde mùu najít magickou rudu?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Kde mùu najít magickou rudu?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//No, kdybych tohle jenom vìdìl. Nìjaká urèitì bude v tìaøské kolonii.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale moná budeš mít štìstí a najdeš tady v okolí pár zbytkù.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Myslím, e v horách jinì odsud jsou nìjaké doly. Moná, e bys tam mìl vìtší štìstí.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Ale dávej bacha, slyšel jsem, e se to tam hemí banditama.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Tady máš tìch pìt kouskù rudy.";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Tady máš tìch pìt kouskù rudy.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(smìje se) Uka!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Skuteènì! Tohle mì fakt srazilo k zemi!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Dvì si nech. Budeš je potøebovat, abys mohl ukovat svojí vlastní zbraò.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Ne, ještì ne. Vra se pozdìji.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "Chci vìdìt víc o kutí zbraní z magické rudy.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chci vìdìt víc o kutí zbraní z magické rudy.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mohu tì nauèit, jak kovat meèe z magické rudy nebo dokonce obouruèní zbranì.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Zdokonalil jsem svojí techniku. Nyní tì mohu nauèit, jak vytvoøit s pomocí rudy tìké meèe nebo tìké obouruèní meèe.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Myslím, e jsem se tentokrát pøekonal. Vytvoøil jsem dvì bojové èepele. To je ta nejlepší vìc, jakou jsem doteï vidìl.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Poslyš. Myslím, e jsem právì dostal dokonalı nápad. Zbranì z magické rudy, potøísnìné draèí krví. A já pøesnì vím, jak na to pùjdu!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(zubí se) Chceš to vìdìt?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jakı druh zbranì bys chtìl vyrobit?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_04)),dia_bennet_teachsmith_1hspecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_04)),dia_bennet_teachsmith_2hspecial4);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_teachsmith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_teachsmith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_teachsmith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_teachsmith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_teachsmith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_teachsmith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "Za co ses dostal do lochu?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Za co ses dostal do lochu?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Ty svinì mì hodily do tıhle díry. Prı jsem zavradil paladina.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale já jsem to neudìlal, oni se to jenom pokouší na mì hodit.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Proè by to dìlali?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Jak to mám vìdìt? Mìl bys mne odtud dostat.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Promluv s lordem Hagenem, probourej zeï, je to jedno - prostì nìco udìlej!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet je v pìkné bryndì a teï by udìlal cokoliv, jen aby se dostal z basy.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//Šel jsem do centra s Hodgesem nakoupit nìjakı zásoby pro naše chlapce.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Najednou jsme uslyšeli hlasitı vıkøik a zvuk, jako by nìkdo bìel.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Jdi pøímo k vìci.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//Vìdìli jsme najednou, e se nìco stalo a e nás chytí, kdy nás tam nìkdo uvidí.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//Bìeli jsme jak o ivot. Potom, tìsnì pøedtím, ne jsme dobìhli k mìstské bránì, jsem zakopnul a vyvrknul jsem si kotník.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//Zbytek je u jednoduchej. Najednou u mne byla domobrana a ta mì uvrhla rovnou do tıhle díry.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "Kdo byl zavradìn?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Kdo byl zavradìn?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nemám ponìtí - jeden z paladinù, vùbec je neznám.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Nìjakı Lothar, myslím. No, nevím, opravdu si nejsem jistej.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Radši by ses mìl zeptat lorda Hagena, on zná všechny detaily.
	b_logentry(TOPIC_RESCUEBENNET,"Lothar, jeden z paladinù, byl zavradìn. Bliší informaci by mi mohl podat Lord Hagen, kterı vede celé vyšetøování.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "Mají proti tobì nìjakı dùkaz?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Mají proti tobì nìjakı dùkaz?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Øíkají, e mají nìjakého svìdka, kterı mne poznal.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Nevíš náhodou, kdo je ten svìdek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Ne. Všechno, co vím, je, e je to lháø.
	b_logentry(TOPIC_RESCUEBENNET,"Jeden svìdek tvrdí, e Benneta vidìl. Musím ho najít a zjistit, jak to bylo doopravdy.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Kdo vede vyšetøování?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kdo vede vyšetøování?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Sám lord Hagen. A protoe obìtí byl jeden z paladinù, spadá tenhle pøípad pod váleènı soud.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znamená?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//To je jednoduchı uhodnout. Pokud se odtud nedostanu, bez okolkù mì povìsí.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Musíš mi pomoct, nebo tady bude válka. Lee to nenechá bıt jen tak.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Mùeš si dát dohromady sám, co to znamená.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Chlape, u jsem si myslel, e mì vánì povìsí!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No, nakonec to dobøe dopadlo.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//To mi povídej. Mìl jsi vidìt ksicht toho vojáka, kdy mì musel pustit ven!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(smìje se) Byl tak vystrašenej, e si skoro nadìlal do kalhot.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Co mi pøipomíná, e pro tebe nìco mám.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Co myslíš?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(køení se) Dáreèek.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "Jakı dáreèek?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Jakı dáreèek?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Slyšeli jsme o dracích, kteøí by mìli prı bejt v údolí.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Oni tam skuteènì jsou!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Dobøe, já ti vìøím.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//V kadém pøípadì se pár chlapcù rozhodlo jít do údolí.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(zubí se) Mají v plánu to tam trochu uklidit.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to má co dìlat se mnou?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(pyšnì) Vytvoøil jsem novı typ brnìní. Brnìní drakobijcù!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Je robustnìjší a lehèí ne normální brnìní.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A protoe jsi mì zachránil, chci, abys dostal první kus. Je to dar!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Myslel jsem, e by se ti to mohlo hodit. Budeš potøebovat to správné vybavení, ne pùjdeš tam dolù do údolí.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Také mì zajímají draèí šupiny. Opravdové draèí šupiny. Slušnì ti za nì zaplatím.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Kolik dostanu za jednu šupinu?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Kromì toho jsem si myslel, e by sis asi nechtìl nechat ten draèí hon ujít.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//A?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Tady, vezmi si tenhle amulet. Myslím, e ho budeš potøebovat víc ne já.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "Mám pro tebe pár draèích šupin.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Mám pro tebe pár draèích šupin.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Opravdové draèí šupiny!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Tady je tvé zlato!
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Dobøe, to by staèilo. Mohl bych ti prodat nové, vylepšené brnìní, pokud bys mìl zájem.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "Støednì tìká drakobijecká zbroj. Ochrana: zbranì 120, šípy 120. (12000 zlaákù).";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chci si koupit nové brnìní.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Velmi dobøe. Bude se ti to líbit.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Za tu cenu by opravdu mìlo.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Zjistíš, e to brnìní stojí za kadej ten zlaák.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Nemáš dost zlata.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "Vím, jak brnìní ještì víc vylepšit.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Vím, jak brnìní ještì víc vylepšit.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(usmívá se) Tak mi to øekni.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mohl bys pokrıt draèí šupiny magickou rudou.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(smìje se) Tohle mì u taky napadlo. A máš pravdu.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Mé nejnovìjší brnìní pøedèí všechno, co jsi doposud vidìl. Je teï lehké a masivní.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Je PERFEKTNÍ.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Mùeš ho koupit, jestli chceš. Nedávám tuhle nabídku jen tak nìkomu a navíc cena zahrnuje pouze vırobní náklady.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "Tìká drakobijecká zbroj. Ochrana: zbranì 150, šípy 150. (20000 zlaákù).";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Dej mi to brnìní.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Tohle je nejlepší brnìní, jaké jsem kdy vyrobil.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Opravdovı skvost.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Nemáš dost zlata.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Záleí na tom, jaké. Nejdøív mi uka, co máš na mysli.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Taky se odsud musím nejdøív dostat.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Pøedtím ti tu vìc zøejmì neopravím.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "Mùeš se podívat na tenhle amulet?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Mùeš se podívat na tenhle amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasnì, uka mi ho.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, to je skuteènì nádherná práce. Oprava bude záhul. Ale myslím si, e jsem schopnej to opravit.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Jak dlouho ti to potrvá?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//No, teï jsem se zaseknul tady. Nebo tu snad vidíš nìkde dílnu?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Kdybych byl ve své kovárnì, byl bych schopnej to všechno udìlat za jeden den. Ale samozøejmì se musím nejdøív dostat ven.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Pokud mi ho tu necháš, bude hotovej do doby, ne se sem zítra vrátíš.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//A dokonce ti to ani nebudu úètovat. Vdy jsi mì dostal ven z lochu.
	};
	b_logentry(TOPIC_INNOSEYE,"Bennet je ten pravı kováø, kterı mi opraví ten amulet.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Tady je ten amulet, oprav mi ho, prosím.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Tady je ten amulet, oprav mi ho, prosím.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Dobøe. Budu to mít opravené do zítøka.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Mùeš potom ke mnì pøijít a dostat ho.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "Je amulet hotovı?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Je amulet hotovı?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Ano, tady.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musel jsem tam zasadit novı kámen.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracoval jsem na nìm celou noc a teï vypadá jako novı.
		b_logentry(TOPIC_INNOSEYE,"Amulet je opìt celı, Bennet odvedl skvìlou práci.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Pokud mì budeš zdrovat, bude to trvat déle.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "Je nìco, co mùeš udìlat s draèími vejci?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Je nìco, co mùeš udìlat s draèími vejci?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Draèími vejci? Jak jsi k nim krucinál pøišel?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Vzal jsem je ještìranùm.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Uka mi ho.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Mmh. Velmi šikovnı materiál. Ideální k dokonèení brnìní. Teda pokud se mi je podaøí rozlousknout.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Take co bude? Chceš je?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasnì! Dej je sem.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Jak dlouho tu budeš s tou vìcí mávat? Chceš, abych to koupil, nebo ne?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zaplatím ti, hmm, øeknìme, 300 zlatıch za kadé draèí vejce, které mi pøineseš.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Tak si nech svoje zlato. Myslím, e si to nechám.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"Toto jsou draèí vejce, ne bezcenná slepièí vejce.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"Dohodnuto.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Bennet je ochoten mi dobøe zaplatit za všechna draèí vejce, která naleznu.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dobøe.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Tak tyhle vìcièky nos dál, pokud je budeš schopen dostat.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Ehm. Øíkáš, e jsi je vzal ještìranùm?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Správnì.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z toho, co jsem slyšel, tak vìtšina ještìranù bydlí v jeskyních.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nepøekvapilo by mì, kdybys našel víc tìchhle vìcí v jeskyních tady v okolí.
	b_logentry(TOPIC_DRACHENEIER,"Bennet si myslí, e bych se po vejcích mìl podívat v khorinisskıch jeskyních, kde by mìli ještìrani pøebıvat.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Tady. Vem si tuhle mapu. Ta ti pomùe najít ty jeskynì.
	CreateInvItems(self,itwr_map_caves_mis,1);
	b_giveinvitems(self,other,itwr_map_caves_mis,1);
	b_logentry(TOPIC_DRACHENEIER,"Dal mi mapu jeskyní, která by mi mìla pomoci.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Nejdøív ale musíš získat mapu jeskyní od zemìpisce ve mìstì. Byla by to škoda, kdybys je nemohl najít všechny.
		b_logentry(TOPIC_DRACHENEIER,"Mìl bych si u místního kartografa obstarat mapu jeskyní, aby mi ádné vejce neuniklo.");
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Tohle jsou draèí vejce, ne bezcenná slepièí vajíèka.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(podrádìnì) Dobøe. Tak 350. Ale víc ti za nì u dát nemùu - pak by se mi to nevyplatilo.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Tak si nech svoje zlato. Myslím, e si to nechám.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Dej mi vìdìt, a si to rozmyslíš.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "Zajímají tì ještì další draèí vejce?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Zajímají tì ještì další draèí vejce?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Jistì!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Tady. Mám další.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Mám tady ještì nìjakı.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Skvìle. Dej to sem. Díval ses po nich všude? Jistì musí nìkde bıt ještì nìjaké.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Kdy tyhle vìcièky vùbec poøád nacházíš? Vsadím se, e u jich tady moc nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Nemyslím si, e teï nìjaké další najdeš. A já u jich mám tolik, e ani nevím, co s nimi budu dìlat.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Jo, správnì. Tady máš peníze.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "Potøebuju se dostat na ostrov. Kováø by se mi mohl hodit.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Potøebuju se dostat na ostrov. Kováø by se mi mohl hodit.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//A to si myslel jako mne?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Jo. Co na to øíkáš? V kadém pøípadì by tì to dostalo odtud pryè.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Je to lepší ne Onarova farma. Chlapèe, dokonce i peklo nemùe bıt tak špatné. Poèítej se mnou.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Bennet by mohl odejít klidnì hned teï. Jeho kováøskému umìní se hned tak nìkdo nevyrovná a já se od nìj mohu lecos pøiuèit.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Má posádka je v tuto chvíli ji kompletní.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Pak tedy jednoho z nich pošli zase pryè.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Dám ti vèas vìdìt a tì budu potøebovat.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Tak buï tedy mım kováøem. Sejdeme se v pøístavu!",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Tak tedy buï mım kováøem. Uvidíme se v pøístavu.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Dobøe. Uvidíme se pozdìji.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Dám ti vèas vìdìt, a tì budu potøebovat.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Fajn. Budu tady.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "Budu si muset najít jiného kováøe.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Budu si muset najít jiného kováøe.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Jednou je to takhle a za chvíli zase jinak. Dej si to v hlavì dohromady, jo? A a budeš vìdìt, co vlastnì chceš, dej mi potom vìdìt.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "Pojï zpátky. Nemùu najít jinıho kováøe.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Pojï zpátky. Nemùu najít jinıho kováøe.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(naštvanì) Správnì! Jsem tu jenom já, tak nikoho nehledej. Uvidíme se pozdìji v docích.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
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


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

