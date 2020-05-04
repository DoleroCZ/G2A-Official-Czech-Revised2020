
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
	description = "Kdo tomu tady šéfuje?";
};


func int dia_addon_bl_bdt_13_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Kdo tomu tady šéfuje?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//Náš skvìlý vùdce Thorus. Udìlá z nás boháèe!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//Náš skvìlý vùdce ... uh ... nevím ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//Náš skvìlý vùdce Raven. Udìlá z nás boháèe!
	};
};


instance DIA_ADDON_BL_BDT_13_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_13_lager_condition;
	information = dia_addon_bl_bdt_13_lager_info;
	permanent = TRUE;
	description = "Co víš o táboøe?";
};


func int dia_addon_bl_bdt_13_lager_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Co víš o táboøe?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Promluv si se Snafem, když chceš nìco vìdìt. Ten tlustý kuchaø ví fakt hodnì.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Když chceš nìco koupit, jdi za Fiskem. Mùže sehnat témìø cokoliv ...
};


instance DIA_ADDON_BL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_13_news_condition;
	information = dia_addon_bl_bdt_13_news_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_addon_bl_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//Nìco nového?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Raven je mrtvý. Teï už se odtud NIKDY nedostaneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Piráti stáhli ocasy a vydali se na plavbu.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Takže tam na pláži zbyla jen banda idiotù, kteøí nemají ani poøádnou loï.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Ba ani Beliar neví, jak se z tohoto ostrova dostat.
	};
};


instance DIA_ADDON_BL_BDT_13_GOLD(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_13_gold_condition;
	information = dia_addon_bl_bdt_13_gold_info;
	permanent = TRUE;
	description = "Jak mùžu rychle dostat hodnì zlata?";
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
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Jak mùžu rychle dostat hodnì zlata?
	if(BDT_13_NERVER <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Dobrá otázka. Není to dùvod, proè tu všichni jsme?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Sežeò si èervený kámen od Thoruse a mùžeš vstoupit do dolu.
	}
	else if(BDT_13_KILL == FALSE)
	{
		BDT_13_NERVER = 0;
		BDT_13_KILL = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//Dìláš si srandu? Vypadni!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_NERVER = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Takže - již nic, pane Úžasný!
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

