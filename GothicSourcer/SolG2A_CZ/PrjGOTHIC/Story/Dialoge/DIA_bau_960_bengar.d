
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "Ty jsi tady farm��em?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Ty jsi tady farm��em?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Dalo by se to tak ��ct, ale jsem jen n�jemce.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Ve�ker� pozemky pat�� velkostatk��i.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "Jak si obstar�v� ob�ivu?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Jak si obstar�v� ob�ivu?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//V�t�inou lovem a k�cen�m strom�. Taky samoz�ejm� chov�me ovce a obd�l�v�me p�du.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar mi sem poslal v�echny tyhle lidi a j� je mus�m �ivit. A jen m�lo z nich um� vz�t za pr�ci, jak sis asi s�m v�iml.
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "Zam�stn�v� n�den�ky?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zam�stn�v� n�den�ky?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar vyhodil lidi, co mu na jeho farm� nebyli k ni�emu.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Pak je poslal ke mn�. D�v�m jim naj�st a oni pro m� pracuj�.
};


instance DIA_ADDON_BENGAR_MISSINGPEOPLE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_missingpeople_condition;
	information = dia_addon_bengar_missingpeople_info;
	description = "Stalo se v posledn� dob� n�co divn�ho?";
};


func int dia_addon_bengar_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Stalo se v posledn� dob� n�co divn�ho?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//Vypad� to, �e celkem dost v�c�.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Ale nejpodivn�j�� z nich je z�hadn� zmizen� Pardose.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//Je jeden z m�ch nejlep��ch farm���. Nen� ten typ, �e by hodil ru�n�k do ringu a zmizel p�es noc, v�??
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Farm�� Bengar postr�d� sv�ho d�ln�ka Pardose.");
	MIS_BENGAR_BRINGMISSPEOPLEBACK = LOG_RUNNING;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_bengar_missingpeople);
	Info_AddChoice(dia_addon_bengar_missingpeople,DIALOG_BACK,dia_addon_bengar_missingpeople_back);
	Info_AddChoice(dia_addon_bengar_missingpeople,"N�jak� d�vody, kter� by ho vedly k �t�ku?",dia_addon_bengar_missingpeople_hint);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Mo�n� toho tady m�l jenom dost.",dia_addon_bengar_missingpeople_voll);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Co je p�esn� tak zvl�tn�ho na jeho zmizen�?",dia_addon_bengar_missingpeople_was);
};

func void dia_addon_bengar_missingpeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Co je p�esn� tak zvl�tn�ho na jeho zmizen�?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos je starostliv� typ. Nikdy se nezatoulal d�l, ne� jsou hranice m�ho pozemku.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Vzal by nohy na ramena, kdyby vid�l �ravou �t�nici plazit se jeho sm�rem.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Ikdy� to nejsou p�kn� stvo�en�, nejsou v�bec nebezpe�n�.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(zhnusen�) Dokonce jsem sly�el, �e je n�kdo i j�. Odporn�.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Zvykne� si na to.
};

func void dia_addon_bengar_missingpeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Mo�n� toho tady m�l jenom dost.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Pr�ce na poli byla pro n�ho v��m. Neum�m si p�edstavit, �e te� pracuje pro jin�ho farm��e.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//Mohl si d�lat, co cht�l.
};

func void dia_addon_bengar_missingpeople_hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//N�jak� d�vody, kter� by ho vedly k �t�ku?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//P�edpokl�d�m, �e ho sebrali banditi. Toulali se tu p�r dn� okolo.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//Jednou jsem vid�l, jak vzali ob�ana m�sta a t�hli si ho do t�bora.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//Vypad� to, jako by ho cht�li zotro�it..
	Info_AddChoice(dia_addon_bengar_missingpeople,"Kde je t�bor bandit�?",dia_addon_bengar_missingpeople_lager);
};


var int bengar_toldaboutrangerbandits;

func void dia_addon_bengar_missingpeople_lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//Kde je t�bor bandit�?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//Na konci mojeho pole jsou schody vedouc� dol� do mal� kotliny. Tak tam se ut�bo�ili.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//R�d bych se tam �el pod�vat a Pardose naj�t, ale nechci se zapl�st s t�mi hrdlo�ezy.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//Na tv�m m�st� bych se od nich dr�el d�l. Nekladou ot�zky.
	BENGAR_TOLDABOUTRANGERBANDITS = TRUE;
};

