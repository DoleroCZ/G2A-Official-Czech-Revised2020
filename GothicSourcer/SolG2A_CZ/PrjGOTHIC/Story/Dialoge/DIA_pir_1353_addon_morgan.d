
var int morgan_perm_counter;

instance DIA_ADDON_MORGAN_EXIT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 999;
	condition = dia_addon_morgan_exit_condition;
	information = dia_addon_morgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_morgan_exit_condition()
{
	return TRUE;
};

func int dia_addon_morgan_exit_info()
{
	if(GREGISBACK == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Nebudu tì déle rušit.
		if(MORGAN_PERM_COUNTER == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(zívá) Bezvadný nápad.
			MORGAN_PERM_COUNTER = 1;
		}
		else if(MORGAN_PERM_COUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(ospale) Tak tedy dobrou noc.
			MORGAN_PERM_COUNTER = 2;
		}
		else if(MORGAN_PERM_COUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(unavenì) Nic, radši to udìlám.
			MORGAN_PERM_COUNTER = 3;
		}
		else if(MORGAN_PERM_COUNTER == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Vzbuï mì, jestli se nìco pøihodí.
			MORGAN_PERM_COUNTER = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_PICKPOCKET(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 900;
	condition = dia_addon_morgan_pickpocket_condition;
	information = dia_addon_morgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_morgan_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_morgan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_BACK,dia_addon_morgan_pickpocket_back);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_PICKPOCKET,dia_addon_morgan_pickpocket_doit);
};

func void dia_addon_morgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};

func void dia_addon_morgan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};


instance DIA_ADDON_MORGAN_ANHEUERN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_anheuern_condition;
	information = dia_addon_morgan_anheuern_info;
	important = TRUE;
};


func int dia_addon_morgan_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GREGISBACK == TRUE))
	{
		return TRUE;
	};
};

func int dia_addon_morgan_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Skvìle! Teï mì Greg poslal øezat klády!
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(sarkasticky) Užij si pobíjení monster!
	};
};


instance DIA_ADDON_MORGAN_HELLO(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_hello_condition;
	information = dia_addon_morgan_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_morgan_hello_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == FALSE) && Npc_IsInState(self,zs_talk) && (Npc_IsDead(alligatorjack) == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Hej ty!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(ospale) Huh? Co chceš?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(ospale) Je Alligator Jack už zpátky?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(ospale) Ne? Dobrá, asi se vrátí pozdìji. Dobrou noc.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_MEAT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 2;
	condition = dia_addon_morgan_meat_condition;
	information = dia_addon_morgan_meat_info;
	description = "Pøinesl jsem zásilku masa.";
};


func int dia_addon_morgan_meat_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_meat_info()
{
	var int givenmeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//Pøinesl jsem zásilku masa.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(Vzbuzený) Uah. Nejdøív potøebuju doušek na probuzení.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//Ahh, to je lepší. Dobrá, znova. Co chceš?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//Pøinesl jsem ti tuhle zásilku masa. Od Alligatora Jacka.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//Už si vzpomínám. Ano, pøesnì, maso. Dej mi to!
	givenmeat = Npc_HasItems(other,itfomuttonraw);
	if(givenmeat > 10)
	{
		givenmeat = 10;
	};
	b_giveinvitems(other,self,itfomuttonraw,givenmeat);
	if(givenmeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co, to je vše? Sežvejkal si všechno ostatní? Ahh, nevadí ...
	};
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Dal jsem Moranovi maso.");
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ALLIGATORJACK_BRINGMEAT);
};


instance DIA_ADDON_MORGAN_JOB(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 3;
	condition = dia_addon_morgan_job_condition;
	information = dia_addon_morgan_job_info;
	description = "Co tady dìláš?";
};


func int dia_addon_morgan_job_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_meat))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_job_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg mi dal velení jedné hranièní skupiny.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jsem zodpovìdný za proviant v táboøe - Alligator Jack se o to pro mì stará.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Jsem také zodpovìdný za potvory, které jsou pøíliš blízko tábora.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//Mí chlapci se o to starají za mì.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//Øekl jsem jim, nechci tady vidìt jedinou potvoru (zívá) Když se Greg vrátí.
	};
};


