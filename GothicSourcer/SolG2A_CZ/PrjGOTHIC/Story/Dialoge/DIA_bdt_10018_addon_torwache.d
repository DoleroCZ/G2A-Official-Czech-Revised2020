
instance DIA_ADDON_BDT_10018_TORWACHE_EXIT(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 999;
	condition = dia_addon_bdt_10018_torwache_exit_condition;
	information = dia_addon_bdt_10018_torwache_exit_info;
	permanent = TRUE;
	description = "Promluvme si znova.";
};


func int dia_addon_bdt_10018_torwache_exit_condition()
{
	return TRUE;
};

func void dia_addon_bdt_10018_torwache_exit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00");	//Promluvme si znova.
	if(BDT_100018_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//V�, co ti pak �eknu ...
		BDT_100018_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Vypadni.
	};
	AI_StopProcessInfos(self);
};


const string BDT_10018_CHECKPOINT = "BL_RAVEN_CHECK";

instance DIA_ADDON_BDT_10018_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 1;
	condition = dia_addon_bdt_10018_torwache_firstwarn_condition;
	information = dia_addon_bdt_10018_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_firstwarn_info()
{
	if(BDT_100018_TELLS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Hej, st�j! Nem��e� vstoupit - vypadni!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Z cesty - mus�m za Ravenem.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//Nikdo nem��e vstoupit do t�chto komnat. To jasn� na��dil s�m Raven.
		BDT_100018_TELLS = TRUE;
		Log_CreateTopic(TOPIC_ADDON_TEMPEL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_TEMPEL,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_TEMPEL,"Str�ce br�ny chr�mu m� nechce pustit. Mus�m vymyslet, jak se dostat dovnit�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//Zase ty? Zase otravuje�!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_ADDON_BDT_10018_TORWACHE_SECONDWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_bdt_10018_torwache_secondwarn_condition;
	information = dia_addon_bdt_10018_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//Ud�lej je�t� jeden krok a ten bude tv�j posledn�!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10018_TORWACHE_ATTACK(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 3;
	condition = dia_addon_bdt_10018_torwache_attack_condition;
	information = dia_addon_bdt_10018_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//Za Ravena!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_BDT_10018_TORWACHE_HI(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_hi_condition;
	information = dia_addon_10018_torwache_hi_info;
	permanent = FALSE;
	description = "Je sakra d�le�it�, abych se za n�m dostal.";
};


func int dia_addon_10018_torwache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10018_torwache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//Je sakra d�le�it�, abych se za n�m dostal.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//Ne. Nen�. Jenom Bloodwyn m� povolen� b�t vevnit�.
	b_logentry(TOPIC_ADDON_TEMPEL,"Jenom Bloodwyn m��e z�stat vevnit� chr�mu. Mo�n� bych ho mohl naj�t.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_BLOODWYN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_bloodwyn_condition;
	information = dia_addon_10018_torwache_bloodwyn_info;
	permanent = FALSE;
	description = "Bloodwyn? Nem�l by b�t mrtv�?";
};


func int dia_addon_10018_torwache_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Bloodwyn? Nem�l by b�t mrtv�?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//Je siln� jako nikdy p�ed t�m. A jestli se dozv�, �e tady d�l� probl�my, nakope ti zadek!
};


instance DIA_ADDON_BDT_10018_TORWACHE_BRIBE(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 9;
	condition = dia_addon_10018_torwache_bribe_condition;
	information = dia_addon_10018_torwache_bribe_info;
	permanent = FALSE;
	description = "D�m ti tis�c zla��k�, kdy� m� pust� dovnit�.";
};


func int dia_addon_10018_torwache_bribe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bribe_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//D�m ti tis�c zla��k�, kdy� m� pust� dovnit�.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//Pl�tv� �asem, pitom�e.
};


instance DIA_ADDON_BDT_10018_TORWACHE_DRIN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_drin_condition;
	information = dia_addon_10018_torwache_drin_info;
	permanent = FALSE;
	description = "Je Bloodwyn vevnit�? Tak ho zavolej.";
};


func int dia_addon_10018_torwache_drin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_drin_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Je Bloodwyn vevnit�? Tak ho zavolej.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ha! Ty fakt v���, �e bych n�co takov�ho ud�lal?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//Mo�n� m� vliv v t�bo�e. Ale tvoje s�la kon�� P�ESN� TADY. Ch�pe�?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//Tak�e - t�hni do dolu kopat zlato nebo n�co podobn�ho - ale neotravuj tady!
	MIS_BLOODWYNRAUS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn sed� v chr�mu. Tak to nep�jdu d�l. Mo�n� bych se m�l porozhl�dnout v dole.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_KOPF(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_kopf_condition;
	information = dia_addon_10018_torwache_kopf_info;
	permanent = FALSE;
	description = "(Uk�zat Bloodwynovu hlavu)";
};


func int dia_addon_10018_torwache_kopf_condition()
{
	if(Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1)
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Tady! Po��d m� chce� zastavit?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Je tohle ... je to ... Bloodwyn? ... vypad� to jako ...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//Uh ... ano, vlastn� ne. Teda mysl�m ... uh ... m��e� j�t ...
	MIS_BLOODWYNRAUS = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

