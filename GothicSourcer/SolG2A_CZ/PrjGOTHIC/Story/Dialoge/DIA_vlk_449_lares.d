
instance DIA_ADDON_LARES_PATCH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 99;
	condition = dia_addon_lares_patch_condition;
	information = dia_addon_lares_patch_info;
	description = "(žádat zlomek z ornamentu)";
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
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Uvidíme se pozdìji v docích.
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
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Já jsem se musel zbláznit. Co tady dìláš?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ty jsi sem PØIPLAVAL?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(smích) Je to jediná cesta, jak obejít stráže u brány.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Nevidìli jsme se už?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hej, Laresi, ty starej pardále!",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Nevidìli jsme se už?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Chlape, to si mì vážnì nepamatuješ? Poflakoval jsem se kolem Novýho tábora.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Seznam pro doly... Chlape, užili jsme si spolu spoustu srandy. Pamatuješ si Leeho?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Samozøejmì, že si pamatuju na Leeho!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej, Laresi, ty starej mizero, jak ses sem dostal?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Podaøilo se mi utýct z Hornickýho údolí právì vèas. Spolu s Leem a ještì nìkolika dalšíma chlapama.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamatuješ si pøece Leeho, ne?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Samozøejmì, že si pamatuju na Leeho!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Tak s ním jsem se dostal z kolonie. Hned po znièení bariéry.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Je se svejma klukama na Onarovì farmì.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Má s tím farmáøem dohodu. On se svými chlapci brání farmu a Onar je na oplátku živí.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Samozøejmì, že si pamatuju na Leeho!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Ty ses trochu praštil, co? Lee byl velitelem žoldákù v Novém táboøe.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_ADDON_LARES_VATRAS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_vatras_condition;
	information = dia_addon_lares_vatras_info;
	description = "Vatras mì poslal. Øíkal, že bys mi mohl pomoct.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras mì poslal. Øíkal, že bys mi mohl pomoct.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(pøekvapenì) Ty už ses setkal s Vatrasem. Jistì jsi na nìj udìlal dojem.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//On by ti jinak jistì mé jméno nedal. Obzvláštì dokud se nevyøeší pøípad s mizením lidí.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Dobrá, co potøebuješ?
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
	description = "Co máš co dìlat s Vatrasem?";
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
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co máš co dìlat s Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//Øeknìmì, že mám malou dohodu s mágy Vody. Staèí?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakou dohodu?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//Pracujeme pro nì a oni se starají, abychom se nedostali do prùseru, však to znáš z trestanecké kolonie.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Mluvíš o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//(pøekvapenì) Co o tom víš?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi o nìm øekl.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Proè ses o tom nezmínil už na zaèátku našeho rozhovoru?
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares patøí ke 'Kruhu Vody'.");
};


instance DIA_ADDON_LARES_RANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ranger_condition;
	information = dia_addon_lares_ranger_info;
	description = "Øekni mi víc o 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Øekni mi víc o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//'Kruh' je mágùm Vody tím, èím jsou paladinové mágùm Ohnì.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//Narozdíl od paladinù 'Kruh' radìji stojí v pozadí.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//'Kruh' je mocnou zbraní proti nebezpeèím, která hrozí lidem v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Ale mùžeme pracovat pouze pokud nikdo neví, kdo ke 'Kruhu' patøí.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Prostì o tom nemluv!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Jasnì.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"'Kruh' je pro Mágy vody jako to, co jsou paladinové pro Mágy ohnì, jen 'Kruh' pracuje tajnì. Mimo to, nikdo by nemìl vìdìt, kdo tam PATØÍ. Proto zùstává jejich síla skryta.");
};


instance DIA_ADDON_LARES_WANNABERANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_wannaberanger_condition;
	information = dia_addon_lares_wannaberanger_info;
	description = "Rád bych se pøipojil ke 'Kruhu Vody' ...";
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
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//Rád bych se pøipojil ke 'Kruhu Vody' ...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//To zní dobøe. Nicménì, o tom rozhodují mágové Vody.
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	Info_ClearChoices(dia_addon_lares_wannaberanger);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Aha.",dia_addon_lares_wannaberanger_back);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Tak co obnáší být èlenem 'Kruhu'?",dia_addon_lares_wannaberanger_howisit);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Cos udìlal ty, abys zaujal mágy Vody?",dia_addon_lares_wannaberanger_aboutyou);
};

func void dia_addon_lares_wannaberanger_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Aha.
	Info_ClearChoices(dia_addon_lares_wannaberanger);
};

func void dia_addon_lares_wannaberanger_aboutyou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Cos udìlal ty, abys zaujal mágy Vody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chránil jsem je dlouho, zatímco jsme žili ještì v bariéøe.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(usmívá se) A je urèitì ještì mnoho dùvodù, aby mi byli vdìèní.
};

