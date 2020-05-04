
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Hle�me, p�ed Nejvy��� radou stoj� nov� novic. Innos t� doprov�zej, synu.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//Co je p�esn� �kolem Nejvy��� rady?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Na�� povinnost� je hl�sat v�li Innosovu. Jsme to tedy my, kdo ozna�uje novice vyvolen� ke Zkou�ce magie.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//A�koliv �ijeme v �stran�, sledujeme sv�tsk� z�le�itosti, nebo� c�rkev Innosova p�edstavuje nejvy��� pozemsk� z�kon.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ach, tak�e v�s zaj�m�, co se d�je ve sv�t�.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//Co si tedy mysl�te o t�ch drac�ch, co se usadili v Hornick�m �dol�, a o jejich arm�d�, kter� roste den za dnem?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Ch�pu, �e jsi roz��len�, ale ne� se rozhodneme n�co podniknout, mus�me v�e d�kladn� zv�it.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Kdybychom se te� nechali un�st, ni�eho bychom nedoc�lili. Tak�e spl� to, co m� p�ik�z�no - a my probereme, co je zapot�eb� ud�lat.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Pov�z mi o Zkou�ce magie.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Pov�z mi o Zkou�ce magie.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Je to �ance pro vybran� novice vstoupit do spole�enstva m�g�. Zkou�ku ov�em m��e splnit jen jeden.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//Novice si ke zkou�ce vyb�r� s�m Innos.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "Kdy bude ta zkou�ka prob�hat?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Kdy bude ta zkou�ka prob�hat?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Jakmile se dozv�me Innosovu v�li. Zprav�me o n� vybran� novice a podrob�me je zkou�ce.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Nep�ekvapuje m�, �e zn� ten star� z�kon.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Ale pochybuji, �e si uv�domuje�, jak�mu riziku se vystavuje�. M�j na pam�ti, �e nedo�kav� duch Zkou�kou ohn� neprojde.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Je to u� stra�n� d�vno, kdy n�kdo tuto zkou�ku podstupoval. A je jen jedin� �lov�k, kter� ji p�e�il a �sp�n� slo�il.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//Tehdy to byl mlad� ambici�zn� novic, te� u� dlouhou dobu zast�v� vysok� ��ad v Nejvy��� rad� - mluv�m o Serpentesovi.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Nebude to dlouho trvat a u� nebude jedin�m, kdo tu zkou�ku slo�il.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//V tom p��pad� t� u� nenech�m dlouho �ekat. Poslouchej zn�n� m� zkou�ky:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Vytvo� runu ohniv�ho ��pu. To je v�e - nech� je ti Innos n�pomocen.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ulthar mi zadal sv�j �kol - mus�m vytvo�it runu ohniv�ho ��pu.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Sv�j �kol zn�. V�nuj se mu.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "Vytvo�il jsem tu runu!";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//I have created the rune!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Well done, novice. You shall keep this, your first rune.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//A� se dostane� do prvn�ho Kruhu ohn�, bude� ji moci pou��vat.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Splnil jsi svou zkou�ku k m� spokojenosti.
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Ale je�t� po��d p�ed sebou m� nebezpe�n� �kol, kter� pro tebe nachystal Serpentes!
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Co je nov�ho?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Moment�ln� nic. B� a spl� sv� �koly. Je�t� toho m� dost na pr�ci.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Ne. Nic, co bys u� s�m nev�d�l, brat�e.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Je�t� jedna v�c. Nep��tel znesv�til n�kter� ze svaty� pod�l cest, kter� byly zasv�cen� Innosovi. P�i�ly o sv� magick� po�ehn�n�.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Ch�pu. A d�l?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Je na tob�, abys ty svatyn� o�istil, aby se situace je�t� nezhor�ovala.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Vezmi si tuto sv�cenou vodu a pokrop s n� z�klady svatyn�.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//S pomoc� svat�ch slov o�i��ov�n� z�sk� svatyn� op�t svou starou moc.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax ti prod� mapu, na kter� jsou vyzna�en� na�e svatyn�.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Tady m� mapu. Jsou na n� vyzna�en� svatyn�.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Te� b� a spl� sv�j �kol.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ulthar mi nak�zal, abych jeho sv�cenou vodou o�istil v�echny svatyn�, kter� nep��tel poskvrnil.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Je�t� jedna drobnost. Dr� se d�l od svatyn� stoj�c�ch pod�l cest. Sly�eli jsme, �e n�kter� z nich byly znesv�ceny.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Nikdo netu��, jakou moc te� mohou m�t.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Vy�e�it tento probl�m nen� tvoje starost. Postaraj� se o to paladinov�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "O�istil jsem v�echny svatyn�.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//O�istil jsem v�echny svatyn�.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//V�born�, m�j synu. Jsem na tebe hrd�. Nech� t� Innos st�le doprov�z�.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Vezmi si tento Amulet s�ly, mohl by se ti v bitv�ch proti nep��teli hodit.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Dobr� zpr�vy. Svatyn� pod�l cest byly o�i�t�ny. Innosova s�la pomohla paladin�m sm�st tenhle probl�m ze zemsk�ho povrchu.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Op�t m��e� Innosovi ob�tovat bez obav a bez v�hrad.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

