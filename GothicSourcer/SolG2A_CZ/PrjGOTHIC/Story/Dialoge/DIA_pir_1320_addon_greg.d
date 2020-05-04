
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
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(hrozivì) Hej ty. Co dìláš v mé chatrèi?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Já ...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(zuøivì) Odejdu jen na pár dní a kadı si myslí, e si mùe dìlat, co chce.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Co se tady vlastnì dìje?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Co, palisáda ještì není dokonèena? Kaòon oplıva potvorama a kadı má pohodu!!!
	GREGISBACK = TRUE;
	if(!Npc_IsDead(francis))
	{
		AI_TurnToNPC(self,francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(øve) Je to všechno, co jsi udìlal Francisi?
		if(c_bodystatecontains(francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(øve) Jdi z mé lavice, HNED!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A TY? Co jsi TY dìlal?
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
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nevìøil jsem ani na chvíli, e bys na mnì zapomnìl.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Ty vìci mìly hodnotu nìkolika stovek zlaákù, které jsem ukryl v Khorinisu.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ty jsi je prostì všechny vzal, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Budeš si muset odpracovat dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Brzy pochopíš, co to znamená práce.
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
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//To nevadí. Najdu pro tebe nìco vhodného, chlapèe.
	b_userakebilanz();
};

func void dia_addon_greg_imnew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracoval.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Tak takhle? Co?
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Dostal jsem bandity z vìe.
	};
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Plá na severu je vyèištìná od potvor.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobrá. To je zaèátek.
	b_userakebilanz();
};


instance DIA_ADDON_GREG_JOINPIRATES(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_joinpirates_condition;
	information = dia_addon_greg_joinpirates_info;
	permanent = FALSE;
	description = "Co mám dìlat?";
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
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co mám udìlat?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//První ze všeho musíme do tohohle místa vnést trochu ivota.
	if(Npc_IsDead(morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten línı blb, bude poslán øezat fošny.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//TY se postaráš o Morganovu práci a vyèístíš kaòon od tìch krvelaènıch potvor.
	MIS_ADDON_GREG_CLEARCANYON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CLEARCANYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CLEARCANYON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg chce, abych vzal Morganùv ùkol a vyèistil kaòon od potvor.");
	Info_ClearChoices(dia_addon_greg_joinpirates);
	Info_AddChoice(dia_addon_greg_joinpirates,"Pak tedy jdu.",dia_addon_greg_joinpirates_leave);
	if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
	{
		Info_AddChoice(dia_addon_greg_joinpirates,"Mám to udìlat sám?",dia_addon_greg_joinpirates_compadres);
	};
	Info_AddChoice(dia_addon_greg_joinpirates,"Jaké potvory?",dia_addon_greg_joinpirates_clearcanyon);
};

func void dia_addon_greg_joinpirates_leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Pak tedy jdu.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Dr se. Teï jsi jeden z nás.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Vem si nìjaké lepší obleèení na lov.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Tady je jedno z našich brnìní. Vypadá to, e ti sedne.
	CreateInvItems(self,itar_pir_m_addon,1);
	b_giveinvitems(self,other,itar_pir_m_addon,1);
	AI_EquipArmor(hero,itar_pir_m_addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//A neflákej se s tím, jasné?
	Info_ClearChoices(dia_addon_greg_joinpirates);
};

func void dia_addon_greg_joinpirates_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Mám to udìlat sám?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Vem si pár chlapù, pokud chceš.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Mìli by radši makat, ne se tady celı den poflakovat.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg øekl, e si mùu vzít na pomoc pár chlapù.");
};

func void dia_addon_greg_joinpirates_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Jaké potvory?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//Bøitvy z kaòonu se dostávají kadım dnem blíe k táboru.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nechci, aby byl nìkterı z mıch chlapù serán.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Jdeme jenom po bøitvách.");
};


instance DIA_ADDON_GREG_ABOUTCANYON(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_aboutcanyon_condition;
	information = dia_addon_greg_aboutcanyon_info;
	permanent = TRUE;
	description = "O práci v kaòonu ...";
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
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//O úkolu v kaòonu ...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Ano, co je s tím?
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
	if(c_allcanyonrazordead() == FALSE)
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,DIALOG_BACK,dia_addon_greg_aboutcanyon_back);
		if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
		{
			Info_AddChoice(dia_addon_greg_aboutcanyon,"Kdo mi mùe pomoct?",dia_addon_greg_aboutcanyon_compadres);
		};
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Které nestvùry mám zabít?",dia_addon_greg_aboutcanyon_job);
	}
	else
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Zabil jsem všechny bøitvy.",dia_addon_greg_aboutcanyon_razorsdead);
	};
};

