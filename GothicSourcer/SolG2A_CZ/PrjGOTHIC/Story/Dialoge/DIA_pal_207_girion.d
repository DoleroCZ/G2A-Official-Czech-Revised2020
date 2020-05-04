
instance DIA_GIRION_EXIT(C_INFO)
{
	npc = pal_207_girion;
	nr = 999;
	condition = dia_girion_exit_condition;
	information = dia_girion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_exit_condition()
{
	return TRUE;
};

func void dia_girion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_HALLO(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_hallo_condition;
	information = dia_girion_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_hallo_info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Jsem Girion, mistr boje s obouruèními zbranìmi a královský paladin. Proè mì rušíš?
};


instance DIA_GIRION_CANTEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_canteach_condition;
	information = dia_girion_canteach_info;
	permanent = TRUE;
	description = "Mùžeš mì uèit?";
};


func int dia_girion_canteach_condition()
{
	if(GIRION_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_canteach_info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Mùžeš mì uèit?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Dobøe èiníš, že se chceš zlepšit v nejvznešenìjším zpùsobu vedení boje. Tak se na Innosova váleèníka sluší a patøí.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Budu tì uèit. Pøijï ke mnì, až budeš pøipraven.
		GIRION_TEACH2H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Girion mì vycvièí v používání obouruèních zbraní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Pokud se chceš nìco nauèit, musíš se obrátit na uèitele odjinud než z našeho øádu.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Jsem váleèník, ne uèitel.
	};
};


instance DIA_GIRION_TEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 100;
	condition = dia_girion_teach_condition;
	information = dia_girion_teach_info;
	permanent = TRUE;
	description = "Jsem pøipraven k výcviku.";
};


var int dia_girion_teach_permanent;

func int dia_girion_teach_condition()
{
	if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void dia_girion_teach_info()
{
	GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Jsem pøipraven k výcviku.
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Tvá výuka samozøejmì neskonèila, ale já už ti nemùžu ukázat nic, co bys neznal.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Pokud chceš ještì zvýšit svùj talent se zbranìmi, budeš muset vyhledat skuteèného mistra meèe.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Kde bych takového èlovìka mohl najít?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen je mistr meèe. Urèitì tì nìco nauèí.
		DIA_GIRION_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_girion_teach);
};

func void dia_girion_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Bojuj èestnì. Boj je náš život - a co by byl život beze cti?
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//V boji buï obezøetný a rychlý. Pøekvap svého protivníka.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Nikdy nechoï do boje nepøipraven. Nikdy nevíš, jestli náhodou není poslední.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Paladin je vždy pøipraven na boj. Ale nikdy se nepouští do bitvy, kterou nemùže vyhrát.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Paladin nebojuje pouze meèem, ale také vlastní myslí.
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Vždycky musíš mít v pamìti místo, kam se mùžeš v pøípadì potøeby stáhnout.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Nezapomeò, že dobøe bojuješ v pøípadì, kdy svého protivníka ovládáš a nedáváš mu šanci, aby se ovládal sám.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Prohraješ pouze v pøípadì, když se vzdáš.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};


instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_catchplayerstolenship_condition;
	information = dia_girion_catchplayerstolenship_info;
	important = TRUE;
};


func int dia_girion_catchplayerstolenship_condition()
{
	if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void dia_girion_catchplayerstolenship_info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hej! Mùžeš mi laskavì øíct, co to tady dìláš?
	Info_ClearChoices(dia_girion_catchplayerstolenship);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Nevím, o èem to mluvíš.",dia_girion_catchplayerstolenship_no);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Jdi mi z cesty, nebo tì budu muset zabít.",dia_girion_catchplayerstolenship_weg);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Potøebuju tu loï. Tak si ji vezmu.",dia_girion_catchplayerstolenship_ship);
};

func void dia_girion_catchplayerstolenship_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Nevím, o èem to mluvíš.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Mluvím o tom, co jsi to provedl s lodní stráží. Smrdí mi to na sto honù.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//I když jsi mág, stejnì ti nevìøím.
	};
};


var int girion_wantstokillsc;

func void dia_girion_catchplayerstolenship_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Jdi mi z cesty, nebo tì budu muset zabít.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Možná jsi dokázal ošálit stráže, ale brzo zjistíš, že se mnou to budeš mít kapku tìžší, pøítelíèku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//I když jsi jeden z nás, neznamená to, že bys mìl právo krást královský majetek. Zemøi, zrádèe.
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	GIRION_WANTSTOKILLSC = TRUE;
};

func void b_girionstayonship()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Až s tím skonèíme, zase mi tu loï vrátíš, jasné?
};

func void dia_girion_catchplayerstolenship_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Potøebuju tu loï. Tak si ji vezmu.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//To nemùžeš. Transport rudy...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Jak se opovažuješ, ty smrdutý...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//Rudy v Hornickém údolí není dost na to, aby s ní byl král spokojený. Byl jsem tam. Už tam není nic, co by se mohlo hodit. Hagenova mise je fraška.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Skuteèná hrozba má své koøeny na ostrovì nedaleko odsud. Popluju tam a skoncuju s tím.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Buï se ke mnì pøipojíš, nebo se budu bez tebe muset obejít. Je to na tobì.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Hmm. Zdá se, že nemám na výbìr.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Správnì.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//No dobrá. Pøidám se k tobì, ale jenom pod jednou podmínkou.
	b_girionstayonship();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//To není nic, s èím bych nemohl žít.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//V tom pøípadì dìlej, co musíš. Poèkám tady na tebe.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	GIRION_ISONBOARD = LOG_SUCCESS;
};


instance DIA_GIRION_VERRAT(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_verrat_condition;
	information = dia_girion_verrat_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_verrat_condition()
{
	if(GIRION_WANTSTOKILLSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_girion_verrat_info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Zrádce!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GIRION_ONSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_onship_condition;
	information = dia_girion_onship_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_onship_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_girion_onship_info()
{
	b_girionstayonship();
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion;
	nr = 900;
	condition = dia_girion_pickpocket_condition;
	information = dia_girion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_pickpocket_condition()
{
	return c_beklauen(73,280);
};

func void dia_girion_pickpocket_info()
{
	Info_ClearChoices(dia_girion_pickpocket);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};

func void dia_girion_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_pickpocket);
};

func void dia_girion_pickpocket_back()
{
	Info_ClearChoices(dia_girion_pickpocket);
};

