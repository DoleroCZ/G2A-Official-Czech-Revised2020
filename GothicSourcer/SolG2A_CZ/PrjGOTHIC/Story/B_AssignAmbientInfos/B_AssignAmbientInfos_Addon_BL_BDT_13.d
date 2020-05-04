
instance DIA_ADDON_BL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_13_exit_condition;
	information = dia_addon_bl_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_exit_info()
{
	BDT_13_NERVER = 0;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_13_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_13_chef_condition;
	information = dia_addon_bl_bdt_13_chef_info;
	permanent = TRUE;
	description = "Kdo tomu tady ��fuje?";
};


func int dia_addon_bl_bdt_13_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Kdo tomu tady ��fuje?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//N� skv�l� v�dce Thorus. Ud�l� z n�s boh��e!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//N� skv�l� v�dce ... uh ... nev�m ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//N� skv�l� v�dce Raven. Ud�l� z n�s boh��e!
	};
};


instance DIA_ADDON_BL_BDT_13_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_13_lager_condition;
	information = dia_addon_bl_bdt_13_lager_info;
	permanent = TRUE;
	description = "Co v� o t�bo�e?";
};


func int dia_addon_bl_bdt_13_lager_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Co v� o t�bo�e?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Promluv si se Snafem, kdy� chce� n�co v�d�t. Ten tlust� kucha� v� fakt hodn�.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Kdy� chce� n�co koupit, jdi za Fiskem. M��e sehnat t�m�� cokoliv ...
};


instance DIA_ADDON_BL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_13_news_condition;
	information = dia_addon_bl_bdt_13_news_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_addon_bl_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//N�co nov�ho?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Raven je mrtv�. Te� u� se odtud NIKDY nedostaneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Pir�ti st�hli ocasy a vydali se na plavbu.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Tak�e tam na pl�i zbyla jen banda idiot�, kte�� nemaj� ani po��dnou lo�.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Ba ani Beliar nev�, jak se z tohoto ostrova dostat.
	};
};


instance DIA_ADDON_BL_BDT_13_GOLD(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_13_gold_condition;
	information = dia_addon_bl_bdt_13_gold_info;
	permanent = TRUE;
	description = "Jak m��u rychle dostat hodn� zlata?";
};


func int dia_addon_bl_bdt_13_gold_condition()
{
	if((MIS_SEND_BUDDLER != LOG_RUNNING) || (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_13_gold_info()
{
	BDT_13_NERVER = BDT_13_NERVER + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Jak m��u rychle dostat hodn� zlata?
	if(BDT_13_NERVER <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Dobr� ot�zka. Nen� to d�vod, pro� tu v�ichni jsme?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Se�e� si �erven� k�men od Thoruse a m��e� vstoupit do dolu.
	}
	else if(BDT_13_KILL == FALSE)
	{
		BDT_13_NERVER = 0;
		BDT_13_KILL = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//D�l� si srandu? Vypadni!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_NERVER = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Tak�e - ji� nic, pane ڞasn�!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void b_assignambientinfos_addon_bl_bdt_13(var C_NPC slf)
{
	dia_addon_bl_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_gold.npc = Hlp_GetInstanceID(slf);
};