func void dia_addon_greg_aboutcanyon_back()
{
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kdo mi mùe pomoci?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Vezmi s sebou pár chlapù.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Stejnak jenom mrhají èasem.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Které potvory mám zabít?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Zabij bøitvy! Zbytek toho zvìøince je neškodnı.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_razorsdead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Zabil jsem všechny bøitvy.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Velmi dobøe. Vypadá to, e jsi docela uiteènı.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg vypadá, e je trochu ohromenı tím, e jsem zabil všechny bøitvy v kaòonu.");
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
	description = "Potøebuji brnìní banditù.";
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
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Potøebuji brnìní banditù.
	if(MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Buï nejdøív uiteènı. Poté si o tom mùeme promluvit.
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Nejdøív zabij všechny bøitvy v kaòonu!
		};
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Greg po mì chce, abych mu pomohl dostat tábor na nohy. Poté si mùeme promluvit o brnìní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Jsi opravdu docela dobrı.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Vlastnì chci, aby Bones pouil tu zbroj ke špehování banditù.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale bude lepší, kdy ten úkol dám TOBÌ.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Máš vìtší šanci se odtamtud dostat v jednom kuse.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Promluv si s Bonesem. Dá ti brnìní. Vezmi ho, a vydej se do tábora banditù.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Musím vìdìt, proè se ti bastardi dostali do údolí, jako první.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Ano, ano kapitáne!
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Teï, kdy jsem skoncoval s bøitvami, mùu si vybrat brnìní u Bonese.");
		Log_CreateTopic(TOPIC_ADDON_SCOUTBANDITS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_SCOUTBANDITS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Mám pro Grega zjistit, proè bandité pøišli do údolí.");
		MIS_GREG_SCOUTBANDITS = LOG_RUNNING;
	};
};


instance DIA_ADDON_GREG_AUFTRAEGE2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_auftraege2_condition;
	information = dia_addon_greg_auftraege2_info;
	description = "Je tady ještì nìco, co mám udìlat?";
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
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Je tady ještì nìco, co mám udìlat?
	if((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Západní plá je stále plná potvor.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan opravdu nepohne ani prstem.
		Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Greg chce, abych se postaral o plá. Je plná nestvùr a potøebuje vyèistit.");
		MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	};
	if(c_towerbanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//V jiní vìi na skalách jsou stále bandité.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Vlastnì, Francis byl povìøen, aby se o to postaral.
		Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Greg chce, abych vyhnal bandity z vìe na vıchod od tábora.");
		MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Jestli chceš, mùeš na to dohlédnout.
};


instance DIA_ADDON_GREG_SAUBER2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_sauber2_condition;
	information = dia_addon_greg_sauber2_info;
	description = "Severní plá je vyèištìná.";
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
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Severní plá je vyèištìná.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Velmi dobøe. Tady je odmìna.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Ohlásil jsem vyèištìní severní pláe Gregovi.");
	MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
};


