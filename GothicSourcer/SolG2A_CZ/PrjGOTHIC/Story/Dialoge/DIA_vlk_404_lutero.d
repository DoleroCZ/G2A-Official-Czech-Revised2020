
instance DIA_LUTERO_EXIT(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 999;
	condition = dia_lutero_exit_condition;
	information = dia_lutero_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lutero_exit_condition()
{
	return TRUE;
};

func void dia_lutero_exit_info()
{
	AI_StopProcessInfos(self);
	if((LUTERO_KRALLEN == LOG_RUNNING) && (MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) == FALSE))
	{
		LUTERO_KRALLEN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_LUTERO_HALLO(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_hallo_condition;
	information = dia_lutero_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_hallo_condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_hallo_info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Jmenuju se Lutero. Obchoduju se vším, na co si vzpomeneš.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Jaké zboží mi mùžeš nabídnout?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//No, hlavnì vzácné a neobvyklé vìci. Vždycky jsem se snažil vyhovìt zákazníkovu pøání.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Lutero prodává v horní ètvrti neobvyklé a vzácné vìci.");
};


instance DIA_LUTERO_GETLOST(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_getlost_condition;
	information = dia_lutero_getlost_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_getlost_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_getlost_info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Zmizni, koøene! Nemáš co dìlat? Tak si koukej sehnat práci - ale nìkde jinde!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Co tady chceš, novici? Nemìl bys být v klášteøe?
	};
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_SNAPPER(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_snapper_condition;
	information = dia_lutero_snapper_info;
	permanent = FALSE;
	description = "Hledáš nìco konkrétního?";
};


func int dia_lutero_snapper_condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_lutero_snapper_info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Hledáš nìco konkrétního?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Pro svùj souèasný úkol potøebuju drápy chòapavce.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Ale ne jen tak ledajaké drápy. Musí to být nìco zvláštního - drápy mocné bestie, co už zabila mnoho mužù, nebo nìco takového.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Kde najdu chòapavce?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Na tomhle ostrovì jich pár je, ale vìtšina z nich žije v Hornickém údolí.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//A co z toho budu mít?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Mùžu ti opatøit nìjaký runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Mùžu ti dát prsten nepøemožitelnosti.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Uvidím, co se dá dìlat.
	Log_CreateTopic(TOPIC_LUTERO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTERO,LOG_RUNNING);
	b_logentry(TOPIC_LUTERO,"Obchodník Lutero hledá drápy zvláš silného chòapavce.");
	LUTERO_KRALLEN = LOG_RUNNING;
};


instance DIA_LUTERO_KRALLE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_kralle_condition;
	information = dia_lutero_kralle_info;
	permanent = FALSE;
	description = "Mám pro tebe nìjaké zajímavé drápy chòapavce.";
};


func int dia_lutero_kralle_condition()
{
	if((Npc_HasItems(other,itat_clawleader) >= 1) && Npc_KnowsInfo(other,dia_lutero_snapper))
	{
		return TRUE;
	};
};

func void dia_lutero_kralle_info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mám pro tebe nìjaké zajímavé drápy chòapavce.
	LUTERO_KRALLEN = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Mùj zákazník to rád uslyší.
	b_giveinvitems(other,self,itat_clawleader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nemám ten runový kámen tady u sebe. Ale vím, kde ho mùžeš najít.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//Až pùjdeš z mìsta do hospody, projdeš pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Je tam jeskynì, moji pøátelé tam mají v truhle uložené runové kameny. Tady je klíè.
		b_giveinvitems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Tady je ten prsten, co jsem si slíbil.
		b_giveinvitems(self,other,itri_prot_total_01,1);
	};
};


instance DIA_LUTERO_TRADE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_trade_condition;
	information = dia_lutero_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int dia_lutero_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_hallo))
	{
		return TRUE;
	};
};

func void dia_lutero_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_LUTERO_PICKPOCKET(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 900;
	condition = dia_lutero_pickpocket_condition;
	information = dia_lutero_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lutero_pickpocket_condition()
{
	return c_beklauen(58,65);
};

func void dia_lutero_pickpocket_info()
{
	Info_ClearChoices(dia_lutero_pickpocket);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_BACK,dia_lutero_pickpocket_back);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_PICKPOCKET,dia_lutero_pickpocket_doit);
};

func void dia_lutero_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lutero_pickpocket);
};

func void dia_lutero_pickpocket_back()
{
	Info_ClearChoices(dia_lutero_pickpocket);
};

