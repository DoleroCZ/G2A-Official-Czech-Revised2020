
instance DIA_ADDON_BDT_10031_WACHE_EXIT(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 999;
	condition = dia_addon_10031_wache_exit_condition;
	information = dia_addon_10031_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10031_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10031_WACHE_SCATTY(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_scatty_condition;
	information = dia_addon_10031_wache_scatty_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10031_wache_scatty_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_scatty_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hej, snad nechceš jít dolovat? Nezapomeò si vzít nìjaké vybavení od Scattyho.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co potøebuji?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Aspoò krumpáè. A nìjaké jídlo ti taky nebude na škodu.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//A taky pár léèivých lektvarù? Jsou tam dùlní èervi.
	AI_StopProcessInfos(self);
};


var int wache_joker;

instance DIA_ADDON_BDT_10031_WACHE_HI(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_hi_condition;
	information = dia_addon_10031_wache_hi_info;
	permanent = TRUE;
	description = "Vše ok?";
};


func int dia_addon_10031_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//Vše ok?
	if((SKLAVEN_FLUCHT == TRUE) && (WACHE_JOKER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Chlape, otroci mají naspìch.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Když se doslechli, že jsou volní, utíkali pryè jako králici!
		WACHE_JOKER = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Ano. Nedìlej bordel a bude vše v poøádku.
};

