
instance DIA_ANDRE_EXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_exit_condition;
	information = dia_andre_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_andre_exit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_firstexit_condition;
	information = dia_andre_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_andre_firstexit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_andre_firstexit_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(wulfgar,"START");
};


var int andre_steckbrief;

func void b_andre_steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//Jeden z m�ch mu�� mi �ekl, �e bandit� rozn�ej� plak�ty s vypsanou odm�nou a �e je na nich tvoje tv��.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//Tak� mi �ekl, �es to nejd��v pop�el.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//Tak�e o co tady jde?
	AI_Output(other,self,"DIA_Andre_Add_15_03");	//Nev�m, pro� m� ti lid� hledaj�...
	AI_Output(self,other,"DIA_Andre_Add_08_04");	//Pro tvoje vlastn� dobrou douf�m, �e ��k� pravdu.
	AI_Output(self,other,"DIA_Andre_Add_08_05");	//Nechci v domobran� nikoho, kdo nem� �ist� rejst��k.
	AI_Output(self,other,"DIA_Andre_Add_08_06");	//V�t�ina z t�ch bandit� jsou b�val� v�zni z t�a�sk� kolonie.
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//Douf�m, �e ses s t�mi hrdlo�ezy nijak nezapletl!
	ANDRE_STECKBRIEF = TRUE;
};


var int andre_cantharfalle;

func void b_andre_cantharfalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//Byl tady kupec Canthar. Pov�dal, �e jsi uprchl� trestanec z t�a�sk� kolonie.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//Nev�m, jestli to je pravda, a rad�i bych se t� neptal, ale m�l bys to n�jak objasnit.
	b_removenpc(sarah);
	b_startotherroutine(canthar,"MARKTSTAND");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
	{
		CANTHAR_SPERRE = TRUE;
	};
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	ANDRE_CANTHARFALLE = TRUE;
};


instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_cantharfalle_condition;
	information = dia_andre_cantharfalle_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_cantharfalle_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		return TRUE;
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		return TRUE;
	};
};

func int dia_andre_cantharfalle_info()
{
	if(ANDRE_STECKBRIEF == FALSE)
	{
		b_andre_steckbrief();
	};
	if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
	{
		b_andre_cantharfalle();
	};
};


var int andre_lastpetzcounter;
var int andre_lastpetzcrime;

instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_pmschulden_condition;
	information = dia_andre_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_andre_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//P�i�el jsi zaplatit svou pokutu?
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//U� jsem se s�m sebe ptal, jestli bude� m�t dost odvahy sem p�ij�t!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Zd� se, �e se po�et �alob na tebe je�t� zn�sobil!
		if(ANDRE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Varoval jsem t�! Pokuta, kterou mus� zaplatit, je je�t� vy���!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
			};
			if(ANDRE_SCHULDEN > 1000)
			{
				ANDRE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,ANDRE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//V�n� jsi m� zklamal!
		};
	}
	else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Objevilo se p�r nov�ch v�c�.
		if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//U� nen� nikdo, kdo by t� obvi�oval z vra�dy.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//U� si nikdo nevzpom�n�, �e by t� vid�l p�i kr�de�i.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//U� nejsou ��dn� sv�dkov�, kte�� by tvrdili, �e t� vid�li ��astnit se rva�ky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Zd� se, �e se v�echna obvin�n� proti tob� nakonec vyjasnila.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Nev�m, jak se to stalo, ale varuji t�: nehraj si se mnou.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Ka�dop�dn� jsem se rozhodl odpustit ti tvoje dluhy.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Dej si pozor, aby ses nedostal do ��dn�ch dal��ch pot��.
			ANDRE_SCHULDEN = 0;
			ANDRE_LASTPETZCOUNTER = 0;
			ANDRE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Jedno si vyjasn�me: tak jako tak bude� muset zaplatit pokutu v pln� v��i.
			b_say_gold(self,other,ANDRE_SCHULDEN);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Tak, kolik to d�l�?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_andre_pmschulden);
		Info_ClearChoices(dia_andre_petzmaster);
		Info_AddChoice(dia_andre_pmschulden,"Nem�m dost pen�z!",dia_andre_petzmaster_paylater);
		Info_AddChoice(dia_andre_pmschulden,"Kolik �e to bylo?",dia_andre_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
		{
			Info_AddChoice(dia_andre_pmschulden,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
		};
	};
};

func void dia_andre_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_pmschulden,"Nem�m dost pen�z.",dia_andre_petzmaster_paylater);
	Info_AddChoice(dia_andre_pmschulden,"Kolik �e to bylo?",dia_andre_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_pmschulden,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
	};
};


