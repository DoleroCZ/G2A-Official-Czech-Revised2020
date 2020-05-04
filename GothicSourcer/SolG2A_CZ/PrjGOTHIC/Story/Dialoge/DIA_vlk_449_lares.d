
instance DIA_ADDON_LARES_PATCH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 99;
	condition = dia_addon_lares_patch_condition;
	information = dia_addon_lares_patch_info;
	description = "(��dat zlomek z ornamentu)";
};


func int dia_addon_lares_patch_condition()
{
	if(Npc_HasItems(self,itmi_ornament_addon_vatras) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_patch_info()
{
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
};


instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_HALTSMAUL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_haltsmaul_condition;
	information = dia_addon_lares_haltsmaul_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_haltsmaul_condition()
{
	if((LARES_HALTSMAUL == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_haltsmaul_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Uvid�me se pozd�ji v doc�ch.
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	if(RANGERMEETINGRUNNING == 0)
	{
		return TRUE;
	};
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//J� jsem se musel zbl�znit. Co tady d�l�?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ty jsi sem P�IPLAVAL?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(sm�ch) Je to jedin� cesta, jak obej�t str�e u br�ny.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Nevid�li jsme se u�?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hej, Laresi, ty starej pard�le!",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Nevid�li jsme se u�?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Chlape, to si m� v�n� nepamatuje�? Poflakoval jsem se kolem Nov�ho t�bora.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Seznam pro doly... Chlape, u�ili jsme si spolu spoustu srandy. Pamatuje� si Leeho?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Samoz�ejm�, �e si pamatuju na Leeho!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej, Laresi, ty starej mizero, jak ses sem dostal?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Poda�ilo se mi ut�ct z Hornick�ho �dol� pr�v� v�as. Spolu s Leem a je�t� n�kolika dal��ma chlapama.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamatuje� si p�ece Leeho, ne?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Samoz�ejm�, �e si pamatuju na Leeho!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Tak s n�m jsem se dostal z kolonie. Hned po zni�en� bari�ry.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Je se svejma klukama na Onarov� farm�.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//M� s t�m farm��em dohodu. On se sv�mi chlapci br�n� farmu a Onar je na opl�tku �iv�.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Samoz�ejm�, �e si pamatuju na Leeho!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Ty ses trochu pra�til, co? Lee byl velitelem �old�k� v Nov�m t�bo�e.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_ADDON_LARES_VATRAS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_vatras_condition;
	information = dia_addon_lares_vatras_info;
	description = "Vatras m� poslal. ��kal, �e bys mi mohl pomoct.";
};


func int dia_addon_lares_vatras_condition()
{
	if(VATRAS_GEHZULARES == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_lares_vatras_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras m� poslal. ��kal, �e bys mi mohl pomoct.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(p�ekvapen�) Ty u� ses setkal s Vatrasem. Jist� jsi na n�j ud�lal dojem.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//On by ti jinak jist� m� jm�no nedal. Obzvl�t� dokud se nevy�e�� p��pad s mizen�m lid�.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Dobr�, co pot�ebuje�?
	LARES_RANGERHELP = TRUE;
	if(GREGLOCATION == GREG_FARM1)
	{
		b_startotherroutine(bau_974_bauer,"GregInTaverne");
		GREGLOCATION = GREG_TAVERNE;
		b_startotherroutine(greg_nw,"Taverne");
	};
};


instance DIA_ADDON_LARES_WHATAREYOUGUYS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_addon_lares_whatareyouguys_condition;
	information = dia_addon_lares_whatareyouguys_info;
	description = "Co m� co d�lat s Vatrasem?";
};


func int dia_addon_lares_whatareyouguys_condition()
{
	if((LARES_RANGERHELP == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_whatareyouguys_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co m� co d�lat s Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//�ekn�m�, �e m�m malou dohodu s m�gy Vody. Sta��?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakou dohodu?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//Pracujeme pro n� a oni se staraj�, abychom se nedostali do pr�seru, v�ak to zn� z trestaneck� kolonie.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Mluv� o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//(p�ekvapen�) Co o tom v�?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi o n�m �ekl.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Pro� ses o tom nezm�nil u� na za��tku na�eho rozhovoru?
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares pat�� ke 'Kruhu Vody'.");
};


instance DIA_ADDON_LARES_RANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ranger_condition;
	information = dia_addon_lares_ranger_info;
	description = "�ekni mi v�c o 'Kruhu Vody'.";
};


func int dia_addon_lares_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//�ekni mi v�c o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//'Kruh' je m�g�m Vody t�m, ��m jsou paladinov� m�g�m Ohn�.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//Narozd�l od paladin� 'Kruh' rad�ji stoj� v pozad�.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//'Kruh' je mocnou zbran� proti nebezpe��m, kter� hroz� lidem v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Ale m��eme pracovat pouze pokud nikdo nev�, kdo ke 'Kruhu' pat��.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Prost� o tom nemluv!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Jasn�.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"'Kruh' je pro M�gy vody jako to, co jsou paladinov� pro M�gy ohn�, jen 'Kruh' pracuje tajn�. Mimo to, nikdo by nem�l v�d�t, kdo tam PAT��. Proto z�st�v� jejich s�la skryta.");
};


instance DIA_ADDON_LARES_WANNABERANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_wannaberanger_condition;
	information = dia_addon_lares_wannaberanger_info;
	description = "R�d bych se p�ipojil ke 'Kruhu Vody' ...";
};


func int dia_addon_lares_wannaberanger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ranger) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//R�d bych se p�ipojil ke 'Kruhu Vody' ...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//To zn� dob�e. Nicm�n�, o tom rozhoduj� m�gov� Vody.
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	Info_ClearChoices(dia_addon_lares_wannaberanger);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Aha.",dia_addon_lares_wannaberanger_back);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Tak co obn�� b�t �lenem 'Kruhu'?",dia_addon_lares_wannaberanger_howisit);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Cos ud�lal ty, abys zaujal m�gy Vody?",dia_addon_lares_wannaberanger_aboutyou);
};

func void dia_addon_lares_wannaberanger_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Aha.
	Info_ClearChoices(dia_addon_lares_wannaberanger);
};

func void dia_addon_lares_wannaberanger_aboutyou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Cos ud�lal ty, abys zaujal m�gy Vody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chr�nil jsem je dlouho, zat�mco jsme �ili je�t� v bari��e.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(usm�v� se) A je ur�it� je�t� mnoho d�vod�, aby mi byli vd��n�.
};