instance DIA_ADDON_GREG_BANDITPLATT2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditplatt2_condition;
	information = dia_addon_greg_banditplatt2_info;
	description = "Bandité z vìe jsou pryè.";
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
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandité z vìe jsou pryè.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Skvìlé. To byla dobrá práce. Tady je tvùj plat.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandité z vìe jsou mrtví. Greg je s tím velmi spokojenı.");
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
	description = "Bandité nalezli zlatı dùl.";
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
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandité nalezli zlatı dùl.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Vìdìl jsem to! TO je to, proè sem pøišli.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikdo nebude dobrovolnì ít v té nestvùrami zamoøené bainì.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobrá práce, tady nìco máš.
	b_giveinvitems(self,other,itri_addon_str_01,1);
	b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Informoval jsem Grega o zlatém dole.");
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
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Jsem Greg, velitel tohoto tábora.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Šastnı?
};


instance DIA_ADDON_GREG_NICETOSEEYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_nicetoseeyou_condition;
	information = dia_addon_greg_nicetoseeyou_info;
	permanent = FALSE;
	description = "Jak jsi se sem vlasnì dostal?";
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
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak jsi se sem vlasnì dostal?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Neèekal jsi, e mì tu uvidíš, he?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Jenom si to vyjasnìme. Jsem Greg a tohle je mùj tábor.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Šastnı?
};


instance DIA_ADDON_GREG_STORY(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 99;
	condition = dia_addon_greg_story_condition;
	information = dia_addon_greg_story_info;
	permanent = TRUE;
	description = "Je tady ještì jedna vìc, kterou chci vìdìt.";
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
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Je tady ještì jedna vìc, kterou chci vìdìt.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co to je?
	Info_ClearChoices(dia_addon_greg_story);
	Info_AddChoice(dia_addon_greg_story,DIALOG_BACK,dia_addon_greg_story_back);
	Info_AddChoice(dia_addon_greg_story,"Jak jsi se sem dostal?",dia_addon_greg_story_way);
	Info_AddChoice(dia_addon_greg_story,"Kde máš loï?",dia_addon_greg_story_ship);
	if(RAVENISDEAD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_story,"Co víš o Ravenovi?",dia_addon_greg_story_raven);
	};
};

func void dia_addon_greg_story_back()
{
	Info_ClearChoices(dia_addon_greg_story);
};

func void dia_addon_greg_story_way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Našel jsem tunel. Ve staré pyramidì. Byl hlídanı pár mágy.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Ti slepı zasvìcenci o mì nezavadili ani pohledem.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Nejdøív jsem si myslel, e to je jen pohøební síò a chtìl jsem se mrknou, jestli tam není nìco cenného.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Opravdu dost jsem zíral, kdy jsem vyšel ve svém milovaném údolí.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Zaèal jsem si myslet, e jsem uniknul domobranì na zbytek svého ivota.
};

func void dia_addon_greg_story_ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Kde je tvoje loï?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nebudeš tomu vìøit. ádná loï mezi pevninou a ostrovem nebyla v dohledu celé mìsíce.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Celé mìsíce! - A první loï, která pøipluje je plnì obsazená váleèná loï krále.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Plná paladinù od spodku a po vršek stoáru.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//To je to, èemu já øíkám smùla.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//Mùeš to øíci znova. Stahlo nás to jak nic. Jsem jedinı, kdo to zvládl na bøeh.
};

func void dia_addon_greg_story_raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Vím, e byl rudnı baron. Velkı èíslo v kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nevím, proè je tady, nebo proè ho lidé následují.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale jsem si jistı, e nìco chystá. Není typ, kterı by se schoval v bainì.
};


instance DIA_ADDON_GREG_RAVENDEAD(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_ravendead_condition;
	information = dia_addon_greg_ravendead_info;
	description = "Raven patøí minulosti.";
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
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Raven patøí minulosti.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Úasné! To jsem neèekal. Naèapal jsi ho se staenejma kalhotama, co?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Za to ti dám 500 zlaákù.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Jsi opravdovı nièitel zla. To je dobøe.
	b_giveplayerxp(XP_ADDON_GREGRAVENLOHN);
};

