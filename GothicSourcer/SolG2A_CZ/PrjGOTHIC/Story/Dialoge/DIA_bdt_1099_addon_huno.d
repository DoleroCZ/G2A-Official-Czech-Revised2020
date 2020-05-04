
instance DIA_ADDON_HUNO_EXIT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 999;
	condition = dia_addon_huno_exit_condition;
	information = dia_addon_huno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_huno_exit_condition()
{
	return TRUE;
};

func void dia_addon_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 900;
	condition = dia_addon_huno_pickpocket_condition;
	information = dia_addon_huno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_huno_pickpocket_condition()
{
	return c_beklauen(85,102);
};

func void dia_addon_huno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_BACK,dia_addon_huno_pickpocket_back);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_PICKPOCKET,dia_addon_huno_pickpocket_doit);
};

func void dia_addon_huno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_huno_pickpocket);
};

func void dia_addon_huno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
};


instance DIA_ADDON_HUNO_ABWIMMELN(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_abwimmeln_condition;
	information = dia_addon_huno_abwimmeln_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_huno_abwimmeln_condition()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		return TRUE;
	};
	if((HUNO_ZUSNAF == TRUE) && !Npc_KnowsInfo(other,dia_addon_fisk_meeting) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_huno_abwimmeln_info()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Co poøád chceš? Táhni!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co èekáš? Jdi do hospody!
	};
	AI_StopProcessInfos(self);
};


var int knows_flucht;
var int huno_angepisst;

instance DIA_ADDON_HUNO_HI(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_hi_condition;
	information = dia_addon_huno_hi_info;
	permanent = FALSE;
	description = "Na první pohled je jasné, že víš co dìláš.";
};


func int dia_addon_huno_hi_condition()
{
	return TRUE;
};

func void dia_addon_huno_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Na první pohled je jasné, že víš co dìáš.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Jednou jsem to už slyšel ... pøinesl jsi tu ocel?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Ocel? Ne, myslím, že si mì s nìkým pleteš ...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hm ... pøipadáš mi známý. Nepotkali jsme se už?
	Info_ClearChoices(dia_addon_huno_hi);
	Info_AddChoice(dia_addon_huno_hi,"Jasnì, ve Starém táboøe.",dia_addon_huno_hi_ja);
	Info_AddChoice(dia_addon_huno_hi,"Nepamatuji se.",dia_addon_huno_hi_no);
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Huno prodává kováøské vybavení.");
};

func void dia_addon_huno_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Jasnì, ve Starém táboøe.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//Starý tábor ... aha ... ty jsi ten zvìdavý chlápek ... myslel jsem, že jsi mrtvý.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//No jo, to si myslí všichni. Kdo ještì pøežil?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//Pár lidí. Nìkteøí prchli s Ravenem jako já. Hodnì chlapù však zahynulo v táboøe.
	Info_ClearChoices(dia_addon_huno_hi);
	KNOWS_FLUCHT = TRUE;
};

func void dia_addon_huno_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nepamatuji se.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hm ... mám hlavu jak støep ... k èertu s tím ...
	Info_ClearChoices(dia_addon_huno_hi);
};


instance DIA_ADDON_HUNO_BLITZ(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 2;
	condition = dia_addon_huno_blitz_condition;
	information = dia_addon_huno_blitz_info;
	permanent = FALSE;
	description = "Øekni mi o tvém útìku.";
};