func void dia_addon_lares_wannaberanger_howisit()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Tak co obn�� b�t �lenem 'Kruhu'?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//My jsme velice odli�n� od ostatn�ch obvykl�ch gild, kter� m��e� naj�t v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jakmile jsi jedn�m z n�s, u� si nem��e� d�lat, co bys cht�l.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Nejd�le�it�j�� je dr�et hubu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujeme skryt�, neodhaleni. Ostatn� nev�, kdo k n�m pat��.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Budeme t� sledovat. Pak uvid�me.
};

func void b_lares_geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Brzy bude tajn� setk�n� v Orlanov� hospod�.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//P�ij� hned, jakmile bude� moci. Dostane� tam sv� vybaven�.
};


instance DIA_ADDON_LARES_RINGBACK(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback_condition;
	information = dia_addon_lares_ringback_info;
	description = "Nyn� jsem �lenem 'Kruhu Vody'.";
};


func int dia_addon_lares_ringback_condition()
{
	if((SC_ISRANGER == TRUE) && (MIS_ADDON_LARES_COMETORANGERMEETING != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Nyn� jsem �lenem 'Kruhu Vody'.
	if((LARES_GOTRINGBACK == FALSE) && (SC_GOTLARESRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Skv�l�! M��u nyn� dostat sv�j akvamar�nov� prsten zp�t?
		if(b_giveinvitems(other,self,itri_ranger_lares_addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jist�.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Douf�m, �e ti bude u�ite�n�. R�d vid�m, �e jsi nyn� jedn�m z n�s.
			LARES_GOTRINGBACK = TRUE;
			b_giveplayerxp(XP_AMBIENT);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Dob�e, se mnou se ti te� nic nestane.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Neztra� ho! St�le ho pot�ebuji.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Nyn� bys ur�it� r�d dostal nov� vybaven� do sv�ch rukou, �e? Dobr�, poslouchej.
	b_lares_geheimtreffen();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares m� pozval na tejn� setk�n� 'Kruhu Vody' do Orlanovy hospody.");
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
};


instance DIA_ADDON_LARES_RINGBACK2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback2_condition;
	information = dia_addon_lares_ringback2_info;
	description = "Tady je tv�j akvamar�nov� prsten.";
};


func int dia_addon_lares_ringback2_condition()
{
	if(Npc_HasItems(other,itri_ranger_lares_addon) && (LARES_GOTRINGBACK == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback2_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Toto je tv�j akvamar�nov� prsten.
	b_giveinvitems(other,self,itri_ranger_lares_addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//No. M� �t�st�. U� jsem myslel, �e jsi ho ztratil.
	b_giveplayerxp(XP_AMBIENT);
	LARES_GOTRINGBACK = TRUE;
};


instance DIA_ADDON_LARES_GEDULD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_geduld_condition;
	information = dia_addon_lares_geduld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_geduld_condition()
{
	if((RANGERMEETINGRUNNING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_geduld_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Po�kej chv�li. St�le �ek�me na n�kter� dal�� �leny.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GETRANGERARMOR(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_getrangerarmor_condition;
	information = dia_addon_lares_getrangerarmor_info;
	important = TRUE;
};


func int dia_addon_lares_getrangerarmor_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RANGERMEETINGRUNNING == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_getrangerarmor_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Tak, m�j mlad� p��teli. Dnes jsme zde p�i�li oslavit tv� p�ijet� do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Tihle chl�pci nyn� na tebe budou dohl�et a starat se o tebe.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Ne v�ichni �lenov� 'Kruhu Vody' dorazili. Tak bu� opatrn�.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez ohledu na tv� �sp�chy �i ne�sp�chy - budeme o tom v�d�t.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Nyn� ti tak� d�m tv� brn�n�.
	CreateInvItem(hero,itar_ranger_addon);
	AI_EquipArmor(hero,itar_ranger_addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Nos ho s p�chou, ale neukazuj se v n�m ve m�st� nebo jin�ch ve�ejn�ch lokalit�ch.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pamatuj, na�e spole�enstv� nesm� b�t prozrazeno. Nikdo nesm� v�d�t, �e pat�� do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikdo nemluv� o 'Kruhu Vody'. To je prvn� a nejd�le�it�j�� pravidlo. Nezapom��.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//N�jak� dal�� ot�zky?
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Mus�m u� j�t.",dia_addon_lares_getrangerarmor_end);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"A jak mi m��e� pomoci?",dia_addon_lares_getrangerarmor_learn);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Co zbran�?",dia_addon_lares_getrangerarmor_weapons);
};

func void dia_addon_lares_getrangerarmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//Co zbran�?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//H�l je zbra� 'Kruhu'. Ale ka�d� m��e pou��vat jakou zbra� chce.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Zde je tv� zbra�, nikdy jsem ji ve skute�nosti nepou�il. Mo�n� ti poslou�� l�pe.
	CreateInvItems(self,itmw_rangerstaff_addon,1);
	b_giveinvitems(self,other,itmw_rangerstaff_addon,1);
};

func void dia_addon_lares_getrangerarmor_end()
{
	b_makerangerreadytoleavemeetingall();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Mus�m u� j�t.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Dob�e, nechceme t� zdr�ovat.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//B� za Vatrasem a on ti d� prvn� �kol.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//�lenov� 'Kruhu', vra�te se ke sv�m povinnostem.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Banditi je�t� nep�estali �to�it. Mus�me vy�e�it tento probl�m.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanosi, udr�uj po��dek v tomto sv�t�.
	LARES_TAKEFIRSTMISSIONFROMVATRAS = TRUE;
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,DIALOG_ENDE,dia_addon_lares_getrangerarmor_weiter);
};

func void dia_addon_lares_getrangerarmor_weiter()
{
	AI_StopProcessInfos(self);
	b_rangermeetingparking();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Dostal jsem sv� brn�n� na tajn�m setk�n� 'Kruhu Vody' v Orlanov� hospod�. M�l bych nyn� j�t za Vatrasem pro sv�j prvn� �kol jako �len 'Kruhu'.");
};

func void dia_addon_lares_getrangerarmor_learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//A jak mi m��e� pomoci?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//M��u ti pomoci zlep�it se v s�le.
	if(Npc_IsDead(sld_805_cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Jestli chce� zlep�it sv� schopnosti v boji se zbran�mi nabl�zko, promluv si s Cordem. On je p�n me�e.
	};
	if(Npc_IsDead(bau_961_gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann t� nau��, jak z�skat ze zv��e trofeje.
	};
	if(Npc_IsDead(mil_350_addon_martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Jestli chce� v�d�t v�ce o paladinech, promluv si s Martinem.
	};
	if(Npc_IsDead(bau_4300_addon_cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn t� nau��, jak se pl�it a boji s jednoru�n�mi zbran�mi. Tak� t� nau�� zach�zet s lukem.
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Promluv si s Orlanem, pokud zde bude� cht�t str�vit noc.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//A jestli t� zaj�m� magie, m��e� se na n�co zeptat Vatrase.
};


instance DIA_ADDON_LARES_TELEPORTSTATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_teleportstation_condition;
	information = dia_addon_lares_teleportstation_info;
	description = "U� jsi n�kdy pou�il teleporta�n� k�men?";
};


func int dia_addon_lares_teleportstation_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SCUSED_TELEPORTER == TRUE) && (MIS_LARES_BRINGRANGERTOME != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_teleportstation_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//U� jsi n�kdy pou�il teleporta�n� k�men?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Ne, ale sly�el jsem o tom. M�gov� Vody nev� p�esn�, co si o t�chto v�cech maj� myslet.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//U� jsem jeden vyzkou�el.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(sm�je se) M�l jsem si to myslet. Je v�bec n�co, co bys neud�lal?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Dob�e, jestli chce� pou��t jednu z t�chto v�c�, zeptej se Orlana - hospodsk�ho - jestli ti povol� vstup do jeskyn�, kter� je zamkl�.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Mysl�m, �e je skryt� teleporta�n� k�men k m�g�m Vody nedaleko jeho hospody.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Opus� m�sto v�chodn� branou a prost� b� po cest�. Nev�m, jak bys to mohl minout.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Lares mi �ekl, �e bl�zko Orlanovy hospody je skryt� teleporta�n� k�men.");
	ORLAN_HINT_LARES = TRUE;
};


instance DIA_ADDON_LARES_ORNAMENT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornament_condition;
	information = dia_addon_lares_ornament_info;
	description = "Vatras mi pro tebe dal tento ornament...";
};


func int dia_addon_lares_ornament_condition()
{
	if(Npc_HasItems(other,itmi_ornament_addon_vatras) && Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras mi pro tebe dal tento ornament. �ekl, �e ho m� vr�tit.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(povzdechne si) Jak� p�ekvapen�. Zase je to na mn�. Mohl jsem si to myslet.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Nyn� mus�m j�t p�es cel� ostrov, abych to vr�til m�g�m Vody.
};


instance DIA_ADDON_LARES_ORNAMENTBRINGJOB(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornamentbringjob_condition;
	information = dia_addon_lares_ornamentbringjob_info;
	description = "Ud�l�m to pro tebe!";
};


func int dia_addon_lares_ornamentbringjob_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornamentbringjob_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Ud�l�m to pro tebe!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(uva�uje) Hmm . Mysl�m, �e bude lep��, kdy� tam ten ornament donesu osobn�. Nicm�n� se ke mn� m��e� p�idat.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Bohu�el, nem��u opustit toto m�sto. Mus�m sledovat doky.
	b_logentry(TOPIC_ADDON_KDW,"Donesl jsem Laresovi Vatras�v ornament. Chce, abychom ho donesli M�g�m vody a Lares by m� m�l doprov�zet.");
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_RUNNING;
};


instance DIA_ADDON_LARES_YOURMISSION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_yourmission_condition;
	information = dia_addon_lares_yourmission_info;
	permanent = TRUE;
	description = "Co p�esn� d�l� tady v p��stavu?";
};


func int dia_addon_lares_yourmission_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_LARES_BRINGRANGERTOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_yourmission_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Co p�esn� d�l� tady v p��stavu?
	if(!Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Nem��u o tom mluvit.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras by mi srazil hlavu ...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//D�l�m, co d�l�me my v�ichni. Pln�me �koly, kter� dostaneme od m�g� Vody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//N�kte�� ze zmizel�ch lid� jsou ryb��i. Dokonce jejich lod� zmizely.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//To je, pro� jsem zde a sleduji doky. Mo�n� zde n�co najdu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mohl bys mi pomoci.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Poslouchej, d�m ti sv�j akvamar�nov� prsten. Je to znak 'Kruhu Vody'.
		CreateInvItems(self,itri_ranger_lares_addon,1);
		b_giveinvitems(self,other,itri_ranger_lares_addon,1);
		SC_GOTLARESRING = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Nasa� si ho a ostatn� poznaj�, �e pracuje� pro m�.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Najdi za m� n�hradu a tak budeme moci vr�tit ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Jeden z n�s obvykle sleduje tr�i�t�. Nen� tam pr�v� zapot�eb�.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Prost� mluv s lidmi. Spr�vn� osoba t� pozn� d�ky m�mu prstenu na tv�m prst�.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//�ekni mu, �e hled�m n�hradu.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares mi dal sv�j akvamar�nov� prsten se zna�kou 'Kruhu'. Nasazen� prsten v�ichni �lenov� 'Kruhu' poznaj� a p�ijmou m�.");
		Log_CreateTopic(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Lares nem��e opustit p��stav. M�l bych prozkoumat tr�i�t� s nasazen�m akvamar�nov�m prstenem, abych na�el za Larese n�hradu.");
		MIS_LARES_BRINGRANGERTOME = LOG_RUNNING;
	};
};


instance DIA_ADDON_LARES_BALTRAMABLOESE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_baltramabloese_condition;
	information = dia_addon_lares_baltramabloese_info;
	description = "Mluvil jsem s Baltramem...";
};


func int dia_addon_lares_baltramabloese_condition()
{
	if((MIS_LARES_BRINGRANGERTOME == LOG_RUNNING) && (BALTRAM_EXCHANGE4LARES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_baltramabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Mluvil jsem s Baltramem. Najde n�koho, kdo t� nahrad�.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Velmi dob�e. Alespo� odsud m��eme vypadnout.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//M��e� si nyn� nechat m�j akvamar�nov� prsten.
		if(Npc_KnowsInfo(other,dia_addon_lares_wannaberanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(sm�je se) �ekl bych, �e se ti bude hodit, dokud nedostane� sv�j vlastn�.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(sm�je se) Mo�n� se k n�m nakonec rozhodne� i p�idat ...
		};
	};
	MIS_LARES_BRINGRANGERTOME = LOG_SUCCESS;
	LARES_CANBRINGSCTOPLACES = TRUE;
};


var int lares_peoplemissing_perm;

instance DIA_ADDON_LARES_PEOPLEMISSING(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_addon_lares_peoplemissing_condition;
	information = dia_addon_lares_peoplemissing_info;
	permanent = TRUE;
	description = "O zmizel�ch lidech ...";
};


func int dia_addon_lares_peoplemissing_condition()
{
	if((LARES_RANGERHELP == TRUE) && (LARES_PEOPLEMISSING_PERM == FALSE) && ((SC_ISRANGER == FALSE) || (MISSINGPEOPLERETURNEDHOME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_peoplemissing_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//O zmizel�ch lidech ...
	Info_ClearChoices(dia_addon_lares_peoplemissing);
	Info_AddChoice(dia_addon_lares_peoplemissing,DIALOG_BACK,dia_addon_lares_peoplemissing_back);
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Ud�lal jsem to, abych zachr�nil n�kter� ze zmizel�ch lid�.",dia_addon_lares_peoplemissing_saved);
	}
	else if((MIS_LARES_BRINGRANGERTOME != 0) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"V�m, kde jsou zmizel� lid� te�!",dia_addon_lares_peoplemissing_success);
	}
	else
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"A nen� to n�hodou pr�ce domobrany?",dia_addon_lares_peoplemissing_mil);
		Info_AddChoice(dia_addon_lares_peoplemissing,"�ekni mi, co o nich v�.",dia_addon_lares_peoplemissing_tellme);
	};
};

func void dia_addon_lares_peoplemissing_back()
{
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_tellme()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//�ekni mi, co o nich v�.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Ryb�� tady z Khorinisu - William - byl prvn�. Prost� se jednoho dne nevr�til.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Prvn� jsme si mysleli, �e se stal ob�t� i s jeho lo�kou n�jak� mo�sk� obludy, kdy� ryba�il venku.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Ale brzy za�ali mizet dal��. A nezd�lo se, �e by za t�m bylo n�co jin�ho.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dosud jsme byli celkem bezradn�. Vypad� to, �e mus�me �ekat na n�jakou n�hodu �i d�kaz, kter� objev�me.
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
};

func void dia_addon_lares_peoplemissing_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//A nen� to n�hodou pr�ce domobrany?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Kdyby byli schopn� n�co ud�lat.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nena�li jedin� d�kaz. Lid� mizeli beze stopy.
};

func void dia_addon_lares_peoplemissing_success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//V�m, kde zmizel� lid� jsou.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(p�ekvapen�) Je to tak?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//B�val� rudobaron RAVEN je zajal.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jsi si jist? Mus�me je pak n�jak zachr�nit.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracuji na tom.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//V po��dku. V�, kde m� hledat, kdybys pot�eboval pomoc ...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... v�m, kde je naj�t. Dostaneme je.
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_saved()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Zvl�dl jsem to. Osvobodil jsem v�echny poh�e�ovan� lidi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//V�d�l jsem , �e to dok�e�. Kone�n� se mohu soust�edit na svou pr�ci.
	b_giveplayerxp(XP_AMBIENT);
	LARES_PEOPLEMISSING_PERM = TRUE;
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};


var int dia_addon_lares_rangerhelp_gilde_onetime_waffe;
var int dia_addon_lares_rangerhelp_gilde_onetime_geld;
var int dia_addon_lares_rangerhelp_gilde_onetime_ruestung;

instance DIA_ADDON_LARES_RANGERHELP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_rangerhelp_condition;
	information = dia_addon_lares_rangerhelp_info;
	permanent = TRUE;
	description = "Pot�ebuji tvou pomoc.";
};


func int dia_addon_lares_rangerhelp_condition()
{
	if(((LARES_RANGERHELP == TRUE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE)) || Npc_IsInState(moe,zs_attack))
	{
		return TRUE;
	};
};

func void dia_addon_lares_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Pot�ebuji tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//A jak ti mohu poslou�it?
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	Info_AddChoice(dia_addon_lares_rangerhelp,DIALOG_BACK,dia_addon_lares_rangerhelp_nix);
	if(Npc_IsInState(moe,zs_attack))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Ten chl�pek tam mi leze na nervy...",dia_addon_lares_rangerhelp_moe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Pot�ebuji lep�� zbra�.",dia_addon_lares_rangerhelp_waffe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"A co tak lep�� brn�n�?",dia_addon_lares_rangerhelp_ruestung);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Pot�ebuji pen�ze.",dia_addon_lares_rangerhelp_geld);
	};
};

func void dia_addon_lares_rangerhelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//A co tak lep�� brn�n�?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Hmm. Mysl�m, �e Mateo prod�v� brn�n�, ale nen� zrovna levn� ...
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Existuje pravd�podobn� levn�j�� cesta, pokud ti nevad� mal� trable s domobranou ...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//Tak jak?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Za Mateov�m obchodem je skladi�t�. Ale v�echno zbo�� bylo skonfiskov�no domobranou.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Nav�tiv Zurise na tr�i�ti, kup si od n�j svitek se "sp�nkem" a pou�ij ho na str� u skladu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//�ekl bych, �e kolem Mateova obchodu se v�lela p�kn� zbroj.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG = TRUE;
};

func void dia_addon_lares_rangerhelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Pot�ebuji lep�� zbra�.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Sorry, ale s t�mto ti nepomohu. U� jsi byl na tr�i�ti?
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE = TRUE;
};

