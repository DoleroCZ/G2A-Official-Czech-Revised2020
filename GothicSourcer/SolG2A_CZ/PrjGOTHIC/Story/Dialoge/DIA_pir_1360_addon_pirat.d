
instance DIA_ADDON_HAMMERPIRATE_EXIT(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 999;
	condition = dia_addon_hammerpirate_exit_condition;
	information = dia_addon_hammerpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_hammerpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_HELLO(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 1;
	condition = dia_addon_hammerpirate_hello_condition;
	information = dia_addon_hammerpirate_hello_info;
	permanent = TRUE;
	description = "Všechno v poøádku?";
};


func int dia_addon_hammerpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//Všechno v poøádku?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_towerbanditsdead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Dostali jsme je! Ti bastardi byli bez šance!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//Ok, pojïme to skoncovat!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//Ne! Nemám rád rvaèky!
	};
};


instance DIA_ADDON_HAMMERPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 11;
	condition = dia_addon_hammerpirate_anheuern_condition;
	information = dia_addon_hammerpirate_anheuern_info;
	permanent = FALSE;
	description = "Mìl bys mi pomoci.";
};


func int dia_addon_hammerpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Nic neøíkej! Chtìl jsi, abych s tebou bojoval proti tìm banditùm!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Dostals je.
	if(!Npc_IsDead(sawpirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Proè se nezeptáš tìch týpkù na pile?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//Já ... nechci žádné problémy ...
};


instance DIA_ADDON_HAMMERPIRATE_COMEON(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 12;
	condition = dia_addon_hammerpirate_comeon_condition;
	information = dia_addon_hammerpirate_comeon_info;
	permanent = TRUE;
	description = "Pojï se mnou.";
};


func int dia_addon_hammerpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_hammerpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Pojï se mnou.
	if(sawpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Henry potøebuje jednoho z nás TADY ...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//Vrame se trochu blíž k táboru.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//(vzdychá) no jo ...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_HAMMERPIRATE_GOHOME(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 13;
	condition = dia_addon_hammerpirate_gohome_condition;
	information = dia_addon_hammerpirate_gohome_info;
	permanent = TRUE;
	description = "Už tì nepotøebuju.";
};


func int dia_addon_hammerpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//Už tì nepotøebuju.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//Jak chceš ...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_HAMMERPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_toofar_condition;
	information = dia_addon_hammerpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//Jestli tam chceš jít, nechtìj, abych tì musel zastavit ...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//Radši se vrátím.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_success_condition;
	information = dia_addon_hammerpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//Víš co, pøemýšlel jsem o tom. Máš vlastnì pravdu!
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//Jdu zase do tábora. Uvidíme se!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

