
instance DIA_ADDON_BL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_1_exit_condition;
	information = dia_addon_bl_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_1_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_1_chef_condition;
	information = dia_addon_bl_bdt_1_chef_info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int dia_addon_bl_bdt_1_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Kdo je tady šéf?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Hodnì se jich tu už vystøídalo ... nemùžeš je všechny zaregistrovat.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//Vìøím, že Thorus je teï náš vùdce ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Raven je náš vùdce. Dovedl nás sem a založil tábor.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Kontroluje dùl, jinak by se ti psi tady mezi sebou pozabíjeli už dávno kvùli zlatu.
	};
};


instance DIA_ADDON_BL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager_condition;
	information = dia_addon_bl_bdt_1_lager_info;
	permanent = FALSE;
	description = "Co víš o dolu?";
};


func int dia_addon_bl_bdt_1_lager_condition()
{
	if((SKLAVEN_FLUCHT == FALSE) || !Npc_IsDead(raven))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//Co víš o dolu?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Jak se ukázalo, že je tady zlatý dùl, tak se tady všichni navzájem celkem sjednotili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Raven pak pozabíjel ty nejhorší vzbouøence a jejich kosti vyhodil z dolu.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od té doby nikdo nemùže do vyšší ètvrti. Jinak by byl vzat jako vìzeò a poslán kopat do dolu.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BL_BDT_1_LAGER2(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager2_condition;
	information = dia_addon_bl_bdt_1_lager2_info;
	permanent = TRUE;
	description = "Co víš o táboøe?";
};


func int dia_addon_bl_bdt_1_lager2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager2_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//Co víš o táboøe?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Když na nìkoho zaútoèíš, VŠICHNI po tobì pùjdou.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//Pokud nemáš dobrý dùvod. To tì pak nebude nikdo trestat.
};


instance DIA_ADDON_BL_BDT_1_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_1_news_condition;
	information = dia_addon_bl_bdt_1_news_info;
	permanent = TRUE;
	description = "Nìco nového? ";
};


func int dia_addon_bl_bdt_1_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//Nìco nového?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Raven je mrtvý. Co teï budeme dìlat?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Piráti nás už nechtìjí pøevážet, protože jsme jim za to neplatili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//Mìli bychom jednoho nebo dva znich propíchnout, to by jsme pak mìli zajištìný odvoz.
};


instance DIA_ADDON_BL_BDT_1_SKLAVEN(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_1_sklaven_condition;
	information = dia_addon_bl_bdt_1_sklaven_info;
	permanent = TRUE;
	description = "Co víš o vìzních?";
};


func int dia_addon_bl_bdt_1_sklaven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager) && ((SKLAVEN_FLUCHT == FALSE) || (RAVENISDEAD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_sklaven_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co víš o vìzních?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Raven chtìl nìco vykopat. Nejprve to mìli dìlat banditi, ale mnohým se to nelíbilo.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//To byl ten dùvod, proè potøeboval vìznì - když zemøeli oni, nikomu to nevadilo.
	if(BDT_1_AUSBUDDELN == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co chtìl Raven vykopat?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nemám tušení, ale øekl bych, že nìco víc než zlato.
		BDT_1_AUSBUDDELN = TRUE;
	};
};

func void b_assignambientinfos_addon_bl_bdt_1(var C_NPC slf)
{
	dia_addon_bl_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_sklaven.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager2.npc = Hlp_GetInstanceID(slf);
};

