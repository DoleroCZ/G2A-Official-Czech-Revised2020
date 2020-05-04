
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Hm. Dob�e, �e jsi p�i�el.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//Tohle jsem na�el ve star� kapli.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//Je to magick� runa. Mysl�m, �e t� teleportuje rovnou na farmu.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//Napadlo m�, �e by se ti mohla hodit.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//P�i�el jsi d�t Onarovi pen�ze?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//U� jsem ti ��kal, �e se nem� sna�it o ��dn� hlouposti.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar zjistil, �e sis zase stihl vylep�it z�znamy.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Bude tedy po tob� cht�t tak� v�c pen�z.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Myslel jsem si o tob�, �e jsi chyt�ej��.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//V tom p��pad� pro tebe m�m dobr� zpr�vy.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//U� nen� nikdo, kdo by tvrdil, �e t� vid�l sp�chat vra�du.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Nikdo u� nebude sv�d�it, �e t� vid�l kr�st.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//U� nen� nikdo, kdo by VID�L, jak jsi zml�til jednoho z farm���.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Vypad� to, �e se v�echna obvin�n� proti tob� rozplynula jako p�ra nad hrncem.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//I takhle je mo�n� se vypo��d�vat s probl�my.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Tak nebo tak, platit u� nemus�.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//P��t� si ale d�vej pozor.
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Jedno je jist�: tak jako tak mus� zaplatit pokutu v pln� v��i.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//No, tak�e co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"Nem�m dost pen�z!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"Kolik �e to bylo?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"Nem�m dost pen�z!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"Kolik �e to bylo?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//K�ho �erta - (p�ekvapen�) - to jsi TY ten nov��ek, kter� jde z jednoho mal�ru do druh�ho?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Sly�el jsem do Gorna, �e jsi po��d na�ivu, ale �e p�ijde� sem... no...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Dob�e, �e jsi za mnou p�i�el, ne� to za�alo b�t pro tebe je�t� hor��.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//�old�ci jsou tvrd� ho�i a farm��i tak� nejsou ��dn� o�ez�v�tka, ale chodit po okol� a zab�jet na potk�n�? To prost� nejde.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//A to nemluv�m o dal��ch pot��ch, do kter�ch ses dostal.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//M��u ti pomoci dostat se z t�hle �lamastyky s �ist�m �t�tem.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Ale bude t� to n�co st�t. Onar je po��dn� lakomec, ale pokud se m� na celou v�c zapomenout, mus� to b�t ON, kdo p�imhou�� oko.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Dob�e �e jsi p�i�el. Sly�el jsem, �e jsi pr� n�co ukradl.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//A ml�til farm��e hlava nehlava.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//A KROM� TOHO je�t� zabil p�r ovc�.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//To tady prost� d�lat nem��e�. V takov�ch p��padech Onar po�aduje, abych s vin�kem z��toval.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//To znamen�, �e ty zaplat� a kapsu si namast� on. Na celou v�c se tak ale zapomene.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Kdy� se zaplete� do souboje s n�kter�m ze �oldn���, je to n�co jin�ho.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Ale kdy� zml�t� farm��e, pob�� rovnou za Onarem. A ode m� se bude o�ek�vat, �e n�jak zakro��m.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Nemluv� o tom, �e je docela h�kliv� na to, kdy� mu n�kdo zab�j� ovce.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Bude� muset zaplatit pokutu. Onar si poka�d� shr�bne pen�ze do vlastn� kapsy - ale jinak ta v�c urovnat nejde.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar ode m� o�ek�v�, �e budu chr�nit jeho farmu. A to zahrnuje i jeho ovce.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Bude� mu muset zaplatit od�kodn�!
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Kolik?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"Nem�m dost pen�z!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Dobr�! Dohl�dnu na to, aby Onar sv� pen�ze dostal. M��e� pova�ovat celou v�c za vy��zenou.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//Nem�m dost pen�z!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//V tom p��pad� si je co nejrychleji se�e�.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Ale nemysli si, �e je m��e� ukr�st tady na farm�. Kdyby t� chytili, bylo by to pro tebe je�t� hor��.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//K�ho �erta - (p�ekvapen�) - Co tady d�l�? Myslel jsem, �e jsi mrtv�!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//Pro� si to mysl�?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn mi �ekl, �es to byl ty, kdo strhnul bari�ru.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Ano, byl jsem to j�.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Nikdy bych ne�ekl, �e n�kdo m��e n�co takov�ho p�e��t. Co t� sem p�iv�d�? Nejsi tu jen tak pro nic za nic.
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "Pot�ebuju si nutn� promluvit s paladiny z m�sta.";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Pot�ebuju si nutn� promluvit s paladiny z m�sta. M��e� mi pomoci n�jak se k nim dostat?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(ned�v��iv�) Co kuje� s paladiny?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//To je dlouh� p��b�h...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//J� m�m �as.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(povzdychne� si) Pos�l� m� Xardas. Chce, abych z�skal mocn� amulet, Innosovo oko.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Tak�e po��d je�t� dr�� s t�m nekromantem. Aha. A ten amulet maj� paladinov�?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Pokud v�m, tak ano.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//M��u ti pomoct dostat se k paladin�m. Ale nejd��v se mus� st�t jedn�m z n�s.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "Jak mi m��e� pomoct dostat se k paladin�m?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Jak mi m��e� pomoct dostat se k paladin�m?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//V�� mi. M�m pl�n. Mysl�m, �e jsi na to ten prav�.
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//J� t� dostanu k paladin�m a ty mi na opl�tku prok�e� jednu slu�bi�ku. Nejd��v ale vstup do na�ich �ad!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "Co p�esn� tady d�l�te?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//Co p�esn� tady d�l�te?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Je to prost�: postar�m se o to, abychom se v�ichni dostali z tohohle ostrova pry�.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Onar si n�s najal, abychom chr�nili jeho farmu, a p�esn� to budeme d�lat.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Ale na�� odm�nou bude v�c, ne� jen n� �old. T�m, �e pom�h�me farm���m, jsme m�stu p�eru�ili z�sobov�n�.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//A ��m m�� toho budou m�t paladinov� k j�dlu, t�m d��ve budou ochotni naslouchat, a� k nim p�ijdu s nab�dkou k p��m���.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//�koda, �e ses ze v�ech mo�n�ch lid� spol�il zrovna s nimi.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Jak bude ta tvoje nab�dka vypadat?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//V z�sad� se bude jednat o na�i milost a voln� pr�chod na pevninu. V�c se dozv�, a� p�ijde �as.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "R�d bych se k v�m p�idal!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//R�d bych se k v�m p�idal!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Doufal jsem, �e to �ekne�! Ka�d� ruka je tady dobr�.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//Ty �old�ci, co jsem najal posledn�, d�lali jenom trable!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//V z�sad� m��e� za��t okam�it�. No, je�t� tady je p�r v�c�, kter�mi mus� proj�t, ale nen� to nic zvl�tn�ho.
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "��m mus�m 'proj�t', ne� se k v�m budu moci p�idat?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//��m mus�m 'proj�t', ne� se k v�m budu moci p�idat?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Zam�stn�v� n�s Onar, zdej�� statk��. M��e� na farm� z�stat, jen kdy� to on schv�l�.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//A pak tady jsou na�i ho�i. Mohu t� p�ijmout jen v p��pad�, �e s t�m bude souhlasit v�t�ina �old�k�.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Ale necho� za Onarem, dokud to nebude jist�. Je to velmi popudliv� chlap�k.
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"M�m-li b�t p�ijat mezi �oldn��e, mus� mi m�j vstup do jejich �ad nejd��ve schv�lit Onar.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "Jak m�m �oldn��e p�esv�d�it, aby m� p�ijali?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Jak m�m �oldn��e p�esv�d�it, aby m� p�ijali?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//�ekl bych, �e t�m, �e se bude� chovat jako �oldn��.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Promluv si s Torlofem. V�t�inou post�v� venku p�ed domem. Ozkou�� si t�.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Pokud tou zkou�kou projde�, m�l by sis vyslou�it velkou ��st pot�ebn�ho respektu.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//�ekne ti v�echno ostatn�, co bys m�l v�d�t.
	b_logentry(TOPIC_BECOMESLD,"Aby m� �oldn��i p�ijali mezi sebe, mus�m podstoupit zkou�ku, kterou mi zad� Torlof, a vyslou�it si respekt ostatn�ch.");
};


