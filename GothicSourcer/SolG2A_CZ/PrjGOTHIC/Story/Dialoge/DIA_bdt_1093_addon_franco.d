
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
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nez�st�vej pozadu nebo skon�� jako krmen� pro �raloky.
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
	description = "(Ukr�st tento amulet bude riskantn�.)";
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
	b_logentry(TOPIC_ADDON_FRANCO,"Jestli budu d�lat dob�e pr�ci od Franca, pust� m� do t�bora.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, co hled�? Chce� snad do t�bora, nebo ne?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Jo, to chci ...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Nezaj�m� m�, kdo jsi. J� jsem Franco, vedu to tady.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Kdy� se bude� venku sna�it, tak t� vezmu do t�bora.
	if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Ramon, str�ce u br�ny, ti �ekne, jestli pot�ebuje nov� lidi v t�bo�e. Promluv si s n�m.
		b_logentry(TOPIC_ADDON_FRANCO,"M�m se zaptat Ramona, str�ce u br�ny, jestli nepot�ebuje nov� lidi.");
	};
};


instance DIA_ADDON_FRANCO_HAI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 2;
	condition = dia_addon_franco_hai_condition;
	information = dia_addon_franco_hai_info;
	permanent = FALSE;
	description = "Thorus pot�ebuje nov� lidi.";
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
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus pot�ebuje nov� lidi.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dob�e. Postar�m se o to.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Moment, a co j�?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Je�t� jsi ni�eho nedos�hl.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Pot�ebuji hodn� dobr�ch lid� a ty o t� pr�ci nev� nic ...
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Ok, chce� �anci? Dostane� ji. Hlas se u Logana. Ti mo��lov� �raloci ho fakt �tvou.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pomoz mu je vy��dit, potom bude� pro t�bor dobr�.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco chce, abych pomohl Loganovi. Pak m� pust� do t�bora");
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
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Kdy� stoj� p�ed vstupem do t�bora, jdi doleva pod�l sk�ly. Tam na n�ho naraz�.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_TOT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 5;
	condition = dia_addon_franco_tot_condition;
	information = dia_addon_franco_tot_info;
	permanent = FALSE;
	description = "Logan je mrtv�.";
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
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan je mrtv�.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Kruci. Byl to ten nejlep�� lovec, kter�ho jsme venku m�li. K sakru s t�m!
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Ok, bojoval jsi s mo��lov�mi �raloky - m��e� b�t u�ite�n� - dokonce v�c ne� v�t�ina lid� tady.
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
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//... ,ale on to nep�e�il.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//DOBR�, bojoval jsi proti ba�inn�m �ralok�m - mohl bys b�t u�ite�n� - p�inejmen��m v�c, ne� v�t�ina zdej��ch chlap�.
	b_giveplayerxp(XP_ADDON_HLPLOGAN);
	b_logentry(TOPIC_ADDON_FRANCO,"Pomoc Loganovi Francovi nesta�ila k tomu, aby m� pustil do t�bora.");
};


instance DIA_ADDON_FRANCO_MIS2(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 7;
	condition = dia_addon_franco_mis2_condition;
	information = dia_addon_franco_mis2_info;
	permanent = FALSE;
	description = "M��u te� do t�bora?";
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
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//M��u te� do t�bora?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Poslouchej - je tu je�t� jedna v�c, jestli chce�.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//P�ed n�kolika dny jsem poslal Edgora do mo��lu.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//M�l pro m� z�skat starou kamennou desku - ale od t� doby ho nikdo nevid�l.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Tak�e mi tu kamenou desku p�inese� ty.
	MIS_HLPEDGOR = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATE,"Franco chce kamennou tabulku, kterou mu m�l don�st Edgor. Te� je to na m�.");
	b_logentry(TOPIC_ADDON_FRANCO,"Franco chce, abych nejprve pomohl Edgorovi, ne� m� pust� do t�bora.");
};


