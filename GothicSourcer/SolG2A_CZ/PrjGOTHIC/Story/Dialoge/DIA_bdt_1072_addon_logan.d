
instance DIA_ADDON_LOGAN_EXIT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 999;
	condition = dia_addon_logan_exit_condition;
	information = dia_addon_logan_exit_info;
	permanent = TRUE;
	description = "Vrátím se pozdìji ...";
};


func int dia_addon_logan_exit_condition()
{
	return TRUE;
};

func void dia_addon_logan_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Vrátím se pozdìji ...
	if(((!MIS_HLPLOGAN == LOG_RUNNING) || (!MIS_HLPLOGAN == LOG_SUCCESS)) && (LOGAN_INSIDE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(bruèí) Jasnì, uteè. Já tu budu stát a zastavím všechno a všechny, kteøí se opováží pøiblížit.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LOGAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 900;
	condition = dia_addon_logan_pickpocket_condition;
	information = dia_addon_logan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_logan_pickpocket_condition()
{
	return c_beklauen(59,50);
};

func void dia_addon_logan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_BACK,dia_addon_logan_pickpocket_back);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_PICKPOCKET,dia_addon_logan_pickpocket_doit);
};

func void dia_addon_logan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_logan_pickpocket);
};

func void dia_addon_logan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
};