instance DIA_ANDRE_PETZMASTER(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_petzmaster_condition;
	information = dia_andre_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_info()
{
	ANDRE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ty mus� b�t ten nov� chlap�k, kter� tady ve m�st� d�l� tolik probl�m�.
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//Dob�e, �e jsi za mnou p�i�el, ne� to za�alo b�t pro tebe je�t� hor��.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Vra�da je v�n� zlo�in!
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//A to nemluv�m o t�ch dal��ch v�cech, kter� jsi nap�chal.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//Str�n� maj� rozkazy trestat ka�d�ho vraha hned na m�st�.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//A v�t�ina ob�an� nehodl� vra�dy na �zem� m�sta tolerovat!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//Nem�m ��dn� z�jem na tom t� pov�sil. Jsme ve v�lce a pot�ebujeme ka�d�ho mu�e.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//Ale nebude lehk� p�esv�d�it lidi, aby o tob� sm��leli zase l�pe.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//M�l bys projevit svou l�tost zaplacen�m pokuty - pochopiteln� p�im��en� vysok�.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//Dob�e, �e jsi p�i�el! Jsi obvin�n� z kr�de�e! Jsou na to sv�dci!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//A to nemluv�m o dal��ch v�cech, kter� se mi donesly.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//Takov� chov�n� nebudu ve m�st� tolerovat!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//Abys od�inil sv�j zlo�in, mus� zaplatit pokutu.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//Je n�co jin�ho, kdy� se popere� s l�zou v p��stavu...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//Ale jakmile za�to�� na ob�any nebo kr�lovsk� voj�ky, mus� j�t p�ed soud.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//A to s tou ovc� bylo tak� zcela zbyte�n�.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//Kdybych t� nechal odej�t jen tak, bude si tady za chv�li ka�d� d�lat, co se mu zl�b�.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//Tak�e zaplat� p�im��enou pokutu - a na celou v�c zapomeneme.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//Sly�el jsem, �e sis zasedl na na�e ovce.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//Uv�dom si, �e to nemohu nechat b�t jen tak.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//Bude� muset zaplatit n�hradu �kody!
		ANDRE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Kolik?
	if(ANDRE_SCHULDEN > 1000)
	{
		ANDRE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_petzmaster,"Nem�m dost pen�z.",dia_andre_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_petzmaster,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
	};
};

func void dia_andre_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Dobr�! Postar�m se o tom, aby se o tom dozv�d�l ka�d� ve m�st� - t�m se tvoje pov�st zase tro�ku vylep��.
	b_grantabsolution(LOC_CITY);
	ANDRE_SCHULDEN = 0;
	ANDRE_LASTPETZCOUNTER = 0;
	ANDRE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_andre_petzmaster);
	Info_ClearChoices(dia_andre_pmschulden);
};

func void dia_andre_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//Nem�m dost pen�z.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Tak si n�jak� co nejrychleji se�e�.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//A varuji t�: jestli se provin� je�t� n���m, jen si to zhor��.
	ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HALLO(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_hallo_condition;
	information = dia_andre_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hallo_info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Innos t� prov�zej, cizin�e! Co t� ke mn� p�iv�d�?
};


instance DIA_ANDRE_MESSAGE(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_message_condition;
	information = dia_andre_message_info;
	permanent = FALSE;
	description = "M�m d�le�itou zpr�vu pro lorda Hagena.";
};


func int dia_andre_message_condition()
{
	if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_andre_message_info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//M�m d�le�itou zpr�vu pro lorda Hagena.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//No, stoj� p�ed jedn�m z jeho mu��. �eho se to t�k�?
	Info_ClearChoices(dia_andre_message);
	Info_AddChoice(dia_andre_message,"To mohu ��ct jen lordu Hagenovi.",dia_andre_message_personal);
	Info_AddChoice(dia_andre_message,"Sk�et�mu vojsku vel� DRACI!",dia_andre_message_dragons);
	Info_AddChoice(dia_andre_message,"T�k� se to posv�tn�ho artefaktu - Innosova oka.",dia_andre_message_eyeinnos);
};

func void b_andre_lordhagennichtzusprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Lord Hagen p�ij�m� jen paladiny a ty, kdo jsou u paladin� ve slu�b�.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Je pod jeho d�stojnost ztr�cet �as s b�n�mi lidmi.
};

func void dia_andre_message_eyeinnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//T�k� se to posv�tn�ho artefaktu - Innosova oka.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Innosovo oko - nikdy jsem o n�m nesly�el. Ale to je�t� nemus� nic znamenat.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Pokud n�jak� artefakt tohoto jm�na opravdu existuje, stejn� o n�m v�d� jen nejvy��� �lenov� na�eho ��du.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Proto si mus�m promluvit se samotn�m lordem Hagenem.
	ANDRE_EYEINNOS = TRUE;
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};

func void dia_andre_message_dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Z�stupy sk�et� vedou DRA-
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(p�eru�� t�) J� V�M, �e arm�da sk�et� je ��m d�l t�m siln�j��.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Nesna�� se mi nazna�it, �e to je TO, co chce� nahl�sit lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Ten by ti utrhl hlavu za to, �e mrh� jeho �asem takov�mi historkami.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//A jsem si jist, �e jsi dost chytr� na to, abys to v�d�l s�m.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Tak�e o co ve skute�nosti jde?
};

func void dia_andre_message_personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//To mohu ��ct jen lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Jak mysl�. Ale jedno bys m�l v�d�t:
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};


instance DIA_ANDRE_PALADINE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladine_condition;
	information = dia_andre_paladine_info;
	permanent = FALSE;
	description = "Pro� jsou ve m�st� paladinov�?";
};


