
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
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//Víš, co ti pak øeknu ...
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
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Hej, stùj! Nemùžeš vstoupit - vypadni!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Z cesty - musím za Ravenem.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//Nikdo nemùže vstoupit do tìchto komnat. To jasnì naøídil sám Raven.
		BDT_100018_TELLS = TRUE;
		Log_CreateTopic(TOPIC_ADDON_TEMPEL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_TEMPEL,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_TEMPEL,"Strážce brány chrámu mì nechce pustit. Musím vymyslet, jak se dostat dovnitø.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//Zase ty? Zase otravuješ!
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
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//Udìlej ještì jeden krok a ten bude tvùj poslední!
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
	description = "Je sakra dùležité, abych se za ním dostal.";
};


func int dia_addon_10018_torwache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10018_torwache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//Je sakra dùležité, abych se za ním dostal.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//Ne. Není. Jenom Bloodwyn má povolení být vevnitø.
	b_logentry(TOPIC_ADDON_TEMPEL,"Jenom Bloodwyn mùže zùstat vevnitø chrámu. Možná bych ho mohl najít.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_BLOODWYN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_bloodwyn_condition;
	information = dia_addon_10018_torwache_bloodwyn_info;
	permanent = FALSE;
	description = "Bloodwyn? Nemìl by být mrtvý?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Bloodwyn? Nemìl by být mrtvý?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//Je silný jako nikdy pøed tím. A jestli se dozví, že tady dìláš problémy, nakope ti zadek!
};


instance DIA_ADDON_BDT_10018_TORWACHE_BRIBE(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 9;
	condition = dia_addon_10018_torwache_bribe_condition;
	information = dia_addon_10018_torwache_bribe_info;
	permanent = FALSE;
	description = "Dám ti tisíc zlaákù, když mì pustíš dovnitø.";
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
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//Dám ti tisíc zlaákù, když mì pustíš dovnitø.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//Plýtváš èasem, pitomèe.
};


instance DIA_ADDON_BDT_10018_TORWACHE_DRIN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_drin_condition;
	information = dia_addon_10018_torwache_drin_info;
	permanent = FALSE;
	description = "Je Bloodwyn vevnitø? Tak ho zavolej.";
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
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Je Bloodwyn vevnitø? Tak ho zavolej.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ha! Ty fakt vìøíš, že bych nìco takového udìlal?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//Možná máš vliv v táboøe. Ale tvoje síla konèí PØESNÌ TADY. Chápeš?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//Takže - táhni do dolu kopat zlato nebo nìco podobného - ale neotravuj tady!
	MIS_BLOODWYNRAUS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn sedí v chrámu. Tak to nepùjdu dál. Možná bych se mìl porozhlédnout v dole.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_KOPF(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_kopf_condition;
	information = dia_addon_10018_torwache_kopf_info;
	permanent = FALSE;
	description = "(Ukázat Bloodwynovu hlavu)";
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
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Tady! Poøád mì chceš zastavit?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Je tohle ... je to ... Bloodwyn? ... vypadá to jako ...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//Uh ... ano, vlastnì ne. Teda myslím ... uh ... mùžeš jít ...
	MIS_BLOODWYNRAUS = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

