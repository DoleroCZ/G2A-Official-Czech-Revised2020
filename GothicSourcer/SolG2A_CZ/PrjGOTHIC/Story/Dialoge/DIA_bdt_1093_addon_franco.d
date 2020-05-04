
instance DIA_ADDON_FRANCO_EXIT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 999;
	condition = dia_addon_franco_exit_condition;
	information = dia_addon_franco_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_franco_exit_condition()
{
	return TRUE;
};

func void dia_addon_franco_exit_info()
{
	if((FRANCO_EXIT == FALSE) && (MIS_HLPLOGAN == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nez˘st·vej pozadu nebo skonËÌö jako krmenÌ pro ûraloky.
		FRANCO_EXIT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_PICKPOCKET(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 900;
	condition = dia_franco_pickpocket_condition;
	information = dia_franco_pickpocket_info;
	permanent = TRUE;
	description = "(Ukr·st tento amulet bude riskantnÌ.)";
};


func int dia_franco_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && ((other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)) && (Npc_HasItems(self,itam_addon_franco) >= 1)))
	{
		return TRUE;
	};
};

func void dia_franco_pickpocket_info()
{
	Info_ClearChoices(dia_franco_pickpocket);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_BACK,dia_franco_pickpocket_back);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_PICKPOCKET,dia_franco_pickpocket_doit);
};

func void dia_franco_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itam_addon_franco,1);
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_franco_pickpocket);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX] = 196;
		self.attribute[ATR_HITPOINTS] = 196;
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_franco_pickpocket_back()
{
	Info_ClearChoices(dia_franco_pickpocket);
};


instance DIA_ADDON_FRANCO_HI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 1;
	condition = dia_addon_franco_hi_condition;
	information = dia_addon_franco_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_franco_hi_condition()
{
	return TRUE;
};

func void dia_addon_franco_hi_info()
{
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"Jestli budu dÏlat dob¯e pr·ci od Franca, pustÌ mÏ do t·bora.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, co hled·ö? Chceö snad do t·bora, nebo ne?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Jo, to chci ...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//NezajÌm· mÏ, kdo jsi. J· jsem Franco, vedu to tady.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Kdyû se budeö venku snaûit, tak tÏ vezmu do t·bora.
	if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Ramon, str·ûce u br·ny, ti ¯ekne, jestli pot¯ebuje novÈ lidi v t·bo¯e. Promluv si s nÌm.
		b_logentry(TOPIC_ADDON_FRANCO,"M·m se zaptat Ramona, str·ûce u br·ny, jestli nepot¯ebuje novÈ lidi.");
	};
};


instance DIA_ADDON_FRANCO_HAI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 2;
	condition = dia_addon_franco_hai_condition;
	information = dia_addon_franco_hai_info;
	permanent = FALSE;
	description = "Thorus pot¯ebuje novÈ lidi.";
};


func int dia_addon_franco_hai_condition()
{
	if(RAMON_NEWS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_franco_hai_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus pot¯ebuje novÈ lidi.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dob¯e. Postar·m se o to.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Moment, a co j·?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//JeötÏ jsi niËeho nedos·hl.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Pot¯ebuji hodnÏ dobr˝ch lidÌ a ty o tÈ pr·ci nevÌö nic ...
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Ok, chceö öanci? Dostaneö ji. Hlas se u Logana. Ti moË·lovÌ ûraloci ho fakt ötvou.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pomoz mu je vy¯Ìdit, potom budeö pro t·bor dobr˝.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco chce, abych pomohl Loganovi. Pak mÏ pustÌ do t·bora");
};


instance DIA_ADDON_FRANCO_WO(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 3;
	condition = dia_addon_franco_wo_condition;
	information = dia_addon_franco_wo_info;
	permanent = FALSE;
	description = "Kde najdu Logana?";
};


func int dia_addon_franco_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_hai) && !Npc_IsDead(logan) && (MIS_HLPLOGAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_franco_wo_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Kde najdu Logana?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Kdyû stojÌö p¯ed vstupem do t·bora, jdi doleva podÈl sk·ly. Tam na nÏho narazÌö.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_TOT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 5;
	condition = dia_addon_franco_tot_condition;
	information = dia_addon_franco_tot_info;
	permanent = FALSE;
	description = "Logan je mrtv˝.";
};


