
instance DIA_ADDON_SAWPIRATE_EXIT(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 999;
	condition = dia_addon_sawpirate_exit_condition;
	information = dia_addon_sawpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sawpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_HELLO(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 1;
	condition = dia_addon_sawpirate_hello_condition;
	information = dia_addon_sawpirate_hello_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_addon_sawpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Pøestaò kecat!
};


instance DIA_ADDON_SAWPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 11;
	condition = dia_addon_sawpirate_anheuern_condition;
	information = dia_addon_sawpirate_anheuern_info;
	permanent = FALSE;
	description = "Jsi jedním z Henryho lidí?";
};


func int dia_addon_sawpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jsi jedním z Henryho lidí?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Ne. Já jenom øežu tohle døevo pro zábavu, víš? Opravdu.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co se dìje? Henry øekl, co máš dìlat?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Ano. Potøebuji se zbavit nìkolika banditù.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//(Obranì) Ále né! NEDÍVEJ se na mì tak! Nechci s tím mít nic spoleèného.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Radìji mì nech øezat, ano?
};


var int sawpirate_comeon_once;

instance DIA_ADDON_SAWPIRATE_COMEON(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 12;
	condition = dia_addon_sawpirate_comeon_condition;
	information = dia_addon_sawpirate_comeon_info;
	permanent = TRUE;
	description = "Pojï dál.";
};


func int dia_addon_sawpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_sawpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Pojï dál.
	if(hammerpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Proè? Už máš pár lidí poblíž ...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Nejdøíve pojïme trochu zpìt k táboru ...
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(hammerpirate) && (SAWPIRATE_COMEON_ONCE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(Pro sebe) Proè se nezeptal ostatních ...
		SAWPIRATE_COMEON_ONCE = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//(povzdech) Ach jo ...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SAWPIRATE_GOHOME(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 13;
	condition = dia_addon_sawpirate_gohome_condition;
	information = dia_addon_sawpirate_gohome_info;
	permanent = TRUE;
	description = "Už tì déle nepotøebuji.";
};


func int dia_addon_sawpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//Už tì déle nepotøebuji.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//Tak tedy budu øezat trochu déle!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SAWPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_toofar_condition;
	information = dia_addon_sawpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Jsme moc daleko od tábora.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//To mì prostì odhodí. Jednou se vrátím.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_success_condition;
	information = dia_addon_sawpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//Víš co, myslím, že jsi kretén!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Vrátím se do tábora. Doufejme, že se už nikdy neuvidíme!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