func int dia_andre_paladine_condition()
{
	if((other.guild != GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladine_info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Pro� jsou ve m�st� paladinov�?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//C�le na�� mise jsou tajn�.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Mohu ��ct jen to, �e ob�an� m�sta nejsou v ohro�en�.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Nemus� si d�lat starosti.
};


instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladineagain_condition;
	information = dia_andre_paladineagain_info;
	permanent = FALSE;
	description = "Pro� jsou ve m�st� paladinov�?";
};


func int dia_andre_paladineagain_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladineagain_info()
{
	if(Npc_KnowsInfo(other,dia_andre_paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//�ekne� mi te�, pro� jste vy paladinov� p�ijeli sem do Khorinisu?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Pro� jsou ve m�st� paladinov�?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Te� pat�� k m�stsk� str�i, tak�e jsi tak� pod��zen� paladin�m.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//Kone�n� t� tedy mohu zasv�tit.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//P�i�li jsme sem na rozkaz kr�le Rhobara. Se zhroucen�m bari�ry ustaly dod�vky rudy.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Proto mus�me z�skat rudu a dopravit ji na pevninu. Z t� rudy vykov�me nov� zbran� a za�eneme sk�ety zp�tky.
	KNOWSPALADINS_ORE = TRUE;
};


instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_asktojoin_condition;
	information = dia_andre_asktojoin_info;
	permanent = FALSE;
	description = "Chci vstoupit do slu�by k paladin�m!";
};


func int dia_andre_asktojoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_asktojoin_info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Chci vstoupit do slu�by k paladin�m!
	if(Npc_KnowsInfo(other,dia_andre_message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Dobr�. Hod� se mi ka�d� schopn� mu�. Nez�le�� na d�vodech, pro� se k n�m chce p�idat.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Pokud vstoup� do slu�by k paladin�m, mohl bych ti pomoci za��dit sly�en� u lorda Hagena.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Po�adavek hodn� uzn�n�.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//M�m v�ak rozkazy p�ij�mat do domobrany jen ob�any m�sta.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//M�j velitel se boj�, �e by se do n� jinak mohli vet��t �pehov� nebo sabot��i.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//T�mhle zp�sobem chce to riziko minimalizovat.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Nejprve tedy mus� b�t ob�anem m�sta - m��e sice b�t sporn�, jestli tohle pravidlo m� smysl nebo ne, ale rozkazy jsou rozkazy.
	Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
	b_logentry(TOPIC_BECOMEMIL,"Chci-li se st�t �lenem m�stsk� gardy, mus�m b�t nejd��v ob�anem m�sta.");
};


instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_andre_aboutmiliz_condition;
	information = dia_andre_aboutmiliz_info;
	permanent = FALSE;
	description = "Co m��u od slu�by v domobran� �ekat?";
};


func int dia_andre_aboutmiliz_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Co m��u od slu�by v domobran� �ekat?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Jedno si vyjasn�me. B�t voj�kem v domobran� obn�� mnohem v�c, ne� jen promen�dovat se m�stem v uniform�.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Je to �pinav� a n�kdy i krvav� pr�ce. Jakmile bude� jedn�m z n�s, bude t� �ekat spousta pr�ce.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Ale stoj� to za to. Krom� platu bude� m�t tak� mo�nost st�t se jednoho dne Innosov�m svat�m v�le�n�kem.
};


instance DIA_ADDON_ANDRE_MARTINEMPFEHLUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_addon_andre_martinempfehlung_condition;
	information = dia_addon_andre_martinempfehlung_info;
	description = "M�m tady pro tebe dopis od tv�ho voj�ka.";
};


func int dia_addon_andre_martinempfehlung_condition()
{
	if(Npc_HasItems(other,itwr_martin_milizempfehlung_addon) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_addon_andre_martinempfehlung_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//M�m tady pro tebe dopis od tv�ho voj�ka.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(nev���cn�) Co�e? Okam�it� mi ho uka�.
	b_giveinvitems(other,self,itwr_martin_milizempfehlung_addon,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(ohromen�) J� z�r�m! To ses musel opravdu sna�it, abys na n�ho ud�lal dojem, �e? Martin toti� v�t�inou neb�v� tak velkorys� v t�hle v�cech.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//Dob�e, dob�e. T�m si m� p�esv�d�il. Kdy� m� podporu Martina, tak j� t� budu tak� akceptovat. �ekni mi, a� bude� p�ipraven�.
	ANDRE_KNOWS_MARTINEMPFEHLUNG = TRUE;
};


instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_alternative_condition;
	information = dia_andre_alternative_info;
	permanent = FALSE;
	description = "Nen� n�jak� rychlej�� zp�sob, jak se k v�m p�idat?";
};


func int dia_andre_alternative_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_andre_alternative_info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//Nen� n�jak� rychlej�� zp�sob, jak se k v�m p�idat?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Hmm (na chv�li se odml��) - ty to asi mysl� v�n�, co?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Dobr�, poslouchej. M�m probl�m. Kdy� ho za m� vy�e��, dohl�dnu na to, abys byl p�ijat do �ad domobrany.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//Ale je velice d�le�it�, abys o tom nikomu ne�ekl ani slovo!
};


instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_guildofthieves_condition;
	information = dia_andre_guildofthieves_info;
	permanent = FALSE;
	description = "Co m� za probl�m?";
};


func int dia_andre_guildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_alternative))
	{
		return TRUE;
	};
};

func void dia_andre_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Co m� za probl�m?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Posledn� dobou se ve m�st� stalo mno�stv� kr�de��. Zat�m se n�m nepoda�ilo nikoho chytit, ti zlod�ji jsou prost� p��li� dob��.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Ti bastardi se vyznaj�. Jsem si jist�, �e m�me co do �in�n� s organizovanou bandou.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Nep�ekvapilo by m�, kdyby byl tady v Khorinisu zlod�jsk� cech. Najdi v�dce toho gangu a sejmi ho.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//J� se pak postar�m o to, abys byl p�ijat do domobrany - bez ohledu na to, jestli jsi ob�anem m�sta, nebo ne.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Ale nesm� se o na�� dohod� nikomu zm�nit ani slovem!
	};
	MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
	b_logentry(TOPIC_BECOMEMIL,"K m�stsk� gard� se mohu p�idat i jinak, a to tak, �e vyp�tr�m a zni��m khorinissk� zlod�jsk� cech.");
};


instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_wherethieves_condition;
	information = dia_andre_wherethieves_info;
	permanent = FALSE;
	description = "Kde bych m�l ty zlod�je za��t hledat?";
};


func int dia_andre_wherethieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_wherethieves_info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Kde bych m�l ty zlod�je za��t hledat?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Kdybych to v�d�l, ud�l�m to s�m!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//M��u ti ��ct jenom tohle: Ned�vno jsme obr�tili celou p��stavn� �tvr� vzh�ru nohama a nena�li jsme nic, v�bec nic.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Lid� odtamtud nejsou zrovna upov�dan�, zvl᚝ kdy� na sob� m� paladinsk� brn�n�.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Ale ty nejsi odsud, nebudou k tob� tak ned�v��iv�.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Nejd��v by ses m�l poptat po p��stavu. Ale bu� opatrn�. Jestli tamn�m lidem dojde, �e pracuje� pro paladiny, nedozv� se v�bec NIC!
	b_logentry(TOPIC_BECOMEMIL,"S p�tr�n�m po zlod�jsk�m cechu mohu za��t v p��stavn� �tvrti.");
};