func int dia_addon_franco_tot_condition()
{
	if((MIS_HLPLOGAN != LOG_SUCCESS) && Npc_IsDead(logan) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan je mrtv˝.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Kruci. Byl to ten nejlepöÌ lovec, kterÈho jsme venku mÏli. K sakru s tÌm!
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Ok, bojoval jsi s moË·lov˝mi ûraloky - m˘ûeö b˝t uûiteËn˝ - dokonce vÌc neû vÏtöina lidÌ tady.
	if(MIS_HLPLOGAN == LOG_RUNNING)
	{
		MIS_HLPLOGAN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_ADDON_FRANCO_HAISUCCESS(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 6;
	condition = dia_addon_franco_haisuccess_condition;
	information = dia_addon_franco_haisuccess_info;
	permanent = FALSE;
	description = "Pomohl jsem Loganovi ...";
};


func int dia_addon_franco_haisuccess_condition()
{
	if((MIS_HLPLOGAN == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_haisuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Pomohl jsem Loganovi ...
	if(Npc_IsDead(logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//... ,ale on to nep¯eûil.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//DOBR¡, bojoval jsi proti baûinn˝m ûralok˘m - mohl bys b˝t uûiteËn˝ - p¯inejmenöÌm vÌc, neû vÏtöina zdejöÌch chlap˘.
	b_giveplayerxp(XP_ADDON_HLPLOGAN);
	b_logentry(TOPIC_ADDON_FRANCO,"Pomoc Loganovi Francovi nestaËila k tomu, aby mÏ pustil do t·bora.");
};


instance DIA_ADDON_FRANCO_MIS2(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 7;
	condition = dia_addon_franco_mis2_condition;
	information = dia_addon_franco_mis2_info;
	permanent = FALSE;
	description = "M˘ûu teÔ do t·bora?";
};


func int dia_addon_franco_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess) || Npc_KnowsInfo(other,dia_addon_franco_tot))
	{
		return TRUE;
	};
};

func void dia_addon_franco_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//M˘ûu teÔ do t·bora?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Poslouchej - je tu jeötÏ jedna vÏc, jestli chceö.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//P¯ed nÏkolika dny jsem poslal Edgora do moË·lu.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//MÏl pro mÏ zÌskat starou kamennou desku - ale od tÈ doby ho nikdo nevidÏl.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Takûe mi tu kamenou desku p¯ineseö ty.
	MIS_HLPEDGOR = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATE,"Franco chce kamennou tabulku, kterou mu mÏl donÈst Edgor. TeÔ je to na mÏ.");
	b_logentry(TOPIC_ADDON_FRANCO,"Franco chce, abych nejprve pomohl Edgorovi, neû mÏ pustÌ do t·bora.");
};


instance DIA_ADDON_FRANCO_WHILE(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 8;
	condition = dia_addon_franco_while_condition;
	information = dia_addon_franco_while_info;
	permanent = FALSE;
	description = "Jak to vypad· se zlatem?";
};


func int dia_addon_franco_while_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess))
	{
		return TRUE;
	};
};

func void dia_addon_franco_while_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//Jak to vypad· se zlatem?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostanu za svoji pr·ci v moË·lu zaplaceno?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(extrÈmÏ p¯·telsky) Tak ty chceö zlato? JasnÏ, ¯ekni si, kolik? Pades·t nuget˘? Sto? D·m ti kolik jen uneseö ...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(¯ve) Kdo si sakra myslÌö, ûe jsi? DÏl·ö si ze mÏ srandu?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//TeÔ pohni tÌm sv˝m zadkem a zaËni nÏco dÏlat! Jinak nedostaneö ani malou st¯epinu zlata!!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_WOEDGOR(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 9;
	condition = dia_addon_franco_woedgor_condition;
	information = dia_addon_franco_woedgor_info;
	permanent = TRUE;
	description = "No, tak kde najdu Edgora?";
};


func int dia_addon_franco_woedgor_condition()
{
	if((MIS_HLPEDGOR == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_stone_04) < 1))
	{
		return TRUE;
	};
};

func void dia_addon_franco_woedgor_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(vzdychne) No, tak kde najdu Edgora?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chceö lehkou nebo rychlou cestu?
	Info_ClearChoices(dia_addon_franco_woedgor);
	Info_AddChoice(dia_addon_franco_woedgor,"Tu rychlou.",dia_addon_franco_woedgor_fast);
	Info_AddChoice(dia_addon_franco_woedgor,"ÿekni jen tu cestu.",dia_addon_franco_woedgor_easy);
};