func void dia_addon_lares_rangerhelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Pot�ebuji pen�ze.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//Pro� ne? Promi�, nem��u ti p�j�it. Ale Lehmar - lichv�� - mi dlu�� laskavost.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Jen mu �ekni a dostane� pen�ze, kter� pot�ebuje�. J� se u� o zbytek postar�m. Najde� ho po cest� k dok�m u vstupu do doln� ��sti m�sta.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD = TRUE;
	RANGERHELP_LEHMARKOHLE = TRUE;
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_nix()
{
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_moe()
{
	AI_Output(other,self,"DIA_Addon_Lares_Moe_15_00");	//Ten chlap mi leze na nervy ...
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Po�kej chvili�ku ...
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,moe,AR_GUARDSTOPSFIGHT,0);
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "Mus�m za ka�dou cenu mluvit s paladiny!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Mus�m za ka�dou cenu mluvit s paladiny!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Co od NICH chce�?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Maj� mocn� amulet, Innosovo oko. Mus�m ho m�t.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//A to si mysl�, �e ti ho daj�? Nikdy se nedostane� ani do horn� ��sti m�sta.
	if(!Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//N�jak� zp�sob se najde.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasn�, jestli chce� podlejzat m욝an�m nebo d�lat poskoka domobran�...
	};
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "V�, pro� tu jsou paladinov�?";
};


