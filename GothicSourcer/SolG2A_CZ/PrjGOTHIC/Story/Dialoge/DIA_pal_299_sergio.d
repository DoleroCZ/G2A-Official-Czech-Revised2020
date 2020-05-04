
instance DIA_SERGIO_EXIT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 999;
	condition = dia_sergio_exit_condition;
	information = dia_sergio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sergio_exit_condition()
{
	return TRUE;
};

func void dia_sergio_exit_info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Nech Innos osvìtluje tvou cestu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_WELCOME(C_INFO)
{
	npc = pal_299_sergio;
	nr = 5;
	condition = dia_sergio_welcome_condition;
	information = dia_sergio_welcome_info;
	important = TRUE;
};


func int dia_sergio_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,dia_sergio_isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_welcome_info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Innos tì doprovázej, co pro tebe mohu udìlat?
};


instance DIA_SERGIO_ISGAROTH(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_isgaroth_condition;
	information = dia_sergio_isgaroth_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_isgaroth_condition()
{
	if(Npc_KnowsInfo(hero,pc_prayshrine_paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_sergio_isgaroth_info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Modlil ses za mé bratry. Rád bych ti za to podìkoval. Øekni mi, co pro tebe mohu udìlat.
	Info_ClearChoices(dia_sergio_isgaroth);
	Info_AddChoice(dia_sergio_isgaroth,"Co takhle malý penìžní dar?",dia_sergio_isgaroth_spende);
	Info_AddChoice(dia_sergio_isgaroth,"Podìl se se mnou o své váleènické zkušenosti.",dia_sergio_isgaroth_xp);
};

func void dia_sergio_isgaroth_spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Co takhle malý penìžní dar?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Snad ti budou tyhle zlaáky k užitku.
	b_giveinvitems(self,other,itmi_gold,100);
	Info_ClearChoices(dia_sergio_isgaroth);
};

func void dia_sergio_isgaroth_xp()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Podìl se se mnou o své váleènické zkušenosti.
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Když bojuješ, dávej si pozor, aby ti nikdo nemohl vpadnout do zad.
	other.hitchance[NPC_TALENT_2H] = other.hitchance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_sergio_isgaroth);
};


instance DIA_SERGIO_AUFGABE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_aufgabe_condition;
	information = dia_sergio_aufgabe_info;
	description = "Potøebuji se dostat do knihovny.";
};


func int dia_sergio_aufgabe_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_sergio_isgaroth))
	{
		return TRUE;
	};
};

func void dia_sergio_aufgabe_info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Potøebuji se dostat do knihovny.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//No, tam tì bohužel nemohu pustit. Nejprve musíš splnit své úkoly.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Ale mohu ti pomoci. Jdi za mistrem Isgarothem a promluv si s ním. Slyšel jsem, že potøebuje nìjakou pomoc. Šel bych sám - ale pøenechám to tobì.
	SERGIO_SENDS = TRUE;
	Wld_InsertNpc(blackwolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(TOPIC_ISGAROTHWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ISGAROTHWOLF,LOG_RUNNING);
	b_logentry(TOPIC_ISGAROTHWOLF,"Mistr Isgaroth potøebuje pomoci ve svatyni. Mìl bych se po nìm podívat.");
};


instance DIA_SERGIO_WHAT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_what_condition;
	information = dia_sergio_what_info;
	description = "Co tady dìláš?";
};


func int dia_sergio_what_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_sergio_what_info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Modlím se k Innosovi, aby posílil mé paže a vùli.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Tak budu moci èelit všem nebezpeèím a znièím každého jeho nepøítele k jeho vìtší slávì.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//Jaké nepøítele?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//Všechny, kteøí se protiví Innosovì vùli. A už to jsou lidé nebo pøíšery.
};


instance DIA_SERGIO_BABO(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_babo_condition;
	information = dia_sergio_babo_info;
	description = "Nemohl by sis projít nìkolik lekcí s Babem?";
};


func int dia_sergio_babo_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_anliegen))
	{
		return TRUE;
	};
};

func void dia_sergio_babo_info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Nemohl by sis projít nìkolik lekcí s Babem?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//Proè mì nepožádá sám?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Myslím, že se stydí.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Aha. Dobrá, pokud to pro nìj tolik znamená, budu ho cvièit dvì hodiny každé ráno. Zaèínáme v pìt hodin. Vyøiï mu to.
	Npc_ExchangeRoutine(self,"TRAIN");
	b_startotherroutine(babo,"TRAIN");
	b_logentry(TOPIC_BABOTRAIN,"Sergio souhlasil, že od nynìjška bude s Babem každé ráno dvì hodiny trénovat.");
};


instance DIA_SERGIO_WHY(C_INFO)
{
	npc = pal_299_sergio;
	nr = 4;
	condition = dia_sergio_why_condition;
	information = dia_sergio_why_info;
	description = "Proè nejsi s ostatními paladiny?";
};


func int dia_sergio_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_welcome) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_why_info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Proè nejsi s ostatními paladiny?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//Možná vypadá nezvykle, že jsem tady, aèkoliv i my paladinové sloužíme mágùm, protože to jsou oni, kdo vykonává Innosovu vùli.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//My paladinové jsme váleèníci ve jménì Innosovì. Jeho vùle je náš zákon. Momentálnì èekám na další rozkazy od mágù.
};


instance DIA_SERGIO_ORDERS(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_orders_condition;
	information = dia_sergio_orders_info;
	permanent = TRUE;
	description = "Máš nìjaké nové rozkazy?";
};


func int dia_sergio_orders_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_why) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_orders_info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//Máš nìjaké nové rozkazy?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Zatím mám èas hledat sílu v modlitbách.
};


instance DIA_SERGIO_START(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_start_condition;
	information = dia_sergio_start_info;
	permanent = FALSE;
	description = "Máš mì doprovodit do prùsmyku.";
};


func int dia_sergio_start_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (SERGIO_FOLLOW == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_start_info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//Máš mì doprovodit do prùsmyku.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Dobrá, udìlám to. Cestu znám, takže pojï se mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_SERGIO_GUIDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_guide_condition;
	information = dia_sergio_guide_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_sergio_guide_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_guide_info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Doprovodím tì do prùsmyku. Ale ta nejnebezpeènìjší èást cesty zaèíná až tam.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//Ale neplýtvejme èasem.
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_ENDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_ende_condition;
	information = dia_sergio_ende_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_ende_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_ende_info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Jsme tady. A už tì èeká v Hornickém údolí cokoliv, doufám, že se dostaneš zpátky.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Neboj se - vrátím se.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Innos tì doprovázej. A tì vždy ochraòuje.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_SERGIO_PERM(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_perm_condition;
	information = dia_sergio_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_perm_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//U Innose, bratøe. Pokud jsi pøišel dozvìdìt se nìco o požehnání meèe, zeptej se Marduka.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//Slyšel jsem o tobì. Jsi ten chlapík z farem, který byl v Hornickém údolí. Máš moje uznání.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_PICKPOCKET(C_INFO)
{
	npc = pal_299_sergio;
	nr = 900;
	condition = dia_sergio_pickpocket_condition;
	information = dia_sergio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sergio_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_sergio_pickpocket_info()
{
	Info_ClearChoices(dia_sergio_pickpocket);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_BACK,dia_sergio_pickpocket_back);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_PICKPOCKET,dia_sergio_pickpocket_doit);
};

func void dia_sergio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sergio_pickpocket);
};

func void dia_sergio_pickpocket_back()
{
	Info_ClearChoices(dia_sergio_pickpocket);
};

