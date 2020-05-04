
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(p��sn�) Po�kej chv�li, synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//��k� se, �e ze svatyn� 'zmizel' cenn� artefakt.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Ani o tom nechci sly�et nic dal��ho - p�edpokl�d�m, �e se vr�t� na sv� m�sto.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Poru�il jsi z�kona na�eho spole�enstv�.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//A i kdy� jsi u� byl obvin�n, provinil ses je�t� v�c.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Tv� vina m��e b�t smyta jen v�t��m darem kl�teru.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Kdo si mysl�, �e jsi? Modli se k Innosovi za odpu�t�n� sv�ch skutk�!
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Tvoje situace se zm�nila.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Nejsou u� ��dn� sv�dkov� tv� vra�dy!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikdo u� nebude sv�d�it, �e t� vid�l kr�st!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//U� t� nikdo neobvi�uje z toho, �e by ses pral!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//V�echna obvin�n� proti tob� byla sta�ena!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Mo�n� se ti poda�� m� o��lit - ale Innos zn� tv� prav� skutky!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Tv� h��chy jsou nyn� odpu�t�ny.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//A sna� se, aby to tak tak� z�stalo!
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Zaplat� svou pokutu - takov� je v�le Innosova!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Osvobo� se od sv� viny!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"Nem�m dost pen�z!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"Kolik �e to bylo?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"Nem�m dost pen�z!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"Kolik �e to bylo?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Je�t� jsme spolu nemluvili, a u� na sob� m� b�emeno viny!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Provinil ses nejhor��m ze v�ech zlo�in�! Vra�dou!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A zat�il ses je�t� dal�� vinou!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Kdyby z�le�elo na mn�, na m�st� bych t� odsoudil, vrahu!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Ale kdy� za sv�j zlo�in zaplat� pokutu, zbav�m t� tv� viny.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Kr�de� je poru�en�m z�kon� kl�tera!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Krom� toho jsi poru�il i dal�� z�kony.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Tyto proh�e�ky mus� b�t potrest�ny. Tak zn� Innosovo p�ik�z�n�.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Zaplat� kl�teru p�im��enou pokutu.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//V kl�te�e netolerujeme rva�ky. Takov� chov�n� se protiv� na�im z�kon�m.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//A pro� zab�j� na�e ovce?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//�ijeme tady podle p�ik�z�n�. A ta se vztahuj� i na tebe.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za sv�j zlo�in mus� d�t kl�teru dar.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabil jsi na�e ovce. Za to zaplat� od�kodn�!
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Kolik?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"Nem�m dost pen�z!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//P�ij�m�m tv�j dar. Tv� h��chy jsou odpu�t�ny. Nech� ti Innos d� moudrost, abys stejn� chyby ji� v�ckr�t neopakoval.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nem�m dost pen�z!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Na to jsi m�l myslet, ne� ses sv�ch proh�e�k� dopustil.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Mo�n� se z toho ponau��. Ned�lej ��dn� dal�� pot�e, nebude� muset platit.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void b_dia_parlan_welcome_gofortribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//A� to ud�l�, promluv�me si o tv� pr�ci tady v kl�te�e.
};