func void b_addon_franco_there()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//Vöude okolo jsou ruiny. NÏkde tam bude.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//MyslÌm, ûe bude dost chytr˝ na to, aby si udÏlal oheÚ. To by ti mohlo pomoct.
};

func void dia_addon_franco_woedgor_easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//ÿekni jen tu cestu.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Jdi po tÈ l·vce aû k p¯ednÌ br·nÏ. Tam bude Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Tam jdi doleva a zase po l·vce.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};

func void dia_addon_franco_woedgor_fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Tu rychlou.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Ok. Jdi tedy odtud ˙hlop¯ÌËnÏ doleva a p¯ejdi l·vku do moË·lu.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};


instance DIA_ADDON_FRANCO_TAFEL(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 10;
	condition = dia_addon_franco_tafel_condition;
	information = dia_addon_franco_tafel_info;
	permanent = FALSE;
	description = "Tady je ta deska.";
};


func int dia_addon_franco_tafel_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tafel_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Tady je ta deska.
	b_giveinvitems(other,self,itmi_addon_stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Ok, velmi dob¯e. Ravena to urËitÏ potÏöÌ.
	MIS_HLPEDGOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HLPEDGOR);
	b_logentry(TOPIC_ADDON_FRANCO,"Donesl jsem Francovi tu tabulku, co chtÏl.");
};


instance DIA_ADDON_FRANCO_JEMANDANDEREN(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 11;
	condition = dia_addon_franco_jemandanderen_condition;
	information = dia_addon_franco_jemandanderen_info;
	permanent = FALSE;
	description = "A co s t·borem? M˘ûu uû koneËnÏ vstoupit?";
};


func int dia_addon_franco_jemandanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_tafel))
	{
		return TRUE;
	};
};

func void dia_addon_franco_jemandanderen_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co s t·borem? M˘ûu uû koneËnÏ vstoupit?
	if(!Npc_IsDead(logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Ne, poslal jsem Logana. Byl na mÈm seznamu v˝öe.
		LOGAN_INSIDE = TRUE;
		AI_Teleport(logan,"BL_INN_CORNER_02");
		b_startotherroutine(logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Ne, uû jsem poslal nÏkoho jinÈho.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//A za dalöÌ, oni v t·bo¯e nikoho nepot¯ebujÌ.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Ale j· tÏ tady vyuûiju dob¯e, (öklebÌ se) TeÔ, kdyû uû tu Logan nenÌ.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco mÏ nepustÌ do t·bora. MyslÌm, ûe se s tÌmhle problÈmem vypo¯·d·m jinak ...");
};


instance DIA_ADDON_FRANCO_FIGHT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 12;
	condition = dia_addon_franco_fight_condition;
	information = dia_addon_franco_fight_info;
	permanent = TRUE;
	description = "OKAMéITÃ mÏ pusù dovnit¯!";
};


func int dia_addon_franco_fight_condition()
{
	return TRUE;
};

func void dia_addon_franco_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//OKAMéITÃ mÏ pusù dovnit¯!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//(v˝hruûnÏ) A co kdyû ne?
	Info_ClearChoices(dia_addon_franco_fight);
	Info_AddChoice(dia_addon_franco_fight,"Potom budu Ëekat o chvÌli dÈle ...",dia_addon_franco_fight_nothing);
	Info_AddChoice(dia_addon_franco_fight,"Pak toho budeö litovat.",dia_addon_franco_fight_duel);
};

func void dia_addon_franco_fight_duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Pak toho budeö litovat.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Chceö mi vyhroûovat? TY? Chceö vyhroûovat MÃ? - mÏl bys dostat lekci ...
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_addon_franco_fight_nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Potom budu Ëekat o chvÌli dÈle ...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//(posmÌv· se) JasnÏ.
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_PIG(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 13;
	condition = dia_addon_franco_pig_condition;
	information = dia_addon_franco_pig_info;
	permanent = TRUE;
	description = "Ty svinÏ! TeÔ si to s tebou vy¯ÌdÌm!";
};


func int dia_addon_franco_pig_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_jemandanderen))
	{
		return TRUE;
	};
};

func void dia_addon_franco_pig_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty svinÏ! TeÔ si to s tebou vy¯ÌdÌm!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//(zaho¯kle) Takov˝ mal˝ trpaslÌk se se mnou chce mÏ¯it? Jak chceö!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