instance DIA_ADDON_MORGAN_SLEEP(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 4;
	condition = dia_addon_morgan_sleep_condition;
	information = dia_addon_morgan_sleep_info;
	description = "Dìláš teï nìco?";
};


func int dia_addon_morgan_sleep_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_job))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_sleep_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//Dìláš teï nìco?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Hej, koukej!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Mám nejdùležitìjší úkol ze všech.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Starám se o trénování našich lidí.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//Dìlám z nich nejlepší a nejvíce obávané piráty, kteøí kdy køižovaly tyhle vody.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Není nic, co by chlapy donutilo, aby se vrátili ke své práci.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Dostali za to pìkný váèek se zlatem.
};


instance DIA_ADDON_MORGAN_JOINMORGAN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_joinmorgan_condition;
	information = dia_addon_morgan_joinmorgan_info;
	description = "Chci se pøipojit k tvé skupinì.";
};


func int dia_addon_morgan_joinmorgan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_joinmorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chci se pøipojit k tvé skupinì.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(smìje se) Moje Skupina? Moje skupina se povaluje okolo na pláži.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Chlapy nezvednou ani prst dokud se kapitán nevrátí. Mùžu ti naslíbovat hodnì.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale jestli nám chceš ukázat, co jsi vlastnì zaè, postaráš se o pláž na severu.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Je plná èíhavcù a kdo ví èeho ještì.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Odstraò je sám a získáš respekt (zívá) od chlapcù ...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Vítej v mé skupinì. Ha! Jsem zpìt na lehátkové službì ...
	Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Teï, když jsem v Morganovì skupinì, chce abych vyèistil severní pláž od potvor.");
	MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_LURKERPLATT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 6;
	condition = dia_addon_morgan_lurkerplatt_condition;
	information = dia_addon_morgan_lurkerplatt_info;
	permanent = TRUE;
	description = "Severní pláž je èístá.";
};


