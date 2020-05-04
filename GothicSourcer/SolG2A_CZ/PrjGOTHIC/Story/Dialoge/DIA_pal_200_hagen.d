
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Dob�e �e jsi p�i�el. M��e� hned zaplatit tu pokutu.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Nebere� z�kony m�sta moc v�n�, co?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Seznam tv�ch proh�e�k� zase narostl.
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//A ne��kej mi, �es to nev�d�l!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Zaplat� maxim�ln� pokutu.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//No, zd� se, �e se situace zm�nila.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Nejsou u� ��dn� sv�dkov� tv� vra�dy!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Nikdo u� nebude sv�d�it, �e t� vid�l kr�st!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//U� nezbyli ��dn� sv�dci t� tv� rva�ky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//V�echna obvin�n� proti tob� byla sta�ena.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Nev�m, co se tam ve m�st� stalo - a ani to v�d�t nechci.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//D�vej si prost� pozor, aby ses tady nedostal do probl�m�.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//Tak nebo tak, rozhodl jsem se prominout ti tv� dluhy.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Dej si pozor, a� se nedostane� do ��dn�ch dal��ch nesn�z�.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Nakonec stejn� zaplat� v�echny sv� z�vazky v pln� v��i.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Tak co, chce� zaplatit?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"Nem�m dost pen�z!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"Kolik to bylo?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"Nem�m dost pen�z!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"Kolik �e to bylo?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Tv� pov�st t� p�edch�z�. Poru�il jsi z�kony m�sta.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Dostal ses do p�kn� �lamastyky.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Vra�da je v�n� zlo�in!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Nemluv� o tv�ch dal��ch proh�e�c�ch.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Str�e maj� p��kazy na m�st� popravit ka�d�ho vraha.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Vra�da je v tomto m�st� nep��pustn�. M��e� v�ak d�t svou l�tost najevo zaplacen�m pokuty.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Jsi obvin�n z kr�de�e!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Nemluv� o dal��ch v�cech, kter� se ke mn� donesly.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//To je poru�en� m�stsk�ch z�kon�. Za to zaplat�.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Zapletl ses do rva�ky. T�m p�dem jsi poru�il z�kon.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//A co to bylo s tou ovc�?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Poru�en� z�kon� m�sta je poru�en�m z�kon� samotn�ho Innose.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Bude� za to muset zaplatit.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Zasedl sis na na�e ovce - poprv� jsem tomu ani necht�l v��it.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Pro� se mus�m po��d zaob�rat takov�mi prkotinami?
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Bude� muset zaplatit n�hradu �kody!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Kolik?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"Nem�m dost pen�z!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Dobr�! Dohl�dnu na to, aby se o tom dozv�d�l ka�d� ve m�st� - to ti alespo� ��ste�n� vylep�� reputaci.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//Nem�m dost pen�z!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Tak si n�jak� co nejrychleji se�e�.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//A varuji t�: jestli se provin� je�t� n���m, jen si to zhor��.
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//U� jsem o tob� sly�el.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar mi ozn�mil, �e pr� se mnou chce� mluvit.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Jsi ten cizinec, kter� se do�aduje Innosova oka.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Jsem lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Kr�lovsk� paladin, v�le�n�k na�eho P�na Innose a nejvy��� velitel Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//M�m spoustu pr�ce. Tak�e nepl�tvej m�m �asem - a rad�ji mi �ekni, pro� tu jsi.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "P�in��m n�vrh p��m��� od �oldn���!";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//P�in��m n�vrh p��m��� od �oldn���!
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(nevrle) Hm - uka�!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Gener�la Leeho zn�m. V�m tak� o okolnostech, za jak�ch byl odsouzen k nucen�m pracem v kolonii.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Pova�uji ho za �estn�ho mu�e. Jsem ochoten mu jeho proh�e�ky odpustit - ale jenom jemu!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//To se net�k� jeho mu��. V�t�ina z nich jsou hanebn� hrdlo�ezov� a sv�j trest si pln� zasluhuj�!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Jim rozhodn� nic neprominu. M��e� jim to ozn�mit.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Je to v�echno?
	};
	b_logentry(TOPIC_FRIEDEN,"Lord Hagen je ochoten zprostit viny Leeho, ale nikoliv ostatn� �oldn��e.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "Nedaleko se shroma��uj� z�stupy zl�ch stv�r. V Hornick�m �dol�.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Nedaleko se shroma��uj� z�stupy zl�ch stv�r. V Hornick�m �dol�.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//V Hornick�m �dol�? Vyslali jsme tam v�pravu. Neust�le n�m doch�zej� zpr�vy o tom, �e pr�smyk okupuj� sk�eti.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Ale o arm�d� Zla se ke mn� je�t� nic nedoneslo.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Nen� to jen n�jak� uboh� trik, kter� m� m� p�esv�d�it o nezbytnosti spojit s�ly se �oldn��i?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Ne.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(skepticky) Co to m� b�t za arm�du?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Arm�da drak�, kter� kolem sebe shrom�dila z�stupy p�isluhova��.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Draci? Podle star�ch spis� to u� je n�kolik stolet�, co n�kdo naposledy vid�l draka.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Pov�z - pro� bych m�l v��it jedin�mu tv�mu slovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Jenom�e ot�zka nen�, jestli mi m��e� v��it. Ot�zka je, jestli si m��e� dovolit mi NEV��IT v p��pad�, �e mluv�m pravdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Dokud nebudu m�t d�kaz, nemohu tam vyslat v�ce mu��.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = TRUE;
	description = "Tak�e chce�, abych ti p�inesl n�jak� d�kaz?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (HAGEN_BRINGPROOF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//Tak�e chce�, abych ti p�inesl n�jak� d�kaz?
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//P�esn� tak. Projdi pr�smykem a dosta� se do Hornick�ho �dol�. A� tam bude�, najdi mou v�pravu - a a� se ti to poda��, promluv si s velitelem Garondem.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Pokud n�kdo v�, jak� tam panuje situace, tak je to on.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//Jestli tvoje slova potvrd�, jsem p�ipraven ti pomoci.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Znamen� to, �e mi pak d� Innosovo oko?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Innosovo oko... dobr�. P�ines mi d�kaz a j� pak dohl�dnu na to, abys sm�l nosit ten amulet.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//M�m tedy v tomto ohledu tvoje slovo?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Samoz�ejm� - m� ho m�t.
		HAGEN_BRINGPROOF = TRUE;
	}
	else
	{
		if(hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED_NOV,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED,-1,-1,FONT_SCREEN,2);
		};
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "Co v� o Innosovu oku?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Co v� o Innosovu oku?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//Je to posv�tn� artefakt. (zaduman�) Ve star�ch proroctv�ch se ��k�, �e je n�jak spojen s draky.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//V t�chto spisech je ale tak� zm�nka o tom, �e jej m��e nosit jen Innos�v Vyvolen�.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//J� jsem Innos�v Vyvolen�!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Potom mo�n� bude� moci ten amulet nosit.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "Jak se m�m dostat p�es ten pr�smyk?";
};


