
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "Haló, krásná paní.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Haló, krásná paní.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hm. Odkud jsi utekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Co chceš?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "Øíká se, že jste se postavili králi?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Øíká se, že jste se postavili králi?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//Mùj otec se rozhodl, že nadešel èas na to, abychom se zaèali spoléhat sami na sebe.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Domobrana nám nikdy nepomohla. Vždycky jen pøišli a sebrali nám naše zásoby jídla.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "Jaká práce je tady na farmì k dispozici?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Jaká práce je tady na farmì k dispozici?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//Mùj otec platí každému, kdo pomáhá bránit farmu.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Mìl bys zájem? Nevypadáš jako nìkdo, kdo by se hrnul do práce námezdního rolníka.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Kolik tvùj otec platí?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//To bys mìl projednat spíš s ním.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Vím jen, že každý žoldák tady dennì dostává žold.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "Máte tu nìjaká pravidla, která bych mìl dodržovat?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Máte tu nìjaká pravidla, která bych mìl dodržovat?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Nedotýkej se tu nièeho, co není tvoje.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Vyhýbej se místùm, na kterých nemáš co dìlat.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//A když budeš muset zaèít bojovat, drž se poblíž žoldákù.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Pokud zaèneš hádku s farmáøi, budou tady všichni proti tobì.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "Jakou práci tu vykonáváš?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//Jakou práci tu vykonáváš?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Prodávám zboží, které vyrobíme. Jestli chceš nìco koupit, staèí dát vìdìt.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Ale dovol mi tì varovat. Nestojím o žádné smlouvání a nemám ráda dlouhé prsty, rozumíme si?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Ellena prodává na Onarovì statku rùzné zboží.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Ukaž mi své zboží!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Co ti mùžu nabídnout?
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Stalo se tu poslední dobou nìco dùležitého?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Stalo se tu poslední dobou nìco dùležitého?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Pøed pár dny mùj otec rozhlásil, že už dál nesmíme nic prodávat ve mìstì.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Tak teï zùstávám na farmì a prodávám své zboží jenom návštìvníkùm statku.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Domobrana napadá sousední farmy èím dál tím èastìji. Je to jen otázka èasu, kdy mùj otec zasáhne.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Zemì se stala ponìkud nebezpeènou. Teï si nikdo netroufne ani za humna. Už je to pìknì dlouho, co se nìkterý z nás naposledy vypravil do mìsta.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Žoldnéøi byli èím dál tím víc nesví. Ale jakmile odtáhl Sylvio se svými kumpány, vypadají už trochu klidnìji.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Všichni tu mluví o hrozícím skøetím útoku. Ale já tomu moc nevìøím. Podle mì jsme tady na farmì pøed nimi v bezpeèí.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "Prodáváš dùlní akcie?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Prodáváš dùlní akcie?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//No a co? Sám jsem za nì zaplatil poslední drobné.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

