
instance DIA_ADDON_TOM_EXIT(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 999;
	condition = dia_addon_tom_exit_condition;
	information = dia_addon_tom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_tom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TOM_PICKPOCKET(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 900;
	condition = dia_addon_tom_pickpocket_condition;
	information = dia_addon_tom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_tom_pickpocket_condition()
{
	return c_beklauen(40,52);
};

func void dia_addon_tom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_BACK,dia_addon_tom_pickpocket_back);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_PICKPOCKET,dia_addon_tom_pickpocket_doit);
};

func void dia_addon_tom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_tom_pickpocket);
};

func void dia_addon_tom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
};


instance DIA_ADDON_TOM_HI(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 1;
	condition = dia_addon_tom_hi_condition;
	information = dia_addon_tom_hi_info;
	permanent = FALSE;
	description = "Proè tu sedíš?";
};


func int dia_addon_tom_hi_condition()
{
	return TRUE;
};

func void dia_addon_tom_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Proè tu sedíš?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Dostal jsem se do problémù. Teï mùže být chození do tábora špatný nápad.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//Mìl jsem slušné spojení s nìkolika piráty, víš?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Pokaždé jsem potkal chlapy nedaleko tábora kvùli obchodu.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Chlape, kupoval jsem proviant pro polovinu lidí z tábora. 'Tome, obstarej mi tohle - Tome, obstarej mi tamto'.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A potom to bylo vše ztraceno kvùli tomu zatracenému Estebanovi!
};


instance DIA_ADDON_TOM_JUAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 2;
	condition = dia_addon_tom_juan_condition;
	information = dia_addon_tom_juan_info;
	permanent = FALSE;
	description = "Jak to?";
};


func int dia_addon_tom_juan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_hi))
	{
		return TRUE;
	};
};

func void dia_addon_tom_juan_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban poslal jednoho z jeho lidí, Juana. On nás pozoroval.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A potom, zrovna když jsem smlouval obchod s piráty, ten chlap vylezl ze svého úkrytu a srazil je k zemi.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Chlapèe, ten chlap byl rychlý! Ale ne dost rychlý. Mohl jsem utéct.
	SC_KNOWS_JUANMURDEREDANGUS = TRUE;
	b_logentry(TOPIC_ADDON_KILLJUAN,"Tak je to Juan, kdo je zodpovìdný za vraždu Hanka a Agnuse. Pøepadl je a zabil je.");
};


instance DIA_ADDON_TOM_ESTEBAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 3;
	condition = dia_addon_tom_esteban_condition;
	information = dia_addon_tom_esteban_info;
	permanent = FALSE;
	description = "A od té doby se tu schováváš?";
};


func int dia_addon_tom_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_juan))
	{
		return TRUE;
	};
};

func void dia_addon_tom_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//A od té doby se tu schováváš?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Nejdøív jsem se vrátil do tábora, abych to øekl Fiskovi, Hunovi a ostatním, kteøí èekali na zásilku.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//A Esteban je za to zodpovìdný.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Asi budu mrtvý, jetli Esteban zjistí, že jsem jim øekl, že je za tím on.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Proto nejdu zpátky do tábora.
	TOM_TELLS = TRUE;
};


instance DIA_ADDON_TOM_DEAD(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 4;
	condition = dia_addon_tom_dead_condition;
	information = dia_addon_tom_dead_info;
	permanent = FALSE;
	description = "Esteban je mrtvý.";
};


func int dia_addon_tom_dead_condition()
{
	if(Npc_IsDead(esteban) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_dead_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban je mrtvý.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Opravdu? Chlape, to je to, èemu øíkám štìstí!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kdo ho zabil?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(šklebí se) Noo, øeknìme jenom, že to byl nìkdo, koho znáš ...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Dìkuji mnohokrát, že jsi sem zašel. Teï se mùžu vrátit do tábora ...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_ADDON_TOM_PERM(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 5;
	condition = dia_addon_tom_perm_condition;
	information = dia_addon_tom_perm_info;
	permanent = TRUE;
	description = "Ještì nìco?";
};


func int dia_addon_tom_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Ještì nìco?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Teï si mùžu užít pití Luciiného drinku bez starostí.
	}
	else if(Npc_KnowsInfo(other,dia_addon_tom_dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Koneènì se mùžu vrátit!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Hm? Obvykle tu sedím a poèítám kameny ...
	};
};