func void dia_addon_lares_wannaberanger_howisit()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Tak co obnáší být èlenem 'Kruhu'?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//My jsme velice odlišní od ostatních obvyklých gild, které mùžeš najít v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jakmile jsi jedním z nás, už si nemùžeš dìlat, co bys chtìl.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Nejdùležitìjší je držet hubu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujeme skrytì, neodhaleni. Ostatní neví, kdo k nám patøí.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Budeme tì sledovat. Pak uvidíme.
};

func void b_lares_geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Brzy bude tajné setkání v Orlanovì hospodì.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Pøijï hned, jakmile budeš moci. Dostaneš tam své vybavení.
};


instance DIA_ADDON_LARES_RINGBACK(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback_condition;
	information = dia_addon_lares_ringback_info;
	description = "Nyní jsem èlenem 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Nyní jsem èlenem 'Kruhu Vody'.
	if((LARES_GOTRINGBACK == FALSE) && (SC_GOTLARESRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Skvìlì! Mùžu nyní dostat svùj akvamarínový prsten zpìt?
		if(b_giveinvitems(other,self,itri_ranger_lares_addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jistì.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Doufám, že ti bude užiteèný. Rád vidím, že jsi nyní jedním z nás.
			LARES_GOTRINGBACK = TRUE;
			b_giveplayerxp(XP_AMBIENT);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Dobøe, se mnou se ti teï nic nestane.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Neztra ho! Stále ho potøebuji.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Nyní bys urèitì rád dostal nové vybavení do svých rukou, že? Dobrá, poslouchej.
	b_lares_geheimtreffen();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares mì pozval na tejné setkání 'Kruhu Vody' do Orlanovy hospody.");
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
};


instance DIA_ADDON_LARES_RINGBACK2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback2_condition;
	information = dia_addon_lares_ringback2_info;
	description = "Tady je tvùj akvamarínový prsten.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Toto je tvùj akvamarínový prsten.
	b_giveinvitems(other,self,itri_ranger_lares_addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//No. Máš štìstí. Už jsem myslel, že jsi ho ztratil.
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
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Poèkej chvíli. Stále èekáme na nìkteré další èleny.
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
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Tak, mùj mladý pøíteli. Dnes jsme zde pøišli oslavit tvé pøijetí do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Tihle chlápci nyní na tebe budou dohlížet a starat se o tebe.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Ne všichni èlenové 'Kruhu Vody' dorazili. Tak buï opatrný.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez ohledu na tvé úspìchy èi neúspìchy - budeme o tom vìdìt.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Nyní ti také dám tvé brnìní.
	CreateInvItem(hero,itar_ranger_addon);
	AI_EquipArmor(hero,itar_ranger_addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Nos ho s pýchou, ale neukazuj se v nìm ve mìstì nebo jiných veøejných lokalitách.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pamatuj, naše spoleèenství nesmí být prozrazeno. Nikdo nesmí vìdìt, že patøíš do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikdo nemluví o 'Kruhu Vody'. To je první a nejdùležitìjší pravidlo. Nezapomìò.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Nìjaké další otázky?
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Musím už jít.",dia_addon_lares_getrangerarmor_end);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"A jak mi mùžeš pomoci?",dia_addon_lares_getrangerarmor_learn);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Co zbranì?",dia_addon_lares_getrangerarmor_weapons);
};

func void dia_addon_lares_getrangerarmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//Co zbranì?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//Hùl je zbraò 'Kruhu'. Ale každý mùže používat jakou zbraò chce.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Zde je tvá zbraò, nikdy jsem ji ve skuteènosti nepoužil. Možná ti poslouží lépe.
	CreateInvItems(self,itmw_rangerstaff_addon,1);
	b_giveinvitems(self,other,itmw_rangerstaff_addon,1);
};

func void dia_addon_lares_getrangerarmor_end()
{
	b_makerangerreadytoleavemeetingall();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Musím už jít.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Dobøe, nechceme tì zdržovat.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Bìž za Vatrasem a on ti dá první úkol.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Èlenové 'Kruhu', vrate se ke svým povinnostem.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Banditi ještì nepøestali útoèit. Musíme vyøešit tento problém.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanosi, udržuj poøádek v tomto svìtì.
	LARES_TAKEFIRSTMISSIONFROMVATRAS = TRUE;
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,DIALOG_ENDE,dia_addon_lares_getrangerarmor_weiter);
};

func void dia_addon_lares_getrangerarmor_weiter()
{
	AI_StopProcessInfos(self);
	b_rangermeetingparking();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Dostal jsem své brnìní na tajném setkání 'Kruhu Vody' v Orlanovì hospodì. Mìl bych nyní jít za Vatrasem pro svùj první úkol jako èlen 'Kruhu'.");
};

func void dia_addon_lares_getrangerarmor_learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//A jak mi mùžeš pomoci?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//Mùžu ti pomoci zlepšit se v síle.
	if(Npc_IsDead(sld_805_cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Jestli chceš zlepšit své schopnosti v boji se zbranìmi nablízko, promluv si s Cordem. On je pán meèe.
	};
	if(Npc_IsDead(bau_961_gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann tì nauèí, jak získat ze zvìøe trofeje.
	};
	if(Npc_IsDead(mil_350_addon_martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Jestli chceš vìdìt více o paladinech, promluv si s Martinem.
	};
	if(Npc_IsDead(bau_4300_addon_cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn tì nauèí, jak se plížit a boji s jednoruèními zbranìmi. Také tì nauèí zacházet s lukem.
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Promluv si s Orlanem, pokud zde budeš chtít strávit noc.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//A jestli tì zajímá magie, mùžeš se na nìco zeptat Vatrase.
};


instance DIA_ADDON_LARES_TELEPORTSTATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_teleportstation_condition;
	information = dia_addon_lares_teleportstation_info;
	description = "Už jsi nìkdy použil teleportaèní kámen?";
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
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Už jsi nìkdy použil teleportaèní kámen?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Ne, ale slyšel jsem o tom. Mágové Vody neví pøesnì, co si o tìchto vìcech mají myslet.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//Už jsem jeden vyzkoušel.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(smìje se) Mìl jsem si to myslet. Je vùbec nìco, co bys neudìlal?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Dobøe, jestli chceš použít jednu z tìchto vìcí, zeptej se Orlana - hospodského - jestli ti povolí vstup do jeskynì, která je zamklá.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Myslím, že je skrytý teleportaèní kámen k mágùm Vody nedaleko jeho hospody.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Opus mìsto východní branou a prostì bìž po cestì. Nevím, jak bys to mohl minout.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Lares mi øekl, že blízko Orlanovy hospody je skrytý teleportaèní kámen.");
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
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras mi pro tebe dal tento ornament. Øekl, že ho máš vrátit.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(povzdechne si) Jaké pøekvapení. Zase je to na mnì. Mohl jsem si to myslet.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Nyní musím jít pøes celý ostrov, abych to vrátil mágùm Vody.
};


instance DIA_ADDON_LARES_ORNAMENTBRINGJOB(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornamentbringjob_condition;
	information = dia_addon_lares_ornamentbringjob_info;
	description = "Udìlám to pro tebe!";
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
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Udìlám to pro tebe!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(uvažuje) Hmm . Myslím, že bude lepší, když tam ten ornament donesu osobnì. Nicménì se ke mnì mùžeš pøidat.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Bohužel, nemùžu opustit toto místo. Musím sledovat doky.
	b_logentry(TOPIC_ADDON_KDW,"Donesl jsem Laresovi Vatrasùv ornament. Chce, abychom ho donesli Mágùm vody a Lares by mì mìl doprovázet.");
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_RUNNING;
};


instance DIA_ADDON_LARES_YOURMISSION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_yourmission_condition;
	information = dia_addon_lares_yourmission_info;
	permanent = TRUE;
	description = "Co pøesnì dìláš tady v pøístavu?";
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
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Co pøesnì dìláš tady v pøístavu?
	if(!Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Nemùžu o tom mluvit.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras by mi srazil hlavu ...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//Dìlám, co dìláme my všichni. Plníme úkoly, které dostaneme od mágù Vody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Nìkteøí ze zmizelých lidí jsou rybáøi. Dokonce jejich lodì zmizely.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//To je, proè jsem zde a sleduji doky. Možná zde nìco najdu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mohl bys mi pomoci.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Poslouchej, dám ti svùj akvamarínový prsten. Je to znak 'Kruhu Vody'.
		CreateInvItems(self,itri_ranger_lares_addon,1);
		b_giveinvitems(self,other,itri_ranger_lares_addon,1);
		SC_GOTLARESRING = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Nasaï si ho a ostatní poznají, že pracuješ pro mì.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Najdi za mì náhradu a tak budeme moci vrátit ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Jeden z nás obvykle sleduje tržištì. Není tam právì zapotøebí.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Prostì mluv s lidmi. Správná osoba tì pozná díky mému prstenu na tvém prstì.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Øekni mu, že hledám náhradu.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares mi dal svùj akvamarínový prsten se znaèkou 'Kruhu'. Nasazený prsten všichni èlenové 'Kruhu' poznají a pøijmou mì.");
		Log_CreateTopic(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Lares nemùže opustit pøístav. Mìl bych prozkoumat tržištì s nasazeným akvamarínovým prstenem, abych našel za Larese náhradu.");
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
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Mluvil jsem s Baltramem. Najde nìkoho, kdo tì nahradí.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Velmi dobøe. Alespoò odsud mùžeme vypadnout.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//Mùžeš si nyní nechat mùj akvamarínový prsten.
		if(Npc_KnowsInfo(other,dia_addon_lares_wannaberanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(smìje se) Øekl bych, že se ti bude hodit, dokud nedostaneš svùj vlastní.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(smìje se) Možná se k nám nakonec rozhodneš i pøidat ...
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
	description = "O zmizelých lidech ...";
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
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//O zmizelých lidech ...
	Info_ClearChoices(dia_addon_lares_peoplemissing);
	Info_AddChoice(dia_addon_lares_peoplemissing,DIALOG_BACK,dia_addon_lares_peoplemissing_back);
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Udìlal jsem to, abych zachránil nìkteré ze zmizelých lidí.",dia_addon_lares_peoplemissing_saved);
	}
	else if((MIS_LARES_BRINGRANGERTOME != 0) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Vím, kde jsou zmizelí lidé teï!",dia_addon_lares_peoplemissing_success);
	}
	else
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"A není to náhodou práce domobrany?",dia_addon_lares_peoplemissing_mil);
		Info_AddChoice(dia_addon_lares_peoplemissing,"Øekni mi, co o nich víš.",dia_addon_lares_peoplemissing_tellme);
	};
};

func void dia_addon_lares_peoplemissing_back()
{
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_tellme()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//Øekni mi, co o nich víš.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Rybáø tady z Khorinisu - William - byl první. Prostì se jednoho dne nevrátil.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Prvnì jsme si mysleli, že se stal obìtí i s jeho loïkou nìjaké moøské obludy, když rybaøil venku.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Ale brzy zaèali mizet další. A nezdálo se, že by za tím bylo nìco jiného.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dosud jsme byli celkem bezradní. Vypadá to, že musíme èekat na nìjakou náhodu èi dùkaz, který objevíme.
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
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//A není to náhodou práce domobrany?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Kdyby byli schopní nìco udìlat.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nenašli jediný dùkaz. Lidé mizeli beze stopy.
};

func void dia_addon_lares_peoplemissing_success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//Vím, kde zmizelí lidé jsou.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(pøekvapenì) Je to tak?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//Bývalý rudobaron RAVEN je zajal.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jsi si jist? Musíme je pak nìjak zachránit.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracuji na tom.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//V poøádku. Víš, kde mì hledat, kdybys potøeboval pomoc ...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... vím, kde je najít. Dostaneme je.
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_saved()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Zvládl jsem to. Osvobodil jsem všechny pohøešované lidi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//Vìdìl jsem , že to dokážeš. Koneènì se mohu soustøedit na svou práci.
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
	description = "Potøebuji tvou pomoc.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Potøebuji tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//A jak ti mohu posloužit?
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	Info_AddChoice(dia_addon_lares_rangerhelp,DIALOG_BACK,dia_addon_lares_rangerhelp_nix);
	if(Npc_IsInState(moe,zs_attack))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Ten chlápek tam mi leze na nervy...",dia_addon_lares_rangerhelp_moe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Potøebuji lepší zbraò.",dia_addon_lares_rangerhelp_waffe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"A co tak lepší brnìní?",dia_addon_lares_rangerhelp_ruestung);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Potøebuji peníze.",dia_addon_lares_rangerhelp_geld);
	};
};

func void dia_addon_lares_rangerhelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//A co tak lepší brnìní?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Hmm. Myslím, že Mateo prodává brnìní, ale není zrovna levné ...
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Existuje pravdìpodobnì levnìjší cesta, pokud ti nevadí malé trable s domobranou ...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//Tak jak?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Za Mateovým obchodem je skladištì. Ale všechno zboží bylo skonfiskováno domobranou.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Navštiv Zurise na tržišti, kup si od nìj svitek se "spánkem" a použij ho na stráž u skladu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//Øekl bych, že kolem Mateova obchodu se válela pìkná zbroj.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG = TRUE;
};

func void dia_addon_lares_rangerhelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Potøebuji lepší zbraò.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Sorry, ale s tímto ti nepomohu. Už jsi byl na tržišti?
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE = TRUE;
};