instance DIA_ADDON_LEE_RANGER(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_addon_lee_ranger_condition;
	information = dia_addon_lee_ranger_info;
	description = "Co v� o 'Kruhu Vody'?";
};


func int dia_addon_lee_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_othersld) && (SC_KNOWSRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lee_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Co v� o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(sm�ch)To jsem si mohl myslet. Nen� nic, kam bys necpal nos.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ale no tak, �ekni mi o tom.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Nejsem do toho p��mo zapleten�. V�m jen, �e existuje tahle tajn� frakce, za kterou jsou m�gov� Vody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Od p�du bari�ry, u� nejsem v�zan� dohodou, kterou jsem uzav�el s m�gy Vody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Samozrejm�, �e se ti pokus�m pomoct, kdy� bude� n�co pot�ebovat. Av�ak, m�m m�lo �asu posledn� dobou a sv� probl�my, kter� m� zanepr�zd�uj�.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Mohl by sis promluvit s Cordem pokud o tom chce� z�skat n�jak� informace. Pokud v�m, tak je jedn�m z nich.
	RANGERHELP_GILDESLD = TRUE;
	SC_KNOWSCORDASRANGERFROMLEE = TRUE;
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "Jsem p�ipraven se k v�m p�idat!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Jsem p�ipraven se k v�m p�idat!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Ne, dokud neprojde� Torlofovou zkou�kou.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Tak co, pro�el jsi Torlofovou zkou�kou?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Ano.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//To je dob�e.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//Co ��kaj� ostatn� �oldn��i?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Nev�m, jestli jich m�m na sv� stran� dostatek.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//V tom p��pad� si promluv s Torlofem, ten v� o v�em, co se tady na farm� �u�k�.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//V�t�ina z nich stoj� za mnou.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Dobr�, v tom p��pad� b� za Onarem. U� jsem s n�m o tom mluvil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//�old si ale mus� vysmlouvat s�m.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"Te� u� pot�ebuji pouze Onar�v souhlas.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Byl jsi za Onarem?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Souhlasil.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//V�tej na palub�, chlap�e!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Tady, nejd��v si vezmi n�jak� po��dn� brn�n�!
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine(lothar,"START");
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Jsem r�d, �e jsi mezi n�mi.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//Hned pro tebe m�m prvn� �kol.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//M� to co do �in�n� s paladiny. Je na �ase, aby ses za nimi vypravil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Stejn� jsi m�l v pl�nu tam j�t.
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Vid�m, �e ses dal do slu�by paladin�.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Vstoupil jsi do kl�tera? (sm�je se) �ekal bych v�echno, ale tohle ne.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//No, te� u� se �oldn��em st�t nem��e�.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Ale kdo v�, mo�n� bys pro m� mohl jednu nebo dv� v�ci ud�lat - nebo j� pro tebe.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Uvid�me. Tak nebo tak, p�eji ti jen to nejlep��.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Ale nesna� se mi v�et bul�ky na nos, rozum�?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "Jak se te� mohu dostat k paladin�m?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//Jak se te� mohu dostat k paladin�m?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Jednodu�e. Donese� jim na�i nab�dku p��m���.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Lorda Hagena, velitele paladin�, zn�m z dob sv� slu�by v kr�lovsk� arm�d�.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//V�m, jak�m zp�sobem p�em��l� - nem� dostatek mu��. Tu nab�dku p�ijme. P�inejmen��m t� vyslechne.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Napsal jsem dopis - tady je.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//To by m�lo ka�dop�dn� sta�it, aby t� pustili k veliteli paladin�.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Lee m� pos�l�, abych lordu Hagenovi p�edal dar na usm��enou. Tak se mohu dostat mezi paladiny.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "Donesl jsem lordu Hagenovi tvoji nab�dku p��m���.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Donesl jsem lordu Hagenovi tvoji nab�dku p��m���.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Co ��kal?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//�ekl, �e tob� m��e zajistit prominut� tv�ch �in�, ale ne tv�m lidem.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Ten pali�at� bl�zen. V�t�ina mu�� v KR�LOVSK� arm�d� jsou v�t�� hrdlo�ezov� ne� moji chlapi.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Co bude� d�lat d�l?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Mus�m naj�t jin� zp�sob, jak n�s odsud dostat. Pokud to bude nutn�, ukradneme lo�. Budu si to muset promyslet.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//�e bych s�m vyt�hl krk z opr�tky a opustil sv� mu�e, to v�bec nep�ipad� v �vahu.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Pro� tak stra�n� chce� na pevninu?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Pro� tak stra�n� chce� na pevninu?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Jak v�, slou�il jsem kr�li jako gener�l.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Ale jeho patol�zalov� m� zradili, proto�e jsem v�d�l n�co, co jsem v�d�t nem�l.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Vrazili m� do t� t�a�sk� kolonie a kr�l to nechal b�t.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//M�l jsem dost �asu, abych si to nechal proj�t hlavou.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Mus�m se pomst�t.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(ohromen�) Kr�li?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(rozhodn�) Kr�li! A v�em jeho pochlebn�k�m. Budou trpce litovat, co mi ud�lali.
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "Vyd�m se do Hornick�ho �dol�.";
};