instance DIA_ADDON_BDT_1072_LOGAN_MINE(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_mine_condition;
	information = dia_addon_logan_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_logan_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Zvládl jsi to, co? Dobøe, je fajn, že mi tady pomáháš.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LOGAN_HOW2(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_how2_condition;
	information = dia_addon_logan_how2_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_logan_how2_condition()
{
	if((LOGAN_INSIDE == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_how2_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Celkem dobøe, aspoò že jsem tady. Lucie dìlá fakt drsnou koøalku.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Ale Esteban mì nechce pustit do dolu. Aspoò ne teï. Dostal jsem totiž jiný úkol.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//Takže? Co chce abys udìlal?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//Nìkdo se pokusil Estebana zavraždit. A on by rád vìdìl, kdo za tím stojí.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(šeptá) Esteban vìøí, že Snaf je do toho zapletený. Mám na nìho dávat pozor ...
};


instance DIA_ADDON_LOGAN_ATTENTAT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_attentat_condition;
	information = dia_addon_logan_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_logan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && (LOGAN_INSIDE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Takže, ty hledáš chlápky, kteøí jsou za to zodpovìdní?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//No, já o tom nic nevím. Mìl bych? Když se to stalo, tak já jsem sedìl celou dobu v bažinì.
};


instance DIA_ADDON_LOGAN_HI(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_hi_condition;
	information = dia_addon_logan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_hi_condition()
{
	if((LOGAN_INSIDE == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_logan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Hele, jestli to není nová tváø.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Plánuješ tady stát celou dobu, nebo mi pùjdeš pomoct?
	if(Npc_KnowsInfo(other,dia_addon_franco_hi))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franco se zmínil. Myslí si, že by se ti hodila nìjaká pomoc. Tak co?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Záleží na tom, jakou pøesnì potøebuješ pomoc?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Moèáloví žraloci jsou na mùj vkus pøíliš blízko. Mìli bychom jich pár zabít.
	Log_CreateTopic(TOPIC_ADDON_LOGAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LOGAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LOGAN,"Logan chce, abych s ním šel lovit moèálové žraloky.");
};


instance DIA_ADDON_LOGAN_WHY(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_why_condition;
	information = dia_addon_logan_why_info;
	permanent = FALSE;
	description = "A co za to dostanu?";
};


func int dia_addon_logan_why_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_why_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostanu?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(bruèí) Franco tì tu nechá shnít, jestli nebudš užiteèný.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chceš do tábora? No, napøed tu musíš trochu pomoct. Samotná slova ti nepomùžou dosáhnout tvého cíle.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Takže, mohl bych ti ukázat, jak zpracovat tyhle monstra.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Ale ve skuteènosti si nemyslím, že by tì Franco pustil jenom proto, že jsme tu zabili pár moèálových žralokù.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Tady venku jsou lidé, kteøí èekají daleko déle.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//A lepší bude, pøipojit se také k táboru ... (bruèí)
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Logan mì mùže nauèit, jak získat ze zabitých zvíøat kùži, drápy a zuby.");
};


instance DIA_ADDON_LOGAN_LAGER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_lager_condition;
	information = dia_addon_logan_lager_info;
	permanent = FALSE;
	description = "Co je pøesnì v táboøe?";
};


func int dia_addon_logan_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Co je pøesnì v táboøe?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(bruèí) Otázka spíš je, co NENÍ v táboøe. Žádní moèáloví žraloci, žádnì pitomá bažinatá díra ... zkrátka, ŽÁDNÁ bažina, chápeš.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Nejenom že tam mají chlast a zlato, ale pokud si dobøe pamatuju, tak jsou tam i ženy, už rozumíš?
};


instance DIA_ADDON_LOGAN_MIS(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 99;
	condition = dia_addon_logan_mis_condition;
	information = dia_addon_logan_mis_info;
	permanent = FALSE;
	description = "Pojïme zabít pár moèálových žralokù.";
};


func int dia_addon_logan_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Pojïme zabít pár moèálových žralokù.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(bruèí) Vypadá to, že jsi pochopil, jak to tady chodí. To se mi líbí. Do prdele ... slyšel jsi to? Slyším je!
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Máme to - a co budeme dìlat teï?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Pøicházejí. A jde jim o to, aby si z nás ukousli poøádný kousek. Takže, pojïme se mrknout kdo z koho. Na nì.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HLPLOGAN = LOG_RUNNING;
	Wld_InsertNpc(mis_addon_swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(mis_addon_swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(mis_addon_swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_ADDON_LOGAN_TOT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_tot_condition;
	information = dia_addon_logan_tot_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_tot_condition()
{
	if(Npc_IsDead(mis_addon_swampshark_01) && Npc_IsDead(mis_addon_swampshark_02) && Npc_IsDead(mis_addon_swampshark_03) && Npc_KnowsInfo(other,dia_addon_logan_mis))
	{
		return TRUE;
	};
};

func void dia_addon_logan_tot_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Mrtvý žralok, dobrý žralok. To by mìlo být varování pro ostatní.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Ok, ještì nìco? Jinak odejdu.
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Ještì ne. Víš, kde hledat jestli se budeš chtít nìco nauèit.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HLPLOGAN = LOG_SUCCESS;
	b_checklog();
	b_logentry(TOPIC_ADDON_FRANCO,"Pomohl jsem Loganovi. Je èas se jít mrknout, jestli je Franco spokojený.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_LOGAN_LERN(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 100;
	condition = dia_addon_logan_lern_condition;
	information = dia_addon_logan_lern_info;
	permanent = FALSE;
	description = "Ukaž mi, jak zpracovat zvíøata ...";
};


func int dia_addon_logan_lern_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lern_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Ukaž mi, jak zpracovat zvíøata ...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Jestli chceš vìdìt víc o krvavých mouchách, zeptej se spíš Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Jestli chceš vìdìt, jak zpracovat moèálové žraloky nebo ještìrky, tak by bylo dobré vìdìt, jak jim stáhnout kùži a odøíznout jim zuby. Tohle ti mùžu ukázat.
};


instance DIA_ADDON_LOGAN_ALLG(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_allg_condition;
	information = dia_addon_logan_allg_info;
	permanent = TRUE;
	description = "Chci se nauèit ...";
};


func int dia_addon_logan_allg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_logan_allg_info()
{
	Info_ClearChoices(dia_addon_logan_allg);
	Info_AddChoice(dia_addon_logan_allg,DIALOG_BACK,dia_addon_logan_allg_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Vytahování zubù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_logan_allg_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Odseknutí drápù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_addon_logan_allg_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Stáhnout kùži",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_addon_logan_allg_fur);
	};
};

func void dia_addon_logan_allg_back()
{
	Info_ClearChoices(dia_addon_logan_allg);
};

func void dia_addon_logan_allg_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void dia_addon_logan_allg_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void dia_addon_logan_allg_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};


var int logan_lohn;

instance DIA_ADDON_LOGAN_HACKER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_hacker_condition;
	information = dia_addon_logan_hacker_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_addon_logan_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_logan_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, musím ti podìkovat! Mám povolení ke vstupu do dolu!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Moc toho o kopání zlata nevím, ale nìjak ho dostanu.
	if(LOGAN_LOHN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Už umím základy. Zapøi se silnì nohama a bouchni tak silnì, jak jen mùžeš!
		b_upgrade_hero_hackchance(10);
		LOGAN_LOHN = TRUE;
	};
};

