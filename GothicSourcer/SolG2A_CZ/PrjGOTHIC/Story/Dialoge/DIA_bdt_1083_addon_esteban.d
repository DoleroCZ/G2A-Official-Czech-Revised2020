
instance DIA_ADDON_ESTEBAN_EXIT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 999;
	condition = dia_addon_esteban_exit_condition;
	information = dia_addon_esteban_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_esteban_exit_condition()
{
	if(BODYGUARD_KILLER == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ESTEBAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 900;
	condition = dia_addon_esteban_pickpocket_condition;
	information = dia_addon_esteban_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_esteban_pickpocket_condition()
{
	return c_beklauen(105,500);
};

func void dia_addon_esteban_pickpocket_info()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_BACK,dia_addon_esteban_pickpocket_back);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_PICKPOCKET,dia_addon_esteban_pickpocket_doit);
};

func void dia_addon_esteban_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};

func void dia_addon_esteban_pickpocket_back()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};


instance DIA_ADDON_ESTEBAN_HI(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 2;
	condition = dia_addon_esteban_hi_condition;
	information = dia_addon_esteban_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_esteban_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Take, ty jsi ten chlápek co si vybojoval pøístup do tábora.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//No, tady se novinky šíøí rychle ...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franco byl tuhı chlápek. Nikdo se mu neodváil odporovat. Nikdo kromì tebe.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Ale chápej, zabil bych tì, kdyby jsi zkusil stejnou vìc se mnou.
};


instance DIA_ADDON_ESTEBAN_MINE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_mine_condition;
	information = dia_addon_esteban_mine_info;
	permanent = FALSE;
	description = "Chci se dostat do dolu!";
};


func int dia_addon_esteban_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_hi))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chci se dostat do dolu!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(šklebí se) Jak jinak. A mluvíš se správnou osobou.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Kadı, kdo kope v dole, si mùe ponechat slušnou porci zlata.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A já mám na starosti èervené kameny, které potøebuješ, aby tì Thorus pustil.
};


instance DIA_ADDON_ESTEBAN_ROT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_rot_condition;
	information = dia_addon_esteban_rot_info;
	permanent = FALSE;
	description = "Dej mi jeden z tìch èervenıch kamenù.";
};


func int dia_addon_esteban_rot_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_mine))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_rot_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Dej mi jeden z tìch èervenıch kamenù.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Jistì, ale nebude to zadarmo.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Obvykle sice beru slušnou sumu zlata abych se nechal pøesvìdèit.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//A co tvoje kopáèské schopnosti?
	if(HERO_HACKCHANCE > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//U znáš pár trikù, e?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Ještì poøád nejsi expert ...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(arogantnì) Nedám ti èervenı kámen, jen protoe jsi celkem zkušenı kopáè.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Ne, mám pro tebe jinı úkol ...
};


instance DIA_ADDON_ESTEBAN_MIS(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 4;
	condition = dia_addon_esteban_mis_condition;
	information = dia_addon_esteban_mis_info;
	permanent = FALSE;
	description = "A jakı úkol by to mìl bıt?";
};


func int dia_addon_esteban_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//A jakı úkol by to mìl bıt?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden ze zdejších banditù se mì pokusil zabít. Nicménì, ON byl zabit mımi stráemi.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Asi chtìl na tvé místo, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//Byl to idiot! Vygumovanı kriminálník. Pochybuju, e to byl jeho nápad mì zavradit.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Ne, dìlal pro nìkoho jiného ...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A teï je na mì, abych našel lidi, co jsou za to odpovìdní.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//A to byl kdokoliv, zaplatí za to. Najdi ho a já tì pustím do dolu.
	if(!Npc_IsDead(senyan) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Senyan mì za tebou kvùli tomu poslal.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? Ten pro mì dìlá taky. Øekl jsem mu, aby mìl oèi otevøené.
	};
	MIS_JUDAS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ESTEBAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ESTEBAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Byl tady pokus o zavradìní Estebana. Mám zjistit, kdo za tím stojí.");
};


instance DIA_ADDON_ESTEBAN_KERL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_kerl_condition;
	information = dia_addon_esteban_kerl_info;
	permanent = FALSE;
	description = "Kde mám zaèít s pátráním?";
};


func int dia_addon_esteban_kerl_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_kerl_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Kde mám zaèít s pátráním?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Kadı v táboøe o tom ví. Není to ádné tajemství.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Zkus zjistit, kdo je na mé stranì a kdo ne. A nenech ty chlápky, aby tì dostali.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Promluv si se Snafem. Ten tlustı kuchaø toho ví hodnì.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Abych tomu pøišel na kloub, mìl bych si promluvit s lidmi v táboøe a zjistit, na èí stranì jsou. Snaf je dobrı pro zaèátek. Zaslechne hodnì klepù.");
};