instance DIA_ANDRE_WHATTODO(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_whattodo_condition;
	information = dia_andre_whattodo_info;
	permanent = FALSE;
	description = "Co m�m ud�lat, a� najdu n�kter�ho z t�ch zlod�j�?";
};


func int dia_andre_whattodo_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_whattodo_info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Co m�m ud�lat, a� najdu n�kter�ho z t�ch zlod�j�?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Pokud se bude jednat o n�jak�ho poskoka, pomaha�e nebo malou rybu, bude nejlep��, kdy� to nebude� hn�t na ost�� no�e.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Sp� p�ij� za mnou a podej mi o tom zpr�vu. J� se pak postar�m o to, aby ten chlap�k skon�il za m��emi.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Do p��m�ho boje by n�hodou mohla zakro�it m�stsk� str� a t�ko bys pak m�l p��le�itost vysv�tlovat, o co vlastn� jde.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Nav�c za ka�d�ho zmetka, kterej skon�� pod z�mkem, dostane� odm�nu.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Ale jestli se ti poda�� naj�t skr�� jejich v�dc� - no - pak se boji u� asi nevyhne�.
	b_logentry(TOPIC_BECOMEMIL,"Pokud chytnu n�kter�ho z p�isluhova�� zlod�jsk�ho cechu, m�m ho p�edv�st p��mo p�ed lorda Andreho. Jestli�e m�m ale zni�it cel� cech, mus�m zjistit, kde se skr�vaj�.");
};


instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 200;
	condition = dia_andre_auslieferung_condition;
	information = dia_andre_auslieferung_info;
	permanent = TRUE;
	description = "P�i�el jsem si vybrat odm�nu za zlo�ince.";
};


func int dia_andre_auslieferung_condition()
{
	if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_auslieferung_info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//P�i�el jsem si vybrat odm�nu za zlo�ince.
	Info_ClearChoices(dia_andre_auslieferung);
	Info_AddChoice(dia_andre_auslieferung,"Vr�t�m se pozd�ji. (ZP�T)",dia_andre_auslieferung_back);
	if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Rengaru okradl obchodn�ka Joru.",dia_andre_auslieferung_rengaru);
	};
	if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Halvor prod�v� kraden� zbo��.",dia_andre_auslieferung_halvor);
	};
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Nagur zabil Baltramova posla.",dia_andre_auslieferung_nagur);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Canthar se pokou�� zbavit Sarah!",dia_andre_auslieferung_canthar);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Sarah prod�v� zbran� Onarovi.",dia_andre_auslieferung_sarah);
	};
};

func void dia_andre_auslieferung_back()
{
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_rengaru()
{
	AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Rengaru okradl kupce Joru. Zkusil pr�sknout do bot, ale chytil jsem ho.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Dobr�, m� mu�i ho u� sebrali. V nejbli��� budoucnosti u� nebude nikoho okr�dat.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Tady m� sv� pen�ze.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	RENGARU_AUSGELIEFERT = TRUE;
	MIS_THIEFGUILD_SUCKED = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
	b_startotherroutine(rengaru,"PRISON");
};

func void dia_andre_auslieferung_halvor()
{
	AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Halvor je p�ekupn�k. Prod�v� zbo��, kter� bandit� ukradnou kupc�m.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Tak�e on za t�m v�z�. M� mu�i ho okam�it� zatknou.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//Ne�ekl bych, �e bude d�lat n�jak� probl�my. Hned ti d�m tvou odm�nu.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(halvor,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	HALVOR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_nagur()
{
	AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Nagur zabil Baltramova posla. Pokusil se pou��t m� jako nov�ho posla, aby zachytil Akilovu z�silku.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//Na toho chlap�ka �ek� trest. Okam�it� ho nech�m zav��t.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Tady m� odm�nu, kterou sis po pr�vu zaslou�il.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(nagur,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	NAGUR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_canthar()
{
	AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Kupec Canthar se sna�� zbavit Sarah!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Sarah? T� prodava�ky zbran� z tr�i�t�?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//M�l jsem j� podstr�it fale�n� dopis, ve kter�m tvrd�, �e dod�v� zbran� Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//Aha. Za toho parchanta ti r�d vyplat�m odm�nu. Jako by u� byl za m��emi.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(canthar,"KNAST");
	MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
	b_checklog();
	CANTHAR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_sarah()
{
	AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Sarah prod�v� zbran� Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Sarah? Ta prodava�ka zbran� z tr�i�t�? M� n�jak� d�kaz?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//M� ve sv� kapse dopis, ve kter�m jsou podrobnosti o dod�vce zbran� k n�mu.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//To j� neprojde. Nech�m ji zatknout.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(sarah,"KNAST");
	b_startotherroutine(canthar,"MARKTSTAND");
	SARAH_AUSGELIEFERT = TRUE;
	MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};


instance DIA_ANDRE_DGRUNNING(C_INFO)
{
	npc = mil_311_andre;
	nr = 4;
	condition = dia_andre_dgrunning_condition;
	information = dia_andre_dgrunning_info;
	permanent = TRUE;
	description = "Co se t��e toho cechu zlod�j�...";
};


func int dia_andre_dgrunning_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_dgrunning_info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//Co se t��e toho cechu zlod�j�...
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//M��e� to pustit z hlavy. Poslal jsem dol� do stok p�r chlap�.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//Cech zlod�j� je u� jen smutn� kapitola v historii tohoto m�sta.
		MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
		if(MIS_CASSIAKELCHE == LOG_RUNNING)
		{
			MIS_CASSIAKELCHE = LOG_OBSOLETE;
		};
		if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
		{
			MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Ano?
	Info_ClearChoices(dia_andre_dgrunning);
	Info_AddChoice(dia_andre_dgrunning,"Pracuji na tom ...",dia_andre_dgrunning_back);
	if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
	{
		Info_AddChoice(dia_andre_dgrunning,"V�echny jsem je dostal!",dia_andre_dgrunning_success);
	};
	if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
	{
		Info_AddChoice(dia_andre_dgrunning,"Na�el jsem �kryt cechu zlod�j�!",dia_andre_dgrunning_verrat);
	};
};

func void dia_andre_dgrunning_back()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Pracuji na tom.
	if(DIEBESGILDE_VERRATEN == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Dobr�. D�m ti na spln�n� toho �kolu trochu v�c �asu.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Dobr�! Dej mi o v�em v�d�t.
	};
	Info_ClearChoices(dia_andre_dgrunning);
};

func void dia_andre_dgrunning_verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Na�el jsem �kryt cechu zlod�j�!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Kde?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//Ve stok�ch pod m�stem.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Co�e? V�echny kan�ly jsme zape�etili.
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Zd� se, �e to jim nebr�n� v tom, aby si dole v klidu vegetovali.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Zne�kodnil jsi ty krimin�ln�ky?
	DIEBESGILDE_VERRATEN = TRUE;
	DG_GEFUNDEN = TRUE;
};

func void dia_andre_dgrunning_success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//V�echny jsem je dostal!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Prok�zal jsi m�stu cennou slu�bu.
	DG_GEFUNDEN = TRUE;
	MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
	b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		MIS_CASSIAKELCHE = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Jestli m� po��d z�jem o m�sto v domobran�, sta�� ��ct.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Splnil jsi svou povinnost, jak se slu�� na Innosova slu�ebn�ka a kr�lovsk�ho voj�ka.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//Pr�vem ti n�le�� odm�na za ty bandity. Tady je.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
	Info_ClearChoices(dia_andre_dgrunning);
};


instance DIA_ANDRE_JOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_join_condition;
	information = dia_andre_join_info;
	permanent = TRUE;
	description = "Jsem p�ipraven p�idat se k domobran�!";
};