func int dia_lares_whypalhere_condition()
{
	if(other.guild == GIL_NONE)
	{
		if(Npc_KnowsInfo(other,dia_lares_paladine) || (RANGERHELP_GILDEMIL == TRUE) || (RANGERHELP_GILDESLD == TRUE) || (RANGERHELP_GILDEKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//V�, pro� tu jsou paladinov�?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikdo to nev� jist�. Hodn� lid� si mysl�, �e to je kv�li sk�et�m, ale j� si mysl�m, �e tu je jinej d�vod.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Nejsp� to m� co d�lat se starou trestaneckou koloni�.
};


instance DIA_ADDON_LARES_GILDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_gilde_condition;
	information = dia_addon_lares_gilde_info;
	permanent = TRUE;
	description = "Vatras se zm�nil...";
};


func int dia_addon_lares_gilde_condition()
{
	if((LARES_RANGERHELP == TRUE) && (other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_gilde_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras se zm�nil, �e bys mi mohl pomoct p�idat se k jedn� gild�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(posm�n�) Horliv� pracovn� posila, �e?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Dobr�, poslouch�m.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//M��u zkusit domluvit �oldn���m, kdyby ses cht�l p�ipojit k Leemu.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Samoz�ejm�, �e je rychlej�� cesta, jak se dostat do kl�tera.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//Nejjednodu��� bude p�idat se k domobran�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Kter� gild� d� p�ednost?
	Info_ClearChoices(dia_addon_lares_gilde);
	Info_AddChoice(dia_addon_lares_gilde,"Mus�m si to cel� je�t� jednou promyslet ...",dia_addon_lares_gilde_back);
	Info_AddChoice(dia_addon_lares_gilde,"M�gov� ohn�.",dia_addon_lares_gilde_kdf);
	Info_AddChoice(dia_addon_lares_gilde,"�old�ci.",dia_addon_lares_gilde_sld);
	Info_AddChoice(dia_addon_lares_gilde,"Domobrana.",dia_addon_lares_gilde_mil);
};

func void dia_addon_lares_gilde_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Mus�m si to je�t� jednou promyslet ...
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_sld()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//�old�ci.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Jsem si jist, �e Lee t� p�iv�t�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Nicm�n�, je tam test, zda-li jsi pou�iteln�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Navrhnul bych si pohovo�it si s Cordem na Onarov� farm�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//M��e ti pomoct s testem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//�ekni mu, �e "�ije� pod m�mi ochran�mi k��dly". On to pochop�.
	RANGERHELP_GILDESLD = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPSLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Lares v���, �e Cord mi pom��e s p�ijet�m na farmu.");
	SC_KNOWSCORDASRANGERFROMLARES = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Domobrana.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(bav� se) �, opravdu si to dok�u p�edstavit, jak si to u�ije�. ��kat jin�m lidem o z�konech, zat�mco bere� jejich pen�ze.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//Paladinov� maj� sv�j sklad na molu. D�stojn�k je m�j dobr� kamar�d.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Mo�n� by ti pomohl. Jmenuje se Martin.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPMIL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Lares mi �ekl, �e d�stojn�k Martin mi pom��e p�idat se k domobran� mnohem rychleji. Obvykle b�v� v p��stavu tam, jak maj� paladinov� sv�j sklad.");
	RANGERHELP_GILDEMIL = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_kdf()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//M�gov� ohn�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(sm�je se) �e to Vatras neo�ek�val? Jinak by t� za mnou asi neposlal.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Kdy� se chce� p�idat ke kl�teru, vyjde t� to dost draho.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Ti chl�p�ci t� nepust� dovnit�, pokud jim nezaplat� poplatek.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//A jedin� osoba, kter� to m��e zm�nit je Vatras. Mysl�m, �e bys s n�m m�l promluvit.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Vatras v�, jak se snadno p�ipojit ke kl�teru.");
	RANGERHELP_GILDEKDF = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};


var int lares_workforlee;
var int lares_waytoonar;

instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = TRUE;
	description = "�ekni mi v�ce o Leem a jeho �old�c�ch ...";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && (LARES_WAYTOONAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//�ekni mi v�ce o Leem a jeho �old�c�ch ...
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co bys r�d v�d�l?
	Info_ClearChoices(dia_lares_aboutsld);
	Info_AddChoice(dia_lares_aboutsld,DIALOG_BACK,dia_lares_aboutsld_back);
	Info_AddChoice(dia_lares_aboutsld,"A pro� teda nejsi s Leem a jeho �old�kama?",dia_lares_aboutsld_whynotyou);
	Info_AddChoice(dia_lares_aboutsld,"�ekni mi o �oldn���ch v�c.",dia_lares_aboutsld_sld);
	Info_AddChoice(dia_lares_aboutsld,"Jak najdu farmu velkostatk��e?",dia_lares_aboutsld_waytoonar);
};

func void dia_lares_aboutsld_back()
{
	Info_ClearChoices(dia_lares_aboutsld);
};

func void dia_lares_aboutsld_sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//�ekni mi o �oldn���ch v�c.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Fajn, jestli se� po��d tak tvrdej, jako jsi bejval, nem�l bys s nima m�t ��dnej probl�m.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//V�t�ina z nich jsou rv��i, a jestli se jim nebude� um�t postavit, daleko se nedostane�.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(sm�ch) Jestli se� krapet p�ecitliv�lej, tak nem� �anci s nima vydr�et.
};

func void dia_lares_aboutsld_whynotyou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A pro� teda nejsi s Leem a jeho �old�kama?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale v�dy� jsem! Jenom ne na farm�.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//D� se ��ct, �e ho tady ve m�st� zastupuju. Nechceme, aby ta lo� odplula bez n�s.
	LARES_WORKFORLEE = TRUE;
	Info_AddChoice(dia_lares_aboutsld,"O jak� lodi jsi to mluvil?",dia_lares_aboutsld_schiff);
};

func void dia_lares_aboutsld_schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jak� lodi jsi to mluvil?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Je na otev�en� ��sti p��stavu za �tesem. Lee se chce se svejma p�r lidma odsud v�n� dostat.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale bude to chv�li trvat.
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Pro�?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//M�l by ses na to rad�j zeptat Leeho, kdy� ho potk�... M� dobrej pl�n.
};