func int dia_addon_huno_blitz_condition()
{
	if((KNOWS_FLUCHT == TRUE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_blitz_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Øekni mi o tvém útìku.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//V den, kdy padla bariéra, nastal obrovský zmatek.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Nìkteøí se schovali - jiní utekli a všechno bylo vyplenìno.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co jsi udìlal?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Zkusil jsem utéct z tábora, jenomže se náhle vyjasnilo a mou kùží projela žhavá bolest.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//trefil mì ten zatracený blesk! Ale vypadá to, že jsem neohluchl ...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//Až pozdìji mi øekli, že mì Thorus našel a vzal s sebou.
};


var int huno_armorperm;

instance DIA_ADDON_HUNO_ARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_armor_condition;
	information = dia_addon_huno_armor_info;
	permanent = TRUE;
	description = "Potøebuju lepší zbroj.";
};


func int dia_addon_huno_armor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_hi) && (HUNO_ARMORPERM == FALSE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_armor_info()
{
	Info_ClearChoices(dia_addon_huno_armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Potøebuju lepší zbroj.
	if(HUNO_ARMORCHEAP == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Takže - mùžeš ho mít. To, že je tak drahé, je Estebanovo naøízení.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten zmetek si bere podíl z každé zbroje, co prodám.
		BDT_ARMOR_H_VALUE = 2100;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Koupit tìžkou zbroj bandity (Ochrana proti zbraním: 50, šípùm: 50, cena: 2100)",dia_addon_huno_armor_buy);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk mi øekl, že bys pro mì mohl udìlat speciální cenu.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Tak Fisk? Hm, fajn. Stejnì mu dlužím laskavost.
		BDT_ARMOR_H_VALUE = 1400;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Koupit tìžkou zbroj bandity (Ochrana proti zbraním: 45, šípùm: 45, cena: 1400)",dia_addon_huno_armor_buy);
	};
};

func void dia_addon_huno_armor_back()
{
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Ok, vezmu si tu zbroj.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_H_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Vypadá dobøe.
		b_giveinvitems(self,other,itar_bdt_h,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nemáš peníze, nebude zbroj.
	};
	if(BDT_ARMOR_H_VALUE < 2100)
	{
		HUNO_ARMORPERM = TRUE;
	};
	Info_ClearChoices(dia_addon_huno_armor);
};


instance DIA_ADDON_HUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_attentat_condition;
	information = dia_addon_huno_attentat_info;
	permanent = FALSE;
	description = "O tom pokusu zavraždit Estebana ...";
};


func int dia_addon_huno_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_huno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(výhružnì) Co ode mì chceš?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Hledám zamìstnavatele ...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//A proè s tím lezeš za mnou?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Myslel jsem, že o tom nìco víš.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Kašlu ti na to!
};


var int huno_nochmal;
var int huno_somethings_perm;
var int huno_counter;

func void b_addon_huno_stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(vzdychá) Teï poslouchej! A už tì tu nevidím nebo se neznám!
	HUNO_ANGEPISST = TRUE;
};


instance DIA_ADDON_HUNO_SOMETHINGS(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_somethings_condition;
	information = dia_addon_huno_somethings_info;
	permanent = TRUE;
	description = "Slyšel jsem o tobì nìjaké zvìsti ...";
};


