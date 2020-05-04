
instance DIA_ADDON_TAL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_1_exit_condition;
	information = dia_addon_tal_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_1_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_1_hi_condition;
	information = dia_addon_tal_bdt_1_hi_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_addon_tal_bdt_1_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Poèkám dokud nepožádají o dalšího.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Ze všech lidí venku se jedinì Franco dostává dovnitø.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Teï když je Franco mrtvý, budu doufám mít vìtší šanci.
	};
};


instance DIA_ADDON_TAL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_1_lager_condition;
	information = dia_addon_tal_bdt_1_lager_info;
	permanent = TRUE;
	description = "Co mi mùžeš øíct o táboøe?";
};


func int dia_addon_tal_bdt_1_lager_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mi mùžeš øíct o táboøe?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Dávej bacha koho obtìžuješ. Pokud si zaèneš s dobøe postavenou osobou, pùjdou po tobì všichni.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Vìtšina z nich nechce ztratit svoje zlato - proto se nìkteøí navzájem brání.
};


instance DIA_ADDON_TAL_BDT_1_RAVEN(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_1_raven_condition;
	information = dia_addon_tal_bdt_1_raven_info;
	permanent = TRUE;
	description = "Co víš o Ravenovi?";
};


func int dia_addon_tal_bdt_1_raven_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_raven_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Je to chlapik, který sem jako prvni pøišel s jeho bandou.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//Je to vùdce tábora. Doufám, že si s ním nic nehodláš zaèít.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Jednou požádali o pìt nových lidí protože si vylil svùj vztek na svých vlastních lidech.
};

func void b_assignambientinfos_addon_tal_bdt_1(var C_NPC slf)
{
	dia_addon_tal_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_raven.npc = Hlp_GetInstanceID(slf);
};

