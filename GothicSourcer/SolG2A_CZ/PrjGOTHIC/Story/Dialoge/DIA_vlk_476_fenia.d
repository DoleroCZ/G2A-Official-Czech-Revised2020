
instance DIA_FENIA_EXIT(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 999;
	condition = dia_fenia_exit_condition;
	information = dia_fenia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fenia_exit_condition()
{
	return TRUE;
};

func void dia_fenia_exit_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//Pìknej den, pane paladin.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//Pøeju bezpeènou cestu, ctihodný mágu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_FENIA_PICKPOCKET(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 900;
	condition = dia_fenia_pickpocket_condition;
	information = dia_fenia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_fenia_pickpocket_condition()
{
	return c_beklauen(50,75);
};

func void dia_fenia_pickpocket_info()
{
	Info_ClearChoices(dia_fenia_pickpocket);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_BACK,dia_fenia_pickpocket_back);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_PICKPOCKET,dia_fenia_pickpocket_doit);
};

func void dia_fenia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fenia_pickpocket);
};

func void dia_fenia_pickpocket_back()
{
	Info_ClearChoices(dia_fenia_pickpocket);
};


instance DIA_FENIA_HALLO(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 3;
	condition = dia_fenia_hallo_condition;
	information = dia_fenia_hallo_info;
	important = TRUE;
};


func int dia_fenia_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_fenia_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//Vypadáš nìjak utrmácenì. Dlouho jsi nespal, co?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//Moc dlouho, dalo by se øíct.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//Pojï sem, blíž. Se mnou najdeš to, co hledáš!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Fenia prodává pøi cestì do pøístavu jídlo.");
};


instance DIA_FENIA_HANDELN(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_handeln_condition;
	information = dia_fenia_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_fenia_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_handeln_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//Ukaž mi své zboží.
};


instance DIA_FENIA_INFOS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_infos_condition;
	information = dia_fenia_infos_info;
	permanent = FALSE;
	description = "Øíkala jsi, že máš, co potøebuju. Týká se to i informací?";
};


func int dia_fenia_infos_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_infos_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//Øíkala jsi, že máš, co potøebuju. Týká se to i informací?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//Ale samozøejmì. Co bys chtìl vìdìt?
};


instance DIA_FENIA_MORETRADERS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 11;
	condition = dia_fenia_moretraders_condition;
	information = dia_fenia_moretraders_info;
	permanent = FALSE;
	description = "Jsou tady v pøístavu ještì nìjací další kupci?";
};


func int dia_fenia_moretraders_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_moretraders_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//Jsou tady v pøístavu ještì nìjací další kupci?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//Když se pustíš po molu nalevo, narazíš na Halvora, mého muže. Prodává ryby.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//Na opaèném konci je Brahim, kartograf.
};


instance DIA_FENIA_OV(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 13;
	condition = dia_fenia_ov_condition;
	information = dia_fenia_ov_info;
	permanent = FALSE;
	description = "Znáš nìkoho z horní ètvrti?";
};


func int dia_fenia_ov_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_fenia_ov_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//Znáš nìkoho z horní ètvrti?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(smích) Kdybych znala nìkoho z horní ètvrti, tak bych tady nebyla, hochu.
};


instance DIA_FENIA_INTERESTING(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 14;
	condition = dia_fenia_interesting_condition;
	information = dia_fenia_interesting_info;
	permanent = FALSE;
	description = "Co je tady v pøístavu zajímavého k vidìní?";
};


func int dia_fenia_interesting_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_interesting_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//Co je tady v pøístavu zajímavého k vidìní?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//No, jestli hledáš nìjakou zábavu, zajdi do Kardifovy krèmy na molu. Každou chvíli se tam nìco semele.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//To mùžeš jen tìžko minout. Ten chlápek, co stojí u vchodu, urèitì upoutá tvoji pozornost.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//Kromì toho je tady ještì ta velká loï paladinù. Králova majestátní váleèná galéra. To je to jediný, co tady stojí za zhlédnutí.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//Najdeš ji, když se od toho chlápka dáš doleva a pak kolem skalnatého srázu.
};


instance DIA_FENIA_AUFREGEND(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 15;
	condition = dia_fenia_aufregend_condition;
	information = dia_fenia_aufregend_info;
	permanent = FALSE;
	description = "Stalo se v poslední dobì nìco zajímavého?";
};


func int dia_fenia_aufregend_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_aufregend_info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//Stalo se v poslední dobì nìco zajímavého?
	AI_Output(self,other,"DIA_Fenia_Add_17_01");	//Dalo by se to tak øíct. Nìco takovýho už tu dlouho nebylo.
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//Bìžel tudy nìjaký zlodìj. Musel v dolní èásti mìsta ukrást luk.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//Samozøejmì že domobrana pøišla moc pozdì. Jako vždycky.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//Utekl jim - staèilo mu jen seskoèit do pøístavu a byl pryè.
};

