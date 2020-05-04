
instance DIA_UDAR_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_exit_condition;
	information = dia_udar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_HELLO(C_INFO)
{
	npc = pal_268_udar;
	nr = 2;
	condition = dia_udar_hello_condition;
	information = dia_udar_hello_info;
	important = TRUE;
};


func int dia_udar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_udar_hello_info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Když jsi vešel, mìl jsi zatracené štìstí. Málem jsem tì zastøelil.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//V tom pøípadì bych asi mìl být rád, že máš tak skvìlý zrak.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//Šetøi si dech. Jestli nìco chceš, promluv si se Sengrathem.
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_YOUAREBEST(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_youarebest_condition;
	information = dia_udar_youarebest_info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi NEJLEPŠÍ støelec z kuše široko daleko.";
};


func int dia_udar_youarebest_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_udar))
	{
		return 1;
	};
};

func void dia_udar_youarebest_info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//Slyšel jsem, že jsi NEJLEPŠÍ støelec z kuše široko daleko.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//Pokud se to øíká, tak to asi bude pravda. Co chceš?
};


instance DIA_UDAR_TEACHME(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teachme_condition;
	information = dia_udar_teachme_info;
	permanent = FALSE;
	description = "Nauè mì, jak správnì støílet z kuše.";
};


func int dia_udar_teachme_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest) && (UDAR_TEACHPLAYER != TRUE))
	{
		return 1;
	};
};

func void dia_udar_teachme_info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Nauè mì, jak správnì støílet z kuše.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Zmiz! Kolem hradu pobíhá spousta terèù. Cviè se na nich.
};


instance DIA_UDAR_IMGOOD(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_imgood_condition;
	information = dia_udar_imgood_info;
	permanent = FALSE;
	description = "Jsem nejlepší.";
};


func int dia_udar_imgood_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest))
	{
		return 1;
	};
};

func void dia_udar_imgood_info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Jsem nejlepší.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(smìje se) To teda jo!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//No, pokud se chceš uèit, pomùžu ti.
	UDAR_TEACHPLAYER = TRUE;
	b_logentry(TOPIC_TEACHER_OC,"Udar mi vysvìtlí, jak zacházet s kuší.");
};


instance DIA_UDAR_TEACH(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teach_condition;
	information = dia_udar_teach_info;
	permanent = TRUE;
	description = "Chci se uèit od tebe.";
};


func int dia_udar_teach_condition()
{
	if(UDAR_TEACHPLAYER == TRUE)
	{
		return 1;
	};
};

func void dia_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chci se uèit od tebe.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobrá, tak spus!
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};

func void dia_udar_teach_back()
{
	Info_ClearChoices(dia_udar_teach);
};

func void b_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Základy už umíš - na víc nemáme èas.
};

func void b_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Jestli se chceš nauèit se svou zbraní zacházet lépe, mìl by sis najít skuteèného uèitele.
};

func void dia_udar_teach_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
};

func void dia_udar_teach_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};


instance DIA_UDAR_PERM(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_perm_condition;
	information = dia_udar_perm_info;
	permanent = FALSE;
	description = "Jak to jde tady na hradì?";
};


func int dia_udar_perm_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_udar_perm_info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Jak to jde tady na hradì?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//Pár chlapcù trénuje, ale v zásadì èekáme, až se nìco stane.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//Tahle nejistota nás ubíjí. To mají skøeti pøesnì v plánu. Èekají, až nám prasknou nervy.
};


instance DIA_UDAR_RING(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_ring_condition;
	information = dia_udar_ring_info;
	permanent = FALSE;
	description = "Pøináším ti Tengronùv prsten...";
};


func int dia_udar_ring_condition()
{
	if(Npc_HasItems(other,itri_tengron) >= 1)
	{
		return TRUE;
	};
};

func void dia_udar_ring_info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//Pøináším ti Tengronùv prsten. Mìl by tì chránit. Až se Tengron vrátí, bude ho chtít zpátky.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Cože? Víš, co to je za prsten? Dostal ho jako odmìnu za svou odvahu v boji.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//Øíkáš, že ho bude chtít zpátky? Pokud to je vùle Innosova, stane se tak. Pokud to je vùle Innosova...
	b_giveinvitems(other,self,itri_tengron,1);
	TENGRONRING = TRUE;
	b_giveplayerxp(XP_TENGRONRING);
};


