
instance DIA_ADDON_MONTY_EXIT(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 999;
	condition = dia_addon_monty_exit_condition;
	information = dia_addon_monty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_monty_exit_condition()
{
	return TRUE;
};

func void dia_addon_monty_exit_info()
{
	AI_StopProcessInfos(self);
};


var int monty_einmal;

instance DIA_ADDON_MONTY_HI(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 2;
	condition = dia_addon_monty_hi_condition;
	information = dia_addon_monty_hi_info;
	permanent = FALSE;
	description = "Hej, jak to jde?";
};


func int dia_addon_monty_hi_condition()
{
	return TRUE;
};

func void dia_addon_monty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Monty_Hi_15_00");	//Hej, jak to jde?
	AI_Output(self,other,"DIA_Addon_Monty_Hi_08_01");	//Jsem na�ivu - a to je hlavn�.
	if(MONTY_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Monty_Hi_08_02");	//Jestli si chce� popov�dat, tak Patrik je ten, koho hled�.
		MONTY_EINMAL = TRUE;
	};
};


instance DIA_ADDON_MONTY_HACKEN(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 2;
	condition = dia_addon_monty_hacken_condition;
	information = dia_addon_monty_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_monty_hacken_condition()
{
	return TRUE;
};

func void dia_addon_monty_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_00");	//�hel tv�ch ran rozhoduje, jak dob�e ti pr�ce p�jde.
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_01");	//Ne p�ehnan� a ne p��li� slab�. Nejleh�� cesta, jak z�skat nugety a tv�j krump�� vydr�� nav�ky.
	b_upgrade_hero_hackchance(5);
};

