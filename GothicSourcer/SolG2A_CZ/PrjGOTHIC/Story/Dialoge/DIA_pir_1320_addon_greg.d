
instance DIA_ADDON_GREG_EXIT(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 999;
	condition = dia_addon_greg_exit_condition;
	information = dia_addon_greg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_PICKPOCKET(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 900;
	condition = dia_addon_greg_pickpocket_condition;
	information = dia_addon_greg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_greg_pickpocket_condition()
{
	return c_beklauen(111,666);
};

func void dia_addon_greg_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_BACK,dia_addon_greg_pickpocket_back);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_pickpocket_doit);
};

func void dia_addon_greg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_greg_pickpocket);
};

func void dia_addon_greg_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
};


instance DIA_ADDON_GREG_IMNEW(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 1;
	condition = dia_addon_greg_imnew_condition;
	information = dia_addon_greg_imnew_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_imnew_condition()
{
	return TRUE;
};

func void dia_addon_greg_imnew_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(hroziv�) Hej ty. Co d�l� v m� chatr�i?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//J� ...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(zu�iv�) Odejdu jen na p�r dn� a ka�d� si mysl�, �e si m��e d�lat, co chce.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Co se tady vlastn� d�je?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Co, palis�da je�t� nen� dokon�ena? Ka�on opl�va potvorama a ka�d� m� pohodu!!!
	GREGISBACK = TRUE;
	if(!Npc_IsDead(francis))
	{
		AI_TurnToNPC(self,francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(�ve) Je to v�echno, co jsi ud�lal Francisi?
		if(c_bodystatecontains(francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(�ve) Jdi z m� lavice, HNED!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A TY? Co jsi TY d�lal?
	Info_ClearChoices(dia_addon_greg_imnew);
	Info_AddChoice(dia_addon_greg_imnew,"Nic moc.",dia_addon_greg_imnew_nich);
	if((Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0)) || (c_towerbanditsdead() == TRUE))
	{
		Info_AddChoice(dia_addon_greg_imnew,"Pracoval.",dia_addon_greg_imnew_turm);
	};
};

func void b_userakebilanz()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nev��il jsem ani na chv�li, �e bys na mn� zapomn�l.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Ty v�ci m�ly hodnotu n�kolika stovek zla��k�, kter� jsem ukryl v Khorinisu.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ty jsi je prost� v�echny vzal, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Bude� si muset odpracovat dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Brzy pochop�, co to znamen� pr�ce.
	};
	if(!Npc_IsDead(francis))
	{
		Npc_ExchangeRoutine(francis,"GREGISBACK");
		AI_StartState(francis,zs_saw,1,"ADW_PIRATECAMP_BEACH_19");
		FRANCIS_AUSGESCHISSEN = TRUE;
	};
	Info_ClearChoices(dia_addon_greg_imnew);
};

func void dia_addon_greg_imnew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nic moc.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//To nevad�. Najdu pro tebe n�co vhodn�ho, chlap�e.
	b_userakebilanz();
};

func void dia_addon_greg_imnew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracoval.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Tak takhle? Co?
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Dostal jsem bandity z v�e.
	};
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Pl� na severu je vy�i�t�n� od potvor.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobr�. To je za��tek.
	b_userakebilanz();
};


instance DIA_ADDON_GREG_JOINPIRATES(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_joinpirates_condition;
	information = dia_addon_greg_joinpirates_info;
	permanent = FALSE;
	description = "Co m�m d�lat?";
};


