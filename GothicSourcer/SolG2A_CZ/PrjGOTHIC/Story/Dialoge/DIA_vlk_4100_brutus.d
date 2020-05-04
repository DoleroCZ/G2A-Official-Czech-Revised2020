
instance DIA_BRUTUS_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_exit_condition;
	information = dia_brutus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brutus_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_AFTER_FIGHT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 1;
	condition = dia_brutus_after_fight_condition;
	information = dia_brutus_after_fight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_brutus_after_fight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && Npc_IsInState(self,zs_talk) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_after_fight_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//Tak co, máš ještì poøád všechny zuby?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Chlape, ty jsi pìkný poøízek! Nechtìl bych se s tebou utkat, to teda ne.
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Myslím, že bys mi zlomil všechny žebra, ne-li nìco horšího.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//A já tì taky nemlátil plnou silou. No nevadí, mám rád chlapy, které nìjaká ta rána hned tak nesklátí.
		if(BRUTUS_EINMALIG == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Tenhle lektvar tì zase postaví na nohy a s útrobami dìlá hotové zázraky!
			CreateInvItems(self,itpo_health_01,1);
			b_giveinvitems(self,hero,itpo_health_01,1);
			BRUTUS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Nemám nic proti dobrému boji, ale když se zaènu bít, tak taky vím, kdy skonèit.
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_BRUTUS_PRISONER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_prisoner_condition;
	information = dia_brutus_prisoner_info;
	description = "Co tu máš na práci?";
};


func int dia_brutus_prisoner_condition()
{
	if((KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_prisoner_info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Co tu máš na práci?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Co mám na práci? Cvièím tyhle hošany. Uèím je, jak získat ocelové svaly.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Taky se starám o vìznì, jsem pro ty bastardy nìco jako zatracenì pøísný otec!
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Ale opravdové umìní je pøimìt je k hovoru. A vìø mi - já rozvážu jazyk úplnì každému.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//To zní dìsivì hezky.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Ale ti zablešení zabednìnci, které jsme teï zabásli, nám toho moc neøeknou - ani nemají co.
	if(MIS_RESCUEGORN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//A tak se nebudu moci vypoøádat s tím Gornem.
		KNOWSABOUTGORN = TRUE;
	};
};


instance DIA_BRUTUS_PERM(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 90;
	condition = dia_brutus_perm_condition;
	information = dia_brutus_perm_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_brutus_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//Nìco nového?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//Všecko vypadá klidnì. Žádní noví vìzni - nikomu nemùžu pomáhat hledat správná slova - je to prostì zlé.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KASSE(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_kasse_condition;
	information = dia_brutus_kasse_info;
	permanent = FALSE;
	description = "Mohl bys mì cvièit?";
};


func int dia_brutus_kasse_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_kasse_info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Mohl bys mì cvièit?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Jasnì - mùžu ti pomoci zvýšit sílu, ale zadarmo ani kuøe nehrabe.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Kolik chceš?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmm, tys pobíhal kolem toho hradu, že jo? Tak ti navrhnu tohle.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//Mùj asistent Den se pøi posledním útoku úplnì vypaøil - prostì nevydržel.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Ale neodešel s prázdnou. Odnesl si i obsah naší pokladnice.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Jaké pokladnice?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//V téhle truhlici jsme schovávali zboží, které jsme èasem, ehm, vybrali.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//Byla to pìknì zaokrouhlená sumièka - 200 zlaákù, a to nepoèítám ještì vzácné klenoty.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Jestli mi vrátíš to zlato, budeš si moci nechat ty klenoty a ještì k tomu tì budu cvièit.
	Log_CreateTopic(TOPICBRUTUSKASSE,LOG_MISSION);
	Log_SetTopicStatus(TOPICBRUTUSKASSE,LOG_RUNNING);
	b_logentry(TOPICBRUTUSKASSE,"Brutùv partner Den se ztratil i s 200 zlaákù a nìjakými klenoty. Když Brutovi pøinesu aspoò ty dvì stovky, pomùže mi zvýšit sílu.");
};


instance DIA_BRUTUS_DEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_den_condition;
	information = dia_brutus_den_info;
	permanent = FALSE;
	description = "Nevíš, kam Den míøil?";
};


func int dia_brutus_den_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_den_info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Nevíš, kam Den míøil?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Nejspíš co nejdál odsud. Možná se pokusil projít prùsmykem.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//Díky, fakt jsi mi moc pomohl.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//No co mùžu øíct? Nemám ani potuchy, kam mohl jít.
	b_logentry(TOPICBRUTUSKASSE,"Den se snažil projít prùsmykem.");
};


instance DIA_BRUTUS_GOLD(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_gold_condition;
	information = dia_brutus_gold_info;
	permanent = TRUE;
	description = "Nìco tu pro tebe mám (pøedat 200 zlaákù).";
};


func int dia_brutus_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (BRUTUS_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_gold_info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//Nìco tu pro tebe mám.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//Výbornì. Nyní tì mùžu vycvièit, jestli tedy chceš.
		BRUTUS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"S pomocí Bruta se mohu stát silnìjším.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Poslyš, prostì mi pøines 200 zlaákù. Nezajímá mì, kde si je opatøíš - zlaák jako zlaák.
	};
};


