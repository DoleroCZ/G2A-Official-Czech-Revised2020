
instance DIA_NONE_101_MARIO_EXIT(C_INFO)
{
	npc = none_101_mario;
	nr = 999;
	condition = dia_none_101_mario_exit_condition;
	information = dia_none_101_mario_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_JOB(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_job_condition;
	information = dia_none_101_mario_job_info;
	permanent = TRUE;
	description = "Co tady dìláš?";
};


func int dia_none_101_mario_job_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && (Npc_KnowsInfo(other,dia_none_101_mario_youneedme) == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_job_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Doufám, že co nejdøív pøipluje loï, kterou bych si mohl pronajmout.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Tohle flákání mi už vážnì leze na nervy.
};


instance DIA_NONE_101_MARIO_YOUNEEDME(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_youneedme_condition;
	information = dia_none_101_mario_youneedme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_101_mario_youneedme_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_youneedme_info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Slyšel jsem, že hledáš lidi na svou loï?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//A?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Jdu do toho!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"V pøístavní krèmì se se mnou dal do øeèi bývalý námoøník Mario, který se chce opìt dostat na loï.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "Proè bych tì mìl s sebou brát?";
};


func int dia_none_101_mario_whyneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Proè bych tì mìl s sebou brát?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Prostì proto, že mì potøebuješ.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jsem... Byl jsem poruèíkem v královském námoønictvu.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Sloužil jsem jako námoøník na Králi Rhobarovi a Chloubì Myrtany.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//V bitvì o Východní souostroví jsem jednou rukou poslal zpátky do Beliarovy øíše dva tucty skøetù.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Bohužel poté, co potopili naší vlajkovou loï, nás zbylo pøíliš málo a museli jsme se stáhnout.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "Tak proè jsi tady?";
};


func int dia_none_101_mario_whyhere_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyhere_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Tak proè jsi tady?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flotila je poražená a truhlice se žoldem prázdná.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Když mì propustili, zùstal jsem trèet v téhle díøe. Tak hledám nìjakou další práci.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "Co umíš?";
};


func int dia_none_101_mario_abilities_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_abilities_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co umíš?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jsem zkušený námoøník a bojovník, navíc dokážu slušnì zacházet s lodním dìlem.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Urèitì bych tì pár vìcí dokázal nauèit, než doplujeme k cíli.
	b_logentry(TOPIC_CREW,"Vypadá to, že Mario je ve vìcech námoøních docela zbìhlý. Možná by se se mnou mohl o pár zkušeností podìlit.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "Co za to chceš?";
};


func int dia_none_101_mario_yourprice_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_yourprice_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Co bych chtìl? Budu rád, že odsud vypadnu.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Plácneme si. Já ti pomùžu a ty mì odsud dostaneš.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "Ta cesta mùže být nebezpeèná.";
};


func int dia_none_101_mario_couldbedangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_yourprice) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_couldbedangerous_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Ta cesta mùže být nebezpeèná.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Na nebezpeèí jsem zvyklý. Když jsi na moøi, je každý den nebezpeèný.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Pøíští bouøe mùže být tvoje smrt a pøíšery z hlubin dokáží spolknout celou loï jako malinu.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//A o skøetích galérách snad ani mluvit nemusím, že? Vìø mi, nenajde se nic, èeho bych se bál. Námoøník, který se bojí, je už pøedem mrtvý.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "K nièemu bys mi nebyl.";
};


func int dia_none_101_mario_dontneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_dontneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//K nièemu bys mi nebyl.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Jsem nejlepší námoøník, kterého tady mùžeš sehnat.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Staèí se na tebe podívat a hned je jasné, že o navigaci nevíš, co by se za nehet vešlo.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Takže radši všechno dvakrát zvaž, než budeš nìkomu vìøit.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "Dobøí pomocníci se vždycky hodí.";
};


func int dia_none_101_mario_needgoodmen_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_needgoodmen_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Dobøí pomocníci se vždycky hodí.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Jasná vìc, uvidíme se na lodi.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	MARIO_ISONBOARD = LOG_SUCCESS;
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


instance DIA_MARIO_LEAVEMYSHIP(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_leavemyship_condition;
	information = dia_mario_leavemyship_info;
	permanent = TRUE;
	description = "Pøece jenom bys mi k nièemu nebyl!";
};


func int dia_mario_leavemyship_condition()
{
	if((MARIO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_mario_leavemyship_info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Pøece jenom bys mi k nièemu nebyl!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak je libo. Víš, kde mì najít!
	MARIO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MARIO_STILLNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_stillneedyou_condition;
	information = dia_mario_stillneedyou_info;
	permanent = TRUE;
	description = "Pøece jenom bys mi k nìèemu mohl být!";
};


func int dia_mario_stillneedyou_condition()
{
	if(((MARIO_ISONBOARD == LOG_OBSOLETE) || (MARIO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_mario_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Pøece jenom bys mi k nìèemu mohl být!
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Vìdìl jsem to! Uvidíme se na lodi!
		MARIO_ISONBOARD = LOG_SUCCESS;
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
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Takhle se ke mnì chovat nesmíš. Vykuchám tì!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc = none_101_mario;
	nr = 900;
	condition = dia_mario_pickpocket_condition;
	information = dia_mario_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_pickpocket_condition()
{
	return c_beklauen(71,220);
};

func void dia_mario_pickpocket_info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_BACK,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,dia_mario_pickpocket_doit);
};

func void dia_mario_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