func int dia_addon_greg_joinpirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_imnew) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_joinpirates_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co m�m ud�lat?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Prvn� ze v�eho mus�me do tohohle m�sta vn�st trochu �ivota.
	if(Npc_IsDead(morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten l�n� blb, bude posl�n �ezat fo�ny.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//TY se postar� o Morganovu pr�ci a vy��st� ka�on od t�ch krvela�n�ch potvor.
	MIS_ADDON_GREG_CLEARCANYON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CLEARCANYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CLEARCANYON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg chce, abych vzal Morgan�v �kol a vy�istil ka�on od potvor.");
	Info_ClearChoices(dia_addon_greg_joinpirates);
	Info_AddChoice(dia_addon_greg_joinpirates,"Pak tedy jdu.",dia_addon_greg_joinpirates_leave);
	if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
	{
		Info_AddChoice(dia_addon_greg_joinpirates,"M�m to ud�lat s�m?",dia_addon_greg_joinpirates_compadres);
	};
	Info_AddChoice(dia_addon_greg_joinpirates,"Jak� potvory?",dia_addon_greg_joinpirates_clearcanyon);
};

func void dia_addon_greg_joinpirates_leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Pak tedy jdu.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Dr� se. Te� jsi jeden z n�s.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Vem si n�jak� lep�� oble�en� na lov.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Tady je jedno z na�ich brn�n�. Vypad� to, �e ti sedne.
	CreateInvItems(self,itar_pir_m_addon,1);
	b_giveinvitems(self,other,itar_pir_m_addon,1);
	AI_EquipArmor(hero,itar_pir_m_addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//A nefl�kej se s t�m, jasn�?
	Info_ClearChoices(dia_addon_greg_joinpirates);
};

func void dia_addon_greg_joinpirates_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//M�m to ud�lat s�m?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Vem si p�r chlap�, pokud chce�.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//M�li by rad�i makat, ne� se tady cel� den poflakovat.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg �ekl, �e si m��u vz�t na pomoc p�r chlap�.");
};

func void dia_addon_greg_joinpirates_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Jak� potvory?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//B�itvy z ka�onu se dost�vaj� ka�d�m dnem bl�e k t�boru.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nechci, aby byl n�kter� z m�ch chlap� se�r�n.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Jdeme jenom po b�itv�ch.");
};


instance DIA_ADDON_GREG_ABOUTCANYON(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_aboutcanyon_condition;
	information = dia_addon_greg_aboutcanyon_info;
	permanent = TRUE;
	description = "O pr�ci v ka�onu ...";
};


func int dia_addon_greg_aboutcanyon_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_greg_aboutcanyon_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//O �kolu v ka�onu ...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Ano, co je s t�m?
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
	if(c_allcanyonrazordead() == FALSE)
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,DIALOG_BACK,dia_addon_greg_aboutcanyon_back);
		if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
		{
			Info_AddChoice(dia_addon_greg_aboutcanyon,"Kdo mi m��e pomoct?",dia_addon_greg_aboutcanyon_compadres);
		};
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Kter� nestv�ry m�m zab�t?",dia_addon_greg_aboutcanyon_job);
	}
	else
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Zabil jsem v�echny b�itvy.",dia_addon_greg_aboutcanyon_razorsdead);
	};
};

func void dia_addon_greg_aboutcanyon_back()
{
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kdo mi m��e pomoci?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Vezmi s sebou p�r chlap�.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Stejnak jenom mrhaj� �asem.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Kter� potvory m�m zab�t?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Zabij b�itvy! Zbytek toho zv��ince je ne�kodn�.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_razorsdead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Zabil jsem v�echny b�itvy.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Velmi dob�e. Vypad� to, �e jsi docela u�ite�n�.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg vypad�, �e je trochu ohromen� t�m, �e jsem zabil v�echny b�itvy v ka�onu.");
	MIS_ADDON_GREG_CLEARCANYON = LOG_SUCCESS;
	b_addon_piratesgohome();
	b_giveplayerxp(XP_ADDON_CLEARCANYON);
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};


instance DIA_ADDON_GREG_BANDITARMOR(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditarmor_condition;
	information = dia_addon_greg_banditarmor_info;
	permanent = TRUE;
	description = "Pot�ebuji brn�n� bandit�.";
};


