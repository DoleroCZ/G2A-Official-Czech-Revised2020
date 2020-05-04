
instance DIA_ADDON_BDT_10028_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 999;
	condition = dia_addon_10028_buddler_exit_condition;
	information = dia_addon_10028_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10028_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10028_BUDDLER_HI(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 2;
	condition = dia_addon_10028_buddler_hi_condition;
	information = dia_addon_10028_buddler_hi_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_addon_10028_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10028_Buddler_Hi_15_00");	//Jak to jde?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_01");	//Nejsem nad�en� z toho kop�n� tady. To je to jedin�, co pro n�s otroky maj�.
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_02");	//(sm�ch) Z�skat zlato nikdy nebylo tak snadn�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_03");	//Hrmph. Kterej idiot pustil otroky?
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_10028_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 3;
	condition = dia_addon_10028_buddler_hacken_condition;
	information = dia_addon_10028_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10028_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_00");	//Mus� kopat z doln� ��sti a� k vrchn�mu d�lu.
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_01");	//Je to trochu lstiv�, ale takto dostane� ze sk�ly v�ce nuget�.
	b_upgrade_hero_hackchance(5);
};

