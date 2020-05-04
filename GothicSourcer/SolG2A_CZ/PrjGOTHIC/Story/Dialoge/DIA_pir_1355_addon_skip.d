
instance DIA_ADDON_SKIP_EXIT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 999;
	condition = dia_addon_skip_exit_condition;
	information = dia_addon_skip_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_PICKPOCKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 900;
	condition = dia_addon_skip_pickpocket_condition;
	information = dia_addon_skip_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_skip_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_skip_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_BACK,dia_addon_skip_pickpocket_back);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_PICKPOCKET,dia_addon_skip_pickpocket_doit);
};

func void dia_addon_skip_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_skip_pickpocket);
};

func void dia_addon_skip_pickpocket_back()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
};


instance DIA_ADDON_SKIP_HELLO(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_hello_condition;
	information = dia_addon_skip_hello_info;
	important = TRUE;
};


func int dia_addon_skip_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PLAYERTALKEDTOSKIPNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//No kdo to zase køíží cestu se starým Skipem?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//(pøehnanì) Já tì znám!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Zátoka poblíž mìsta, pamatuješ?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Správnì?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(hrdì) Mùžu øíci, že jsem ti to natrvalo vtiskl.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale mezitím jsem tvoji tváø musel vidìt nìkde JINDE ...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Ah! Jasnì!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Tak dobrá. Špatnì nakreslené, ale jsi to TY.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Neboj. Mé plakáty vypadají stejnì hloupì.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SKIPADW_BALTRAMPAKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 2;
	condition = dia_addon_skipadw_baltrampaket_condition;
	information = dia_addon_skipadw_baltrampaket_info;
	description = "Mám pro tebe balík od Baltrama.";
};


func int dia_addon_skipadw_baltrampaket_condition()
{
	if(Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skipadw_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(šklebí se) Musí být velmi chtivý po našem rumu, nebo by nemìl posílat vìci TOUHLE CESTOU.
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Tady jsou pro nìj 2 láhve rumu. Tøetí jsem vypil, když jsem na nìj èekal.
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_JOB(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 3;
	condition = dia_addon_skip_job_condition;
	information = dia_addon_skip_job_info;
	description = "Co tady dìláš?";
};


func int dia_addon_skip_job_condition()
{
	return TRUE;
};

func void dia_addon_skip_job_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Zrovna jsem se vrátil z Khorinisu a teï èekám, až se Greg vrátí.
};


instance DIA_ADDON_SKIP_ADW_GREGGETROFFEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 4;
	condition = dia_addon_skip_adw_greggetroffen_condition;
	information = dia_addon_skip_adw_greggetroffen_info;
	description = "Vidìl jsem Grega v Khorinisu.";
};


func int dia_addon_skip_adw_greggetroffen_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (GREGISBACK == FALSE) && Npc_KnowsInfo(other,dia_addon_skip_job))
	{
		return TRUE;
	};
};

func void dia_addon_skip_adw_greggetroffen_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Vidìl jsem Grega v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Opravdu? Zatracenì! Nìco musí být špatnì.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Mìl by být zpìt s naší lodí.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(zamyšlenì) Bude nejlepší, když se vrátím do Khorinisu a poèkám tam na nìho ...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(povzdech) Ale urèitì ne dnes. Zrovna jsem pøijel.
	b_giveplayerxp(XP_AMBIENT);
};


var int skip_transport_variation;

instance DIA_ADDON_SKIP_TRANSPORT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 99;
	condition = dia_addon_skip_transport_condition;
	information = dia_addon_skip_transport_info;
	permanent = TRUE;
	description = "Mùžeš mì vzít zpìt do Khorinisu?";
};


func int dia_addon_skip_transport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_transport_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Mùžeš mì vzít zpìt do Khorinisu?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Ne. Ještì nejdu. Nejdøív si dám poøádný hlt grogu.
	}
	else if(SKIP_TRANSPORT_VARIATION == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zbláznil jsi se? Ztratili jsme naši loï, chlape!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nebudu používat naši poslední loï na plavbu pro potìšení, jenom proto, že ty jsi moc líný dostat tvùj zadek do Khorinisu SÁM!
		SKIP_TRANSPORT_VARIATION = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Kolikrát? NE!
	};
};