func int dia_addon_greg_banditarmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Pot�ebuji brn�n� bandit�.
	if(MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Bu� nejd��v u�ite�n�. Pot� si o tom m��eme promluvit.
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Nejd��v zabij v�echny b�itvy v ka�onu!
		};
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Greg po m� chce, abych mu pomohl dostat t�bor na nohy. Pot� si m��eme promluvit o brn�n�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Jsi opravdu docela dobr�.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Vlastn� chci, aby Bones pou�il tu zbroj ke �pehov�n� bandit�.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale bude lep��, kdy� ten �kol d�m TOB�.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//M� v�t�� �anci se odtamtud dostat v jednom kuse.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Promluv si s Bonesem. D� ti brn�n�. Vezmi ho, a vydej se do t�bora bandit�.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Mus�m v�d�t, pro� se ti bastardi dostali do �dol�, jako prvn�.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Ano, ano kapit�ne!
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Te�, kdy� jsem skoncoval s b�itvami, m��u si vybrat brn�n� u Bonese.");
		Log_CreateTopic(TOPIC_ADDON_SCOUTBANDITS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_SCOUTBANDITS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,"M�m pro Grega zjistit, pro� bandit� p�i�li do �dol�.");
		MIS_GREG_SCOUTBANDITS = LOG_RUNNING;
	};
};


instance DIA_ADDON_GREG_AUFTRAEGE2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_auftraege2_condition;
	information = dia_addon_greg_auftraege2_info;
	description = "Je tady je�t� n�co, co m�m ud�lat?";
};


func int dia_addon_greg_auftraege2_condition()
{
	if((MIS_GREG_SCOUTBANDITS != 0) && ((c_towerbanditsdead() == FALSE) || ((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void dia_addon_greg_auftraege2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Je tady je�t� n�co, co m�m ud�lat?
	if((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Z�padn� pl� je st�le pln� potvor.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan opravdu nepohne ani prstem.
		Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Greg chce, abych se postaral o pl�. Je pln� nestv�r a pot�ebuje vy�istit.");
		MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	};
	if(c_towerbanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//V ji�n� v�i na skal�ch jsou st�le bandit�.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Vlastn�, Francis byl pov��en, aby se o to postaral.
		Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Greg chce, abych vyhnal bandity z v�e na v�chod od t�bora.");
		MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Jestli chce�, m��e� na to dohl�dnout.
};


instance DIA_ADDON_GREG_SAUBER2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_sauber2_condition;
	information = dia_addon_greg_sauber2_info;
	description = "Severn� pl� je vy�i�t�n�.";
};


func int dia_addon_greg_sauber2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_sauber2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Severn� pl� je vy�i�t�n�.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Velmi dob�e. Tady je odm�na.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Ohl�sil jsem vy�i�t�n� severn� pl�e Gregovi.");
	MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
};


instance DIA_ADDON_GREG_BANDITPLATT2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditplatt2_condition;
	information = dia_addon_greg_banditplatt2_info;
	description = "Bandit� z v�e jsou pry�.";
};


func int dia_addon_greg_banditplatt2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && (c_towerbanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditplatt2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandit� z v�e jsou pry�.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Skv�l�. To byla dobr� pr�ce. Tady je tv�j plat.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandit� z v�e jsou mrtv�. Greg je s t�m velmi spokojen�.");
	MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
};


instance DIA_ADDON_GREG_BANDITGOLDMINE(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditgoldmine_condition;
	information = dia_addon_greg_banditgoldmine_info;
	permanent = TRUE;
	description = "Bandit� nalezli zlat� d�l.";
};


func int dia_addon_greg_banditgoldmine_condition()
{
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (MIS_GREG_SCOUTBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditgoldmine_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandit� nalezli zlat� d�l.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//V�d�l jsem to! TO je to, pro� sem p�i�li.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikdo nebude dobrovoln� ��t v t� nestv�rami zamo�en� ba�in�.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobr� pr�ce, tady n�co m�.
	b_giveinvitems(self,other,itri_addon_str_01,1);
	b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Informoval jsem Grega o zlat�m dole.");
	MIS_GREG_SCOUTBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_GREG_SCOUTBANDITS);
};


instance DIA_ADDON_GREG_WHOAREYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_whoareyou_condition;
	information = dia_addon_greg_whoareyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_addon_greg_whoareyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == FALSE) && (SC_MEETSGREGTIME == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_whoareyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Jsem Greg, velitel tohoto t�bora.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//��astn�?
};


instance DIA_ADDON_GREG_NICETOSEEYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_nicetoseeyou_condition;
	information = dia_addon_greg_nicetoseeyou_info;
	permanent = FALSE;
	description = "Jak jsi se sem vlasn� dostal?";
};


func int dia_addon_greg_nicetoseeyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nicetoseeyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak jsi se sem vlasn� dostal?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Ne�ekal jsi, �e m� tu uvid�, he?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Jenom si to vyjasn�me. Jsem Greg a tohle je m�j t�bor.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//��astn�?
};