instance DIA_ADDON_FRANCO_WHILE(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 8;
	condition = dia_addon_franco_while_condition;
	information = dia_addon_franco_while_info;
	permanent = FALSE;
	description = "Jak to vypad� se zlatem?";
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
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//Jak to vypad� se zlatem?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostanu za svoji pr�ci v mo��lu zaplaceno?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(extr�m� p��telsky) Tak ty chce� zlato? Jasn�, �ekni si, kolik? Pades�t nuget�? Sto? D�m ti kolik jen unese� ...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(�ve) Kdo si sakra mysl�, �e jsi? D�l� si ze m� srandu?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//Te� pohni t�m sv�m zadkem a za�ni n�co d�lat! Jinak nedostane� ani malou st�epinu zlata!!
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
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chce� lehkou nebo rychlou cestu?
	Info_ClearChoices(dia_addon_franco_woedgor);
	Info_AddChoice(dia_addon_franco_woedgor,"Tu rychlou.",dia_addon_franco_woedgor_fast);
	Info_AddChoice(dia_addon_franco_woedgor,"�ekni jen tu cestu.",dia_addon_franco_woedgor_easy);
};

func void b_addon_franco_there()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//V�ude okolo jsou ruiny. N�kde tam bude.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//Mysl�m, �e bude dost chytr� na to, aby si ud�lal ohe�. To by ti mohlo pomoct.
};

func void dia_addon_franco_woedgor_easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//�ekni jen tu cestu.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Jdi po t� l�vce a� k p�edn� br�n�. Tam bude Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Tam jdi doleva a zase po l�vce.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};

func void dia_addon_franco_woedgor_fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Tu rychlou.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Ok. Jdi tedy odtud �hlop���n� doleva a p�ejdi l�vku do mo��lu.
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
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Ok, velmi dob�e. Ravena to ur�it� pot��.
	MIS_HLPEDGOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HLPEDGOR);
	b_logentry(TOPIC_ADDON_FRANCO,"Donesl jsem Francovi tu tabulku, co cht�l.");
};


instance DIA_ADDON_FRANCO_JEMANDANDEREN(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 11;
	condition = dia_addon_franco_jemandanderen_condition;
	information = dia_addon_franco_jemandanderen_info;
	permanent = FALSE;
	description = "A co s t�borem? M��u u� kone�n� vstoupit?";
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
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co s t�borem? M��u u� kone�n� vstoupit?
	if(!Npc_IsDead(logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Ne, poslal jsem Logana. Byl na m�m seznamu v��e.
		LOGAN_INSIDE = TRUE;
		AI_Teleport(logan,"BL_INN_CORNER_02");
		b_startotherroutine(logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Ne, u� jsem poslal n�koho jin�ho.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//A za dal��, oni v t�bo�e nikoho nepot�ebuj�.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Ale j� t� tady vyu�iju dob�e, (�kleb� se) Te�, kdy� u� tu Logan nen�.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco m� nepust� do t�bora. Mysl�m, �e se s t�mhle probl�mem vypo��d�m jinak ...");
};


instance DIA_ADDON_FRANCO_FIGHT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 12;
	condition = dia_addon_franco_fight_condition;
	information = dia_addon_franco_fight_info;
	permanent = TRUE;
	description = "OKAM�IT� m� pus� dovnit�!";
};


func int dia_addon_franco_fight_condition()
{
	return TRUE;
};

func void dia_addon_franco_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//OKAM�IT� m� pus� dovnit�!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//(v�hru�n�) A co kdy� ne?
	Info_ClearChoices(dia_addon_franco_fight);
	Info_AddChoice(dia_addon_franco_fight,"Potom budu �ekat o chv�li d�le ...",dia_addon_franco_fight_nothing);
	Info_AddChoice(dia_addon_franco_fight,"Pak toho bude� litovat.",dia_addon_franco_fight_duel);
};

func void dia_addon_franco_fight_duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Pak toho bude� litovat.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Chce� mi vyhro�ovat? TY? Chce� vyhro�ovat M�? - m�l bys dostat lekci ...
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_addon_franco_fight_nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Potom budu �ekat o chv�li d�le ...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//(posm�v� se) Jasn�.
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
	description = "Ty svin�! Te� si to s tebou vy��d�m!";
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
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty svin�! Te� si to s tebou vy��d�m!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//(zaho�kle) Takov� mal� trpasl�k se se mnou chce m��it? Jak chce�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

