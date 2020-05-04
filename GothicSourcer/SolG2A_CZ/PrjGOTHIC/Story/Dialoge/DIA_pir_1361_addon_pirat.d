
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
	description = "Jak to vypad�?";
};


func int dia_addon_sawpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//P�esta� kecat!
};


instance DIA_ADDON_SAWPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 11;
	condition = dia_addon_sawpirate_anheuern_condition;
	information = dia_addon_sawpirate_anheuern_info;
	permanent = FALSE;
	description = "Jsi jedn�m z Henryho lid�?";
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
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jsi jedn�m z Henryho lid�?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Ne. J� jenom �e�u tohle d�evo pro z�bavu, v�? Opravdu.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co se d�je? Henry �ekl, co m� d�lat?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Ano. Pot�ebuji se zbavit n�kolika bandit�.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//(Obran�) �le n�! NED�VEJ se na m� tak! Nechci s t�m m�t nic spole�n�ho.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Rad�ji m� nech �ezat, ano?
};


var int sawpirate_comeon_once;

instance DIA_ADDON_SAWPIRATE_COMEON(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 12;
	condition = dia_addon_sawpirate_comeon_condition;
	information = dia_addon_sawpirate_comeon_info;
	permanent = TRUE;
	description = "Poj� d�l.";
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
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Poj� d�l.
	if(hammerpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Pro�? U� m� p�r lid� pobl� ...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Nejd��ve poj�me trochu zp�t k t�boru ...
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(hammerpirate) && (SAWPIRATE_COMEON_ONCE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(Pro sebe) Pro� se nezeptal ostatn�ch ...
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
	description = "U� t� d�le nepot�ebuji.";
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
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//U� t� d�le nepot�ebuji.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//Tak tedy budu �ezat trochu d�le!
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
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Jsme moc daleko od t�bora.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//To m� prost� odhod�. Jednou se vr�t�m.
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
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//V� co, mysl�m, �e jsi kret�n!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Vr�t�m se do t�bora. Doufejme, �e se u� nikdy neuvid�me!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

