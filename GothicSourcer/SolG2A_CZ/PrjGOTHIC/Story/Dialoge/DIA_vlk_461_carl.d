
instance DIA_CARL_EXIT(C_INFO)
{
	npc = vlk_461_carl;
	nr = 999;
	condition = dia_carl_exit_condition;
	information = dia_carl_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_carl_exit_condition()
{
	return TRUE;
};

func void dia_carl_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_carlsayhallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Vypadá to, e tu ve mìstì máme pár zlodìjù, co okrádají boháèe.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//Mìstská strá nedávno obrátila pøístavní ètvr vzhùru nohama, ale nenašli vùbec nic.
};


instance DIA_CARL_PICKPOCKET(C_INFO)
{
	npc = vlk_461_carl;
	nr = 900;
	condition = dia_carl_pickpocket_condition;
	information = dia_carl_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_carl_pickpocket_condition()
{
	return c_beklauen(34,40);
};

func void dia_carl_pickpocket_info()
{
	Info_ClearChoices(dia_carl_pickpocket);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_BACK,dia_carl_pickpocket_back);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_PICKPOCKET,dia_carl_pickpocket_doit);
};

func void dia_carl_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_carl_pickpocket);
};

func void dia_carl_pickpocket_back()
{
	Info_ClearChoices(dia_carl_pickpocket);
};


instance DIA_CARL_HALLO(C_INFO)
{
	npc = vlk_461_carl;
	nr = 2;
	condition = dia_carl_hallo_condition;
	information = dia_carl_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carl_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_carl_hallo_info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Co dìláš v tıhle ubohı špinavı díøe? Co tady hledáš?
	Info_ClearChoices(dia_carl_hallo);
	Info_AddChoice(dia_carl_hallo,"Zabloudil jsem.",dia_carl_hallo_verlaufen);
	Info_AddChoice(dia_carl_hallo,"Jen se dívám kolem.",dia_carl_hallo_umsehen);
};

func void dia_carl_hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Zabloudil jsem.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Tak si dávej pozor, aby tì nikdo neokradl.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};

func void dia_carl_hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Jen se dívám kolem.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Aha. Tak si dávej bacha, a tì nikdo nechytí, jak tu èenicháš.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};


instance DIA_CARL_DIEBE(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_diebe_condition;
	information = dia_carl_diebe_info;
	permanent = FALSE;
	description = "Co víš o tìch zlodìjích?";
};


func int dia_carl_diebe_condition()
{
	return TRUE;
};

func void dia_carl_diebe_info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Co víš o tìch zlodìjích?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Nic. Ale všichni mìšané jsou vydìšení a zaèínají bıt nedùvìøiví - obzvláš vùèi cizincùm.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Nenech se nachytat v cizím domì - na to se tady nikdo nekouká moc vlídnì.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Ano, musíš se umìt bránit zlodìjùm. Nejlíp na to jít s poøádnì tlustım klackem.
};


instance DIA_CARL_LERNEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_lernen_condition;
	information = dia_carl_lernen_info;
	permanent = FALSE;
	description = "Mùu se u tebe nìèemu pøiuèit?";
};


func int dia_carl_lernen_condition()
{
	return TRUE;
};

func void dia_carl_lernen_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Mùu se u tebe nìèemu pøiuèit?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//No, vyrobil jsem nìkolik klik a nìco høebíkù a opravuju kovové souèástky.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Ale o kování zbraní toho nevím tolik, abych tì mohl uèit.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//Jestli se chceš nìco nauèit, zajdi za Haradem. On urèitì ví, jak se vyrábìjí zbranì!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Ale jestli si chceš trochu vypracovat svaly, tak s tím ti mùu pomoct.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"S pomocí kováøe Carla z pøístavní ètvrti se mohu stát silnìjším.");
};


instance DIA_CARL_WIEVIEL(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_wieviel_condition;
	information = dia_carl_wieviel_info;
	permanent = FALSE;
	description = "Kolik si necháváš platit za vıcvik?";
};


func int dia_carl_wieviel_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen))
	{
		return TRUE;
	};
};

func void dia_carl_wieviel_info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Kolik si necháváš platit za vıcvik?
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//Slyšel jsem, es pracoval pro Eddu. Budu tì cvièit zadarmo.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 zlatıch a já ti dopomùu k vìtší síle.
	};
};


instance DIA_CARL_BEZAHLEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_bezahlen_condition;
	information = dia_carl_bezahlen_info;
	permanent = TRUE;
	description = "Rád bych se u tebe nechal vycvièit (zaplatit 50 zlaákù).";
};


func int dia_carl_bezahlen_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_wieviel) && (CARL_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_carl_bezahlen_info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Chtìl bych s tebou cvièit.
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//Slyšel jsem, es pracoval pro Eddu. Budu tì cvièit zadarmo.
		CARL_TEACHSTR = TRUE;
	}
	else if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Dobøe, mùeme zaèít hned, jak budeš pøipraven.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Dej mi zlato a pak tì budu trénovat.
	};
};


instance DIA_CARL_TEACH(C_INFO)
{
	npc = vlk_461_carl;
	nr = 7;
	condition = dia_carl_teach_condition;
	information = dia_carl_teach_info;
	permanent = TRUE;
	description = "Chtìl bych se stát silnìjším.";
};


func int dia_carl_teach_condition()
{
	if(CARL_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_carl_teach_info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Chtìl bych se stát silnìjším.
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_back()
{
	Info_ClearChoices(dia_carl_teach);
};

func void dia_carl_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

