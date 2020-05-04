
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//� - p�i�el jsi pr�v� v�as. Pot�ebuju pro sv� magick� pokusy n�jak�ho asistenta.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jsem si jist�, �e jsi cel� nedo�kav�, jak mi ve v�deck�m z�jmu ud�lat malou laskavost.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Pomalu, p��teli. Nejd��v mi �ekni, o co vlastn� jde.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Vymyslel jsem nov� kouzlo. Kouzlo zapomn�n�.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//U� jsem �sp�n� provedl n�kolik praktick�ch zkou�ek, ale na fin�ln� test se mi nedost�v� �asu.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "Co z toho budu m�t, kdy� ti pom��u?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co z toho budu m�t, kdy� ti pom��u?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//M��u t� nau�it, jak se p�ipravuj� lektvary.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Zn�m recepty na l��ivou esenci, esenci many a lektvar rychlosti.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "�ekni mi o tom experimentu a kouzlu v�c.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//�ekni mi o tom experimentu a kouzlu v�c.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//To kouzlo m� za n�sledek, �e si ur�it� osoba nepamatuje r�zn� ud�losti.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//U� se mi poda�ilo zjistit, �e to funguje, pokud je doty�n� osoba na�tvan� - nap��klad, pokud ji n�kdo pr�v� dal nakl�da�ku, nebo ji oloupil.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Dokonce i kdy� je jen sv�dkem takov� ud�losti, tak se j� to pak vyma�e z pam�ti.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//To bych jako m�l n�koho srazit na zem a pak na n�j seslat kouzlo?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//Funguje to jen v p��pad�, �e je ob� po boji OPRAVDU na�tvan�.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(pro sebe) Tady v p��stavn� �tvrti se to ml�t� po��d. Rad�ji bych si m�l ob� vyhl�dnout n�kde jinde.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Ano, m�m dojem, �es trefil h�eb��ek na hlavi�ku. Ale abys n�koho na�tval, sta��, abys ho napadl, nemus� ho srazit k zemi.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Tak�e by sis m�l vybrat n�koho, kdo je o samot� - pokud kolem budou lid�, jen se dostane� do pot�� s lordem Andrem.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Taky nem� ��dn� smysl ses�lat kouzlo na n�koho, kdo na tebe pr�v� �to��. Po�kej na ten spr�vn� okam�ik.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "Dobr�, vyzkou��m to kouzlo.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobr�, vyzkou��m to kouzlo.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Tak si vezmi tenhle svitek a vyzkou�ej si �ivot pokusn� my�i.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//A� to provede�, tak se vra� o tom poreferovat.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"M�m vyzkou�et nov� Ignazovo kouzlo - kouzlo zapomn�n�. Kdy� se na m� n�kdo p�i bitce nebo z jin�ho d�vodu rozhn�v�, ur�it� se se mnou u� nebude cht�t bavit. A tehdy nastane prav� chv�le pro pou�it� tohoto zakl�nadla.");
	b_logentry(TOPIC_IGNAZ,"Tohle je ide�ln� p��le�itost vyzkou�et to kouzlo - pod jeho p�soben�m tak� zapomene ohl�sit mimo��dnou ud�lost. Nemysl�m si, �e mi v p��stavu bude n�kdo br�nit, kdy� mu d�m r�nu.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "K tomu experimentu...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//K tomu experimentu...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Tak co, usp�l jsi? Nebo jsi to kouzlo jen tak zb�hdarma vypl�tval? Co?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Jestli pot�ebuje� dal�� svitky, tak si je ode m� m��e� koupit.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "Pou�il jsem ten svitek.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Pou�il jsem ten svitek.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Fajn, fajn. A povedlo se?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Ano, funguje to.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//V�born�. Mal� krok pro v�du, ale obrovsk� pro m�!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Te� m��u n�co ze sv�ho �asu vyu��t na to, abych t� zasv�til do taj� alchymie.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Taky ti m��u d�t n�kolik u�ite�n�ch v�c�, jestli m� z�jem.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ignaz z p��stavn� �tvrti mi m��e uk�zat recepty na v�robu lektvar�.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "Nau� m� n�co z alchymie.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Nau� m� n�co z alchymie.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Lektvar rychlosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esence hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//OK p��prav� lektvaru s pomoc� alchymistick� kolony pot�ebuje� laboratorn� ba�ku.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Na ka�d� lektvar bude� taky pot�ebovat r�zn� rostliny a dal�� ingredience.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co bys r�d v�d�l?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//U� zn� v�echno, �emu bych t� mohl nau�it.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