func void dia_addon_lares_rangerhelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Potøebuji peníze.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//Proè ne? Promiò, nemùžu ti pùjèit. Ale Lehmar - lichváø - mi dluží laskavost.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Jen mu øekni a dostaneš peníze, které potøebuješ. Já se už o zbytek postarám. Najdeš ho po cestì k dokùm u vstupu do dolní èásti mìsta.
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
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Poèkej chvilièku ...
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
	description = "Musím za každou cenu mluvit s paladiny!";
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
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Musím za každou cenu mluvit s paladiny!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Co od NICH chceš?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Mají mocný amulet, Innosovo oko. Musím ho mít.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//A to si myslíš, že ti ho dají? Nikdy se nedostaneš ani do horní èásti mìsta.
	if(!Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Nìjaký zpùsob se najde.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasnì, jestli chceš podlejzat mìšanùm nebo dìlat poskoka domobranì...
	};
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Víš, proè tu jsou paladinové?";
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
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Víš, proè tu jsou paladinové?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikdo to neví jistì. Hodnì lidí si myslí, že to je kvùli skøetùm, ale já si myslím, že tu je jinej dùvod.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Nejspíš to má co dìlat se starou trestaneckou kolonií.
};


instance DIA_ADDON_LARES_GILDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_gilde_condition;
	information = dia_addon_lares_gilde_info;
	permanent = TRUE;
	description = "Vatras se zmínil...";
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
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras se zmínil, že bys mi mohl pomoct pøidat se k jedné gildì.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(posmìšnì) Horlivá pracovní posila, že?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Dobrá, poslouchám.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//Mùžu zkusit domluvit žoldnéøùm, kdyby ses chtìl pøipojit k Leemu.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Samozøejmì, že je rychlejší cesta, jak se dostat do kláštera.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//Nejjednodušší bude pøidat se k domobranì.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Které gildì dáš pøednost?
	Info_ClearChoices(dia_addon_lares_gilde);
	Info_AddChoice(dia_addon_lares_gilde,"Musím si to celé ještì jednou promyslet ...",dia_addon_lares_gilde_back);
	Info_AddChoice(dia_addon_lares_gilde,"Mágové ohnì.",dia_addon_lares_gilde_kdf);
	Info_AddChoice(dia_addon_lares_gilde,"Žoldáci.",dia_addon_lares_gilde_sld);
	Info_AddChoice(dia_addon_lares_gilde,"Domobrana.",dia_addon_lares_gilde_mil);
};

