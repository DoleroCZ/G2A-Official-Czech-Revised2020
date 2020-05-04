
instance DIA_PAL_262_EXIT(C_INFO)
{
	npc = pal_262_wache;
	nr = 999;
	condition = dia_pal_262_exit_condition;
	information = dia_pal_262_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_262_exit_condition()
{
	return TRUE;
};

func void dia_pal_262_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_INFO)
{
	npc = pal_262_wache;
	nr = 2;
	condition = dia_pal_262_greet_condition;
	information = dia_pal_262_greet_info;
	important = TRUE;
};


func int dia_pal_262_greet_condition()
{
	return TRUE;
};

func void dia_pal_262_greet_info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Stát - kdo jsi?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Mnohem dùležitìjší je otázka, odkud jsem pøišel. Pøišel jsem skrz prùsmyk.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Budeš mi tedy dál stát v cestì, nebo mì pustíš dál?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//No, to jsem pøece nemohl vìdìt. Jasnì, že mùžeš jít dál.
	AI_StopProcessInfos(self);
};


instance DIA_WACHE_PERM(C_INFO)
{
	npc = pal_262_wache;
	nr = 3;
	condition = dia_wache_perm_condition;
	information = dia_wache_perm_info;
	permanent = TRUE;
	description = "Kdo tady velí?";
};


func int dia_wache_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void dia_wache_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Kdo tady velí?
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Velitel Garond a poradci, paldinové Oric a Parcival.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Jen bìž dovnitø. Bìhem dne je najdeš v trùnním sále v pøízemí.
};

