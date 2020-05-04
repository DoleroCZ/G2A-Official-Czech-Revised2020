
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(Jeho portmonku by dokázalo štípnout i nemluvnì.)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,itse_goldpocket25,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "Co tady dìláš?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Stavím loï, protože se chci odsud dostat - co nejrychleji to pùjde.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Ale jak to tak vypadá, tu loï nikdy nedokonèím.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Proè tolik pospícháš?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Proè tolik pospícháš?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Co nevidìt dorazí skøeti a srovnají mìsto se zemí.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Proè si to myslíš?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Hochu, copak jsi nevidìl ty paladiny, co pobíhaj všude kolem? Proè si myslíš, ze jsou tady?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Øíkám ti, jsou tady, protože skøeti brzy zaútoèí. A nebude to nic hezkého.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Proè nemùžeš dokonèit loï?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Proè nemùžeš dokonèit loï?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(pohrdavì) Máme milión problémù. Trup ještì není dostateènì pevný a poøád nám ještì chybí spousta fošen.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Ale na nový materiál už nemám moc zlata, a poslední dodávka byla prolezlá èervotoèem.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moji chlapci nepracujou poøádnì. Jeden chce jen rychlou loï, a druhý se zajímá jen o její výzdobu!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jako kdybychom nemìli dùležitìjší vìci na práci!
	AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//No, jeden z mých dìlníkù nedávno zmizel. Obávámse,  že to mùže znamenat zpoždìní.
};


instance DIA_ADDON_GARVELL_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 5;
	condition = dia_addon_garvell_missingpeople_condition;
	information = dia_addon_garvell_missingpeople_info;
	description = "Jeden z tvých zamìstnancù zmizel?";
};


func int dia_addon_garvell_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_schiff) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garvell_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//Jeden z tvých zamìstnancù zmizel?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Správnì. Jmenuje se Monty. Slehla se po nìm zem.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//Vsadil bych se, že ta liná svinì sedí na nìjaké farmì a užívá si života. Nemìl jsem mu platit pøedem.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Garvell je znepokojen svým dìlníkem Montym. Ten se od jednoho dne neobjevil v práci. Prý si dobøe žije na jedné z farem.");
	Info_ClearChoices(dia_addon_garvell_missingpeople);
	Info_AddChoice(dia_addon_garvell_missingpeople,"Slyšel jsem, že zmizelo víc lidí.",dia_addon_garvell_missingpeople_more);
	if(SCKNOWSFARIMASWILLIAMSFRIEND == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"Kdy tu byl Monty naposled.",dia_addon_garvell_missingpeople_wo);
	};
};

func void dia_addon_garvell_missingpeople_more()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//Slyšel jsem, že už zmizelo víc lidí.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//Viš? Tím tenhle všechen zmatek zaèal.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Rybáø Farim se zmiòoval o nìèem takovém. Jeho kámoš William zjevnì zmizel.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//Vsadil bych se, že zatím vším jsou skøeti.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Vypadá to, že rybáø Farim ví nìco o užiteèného o svém pøíteli Williamovi.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_AddChoice(dia_addon_garvell_missingpeople,DIALOG_BACK,dia_addon_garvell_missingpeople_back);
	if(farim.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"Kde mùžu najít Farima?",dia_addon_garvell_missingpeople_farim);
	};
};

func void dia_addon_garvell_missingpeople_back()
{
	Info_ClearChoices(dia_addon_garvell_missingpeople);
};

func void dia_addon_garvell_missingpeople_farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Kde mùžu najít Farima?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//Je to rybáø. Myslím, že jeho chatrè je nìkde poblíž skladištì paladinù. Nejsem si jist.
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Farim's cottage is near the paladins' store yard.");
};

func void dia_addon_garvell_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//Kdy tu byl Monty naposled?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(naštvanì) Nepøišel do práce už dva dny.
};


instance DIA_GARVELL_RETURNMONTY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_returnmonty_condition;
	information = dia_garvell_returnmonty_info;
	description = "A jak to jde teï?";
};


func int dia_garvell_returnmonty_condition()
{
	if((Npc_GetDistToWP(monty_nw,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_returnmonty_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//A jak to jde teï?
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Monty je zpátky! Zrovna se dívá na plány.
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Možná nakonec tu loï pøece jen dokonèíme.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "Mùžu ti nìjak pomoct?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Mùžu ti nìjak pomoct?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//To mùžeš. Zjisti, co mají paladinové za lubem. Zajímalo by mì, proè jsou tady.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//A taky bych mìl vìdìt, jestli se skøeti chystají zaútoèit - a jak daleko od mìsta jsou.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jednoho z tìch bastardù vidìli hned za mìstem.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Prostì mi dones tolik informací, kolik se ti podaøí získat.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Potøebuju vìdìt, kolik èasu mám na dokonèení lodi.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Garvell by rád získal nìjaké informace o skøetech a také by ho zajímalo, proè se ve mìstì usadili paladinové.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dobøe. Jestli zjistíš nìco dalšího, dej mi vìdìt.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Díky za informace. Takhle to vypadá, že na postavení lodi máme celou vìènost.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "Mám nìjaké informace o skøetech.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//Mám nìjaké informace o skøetech.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Tak povídej.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Zasekli se v Hornickém údolí a vypadá to, že tam chtìjí zùstat.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Aby nás udrželi v bezpeèí, hlídají paladinové prùsmyk do údolí.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "Vím, proè tu paladinové jsou.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Vím, proè tu paladinové jsou.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Vážnì? Øekni mi to!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladinové jsou tu, aby získali magickou rudu z Hornického údolí, ne proto, že by oèekávali skøetí útok na mìsto.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Jakmile dostanou rudu, vrátí se na pevninu.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "A ten skøet za mìstem...";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//A ten skøet za mìstem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Anooo...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Nedìlej si s ním starosti. Mìstská stráž to s ním vyøídí.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "Jak to jde v pøístavu?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Jak to jde v pøístavu?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Skøeti nám jdou po krku a ty se ptáš na pøístav?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Jen jsem chtìl...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Náš nejvìtší problém je v tom, že nemáme dost lodí, abychom se odsud mohli dostat.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Vlastnì je tu jen jedna loï, a ta patøí paladinùm. Urèitì ji tu nemají proto, aby nás na ní odsud dostali.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Jen se podívej sám, nic se tu nedìje.
	};
};

