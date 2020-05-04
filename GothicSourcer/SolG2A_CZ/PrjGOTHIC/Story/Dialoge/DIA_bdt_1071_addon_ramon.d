
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
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//Zt��skal jsem Franca.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//Tak? Dobr�, nyn� je to TV�J �kol ujistit se, �e ti hloup� osli d�laj� svou pr�ci ka�d� den.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Hej, nechci marnit sv�j drahocen� �as s lovci. Chci do t�bora.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Tak jo, tys zabil Franca. T�m jsi ze sebe ud�lal v�dce. Tak d�lej svou pr�ci.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//Dob�e, kdy� jsem v�dce, tak si mohu vybrat dal�� osobu, kter� vstoup� do t�bora.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//A tak na�izuji, �e 'J�' jsem ta dal��.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//(usm�vav�) Dob�e, nebylo to tak t�k�. Nepot�ebujeme ��dnou dal�� osobu, tak se ��dn� dal�� osoba p�ij�mat nebude.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Thorus by mohl poslat nov�ho v�dce lovc�m, tak ten by uvolnil m�sto m�.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//(usm�vav�) Nevzd�v� se, co? Dobr�, pak se dostane� do t�bora.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Thorus se postar� o nov�ho v�dce a po�le n�m ho.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//Tak na co �ek�? A nezapome� si krump��.
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
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Hej, kdo jsi? Nepamatuji si, �e by n�kdo jako ty m�l povolen� vstoupit.
		if(Npc_KnowsInfo(other,dia_addon_franco_hi))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Franco m� poslal. Chce v�d�t, zda-li nepot�ebujete nov� pracovn�ky.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//�, pr�v� jednoho pot�ebujeme. Pr�v� v�era jeden z chl�pk� zdechl.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//Ten idiot se dostal do probl�m� s Estebanem.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Kdo je Esteban?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//On je ��f t�bora. On rozhoduje o tom, kdo m��e vstoupit do dolu.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//Tak, �ekni Francovi, �e pot�ebujeme nov� pracovn�ky. Ch�pe�?
		Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FRANCO,"Thorus ��d� nov� mu�e pro t�bor. To bude Franca zaj�mat.");
		Info_ClearChoices(dia_addon_ramon_firstwarn);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? THORUS?",dia_addon_ramon_firstwarn_yes);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? Nikdy jsem o n�m nesly�el...",dia_addon_ramon_firstwarn_no);
		RAMON_NEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//St�j! Nem��e� j�t dovnit� - tak vypadni!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};

func void dia_addon_ramon_firstwarn_yes()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Thorus? THORUS?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Ano. THORUS. Ten, kdo se ptal po nov�ch d�ln�c�ch.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//Mu�, kter� rozhoduje, zda-li m��e nov� mu� vej�t z mo��lu do t�bora.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//Nechce� mi nyn� ��ct, �e u� ho zn� u� z d��v�j�ka?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//Dob�e ... Ano ...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Pod�vej ... KA�D� zn� Thoruse.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//Nicm�n�, to ti nepom��e ke vstupu. A j� tu nejsem na p�ed�v�n� jak�chkoliv zpr�v.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};

func void dia_addon_ramon_firstwarn_no()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Thorus? Nikdy jsem o n�m nesly�el ...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//Ale k�mo, ty ho nezn�? B�val velitelem str�� ve Star�m t�bo�e.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//Je to mu�, kter�hu ka�d� v��� a respektuje ho.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//On je jedinn�, kdo ��dal nov� lidi.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//Pozn� ho, jestli bude� ��t dost dlouho.
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
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//Je�t� o krok bl� a bude to tv�j posledn�.
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
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//N�kte�� lid� se nikdy nepou�� ...
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
	description = "Jsem nov� chl�pek.";
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
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//Jsem nov� chl�pek.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Nezkou�ej to na m�. Pouze Franco rozhoduje o tom, kdo vstoup� do t�bora.
};


instance DIA_ADDON_RAMON_LIE(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_lie_condition;
	information = dia_addon_ramon_lie_info;
	permanent = FALSE;
	description = "Franco m� poslal ...";
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
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//Franco m� poslal ...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//On ne. Tak bu� vypadne� nebo ti zp�el�mu kosti ...
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_PERM(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 99;
	condition = dia_addon_ramon_perm_condition;
	information = dia_addon_ramon_perm_info;
	permanent = TRUE;
	description = "A? V�e v po��dku?";
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
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//A? V�e v po��dku?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//V�e v po��dku - pokud v�m, nikdo nem� povoleno j�t dovnit�.
	AI_StopProcessInfos(self);
};

