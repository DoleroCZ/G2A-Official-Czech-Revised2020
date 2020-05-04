
instance DIA_JACK_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_exit_condition;
	information = dia_jack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_jack_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_PICKPOCKET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 900;
	condition = dia_jack_pickpocket_condition;
	information = dia_jack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jack_pickpocket_condition()
{
	return c_beklauen(50,100);
};

func void dia_jack_pickpocket_info()
{
	Info_ClearChoices(dia_jack_pickpocket);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};

func void dia_jack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jack_pickpocket);
};

func void dia_jack_pickpocket_back()
{
	Info_ClearChoices(dia_jack_pickpocket);
};


instance DIA_JACK_GREET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 4;
	condition = dia_jack_greet_condition;
	information = dia_jack_greet_info;
	important = TRUE;
};


func int dia_jack_greet_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jack_greet_info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Zdravím, ty suchozemská kryso, vypadá to, že zùstáváš tady.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//Jsi nìjakej pobledlej kolem žaber.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Nic si z toho nedìlej, kámo. Všechno, co potøebuješ, je dobrý silný moøský vzduch.
};


instance DIA_JACK_JOB(C_INFO)
{
	npc = vlk_444_jack;
	nr = 5;
	condition = dia_jack_job_condition;
	information = dia_jack_job_info;
	description = "Co tady dìláš?";
};


func int dia_jack_job_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_greet))
	{
		return TRUE;
	};
};

func void dia_jack_job_info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Døív, když jsem byl ještì mladej, jsem hodnì èasu trávil na moøi a prožil spoustu bouøí.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Pøed mnoha lety jsem se tu usadil a už pìknou øádku let se starám o khoriniský maják.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//Žádnej velkej kšeft. Vùbec ne. Ale ta stará vìž mi tak pøirostla k srdci, že už se v ní cítím jako doma.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Už jsem tam nahoøe nebyl celou vìènost.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Proè ne?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Od tý doby, co mùj maják obsadili nìjací budižknièemové, jsem nemìl odvahu se tam dostat blíž než na dvacet stop. Vážnì hrozná chátra.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Jsou to trestanci z Hornického údolí, však víš.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//Jednou to na druhý stranì hor poøádnì bouchlo a pak zamoøili celou zem jako kobylky. Teï se ukrývají úplnì všude, dokonce i v mym majáku.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//Mám dojem, že vyhlížej nìjakou loï, co by mohli okrást.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ha! A to udìlaj. Alespoò vypadnou z mojí vìže.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"Starý moøský vlk Jack se nemùže vrátit na svùj maják, nebo jej obsadili bandité.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "Pøicházíš do mìsta èasto?";
};


func int dia_jack_city_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_job))
	{
		return TRUE;
	};
};

func void dia_jack_city_info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Pøicházíš do mìsta èasto?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Vždycky øíkám, že mìsto je tak dobrý, jak dobrej je jeho pøístav.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Pøístav je brána do svìta. Tady se všichni setkávají a tady všechno zaèíná.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Jakmile je pøístav v háji, zbytek mìsta dopadne brzo stejnì.
};


instance DIA_JACK_HARBOR(C_INFO)
{
	npc = vlk_444_jack;
	nr = 70;
	condition = dia_jack_harbor_condition;
	information = dia_jack_harbor_info;
	permanent = TRUE;
	description = "Øekni mi nìco o pøístavu.";
};


func int dia_jack_harbor_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_harbor_info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Øekni mi nìco o pøístavu.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Khorinisský pøístav už není, co býval.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Není tu nic než chátra, co se poflakuje kolem, už sem nepøiplouvají žádné lodì a obchod je mrtvej. Tenhle pøístav je odepsanej.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"Proè už sem nepøiplouvají žádné lodì?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"Co myslíš tou chátrou?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"Tak proè neodejdeš?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Proè už sem nepøiplouvají žádné lodì?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//Všichni øíkají, že až válka skonèí, vrátí se všechno do starejch kolejí. Jsou to jenom kecy.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Øíkám ti, námoøník pozná, když to jde s mìstem z kopce.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Námoøník to cítí v krvi. A øeknu ti, zapomeò na pøístav, ten už to má spoèítaný.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Co myslíš tou chátrou?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Koukni na nì, líná sebranka. Vìtšina z nich vùbec netuší, co je práce. Všechno, co svedou, je chlastat celej den a poslední prachy utratit v bordelu.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Øíkám ti, drž se od nich dál.
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Tak proè neodejdeš?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Nikdo si v tuhle dobu nevezme na palubu takovýho starýho moøskýho vlka, jako jsem já.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Vìtšina lidí si myslí, ze starej Jack má ve svejch prohnilejch kostech dnu.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//A? Je to pravda?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Nesmysl. Jakmile mám palubu pod nohama, cítím se jako mladej Jura.
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "Ti banditi, co zabrali tvùj maják, jsou pryè.";
};


func int dia_jack_banditenweg_condition()
{
	if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Ti banditi, co zabrali tvùj maják, jsou pryè.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Je to vážnì pravda? Koneènì se mùžu vrátit ke svý práci.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Pojï se mnou na maják. Nahoøe je krásnej výhled na moøe.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};


instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_444_jack;
	nr = 8;
	condition = dia_jack_lighthousefree_condition;
	information = dia_jack_lighthousefree_info;
	permanent = TRUE;
	description = "Máš tady pìknej maják.";
};


func int dia_jack_lighthousefree_condition()
{
	if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//Máš tady pìknej maják.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Díky. Prostì vyjdi po všech tìch schodech nahoru a vychutnej si ten nádherný výhled, chlapèe. Jako doma.
};


instance DIA_JACK_KAP3_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap3_exit_condition;
	information = dia_jack_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jack_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP4_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap4_exit_condition;
	information = dia_jack_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jack_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP5_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap5_exit_condition;
	information = dia_jack_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jack_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 51;
	condition = dia_jack_bemycaptain_condition;
	information = dia_jack_bemycaptain_info;
	permanent = TRUE;
	description = "Nechtìl by ses vrátit na moøe?";
};


func int dia_jack_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Nechtìl by ses vrátit na moøe?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Dal bych pravou ruku za to, kdyby mì ještì jednou nìkdo najal na velkej škuner.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Ale pro takovýho starýho moøskýho vlka to není tak snadný, hochu. A stejnì, kdo by se pak staral o maják?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Nevadí. Byl to jen nápad.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Potøebuju tvoje námoønický zkušenosti.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Potøebuju tvoje námoønický zkušenosti.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//U všech rozvrzanejch fošen. Co máš za lubem, chlapèe? Nehodláš si vyzkoušet palubu královský váleèný galéry, že ne?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Kdo ví?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(smích) To by mohlo nìco znamenat. No dobrá. Nemùžu tu jen tak nechat mùj maják. Mmh. Co s tím udìláme?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Ze starého námoøníka Jacka z pøístavu mùže být dobrý kapitán - nejdøív ale musím sehnat nìkoho, kdo mu ohlídá maják.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Nevadí. Byl to jen nápad.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Co když ti nìkoho pøivedu...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//Co když ti seženu nìkoho, kdo se zatím o maják postará?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//To není špatnej nápad, hochu. A já takovýho èlovìka znám.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Kováø Harad má uèedníka jménem Brian. Už jsem s ním hodnìkrát mluvil.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Chtìl bych svùj maják svìøit právì jemu. Myslim, že je pro to ten pravej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Bìž si s ním promluvit. Možná budeme mít štìstí a ten kluk nám pomùže.
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Nevadí. Byl to jen nápad.
	Info_ClearChoices(dia_jack_bemycaptain);
};


instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_444_jack;
	nr = 52;
	condition = dia_jack_bemycaptain2_condition;
	information = dia_jack_bemycaptain2_info;
	description = "Co se týèe Briana...";
};


func int dia_jack_bemycaptain2_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain2_info()
{
	if(Npc_IsDead(brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian je mrtvý.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Ach. Tohle jsou strašný èasy. A byli jsme tak dobrý kámoši.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Brian se odteï bude starat o tvùj maják.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Doufal jsem, že to øekneš.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Ještì poøád mì potøebuješ?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Podíváme se, jestli je ten kluk k nìèemu dobrej.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_444_jack;
	nr = 53;
	condition = dia_jack_bemycaptain3_condition;
	information = dia_jack_bemycaptain3_info;
	description = "Buï mým kapitánem.";
};


func int dia_jack_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Buï mým kapitánem.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Proplul jsem sedmero moøí, hochu, ale ještì nikdy jsem nebyl kapitánem lodi.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//O navigaci nevím vùbec nic. Mìl by ses toho ujmout sám.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Udìlám, co bude v mých silách.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//Tak mi ukaž svou loï i s posádkou. A víš ty vùbec, kam máme namíøeno? Myslim, jestli máš námoøní mapu?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Poèkej na mì v pøístavu. O zbytek se nestarej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Když to øíkáš.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JACKISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JACK_LOSFAHREN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_losfahren_condition;
	information = dia_jack_losfahren_info;
	permanent = TRUE;
	description = "Dobrá. Tak vyplouváme.";
};


func int dia_jack_losfahren_condition()
{
	if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_losfahren_info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Dobrá. Tak vyplouváme.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Všechno je v poøádku. Tak mi ukaž tu námoøní mapu.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//To bude pìknej výlet. Doufám, že se tam dostaneme v jednom kuse.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//Máš opravdu všechno, co potøebuješ? Nebudeme se vracet jen proto, že jsi nìco zapomnìl.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Jestli seš si jistej, že máme opravdu všechno, bìž do kapitánský kajuty a dej si dvacet. Bude se ti to hodit.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Klídek, chlapèe. Ještì jsem ten škopek nevidìl. Takhle to nepude.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Nejdøív budeš potøebovat kompletní posádku s minimálnì pìti chlapama, volný pøístup na loï a námoøní mapu. Jinak na to zapomeò.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_perm5_notcaptain_condition;
	information = dia_jack_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Co bude pak?";
};


func int dia_jack_perm5_notcaptain_condition()
{
	if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_jack_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//Co bude pak?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//Rozmyslel jsem si to. Zùstanu tady a budu radìj hlídat svùj maják.
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP6_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap6_exit_condition;
	information = dia_jack_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jack_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

