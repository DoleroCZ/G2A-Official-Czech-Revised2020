
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(smutnì) Co chceš?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "Nemám èas, musím rozdìlovat klobásy.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Nemám èas, musím rozdìlovat klobásy.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Díky. Doufám, e to není poslední klobása, kterou jsem tu dostal.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Porušil jsem zákony tohoto spoleèenství.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Teï èekám na rozhodnutí Nejvyšší rady, jestli budu moci zùstat v klášteøe.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "Øekni mi, co se stalo.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Øekni mi, co se stalo.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Kdy jsem zametal, vzal jsem knihu z komnat mágù, abych si ji mohl pozdìji pøeèíst.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistr Hyglas si toho samozøejmì okamitì všiml a na tu knihu se mì zeptal.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Ze strachu pøed trestem jsem zalhal - ale pozdìji mì nachytal s tou knihou v mé cele.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Strašnì se rozzlobil a øekl o tom Nejvyšší radì. Teï probírají, jestli mohu zùstat.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Je nìco, jak bych ti mohl pomoci?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Je nìco, jak bych ti mohl pomoci?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Ne, odevzdal jsem se na milost Innosovi a mágùm.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hele, vánì jsi poadoval Zkoušku ohnì?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Ano. A mám v úmyslu ji sloit.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobrá - moná bych ti s tím mohl pomoci. Mùu ti dát velice uiteènı kouzelnı svitek. Kouzlo SPÁNKU. Máš zájem?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Ne, nepotøebuji tvou pomoc.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Co za to chceš?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"K èemu mi bude?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//K èemu mi bude?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//S pomocí tohohle kouzla mùeš kohokoliv na chvíli uvrhnout do magického spánku. Ovšem jenom v pøípadì, e je jeho vùle slabší ne tvoje.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To by se mohlo hodit, pokud budeš nìkoho potøebovat odklidit z cesty.
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A jak zjistím, jestli má ten dotyènı slabší vùli ne já?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Ani se to nenamáhej zkoušet na mágy. Ale vìtšinu novicù bys tak mìl uspat.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Ne, nepotøebuji tvou pomoc.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Pokud bys náhodou zmìnil názor, mùeš za mnou kdykoliv pøijít.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Kadı mág, kterı u zkoušky uspìje, mùe mít jedno pøání.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Pokud se ti opravdu podaøí projít Zkouškou ohnì, moná bys mohl zaøídit, abych zùstal tady v klášteøe.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Ne, nepotøebuji tvou pomoc.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Dobrá, dej mi ten kouzelnı svitek.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobrá, dej mi ten kouzelnı svitek.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Pøeji ti hodnì štìstí u zkoušky. A je ti Innos nápomocen.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Dyrian mi vìnoval svitek s uspávacím kouzlem. Na oplátku se mám - a budu mágem - postarat, aby ho v klášteøe nechali i nadále.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "Zmìnil jsem názor. Dej mi to uspávací kouzlo.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Zmìnil jsem názor. Dej mi to uspávací kouzlo.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobrá, ale kdy zkouškou projdeš, zaøídíš, abych mohl zùstat v klášteøe.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(radostnì) Díky, zachránils mì!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(ustrašenì) Ach, promiò, mistøe. Nechtìl jsem se vtírat.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(zdvoøile) Dìkuji ti, e mohu zùstat zde v klášteøe. Od této chvíle se celı mùj ivot zmìní.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak se vede?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobøe. Mám zdejší práci opravdu rád, mistøe.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Dìkuji Innosovi, e mohu bıt zde v klášteøe.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Na co se mì to ptáš? Vkládal jsem do tebe veškeré své nadìje a tys mì nechal na holièkách.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Teï u nemám nic ne pití. A je to tvoje chyba!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Tady máš 5 zlaákù.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"Mùu všechno vysvìtlit.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Podívej, co øíkáš.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Na, tady máš 5 zlatıch.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(nervóznì) 5 zlatıch? Dáváš mi 5 zlatıch a chceš se tak revanšovat za to, es mi znièil ivot?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Vezmu si všechno tvoje zlato!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Mùu všechno vysvìtlit.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Nech si svoje laciné vımluvy.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//Leš pokadé, kdy otevøeš ústa. Nech mì bıt.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Podívej, co øíkáš.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Jo, jen do toho, jen mì zastrašuj. To ti nijak nepomùe.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Øeknu celému svìtu, co jsi za pokryteckou svini! Hned jak dopiju tuhle flašku...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//Bì mi z oèí, je mi z tebe nanic!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Aaa, nech mì na pokoji! U s tebou nechci mít nic spoleèného!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