func void dia_lares_aboutsld_waytoonar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak najdu farmu velkostatk��e?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//Je to velmi jednoduch�. Opus� m�sto v�chodn� branou a pak b� na sever.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//M��u ti uk�zat cestu, jestli chce�.
	LARES_WAYTOONAR = TRUE;
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 14;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "V� n�co o zlod�jsk�m cechu ve m�st�?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//V� n�co o zlod�jsk�m cechu ve m�st�?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ty tvoje ot�zky...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Samoz�ejm�, m�me tady zlod�jskej cech. Jako v ka�d�m v�t��m m�st�.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//A ka�dej malej zlod�j��ek nebo �melin�� je s n� n�jak propojenej.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 15;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "V�, kde bych ten cech na�el?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//V�, kde bych ten cech na�el?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(sm�ch) Bez ur�ky, ale v�m jen to, �e ti nesm�m nic ��ct.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Tihle lid� na takov� v�ci v�t�inou reaguj� VELMI citliv�.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Jestli se s nima chce� zapl�st, m�l bys b�t hodn� opatrn�.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 16;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "M�m tady tenhle kl��. Je celej zrezlej od mo�sk� vody.";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//M�m tady tenhle kl��. Je celej zrezlej od mo�sk� vody.
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//Tak�e?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//M�m dojem, �e by m� mohl dov�st k �krytu zlod�jsk�ho cechu.
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Fajn, to by moh bejt kl�� od stok.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 17;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Kde najdu ty stoky?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Kde najdu ty stoky?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Co j� v�m... v�t�inou �st� do mo�e.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Ty jsi te� v domobran�!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(sm�ch) To m� p�etrhne - bejvalej trestanec v domobran�...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Tak ty se� te� jedn�m z kr�lovsk�ch paladin�!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(uli�nicky) N�co takov�ho m��e� prov�st jenom ty.
		if(LARES_WORKFORLEE == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(starostliv�) Nepr�skne� m� kv�li moj� spolupr�ci s Leem?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//V�ak m� zn�...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nerozum�m tomu. Vstoupil jsi do kl�tera. Jak� to tam je?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Jin�.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Nedovedu si to p�edstavit.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Sly�el jsem, �e t� Lee p�ijal.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratuluju.
	};
};


