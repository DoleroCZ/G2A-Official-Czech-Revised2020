
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
	description = "Co tady d�l�?";
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
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Douf�m, �e co nejd��v p�ipluje lo�, kterou bych si mohl pronajmout.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Tohle fl�k�n� mi u� v�n� leze na nervy.
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
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Sly�el jsem, �e hled� lidi na svou lo�?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//A?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Jdu do toho!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"V p��stavn� kr�m� se se mnou dal do �e�i b�val� n�mo�n�k Mario, kter� se chce op�t dostat na lo�.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "Pro� bych t� m�l s sebou br�t?";
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
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Pro� bych t� m�l s sebou br�t?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Prost� proto, �e m� pot�ebuje�.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jsem... Byl jsem poru��kem v kr�lovsk�m n�mo�nictvu.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Slou�il jsem jako n�mo�n�k na Kr�li Rhobarovi a Chloub� Myrtany.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//V bitv� o V�chodn� souostrov� jsem jednou rukou poslal zp�tky do Beliarovy ��e dva tucty sk�et�.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Bohu�el pot�, co potopili na�� vlajkovou lo�, n�s zbylo p��li� m�lo a museli jsme se st�hnout.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "Tak pro� jsi tady?";
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
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Tak pro� jsi tady?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flotila je pora�en� a truhlice se �oldem pr�zdn�.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Kdy� m� propustili, z�stal jsem tr�et v t�hle d��e. Tak hled�m n�jakou dal�� pr�ci.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "Co um�?";
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
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co um�?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jsem zku�en� n�mo�n�k a bojovn�k, nav�c dok�u slu�n� zach�zet s lodn�m d�lem.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Ur�it� bych t� p�r v�c� dok�zal nau�it, ne� doplujeme k c�li.
	b_logentry(TOPIC_CREW,"Vypad� to, �e Mario je ve v�cech n�mo�n�ch docela zb�hl�. Mo�n� by se se mnou mohl o p�r zku�enost� pod�lit.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "Co za to chce�?";
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
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Co za to chce�?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Co bych cht�l? Budu r�d, �e odsud vypadnu.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Pl�cneme si. J� ti pom��u a ty m� odsud dostane�.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "Ta cesta m��e b�t nebezpe�n�.";
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
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Ta cesta m��e b�t nebezpe�n�.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Na nebezpe�� jsem zvykl�. Kdy� jsi na mo�i, je ka�d� den nebezpe�n�.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//P��t� bou�e m��e b�t tvoje smrt a p��ery z hlubin dok�� spolknout celou lo� jako malinu.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//A o sk�et�ch gal�r�ch snad ani mluvit nemus�m, �e? V�� mi, nenajde se nic, �eho bych se b�l. N�mo�n�k, kter� se boj�, je u� p�edem mrtv�.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "K ni�emu bys mi nebyl.";
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
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//K ni�emu bys mi nebyl.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Jsem nejlep�� n�mo�n�k, kter�ho tady m��e� sehnat.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Sta�� se na tebe pod�vat a hned je jasn�, �e o navigaci nev�, co by se za nehet ve�lo.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Tak�e rad�i v�echno dvakr�t zva�, ne� bude� n�komu v��it.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "Dob�� pomocn�ci se v�dycky hod�.";
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
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Dob�� pomocn�ci se v�dycky hod�.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Jasn� v�c, uvid�me se na lodi.
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
	description = "P�ece jenom bys mi k ni�emu nebyl!";
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
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//P�ece jenom bys mi k ni�emu nebyl!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak je libo. V�, kde m� naj�t!
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
	description = "P�ece jenom bys mi k n��emu mohl b�t!";
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
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//P�ece jenom bys mi k n��emu mohl b�t!
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//V�d�l jsem to! Uvid�me se na lodi!
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
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Takhle se ke mn� chovat nesm�. Vykuch�m t�!
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

