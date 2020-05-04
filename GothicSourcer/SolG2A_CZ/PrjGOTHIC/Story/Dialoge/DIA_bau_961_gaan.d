
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_ADDON_GAAN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 1;
	condition = dia_addon_gaan_meetingisrunning_condition;
	information = dia_addon_gaan_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_gaan_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_gaan_meetingisrunning_one_time;

func void dia_addon_gaan_meetingisrunning_info()
{
	if(DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Nováèek. Vítej v 'Kruhu Vody'.
		DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras se po tobì ptal, mìl bys ho navštívit.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "Tady nahoøe je docela hezky.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//Tady nahoøe je docela hezky.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//Je to tu docela pìkné. Ale jakmile projdeš tím prùsmykem támhle, pøestaneš si to myslet.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Jestli na tebe tenhle kus zemì udìlal dojem, tak poèkej, co pak uvidíš v Hornickém údolí.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Kdo jsi?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Jmenuju se Gaan. Jsem lovec a pracuju pro Bengara. Farmaøí tady na náhorních pastvinách.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Trávím tady venku vìtšinu svého èasu a vyhøívám se na slunci.
};


instance DIA_ADDON_GAAN_RANGER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_ranger_condition;
	information = dia_addon_gaan_ranger_info;
	description = "Proè ten vážný oblièej?";
};


func int dia_addon_gaan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (SCISWEARINGRANGERRING == TRUE) && (RANGERMEETINGRUNNING == 0))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Proè ten vážný oblièej?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Nosíš náš akvamarínový prsten.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Patøíš ke 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Skvìle. Rád vidím nováèky v našem spolku.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GAAN_AUFGABEBEIMRING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_aufgabebeimring_condition;
	information = dia_addon_gaan_aufgabebeimring_info;
	description = "Jakou máš funci v 'Kruhu vody'?";
};


func int dia_addon_gaan_aufgabebeimring_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_gaan_ranger) || (RANGERMEETINGRUNNING != 0)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_aufgabebeimring_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//Jakou máš funci v 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Hlídal jsem vchod do prùsmyku a kontroloval, kdo jde dovnitø a kdo leze ven.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Ale nìjací paladinové se sem nastìhovali, že si to prej ohlídaj a od tý doby se tam pohybuje míò lidí.
};


instance DIA_ADDON_GAAN_MISSINGPEOPLE(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_missingpeople_condition;
	information = dia_addon_gaan_missingpeople_info;
	description = "Slyšel jsi nìco o hledyných lidech?";
};


func int dia_addon_gaan_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_gaan_aufgabebeimring) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Slyšel jsi nìco o hledyných lidech?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Jistì. Každý dìlá všechno pro to, aby je nemusel navštívit.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Ale já jsem v klidu, nevidìl jsem tu nic podezøelého.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "Co bych mìl vìdìt o Hornickém údolí?";
};


func int dia_gaan_wald_condition()
{
	return TRUE;
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Co bych mìl vìdìt o Hornickém údolí?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Tak to nevím. Byl jsem tam jen na skok. Vypadá to tam pìknì nebezpeènì.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Nejlepší vìc, jakou mùžeš udìlat, je držet se po vstupu do prùsmyku vyšlapané stezky.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Buï mùžeš jít velkou strží, nebo po cestì pøes most. Je to kratší a bezpeènìjší.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Teï, když se to všude hemží skøety, musíš být hodnì opatrný.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Nerad bych tì táhnul k bylinkáøce.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "Bylinkáøce?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Bylinkáøce?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Jmenuje se Sagitta. Léèí farmáøe a ostatní lidi, co žijí mimo mìsto.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Vážnì podivná ženština.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Nikdo za ní ve skuteènosti nechce chodit a všichni o ní rozšiøují rùzné fámy.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Ale když je ti zle, nenajdeš nic lepšího než Sagittu a její kuchyò plnou léèivých bylin.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Najdeš ji v tom pruhu lesa za Sekobovou farmou.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "Jak ta nebezpeèná bestie vypadá?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//Jak ta nebezpeèná bestie vypadá?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Poøádnì nevím. Až doteï jsem jen slyšel vrèení a škrábání. Ale dokážu si pøedstavit, co ty zvuky vydávalo.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Pøed tím nejsou v bezpeèí ani vlci. Ta bestie už je do jednoho vyvraždila.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "Kolik mi dáš, když tu bestii zabiju?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Kolik mi dáš, když tu bestii zabiju?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Nìkomu, kdo to zabije, bych dal všechno, co mùžu postrádat.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Kde ta zatracená bestie žije?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Kde ta zatracená bestie žije?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Nìkde mimo les. Možná sem chodí z Hornického údolí. Ale nejsem si tím jistý.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Nikdy jsem v Hornickém údolí nebyl.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if((Npc_IsDead(gaans_snapper) == TRUE) && (RANGERMEETINGRUNNING != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//To odporné zvíøe je mrtvé.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Tak to zase mùžu bez obav zaèít lovit.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Tady jsou peníze, co jsem ti slíbil.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "Mùžeš mì nauèit nìco o lovu?";
};