instance DIA_ADDON_SKIP_BANDITS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_bandits_condition;
	information = dia_addon_skip_bandits_info;
	description = "Co mi mùžeš øíct o banditech?";
};


func int dia_addon_skip_bandits_condition()
{
	return TRUE;
};

func void dia_addon_skip_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mi mùžeš øíct o banditech?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandité? ÚTOÈÍ na nás!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Proè by jsme jinak stavili palisády?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Vlastnì jsme ty šmejdy sem pøivedli my.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Také jsme s nimi obchodovali. Chlapèe, mìli moc zlata, mìli ho i za ušima!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli pøipraveni zaplatit barel rumu za jakkoukoli cenu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale tyhle dny skonèili. Teï je válka!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ti teplouši nezaplatili poslední zásilku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Tak jsem se tam byl podívat, co se dìje s naším zlatem.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Ale když jsem vstoupil do moèálu, ti bastardi na mì zaèali útoèit!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//To ale není vše. Odstranili Agnuse a Hanka! Dva z našich nejlepších chlapcù!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Nechoï do moèálu, to ti øeknu!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Zaútoèí na vše, co není tak otrhané jako oni sami.
};


instance DIA_ADDON_SKIP_ARMORPRICE(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_armorprice_condition;
	information = dia_addon_skip_armorprice_info;
	description = "Potøebuji zbroj banditù.";
};


func int dia_addon_skip_armorprice_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_armorprice_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Potøebuji zbroj banditù.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ty tam chceš jít? Jsi úplnì ztratil rozum.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Jestli tihle chlapi zjistí, že nejsi jeden z nich, nakrmí s tebou bažinné žraloky!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Nìjaký nápad, kde mohu najít takové brnìní?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(povzdech) Ty to nevzdáš, že? Dobrá. Mìli jsme jedno.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Greg ho možná má ve své chatrèi.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Když se vrátí, možná ti ho prodá ...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Skip pøedpokládá, že zbroj bude v Gregovì chatrèi.");
};


instance DIA_ADDON_SKIP_GREGSHUT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_gregshut_condition;
	information = dia_addon_skip_gregshut_info;
	permanent = FALSE;
	description = "Nìjaký nápad, jak se mùžu dostat do chatrèe?";
};


func int dia_addon_skip_gregshut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_armorprice) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_gregshut_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//Nìjaký nápad, jak se mùžu dostat do chatrèe?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Hahaha! Spolehlivý!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chystáš se šlohnout nìco z Gregovy sbírky?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Když odešel, dal Francisovi klíèe a pøíkaz, že NIKDO nesmí vstoupit do chatrèe.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Francis má klíè od Gregovy chatrèe. Má pøíkaz nikoho nepouštìt dovnitø.");
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_SKIP_FRANCIS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_francis_condition;
	information = dia_addon_skip_francis_info;
	permanent = FALSE;
	description = "Co mi mùžeš øíct o Francisovi?";
};


func int dia_addon_skip_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_gregshut))
	{
		return TRUE;
	};
};

func void dia_addon_skip_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mi mùžeš øíct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis je náš pokladník.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapitán mu vìøí. Proto mu svìøil velení.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//I když ho nikdo nebere vážnì.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jestli se chceš dovìdìt víc, promluv se Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Jeho destilátor je v malé jeskyni na severu.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//V tomhle táboøe není nikdo, o kom by Samuel NÌCO zajímavýho nevìdìl.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Mìl bych si promluvit se Samuelem. Možná mì mùže dát tip.");
};


instance DIA_ADDON_SKIP_RAVEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_raven_condition;
	information = dia_addon_skip_raven_info;
	permanent = FALSE;
	description = "Setkal jsi se nìkdy s Ravenem?";
};