func void dia_addon_lares_gilde_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Musím si to ještì jednou promyslet ...
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_sld()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//Žoldáci.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Jsem si jist, že Lee tì pøivítá.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Nicménì, je tam test, zda-li jsi použitelný.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Navrhnul bych si pohovoøit si s Cordem na Onarovì farmì.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//Mùže ti pomoct s testem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Øekni mu, že "žiješ pod mými ochranými køídly". On to pochopí.
	RANGERHELP_GILDESLD = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPSLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Lares vìøí, že Cord mi pomùže s pøijetím na farmu.");
	SC_KNOWSCORDASRANGERFROMLARES = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Domobrana.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(baví se) Á, opravdu si to dokážu pøedstavit, jak si to užiješ. Øíkat jiným lidem o zákonech, zatímco bereš jejich peníze.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//Paladinové mají svùj sklad na molu. Dùstojník je mùj dobrý kamarád.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Možná by ti pomohl. Jmenuje se Martin.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPMIL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Lares mi øekl, že dùstojník Martin mi pomùže pøidat se k domobranì mnohem rychleji. Obvykle bývá v pøístavu tam, jak mají paladinové svùj sklad.");
	RANGERHELP_GILDEMIL = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_kdf()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//Mágové ohnì.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(smìje se) Že to Vatras neoèekával? Jinak by tì za mnou asi neposlal.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Když se chceš pøidat ke klášteru, vyjde tì to dost draho.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Ti chlápíci tì nepustí dovnitø, pokud jim nezaplatíš poplatek.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//A jediná osoba, která to mùže zmìnit je Vatras. Myslím, že bys s ním mìl promluvit.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Vatras ví, jak se snadno pøipojit ke klášteru.");
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
	description = "Øekni mi více o Leem a jeho žoldácích ...";
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
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Øekni mi více o Leem a jeho žoldácích ...
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co bys rád vìdìl?
	Info_ClearChoices(dia_lares_aboutsld);
	Info_AddChoice(dia_lares_aboutsld,DIALOG_BACK,dia_lares_aboutsld_back);
	Info_AddChoice(dia_lares_aboutsld,"A proè teda nejsi s Leem a jeho žoldákama?",dia_lares_aboutsld_whynotyou);
	Info_AddChoice(dia_lares_aboutsld,"Øekni mi o žoldnéøích víc.",dia_lares_aboutsld_sld);
	Info_AddChoice(dia_lares_aboutsld,"Jak najdu farmu velkostatkáøe?",dia_lares_aboutsld_waytoonar);
};