func int dia_andre_join_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_join_info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//Jsem p�ipraven p�idat se k domobran�!
	if(ANDRE_KNOWS_MARTINEMPFEHLUNG == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//Martin za tebe ru�� a dokonce t� i doporu�il. To mi bude sta�it.
	}
	else if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//Dodr��m svou ��st �mluvy a p�ij�m�m t� do �ad domobrany, a�koliv nejsi ob�anem m�sta.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//Ale nikomu na sv�t� o tom ne�ekni ani slovo! ��m m�n� lid� bude o t�to v�jimce v�d�t, t�m m�n� to budu muset pozd�ji obhajovat.
	}
	else if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//Tak�e ses stal ob�anem Khorinisu?
		if(PLAYER_ISAPPRENTICE == APP_HARAD)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//Kov�� m� p�ijal za u�edn�ka.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Harad? Zn�m ho. Pracuje pro n�s. Je to dobr� chlap.
		};
		if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//Jsem alchymist�v u�e�!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//V domobran� nem�me zrovna moc u�enc�. Mo�n� by se n�m mohly tvoje schopnosti hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//Moc toho o tom alchymistovi nev�m. Ale lid� ��kaj�, �e to je �estn� mu�.
		};
		if(PLAYER_ISAPPRENTICE == APP_BOSPER)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//V�robce luk� Bosper m� vzal do u�en�.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Tak�e v� tak� n�co o �ivot� v divo�in�? To je dob�e, proto�e �lenov� domobrany pln� i �koly mimo okruh m�stsk�ch hradeb.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//Lid�, kte�� se vyznaj� v divo�in�, se n�m budou ur�it� hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//A ten v�robce luk� je pro m�sto velice v�znamn� �lov�k.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//Pokud pro tebe bude hlasovat, nestoj� nic v cest� tv�mu p�ijet� do domobrany.
		if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Nav�c se ti poda�ilo zbavit n�s toho cechu zlod�j�. U� jen za to bych t� do domobrany p�ijal.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//To je mo�n� - ale st�le nejsi ob�anem na�eho m�sta a j� m�m sv� rozkazy.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//M��e� se k n�m p�idat, jestli chce�. Ale tv� rozhodnut� bude kone�n�.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//Jakmile na sob� bude� m�t zbroj domobrany, nebude� si ji moci jen tak sejmout a p�estat pat�it mezi n�s.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Jsi p�ipraven spole�n� s n�mi bojovat za Innose a kr�le?
	Info_ClearChoices(dia_andre_join);
	Info_AddChoice(dia_andre_join,"Je�t� si nejsem tak �pln� jist� ...",dia_andre_join_no);
	Info_AddChoice(dia_andre_join,"Jsem p�ipraven!",dia_andre_join_yes);
};

func void dia_andre_join_yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//Jsem p�ipraven!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Tak budi�. V�tej v domobran�.
	Npc_SetTrueGuild(other,GIL_MIL);
	other.guild = GIL_MIL;
	Snd_Play("LEVELUP");
	Npc_ExchangeRoutine(lothar,"START");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Tady m� svou zbroj.
	b_giveinvitems(self,other,itar_mil_l,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Nos ji hrd� a d�stojn�.
	SLD_AUFNAHME = LOG_OBSOLETE;
	KDF_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_SUCCESS;
	b_giveplayerxp(XP_BECOMEMILIZ);
	Info_ClearChoices(dia_andre_join);
};