func int dia_addon_skip_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Setkal jsi se nìkdy s Ravenem?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Jasnì. Byl jsem u pøední brány s Henrym. Mohli jsme vidìt Ravena, jak posílal nìkteré ze svých lidí do vìže na východ odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Opravdu blízko k našemu táboru. (smìje se) Hádám, že jsou tam proto, aby nás špehovali.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Také jsem vidìl, jak ošetøuje lidi, kteøí nedìlají, co jim pøikáže.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Každý kdo neposlechne na slovo, je bez rozmýšlení zabit.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Vyvaruj se Ravena, to ti povím.
};


instance DIA_ADDON_SKIP_ANGUSHANK(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushank_condition;
	information = dia_addon_skip_angushank_info;
	description = "Øekni mi více o Agnusovi a Hankovi.";
};


func int dia_addon_skip_angushank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushank_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Øekni mi více o Agnusovi a Hankovi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus a Hank se byli pravdìpodobnì setkat s pár bandity za táborem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//Mìli s sebou všechno možné. Vše, o co si ti bastardi øekli.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Surovou ocel a paklíèe.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Ale nikdy se nevrátili. Ty banditské svinì je musely odpravit!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgand a Bill se po nich byli podívat - bez výsledku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill byl z toho pìknì špatný. Kamarádil se s nimi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Je stále mladý a tenhle incident ho hodnì poznamenal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Ostatní to brali v klidu. Ztráta vìci je snadná. (povzdech) Ale grog co mìli s sebou ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(kysele) Mluvíme nejménì o 20 láhvích!
	MIS_ADDON_SKIPSGROG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_SKIPSGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKIPSGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Jak se zdá, tak Skip ztratil 20 láhví grogu. Chce je zpátky.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Angus a Hank byli vysláni za pár bandity na obchod. Potom už nebyli znovu spatøeni.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Morganovo a Billovo pátrání nepøineslo žádné výsledky ...");
};


instance DIA_ADDON_SKIP_ANGUSHANKDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankdead_condition;
	information = dia_addon_skip_angushankdead_info;
	permanent = FALSE;
	description = "O Angusovi a Hankovi ...";
};


func int dia_addon_skip_angushankdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && !Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankdead_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//O Angusovi a Hankovi ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Našel jsem je.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(pro sebe) Mrtvý jako dveøní høebík - ubozí chlapi!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Dobrá, nic víc jsem neèekal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Mìl bys dát Billovi vìdìt, pokud jsi to už neudìlal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale øekni mu to jemnì - je stále mladý.
};


instance DIA_ADDON_SKIP_ANGUSHANKMURDER(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankmurder_condition;
	information = dia_addon_skip_angushankmurder_info;
	permanent = FALSE;
	description = "Znám vraha Agnuse a Hanka.";
};


func int dia_addon_skip_angushankmurder_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushankdead) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Znám vraha Agnuse a Hanka.
	if(MIS_ADDON_SKIPSGROG == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Dobøe pro tebe. Jsou oba mrtví. Kdo se o nìj postará?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Pomsta nikdy neudìlá piráta bohatého.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Nejdùležitìjší je, že mám svùj grog zpátky.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Vrah mì nezajímá! Co mùj grog?!
	};
};


instance DIA_ADDON_SKIP_GROG(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 9;
	condition = dia_addon_skip_grog_condition;
	information = dia_addon_skip_grog_info;
	permanent = TRUE;
	description = "O grogu ...";
};


