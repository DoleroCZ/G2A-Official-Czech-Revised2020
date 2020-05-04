
instance DIA_BALTHASAR_EXIT(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 999;
	condition = dia_balthasar_exit_condition;
	information = dia_balthasar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_balthasar_exit_condition()
{
	return TRUE;
};

func void dia_balthasar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTHASAR_HALLO(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 3;
	condition = dia_balthasar_hallo_condition;
	information = dia_balthasar_hallo_info;
	description = "Jak se vede?";
};


func int dia_balthasar_hallo_condition()
{
	return TRUE;
};

func void dia_balthasar_hallo_info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ach, nová tváø na farmì. Že by mi nakonec ta stará držgrešle pøece jen sehnala uèedníka?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Nejsem žádný uèedník.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Ó, to vidím. Nejsem už tak mladý jako døív, však víš. A už léta èekám na nìkoho, kdo by to po mnì pøevzal.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Ty tu asi nejseš kvùli tomu, že jsou naši sousedi naštvaní, co?
};


instance DIA_BALTHASAR_WASMACHSTDU(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 4;
	condition = dia_balthasar_wasmachstdu_condition;
	information = dia_balthasar_wasmachstdu_info;
	description = "Co je tvoje práce?";
};


func int dia_balthasar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo))
	{
		return TRUE;
	};
};

func void dia_balthasar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//Co je tvoje práce?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Ó, hlídám ovce a dìlám to tak dlouho, co si jen pamatuju.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Ta zvíøata jsou velmi oddaná a chytrá, však víš. Když se o nì dobøe staráš, budou tì poslouchat až do konce života.
};


instance DIA_ADDON_BALTHASAR_RANGERBANDITS(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_addon_balthasar_rangerbandits_condition;
	information = dia_addon_balthasar_rangerbandits_info;
	description = "Nevidìls kolem projíždìt nìjaké bandity?";
};


func int dia_addon_balthasar_rangerbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo) && ((MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING) || (SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_balthasar_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Nevidìls kolem projíždìt nìjaké bandity?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Najisto. Jeli kolem Sekobovy farmy nìkam na sever do lesù.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//Vezli mnoho a mnoho zbraní. Vypadali jako by chtìli vyhrát skøetí válku sami!
	};
	if(SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//A jestli mì oèi nezklamaly, ti bastardi s sebou vlekli ještì nìjakou mladou ženu.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Doufám, že jí neublížili.
	};
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Jsem rád, že naši farmu nechali napokoji.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "Co máš za problémy se sousedy?";
};


func int dia_balthasar_aergermitnachbarn_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_aergermitnachbarn_info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Co máš za problémy se sousedy?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Tráva na téhle stranì lánu je vždycky zakrslá a suchá. Tak vìtšinou chodím na pastviny jiných farmáøù.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Velkostatkáøi to nevadí, ale Bengar, farmáø z náhorních pastvin, dìlá hroznej virvál, když tam vezmu naše zvíøata.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//Øíká, že by mu mìl Sekob platit za to, že beru ovce na Bengarovy pastviny.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob na to nechce dát ani zlámanou grešli, takže už dál nemùžu nahoru chodit.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Kde bych našel horní pastviny a Bengarovu farmu?";
};


func int dia_balthasar_wobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_balthasar_wobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Kde bych našel horní pastviny a Bengarovu farmu?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Jdi po téhle cestì, až narazíš na køižovatku.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Když se dáš napravo, uvidíš hromadu balvanù. Napravo za nimi jsou náhorní pastviny a prùsmyk.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Možná bych si mìl promluvit s Bengarem.";
};


func int dia_balthasar_talktobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_talktobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Možná bych si mìl promluvit s Bengarem.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ty bys to pro mì udìlal? Co mu øekneš? Totiž, nechtìl bych žádný problémy, rozumíš?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Uvidíme.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Sedlák Bengar zakázal ovèáku Balthazarovi, aby své ovce vedl nahoru na pastviny.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "Už zase mùžeš svoje ovce brát na Bengarovy pastviny.";
};


func int dia_balthasar_bengarueberredet_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_talktobengar) && (MIS_BALTHASAR_BENGARSWEIDE == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_bengarueberredet_info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Už zase mùžeš svoje ovce brát na Bengarovy pastviny. Právì jsem s ním mluvil.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Díky. Hned vyrazím na cestu.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Tady, vezmi si na dùkaz mé vdìènosti tuhle ovèí kùži.
	b_giveinvitems(self,other,itat_sheepfur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	b_giveplayerxp(XP_BALTHASAR_BENGARSWEIDE);
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BALTHASARSHEEP1 = Hlp_GetNpc(balthasar_sheep1);
	if(Hlp_IsValidNpc(balthasarsheep1) && !Npc_IsDead(balthasarsheep1))
	{
		AI_StartState(balthasarsheep1,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP2 = Hlp_GetNpc(balthasar_sheep2);
	if(Hlp_IsValidNpc(balthasarsheep2) && !Npc_IsDead(balthasarsheep2))
	{
		AI_StartState(balthasarsheep2,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP3 = Hlp_GetNpc(balthasar_sheep3);
	if(Hlp_IsValidNpc(balthasarsheep3) && !Npc_IsDead(balthasarsheep3))
	{
		AI_StartState(balthasarsheep3,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
};


instance DIA_BALTHASAR_PERMKAP1(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 70;
	condition = dia_balthasar_permkap1_condition;
	information = dia_balthasar_permkap1_info;
	permanent = TRUE;
	description = "A co jinak. Všechno v poøádku?";
};


func int dia_balthasar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_balthasar_permkap1_info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//A co jinak. Všechno v poøádku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nemùžu si stìžovat. Díky za optání.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Jsou to teï tìžké èasy. Nemùžu najít své ovce!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//Hádám, že bych o tom mìl øíct Sekobovi.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_BALTHASAR_PICKPOCKET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 900;
	condition = dia_balthasar_pickpocket_condition;
	information = dia_balthasar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_balthasar_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_balthasar_pickpocket_info()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_BACK,dia_balthasar_pickpocket_back);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_PICKPOCKET,dia_balthasar_pickpocket_doit);
};

func void dia_balthasar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_balthasar_pickpocket);
};

func void dia_balthasar_pickpocket_back()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
};