func void dia_andre_join_no()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Je�t� si nejsem tak �pln� jist�.
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Pokud m� st�le n�jak� pochyby o sv�m rozhodnut�, nemohu t� p�ijmout do �ad domobrany.
	Info_ClearChoices(dia_andre_join);
};


instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_lordhagen_condition;
	information = dia_andre_lordhagen_info;
	permanent = FALSE;
	description = "Mohu te� kone�n� j�t za lordem Hagenem?";
};


func int dia_andre_lordhagen_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_lordhagen_info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Mohu te� kone�n� j�t za lordem Hagenem?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Nyn� jsi ve slu�b�ch paladin�. Vpust� t� dovnit�. Ale ve vlastn�m z�jmu bys m�l m�t na srdci n�co opravdu d�le�it�ho.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//To tak� m�m, nem�j obavy.
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//M�j na pam�ti, �e bude� mluvit s velitelem paladin�. Chovej se podle toho. Nebude� tam st�t jen za sebe, ale za celou domobranu.
};


instance DIA_ANDRE_WAFFE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_waffe_condition;
	information = dia_andre_waffe_info;
	permanent = FALSE;
	description = "Dostanu tak� n�jakou zbra�?";
};


func int dia_andre_waffe_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_waffe_info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//Dostanu tak� n�jakou zbra�?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Samoz�ejm�. Obvykle se o to star� Peck. Ale zd� se mi, �e jsem ho u� n�jakou dobu nevid�l.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Zjisti, kde se za��v�, a p�ive� ho sem. Pak od n�j nafasuje� zbra�.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//A pokud bys cht�l sp�t, m��e� si lehnout na n�kterou z postel� v kas�rn�ch.
	MIS_ANDRE_PECK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
	b_logentry(TOPIC_PECK,"Peck se toul� n�kde po m�st�. Pokud ho p�ivedu zp�tky do kas�ren, mohu od n�j dostat zbra�.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_peck_condition;
	information = dia_andre_found_peck_info;
	permanent = FALSE;
	description = "Poda�ilo se mi naj�t Pecka.";
};


func int dia_andre_found_peck_condition()
{
	if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_found_peck_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//Poda�ilo se mi naj�t Pecka.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Ano, u� je zp�t na sv�m m�st� a pln� sv� povinnosti. Kde jsi ho na�el?
	Info_ClearChoices(dia_andre_found_peck);
	Info_AddChoice(dia_andre_found_peck,"Zk��il mi cestu...",dia_andre_found_peck_somewhere);
	Info_AddChoice(dia_andre_found_peck,"U �erven� lucerni�ky...",dia_andre_found_peck_redlight);
};

func void dia_andre_found_peck_somewhere()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//Narazil jsem na n�j ve m�st�.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//Dobr�, tak jdi za n�m a vyzvedni si zbra�.
	MIS_ANDRE_PECK = LOG_OBSOLETE;
	b_giveplayerxp(XP_FOUNDPECK);
	Info_ClearChoices(dia_andre_found_peck);
};

func void dia_andre_found_peck_redlight()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//Byl u "�erven� lucerny".
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//Aha, tak�e m�sto aby se staral o sv� povinnosti, vysed�v� s d�v�aty.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//Asi s n�m budu muset prohodit p�r slov.
	b_giveplayerxp(XP_FOUNDPECK * 2);
	MIS_ANDRE_PECK = LOG_SUCCESS;
	Info_ClearChoices(dia_andre_found_peck);
};

func void b_andresold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Tady m� sv�j plat.
	b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};


instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_firstmission_condition;
	information = dia_andre_firstmission_info;
	permanent = FALSE;
	description = "M� pro m� n�jak� �kol?";
};


func int dia_andre_firstmission_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_andre_firstmission_info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//M� pro m� n�jak� �kol?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//V posledn� dob� stoupl ve m�st� prodej tr�vy z ba�in.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//Nem��eme dopustit, aby se to tady n�jak rozmohlo.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//Jinak by ka�d� za�al kou�it a nikdo by nebyl schopn� pracovat, nato� udr�et zbra�.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//To si nem��eme dovolit zvl᚝ te�, kdy� hroz� �tok sk�et� nebo �old�k�.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//M�m podez�en�, �e za t�m jsou ti �old�ci. Vsad�m se, �e to jsou oni, kdo to svinstvo p�in�� do m�sta.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//Co je na pr�ci?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Mortis, jeden z na�ich mu��, v p��stavn� kr�m� zaslechl, �e n�kam do p��stavn� �tvrti m�l dorazit bal�k tr�vy z ba�in.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Porozhl�dni se kolem a ten bal�k mi dones.
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
	b_logentry(TOPIC_WAREHOUSE,"Do p��stavu dorazil bal�k tr�vy z ba�in - Mortis se o tom dozv�d�l v m�stn� hospod�. J� m�m tu z�silku naj�t a don�st lordu Andreovi.");
};


instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_stuff_condition;
	information = dia_andre_found_stuff_info;
	permanent = TRUE;
	description = "Co se toho bal�ku t��e...";
};


func int dia_andre_found_stuff_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_found_stuff_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//Co se toho bal�ku t��e...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Na�el jsi ho?
	if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
	{
		Info_ClearChoices(dia_andre_found_stuff);
		if(Npc_HasItems(other,itmi_herbpaket) > 0)
		{
			Info_AddChoice(dia_andre_found_stuff,"Ano, tady je.",dia_andre_found_stuff_ja);
		};
		Info_AddChoice(dia_andre_found_stuff,"Hodil jsem ho do p��stavn� z�toky.",dia_andre_found_stuff_becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Zat�m ne.
	};
};

func void dia_andre_found_stuff_ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Ano, tady je.
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Dobr� pr�ce. Budeme tu tr�vu dob�e st�e�it.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_CIPHER_PAKET = LOG_FAILED;
	b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
	Info_ClearChoices(dia_andre_found_stuff);
};

