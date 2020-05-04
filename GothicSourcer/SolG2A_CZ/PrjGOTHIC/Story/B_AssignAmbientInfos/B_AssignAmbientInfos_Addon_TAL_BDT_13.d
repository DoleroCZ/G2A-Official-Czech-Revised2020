
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
	description = "Co je nov�ho?";
};


func int dia_addon_tal_bdt_13_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Bu� t� zv��e sn�, nebo t� sn� zv��e.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Tahle ba�ina bude na�im hrobem ...
};


instance DIA_ADDON_TAL_BDT_13_TAL(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_13_tal_condition;
	information = dia_addon_tal_bdt_13_tal_info;
	permanent = TRUE;
	description = "Co v� o tomhle �dol�?";
};


func int dia_addon_tal_bdt_13_tal_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_tal_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co v� o tomhle �dol�?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Tady je hodn� star�ch kr�m�. Raven n�m na��dil sesb�rat v�echno.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nem�m tu�en�, co s t�m cht�l, ale nikdo komu z�stal aspo� malej mozek, nebude riskovat krk kv�li n�kolika kamenn�m desk�m ...
};


instance DIA_ADDON_TAL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_13_news_condition;
	information = dia_addon_tal_bdt_13_news_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_addon_tal_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//M�me se l�p ne� tihle pir�ti.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Z�sobovali n�s v�zni, ale nikdy za to nedostali ani minci. Nen� divu, �e jsou na�tavn�.
	if(BDT_13_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale pro� by to d�lali? �to�ili na t�bor? (sm�ch) HAHAHA.
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

