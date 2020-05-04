
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "Co mi mùžeš øíct o hornících?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Co mi mùžeš øíct o hornících?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Vypravil jsem tøi skupiny.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Vedou je paladinové Marcos, Fajeth a Silvestro.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Marcosova skupina vyrazila smìrem ke starému dolu - vedl ji starý kopáè jménem Grimes.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Další dvì skupiny šly spoleènì.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Podle Jergana, jednoho z našich zvìdù, rozbili tábor poblíž velké vìže.
	b_logentry(TOPIC_SCOUTMINE,"Každý oddíl kopáèù vede jeden z paladinù - Marcos, Fajeth a Silvestro.");
	b_logentry(TOPIC_SCOUTMINE,"Marcosova skupina se vydala tam, kde kdysi býval starý dùl. Jejich vyzvìdaèem je Grimes.");
	b_logentry(TOPIC_SCOUTMINE,"Další dvì skupiny se spojily dohromady a usadily se poblíž velké vìže.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "K jaké skupinì se pøipojil Diego?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//K jaké skupinì se pøipojil Diego?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Ten trestanec - Diego? Šel se skupinou paladina Silvestra.
	b_logentry(TOPIC_SCOUTMINE,"Diego se pøipojil ke skupinì, kterou vede paladin Silvestro.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "Víš, jak se dostat k dolùm?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Víš, jak se dostat k dolùm?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Do toho údolí nevede žádná bezpeèná cesta. Ale zdá se mi rozumné nejít pøímým smìrem.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Snaž se vyhnout skøetùm a lesùm - a nech tì Innos ochraòuje.
	b_logentry(TOPIC_SCOUTMINE,"Bude moudøejší nejít nejkratší cestou, to by mohlo být nebezpeèné. Zvláš bych se mìl vyhýbat lesùm a skøetùm.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "Jak to vypadá?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Tábor obklíèili skøeti. Doslova se tam zakopali.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Ale mnohem víc znepokojující jsou útoky drakù. Zpustošili už celé vnìjší opevnìní.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Ještì jeden draèí útok a budeme mít tìžké ztráty.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "Kolik drakù tu je?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Kolik drakù tu je?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Netušíme, kolik jich je dohromady, ale urèitì to je víc než jeden.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Ale to není všechno. Celé Hornické údolí je plné zlých stvùr, které drakùm slouží.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Co si budeme namlouvat - bez posil zvenèí jsou naše šance dostat se odsud v jednom kuse mizivé.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Všude panuje klid. To se ale mùže rychle zmìnit.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Zkusíme vydržet tak dlouho, jak to jen pùjde.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos nám pomùže. Jeho svìtlo záøí v našich srdcích!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hej! Nemáš na práci nic dùležitìjšího, než se mnou poøád tlachat? Mazej!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "Je všechno v poøádku?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Je všechno v poøádku?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Zatím jo!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Jo, zatracenì.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(zasmìje se) Ale. Teï chápu, co máš za lubem. Ne, pøíteli. Tentokrát ne.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Neotravuj.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "Stalo se nìco dùležitého?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Stalo se nìco dùležitého?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ty patøíš k té spodinì, co si øíká drakobijci?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Vážnì jsem si myslel, že v sobì máš dost cti, než aby ses spolèoval s takovými lidmi.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Dìlám si starosti. Velké starosti.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Kvùli èemu?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Nedávno pøišli tihle chlápci. Øíkají si drakobijci.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//Jak to vidím já, jsou to povaleèi a zloèinci.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Kdyby záleželo na mnì, vyhnal bych je z hradu. A se o nì postarají skøeti.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"Ale jsou tady, na rozdíl od lorda Hagena.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"Možná bys jim mìl dát šanci.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"Nezdá se ti, že to pøeháníš?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Ale jsou tady, na rozdíl od lorda Hagena.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(trpce se zasmìje) Ano, bohužel jsou to jediné, co tady máme.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos nás opravdu velice tìžce zkouší.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Možná bys jim mìl dát šanci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//Už ji dostali. Bohužel.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond je pøesvìdèen, že by nám mohli pomoci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Ale já z nich nespustím oko. Máme už dost problémù se skøety, nepotøebujeme další potíže.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Nezdá se ti, že to pøeháníš?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//To rozhodnì ne. V našem postavení potøebujeme muže, kteøí by stáli pøíkladem.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Bojovníky, kteøí by v srdcích našich vojákù zažhnuli Innosùv oheò.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//Místo toho tahle sebranka podrývá morálku našeho mužstva.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "Musím si s tebou promluvit o Janovi.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Musím si s tebou promluvit o Janovi.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan? Kdo je to?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Drakobijec. Je kováø.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//No ano, už si vzpomínám. Co je s ním?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Chce pracovat v kovárnì.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Nepøipadá v úvahu. Je jedním z nich a já jim nevìøím.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "Nemùžeš tu vìc s Janem ještì jednou zvážit?";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Nemùžeš tu vìc s Janem ještì jednou zvážit?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Ne, stojím si za svým rozhodnutím.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "Garond chce, aby se Jan staral o kovárnu.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond chce, aby se Jan staral o kovárnu.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Hmm. Pokud to je tak, a si tu kovárnu klidnì má.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//I když si myslím, že vìøit tomu Janovi je velká chyba.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "A kromì toho?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//A kromì toho?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ale, nech mì už být!
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Zrádce! Jsem si jistý, žes to byl TY, kdo otevøel bránu.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Za to zaplatíš.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};

