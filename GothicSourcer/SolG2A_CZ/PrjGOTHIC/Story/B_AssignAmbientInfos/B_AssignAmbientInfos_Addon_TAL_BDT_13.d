
instance DIA_ADDON_TAL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_13_exit_condition;
	information = dia_addon_tal_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_13_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_13_hi_condition;
	information = dia_addon_tal_bdt_13_hi_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_addon_tal_bdt_13_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Buï tì zvíøe sní, nebo tì sní zvíøe.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Tahle bažina bude našim hrobem ...
};


instance DIA_ADDON_TAL_BDT_13_TAL(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_13_tal_condition;
	information = dia_addon_tal_bdt_13_tal_info;
	permanent = TRUE;
	description = "Co víš o tomhle údolí?";
};


func int dia_addon_tal_bdt_13_tal_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_tal_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co víš o tomhle údolí?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Tady je hodnì starých krámù. Raven nám naøídil sesbírat všechno.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nemám tušení, co s tím chtìl, ale nikdo komu zùstal aspoò malej mozek, nebude riskovat krk kvùli nìkolika kamenným deskám ...
};


instance DIA_ADDON_TAL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_13_news_condition;
	information = dia_addon_tal_bdt_13_news_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_addon_tal_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Máme se líp než tihle piráti.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Zásobovali nás vìzni, ale nikdy za to nedostali ani minci. Není divu, že jsou naštavný.
	if(BDT_13_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale proè by to dìlali? Útoèili na tábor? (smích) HAHAHA.
		BDT_13_EINMAL = TRUE;
	};
};

func void b_assignambientinfos_addon_tal_bdt_13(var C_NPC slf)
{
	dia_addon_tal_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_tal.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_news.npc = Hlp_GetInstanceID(slf);
};