instance DIA_ADDON_GREG_STORY(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 99;
	condition = dia_addon_greg_story_condition;
	information = dia_addon_greg_story_info;
	permanent = TRUE;
	description = "Je tady je�t� jedna v�c, kterou chci v�d�t.";
};


func int dia_addon_greg_story_condition()
{
	if(((Npc_KnowsInfo(other,dia_addon_greg_whoareyou) == TRUE) || (Npc_KnowsInfo(other,dia_addon_greg_nicetoseeyou) == TRUE)) && (MIS_GREG_SCOUTBANDITS != 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_story_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Je tady je�t� jedna v�c, kterou chci v�d�t.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co to je?
	Info_ClearChoices(dia_addon_greg_story);
	Info_AddChoice(dia_addon_greg_story,DIALOG_BACK,dia_addon_greg_story_back);
	Info_AddChoice(dia_addon_greg_story,"Jak jsi se sem dostal?",dia_addon_greg_story_way);
	Info_AddChoice(dia_addon_greg_story,"Kde m� lo�?",dia_addon_greg_story_ship);
	if(RAVENISDEAD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_story,"Co v� o Ravenovi?",dia_addon_greg_story_raven);
	};
};

func void dia_addon_greg_story_back()
{
	Info_ClearChoices(dia_addon_greg_story);
};

func void dia_addon_greg_story_way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Na�el jsem tunel. Ve star� pyramid�. Byl hl�dan� p�r m�gy.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Ti slep� zasv�cenci o m� nezavadili ani pohledem.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Nejd��v jsem si myslel, �e to je jen poh�ebn� s�� a cht�l jsem se mrknou, jestli tam nen� n�co cenn�ho.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Opravdu dost jsem z�ral, kdy� jsem vy�el ve sv�m milovan�m �dol�.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Za�al jsem si myslet, �e jsem uniknul domobran� na zbytek sv�ho �ivota.
};

func void dia_addon_greg_story_ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Kde je tvoje lo�?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nebude� tomu v��it. ��dn� lo� mezi pevninou a ostrovem nebyla v dohledu cel� m�s�ce.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Cel� m�s�ce! - A prvn� lo�, kter� p�ipluje je pln� obsazen� v�le�n� lo� kr�le.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Pln� paladin� od spodku a� po vr�ek sto��ru.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//To je to, �emu j� ��k�m sm�la.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//M��e� to ��ci znova. Stahlo n�s to jak nic. Jsem jedin�, kdo to zvl�dl na b�eh.
};

func void dia_addon_greg_story_raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co v� o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//V�m, �e byl rudn� baron. Velk� ��slo v kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nev�m, pro� je tady, nebo pro� ho lid� n�sleduj�.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale jsem si jist�, �e n�co chyst�. Nen� typ, kter� by se schoval v ba�in�.
};


instance DIA_ADDON_GREG_RAVENDEAD(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_ravendead_condition;
	information = dia_addon_greg_ravendead_info;
	description = "Raven pat�� minulosti.";
};


func int dia_addon_greg_ravendead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_ravendead_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Raven pat�� minulosti.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//ڞasn�! To jsem ne�ekal. Na�apal jsi ho se sta�enejma kalhotama, co?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Za to ti d�m 500 zla��k�.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Jsi opravdov� ni�itel zla. To je dob�e.
	b_giveplayerxp(XP_ADDON_GREGRAVENLOHN);
};