func int dia_addon_morgan_lurkerplatt_condition()
{
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && (MIS_ADDON_MORGANLURKER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//Severní pláž je èístá.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co jeskynì. Šel jsi tam taky?
	if(Npc_IsDead(beachshadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Jasnì.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//Tøída. Jsi dobrý chlap.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Tady je tvoje odmìna.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Pláž je vyèištìna. Všichni tvorové jsou mrtví.");
		MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Au ...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To je èást práce. Pøijï zpìt, až se postaráš i o to.
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Morgan také chce, abych se postaral o jeskyni.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_MORGAN_AUFTRAG2(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_auftrag2_condition;
	information = dia_addon_morgan_auftrag2_info;
	permanent = TRUE;
	description = "Je tady nìco, co mùžu udìlat?";
};


func int dia_addon_morgan_auftrag2_condition()
{
	if(MIS_ADDON_MORGANLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_auftrag2_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Je tady nìco, co mùžu udìlat?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Teï zrovna ne.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Zajisti si lùžko a dej si pìknou láhev rumu!
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaah. To je dobrá vìc.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Nejlépe, když se na to zeptáš kapitána.
	};
	AI_StopProcessInfos(self);
};


var int morgan_angusstory;

instance DIA_ADDON_MORGAN_FOUNDTHEM(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 7;
	condition = dia_addon_morgan_foundthem_condition;
	information = dia_addon_morgan_foundthem_info;
	permanent = TRUE;
	description = "O Agnusovi a Hankovi ...";
};


func int dia_addon_morgan_foundthem_condition()
{
	if((MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_skip_angushank))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_foundthem_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//O Agnusovi a Hankovi ...
	if(MORGAN_ANGUSSTORY == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Nezaèínej s TÍM pøíbìhem.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pravdìpodobnì byli zabiti bandity.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A Agnus mìl u sebe mùj prsten.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Dobøe, vlastnì to byl JEHO prsten. Vyhrál ho v kostkách.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale chtìl jsem ho vyhrát nazpìt, ale teï je PRYÈ!
		MORGAN_ANGUSSTORY = TRUE;
	};
	Info_ClearChoices(dia_addon_morgan_foundthem);
	if(Npc_HasItems(other,itri_addon_morgansring_mission) > 0)
	{
		Info_AddChoice(dia_addon_morgan_foundthem,"Našel jsem je.",dia_addon_morgan_foundthem_now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Jestli najdeš mùj prsten, pøines mi ho. Nebude to za nic, slibuju!
	};
};

func void dia_addon_morgan_foundthem_now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Našel jsem je.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//Mám ti zaplatit každé slovo? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//Prsten. Kde je prsten?
	Info_ClearChoices(dia_addon_morgan_foundthem);
	Info_AddChoice(dia_addon_morgan_foundthem,"Tady to je.",dia_addon_morgan_foundthem_givering);
	Info_AddChoice(dia_addon_morgan_foundthem,"Nemìli to u sebe.",dia_addon_morgan_foundthem_noring);
};

func void dia_addon_morgan_foundthem_noring()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Nemìli to u sebe.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(zdìšenì) Co? Jdi zpìt a podívej se znova. Musejí ho mít.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//Je to malý prsten s mnoha ornamenty.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//MUSÍŠ ho najít. MUSÍŠ!
	Info_ClearChoices(dia_addon_morgan_foundthem);
};

func void dia_addon_morgan_foundthem_givering()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Tady je.
	b_giveinvitems(other,self,itri_addon_morgansring_mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(šastný jak blázen) Ano, to je ono. Hodný chlapec!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Tady, vem si tuhle kamennou desku. Vypadá jak starý odpad, ale Garett ti za ni dobøe zaplatí.
	MIS_ADDON_MORGAN_SEEKTRAITOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGANSRING);
	Info_ClearChoices(dia_addon_morgan_foundthem);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
};


instance DIA_ADDON_MORGAN_FRANCIS(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_francis_condition;
	information = dia_addon_morgan_francis_info;
	description = "Co si myslíš o Francisovi?";
};


func int dia_addon_morgan_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_morgan_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co si myslíš o Francisovi?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//Nestarám se, (nebezpeènì) tak dlouho dokud mì nechá na pokoji!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Není tady šéfem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(drsnì se smìje) On si MYSLÍ, že je tady šéfem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//(radostnì) Ale jen co se Greg vrátí, bude Francis  znovu a velmi pilnì  øezat klády.
};


instance DIA_ADDON_MORGAN_TRAIN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_train_condition;
	information = dia_addon_morgan_train_info;
	description = "Mùžeš mì taky trénovat?";
};


func int dia_addon_morgan_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_train_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//Mùžeš mì taky trénovat?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Jasnì, mùžu ti ukázat, jak bojovat s jednoruèními zbranìmi.
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
	MORGAN_ADDON_TEACHPLAYER = TRUE;
};


var int morgan_merke1h;
var int morgan_labercount;

instance DIA_ADDON_MORGAN_TEACH(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_teach_condition;
	information = dia_addon_morgan_teach_info;
	permanent = TRUE;
	description = "Trénuj mì!";
};


func int dia_addon_morgan_teach_condition()
{
	if(MORGAN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Trénuj mì!
	MORGAN_MERKE1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] > MORGAN_MERKE1H)
	{
		if(MORGAN_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Mìj jednu vìc na pamìti. Všechna øeè o slávì je ztráta èasu. Buï ty zabiješ jeho, nebo on zabije tebe.
			MORGAN_LABERCOUNT = 1;
		}
		else if(MORGAN_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//V budoucnu se budeš muset nauèit, jak do svých úderù dát více síly.
			MORGAN_LABERCOUNT = 2;
		}
		else if(MORGAN_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Hahaha, nakonec jsi se nauèil, jak držet meè.
			MORGAN_LABERCOUNT = 0;
		};
	}
	else if(other.hitchance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Jestli budeš chtít být lepší, budeš si muset najít nìkoho jiného.
	};
	Info_ClearChoices(dia_addon_morgan_teach);
};

func void dia_addon_morgan_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

