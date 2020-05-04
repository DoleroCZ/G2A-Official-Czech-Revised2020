
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Zdravím, jsem tu nový.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Neber si to nijak zle, ale není mi do øeèi - jsem úplnì hotovej.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Jsi strašnì zamìstnaný, co?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Tak to máš pravdu. Bennet dìlá tolik zbraní, že je ani nestaèím leštit.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "Co mi mùžeš øíct o farmì?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Co mi mùžeš øíct o farmì?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Tohle je Onarova farma.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//To velké stavení je jeho dùm. Jedno køídlo pøenechal žoldákùm.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//My rolníci máme každý své lùžko ve stodole.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(pøekotnì) Ale já jsem spokojený, je dobrý mít lidi na hlídání farmy.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Tady za mnou je kuchyò.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Kuchyò je v té budovì, co má zepøedu kovárnu.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Možná budeš mít štìstí a Thekla pro tebe najde nìco k jídlu.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "A co ti žoldnéøi?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//A co ti žoldnéøi?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar je najal, aby drželi domobranu zpátky.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Ale také hlídají farmu, ovce a farmáøe.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Takže ani nepomysli na to, že bys mohl nìco ukrást nebo se hrabat v nìèí truhle.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Jen èekají na pøíležitost, jak tì vyøídit.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Mohu si od tebe koupit nìjaké zbranì?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Mohu si od tebe koupit nìjaké zbranì?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//Moc toho nemám. Skoro všechny meèe a sekery jsme dali do Onarova domu.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Proè nepracuješ?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Proè nepracuješ?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Tys to ještì neslyšel? Paladinové zavøeli Benneta.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Kováøe Benneta uvìznili mìstští paladinové.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//No, byli jsme ve mìstì nakupovat, když všichni najednou zaèali køièet. A nìkdo zaøval: Támhle jsou, chyte je!
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//Chlape, jak já byl vydìšenej! Vzal jsem nohy na ramena a utíkal, jako by mi v patách byl ïábel sám.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Bennet byl hned za mnou. Nevím, co se stalo, ale když jsem se dostal z mìsta, už jsem ho nikde nevidìl.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Musel se mi ztratit nìkde ve mìstì.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "Tak proè Benneta zavøeli?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Tak proè Benneta zavøeli?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Za vraždu! Bennet byl obvinìn z vraždy paladina. Takovej nesmysl. Byl jsem celou dobu s ním.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Tak proè nezajdeš do mìsta a celou tu vìc nevysvìtlíš?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//Šoupnou mì do basy jako komplice. Ne, za týhle situace tam rozhodnì nepùjdu.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Situace?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//Však víš, Onar a mìsto. To by dopadlo špatnì.
	b_logentry(TOPIC_RESCUEBENNET,"Bennet prý zavraždil paladina. Jeho uèedník Hodges ale tvrdí, že je nevinný. Ovšem nedovolil si vstoupit do mìsta.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "Co na to žolnéøi tady na farmì?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//Co na to žoldnéøi tady na farmì?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Jasnì, že nevím, co maj za lubem, ale nìkterý z nich jsou fakt vytoèený.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//To je pochopitelné.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Kdyby to bylo jen na nich, radìji by hned napadli mìsto, aby dostali Benneta ven.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Promluv si s Leem, tøeba ti nìco najde.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

