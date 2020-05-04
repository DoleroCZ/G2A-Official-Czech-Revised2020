
instance DIA_MIL_304_TORWACHE_EXIT(C_INFO)
{
	npc = mil_304_torwache;
	nr = 999;
	condition = dia_mil_304_torwache_exit_condition;
	information = dia_mil_304_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_304_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_304_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_304_TORWACHE_WASMACHSTDU(C_INFO)
{
	npc = mil_304_torwache;
	nr = 3;
	condition = dia_mil_304_torwache_wasmachstdu_condition;
	information = dia_mil_304_torwache_wasmachstdu_info;
	permanent = TRUE;
	description = "Tak jak to vypadá?";
};


func int dia_mil_304_torwache_wasmachstdu_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_304_torwache_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Mil_304_Torwache_WASMACHSTDU_15_00");	//Tak jak to vypadá?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_01");	//Nemohu si stìžovat. Konám svou povinnost, jak ode mne Innos oèekává.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_02");	//Hele, s tím svým èíslem 'tak jak to vypadá' se tady aplauzu nedoèkáš. Bìž mi z oèí, jasný?
	};
	AI_StopProcessInfos(self);
};

