
instance DIA_ADDON_RAMON_EXIT(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 999;
	condition = dia_addon_ramon_exit_condition;
	information = dia_addon_ramon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_ramon_exit_condition()
{
	return TRUE;
};

func void dia_addon_ramon_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_CHECKPOINT = "BL_UP_CHECK";

instance DIA_ADDON_RAMON_FIRSTWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 1;
	condition = dia_addon_ramon_firstwarn_condition;
	information = dia_addon_ramon_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_firstwarn_info()
{
	if(Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_00");	//Hej, co se tam stalo?
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//Ztøískal jsem Franca.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//Tak? Dobrá, nyní je to TVÙJ úkol ujistit se, že ti hloupí osli dìlají svou práci každý den.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Hej, nechci marnit svùj drahocený èas s lovci. Chci do tábora.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Tak jo, tys zabil Franca. Tím jsi ze sebe udìlal vùdce. Tak dìlej svou práci.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//Dobøe, když jsem vùdce, tak si mohu vybrat další osobu, která vstoupí do tábora.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//A tak naøizuji, že 'JÁ' jsem ta další.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//(usmìvavì) Dobøe, nebylo to tak tìžké. Nepotøebujeme žádnou další osobu, tak se žádná další osoba pøijímat nebude.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Thorus by mohl poslat nového vùdce lovcùm, tak ten by uvolnil místo mì.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//(usmìvavì) Nevzdáváš se, co? Dobrá, pak se dostaneš do tábora.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Thorus se postará o nového vùdce a pošle nám ho.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//Tak na co èekáš? A nezapomeò si krumpáè.
		self.aivar[AIV_PASSGATE] = TRUE;
		PLAYER_HASTALKEDTOBANDITCAMP = TRUE;
		b_giveplayerxp(XP_ADDON_HINEIN);
		AI_StopProcessInfos(self);
		AI_Teleport(carlos,"BL_WAIT_FINN");
		b_startotherroutine(carlos,"START");
		b_startotherroutine(finn,"START");
	}
	else if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Hej, kdo jsi? Nepamatuji si, že by nìkdo jako ty mìl povolení vstoupit.
		if(Npc_KnowsInfo(other,dia_addon_franco_hi))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Franco mì poslal. Chce vìdìt, zda-li nepotøebujete nové pracovníky.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//Á, právì jednoho potøebujeme. Právì vèera jeden z chlápkù zdechl.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//Ten idiot se dostal do problémù s Estebanem.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Kdo je Esteban?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//On je šéf tábora. On rozhoduje o tom, kdo mùže vstoupit do dolu.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//Tak, øekni Francovi, že potøebujeme nové pracovníky. Chápeš?
		Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FRANCO,"Thorus žádá nové muže pro tábor. To bude Franca zajímat.");
		Info_ClearChoices(dia_addon_ramon_firstwarn);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? THORUS?",dia_addon_ramon_firstwarn_yes);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? Nikdy jsem o nìm neslyšel...",dia_addon_ramon_firstwarn_no);
		RAMON_NEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//Stùj! Nemùžeš jít dovnitø - tak vypadni!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};

func void dia_addon_ramon_firstwarn_yes()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Thorus? THORUS?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Ano. THORUS. Ten, kdo se ptal po nových dìlnících.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//Muž, který rozhoduje, zda-li mùže nový muž vejít z moèálu do tábora.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//Nechceš mi nyní øíct, že už ho znáš už z døívìjška?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//Dobøe ... Ano ...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Podívej ... KAŽDÝ zná Thoruse.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//Nicménì, to ti nepomùže ke vstupu. A já tu nejsem na pøedávání jakýchkoliv zpráv.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};

func void dia_addon_ramon_firstwarn_no()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Thorus? Nikdy jsem o nìm neslyšel ...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//Ale kámo, ty ho neznáš? Býval velitelem stráží ve Starém táboøe.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//Je to muž, kteréhu každý vìøí a respektuje ho.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//On je jedinný, kdo žádal nové lidi.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//Poznáš ho, jestli budeš žít dost dlouho.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};


instance DIA_ADDON_RAMON_SECONDWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 2;
	condition = dia_addon_ramon_secondwarn_condition;
	information = dia_addon_ramon_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//Ještì o krok blíž a bude to tvùj poslední.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_ATTACK(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 3;
	condition = dia_addon_ramon_attack_condition;
	information = dia_addon_ramon_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//Nìkteøí lidé se nikdy nepouèí ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_RAMON_NEWS(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_news_condition;
	information = dia_addon_ramon_news_info;
	permanent = FALSE;
	description = "Jsem nový chlápek.";
};


func int dia_addon_ramon_news_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_news_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//Jsem nový chlápek.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Nezkoušej to na mì. Pouze Franco rozhoduje o tom, kdo vstoupí do tábora.
};


instance DIA_ADDON_RAMON_LIE(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_lie_condition;
	information = dia_addon_ramon_lie_info;
	permanent = FALSE;
	description = "Franco mì poslal ...";
};


func int dia_addon_ramon_lie_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_lie_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//Franco mì poslal ...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//On ne. Tak buï vypadneš nebo ti zpøelámu kosti ...
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_PERM(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 99;
	condition = dia_addon_ramon_perm_condition;
	information = dia_addon_ramon_perm_info;
	permanent = TRUE;
	description = "A? Vše v poøádku?";
};


func int dia_addon_ramon_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//A? Vše v poøádku?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//Vše v poøádku - pokud vím, nikdo nemá povoleno jít dovnitø.
	AI_StopProcessInfos(self);
};