func int dia_addon_skip_grog_condition()
{
	if(MIS_ADDON_SKIPSGROG == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//O grogu ...
	if(Npc_HasItems(other,itfo_addon_grog) >= 20)
	{
		Info_ClearChoices(dia_addon_skip_grog);
		Info_AddChoice(dia_addon_skip_grog,DIALOG_BACK,dia_addon_skip_grog_back);
		Info_AddChoice(dia_addon_skip_grog,"Tady je tvých 20 láhví.",dia_addon_skip_grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Postrádáš 20 láhví, že?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Ano, zatracenì. To byly naše úplné zásoby.
	};
};

func void dia_addon_skip_grog_back()
{
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Tady je tvých 20 láhví.
	b_giveinvitems(other,self,itfo_addon_grog,20);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip má svých 20 láhví grogu a je spokojený.");
	MIS_ADDON_SKIPSGROG = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_SKIPSGROG);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Co to? Za nic?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Noo ...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobrá. Zaplatím ti.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Máš nìco více zajímavìjšího, než je zlato?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmm. Nech mì se kouknout. Mám tu tady ten prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Vyhrál jsem ho pøed mnoha roky v jednom dusném pøístavním baru pøi høe na šanci.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Staroch øekl, že je magický. Což se zdá.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chceš ho, nebo chceš zlato?
	Info_ClearChoices(dia_addon_skip_grog);
	Info_AddChoice(dia_addon_skip_grog,"Dej mi peníze.",dia_addon_skip_grog_gold);
	Info_AddChoice(dia_addon_skip_grog,"Dej mi prsten.",dia_addon_skip_grog_ring);
};

func void dia_addon_skip_grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Dej mi prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Tady máš.
	b_giveinvitems(self,other,itri_prot_edge_02,1);
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_gold()
{
	var int grogkohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Dej mi peníze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Jasnì.
	grogkohle = VALUE_GROG * 20;
	b_giveinvitems(self,other,itmi_gold,grogkohle);
	Info_ClearChoices(dia_addon_skip_grog);
};


instance DIA_ADDON_SKIP_NEWS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 888;
	condition = dia_addon_skip_news_condition;
	information = dia_addon_skip_news_info;
	permanent = FALSE;
	description = "Máš nìco k prodeji?";
};


func int dia_addon_skip_news_condition()
{
	return TRUE;
};

func void dia_addon_skip_news_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Máš nìco k prodeji?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jestli chceš obchodovat, promluv si s Garettem. Stará se o zásoby.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_SKIP_ANHEUERN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 11;
	condition = dia_addon_skip_anheuern_condition;
	information = dia_addon_skip_anheuern_info;
	permanent = FALSE;
	description = "Pojï, pomož mi.";
};


func int dia_addon_skip_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Pojï, pomož mi.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co se dìje?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Kaòon èeká.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Vidím, že jsi shromáždil pár chlapcù. To je dobøe!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Radši s sebou vezmi víc chlapcù!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Kaòon je smrtící!
};


instance DIA_ADDON_SKIP_COMEON(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 12;
	condition = dia_addon_skip_comeon_condition;
	information = dia_addon_skip_comeon_info;
	permanent = TRUE;
	description = "Pojï se mnou.";
};


func int dia_addon_skip_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_skip_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_skip_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Pojï se mnou.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Poèkej. Nejdøív se vrame do kaòonu ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Jasnì!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SKIP_GOHOME(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 13;
	condition = dia_addon_skip_gohome_condition;
	information = dia_addon_skip_gohome_info;
	permanent = TRUE;
	description = "Už tì více nepotøebuji.";
};


func int dia_addon_skip_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Už tì více nepotøebuji.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Pak dobrá. Jsem v táboøe.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SKIP_TOOFAR(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 14;
	condition = dia_addon_skip_toofar_condition;
	information = dia_addon_skip_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skip_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To je dost daleko!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jestli opravdu chceš jít dál, udìlej to bez nás!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jestli opravdu chceš jít dál, udìlej to beze mì.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_TREFFPUNKT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_treffpunkt_condition;
	information = dia_addon_skip_treffpunkt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_treffpunkt_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (c_allcanyonrazordead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_treffpunkt_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Pokud se rozdìlíme, setkáme se u tohohle jezírka.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Pojïme!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ORKS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_orks_condition;
	information = dia_addon_skip_orks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_orks_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_skip_orks_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Skøeti! Nenávidím tyhle bestie!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ALLRAZORSDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_allrazorsdead_condition;
	information = dia_addon_skip_allrazorsdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_allrazorsdead_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_allcanyonrazordead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_allrazorsdead_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Vypadá to, že jsme dostali všechny bøitvy.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Mùžeme se tu ještì trochu potulovat, jestli chceš.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Tak dlouho dokud zùstaneme v kaòonu.
	AI_StopProcessInfos(self);
};