func void dia_addon_bengar_missingpeople_back()
{
	Info_ClearChoices(dia_addon_bengar_missingpeople);
};


instance DIA_ADDON_BENGAR_RETURNPARDOS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_returnpardos_condition;
	information = dia_addon_bengar_returnpardos_info;
	description = "U� se Pardos vr�til?";
};


func int dia_addon_bengar_returnpardos_condition()
{
	if((MIS_BENGAR_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (Npc_GetDistToWP(pardos_nw,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_returnpardos_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//U� se Pardos vr�til?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Ano, odpo��v� vevnit�. D�ky za v�echno ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Nen� za�.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Po�kej, r�d bych t� odm�nil, ale nem�m toho dost ani pro sebe ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Zapome� na to.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BENGAR_FERNANDOSWEAPONS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_fernandosweapons_condition;
	information = dia_addon_bengar_fernandosweapons_info;
	description = "M�li banditi zbran�, kdy� tudy naposledy �li?";
};


func int dia_addon_bengar_fernandosweapons_condition()
{
	if((BENGAR_TOLDABOUTRANGERBANDITS == TRUE) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//M�li banditi zbran�, kdy� tudy naposledy �li?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//Co je to za blbou ot�zku? U� jsi n�kdy vid�l bandity beze zbran�?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Mysl�m velmi MNOHO zbran�. N�co jako dod�vka zbran�.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//Jo, pravda. Te� u� v�m. M�li t�ch zbran� spousty.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//N�kter� v sudech, jin� v bal�c�ch na voz�ku.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "Co si mysl� o Onarovi?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co si mysl� o Onarovi?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Je to nena�ranej parchant, co n�s nakonec v�echny dostane na �ibenici.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Jednou sem paladinov� z m�sta doraz� a kv�li tomu bastardovi n�s porubaj�.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale j� nem�m na v�b�r. Domobrana si sem chod� jen, aby si odnesla na�e zbo��, ale chr�nit n�s ji ani nenapadne.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Kdybych z�stal v�rn� m�stu, byl bych na to te� s�m.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Kdy� u� nic jin�ho, Onar po�le p�r sv�ch �old�k� hned a pak, aby se pod�vali, jak jsme dopadli.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "Co m� proti kr�lovsk�m vojsk�m?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co m� proti kr�lovsk�m vojsk�m?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//To je p�ece jasn�. Od t� doby, co jsou paladinov� ve m�st�, se nic nezlep�ilo. Pr�v� naopak.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Te� ti zatracen� voj�ci z domobrany p�ich�zej� na na�e pozemky st�le �ast�ji a kradou, co se jim zachce. A paladinov� proti tomu nehnou ani prstem.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jedin� paladinov�, kter� jsem kdy vid�l, jsou ti dva str�ci u pr�smyku.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Nehodlaj� hnout ani prstem, dokud n�s domobrana v�echny nepovra�d�.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "Pr�smyk?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Pr�smyk?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Jo. Pr�smyk do star�ho Hornick�ho �dol� u vodop�d� na druh�m konci n�horn�ch pastvin.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Zeptej se na to Malaka. Posledn� t�den m� spoustu �asu.
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "�ekn�me, �e se na ten v� probl�m s domobranou pod�v�m.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//�ekn�me, �e se na ten v� probl�m s domobranou pod�v�m.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? �ekl jsem Onarovi, �e by m�l poslat p�r �OLD�K�.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//Je to p��le�itost, jak se p�esv�d�it o sv�ch kvalit�ch.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//V�born�. Je ti jasn�, co se mnou domobrana ud�l�, kdy� to spack�?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Nem�l jsem dojem, �e by sem te� cht�l n�kdo z nich p�ij�t.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//U� jsem o tom Onarovi ��kal p�ed p�r dny. Za co mu tu rentu teda plat�m?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ti bastardi sem chod� jednou do t�dne a vyb�raj� dan� pro m�sto.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Je fajn, �es p�i�el pr�v� te�. V tuhle dobu obvykle p�ich�zej�.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//M�li by tu b�t ka�dou chv�li.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "Je v�s tu tolik. Pro� se domobran� prost� nepostav�te sami?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Je v�s tu tolik. Pro� se domobran� prost� nepostav�te sami?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//Je pravda, �e n�s tu je jak ps�. Ale nem�me v�cvik na boj s domobranou.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "Jen a� si teda domobrana doraz�, j� u� to s nimi vy��d�m!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Jen a� si teda domobrana doraz�, j� u� to s nimi vy��d�m!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nem��u se do�kat. U� p�ich�zej�. ��kal jsem ti to.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Jen to nezpackej!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Tak dobr�, hodn� �t�st�! Uka� jim to.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "V� probl�m s domobranou u� je minulost�.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//V� probl�m s domobranou u� je minulost�.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Jsi bl�zen? V�, co mi ti chlapi ud�laj�, a� odsud odejde�?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Z�st�vaj� po��d pobl�. �ekni jim, a� odt�hnou �PLN�!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//To nen� �patn�. Mo�n� n�m te� na konci m�s�ce zbude n�co i pro obchod. D�ky.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Dokonce jsi za m� cht�l zaplatit. To je od tebe velmi mil�.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "Ov��k Balthazar na va�e pastviny nesm�?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Ov��k Balthazar na va�e pastviny nesm�?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//No, ano. To je tak. �ekl jsem Sekobovi, �e by mi m�l platit, kdy� chce sv� ovce p�st na m�ch pozemc�ch.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//Abych �ekl pravdu, cht�l jsem to jen proto, aby u� sem nechodil. Nem��u Balthazara vyst�t.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"M�m-li p�esv�d�it Bengara, aby Balthazara pustil na sv� pastviny, mus�m mu u�init laskavost. Ur�it� se k tomu n�jak� p��le�itost naskytne.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "Domobrana je pry� a Balthazar m��e tvoji pastvinu znovu pou��vat.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Domobrana je pry� a Balthazar m��e tvoji pastvinu znovu pou��vat.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Pro�?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(v�hru�n�) Proto�e jsem to �ekl.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Mmh. Dobr�, jak chce�.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//A� si najde m�sto pro svoje zv��ata n�kde mezi poli.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "D�vej na sebe pozor.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//D�vej na sebe pozor.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty taky.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "Jak to vypad�?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak to vypad�?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak zmizel a vzal s sebou v�echno a ka�d�ho, kdo pro m� pracoval. ��kal, �e m� nam��eno do hor.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//U� to tu nemohl vydr�et.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//�asy jsou zl�. Nev�m, jak dlouho tu je�t� vydr��m.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Vyt��� m�, jak z pr�smyku te� proud� z�plavy p��er, aby plundrovaly n�horn� pastviny.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Kdybych tu tak alespo� m�l n�jakou pomoc do �old�k�.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//Jeden z nich se chystal, �e pro m� bude pracovat. Asi zm�nil n�zor. M�m dojem, �e se jmenoval "Wolf".
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"Bengar z�stal na sv�m statku docela s�m. Jeho p��tel Malak zmizel a v�ichni ostatn� ode�li s n�m. Podle Bengara se nejsp� uch�lili do hor.");
	b_logentry(TOPIC_BENGARALLEIN,"Jeho statek je te� �pln� nechr�n�n� a pot�ebuje pomoc. Zmi�oval se o n�jak�m �oldn��i jm�nem Wolf. Copak j� toho chl�pka nezn�m?");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "Malak je mrtv�.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak je mrtv�.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Te� se v�echno obrac� k hor��mu.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "Najal jsem ty �old�ky, kter� jsi cht�l.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Najal jsem ty �old�ky, kter� jsi cht�l.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nikdy jsem na sv� farm� nikoho podobn�ho nem�l. Jen douf�m, �e to bude fungovat.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Tady, vezmi si tohle. M�m dojem, �e se ti to bude hodit.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "Malak se vr�til.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak se vr�til.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//U� bylo na�ase. Myslel jsem, �e u� ho v�ckr�t neuvid�m.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "To bude v po��dku.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//To bude v po��dku.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak se sice vr�til, ale na situaci to moc nem�n�.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Pokud se nestane n�jak� z�zrak, v�ichni to tu odsk��eme.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wolf je divnej chlap, ale mysl�m, �e to n�jak zvl�dneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka tu nic nefunguje. Jestli se brzy n�co nestane, vzd�m se farmy.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Snad se brzy vr�t�.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