func void dia_lares_aboutsld_back()
{
	Info_ClearChoices(dia_lares_aboutsld);
};

func void dia_lares_aboutsld_sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Øekni mi o žoldnéøích víc.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Fajn, jestli seš poøád tak tvrdej, jako jsi bejval, nemìl bys s nima mít žádnej problém.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Vìtšina z nich jsou rváèi, a jestli se jim nebudeš umìt postavit, daleko se nedostaneš.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(smích) Jestli seš krapet pøecitlivìlej, tak nemáš šanci s nima vydržet.
};

func void dia_lares_aboutsld_whynotyou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A proè teda nejsi s Leem a jeho žoldákama?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale vždy jsem! Jenom ne na farmì.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Dá se øíct, že ho tady ve mìstì zastupuju. Nechceme, aby ta loï odplula bez nás.
	LARES_WORKFORLEE = TRUE;
	Info_AddChoice(dia_lares_aboutsld,"O jaké lodi jsi to mluvil?",dia_lares_aboutsld_schiff);
};

func void dia_lares_aboutsld_schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jaké lodi jsi to mluvil?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Je na otevøené èásti pøístavu za útesem. Lee se chce se svejma pár lidma odsud vážnì dostat.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale bude to chvíli trvat.
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Proè?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Mìl by ses na to radìj zeptat Leeho, když ho potkáš... Má dobrej plán.
};

