
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Nem�me se o �em bavit, dokud nezaplat� pokutu.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//A ta podle posledn�ch obvin�n� zase stoupla.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Zd� se, �e ses zapletl do dal��ch pot��.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Ale douf�m, �e to kone�n� v�echno zaplat�! Dohromady to d�l�...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//V�n� jsi m� zklamal. Tvoje pokuta je...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Objevilo se p�r nov�ch skute�nost�.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Z ni�eho nic u� nejsi obvin�n� z vra�dy.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Nikdo si nevzpom�n�, �e by t� vid�l kr�st.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//U� nen� nikdo, kdo by tvrdil, �e t� vid�l zapleten�ho do n�jak� rva�ky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Zd� se, �e v�echna obvin�n� proti tob� byla sta�ena.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Netu��m, o co tam �lo, ale varuju t�: nep�eh�n�j to!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Rozhodl jsem se zapomenout na tv� dluhy.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//A u� se na hrad� nezapl�tej do ��dn�ch pot��!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//Jedno si vyjasn�me: tak jako tak bude� muset zaplatit pokutu v pln� v��i.
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//No, tak�e co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"Nem�m dost pen�z!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"Kolik �e to bylo?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"Nem�m dost pen�z!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"Kolik �e to bylo?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Tak�e to jsi ty, kdo d�l� na hrad� probl�my.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//��kal jsem si, kdy za mnou kone�n� zav�t�.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Vra�da je p�esn� to posledn�, co tady pot�ebujeme.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Pot�ebuji ka�d�ho ze sv�ch lid� - a te� m�m o jednoho m��!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//A to nemluv�m o t�ch dal��ch v�cech, do kter�ch ses zapletl.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//N�co ti vysv�tl�m. V�ichni jsme tady ve stejn� pasti.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//A zoufale pot�ebuji ka�d�ho ze sv�ch mu��. V�etn� tebe.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Pokud chce� mermomoc� n�koho zab�t, sta��, kdy� odejde� z hradu. Je tam spousta sk�et�.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Ukl�d�m ti pokutu - i kdy� m� v�n� �tve, �e se mus�m zab�vat v�cmi jako je tohle.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//�u�k� se, �e si tu a tam p�ilep�� z v�c�, kter� ti ne��kaj� pane.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//A to nemluv�m o dal��ch v�cech, kter� se ke mn� donesly.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Z toho se jen tak nevyvl�kne�. Zd� se, �e nech�pe� v�nost na�� situace.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Bude� muset zaplatit pokutu, kter� by vyrovnala tv� zlo�iny!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Rva�ky mezi mu�stvem nevid�m r�d.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//A to s tou ovc� bylo tak� zcela zbyte�n�.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Tak�e bude� muset zaplatit pokutu!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Ty jen tak zab�j� ovce? Pat�� n�m v�em.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Zaplat� mi za to maso.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Kolik?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"Nem�m dost pen�z!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Dobr�, �eknu chlapc�m, aby se uklidnili. Ale b�da ti, jestli t� je�t� jednou p�istihnu p�i n��em takov�m!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//Nem�m dost pen�z!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//V tom p��pad� by sis m�l n�jak� rychle sehnat.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//A varuju t�: jestli se zaplete� je�t� do n��eho, tak se ta ��stka je�t� zv���!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Odkud jsi p�i�el? Nejsi ��dn� z horn�k� a ani ��dn� z m�ch mu��. No?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//P�i�el jsem skrz pr�smyk.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Skrz pr�smyk...? Ty jsi v�n� pro�el - u Innose!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Pro� jsi tu cestu podstupoval, m�gu?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Jak� jsou tvoje rozkazy, voj�ku?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Vrt� mi hlavou, pro� by cht�l �old�k n�co takov�ho. Co tady d�l�?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "P�ich�z�m od lorda Hagena. Chce, abych mu donesl d�kaz o p��tomnosti drak�.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//P�ich�z�m od lorda Hagena. Chce, abych mu donesl d�kaz o p��tomnosti drak�.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//A to jsi p�i�el jen proto, abys jej sebral a zase zmizel?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//P�esn� to jsem m�l v pl�nu.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//Tak�e on chce d�kaz? M��e ho m�t. Ale nem��u t� poslat zp�tky za lordem Hagenem, ani� bych mu �ekl o rud�.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Poslouchej - lord Hagen se mus� bezpodm�ne�n� dozv�d�t o zdej�� situaci a o tom, kolik rudy se n�m poda�ilo vydolovat.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//Dobr�, co chce�, abych pro tebe ud�lal?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//M�m tam t�i skupiny horn�k�, ale je�t� jsem od nich nevid�l ani zrnko.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Obejdi v�echny doly a nahlas mi, kolik rudy u� maj�.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Pak ti nap�u dopis, kter� donese� zp�tky lordu Hagenovi.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Dobr�. Zd� se, �e nem�m na v�b�r.
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Je�t� ne� m� velitel Garond po�le zp�tky, chce, abych nalezl t�i skupiny kop��� a zjistil, kolik rudy u� z�skali.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Velitel Garond m� pov��il dal��m posl�n�m. U� p�ed �asem vyslal t�i odd�ly kop���, kte�� m�li p�trat po magick� rud�, ale nikdo z nich s dosud nevr�til.");
	b_logentry(TOPIC_SCOUTMINE,"Mus�m ty ztracen� odd�ly naj�t a zjistit, kolik rudy u� se jim poda�ilo vyt�it.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "Ale pro� zrovna j�?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Ale pro� zrovna j�?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Proto�e v�, jak proklouznout mezi sk�ety. Moji chlapci by tam byli beznad�jn� ztracen�.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//Ty jsi mezi nimi ale u� jednou pro�el - to je nejlep�� d�kaz, �e jsi pro tenhle �kol ten prav�.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "Pot�ebuji n�jak� vybaven�.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Pot�ebuji n�jak� vybaven�.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Promluv si s m�gem Miltenem, je tady na hrad�. On bude v�d�t, co by se ti mohlo hodit.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Promluv si o tom s Tandorem. D� ti v�echno, co bude� pot�ebovat.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Tandor na hrad� obchoduje se zbran�mi.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "Kolik mi d�, kdy� tv�j �kol spln�m?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Kolik mi d�, kdy� tv�j �kol spln�m?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(pohn�van�) Nejsem zvykl� dohadovat se se �old�ky.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Dobr�, zd� se, �e nem�m na v�b�r. Kdy� se o to postar� jak je t�eba, d�m ti 500 zlat�ch.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Kde najdu ty doly?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Kde najdu ty doly?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Vezmi si tuhle mapu. Jsou na n� zakreslen� dv� oblasti, ve kter�ch jsou doly.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Pokud bys m�l je�t� n�jak� dotazy, zeptej se Parcivala. �ekne ti v�echno, co bys m�l v�d�t o horn�c�ch.
	b_logentry(TOPIC_SCOUTMINE,"Informace o kop���ch mohu z�skat od paladina Parcivala.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Zatracen�! Co se to tam d�je? To n�s p�i�el vyhladit samotn� Beliar?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Moji mu�i jsou t�m�� mrtv� a s tou trochou rudy, co m�me, bychom nezastavili JEDIN�HO SK�ETA, NATO� CELOU ARM�DU!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Cel� v�prava je odsouzen� k z�hub�.
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "Promluvil jsem si s Fajethem.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Promluvil jsem si s Fajethem.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Co m� na srdci?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Jeho lid� vydolovali dv� bedny rudy.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmm... dv� bedny? Nepot�ebuju dv� bedny - pot�ebuju DV� STOVKY.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//M�m ti vy��dit, �e pot�ebuje v�c mu��.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Co�e? To m�m poslat dal�� lidi na jistou smrt? Na to m��e zapomenout.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "Co se Silvestrova dolu t��e...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (SILVESTRO_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Co se Silvestrova dolu t��e...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Vid�l jsi ho? Mluvil jsi s n�m?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//V�ichni zem�eli. P�ekvapili je d�ln� �ervi.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//A co ruda? V�, kolik j� vyt�ili?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Poda�ilo se jim zachr�nit p�r beden. Jsou v jeskyni pobl� cesty mezi hradem a dolem.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Zatracen�! Byli to v�n� dob�� chlapi - nech� se Innos slituje nad jejich du�emi.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "Setkal jsem se s Marcosem.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Setkal jsem se s Marcosem.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//A? Co hl�s�? Kolik rudy pro n�s m�?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//�ty�i bedny. Opustil d�l, aby dostal rudu do bezpe��.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Te� ty bedny hl�d� v mal�m �dol��ku za sk�et�mi liniemi. ��d� ale o posily.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Co�e? Jenom �ty�i bedny - a opustil d�l? Sakra, to nen� dobr�.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//A te� chce je�t� dal�� mu�e? No dobr�, po�lu mu dva chlapy.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "A co ten dopis pro lorda Hagena?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//A co ten dopis pro lorda Hagena?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//M�me dohromady deset beden rudy - a ztratili jsme dvakr�t tolik dobr�ch mu��.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Dostane� sv�j dopis. Lord Hagen se o tom MUS� dozv�d�t. Tohle �dol� je proklet� - hn�zd� tady zlo.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Velitel Garond mi dal dopis, kter� by m�l b�t dostate�n�m d�kazem. Mus�m jej uk�zat lordu Hagenovi.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "A co moje mzda?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//A co moje mzda?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//No jo, dobr�. Je�t� ti vlastn� dlu��m n�jak� zlato. Tady je tvoje odm�na.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Jak to vypad�?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Te� u� jen �ek�m na zpr�vy z posledn�ho dolu - a douf�m, �e to budou dobr� zpr�vy.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Pot�ebuji zpr�vy o tom, jak to vypad� v dal��ch dvou dolech. Pak se uvid�.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//M�l by ses vydat hledat ty doly. Zoufale pot�ebuji zpr�vy o tom, jak to vypad� s dob�v�n�m rudy.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "Chci, abys pustil Gorna.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Chci, abys pustil Gorna.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//Nem��u ho propustit. Sp�chal mnoho zlo�in�, za kter� mus� pykat.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//M��u za n�j zaplatit jeho pokutu?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//To by mo�n� �lo - ale rozhodn� to nebude levn�. Za Gorna budu cht�t 1000 zlat�ch.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//To je hodn� pen�z.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Gorn se tak� mus� zodpov�dat za hodn� v�c�. P�ines mi ty pen�ze a j� Gorna propust�m.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Garond ��d� za Gornovo propu�t�n� tis�c zla��k�.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "Cht�l bych vykoupit Gorna.";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Cht�l bych vykoupit Gorna.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Dobr�. B� za Geroldem a �ekni mu, a� na m�j rozkaz Gorna propust�.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Zaplatil jsem Garondovi. Te� se Gorn m��e dostat z lochu - str�ce Gerold ho pust�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//V tom p��pad� mi p�ines 1000 zlat�ch.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "Co bude� d�lat te�?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Co bude� d�lat te�?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//M�m u� v�eho dost. Moje jedin� nad�je jsi te� ty - a �e mi lord Hagen po�le posily.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Budeme st�t pevn� jako sk�la a modlit se k Innosovi, aby n�s v t�to temn� hodin� nenechal klesnout na mysli.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Zatracen�. Co se tady fl�k�? Pot�ebuju ty zatracen� posily!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Dokonce i Milten opustil hrad. Ale j� nepot�ebuju m�� lid� - pot�ebuju jich v�c!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "Jsem zp�t.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Jsem zp�t.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//No to vid�m. Kde jsou ty posily?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen p�ijde, jakmile vy��d� v�echny nezbytn� z�le�itosti. Hodn� se toho stalo.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//To m� nezaj�m�. M� zaj�maj� voj�ci. Sk�et� je ��m d�l t�m v�c a moc dlouho se u� neudr��me.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Mu�i jsou unaven� a doch�z� n�m proviant.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//P�ijelo p�r dobrovoln�k�.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Mysl� sebe a t�ch tv�ch p�r drakobijc�, co? M��ete n�m sice pomoci, ale po��d v�s nen� dost.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Mysl� ty drakobijce na dvo�e? Ti n�m sice mohou pomoci, ale po��d jich nen� dost.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Jestli Hagen co nejd��v nepo�le n�jak� mu�e, pak za nic neru��m.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "M�m zpr�vy o drac�ch...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"Garond se mus� zaj�mat o to, jak to s draky vypad�, i kdy� p�sob� dojmem, �e ve skute�nosti mu to m��e b�t ukraden�.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//M�m zpr�vy o drac�ch.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Podej hl�en�.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Zabil jsem draka v ba�in� na v�chod odsud.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Drak ve skaln� pevnosti na jihu je mrtv�.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Ohniv� drak v sopce na jihu u� nebude tropit ��dn� pot�e.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Vydal jsem se do zmrzl� oblasti na z�pad� a zlikvidoval tamn�ho draka.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//To jsou dobr� zpr�vy. Tady. Vezmi si n�jak� pen�ze na dopln�n� v�bavy.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//M��e� mi d�t n�jak� dal�� informace o drac�ch?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Vr�sky mi te� d�laj� jin� v�ci. Oric, m�j d�stojn�k p�es strategick� v�ci, ti o tom �ekne v�c.
		b_logentry(TOPIC_DRACHENJAGD,"Garond�v strategick� d�stojn�k Oric by pro m� mohl m�t n�jak� u�ite�n� informace.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Provedli draci mezit�m n�jak� dal�� �tok?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Na�t�st� ne. Prozat�m se dr�� zp�tky.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "V�ichni draci jsou mrtv�.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//V�ichni draci jsou mrtv�.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(nev���cn�) V�ichni? Tak�e zlo bylo nav�dy za�ehn�no?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Ne, to bohu�el ne. Je�t� po��d zb�v� jejich v�dce.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Copak nebyli draci veliteli sk�et�?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Ano, to ano, ale maj� sv�ho vlastn�ho p�na. Toho se mus�me tak� zbavit.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Zatracen�, do toho j�t nem��u. Mus�m hl�dat rudu, a je�t� nav�c tu jsou po��d ti sk�eti.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Bude� se o to muset postarat s�m. Nem��u ti pomoci.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Nech� t� Innos ochra�uje.
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "M�me probl�m s kov��em.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//M�me probl�m s kov��em.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Jak�m kov��em? P�ed chv�l� tu byl.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//On se vr�til? V tom p��pad� mu �ekni...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Ne, j� mluv�m o Janovi.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//Je to drakobijec jako j�, a je to dobr� kov��.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Jeden z drakobijc�. Je to kov��.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//To je dob�e. N� p�edchoz� kov�� zmizel, srab jeden.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan se o kov�rnu r�d postar�.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Aha. Tak�e si mysl�, �e bych mu m�l v��it.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Ano.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Pokud si jsi tak jist�, m��e� se za n�j zaru�it.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Jestli�e bude d�lat n�jak� pot�e, bude� se za to zodpov�dat ty. Souhlas�?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"Budu o tom p�em��let.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"Zaru��m se za Jana.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Jak mu m�m v��it j�, kdy� mu ned�v��uje� ani ty s�m?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Pokud se za toho tv�ho Jana nikdo nepostav�, bude muset dr�et ruce od v�hn� d�l.
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Zaru��m se za Jana.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Dobr�. V tom p��pad� m��e kov�rnu pou��vat. Samoz�ejm� tak� bude muset ud�lat me�e pro m� mu�e.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Jak to vypad�?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Zatracen�! N�jak� parchant nechal hlavn� br�nu otev�enou. Te� je z n�s krmen� pro vlky.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//A� dostanu toho zr�dce do rukou...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Pokud Hagen nep�ijde co nejd��v, pochc�p�me tady jako mouchy.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

