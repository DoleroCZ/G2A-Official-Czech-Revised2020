
instance DIA_ROSI_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_exit_condition;
	information = dia_rosi_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_rosi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_HALLO(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_hallo_condition;
	information = dia_rosi_hallo_info;
	description = "Jsi v poøádku?";
};


func int dia_rosi_hallo_condition()
{
	return TRUE;
};

func void dia_rosi_hallo_info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//Jsi v poøádku?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Dobrá, je to tak, tak. Bolí mì záda ze vší té tvrdé døiny. Co tady dìláš? Návštìvníky tu nemáme pøíliš èasto.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Když už, tak ty hrdloøezy z hor nebo vojáky z mìstské domobrany.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Poslední dobou rabujou naší farmu èím dál tím èastìji. Ale ty nevypadáš jako jeden z nich, nebo se pletu?
	};
};


instance DIA_ROSI_WASMACHSTDU(C_INFO)
{
	npc = bau_936_rosi;
	nr = 4;
	condition = dia_rosi_wasmachstdu_condition;
	information = dia_rosi_wasmachstdu_info;
	description = "Co tady dìláš?";
};


func int dia_rosi_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_rosi_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//Co tady dìláš?
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//Tak to se ptám sama sebe už nìkolik let. Sekob, mùj manžel, už se tady pohádal snad s každým.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//Všude má dluhy. Proto krade zboží z Onarových zásob a prodává je ve mìstì.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Ale teï už z té své podfukaøiny má celé jmìní.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//A døe naše dìlníky, dokud jim neznièí záda. Jeho vlastní lidé mu už neøeknou jinak než otrokáø.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Nejsem vùbec pyšná na to, že se mùžu nazývat Sekobovou ženou, to mi vìø. Obèas si pøeju, aby bariéra zùstala stále na svém místì.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Nemáš zájem o nìco k jídlu nebo nìco, co by se ti hodilo pro lov v lesích?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,"Rosi handelt mit verschiedenen Waren, auf dem Hof von Sekob.");
};


instance DIA_ROSI_WAREZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 2;
	condition = dia_rosi_warez_condition;
	information = dia_rosi_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mi mùžeš nabídnout?";
};


func int dia_rosi_warez_condition()
{
	if((Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)) || Npc_IsDead(sekob)) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_rosi_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Co mi mùžeš nabídnout?
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//Co chceš?
};


instance DIA_ROSI_BARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 6;
	condition = dia_rosi_barriere_condition;
	information = dia_rosi_barriere_info;
	description = "Bariéra?";
};


func int dia_rosi_barriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_barriere_info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Bariéra?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//Jo, kopule, která uzavírala Hornické údolí.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Svrhli tam spoustu lidí, co se dopustili nìjaké nezákonné èinnosti. A nìkteøí z nich už se nikdy nevrátili zpìt.
};


instance DIA_ROSI_DUINBARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 10;
	condition = dia_rosi_duinbarriere_condition;
	information = dia_rosi_duinbarriere_info;
	description = "Byla jsi nìkdy za bariérou?";
};


func int dia_rosi_duinbarriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_barriere))
	{
		return TRUE;
	};
};

func void dia_rosi_duinbarriere_info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Byla jsi nìkdy za bariérou?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Ne. Jen jsme o ní slyšeli. Bengar, farmáø z náhorních pastvin, ti o tom urèitì poví víc.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Jeho farma není pøíliš daleko od Hornického údolí.
};


instance DIA_ROSI_BENGAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 11;
	condition = dia_rosi_bengar_condition;
	information = dia_rosi_bengar_info;
	description = "Jak se dostanu na Bengarovu farmu?";
};


func int dia_rosi_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_duinbarriere) && (Npc_IsDead(balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_bengar_info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//Jak se dostanu na Bengarovu farmu?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Bìž se zeptat Balthazara. To je náš ovèák. Obèas svoje zvíøata vodí na pastvu nahoru na Bengarovy pozemky.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//Mìl by být schopen ti øíct, jak se tam dostat.
};


instance DIA_ROSI_MILIZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 7;
	condition = dia_rosi_miliz_condition;
	information = dia_rosi_miliz_info;
	description = "Proè vás domobrana na farmì napadá? ";
};


func int dia_rosi_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_rosi_miliz_info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//Proè vás domobrana na farmì napadá?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Protože tu není nikdo, kdo by zabránil tomu, že se zboží místo nakoupení jednoduše ukradne.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Král je daleko a nám nezbývá než døít pro Onara a doufat, že Onar pošle pomoc, když to bude opravdu zapotøebí.
};


instance DIA_ROSI_ONAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 8;
	condition = dia_rosi_onar_condition;
	information = dia_rosi_onar_info;
	description = "V èem ta Onarova pomoc spoèívá?";
};


func int dia_rosi_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_miliz))
	{
		return TRUE;
	};
};

func void dia_rosi_onar_info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//V èem ta Onarova pomoc spoèívá?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Obèas se k nám dostane varování, že se k nám chystá pár vojákù z domobrany, aby se nás pokusili okrást na vlastní pìst.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Pak pošleme k velkostatkáøi nìkoho pro pomoc.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//A pak to obvykle netrvá dlouho, než se sem žoldáci dostanou a vypoøádají se s domobranou.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Ale když je po všem, nechovají se žoldáci o nic líp.
};