instance DIA_BRUTUS_TEACH(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 7;
	condition = dia_brutus_teach_condition;
	information = dia_brutus_teach_info;
	permanent = TRUE;
	description = "Chtìl bych se stát silnìjším.";
};


func int dia_brutus_teach_condition()
{
	if((BRUTUS_TEACHSTR == TRUE) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_teach_info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Chtìl bych se stát silnìjším.
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_back()
{
	Info_ClearChoices(dia_brutus_teach);
};

func void dia_brutus_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};


instance DIA_BRUTUS_KAP3_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap3_exit_condition;
	information = dia_brutus_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brutus_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_DUSCHONWIEDER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 30;
	condition = dia_brutus_duschonwieder_condition;
	information = dia_brutus_duschonwieder_info;
	permanent = TRUE;
	description = "Muèil jsi dneska nìkoho?";
};


func int dia_brutus_duschonwieder_condition()
{
	if((KAPITEL == 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_duschonwieder_info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Muèil jsi dneska nìkoho?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Copak nevidíš, že mám práci? Vra se pozdìji.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KAP4_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap4_exit_condition;
	information = dia_brutus_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brutus_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_WARUMNICHTARBBEIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 40;
	condition = dia_brutus_warumnichtarbbeit_condition;
	information = dia_brutus_warumnichtarbbeit_info;
	description = "Jak to, že nejsi v práci?";
};


func int dia_brutus_warumnichtarbbeit_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_warumnichtarbbeit_info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Jak to, že nejsi v práci?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(úzkostnì) To je ale nechutné!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Vidìls, jak to u mì vypadá? Ty hnusný žravý štìnice jsou úplnì všude!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Nemám ani šajna, kdo tam co dìlal, ale já se tam urèitì nevrátím, dokud tam bude ten hnusný hmyz.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//Já ty potvory prostì nesnáším. A pøestaò se tak blbì køenit.
	Log_CreateTopic(TOPIC_BRUTUSMEATBUGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRUTUSMEATBUGS,LOG_RUNNING);
	b_logentry(TOPIC_BRUTUSMEATBUGS,"Hradní muèitel Brutus se mi svìøil, že mu neškodné žravé štìnice v muèírnì nahánìjí husí kùži. Je to prostì drsòák každým coulem.");
};


instance DIA_BRUTUS_MEATBUGSWEG(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 31;
	condition = dia_brutus_meatbugsweg_condition;
	information = dia_brutus_meatbugsweg_info;
	description = "Už je po štìnicích. Mùžeš se vrátit a leštit všechny ty paleènice a ostatní muèící nástroje.";
};


func int dia_brutus_meatbugsweg_condition()
{
	if(Npc_KnowsInfo(other,dia_brutus_warumnichtarbbeit) && Npc_IsDead(meatbug_brutus1) && Npc_IsDead(meatbug_brutus2) && Npc_IsDead(meatbug_brutus3) && Npc_IsDead(meatbug_brutus4) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_meatbugsweg_info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//Už je po štìnicích. Mùžeš se vrátit a leštit všechny ty paleènice a ostatní muèící nástroje.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//Víš opravdu jistì, že tam ani jedna z tìch potvor nezbyla?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Naprosto jistì.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//No tak tedy dobøe. Tumáš, za odmìnu si vezmi tohle zlato.
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//Uá, jenom mì tu nerozbreè.
	TOPIC_END_BRUTUSMEATBUGS = TRUE;
	b_giveplayerxp(XP_BRUTUSMEATBUGS);
	b_npcclearobsessionbydmt(self);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRUTUS_PERM4(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 32;
	condition = dia_brutus_perm4_condition;
	information = dia_brutus_perm4_info;
	permanent = TRUE;
	description = "Jsi v poøádku?";
};


func int dia_brutus_perm4_condition()
{
	if((Npc_KnowsInfo(other,dia_brutus_meatbugsweg) || (MIS_OCGATEOPEN == TRUE)) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm4_info()
{
	if((MIS_OCGATEOPEN == TRUE) || ((hero.guild == GIL_KDF) && (KAPITEL >= 5)))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Jsi v poøádku?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(znepokojenì) A víš urèitì, že už tam žádné žravé štìnice nejsou?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ehm, podívej, jednu máš pøímo za sebou!
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(jeèí) Cože?
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_BESSEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 55;
	condition = dia_brutus_bessen_condition;
	information = dia_brutus_bessen_info;
	permanent = TRUE;
	description = "Ty jsi posedlý!";
};


func int dia_brutus_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_BRUTUS == TRUE) && (NPCOBSESSEDBYDMT == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_bessen_info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Ty jsi posedlý!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//Bìž do kláštera, a tì tam vyléèí.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Mnì už není pomoci, bìž pryè!
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//Nìkdo ti musí z hlavy vypudit ty démony.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(køièí) NE!
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_KAP5_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap5_exit_condition;
	information = dia_brutus_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap5_exit_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_brutus_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_PICKPOCKET(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 900;
	condition = dia_brutus_pickpocket_condition;
	information = dia_brutus_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brutus_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_brutus_pickpocket_info()
{
	Info_ClearChoices(dia_brutus_pickpocket);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_BACK,dia_brutus_pickpocket_back);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_PICKPOCKET,dia_brutus_pickpocket_doit);
};

func void dia_brutus_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brutus_pickpocket);
};

func void dia_brutus_pickpocket_back()
{
	Info_ClearChoices(dia_brutus_pickpocket);
};