func void dia_lares_aboutsld_waytoonar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak najdu farmu velkostatkáøe?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//Je to velmi jednoduché. Opus mìsto východní branou a pak bìž na sever.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//Mùžu ti ukázat cestu, jestli chceš.
	LARES_WAYTOONAR = TRUE;
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 14;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Víš nìco o zlodìjském cechu ve mìstì?";
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
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Víš nìco o zlodìjském cechu ve mìstì?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ty tvoje otázky...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Samozøejmì, máme tady zlodìjskej cech. Jako v každým vìtším mìstì.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//A každej malej zlodìjíèek nebo šmelináø je s ní nìjak propojenej.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 15;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Víš, kde bych ten cech našel?";
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
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Víš, kde bych ten cech našel?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(smích) Bez urážky, ale vím jen to, že ti nesmím nic øíct.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Tihle lidé na takové vìci vìtšinou reagují VELMI citlivì.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Jestli se s nima chceš zaplést, mìl bys být hodnì opatrný.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 16;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "Mám tady tenhle klíè. Je celej zrezlej od moøský vody.";
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
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mám tady tenhle klíè. Je celej zrezlej od moøský vody.
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//Takže?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Mám dojem, že by mì mohl dovést k úkrytu zlodìjskýho cechu.
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Fajn, to by moh bejt klíè od stok.
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
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Co já vím... vìtšinou ústí do moøe.
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
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Ty jsi teï v domobranì!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(smích) To mì pøetrhne - bejvalej trestanec v domobranì...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Tak ty seš teï jedním z královských paladinù!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(uliènicky) Nìco takovýho mùžeš províst jenom ty.
		if(LARES_WORKFORLEE == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(starostlivì) Nepráskneš mì kvùli mojí spolupráci s Leem?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Však mì znáš...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nerozumím tomu. Vstoupil jsi do kláštera. Jaké to tam je?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Jiné.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Nedovedu si to pøedstavit.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Slyšel jsem, že tì Lee pøijal.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratuluju.
	};
};


instance DIA_ADDON_LARES_FOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_addon_lares_forest_condition;
	information = dia_addon_lares_forest_info;
	description = "Mùžeš mì doprovázet na cestì tamtím hustým lesem?";
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
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Mùžeš mì doprovázet na cestì tamtím hustým lesem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jistì, ale co chceš dìlat na takovém místì?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius mi øekl, abych se porozhlédl po dalších ornamentech.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z míst, abych ti øekl pravdu, je tam na východì v tomto lese.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Vidím, dost nebezpeèné pro jednoho, že?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Bez problému, prostì mi øekni, kam chceš jít.
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
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Tak jdeme... Pojï za mnou.
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
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nemùžu opustit své místo, dokud nebudu mít náhradu za sebe nebo nevyøešíme záhadu s mizením lidí.
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
			Info_AddChoice(dia_lares_gonow,"Okay, vrame Vatrasùv ornament.",dia_lares_gonow_maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LARESGUIDE_ORNAMENTFOREST == 0) && (RANGERHELP_ORNAMENTFOREST == TRUE))
		{
			Info_AddChoice(dia_lares_gonow,"K hustému lesu na východ.",dia_lares_gonow_forest);
		};
	};
};