func void dia_andre_found_stuff_becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//Hodil jsem ho do p��stavn� z�toky.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//V�n�? No, hlavn� �e u� nem��e padnout do �patn�ch rukou.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	b_giveplayerxp(XP_WAREHOUSE_SUPER);
	Info_ClearChoices(dia_andre_found_stuff);
};


instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_find_dealer_condition;
	information = dia_andre_find_dealer_info;
	permanent = FALSE;
	description = "M� pro m� n�jakou dal�� pr�ci?";
};


func int dia_andre_find_dealer_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_find_dealer_info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//M� pro m� n�jakou dal�� pr�ci?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//St�hnul jsi ten bal�k tr�vy z ob�hu - to je dob�e.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//R�d bych ale zjistil, kdo to roz�i�uje mezi lidi.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//Mus� to b�t n�kdo z p��stavn� �tvrti.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//Kdyby do m�sta n�kdo pravideln� p�ich�zel zven��, u� bychom ho d�vno chytili.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//Co p�esn� m�m ud�lat?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Najdi toho dealera a nech si od n�j n�jakou tu tr�vu prodat. Nebude to snadn�, ale jinak ho nem��eme zatknout.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Promluv si s Mortisem, vyzn� se v p��stavn� �tvrti. Mo�n� by ti mohl n�jak pomoci.
	MIS_ANDRE_REDLIGHT = LOG_RUNNING;
	b_startotherroutine(nadja,"SMOKE");
	Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
	b_logentry(TOPIC_REDLIGHT,"M�m naj�t chl�pka, co v p��stavi�ti k�eftuje s tr�vou z ba�in. Mus�m ho p�im�t, aby mi n�co ze sv�ch z�sob prodal. Mortis mi v tom m��e pomoci.");
};


instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_redlight_success_condition;
	information = dia_andre_redlight_success_info;
	permanent = TRUE;
	description = "Co se t� tr�vy t��e...";
};


func int dia_andre_redlight_success_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_redlight_success_info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//Co se t� tr�vy t��e...
	if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//Nemysl�m, �e bychom se v p��stavn� �tvrti n�co dozv�d�li.
		if(Npc_IsDead(borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Ne, kdy� je ten vyhazova� mrtv�.
		};
		if(NADJA_VICTIM == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//Ta d�vka z �erven� lucerny, Nadja, je mrtv�. Musela to b�t n�jak� podivn� nehoda.
			b_removenpc(nadja);
		};
		if(UNDERCOVER_FAILED == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//Nebyl jsi dostate�n� opatrn�.
		};
		MIS_ANDRE_REDLIGHT = LOG_FAILED;
		b_checklog();
	}
	else if(BORKA_DEAL == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//V�m, kdo tu tr�vu ve m�st� prod�v�. Je to Borka, dve�n�k od �erven� lucerny.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//V�n�? M�me n�jak� d�kaz?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//Trochu t� tr�vy mi prodal.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//V�born�, to n�m sta��. Okam�it� ho nech�m zatknout.
		b_startotherroutine(borka,"PRISON");
		MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
		b_giveplayerxp(XP_REDLIGHT);
		b_andresold();
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//... Je�t� na tom pracuju.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Dobr�, a nezapome�, �e mus� toho chlap�ka p�esv�d�it, aby s tebou uzav�el obchod.
	};
};


instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_hilfbauerlobart_condition;
	information = dia_andre_hilfbauerlobart_info;
	description = "M� pro m� n�jak� dal�� �kol?";
};


func int dia_andre_hilfbauerlobart_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_hilfbauerlobart_info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//M� pro m� n�jak� dal�� �kol?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//Farm�� Lobart m� na sv�ch pol�ch n�jak� probl�my.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//Pokud mu pom��eme, upevn�me jeho vztahy s m�stem. Jdi tedy za n�m a zjisti, co se d�je.
	Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
	b_logentry(TOPIC_FELDRAEUBER,"Andre m� poslal na Lobart�v statek. M�m mu pomoci ho d�t znovu do po��dku.");
	MIS_ANDREHELPLOBART = LOG_RUNNING;
	Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
	b_startotherroutine(vino,"BUGSTHERE");
	b_startotherroutine(lobartsbauer1,"BUGSTHERE");
	b_startotherroutine(lobartsbauer2,"BUGSTHERE");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_lobart_success_condition;
	information = dia_andre_lobart_success_info;
	description = "Pomohl jsem Lobartovi.";
};


func int dia_andre_lobart_success_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_lobart_success_info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//Pomohl jsem Lobartovi.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//V�born�. Pokud bude Lobart spokojen�, bude m�stu i nad�le prod�vat sv� tu��ny.
	b_giveplayerxp(XP_LOBARTBUGS);
	b_andresold();
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople_condition;
	information = dia_addon_andre_missingpeople_info;
	description = "Co je s t�mi chyb�j�c�mi lidmi?";
};


func int dia_addon_andre_missingpeople_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//Co je s t�mi chyb�j�c�mi lidmi?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//Co by?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//Nesna��te se je naj�t?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//Dostal jsem rozkaz od lorda Hagena chr�nit m�sto a jeho okol�.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//A to znamen�, �e budu chr�nit lidi, kte�� jsou st�le TADY.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//Hl�dky domobrany jsou ka�dou noc v ulic�ch. Nem��u ud�lat v�c.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//A TY se bude� starat o ten �kol, co jsem ti dal, rozum�ls?
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE2(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople2_condition;
	information = dia_addon_andre_missingpeople2_info;
	description = "Ohledn� t�ch chyb�j�c�ch lid� ...";
};


