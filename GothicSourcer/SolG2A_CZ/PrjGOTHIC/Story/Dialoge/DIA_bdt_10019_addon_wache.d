
instance DIA_ADDON_BDT_10019_WACHE_EXIT(C_INFO)
{
	npc = bdt_10019_addon_wache;
	nr = 999;
	condition = dia_addon_10019_wache_exit_condition;
	information = dia_addon_10019_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10019_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10019_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10019_WACHE_HI(C_INFO)
{
	npc = bdt_10019_addon_wache;
	nr = 2;
	condition = dia_addon_10019_wache_hi_condition;
	information = dia_addon_10019_wache_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10019_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10019_wache_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_06_00");	//Dobøe, jsi na cestì do dolu?
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
	Info_AddChoice(dia_addon_bdt_10019_wache_hi,"Vlastnì chci vidìt Ravena.",dia_addon_bdt_10019_wache_hi_raven);
	Info_AddChoice(dia_addon_bdt_10019_wache_hi,"Ano.",dia_addon_bdt_10019_wache_hi_ja);
};

func void b_say_wache_kaputt()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_kaputt_15_00");	//Proè jsou mrtví?
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_kaputt_06_01");	//Udøeli se k smrti.
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

func void dia_addon_bdt_10019_wache_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");	//Vlastnì chci vidìt Ravena.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");	//(køik) Hej - zkus tam vkroèit a budeš mrtev jako tito vìzni.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");	//Radìji jdi do dolu.
	b_say_wache_kaputt();
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

func void dia_addon_bdt_10019_wache_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");	//Opatruj se. Buï peèlivìjší, než tito prolhaní chlapi kolem.
	b_say_wache_kaputt();
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