func void b_dia_parlan_welcome_bringtribute2gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Odnes okam�it� sv�j poplatek kl�teru Goraxovi. Ten se o to postar�.
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//V�tej, novici, j� jsem Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//J� jsem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(p�eru�� t�)... NOVIC. Nen� d�le�it�, kdo jsi byl p�edt�m. Te� jsi Innos�v slu�ebn�k. To je v�e, na �em z�le��.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//A jakmile bude� p�ijat do Bratrstva ohn�, budou v�echny tv� p�edchoz� proh�e�ky odpu�t�ny.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Nech� Innos po�ehn� tomuto mu�i, kter� zasv�t� sv�j �ivot jeho slu�b�, a smyje z n�j v�echny jeho h��chy.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//A te�?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve bude� plnit sv� povinnosti novice. Bude� pracovat a slou�it pro blaho Bratrstva.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"Jako novic m�m povinnost plnit �koly, kter� poslou�� cel�mu spole�enstv�.");
	if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE)
	{
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve v�ak dove� svou ovci k Opolosovi, postar� se o ni.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Sv� zlato m��e� d�t Goraxovi, na�emu spr�vci. Najde� ho ve st���rn� v�na.
			b_dia_parlan_welcome_gofortribute();
		};
	}
	else if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		b_dia_parlan_welcome_bringtribute2gorax();
		b_dia_parlan_welcome_gofortribute();
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "Hled�m Innosovo oko.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Hled�m Innosovo oko.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Nev�m, kdo ti o n�m �ekl, ale k tomuto posv�tn�mu artefaktu nem� nikdo p��stup.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Kde je Innosovo oko uschov�no?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//��m m�n� lid� toto tajemstv� zn�, t�m l�pe. Hledej ho - a nenajde� jej.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "�ekni mi n�co o Innosov� oku.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//�ekni mi n�co o Innosov� oku.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Dobr�. Innosovo oko obsahuje ��st Innosovy svat� moci. Nosit tento amulet m��e jen JEDIN� vyvolen� Innos�v slu�ebn�k.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Bylo vytvo�eno, aby n�s v prav� �as ochr�nilo p�ed silami Zla.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "Pot�ebuji si promluvit s v�dcem paladin�!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Pot�ebuji si promluvit s v�dcem paladin�!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen novice nep�ij�m� - setkat se s n�m mohou pouze m�gov�.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "Jak mohu poslou�it zdej�� komunit�?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Jak mohu poslou�it zdej�� komunit�?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve bude� plnit sv� povinnosti novice. Bude� pracovat a slou�it pro blaho Bratrstva.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve v�ak dove� svou ovci k Opolosovi, postar� se o ni.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE)
			{
				b_dia_parlan_welcome_bringtribute2gorax();
				b_dia_parlan_welcome_gofortribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Sv� zlato m��e� d�t Goraxovi, na�emu spr�vci. Najde� ho ve st���rn� v�na.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//A� to ud�l�, promluv�me si o tv� pr�ci tady v kl�te�e.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Je �as klidu. Pr�ce novic� za��n� za rozb�esku a pokra�uje a� do setm�n�.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//M�l by ses vyspat. P�ij�, a� nadejde �as pr�ce.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Promluv si s ostatn�mi m�gy. Oni ti zadaj� �koly.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//J� budu na tvou pr�ci dohl�et, a a� sv� povinnosti uspokojiv� spln�, dostane� povolen� vstoupit do knihovny a studovat Innosovo u�en�.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"Kdy� spln�m �koly pro m�gy, dovol� mi pak studovat v knihovn�.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "Mohu vstoupit do knihovny?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Mohu vstoupit do knihovny?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Sehnal jsi ohniv� kop�ivy pro bratra Neorase.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Na�el jsi recept bratra Neorase.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Zdolal jsi �ern�ho vlka, kter� ohro�oval svatyni.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Poda�ilo se ti naj�t �ty�i novice a t�m p�dem i uklidit pokoje.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Rozd�lil jsi j�dlo mezi novice spravedliv�, p�esn� jak ti bratr Gorax nak�zal.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax s tebou nebyl spokojen, proto�e jsi j�dlo nerozd�lil spravedliv�.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Prodal jsi v�no ke Goraxov� spokojenosti.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//��m m�n� toho bude �e�eno o t� z�le�itosti s v�nem, t�m l�pe.
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Ano, u� jsi pracoval dost. Nade�el �as, abys studoval Innosovo u�en�. Promluv si s mistrem Hyglasem v knihovn�.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Zde ti d�v�m kl��.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Nepracoval jsi m�lo, ale tvou povinnost� je d�l slou�it spole�enstv�.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Nejprve spl� sv� �koly ve slu�b� spole�enstv�. A� bude� se v��m hotov, m��eme si o tom promluvit znovu.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "M� pro m� n�jak� �kol?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//M� pro m� n�jak� �kol?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmm... Ano, opravdu tady je n�co, co bys mohl pro na�i komunitu ud�lat.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Komnaty novic� by pot�ebovaly po��dn� zam�st. Postarej se o to.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Ale to bude trvat v��n�.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//V tom p��pad� bys m�l za��t co nejd��v, nezd� se ti?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"Mistr Parlan chce, abych zametl �ty�i cely pro novice. To potrv� celou v��nost!");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "Co se t�ch komnat novic� t��e...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Co se t�ch komnat novic� t��e...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Poda�ilo se ti naj�t �ty�i novice, aby ti pomohli. Mysl�m, �e se te� mohou zase vr�tit ke sv� b�n� pr�ci.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Dobr� pr�ce, novici. Splnil jsi �kol, kter� jsem ti zadal.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//O tom nen� sporu - nen� to jednoduch� �kol. Ale s Innosovou pomoc� to jist� zvl�dne�.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "Jak se mohu nau�it um�n� magie?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak se mohu nau�it um�n� magie?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nejsi zde proto, abys dostal dar magie - jsi zde, abys slou�il Innosovi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Ale mohu ti uk�zat, jak zv��it svou magickou moc.
	b_logentry(TOPIC_KLOSTERTEACHER,"Mistr Parlan mi pom��e vylep�it magick� um�n�.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "Cht�l bych podstoupit Zkou�ku ohn�.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Cht�l bych podstoupit Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Co�e...? Hm... (nal�hav�) Mysl� to v�n�?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Trv�m na tom.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Jsi v�jime�n� novic. Dobr�, pokud jsi rozhodnut, promluv si s mistrem Pyrokarem.
	b_logentry(TOPIC_FIRECONTEST,"Kdybych n�kdy cht�l podstoupit Zkou�ku ohn�, mus�m si promluvit s mistrem Pyrokarem.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "Cht�l bych pos�lit svoji magickou moc.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Cht�l bych pos�lit svoji magickou moc.
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Tvoje magick� s�la se zv��ila. D�l u� ti pomoci nemohu.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Jestli se chce� u�it d�l, po��dej Pyrokara.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Slo�il jsi slib, brat�e. V�tej mezi n�mi.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//A� bude� dostate�n� zku�en�, budu t� u�it v Kruz�ch magie.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Na d�kaz, �e ve tv�ch rukou nyn� d��m� moc, si vezmi tenhle runov� k�men.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = "Nau� m� prvn� Kruh magie.";
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Nau� m� prvn� Kruh magie.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//V prvn�m Kruhu magie m��e� pou��vat runy, kter� jsi s�m vytvo�il.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Ke stvo�en� run se bude� muset nau�it kouzeln� formule.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Ka�d� z n�s se soust�ed� na jeden okruh magie. Dob�e si tedy rozmysli, jak� by ses cht�l v�novat ty.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = "Nau� m� druh� Kruh magie.";
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Nau� m� druh� Kruh magie.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Vstup do druh�ho Kruhu a nau� se je�t� siln�j�� magii.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Ale m�j na pam�ti, �e na sebe bere� zodpov�dnost. Ne ke mn� nebo k Pyrokarovi - ale k Innosovi.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//On ti ukazuje sm�r - cestu v�ak tvo�� tv� skutky.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Je�t� nenade�el spr�vn� �as.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = "Nau� m� t�et� Kruh magie.";
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Nau� m� t�et� Kruh magie.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Ano, u� nade�el ten spr�vn� �as. Vstup do t�et�ho Kruhu magie. Nov� kouzla t� ji� o�ek�vaj�.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Bude� je pot�ebovat, proto�e Zlo se stahuje a odrazit jej m��e jen Innosova s�la.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//U� jsem t� nau�il v�em Kruh�m, jimi� jsem t� mohl prov�st. Vy��� Kruhy t� nau�� Karas.
			b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan m� nau�il prvn� t�i kruhy. Do dal��ch m� uvede bratr Karras.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Je�t� nenade�el prav� �as, aby ses nau�il t�et� Kruh.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "U� m�!";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//U� m�!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//V tuhle chv�li t� nemohu nau�it ��dn� dal�� formule.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Nech� t� Innos ochra�uje.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Vid�m, �e ses nakonec rozhodl bojovat po na�em boku. Jsem r�d.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Bude se n�m hodit ka�d� ruka. B� si promluvit p��mo s Mardukem, ten zodpov�d� za v�s paladiny.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Netu��m, pro� ti byl povolen vstup sem do kl�tera. Jsem Parlan a zodpov�d�m za v�s nov��ky.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nerad bych, abys je zdr�oval od pr�ce sv�mi hloup�mi ot�zkami. Je to jasn�?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"Budu si d�lat, co se mi zl�b�.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"Jasn�.",dia_parlan_iamparlan_ok);
	};
	Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Budu si d�lat, co se mi zl�b�.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Ur�it� je n�jak� d�vod, pro� tu jsi trp�n, ale v�echno m� sv� meze.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Kdy� bude� d�lat probl�my, zaplat� za to. Tak se dr� od novic� d�l.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Jasn�.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//To douf�m.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "M� pro m� je�t� n�co?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//M� pro m� je�t� n�co?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Ano. Jako�to �len knihovny bys m�l dostat kl�� ke knihovn�. Najde� tam bratry Karase a Hyglase.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Pokud chce�, m��e� si tam s nimi promluvit
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Ale od novic� se dr� d�l!
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(v�hr��n�) Nerad bych se opakoval. Dr� se od novic� d�l.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//M�li by o�istit sv� du�e fyzickou prac� a p�ipravit se na �ivot v kl�te�e.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(r�zn�) Dal�� vyru�ov�n� nebudu tolerovat!
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Kde bych na�el...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Kde bych na�el...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... kostel?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... knihovnu?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... kapli?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... sklepy?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... kostel?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Bo�e v�emohouc�! Copak t� Innos oslepil?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(sarkasticky) Kdepak je kostel? Bo���ku, kde by asi tak mohl b�t?
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... knihovnu?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Knihovna je na konci kolon�dy, p��mo naproti kostelu.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... kapli?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaple je m�stnost v polovin� kolon�dy nalevo. Paladinov� se v n� modl� k Innosovi.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... sklepy?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Vstup do sklep� je v polovin� kolon�dy napravo.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};