func int dia_addon_huno_somethings_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_attentat) && (HUNO_SOMETHINGS_PERM == FALSE) && ((FINN_TELLALL == TRUE) || (PAUL_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_huno_somethings_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//Slyšel jsem o tobì nìjaké zvìsti ...
	if(HUNO_NOCHMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//No?
		HUNO_NOCHMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Zase ty? (hrozí) Doufám, že tentokrát je to nìco dùležitého ...
	};
	HUNO_COUNTER = 0;
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Slyšel jsem, že v dobì toho pokusu o vraždu jsi nebyl tam kde bys mìl ...
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(výhružnì) Pokraèuj?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(PAUL_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul øíkal, že Estebana nenávidíš.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(výhružnì) Jo? Opravdu? A co ještì øíkal?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(EMILIO_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio tì prozradil! Tutovì o té vraždì nìco víš!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(klidnì) Tak ti jsi mluvil se starým Emiliem, jo??
		if(HUNO_COUNTER > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//A on není jediný, kdo tì podežrívá.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//No a?
			HUNO_SOMETHINGS_PERM = TRUE;
			Info_ClearChoices(dia_addon_huno_somethings);
			Info_AddChoice(dia_addon_huno_somethings,"Potøebuji si nìco vyjasnit se zamìstnavatelem!",dia_addon_huno_somethings_contra);
			Info_AddChoice(dia_addon_huno_somethings,"Jestli jsi za tou vraždou, zaplatíš za to!",dia_addon_huno_somethings_pro);
			b_logentry(TOPIC_ADDON_ESTEBAN,"Vypadá to, že mám Huna v hrsti.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(vyhrožuje) Možná by si si s ním mìl promluvit ještì jednou. Jsem si jistý, že POZDÌJI bude tvrdit pøesnì opak!
			b_addon_huno_stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic dalšího ...
		b_addon_huno_stress();
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_huno_somethings_pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Jestli jsi za tou vraždou, zaplatíš za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(dochází mu trpìlivost) Jsi idiot! Opravdu si myslíš, že se tím Estebanovi zavdìèíš?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Táhni!
	HUNO_MEGA_ANGEPISST = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Potøebuji si nìco vyjasnit se zamìstnavatelem!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//S Estebanem? Fakt? Posluž si!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//Už na tu dodávku oceli od pirátù èekám pøíliš dlouho.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Tipnul bych, že Esteban ji zabavil, aby mi ji pak mohl prodat dráž.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Nedìlá to osobnì. Má na to pár prašivých banditù, kteøí jsou na jeho výplatní pásce.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Kde jsi to slyšel?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Opilí banditi moc mluví ...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Znáš jméno toho sdílného bandity?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//To nestojí za pozornost. Ale ten chlápek, kterého hledáš, je Juan. Ale už jsem ho v táboøe dlouho nevidìl.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Budeš ho muset najít nìkde v té žumpì venku.
	MIS_HUNO_STAHL = LOG_RUNNING;
	HUNO_ANGEPISST = FALSE;
	Log_CreateTopic(TOPIC_ADDON_HUNO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HUNO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HUNO,"Huno èeká na dodávku oceli od pirátù. Myslí si, že nìjaký chlápek Juan ji zastavil na Estebanùv pøíkaz a schovává se nìkde v bažinách.");
	Info_ClearChoices(dia_addon_huno_somethings);
	Info_AddChoice(dia_addon_huno_somethings,"Nejprve mi øekni, kdo je ten, co tì zamìstnal!",dia_addon_huno_somethings_tellmenow);
	Info_AddChoice(dia_addon_huno_somethings,"Ok, udìlám to pro tebe!",dia_addon_huno_somethings_mission);
};

func void dia_addon_huno_somethings_mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Ok, udìlám to pro tebe!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dobøe. Uvidíme, jestli se ti dá vìøit.
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_tellmenow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Nejprve mi øekni, kdo je ten, co tì zamìstnal!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Ne. Nevìøím ti.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Dávej pozor. Další mùj rozhovor bude s tím zamìstnavatelem nebo s Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//S kým se bavíš je tvoje vìc.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(vzdychá) Tak dobøe! Zprostøedkuju ti s ním setkání. Ale bude po mém, rozumíš?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Jdi do hospody a promluv si s barmanem. On ti øekne, co dál.
	HUNO_ZUSNAF = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno mi øekl, že bych si mìl promluvit se Snafem.");
};


instance DIA_ADDON_HUNO_PAKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_paket_condition;
	information = dia_addon_huno_paket_info;
	permanent = FALSE;
	description = "Mám tu ocel.";
};


func int dia_addon_huno_paket_condition()
{
	if((MIS_HUNO_STAHL == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_steel_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_huno_paket_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//Mám tu ocel.
	b_giveinvitems(other,self,itmi_addon_steel_paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//A? Byl tam i Juan?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Byl.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//Vìdìl jsem to. Ta krysa Esteban v tom byl namoèený.
	if(HUNO_ZUSNAF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jsi fajn. Abych byl upøímný, tak jsem to od tebe neèekal.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Tady, vezmi si tuhle odmìnu.
		b_giveinvitems(self,other,itmi_gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//A co teï bude s naší dohodou?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Muž, se kterým chceš mluvit, tì èeká v hospodì. Promluv si s barmanem.
		HUNO_ZUSNAF = TRUE;
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno mi øekl, že bych si mìl promluvit se Snafem.");
	MIS_HUNO_STAHL = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HUNOSTAHL);
};


instance DIA_ADDON_HUNO_TRADE(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 888;
	condition = dia_addon_huno_trade_condition;
	information = dia_addon_huno_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_huno_trade_condition()
{
	if(HUNO_ANGEPISST == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_huno_trade_info()
{
	b_say(other,self,"$TRADE_3");
	b_givetradeinv(self);
};