func int dia_gaan_askteacher_condition()
{
	return TRUE;
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Mùžeš mì nauèit nìco o lovu?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Žádný problém. Za 100 zlatých ti ukážu, jak vyvrhnout zvíøata, co jsi skolil.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Kožešiny a ostatní trofeje ti na trhu vydìlají spoustu penìz.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Gaan nauèí, jak získat trofeje ze zvíøat.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Tady. 100 zlatých za tvùj výklad o vyvrhování zvíøat.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Tady. 100 zlatých za tvùj výklad o vyvrhování zvíøat.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//Díky. Tak se mi to líbí.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Pøijï pozdìji, až budeš mít nìjaké peníze.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "Co mì mùžeš nauèit?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Co mì mùžeš nauèit?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//To záleží na tom, co chceš vìdìt.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Vyjmutí zubù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Vyjmutí drápù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Stažení z kùže",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Žihadla krvavých much",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Køídla krvavých much",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Roh draèího chòapavce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Teï už tì nemùžu nauèit nic, co bys ještì neznal. Promiò.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Zvíøata o své drápy pøicházejí opravdu nerada. Øez musíš vést velmi pøesnì.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Tvé ruce by se mìly lehce pøekrývat. Pak silným trhnutím dráp oddìl od okolní tkánì.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Obchodníci se mohou vždycky pøetrhnout, aby za drápy vysolili pìknou sumièku.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Nejsnadnìji se z mrtvých zvíøat získávají zuby. Øez musíš v jejich tlamì vést tìsnì kolem nich.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Pak je silným trhnutím oddìlíš od lebky.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Nejlepší zpùsob, jak získat kožešinu, je vést hluboký øez podél konèetin.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//Pak už je hraèka stáhnout kùži od hlavy k ocasu.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//Tyhle mouchy mají na høbetì mìkké místo.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Když na nìj zatlaèíš, vytlaèí se žihadlo daleko ze zadeèku a pak ho staèí oddìlit nožem.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Nejlepší zpùsob, jak oddìlit køídla od tìla, je odøíznout je ostrým nožem tìsnì nad hrudí.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Musíš si dávat velký pozor, abys nepoškodil velmi jemnou tkáò køídel. Pokud budeš pøi jejich oddìlování neopatrný, získáš akorát bezcennou hromadu smetí.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Teï, když je ten pøerostlý chòapavec mrtvý, ti mùžu ukázat, jak získat jeho roh.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//Zanoøíš nùž hluboko do èela a opatrnì tu vìc vypáèíš nahoru.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//Pokud to nepùjde oddìlit od lebky, použij ještì další nùž z druhé strany.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "Jak jde lov?";
};


func int dia_gaan_jagd_condition()
{
	return TRUE;
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Jak jde lov?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if(Npc_IsDead(gaans_snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Poslední zvíøe, co se mi podaøilo zabít, byla velká krysa. Nic extra a navíc z toho nic nekápne.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Posledních nìkolik dní se tu potuluje nìjaká ufunìná bestie.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Nejen, že zabíjí všechno, co se hýbe, ale taky mi kazí moji práci.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"Lovce Gaana trápí nìjaká podivná nestvùra. Dokud ji nezabiju, nebude moci dál lovit.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Zaèíná tu být pìkný blázinec. Z prùsmyku už se sem mezitím stihla nahrnout spousta tìch funících zvíøat.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Za tìchto okolností je lov èím dál tím obtížnìjší.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Nemùžu si stìžovat.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