instance DIA_ADDON_LARES_FOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_addon_lares_forest_condition;
	information = dia_addon_lares_forest_info;
	description = "M��e� m� doprov�zet na cest� tamt�m hust�m lesem?";
};


func int dia_addon_lares_forest_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lares_forest_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//M��e� m� doprov�zet na cest� tamt�m hust�m lesem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jist�, ale co chce� d�lat na takov�m m�st�?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius mi �ekl, abych se porozhl�dl po dal��ch ornamentech.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z m�st, abych ti �ekl pravdu, je tam na v�chod� v tomto lese.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Vid�m, dost nebezpe�n� pro jednoho, �e?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Bez probl�mu, prost� mi �ekni, kam chce� j�t.
	RANGERHELP_ORNAMENTFOREST = TRUE;
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = TRUE;
	description = "Fajn, jdeme.";
};


func int dia_lares_gonow_condition()
{
	if(((LARES_WAYTOONAR == TRUE) || (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) || (RANGERHELP_ORNAMENTFOREST == TRUE)) && ((LARESGUIDE_ZUMPORTAL == 0) || (LARESGUIDE_ZUMPORTAL == 8)) && ((LARESGUIDE_ZUONAR == FALSE) || (LARESGUIDE_ZUONAR == LOG_SUCCESS)) && ((LARESGUIDE_ORNAMENTFOREST == 0) || (LARESGUIDE_ORNAMENTFOREST == 3)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_goingconditions()
{
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Tak jdeme... Poj� za mnou.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Fajn, jdeme.
	if(LARES_CANBRINGSCTOPLACES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nem��u opustit sv� m�sto, dokud nebudu m�t n�hradu za sebe nebo nevy�e��me z�hadu s mizen�m lid�.
	}
	else if(MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING)
	{
		b_lares_geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Kam?
		Info_ClearChoices(dia_lares_gonow);
		Info_AddChoice(dia_lares_gonow,DIALOG_BACK,dia_lares_gonow_warte);
		if((LARES_WAYTOONAR == TRUE) && (LARESGUIDE_ZUONAR != LOG_SUCCESS))
		{
			Info_AddChoice(dia_lares_gonow,"Na Onarovu farmu.",dia_lares_gonow_onar);
		};
		if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (LARES_ANGEKOMMEN == FALSE))
		{
			Info_AddChoice(dia_lares_gonow,"Okay, vra�me Vatras�v ornament.",dia_lares_gonow_maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LARESGUIDE_ORNAMENTFOREST == 0) && (RANGERHELP_ORNAMENTFOREST == TRUE))
		{
			Info_AddChoice(dia_lares_gonow,"K hust�mu lesu na v�chod.",dia_lares_gonow_forest);
		};
	};
};

func void dia_lares_gonow_maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Okay, vra�me Vatras�v ornament.
	LARESGUIDE_ZUMPORTAL = 1;
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//Na Onarovu farmu.
	LARESGUIDE_ZUONAR = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//K hust�mu lesu na v�chod.
	LARESGUIDE_ORNAMENTFOREST = 1;
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_warte()
{
	Info_ClearChoices(dia_lares_gonow);
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if((LARESGUIDE_ZUONAR == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Tak jsme tady.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Tak tady jsi. U� jsem si za��nal myslet, �e t� se�rali vlci.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Tak�e d�l u� tref� s�m. Mus�m se vr�tit do m�sta, m�m tam je�t� n�jak� vy�izov�n�.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Prost� pokra�uj po t�hle cest� d�l a pamatuj - va� si s�m sebe a nepod�lej se z ka�d� blbosti, pak to pro tebe bude hra�ka.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUONAR = LOG_SUCCESS;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER1(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter1_condition;
	information = dia_addon_lares_arrivedportalinter1_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter1_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LARESGUIDE_ZUMPORTAL == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter1_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Nyn�, kdy� jsme z m�sta venku a nikdo n�s nesleduje, r�d bych ti n�co �ekl.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ornament p�edpokl�d�m vr�t�me Saturasovi. Vzpom�n� si na n�j, ne?
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Jist�. On byl nejvy���m M�gem vody v Nov�m t�bo�e.",dia_addon_lares_arrivedportalinter1_ja);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Saturas? Kdo je to?",dia_addon_lares_arrivedportalinter1_wer);
	LARESGUIDE_ZUMPORTAL = 2;
};

func void dia_addon_lares_arrivedportalinter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Pod�vej, my chlapi z Nov�ho t�bora m�me st�le dobr� vztahy s m�gy Vody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Dokonce i Lee bude chr�nit m�gy Vody, bude-li to nezbytn�.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Str�vil jsem mnoho �asu tady ve m�st� a spolupracoval s Vatrasem a udr�oval kontakt s m�gy Vody.
	b_makerangerreadyformeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A toto je brn�n�, kter� jsme dostali od m�g� Vody. "Kruh Vody" ho nosil je�t� p�ed v�lkou se sk�ety.
	if(CAVALORN_RANGERHINT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//Jak se dostal Cavalorn k v�m? Nevzpom�n�m si, �e by pat�il k Nov�mu t�boru.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//M� pravdu, na�e spole�enstv� se rozrostlo. Dokonce ani j� nev�m, kolik n�s u� je.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale poj�me u�. R�d bych se dostal z tohoto m�sta. Mluvit m��eme cestou.
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
};

func void dia_addon_lares_arrivedportalinter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kdo je to?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//Hmm, nejvy��� m�g Vody v Nov�m t�bo�e. Vr�til se zp�t z Hornick�ho �dol�, kdy� bari�ra padla.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Lee a moje mali�kost jsme ud�lali dohodu s m�gy Vody a spojili sv� s�ly, abychom mohli vzdorovat Star�mu t�boru.
	dia_addon_lares_arrivedportalinter1_teil2();
};

func void dia_addon_lares_arrivedportalinter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jist�. On byl nejvy���m m�gem Vody v Nov�m t�bo�e.
	dia_addon_lares_arrivedportalinter1_teil2();
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter_condition;
	information = dia_addon_lares_arrivedportalinterweiter_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LARESGUIDE_ZUMPORTAL == 2))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Co se d�je? Jsi v po��dku?
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING) && (Npc_GetDistToWP(erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//Ten chl�pek tam m� probl�my s bandity.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//(arogantn�) To je fakt p�kn� v�d�t, ale m�me m�lo �asu.
	};
	LARESGUIDE_ZUMPORTAL = 3;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter2_condition;
	information = dia_addon_lares_arrivedportalinterweiter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LARESGUIDE_ZUMPORTAL == 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Chlape, nevypr�ela u� na�e dohoda?
	LARESGUIDE_ZUMPORTAL = 4;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter2_condition;
	information = dia_addon_lares_arrivedportalinter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LARESGUIDE_ZUMPORTAL == 4))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//M�gov� Vody jsou �pln� napjat�. Kopou na severov�chod� u� t�dny. Nem�m potuchy, co tam hledaj�.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Cel� zem se za�ala ot��sat, jako kdy� padla bari�ra.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Jako ve zl�m snu se probudily kamenn� p��ery a za�to�ili na v�e, co se ocitlo v jejich bl�zkosti.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//M�gov� Vody na to dohl�� a zni�ili v�echny nep��telsk� potvory. A nyn� kopaj� kolem a hledaj� vysv�tlen� t�ch ud�lost�.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale brzy to uvid� na vlastn� o�i.
	LARESGUIDE_ZUMPORTAL = 5;
	b_logentry(TOPIC_ADDON_KDW,"Lares mi �ekl o vykop�vk�ch m�g� vody. Zaznamenali tam divn� v�ci. Nejsp� tam je zdroj tajemn�ch zem�t�esen� a kamenn�ch monster.");
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER3(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter3_condition;
	information = dia_addon_lares_arrivedportalinterweiter3_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter3_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LARESGUIDE_ZUMPORTAL == 5))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter3_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Jsi v pohod�?
	LARESGUIDE_ZUMPORTAL = 6;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER4(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter4_condition;
	information = dia_addon_lares_arrivedportalinterweiter4_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter4_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LARESGUIDE_ZUMPORTAL == 6))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter4_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Bu� opatrn�, m��e to b�t odsud nebezpe�n�.
	LARESGUIDE_ZUMPORTAL = 7;
};