instance DIA_ADDON_ESTEBAN_ARMOR(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 9;
	condition = dia_addon_esteban_armor_condition;
	information = dia_addon_esteban_armor_info;
	permanent = FALSE;
	description = "Potøebuju lepší brnìní.";
};


func int dia_addon_esteban_armor_condition()
{
	if(HUNO_ARMORCHEAP == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Potøebuju lepší brnìní.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Na co? Vdy u jedno máš. To ti musí staèit.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Zeptej se mì znovu a splníš svùj úkol.
	};
};


instance DIA_ADDON_ESTEBAN_AUFTRAG(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_auftrag_condition;
	information = dia_addon_esteban_auftrag_info;
	permanent = TRUE;
	description = "O tom úkolu ...";
};


func int dia_addon_esteban_auftrag_condition()
{
	if(((MIS_JUDAS == LOG_RUNNING) || (MIS_JUDAS == LOG_SUCCESS)) && (BODYGUARD_KILLER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//O tom úkolu ...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Poslouchej, je tady ještì hodnì vìcí o které se musím starat.
	if(MIS_JUDAS == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//No jo, ale myslel jsem si, e tì bude zajímat, kdo stojí za tím pokusem o vradu ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kdo? Øekni mi jeho jméno a moje stráe ho okamitì podøeou ...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//Fisk, ten obchodník, je za to zodpovìdnı. Teï je zrovna v hospodì a nasává. Nemá o nièem ani tušení ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Dobrá práce, kámo. Stráe se o nìho postarají ...
		AI_TurnToNPC(self,wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Hoši, slyšeli jste. Jdìte a dostaòte Fiska.
		AI_TurnToNPC(self,other);
		BODYGUARD_KILLER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Vra se a zase nìco zjistíš o tom pachateli.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ESTEBAN_AWAY(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_away_condition;
	information = dia_addon_esteban_away_info;
	permanent = FALSE;
	description = "A teï?";
};


func int dia_addon_esteban_away_condition()
{
	if(BODYGUARD_KILLER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_away_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//A teï?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Teï? Já ti øeknu, co bude teï.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk zemøe bolestivou smrtí a kadı v táboøe se o tom dozví.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To bude varování.
	b_startotherroutine(wache_01,"AMBUSH");
	b_startotherroutine(wache_02,"AMBUSH");
};


instance DIA_ADDON_ESTEBAN_STONE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_stone_condition;
	information = dia_addon_esteban_stone_info;
	permanent = FALSE;
	description = "Ok, dáš mi teï ten èervenı kámen?";
};


func int dia_addon_esteban_stone_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_away) && (BODYGUARD_KILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_stone_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Ok, dáš mi teï ten èervenı kámen?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Pracovals dobøe. Nìkdo jako ty nemá v dole co napráci.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Budeš uiteènìjší tady v táboøe. Zùstaneš tady a budeš dále pracovat pro mì.
};


instance DIA_ADDON_ESTEBAN_NOT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_not_condition;
	information = dia_addon_esteban_not_info;
	permanent = FALSE;
	description = "Budu o tom pøemıšlet.";
};


func int dia_addon_esteban_not_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_not_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Budu o tom pøemıšlet.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Asi jsi zapomnìl, s kım mluvíš. Jsem jeden z pøedních lidí tohoto tábora a budeš dìlat, co ti øeknu.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A já øíkám, e budeš dìlat pro mì a pro nikoho jiného. Rozumíš?
};


instance DIA_ADDON_ESTEBAN_FIGHT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 6;
	condition = dia_addon_esteban_fight_condition;
	information = dia_addon_esteban_fight_info;
	permanent = FALSE;
	description = "To si dìláš srandu!";
};


func int dia_addon_esteban_fight_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//To si dìláš srandu! O tomhle naše dohoda nebyla.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Vidíš, je tady pár lidí, co mohou dìlat takové nabídky jako tahle. Samozøejmì, pokud se ti nelíbí, mùeš kdykoliv odejít z tábora ...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A co takhle dodret svùj slib a dát mi, co mi patøí?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - ještì jedno slovo a moje stráe se o tebe postarají.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(šklebí se) Jaké stráe ... ?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co ... ? Aha, chápu ... snaíš se mì zradit. Špatnı nápad ...
	BODYGUARD_KILLER = FALSE;
	b_killnpc(wache_01);
	b_killnpc(wache_02);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_ESTEBAN_DUELL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_duell_condition;
	information = dia_addon_esteban_duell_info;
	permanent = FALSE;
	description = "Okamitì mi dej ten šutr nebo si ho vezmu sám!";
};


func int dia_addon_esteban_duell_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot) && (BODYGUARD_KILLER != TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_duell_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Okamitì mi dej ten šutr nebo si ho vezmu sám!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//ivot tì u musí nudit. Tak jo, nìco s tím udìláme...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

