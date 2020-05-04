
instance DIA_BIFF_DI_EXIT(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 999;
	condition = dia_biff_di_exit_condition;
	information = dia_biff_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_di_exit_condition()
{
	return TRUE;
};

func void dia_biff_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_HALLO(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 10;
	condition = dia_biff_di_hallo_condition;
	information = dia_biff_di_hallo_info;
	important = TRUE;
};


func int dia_biff_di_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_hallo_info()
{
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_00");	//A? Kde je to bohatství, cos mi sliboval?
	if(Npc_KnowsInfo(other,dia_biff_di_orks) == FALSE)
	{
		AI_Output(other,self,"DIA_Biff_DI_HALLO_15_01");	//A co jsem øíkal pøedtím, ještì na moøi?
	};
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_02");	//Teï tady máš hlídat loï.
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_03");	//Nerad bych celou cestu nazpátek plaval.
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_04");	//Do kelu. Kdybych to byl vìdìl, zùstal bych radìj v Khorinisu.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_PERM(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_perm_condition;
	information = dia_biff_di_perm_info;
	permanent = TRUE;
	description = "Na palubì všechno v poøádku?";
};


func int dia_biff_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_di_hallo) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_perm_info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//Na palubì všechno v poøádku?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(podráždìnì) Jo, jo. Je tu klid.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_ORKS(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_orks_condition;
	information = dia_biff_di_orks_info;
	important = TRUE;
};


func int dia_biff_di_orks_condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (ORKSTURMDI == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_orks_info()
{
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_00");	//Ty zavšivený bestie!
	AI_Output(other,self,"DIA_Biff_DI_ORKS_15_01");	//Co tady nahoøe ksakru dìláš? Mìls hlídat loï.
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_02");	//Ta se jen tak nepotopí, chlape.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BIFF_DI_UNDEADDRGDEAD(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 4;
	condition = dia_biff_di_undeaddrgdead_condition;
	information = dia_biff_di_undeaddrgdead_info;
	important = TRUE;
};


func int dia_biff_di_undeaddrgdead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_biff_di_undeaddrgdead_info()
{
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_00");	//A bylo to tak?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//Je to tak teï.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_02");	//Mùžu teï...
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_03");	//Mùžeš vyrabovat celej ostrov, když na to pøijde.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//Skvìlý.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PlunderTempel");
};


instance DIA_BIFF_DI_PLUNDER(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_plunder_condition;
	information = dia_biff_di_plunder_info;
	important = TRUE;
};


func int dia_biff_di_plunder_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_biff_di_plunder) && Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_biff_di_plunder_info()
{
	AI_Output(self,other,"DIA_Biff_DI_plunder_07_00");	//Sakra. Teï ne.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 900;
	condition = dia_biff_di_pickpocket_condition;
	information = dia_biff_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_di_pickpocket_condition()
{
	return c_beklauen(92,450);
};

func void dia_biff_di_pickpocket_info()
{
	Info_ClearChoices(dia_biff_di_pickpocket);
	Info_AddChoice(dia_biff_di_pickpocket,DIALOG_BACK,dia_biff_di_pickpocket_back);
	Info_AddChoice(dia_biff_di_pickpocket,DIALOG_PICKPOCKET,dia_biff_di_pickpocket_doit);
};

func void dia_biff_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_di_pickpocket);
};

func void dia_biff_di_pickpocket_back()
{
	Info_ClearChoices(dia_biff_di_pickpocket);
};