func int dia_addon_andre_missingpeople2_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild != GIL_MIL) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople2_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//Ohledn� t�ch chyb�j�c�ch lid� ...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//Klidn� se o ty f�my starej. J� m�m vlastn�ch probl�m� dost.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_RETURNEDMISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_returnedmissingpeople_condition;
	information = dia_addon_andre_returnedmissingpeople_info;
	description = "Poda�ilo se mi p�r t�ch chyb�j�c�ch lid� zachr�nit.";
};


func int dia_addon_andre_returnedmissingpeople_condition()
{
	if((MISSINGPEOPLERETURNEDHOME == TRUE) && (MIS_ADDON_ANDRE_MISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_andre_returnedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//Poda�ilo se mi p�r t�ch chyb�j�c�ch lid� zachr�nit.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//U� m� za��nalo zaj�mat, kde ses tak dlouho toulal!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//Ty jsi �len domobrany! Takov� v�ci se t� net�kaj�!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//Ale ...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//Kolik lid� jsi na�el?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//V�echny, kte�� byli je�t� na�ivu ...
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//V�echny?! J� ... on ...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//Jsem na tebe hrd�! Jsem nad�en�, �e jsem t� sem p�ijal.
		b_andresold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//Byl to t�k� �kol.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ANDRE_MISSINGPEOPLE);
};

func void b_andre_gotolordhagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//M�l bys j�t p��mo za n�m.
};


instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachen_condition;
	information = dia_andre_berichtdrachen_info;
	permanent = FALSE;
	description = "Byl jsem v Hornick�m �dol� a vid�l jsem draky!";
};


func int dia_andre_berichtdrachen_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachen_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//Byl jsem v Hornick�m �dol� a vid�l jsem draky!
	if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//M�m dopis od velitele Garonda, kter� m� slova potvrzuje.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//To bude lorda Hagena zaj�mat!
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_bennetinprison_condition;
	information = dia_andre_bennetinprison_info;
	permanent = TRUE;
	description = "A co Bennet, ten kov��?";
};


func int dia_andre_bennetinprison_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_bennetinprison_info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//A co Bennet, ten kov��?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//Mysl� toho �old�ka? Sed� ve v�zen�, kam pat��.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Mohu s n�m mluvit?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Jist�, jak je libo. Ale pokud se pokus� pomoci mu k �t�ku, sko�� tam tak�.
};


instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_cornelius_liar_condition;
	information = dia_andre_cornelius_liar_info;
	permanent = TRUE;
	description = "Mysl�m, �e Cornelius l�e.";
};


func int dia_andre_cornelius_liar_condition()
{
	if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_cornelius_liar_info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//Mysl�m, �e Cornelius l�e.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Jsi si jist�?
	Info_ClearChoices(dia_andre_cornelius_liar);
	Info_AddChoice(dia_andre_cornelius_liar,"Ne. O tom se mus� dozv�d�t lord Hagen.",dia_andre_cornelius_liar_no);
	Info_AddChoice(dia_andre_cornelius_liar,"Ano.",dia_andre_cornelius_liar_yes);
};

func void dia_andre_cornelius_liar_no()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//V tom p��pad� bys nem�l sv� podez�en� tak ze�iroka roztrubovat.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Cornelius je vlivn� mu�. Mohl by ti ud�lat ze �ivota peklo, kdyby cht�l.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//Pokud nem� ��dn� d�kaz, nemohu ti pomoci.
	Info_ClearChoices(dia_andre_cornelius_liar);
};

func void dia_andre_cornelius_liar_yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//Co za d�kaz m�?
	if(CORNELIUS_ISLIAR == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//�etl jsem jeho den�k! Podplatili ho. V�echno je jen sn��ka l��.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//Pokud to je skute�n� tak, mus� j�t okam�it� za lordem Hagenem.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Uka� mu ten den�k. On u� se postar� o zbytek.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Ehm, no, mysl�m...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//Pot�ebuji d�kaz, ne podez�en�. Se�e� d�kaz, pak pro tebe budu moci n�co ud�lat.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//Do t� doby by sis m�l rad�ji d�vat pozor na jazyk.
	};
	Info_ClearChoices(dia_andre_cornelius_liar);
};


instance DIA_ANDRE_PALADIN(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_paladin_condition;
	information = dia_andre_paladin_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_paladin_condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_andre_paladin_info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//Tak�e nyn� jsi paladin! Gratuluji!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//U� od za��tku jsem si myslel, �e nez�stane� u domobrany dlouho.
};


instance DIA_ANDRE_PERM(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_perm_condition;
	information = dia_andre_perm_info;
	permanent = TRUE;
	description = "Jak to vypad� ve m�st�?";
};


func int dia_andre_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_perm_info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//Jak to vypad� ve m�st�?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//V�echno je pod kontrolou.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Pokra�uj ve sv�m posl�n�.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//Od t�to chv�le se hl�s� p��mo lordu Hagenovi. B� si s n�m promluvit.
	};
};


instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachentot_condition;
	information = dia_andre_berichtdrachentot_info;
	permanent = FALSE;
	description = "Pobil jsem v�echny draky v Hornick�m �dol�!";
};


func int dia_andre_berichtdrachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachentot_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//Pobil jsem v�echny draky v Hornick�m �dol�!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//Pokud to je pravda, mus� o tom ��ct lordu Hagenovi.
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichttorauf_condition;
	information = dia_andre_berichttorauf_info;
	permanent = FALSE;
	description = "Na hrad v Hornick�m �dol� za�to�ili sk�eti!";
};


func int dia_andre_berichttorauf_condition()
{
	if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
	{
		return TRUE;
	};
};

func void dia_andre_berichttorauf_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//Na hrad v Hornick�m �dol� za�to�ili sk�eti!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//Ne! O tom se mus� dozv�d�t lord Hagen.
	b_andre_gotolordhagen();
};