instance DIA_ADDON_LARES_ARRIVEDPORTAL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportal_condition;
	information = dia_addon_lares_arrivedportal_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportal_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LARESGUIDE_ZUMPORTAL == 7))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportal_info()
{
	b_makerangerreadytoleavemeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//A tak jsme tu.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Vem ten ornament. M�gov� Vody tam n�kde mus� b�t. Dones ho k nim.
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//M�l bys be�et rovnou za Saturasem, pokud bys narazil na potvoru, kter� je siln�j�� ne� ty, a to tak rychle, jak jen bude� moci.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On bude n�jak ovl�dat zv��ata. Mus�m se nyn� vr�tit.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//A je�t� jedna rada. Nepotloukej se tady kolem a be� s t�m rovnou za Saturasem.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Uvid�me se.
	b_logentry(TOPIC_ADDON_KDW,"Lares mi dal ornament do rukou. M�l bych ho doru�it m�gu vody Saturasovi.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUMPORTAL = 8;
	LARES_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_LARES_ALBERN(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_albern_condition;
	information = dia_addon_lares_albern_info;
	important = TRUE;
};


func int dia_addon_lares_albern_condition()
{
	if((LARES_ANGEKOMMEN == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_lares_albern_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(v�n�) Konec srandy! Doru� ten ornament!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GOFORESTPRE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforestpre_condition;
	information = dia_addon_lares_goforestpre_info;
	important = TRUE;
};


func int dia_addon_lares_goforestpre_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LARESGUIDE_ORNAMENTFOREST == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_goforestpre_ja()
{
	b_makerangerreadyformeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dob�e m�j p��teli. N�sleduj m�. Odsud to bude o�kliv�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LARESGUIDE_ORNAMENTFOREST = 2;
};

func void dia_addon_lares_goforestpre_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Ne, m��e� nyn� odej�t.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//H�d�m, �e to tu skon�ilo. Dobr�, uvid�me se pozd�ji.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LARESGUIDE_ORNAMENTFOREST = 3;
};

func void dia_addon_lares_goforestpre_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Chce�, abych s tebou �el do lesa?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Mysl� to v�n�? Ur�it� tam chce� j�t?
	};
	Info_ClearChoices(dia_addon_lares_goforestpre);
	Info_AddChoice(dia_addon_lares_goforestpre,"Ne, m��e� nyn� odej�t.",dia_addon_lares_goforestpre_nein);
	Info_AddChoice(dia_addon_lares_goforestpre,"Ano.",dia_addon_lares_goforestpre_ja);
};


instance DIA_ADDON_LARES_GOFOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforest_condition;
	information = dia_addon_lares_goforest_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_goforest_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LARESGUIDE_ORNAMENTFOREST == 2) && Npc_IsDead(stoneguardian_ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_addon_lares_goforest_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		b_makerangerreadytoleavemeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Dob�e, vypad� to, �e jsem tu skon�il. Mysl�m, �e u� to zvl�dne� i beze m�. �as, abych od�el.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LARESGUIDE_ORNAMENTFOREST = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Posp�me, rad�ji bych tu dlouho nez�st�val.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_LARES_PORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_portalinterweiter_condition;
	information = dia_addon_lares_portalinterweiter_info;
	permanent = TRUE;
	description = "P�esta� �vanit!";
};


