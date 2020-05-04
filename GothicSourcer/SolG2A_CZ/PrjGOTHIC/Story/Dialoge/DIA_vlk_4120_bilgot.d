
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Hej, odkud pøicházíš? Pøicházíš z hradu?
	Info_AddChoice(dia_bilgot_hallo,"Ano, pøicházím z hradu - proè?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"Riskl jsem pøijít sem...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Prostì mì sem cesta zavedla.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Chlapèe, sem nikoho cesta JEN TAK nezavede. Jsme tady totálnì v háji - všude kolem jsou chòapavci!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//Není dne, aby jeden z nás nešel k èertu.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Nechceš mi øíct, odkud pøicházíš? Dobrá - a si tì vezmou chòapavci!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Ano, pøicházím z hradu - proè?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Jak to tam vypadá?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//O nic líp ne tady. Skøeti jsou tam poøád, pokud myslíš tohle.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Zatracenì. Èlovìk není nikde v bezpeèí.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Nìco ti øeknu. Kdybych nebyl posranı strachy, prosekal bych se odtud.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "A co tady vlastnì dìláš?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//A co tady vlastnì dìláš?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//Jsem tady dìvèe pro všechno. Chodím okolo a sleduju chòapavce, Bilgote sem, Bilgote tam.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Mìl jsem radši zùstat doma se svou starou. Nebylo to sice o moc lepší, ale aspoò tam bylo nìco poøádného k jídlu.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//A nyní jsem všechno, co zbylo z Fajethovıch ozbrojencù.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Jak jsem mìl vìdìt, e se tahle vıprava nevrátí?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//Mùj pøítel Olav se vypaøil. Moná mu to vyšlo.
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "Co víš o chòapavcích?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Co víš o chòapavcích?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//Proè to chceš vìdìt? A neøíkej mi, e jsi jenom zvìdavı!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Chystám se na ty chòapavce vyrazit.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//To je bláznovství. Pozoroval jsem je - jsou to krveíznivé bestie.
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//Øekni mi, co o nich víš.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Hm... mohl bych ti pomoci - ale jen pod jednou podmínkou!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Co chceš?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Kdy dokáeš zabít chòapavce, musíš mì odsud dostat!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Nemùu se tady déle zdrovat. U jsi mluvil s Fedem? Ten chlap je troska - a já nechci dopadnout jako on!
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "Øekni mi, co víš. Potom tì odsud dostanu!";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Øekni mi, co víš. Potom tì odsud dostanu!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Vìdìl jsem, e s tebou mùu poèítat. Tak dávej pozor. Nìjakou dobu jsem ty chòapavce pozoroval.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//Jsou hodnì mazaní a nìjak se spolu... domlouvají. Nikdy nechodí sami a útoèí pouze ve skupinì.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Ale je tu ještì nìco. Je mezi nimi ještìr, kterı je úplnì jinı. Ukazuje se jen zøídka, ale já ho vidìl.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Ostatní bestie se klaní, kdy je míjí - ale nikdy ho nespustí z oèí.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Dokud se nepohne tenhle, tak ani ádnı jinı.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Kde najdu tuhle zatracenou bestii?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Vidìl jsem ji u schodù do staré strání vìe.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Dobrá. Myslím, e rozumím. Díky!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Pamatuj, dal jsi mi slovo!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Bilgot se domnívá, e vùdce chòapavèí smeèky nejspíš najdu na schodech staré strání vìe.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"Bilgot chce, abych ho dostal z údolí.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "(Dodret slib.)";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Je èas, Bilgote! Sbal si své vìci, odcházíme.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Jsem pøipraven!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "Nemùeš jít trochu rychleji?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Nemùeš jít trochu rychleji?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Jdu tak rychle, jak jen mùu.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Tak, jsme tady. Teï natrefíme na cestu. Tahle oblast je nebezpeèná!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Díky!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Nenech se serat. To by byla škoda.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//Sbohem!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "Co tady dìláš? Myslel jsem, e jsi mìl namíøeno pøes prùsmyk?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//Co tady dìláš? Myslel jsem, e jsi mìl namíøeno pøes prùsmyk?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//U nemùu dál. Nech mì na chvíli vydechnout. Já to zvládnu. Neboj se!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Kdy to øíkáš.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Jen malou pøestávku.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "Našel jsem Olava.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Našel jsem Olava.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//A jak se má?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Je mrtvı. Serali ho vlci.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//Ale, zatracenì. Doufám, e se mi aspoò podaøí dostat se odtud.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

