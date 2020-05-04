
instance DIA_ADDON_BDT_10027_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 999;
	condition = dia_addon_10027_buddler_exit_condition;
	information = dia_addon_10027_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10027_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10027_BUDDLER_HI(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 2;
	condition = dia_addon_10027_buddler_hi_condition;
	information = dia_addon_10027_buddler_hi_info;
	permanent = TRUE;
	description = "Co tady dìláš?";
};


func int dia_addon_10027_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Co tady dìláš?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Nic. Pracoval jsem pro rudobarony dost dlouho. Je dobøe, že teï pracují jiní.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Zatracenì, zdá se, že musíme stále kopat, co?
	};
};


instance DIA_ADDON_10027_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 3;
	condition = dia_addon_10027_buddler_hacken_condition;
	information = dia_addon_10027_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10027_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//Myšlenková práce. Chlapèe, kopání je èistì myšlenková práce. Nezkoušej prorazit skálu - je tvrdší než ty.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Uvolni svou mysl - a zkus se spojit v jedno se zlatem. Kopáè se pak bude rád modlit, rád meditovat.
	b_upgrade_hero_hackchance(10);
};