func int dia_addon_lares_portalinterweiter_condition()
{
	if((LARESGUIDE_ZUMPORTAL != 0) && (LARESGUIDE_ZUMPORTAL != 8))
	{
		return TRUE;
	};
};

func void dia_addon_lares_portalinterweiter_info()
{
	if(LARESGUIDE_ZUMPORTAL == 4)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//P�esta� �vanit!
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//(trochu rozmrzele) Ano, ano.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Poj�me na to.
	if(LARESGUIDE_ZUMPORTAL == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Zpomal trochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Z�sta� za mnou.
	};
	AI_StopProcessInfos(self);
	if(LARESGUIDE_ZUMPORTAL == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LARESGUIDE_ZUMPORTAL == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LARESGUIDE_ZUMPORTAL == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LARESGUIDE_ZUMPORTAL == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LARESGUIDE_ZUMPORTAL == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "M��e� m� n��emu nau�it?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//M��e� m� n��emu nau�it?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jist�, m��u t� nau�it, jak se st�t obratn�j��m a siln�j��m.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares mi m��e vylep�it obratnost a s�lu.");
};


var int lares_merkedex;
var int lares_merkestr;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "U� m�.";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//U� m�.
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	LARES_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//U� jsi se stal obratn�j��m.
	};
	if(other.attribute[ATR_STRENGTH] > LARES_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(pochvaln�) Dob�e, tv� s�la se zlep�ila.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Co je nov�ho?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Za ty nejlep�� zpr�vy m��e� ty s�m. Nechali Benneta j�t, je zp�tky na farm�.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//B� za n�m, m�m dojem, �e by ti cht�l pod�kovat osobn�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Dalo by se to tak ��ct. Paladinov� zab�sli Benneta, na�eho kov��e.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Sly�el jsem. Tak to je zl�.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//To mi pov�dej.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak se to stalo?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet odjel do m�sta pro z�soby. No a u� se nevr�til.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jestli se chce� dozv�d�t v�c, promluv si s Hodgesem, byl ve m�st� s Bennetem.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "N�jak� zpr�vy o Bennetovi?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//N�jak� zpr�vy o Bennetovi?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Vypad� to, �e ho vzali do kas�ren a str�ili do �al��e.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak ho odtamtud m��eme dostat?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Tak to v�bec netu��m. Nem��u se dostat ani k n�mu do cely, abych si s n�m promluvil.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//V�echno, co zm��u, je m�t o�i na stopk�ch. Ale asi toho stejn� moc nevykouk�m.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "Pro� nejsi venku a nelov� draky?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Pro� nejsi venku a nelov� draky?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//O takov� v�ci se nestar�m, p�enech�v�m je ostatn�m.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Hmmm. �erstv� mo�sk� vzduch - to je p�esn� to, co jsem pot�eboval.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "Necht�l bys opustit tenhle ostrov?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Necht�l bys opustit tenhle ostrov?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//V�c ne� cokoli jin�ho. Cos myslel?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Zjistil jsem, kde se ukr�v� v�dce drak�. Je na ostrov�, nedaleko odsud.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Chci se ho jednou prov�dy zbavit.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Spr�vn� slova. Jestli m� bude� pot�ebovat, jdu do toho.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//M��e� na sv�ch cest�ch pot�ebovat n�koho, kde t� nau�� posilovat obratnost nebo boj jednoru�n�mi zbran�mi?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Lo� u� je pln�, ale kdyby se n�co zm�nilo, d�m v�d�t.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"K ni�emu bys mi nebyl.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"V�d�l jsem, �e se na tebe m��u spolehnout.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//V�d�l jsem, �e se na tebe m��u spolehnout.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//V�ichni se sejdeme na lodi.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Mu�i �inu, tak to m�m r�d. Je�t� se uvid�me.
	LARES_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Cen�m si tv� nab�dky, ale nem�m, jak bych t� vyu�il.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//S�m mus� v�d�t, co chce�. Pokud si o tom bude� cht�t promluvit pozd�ji, v�, kde m� najde�.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "Bude lep��, kdy� nepopluje�.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Bude lep��, kdy� nepopluje�.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak chce�, ale pak si vzpome�, kdo komu co sliboval.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "Je�t� po��d bys m�l z�jem o tu cestu?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Je�t� po��d bys m�l z�jem o tu cestu?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Norm�ln� nenech�v�m jen tak n�koho, aby se mnou takhle jednal, ale jeliko� jsi jedn�m z n�s, nech�m t� j�t.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Uvid�me se na lodi.
		LARES_ISONBOARD = LOG_SUCCESS;
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Neber si to n�jak osobn�, ale asi jsi m�l pravdu.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Bude lep��, kdy� z�stanu tady.
		AI_StopProcessInfos(self);
	};
};