instance DIA_UDAR_KAP4_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap4_exit_condition;
	information = dia_udar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP4WIEDERDA(C_INFO)
{
	npc = pal_268_udar;
	nr = 40;
	condition = dia_udar_kap4wiederda_condition;
	information = dia_udar_kap4wiederda_info;
	important = TRUE;
};


func int dia_udar_kap4wiederda_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4wiederda_info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Je dobøe, že jsi pøišel. Brzy tady propukne peklo.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Co se stalo?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//Po hradì se poflakují drakobijci a chvástají se, že dokáží vyøešit naše problémy s draky.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Ale nìco ti povím - vypadají, jako by nedokázali zneškodnit ani nemocného starého slepýše.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Spousta z nás si zaèíná dìlat starosti a už moc nevìøíme, že se odsud dostaneme se zdravou kùží.
};


instance DIA_UDAR_SENGRATH(C_INFO)
{
	npc = pal_268_udar;
	nr = 41;
	condition = dia_udar_sengrath_condition;
	information = dia_udar_sengrath_info;
	description = "Nebyli jste tady na hlídce dva?";
};


func int dia_udar_sengrath_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_kap4wiederda) && (SENGRATH_MISSING == TRUE))
	{
		return TRUE;
	};
};

func void dia_udar_sengrath_info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Nebyli jste tady na hlídce dva?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//Bývalo. Sengrath stál tady na hradbách a najednou z nièeho nic usnul.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//Když se to stalo, jeho dobrý samostøíl spadnul dolù.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Vidìli jsme, jak ho skøeti popadli a zmizeli s ním ve tmì.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Sengrath se hned probudil a vybìhl do noci smìrem ke skøetí palisádì. Od té chvíle jsme ho nevidìli.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Innos stùj pøi nás!
	Log_CreateTopic(TOPIC_SENGRATH_MISSING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SENGRATH_MISSING,LOG_RUNNING);
	b_logentry(TOPIC_SENGRATH_MISSING,"Udar, strážný z hradu, postrádá svého druha Sengratha. Naposledy ho vidìl pozdì v noci, když míøil ke skøetímu opevnìní a vracel se pro svou kuši.");
};


instance DIA_UDAR_SENGRATHGEFUNDEN(C_INFO)
{
	npc = pal_268_udar;
	nr = 42;
	condition = dia_udar_sengrathgefunden_condition;
	information = dia_udar_sengrathgefunden_info;
	description = "Našel jsem Sengratha.";
};


func int dia_udar_sengrathgefunden_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_sengrath) && Npc_HasItems(other,itrw_sengrathsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_udar_sengrathgefunden_info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Našel jsem Sengratha.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//Vážnì? Kde je?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Je mrtvý. Tady je jeho kuše. Mìl ji u sebe.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Nejspíš se mu ji podaøilo získat zpìt, ale skøeti ho nakonec pøece jenom dostali.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Zatracený blázen. Vìdìl jsem to. Všichni tady pochcípeme.
	TOPIC_END_SENGRATH_MISSING = TRUE;
	b_giveplayerxp(XP_SENGRATHFOUND);
};


instance DIA_UDAR_BADFEELING(C_INFO)
{
	npc = pal_268_udar;
	nr = 50;
	condition = dia_udar_badfeeling_condition;
	information = dia_udar_badfeeling_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_udar_badfeeling_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_udar_sengrathgefunden) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_udar_badfeeling_info()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Ještì jeden takový útok a budeme žrát hlínu.
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Skøeti mají dost starostí. Nìco je hroznì vydìsilo. Cítím to.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Nemám z toho vùbec dobrý pocit.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_UDAR_KAP5_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap5_exit_condition;
	information = dia_udar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_udar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP6_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap6_exit_condition;
	information = dia_udar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_udar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_PICKPOCKET(C_INFO)
{
	npc = pal_268_udar;
	nr = 900;
	condition = dia_udar_pickpocket_condition;
	information = dia_udar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_udar_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_udar_pickpocket_info()
{
	Info_ClearChoices(dia_udar_pickpocket);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_BACK,dia_udar_pickpocket_back);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_PICKPOCKET,dia_udar_pickpocket_doit);
};

func void dia_udar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_udar_pickpocket);
};

func void dia_udar_pickpocket_back()
{
	Info_ClearChoices(dia_udar_pickpocket);
};