instance DIA_ROSI_PERMKAP1(C_INFO)
{
	npc = bau_936_rosi;
	nr = 80;
	condition = dia_rosi_permkap1_condition;
	information = dia_rosi_permkap1_info;
	permanent = TRUE;
	description = "No tak, trochu kuráže.";
};


func int dia_rosi_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)))
	{
		return TRUE;
	};
};

func void dia_rosi_permkap1_info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//No tak, trochu kuráže.
	if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//Bìž si skoèit do jezera.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//Dávej na sebe pozor a nedej se.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP3_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap3_exit_condition;
	information = dia_rosi_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_rosi_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP4_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap4_exit_condition;
	information = dia_rosi_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_rosi_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP5_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap5_exit_condition;
	information = dia_rosi_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_rosi_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_FLEEFROMSEKOB(C_INFO)
{
	npc = bau_936_rosi;
	nr = 50;
	condition = dia_rosi_fleefromsekob_condition;
	information = dia_rosi_fleefromsekob_info;
	description = "Co dìláš tady v divoèinì?";
};


func int dia_rosi_fleefromsekob_condition()
{
	if((KAPITEL == 5) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_fleefromsekob_info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Co dìláš tady v divoèinì?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Na Sekobovì farmì už se to nedalo vydržet. Sekob dostával jeden hysterický záchvat za druhým.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//Nakonec už se s ním nedalo vùbec mluvit. Nakonec na všechny akorát øval.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Musela jsem se odtamtud dostat, ale nevím, kam se vrtnout.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Nemáš zájem o menší dohodu?
	b_giveplayerxp(XP_AMBIENT);
	ROSIFOUNDKAP5 = TRUE;
};


instance DIA_ROSI_HILFE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 51;
	condition = dia_rosi_hilfe_condition;
	information = dia_rosi_hilfe_info;
	description = "Vezmu tì odsud pryè.";
};


func int dia_rosi_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_fleefromsekob) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_hilfe_info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Vezmu tì odsud pryè.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//Mohl bych tì vzít do mìsta.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Vezmu tì na farmu velkostatkáøe.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//Tak odejdi do kláštera. Budeš tam vítána.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//Nikdy ti nezapomenu, cos pro mì udìlal. Samozøejmì ti zaplatím.
	if(Npc_IsDead(till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//Bìž první, budu tì následovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Bìž první, budeme tì následovat.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		b_startotherroutine(till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		b_startotherroutine(till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		b_startotherroutine(till,"FollowKloster");
	};
	Log_CreateTopic(TOPIC_ROSISFLUCHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ROSISFLUCHT,LOG_RUNNING);
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi už to nemohla na Sekobovì statku déle vydržet a teï neví, kam jít. Vyvedu ji ven z divoèiny.");
	MIS_ROSISFLUCHT = LOG_RUNNING;
};


instance DIA_ROSI_ANGEKOMMEN(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_angekommen_condition;
	information = dia_rosi_angekommen_info;
	important = TRUE;
};


func int dia_rosi_angekommen_condition()
{
	if((KAPITEL == 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && (hero.guild == GIL_PAL)) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG)) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void dia_rosi_angekommen_info()
{
	var int xpforboth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Cestu už najdu sama.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Díky. Nevím, co bych si bez tebe poèala.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_BRINGROSIBACKTOSEKOB = LOG_OBSOLETE;
	MIS_ROSISFLUCHT = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Prosím, vezmi si tenhle skromný dárek jako vyjádøení mých díkù.
	CreateInvItems(rosi,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,450);
	if(Npc_IsDead(till))
	{
		b_giveplayerxp(XP_SAVEDROSI);
	}
	else
	{
		xpforboth = XP_SAVEDROSI + XP_AMBIENT;
		b_giveplayerxp(xpforboth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		b_startotherroutine(till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"BIGFARM") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		b_startotherroutine(till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		b_startotherroutine(till,"KLOSTER");
	};
};


instance DIA_ROSI_TRAIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_trait_condition;
	information = dia_rosi_trait_info;
	description = "Tak zase doma, co?";
};


func int dia_rosi_trait_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_trait_info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Tak zase doma, co?
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ty jsi ten nejhnusnìjší kýbl hnoje, co jsem kdy ve svým životì potkala, ty mizerná svinì.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_ROSISFLUCHT = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_MINENANTEIL(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_minenanteil_condition;
	information = dia_rosi_minenanteil_info;
	description = "Prodávat nelegální dùlní akcie - nestydíš se??";
};


func int dia_rosi_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rosi_minenanteil_info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//Prodávat nelegální dùlní akcie - nestydíš se?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Ne. Z nìèeho žít musím. A taky nejsem jediný, kdo je pustil do obìhu.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_KAP6_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap6_exit_condition;
	information = dia_rosi_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_rosi_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_PICKPOCKET(C_INFO)
{
	npc = bau_936_rosi;
	nr = 900;
	condition = dia_rosi_pickpocket_condition;
	information = dia_rosi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rosi_pickpocket_condition()
{
	return c_beklauen(30,75);
};

func void dia_rosi_pickpocket_info()
{
	Info_ClearChoices(dia_rosi_pickpocket);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_BACK,dia_rosi_pickpocket_back);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_PICKPOCKET,dia_rosi_pickpocket_doit);
};

func void dia_rosi_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rosi_pickpocket);
};

func void dia_rosi_pickpocket_back()
{
	Info_ClearChoices(dia_rosi_pickpocket);
};