func int dia_lee_rescuegorn_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Vyd�m se do Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Nemyslel jsem si, �e bys z�stal tady na farm� n�jak dlouho.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Jestli p�jde� zp�tky do kolonie, zkus naj�t Gorna. Paladinov� ho dr�� jako v�zn�.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn je dobr� chlap�k a mn� by se tady hodil, tak�e kdybys m�l �anci ho osvobodit, tak v�bec nev�hej.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Ano, u� mi to �ekl. Dobr� pr�ce.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Stoj� za v�c, ne� Sylvio a jeho chlapci dohromady.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Gorn ti o mn� �ekl?? Co se mu stalo?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Gorn ti o mn� �ekl?? Co se mu stalo?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Pamatuje� si ho, �e?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Nech m� h�dat ...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Jasn�.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Jasn�.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Chytili ho paladinov� a poslali ho s kolonou trestanc� zp�tky do Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Kdyby nebyla cesta do Hornick�ho �dol� pln� paladin� a sk�et�, d�vno bych tam poslal p�r sv�ch hoch�, aby ho osvobodili.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Ale proto�e to vypad� tak, jako to vypad�, nem�lo by to smysl. Chud�k.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Nech m� h�dat.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Velk�, tmav�, sprost�, s velkou sekerou - tenkr�t v kolonii spolu s tebou dobyl zp�tky n� rudn� d�l.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "Onar te� m� d�ky Bullcovi o p�r ovc� m��.";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Onar te� m� d�ky Bullcovi o p�r ovc� m��.
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Ale no tak, necho� za mnou s takov�mi kravinami! U� takhle m�m starost� nad hlavu.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//J� taky. Zd� se, �e Bullco m� probl�my se mnou. Chce, abych opustil farmu.
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//No a? St�j si na sv�m.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Mohl bys mu ��ct, aby se dr�el na uzd�, jinak mu ty ovce strhnu ze �oldu.
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "Vr�til jsem se z Hornick�ho �dol�...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Vr�til jsem se z Hornick�ho �dol�. Na hrad za�to�ili draci!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Tak�e to je pravda! Lares ��kal, �e po m�st� koluj� zpr�vy o drac�ch. Nem��u tomu uv��it...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//Co paladinov�?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Jsou �pln� zdecimovan�.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//V�born�! Mo�n� by lord Hagen mohl znovu zv�it mou nab�dku.
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//A jestli ne... (ost�e) Pak najdeme jin� zp�sob, jak se odsud dostat.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//V�born�! Mo�n� to lorda Hagena donut� p�esunout se do Hornick�ho �dol� se zbytkem sv�ch mu��.
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//��m m�� paladin� tady z�stane, t�m l�pe.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "Co takhle n�jak� lep�� brn�n�?";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//Co takhle n�jak� lep�� brn�n�?
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Splnil jsi sv�j �kol.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//M�m tady pro tebe n�jak� lep�� brn�n�. Tedy pokud m� hotovost.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Torlof dostal od Onara �kol, o kter� se m�l ji� p�ed �asem postarat.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Tak�e to nejd��v za�i� - pak si m��eme promluvil o lep��m brn�n�!
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "Koupit si st�edn� t�kou �oldn��skou zbroj. Ochrana: zbran� 50, ��py 50, cena 1000 zla��k�.";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Dej mi to brn�n�.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Tady je. V�n� dobr� zbroj.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Ale nen� to ��dn� d�rek! Nejd��v chci vid�t zlato!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "Nem�l bys pro m� n�jakou lep�� zbroj?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//Nem�l bys pro m� n�jakou lep�� zbroj?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Samoz�ejm�.
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Koupit t�kou �oldn��skou zbroj. Ochrana: zbran� 80, ��py 80, cena: 2500 zla��k�.";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Dej mi to t�k� brn�n�.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Tady je. Velice dobr� zbroj. Je stejn�, jakou m�m i j�.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//V�, jak to chod�. Nejd��v pen�ze!
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "Nem� pro m� nic dal��ho na pr�ci?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Nem� pro m� nic dal��ho na pr�ci?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Nikdy nem� dost, co? U� takhle m� probl�m� a� a�. Co dal��ho bys je�t� cht�l?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Dal�� �kol. Jsem �old�k, zapomn�ls?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Dobr�. N�co by tu bylo. Je to p�esn� pro tebe.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Mus�m u jednoho soudce z m�sta vyrovnat dluh. R�d bych to samoz�ejm� vy��dil osobn�.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Ale paladinov� m� k jeho domu nepust� na vzd�lenost, co bys kamenem dohodil.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Celou z�le�itost mus� prov�st opatrn�. Tak�e d�vej pozor. P�jde� za soudcem a nab�dne� mu svoje slu�by.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Pokus se z�skat jeho d�v�ru a d�lej pro n�j �pinavou pr�ci, dokud na n�j n�co nenajde�.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Ta svin� u� ud�lala tolik pras�ren, �e se ten smrad line a� k nebes�m.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//P�ines mi n�co, s ��m bych mohl jeho jm�no po�pinit p�ed domobranou. Zbytek �ivota bude hn�t v base.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Rozhodn� ale nechci, abys ho zabil. To by bylo p��li� rychl�. Chci, aby trp�l. Rozum�?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Mysl�, �e to zvl�dne�?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Lee chce, abych na�el n�jak� inkriminuj�c� d�kaz proti khorinissk�mu soudci. M�m mu proto nab�dnout sv� slu�by a p�itom m�t o�i na stopk�ch.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"Nic takov�ho neud�l�m.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"Bez probl�m�. Kolik?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Bez probl�m�. Kolik?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Tvoje odm�na z�vis� na tom, co mi donese�. Tak�e se sna�.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Tohle d�lat nebudu. Nebudu si hr�t p�ed tou svin� na n�jak�ho patol�zala.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Jen se ne�erti. Ostatn�, byl to pr�v� on, kdo t� nechal zav��t a hodit skrz bari�ru. Nebo jsi na to snad u� zapomn�l?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//D�lej co chce�, ale mysl�m, �e se nakonec rozhodne� spr�vn�.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "Na�el jsem n�co na toho soudce.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Na�el jsem n�co na toho soudce.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//V�n�? A co?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Najal si p�r rana��, aby p�epadli m�stodr��c�ho Khorinisu.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Kr�tce pot� je nechal zatknout a s�m shr�bl pen�ze, kter� ukradli.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Jako d�kaz jsem ti p�inesl p��kaz, kter� soudce t�m rv���m dal.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Uka� mi ho.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Kone�n�. To by m�lo sta�it, aby trpce litoval. Ud�lal jsi na m� dojem.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Za tohle se r�d pl�cnu p�es kapsu. Tady je tvoje odm�na.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//A nikomu o tom ani muk, jasn�?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//To je vynikaj�c�. Ale cel� v�c se u� vy�e�ila sama. Soudce je mrtv�.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//N�jak� idiot ho rozma��roval. No dobr�. To mi tak� docela sta��.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Tady m� p�r minc�. Za v�c mi ta zpr�va u� nestoj�.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "Co je s Bennetem?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Co je s Bennetem?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Tak�e jsi u� o tom sly�el. Ti bastardi ho zav�eli, jen tak pro nic za nic.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Jako kdybych nem�l dost starost� se sv�mi vlastn�mi lidmi - te� abych se staral je�t� o paladiny.
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "Co bude� s tou Bennetovou z�le�itost� d�lat?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Co bude� s tou Bennetovou z�le�itost� d�lat?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Je�t� nev�m. P�r chlapc� by r�do vtrhlo do m�sta povyr�eli lordu Hagenovi v�echny zuby, jeden po druh�m.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Na podobnou akci na�t�st� nem�me dost lid�, nemluv� o tom, �e to nen� m�j styl.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//Tak�e tady bude� jen tak sed�t a klidn� p�ihl�et tomu, co se stane?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//To rozhodn� ne.
	b_logentry(TOPIC_RESCUEBENNET,"Kdy� dostate�n� rychle neprok�u Bennetovu nevinu, Lee za dal�� n�sledky u� neponese zodpov�dnost. Jeho lid� bez v�h�n� kdykoliv napadnou m�sto a Benneta se zbav� n�sil�m.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares je je�t� ve m�st� a sna�� se zjistit, jak bychom odtamtud mohli Benneta dostat.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//J� se mezit�m sna��m trochu uklidnit svoje lidi. Jenom douf�m, �e to nebude Laresovi trvat moc dlouho.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Ano, a abych nezapomn�l... Buster s tebou chce mluvit. Necht�l mi ��ct, o co jde. Mo�n� by ses m�l za n�m stavit!
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Mohl bych ti s tou z�le�itost� kolem Benneta pomoci?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Mohl bych ti s tou z�le�itost� kolem Benneta pomoci?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Jasn�, tro�ka inteligence a rozvahy nem��e b�t na �kodu.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos v�, �e kolem pob�h� a� p��li� pitomc�.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//B� do m�sta a mrkni se, jestli nenajde� n�jak� zp�sob, jak odtamtud Benneta dostat.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Ale moc se nezdr�uj, nev�m, jak dlouho je�t� udr��m sv� chlapy na uzd�.
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "N�jak� novinky o Bennetovi?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//N�jak� novinky o Bennetovi?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Kdy� u� nic jin�ho, tak se zd�, �e se ve v�zen� nedo�kal ��dn� �hony.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Dobr� pr�ce.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Ne, je�t� po��d nev�me dost.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "Co se stalo, zat�mco jsem tu nebyl?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Co se stalo, zat�mco jsem tu nebyl?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Ten parchant Sylvio se doslechl o drac�ch v Hornick�m �dol� a ud�lal z farmy tot�ln� bl�zinec.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Sna�il se kluky p�esv�d�it, aby s n�m �li do Hornick�ho �dol�. Sliboval jim sl�vu, pocty, zlato a dal�� pt�koviny.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Spousta z nich se necht�la nechat pro Sylvia zab�t, ale na�lo se p�r idiot�, kte�� mu na ty kecy sko�ili.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Nakonec si nechali d�t od Benneta v�stroj a vyrazili na cestu.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(pohrdav�) No. Nakonec jsem docela r�d, �e Sylvio odsud z farmy kone�n� vypadl.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "M��e� m� u�it?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//M��e� m� u�it?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//M��u ti uk�zat, jak bojovat s obouru��kem.
	if(other.hitchance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Ale nem�m �as t� u�it z�rove� z�klady.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//A� se dostane� na ur�itou �rove�, vezmu si t� na starost. Do t� doby si bude� muset naj�t jin�ho u�itele.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Sly�el jsem, �e jsi docela dobr�. Vsad�m se ale, �e bych t� po��d mohl p�r v�c� nau�it.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			LEE_TEACHPLAYER = TRUE;
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Lee m� nau�� bojovat s obouru�n�mi zbran�mi.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Tak�e jestli chce�, m��u si t� vz�t do par�dy. Ale bude t� to n�co st�t.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Kolik?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 zlat�ch a m��eme si pl�cnout.
			Info_ClearChoices(dia_lee_canteach);
			Info_AddChoice(dia_lee_canteach,"To je pro m� moc drah�.",dia_lee_canteach_no);
			if(Npc_HasItems(other,itmi_gold) >= 1000)
			{
				Info_AddChoice(dia_lee_canteach,"Dohodnuto. Tady jsou pen�ze.",dia_lee_canteach_yes);
			};
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//To je pro m� moc drah�.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Nech si to proj�t hlavou. U�itele m�ho kalibru jen tak nenajde�.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Dohodnuto. Tady jsou pen�ze.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Dobr�. M��e� si b�t jist, �e za to stoj�m.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Lee m� nau�� bojovat s obouru�n�mi zbran�mi.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Za�n�me s tr�ninkem.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Za�n�me s tr�ninkem.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Te� jsi skute�n� mistr v boji s obouru�n�mi zbran�mi.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//U� ��dn�ho u�itele nepot�ebuje�.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Te� jsi skute�n� mistr v boji s obouru�n�mi zbran�mi.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//U� ��dn�ho u�itele nepot�ebuje�.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "Je�t�rani rozn�ej� dra�� vejce po cel� zemi.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Je�t�rani rozn�ej� dra�� vejce po cel� zemi.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//M�lo m� to napadnout. Je na �ase vypadnout.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//Co s nimi tedy m�m d�lat?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Rozbij je. Co jin�ho?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Ze sko��pek by mo�n� �lo d�lat brn�n� nebo tak n�co.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Vypadaj� docela pevn�. Promluv si o tom s Bennetem.
		b_logentry(TOPIC_DRACHENEIER,"S dra��m vejcem toho Lee moc nenad�l� - poslal m� proto za kov��em Bennetem.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "Jak to jde na farm�?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Jak to jde na farm�?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//No, co ode�el Sylvio, tady byl kone�n� docela klid.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//To nezn� �patn�.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Pr�ce bohu�el neubylo. Mu�i jsou ��m d�l t�m nespokojen�j��, proto�e musej� pracovat i za Sylviovy mu�e.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Ale s t�m si hlavu nel�mej. J� si n�jak porad�m.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "Nenapad� t�, jak bych mohl z�skat lo� paladin�?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Nenapad� t�, jak bych mohl z�skat lo� paladin�?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Mysl�, �e bych tady je�t� byl, kdybych to v�d�l? Tu hl�daj� je�t� l�p ne� transporty rudy ve Star�m t�bo�e.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Mus� existovat n�jak� zp�sob, jak se na lo� dostat.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Jist�. Dostat se na palubu nen� nic t�k�ho.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Konec konc� m�me soudce ve sv� moci. Zkus za n�m j�t a vym��knout z n�j dopis, kter� by t� k tomu oprav�oval.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Lee se domn�v�, �e nejlep�� zp�sob, jak se dostat na palubu paladinsk� lodi, je obdr�et od soudce plnou moc. Nen� ale p��li� pravd�podobn�, �e mi n�co takov�ho vyd� jen tak.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//M�m tady fale�n� opr�vn�n�. S jeho pomoc� t� nechaj� str�e proj�t.
		b_logentry(TOPIC_SHIP,"Star� dobr� Lee. M� u sebe pad�lan� dopis, s jeho� pomoc� se m��u dostat na palubu paladinsk� lodi.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Ale to nen� v�echno. Na samotnou plavbu bude� pot�ebovat kapit�na, pos�dku a tak.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Je toho spousta, bez �eho se neobejde�.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"Koho bych m�l najmout do pos�dky?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Nezn� n�koho, kdo by mohl lo� ��dit?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Nezn� n�koho, kdo by mohl lo� ��dit?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Pokud v�m, tak Torlof se na mo�i vyzn�. V�, co je co a tak.
	b_logentry(TOPIC_CAPTAIN,"Torlof je star� n�mo�n�k, mo�n� by cht�l b�t m�m kapit�nem.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Koho bych m�l najmout do pos�dky?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//To si mus� rozhodnout s�m. J� bych s sebou ale bral jenom toho, komu mohu v��it. M� dost lid�, kter�m m��e� d�v��ovat?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Pokud bys pot�eboval do pos�dky n�jak�ho kov��e, zkus se zeptat Benneta. Je ten nejlep��, jak�ho m��e� naj�t.
	b_logentry(TOPIC_CREW,"Ve v�ci pos�dky pro m� toho Lee moc ud�lat nemohl. Ale poradil mi, �e bych m�l najmout jen lidi, kter�m mohu v��it. M�m se zeptat je�t� Benneta, mohlo by ho to zaj�mat.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "To povolen� zafungovalo. Lo� je te� moje...";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//To povolen� zafungovalo. Lo� je te� moje. Spolupr�ce s t�m soudcem byla jedna radost.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Vida. To poni�ov�n� p�ed t�m parchantem se ti nakonec p�ece jenom vyplatilo.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "Chci tu lo� ukr�st.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Chci tu lo� ukr�st.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//A jak to chce� prov�st?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Bude to hra�ka - p�jdu tam, uk�u jim ty pap�ry, vezmu si lo�.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Kdy� ��k�. Vezmi si je. Douf�m, �e v�, co d�l�.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "Poplav� se se mnou?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Poplav� se se mnou?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//D�l� si srandu? Jasn�, �e do toho jdu. M�m na pevnin� p�r nevy��zen�ch ��t�.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Krom� toho t� m��u u�it boj s jednoru�n�mi a obouru�n�mi zbran�mi. Mohl bych se ti hodit.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Lee u� se nem��e do�kat, a� uvid� pevninu. Nab�dl mi ve�kerou podporu - tak dobr�ho u�itele bojov�ch um�n� bych nena�el �iroko daleko.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Lo� je moment�ln� pln�, ale pokud se tam najde m�sto, tak se vr�t�m.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"D�m ti v�d�t, jestli t� budu pot�ebovat.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"Tak si b� sbalit!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Tak si b� sbalit!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Co�e? Te� hned?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Ano, chci odsud vypadnout, tak�e jestli m� v pl�nu jet se mnou, b� do p��stavu. Setk�me se na lodi.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Na tuhle chv�li jsem �ekal hezky dlouho. Budu tam.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//D�m ti v�d�t, jestli t� budu pot�ebovat.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//S�m mus� v�d�t, co chce�. Ale dobr�ch bojovn�k� nebude� m�t nikdy dost.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(za�kleb� se) Leda naprost�ch pitomc� jako Sylvio.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "P�ece jenom bys mi k ni�emu nebyl!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//P�ece jenom bys mi k ni�emu nebyl!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Jak je libo, kdy� tak v�, kde m� naj�t!
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "P�ece jenom bys mi k n��emu mohl b�t!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//P�ece jenom bys mi k n��emu mohl b�t!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//V�d�l jsem, �e m� bude� pot�ebovat! Setk�me se na lodi.
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
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
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//V� co, b� do h�je. Nejd��v mi �ekne�, abych s tebou jel, pak m� zase po�le� pry�.
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Najdi si n�jak�ho jin�ho pitomce!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