func int dia_lord_hagen_pass_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Jak se m�m dostat p�es ten pr�smyk?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//D�m ti kl�� od vrat v pr�smyku. Bude� si ale muset naj�t zp�sob, jak proklouznout mezi vojskem sk�et�.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Nech� t� Innos ochra�uje.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Lord Hagen si ��d� d�kaz, �e arm�da zla skute�n� existuje. Mus�m se vydat do Hornick�ho �dol� a promluvit si s velitelem Garondem.");
	if(FERNANDO_IMKNAST == FALSE)
	{
		b_startotherroutine(fernando,"WAIT");
	};
	Wld_InsertNpc(bdt_1020_bandit_l,"NW_TROLLAREA_PATH_47");
};


instance DIA_ADDON_LORD_HAGEN_ORNAMENT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 10;
	condition = dia_addon_lord_hagen_ornament_condition;
	information = dia_addon_lord_hagen_ornament_info;
	description = "Hled�m kovovou ozdobu. M�la by b�t u kamenn�ho kruhu bl�zko Lobartovy farmy.";
};


func int dia_addon_lord_hagen_ornament_condition()
{
	if((MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING) && (LORD_HAGEN_GOTORNAMENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lord_hagen_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//Hled�m kovovou ozdobu. M�la by b�t u kamenn�ho kruhu bl�zko Lobartovy farmy.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//Pokud mysl� tenhle kus tady ... mysleli jsme si, �e by to mohla b�t magicka runa, ale ta v�c je �pln� bezcenn�.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//M��e� si to vz�t. Nem�m pro to ��dne vyu�it�.
	CreateInvItems(self,itmi_ornament_addon,1);
	b_giveinvitems(self,other,itmi_ornament_addon,1);
	LORD_HAGEN_GOTORNAMENT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Pro� jste p�i�li do Khorinisu?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Pro� jste p�i�li do Khorinisu?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Pln�me d�le�it� �kol ve prosp�ch kr�lovstv�. Na�e rozkazy poch�zej� p��mo od kr�le Rhobara.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//�ekl jsem ti, �e jsme poslali v�pravu do Hornick�ho �dol�. Proto tu jsme.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "Co d�laj� va�i mu�i v Hornick�m �dol�?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//Co d�laj� va�i mu�i v Hornick�m �dol�?
	if(HAGEN_BRINGPROOF == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Nevid�m d�vod, pro� bych ti m�l ��kat n�co takov�ho!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//Byl jsi tam. M�l bys to v�d�t.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//Dobr�, proto�e tam m� tak jako tak nam��eno, tak ti to m��u ��ct.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Jde o magickou rudu. M��e rozhodnout o v�sledku v�lky.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Bez dostatku zbran� ukut�ch z magick� rudy nem� kr�lovsk� arm�da ani tu nejmen�� �anci obst�t v boji proti elitn�m sk�et�m v�le�n�k�m.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//A doly tady na ostrov� jsou posledn�, ke kter�m je�t� m�me p��stup.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Jakmile na�i lo� pln� nalo��me rudou, vr�t�me se zp�tky na pevninu.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//V�lka se sk�ety se tedy nevyv�j� moc dob�e, co?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//U� tak jsem toho �ekl v�c, ne� je zdr�vo.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "Hled�m mistra me�e.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Hled�m mistra me�e.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//V�n�? Jednoho jsi pr�v� na�el.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Lord Hagen m� zasv�t� do taj� boje s obouru�n�mi zbran�mi.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Tak za�n�me (osvojit si dovednost obouru�n�ho boje).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Za�n�me.
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Te� jsi s�m dobr�m mistrem me�e. U� t� nemohu d�l u�it.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Nech� tv� dal�� skutky prov�d� moudrost mistra me�e.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "Cht�l bych vstoupit do slu�by ��du.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Cht�l bych vstoupit do slu�by ��du.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Dobr�, u� jsi dok�zal, �e m� dost odvahy, schopnosti a zku�enost�, abys mohl slou�it Innosovi.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Tv� skutky jsou dostate�n�m d�kazem �ist�ho srdce.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Je-li to tv� p��n�, v�t�m t� v na�em ��du.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"Je�t� si nejsem tak �pln� jist�.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"Jsem p�ipraven!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//B�t Innosov�m v�le�n�kem znamen� zasv�tit v�echny sv� �iny Innosov�m z�m�r�m.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Do ��du jsou p�ijati jen nej�estn�j�� a nejstate�n�j�� v�le�n�ci.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Pokud jsi pevn� rozhodnut st�t se paladinem, mus� nejprve prok�zat, �e jsi toho hoden.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Je�t� si nejsem tak �pln� jist�.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Tak jdi a o�isti sv� srdce od pochybnost�. Vra� se, a� bude� p�ipraven.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Jsem p�ipraven!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(v�n�) Tak budi� dle tv� v�le!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//(v�n�) Mnoho mu�� se vydalo touto cestou a polo�ili sv� �ivoty ve jm�nu Innose.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//(v�n�) P��sah�, �e tv� skutky budou d�lat jejich smrti �est a budou hl�sat sl�vu Innosovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//P��sah�m!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Od t�to chv�le t� tedy prohla�uji �lenem na�eho spole�enstva.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Z�rove� t� ustanovuji Innosov�m v�le�n�kem.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//D�v�m ti zbran� a zbroj ryt��e. Nos je s hrdost�, ryt��i!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//D�le, na z�klad� tv� hodnosti ti dovoluji p��stup do kl�tera.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht t� nau�� na�� magii, sta��, kdy� za n�m p�jde� a promluv� si s n�m.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//A jsou ti samoz�ejm� otev�eny na�e ubikace na horn�m konci m�sta.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "Jak mohu dok�zat, �e jsem toho hoden?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Jak mohu dok�zat, �e jsem toho hoden?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//To prok�� tv� skutky.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//Bojujeme v Innosovu jm�nu za svobodu a spravedlnost.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Bojujeme proti Beliarovi a jeho poh�nk�m, kte�� cht�j� zni�it Innos�v ��d.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Rozum�m.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//V�bec ni�emu nerozum�! Na�e �est je n� �ivot a n� �ivot je Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Ka�d� paladin, jen� se spravedliv� bije, ���� d�l sl�vu Innose a mnoz� z n�s ji� polo�ili �ivot na olt�� v��n�ho boje dobra a zla.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//My v�ichni ct�me tuto tradici. Pokud sel�eme, po�pin�me skutky na�ich padl�ch druh�.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Jen ten, kdo tohle beze zbytku pochop�, je hoden st�t se paladinem.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jak to vypad�?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Mus�m naj�t zp�sob, jak tuhle v�pravu zachr�nit.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Mus�me s t�mi draky n�co ud�lat.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(k sob�) Mo�n� by n�s te� mohlo zachr�nit Innosovo oko.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Asi jsem p�i�el o rozum. Jsem voj�k, ne byrokrat.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//S t�mhle v��m pap�rov�n�m, kter� m�m na krku, si sotva dok�u vzpomenout, jak� to je t��mat me�.
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "J� Oko m�m - ale je rozbit�.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//J� Oko m�m - ale je rozbit�.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//CO�E? U Innose! Cos to ud�lal? To Oko pot�ebujeme!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Promluv si s Pyrokarem! Mus� existovat n�jak� zp�sob, jak jej zase opravit.
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "P�in��m novinky od Garonda. Dal mi pro tebe tenhle dopis.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//P�in��m novinky od Garonda. Dal mi pro tebe tenhle dopis.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Na�e postaven� je hor��, ne� jsem se ob�val. Ale podej mi hl�en� o situaci v Hornick�m �dol�.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Paladinov� jsou obkl��eni na hrad� v Hornick�m �dol�, v�ude kolem jsou sk�eti.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//P�i dolov�n� byly obrovsk� ztr�ty a skoro ��dn� ruda u� nezb�v�.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//No, pokud m��u ��ct sv�j n�zor, tak kdy� t�m chlap�k�m nikdo nepom��e, jsou ztraceni. Tak to alespo� vypad�.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Najdu zp�sob, jak tu v�pravu zachr�nit. Ud�lal jsi toho pro n�s tolik. Innos se ti odvd���.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Nechci jeho vd��nost. Chci jeho oko.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Ano, samoz�ejm�. Pln�m sv� sliby. Vezmi si tenhle dopis. Otev�e ti br�ny kl�tera.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Promluv si s Pyrokarem, nejvy���m ohniv�m m�gem, a proka� se mu touhle listinou. Za��d� ti p��stup k Innosovu oku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//A je�t� n�co, ne� p�jde�.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//Na d�kaz m� vd��nosti si vezmi tuhle runu. P�enese t� bezpe�n� zp�tky do m�sta, kdykoliv si zamane�.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Lord Hagen mi p�edal zpr�vu, kter� p�im�je mistra Pyrokara, aby mi v kl�te�e vydal Innosovo oko.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "Pot�eboval bych si s tebou promluvit o Bennetovi.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Pot�eboval bych si s tebou promluvit o Bennetovi.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Ale to je p�ece ten �old�k, co zavra�dil jednoho z m�ch mu��.
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Jak si m��e� b�t tak jist�, �e je vrahem pr�v� Bennet?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"V���m, �e je Bennet nevinn�.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Bennet by n�m mohl pomoci opravit Innosovo oko.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Bennet by n�m mohl pomoci opravit Innosovo oko.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//I kdyby dok�zal p�it�hnout na zem moc samotn�ho Innose...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//Zavra�dil paladina. Za to bude popraven!
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Jak si m��e� b�t tak jist�, �e je vrahem pr�v� Bennet?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//M�me sv�dka.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Jak vid�, nen� o vin� toho �old�ka ��dn�ch pochyb.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Kdo je t�m sv�dkem?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, tajemn�k m�stodr��c�ho. On tu vra�du vid�l.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Jeho popis padne bez jak�chkoliv pochyb na Benneta. Co se m� t��e, v�c je vy��zena.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Ten �old�k bude viset za velezradu.
	b_logentry(TOPIC_RESCUEBENNET,"Sv�dkem je tajemn�k m�stodr��c�ho, Cornelius. Tvrd�, �e celou vra�du vid�l.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//V���m, �e je Bennet nevinn�.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//D�kazy jsou jasn�. Je vinen.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//A co kdy� je d�kaz myln�?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//D�vej pozor, co ��k�. Vzn�� v�n� obvin�n�.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Pokud mi nem��e� p�edlo�it d�kazy o tom, �e sv�dek lhal, rad�ji ml�.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Cornelius lhal.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius lhal.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Jak to v�?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//M�m jeho den�k. Je v n�m v�echno.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(zu�iv�) Ten slizk� bastard!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//Pod vahou nov�ch d�kaz� mi nic jin�ho nezb�v�.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Z moci ��adu sv��en�ho mi kr�lem a c�rkv� prohla�uji...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//... �e v�ze� Bennet je zbaven v�ech obvin�n� a tud� svobodn� �lov�k.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Cornelius bude s okam�itou platnost� vzat do vazby pro k�ivop��se�nictv�.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//U�et�i si n�mahu. Cornelius je mrtv�.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//V tom p��pad� se mu ji� dostalo spravedliv�ho trestu. Dobr� pr�ce.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Ukr�v� se.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//D��ve nebo pozd�ji se objev�. Pak ho zatkneme.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Tv� skutky jsou ke cti n�s v�ech.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "P�in��m Oko!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//P�in��m Oko!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(uctiv�) Nese� Oko!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//A dal jsi jej zp�t dohromady!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//V tom p��pad� jsi Innos�v Vyvolen�!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Vyraz�m na cestu a zabiju v�echny draky v Hornick�m �dol�!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Nech� t� Innos doprov�z� a svou moc� zni�� Zlo!
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "Na zemi �to�� elitn� sk�et� v�le�n�ci.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Na zemi �to�� elitn� sk�et� v�le�n�ci.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Zpravil jsem lorda Hagena o postupuj�c�ch tlup�ch sk�et�ch n�jezdn�k�.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Co t� k tomu vede?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Mluvil jsem s jedn�m z nich. Padlo tvoje jm�no.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Nesmysl. Moji lid� zat�m ��dnou masivn� invazi sk�et� nehl�sili.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Mo�n� se v nedalek�ch les�ch ztratil n�kter� z jejich zv�d�.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Nebyli to ��dn� zv�dov�. Jednomu z nich jsem vzal tento prsten.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Uka� mi ho.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Hmm. Tak to je docela znepokojiv�.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//Tohle je znamen� jejich moci. Tak�e sk�eti opustili sv� palis�dy a bojuj� na otev�en�m prostranstv�.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Zat�m jsem jich moc nevid�l. Hlavn� jejich velitele a jen p�r bojovn�k�.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//V�n�? V tom p��pad� musej� m�t za lubem n�co jin�ho. To mi ke sk�et�m moc nesedne, �e by jejich v�dci sami opustili sv� ochrann� palis�dy.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Mohla by to v�ak b�t ide�ln� p��le�itost, jak jim u�t�d�it citeln� �der.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Pokud by p�i�li o sv� velitele, spadne jim mor�lka na bod mrazu.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//M� nov� �kol, ryt��i. Zabij v�echny sk�et� velitele, kter� v t�hle oblasti najde�.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//P�ines mi jejich prsteny. To by mohlo sk�ety srazit na kolena.
		b_logentry(TOPIC_ORCELITE,"Poda�ilo se mi p�in�st lordu Hagenovi d�kaz - prsten sk�et�ho vojev�dce. Po��dal m�, abych mu p�inesl v�echny, kter� najdu.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Pora� se s Ingmarem. M��e ti prozradit p�r taktik, kter� by se ti p�i boj�ch se sk�et�mi veliteli mohly hodit.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Sk�et� elitn� bojovn�ci jsou jeho specialita. M�l s nimi �asto co do �in�n�.
			b_logentry(TOPIC_ORCELITE,"Elitn� sk�et� v�le�n�ci jsou Ingmarovou specialitou.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Tvoje pouh� tvrzen�, �e jsi zabil jednoho ze sk�et�ch velitel�, mi nesta��.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Pokud to nem�m br�t na lehkou v�hu, pot�ebuji n�jak� hmatateln�j�� d�kaz.
		b_logentry(TOPIC_ORCELITE,"Hagen mi po��d nechce v��it. ��d� d�kaz, �e elitn� v�le�n�ci skute�n� �to�� na civilizovan� kraje. No, sp� by m� p�ekvapilo, kdyby to bylo naopak.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "Je tady je�t� jedna v�c, kterou mus�m ohledn� t�ch sk�et�ch velitel� nahl�sit.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Je tady je�t� jedna v�c, kterou mus�m ohledn� t�ch sk�et�ch velitel� nahl�sit.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Tak pov�dej.
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//M�m pro tebe dal�� sk�et� prsten.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//M�m pro tebe dal�� sk�et� prsteny.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Jsem na tebe hrd�. Jen tak d�l!
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//Mo�n� tam je�t� n�kde n�jak� je.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Brzy je sraz�me na kolena.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//V�n� by m� p�ekvapilo, kdyby se jich tu potulovalo o mnoho v�c.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Jejich prsteny mi samoz�ejm� m��e� nosit i nad�le, ale mysl�m, �e sk�eti u� n� vzkaz pochopili.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Vezmi si. Tady m� n�jak� zlato na sv� vybaven�.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "Draci jsou mrtv�.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Draci jsou mrtv�.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//V�d�l jsem, �e ti Innos d� s�lu porazit draky!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Kde je ruda?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Sk�eti je�t� po��d obl�haj� hrad v Hornick�m �dol�. Garond nem� ��dnou �anci opevn�n� opustit, dokud obl�h�n� neskon��.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(zu�iv�) Zatracen�!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Jestli�e Garond nedok�e tu situaci zvl�dnout, budu se o to muset postarat s�m.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//P�r sk�et� m� nezastav�! M� ne!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//U� jsem informoval sv� mu�e. Jsme p�ipraveni k odjezdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Pojedeme V�ICHNI. Nech�m na lodi jen nezbytnou pos�dku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//To by m�lo sta�it na to, abychom s t�mi sk�ety kone�n� zametli!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "Pot�ebuji lo�.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Pot�ebuji lo�.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//To hodn� lid�, voj�ku.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//(zasm�je se) To sly��m skoro ka�d� den, ctihodnosti. Ale...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//Nem� dokonce ani kapit�na, o pos�dce nemluv�.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//Co ta lo� v p��stavu?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Ta je moje a moje tak� z�stane. A� nadejde �as, odvezeme s n� rudu.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Ale a� to bude za n�mi, m��e� se m� zeptat znovu.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "Sk�eti vtrhli do hradu v Hornick�m �dol�!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Sk�eti vtrhli do hradu v Hornick�m �dol�!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//U Innose! Co p�esn� se tam stalo?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//N�jak se musela otev��t br�na.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//N�jak?! Jak by to bylo mo�n�... Na hrad� mus� b�t zr�dce!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "Na co �ek�?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Na co �ek�?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//�ek�me na v�stroj a proviant. Pak vyraz�me!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Te�, kdy� jsou na hrad� sk�eti, pot�ebujeme proviantu je�t� v�c ne� p�edt�m.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//To ale n� odchod o moc nezdr��.
	};
};