func void dia_lares_gonow_maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Okay, vrame Vatrasùv ornament.
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
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//K hustému lesu na východ.
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
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Tak tady jsi. Už jsem si zaèínal myslet, že tì sežrali vlci.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Takže dál už trefíš sám. Musím se vrátit do mìsta, mám tam ještì nìjaké vyøizování.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Prostì pokraèuj po téhle cestì dál a pamatuj - važ si sám sebe a nepodìlej se z každý blbosti, pak to pro tebe bude hraèka.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Nyní, když jsme z mìsta venku a nikdo nás nesleduje, rád bych ti nìco øekl.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ornament pøedpokládám vrátíme Saturasovi. Vzpomínáš si na nìj, ne?
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Jistì. On byl nejvyšším Mágem vody v Novém táboøe.",dia_addon_lares_arrivedportalinter1_ja);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Saturas? Kdo je to?",dia_addon_lares_arrivedportalinter1_wer);
	LARESGUIDE_ZUMPORTAL = 2;
};

func void dia_addon_lares_arrivedportalinter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Podívej, my chlapi z Nového tábora máme stále dobré vztahy s mágy Vody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Dokonce i Lee bude chránit mágy Vody, bude-li to nezbytné.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Strávil jsem mnoho èasu tady ve mìstì a spolupracoval s Vatrasem a udržoval kontakt s mágy Vody.
	b_makerangerreadyformeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A toto je brnìní, které jsme dostali od mágù Vody. "Kruh Vody" ho nosil ještì pøed válkou se skøety.
	if(CAVALORN_RANGERHINT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//Jak se dostal Cavalorn k vám? Nevzpomínám si, že by patøil k Novému táboru.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//Máš pravdu, naše spoleèenství se rozrostlo. Dokonce ani já nevím, kolik nás už je.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale pojïme už. Rád bych se dostal z tohoto mìsta. Mluvit mùžeme cestou.
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
};

func void dia_addon_lares_arrivedportalinter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kdo je to?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//Hmm, nejvyšší mág Vody v Novém táboøe. Vrátil se zpìt z Hornického údolí, když bariéra padla.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Lee a moje malièkost jsme udìlali dohodu s mágy Vody a spojili své síly, abychom mohli vzdorovat Starému táboru.
	dia_addon_lares_arrivedportalinter1_teil2();
};

func void dia_addon_lares_arrivedportalinter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jistì. On byl nejvyšším mágem Vody v Novém táboøe.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Co se dìje? Jsi v poøádku?
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING) && (Npc_GetDistToWP(erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//Ten chlápek tam má problémy s bandity.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//(arogantnì) To je fakt pìkné vìdìt, ale máme málo èasu.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Chlape, nevypršela už naše dohoda?
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//Mágové Vody jsou úplnì napjatí. Kopou na severovýchodì už týdny. Nemám potuchy, co tam hledají.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Celá zem se zaèala otøásat, jako když padla bariéra.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Jako ve zlém snu se probudily kamenné pøíšery a zaútoèili na vše, co se ocitlo v jejich blízkosti.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//Mágové Vody na to dohlíží a znièili všechny nepøátelské potvory. A nyní kopají kolem a hledají vysvìtlení tìch událostí.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale brzy to uvidíš na vlastní oèi.
	LARESGUIDE_ZUMPORTAL = 5;
	b_logentry(TOPIC_ADDON_KDW,"Lares mi øekl o vykopávkách mágù vody. Zaznamenali tam divné vìci. Nejspíš tam je zdroj tajemných zemìtøesení a kamenných monster.");
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Jsi v pohodì?
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Buï opatrný, mùže to být odsud nebezpeèné.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Vem ten ornament. Mágové Vody tam nìkde musí být. Dones ho k nim.
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//Mìl bys bežet rovnou za Saturasem, pokud bys narazil na potvoru, která je silnìjší než ty, a to tak rychle, jak jen budeš moci.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On bude nìjak ovládat zvíøata. Musím se nyní vrátit.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//A ještì jedna rada. Nepotloukej se tady kolem a bež s tím rovnou za Saturasem.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Uvidíme se.
	b_logentry(TOPIC_ADDON_KDW,"Lares mi dal ornament do rukou. Mìl bych ho doruèit mágu vody Saturasovi.");
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
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(vážnì) Konec srandy! Doruè ten ornament!
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
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dobøe mùj pøíteli. Následuj mì. Odsud to bude ošklivé.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LARESGUIDE_ORNAMENTFOREST = 2;
};

func void dia_addon_lares_goforestpre_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Ne, mùžeš nyní odejít.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//Hádám, že to tu skonèilo. Dobrá, uvidíme se pozdìji.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LARESGUIDE_ORNAMENTFOREST = 3;
};

func void dia_addon_lares_goforestpre_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Chceš, abych s tebou šel do lesa?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Myslíš to vážnì? Urèitì tam chceš jít?
	};
	Info_ClearChoices(dia_addon_lares_goforestpre);
	Info_AddChoice(dia_addon_lares_goforestpre,"Ne, mùžeš nyní odejít.",dia_addon_lares_goforestpre_nein);
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
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Dobøe, vypadá to, že jsem tu skonèil. Myslím, že už to zvládneš i beze mì. Èas, abych odìšel.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LARESGUIDE_ORNAMENTFOREST = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Pospìšme, radìji bych tu dlouho nezùstával.
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
	description = "Pøestaò žvanit!";
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
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//Pøestaò žvanit!
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//(trochu rozmrzele) Ano, ano.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Pojïme na to.
	if(LARESGUIDE_ZUMPORTAL == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Zpomal trochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Zùstaò za mnou.
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
	description = "Mùžeš mì nìèemu nauèit?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Mùžeš mì nìèemu nauèit?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jistì, mùžu tì nauèit, jak se stát obratnìjším a silnìjším.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares mi mùže vylepšit obratnost a sílu.");
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
	description = "Uè mì.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//Uè mì.
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
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Už jsi se stal obratnìjším.
	};
	if(other.attribute[ATR_STRENGTH] > LARES_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(pochvalnì) Dobøe, tvá síla se zlepšila.
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
	description = "Co je nového?";
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
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Co je nového?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Za ty nejlepší zprávy mùžeš ty sám. Nechali Benneta jít, je zpátky na farmì.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Bìž za ním, mám dojem, že by ti chtìl podìkovat osobnì.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Dalo by se to tak øíct. Paladinové zabásli Benneta, našeho kováøe.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Slyšel jsem. Tak to je zlý.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//To mi povídej.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak se to stalo?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet odjel do mìsta pro zásoby. No a už se nevrátil.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jestli se chceš dozvìdìt víc, promluv si s Hodgesem, byl ve mìstì s Bennetem.
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
	description = "Nìjaký zprávy o Bennetovi?";
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
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Nìjaký zprávy o Bennetovi?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Vypadá to, že ho vzali do kasáren a strèili do žaláøe.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak ho odtamtud mùžeme dostat?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Tak to vùbec netuším. Nemùžu se dostat ani k nìmu do cely, abych si s ním promluvil.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Všechno, co zmùžu, je mít oèi na stopkách. Ale asi toho stejnì moc nevykoukám.
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
	description = "Proè nejsi venku a nelovíš draky?";
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
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Proè nejsi venku a nelovíš draky?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//O takové vìci se nestarám, pøenechávám je ostatním.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Hmmm. Èerstvý moøský vzduch - to je pøesnì to, co jsem potøeboval.
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
	description = "Nechtìl bys opustit tenhle ostrov?";
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
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Nechtìl bys opustit tenhle ostrov?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Víc než cokoli jinýho. Cos myslel?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Zjistil jsem, kde se ukrývá vùdce drakù. Je na ostrovì, nedaleko odsud.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Chci se ho jednou provždy zbavit.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Správná slova. Jestli mì budeš potøebovat, jdu do toho.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Mùžeš na svých cestách potøebovat nìkoho, kde tì nauèí posilovat obratnost nebo boj jednoruèními zbranìmi?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Loï už je plná, ale kdyby se nìco zmìnilo, dám vìdìt.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"K nièemu bys mi nebyl.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"Vìdìl jsem, že se na tebe mùžu spolehnout.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Vìdìl jsem, že se na tebe mùžu spolehnout.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Všichni se sejdeme na lodi.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Muži èinu, tak to mám rád. Ještì se uvidíme.
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
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Cením si tvé nabídky, ale nemám, jak bych tì využil.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Sám musíš vìdìt, co chceš. Pokud si o tom budeš chtít promluvit pozdìji, víš, kde mì najdeš.
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
	description = "Bude lepší, když nepopluješ.";
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
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Bude lepší, když nepopluješ.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak chceš, ale pak si vzpomeò, kdo komu co sliboval.
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
	description = "Ještì poøád bys mìl zájem o tu cestu?";
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
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Ještì poøád bys mìl zájem o tu cestu?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Normálnì nenechávám jen tak nìkoho, aby se mnou takhle jednal, ale jelikož jsi jedním z nás, nechám tì jít.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Uvidíme se na lodi.
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Neber si to nìjak osobnì, ale asi jsi mìl pravdu.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Bude lepší, když zùstanu tady.
		AI_StopProcessInfos(self);
	};
};

