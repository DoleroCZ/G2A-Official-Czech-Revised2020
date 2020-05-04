
instance DIA_TANDOR_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_exit_condition;
	information = dia_tandor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_tandor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_HALLO(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_hallo_condition;
	information = dia_tandor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tandor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_tandor_hallo_info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//Prošel jsi pøes prùsmyk? Dobrá práce. Už jsme tam ztratili víc než dost dobrých mužù.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//Sám dobøe vím, jak to tam vypadá - jeden èas jsem byl u prùzkumné jednotky.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//Máš zbraò? Jestli potøebuješ dobrou zbraò, tak jsi tady správnì.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor na hradì prodává zbranì.");
};


instance DIA_TANDOR_TRUPP(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_trupp_condition;
	information = dia_tandor_trupp_info;
	permanent = FALSE;
	description = "Co se s tou jednotkou stalo?";
};


func int dia_tandor_trupp_condition()
{
	if(Npc_KnowsInfo(other,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_trupp_info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//Co se s tou jednotkou stalo?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//Prozkoumávali jsme oblast a chtìli se dostat na pobøeží. Utáboøili jsme se v jeskyni.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//Pozdì v noci pøišli skøeti. Šturmovali po svahu s pochodnìmi a bubny - a našli nás.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//Pokusili jsme se uprchnout, ale byl jsem jediný, komu se podaøilo odtamtud vyváznout.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//Krátce na to postavili skøeti svou palisádu, tak jsme se stáhli do hradu.
};


instance DIA_TANDOR_TRADE(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_trade_condition;
	information = dia_tandor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_tandor_trade_condition()
{
	return TRUE;
};

func void dia_tandor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_TANDOR_EQUIPMENT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 3;
	condition = dia_tandor_equipment_condition;
	information = dia_tandor_equipment_info;
	description = "Posílá mì Garond - potøebuju vybavit.";
};


func int dia_tandor_equipment_condition()
{
	if(Npc_KnowsInfo(hero,dia_garond_equipment) && (other.guild == GIL_MIL) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_tandor_equipment_info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//Posílá mì Garond - potøebuju vybavit.
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//Zbraò na blízko, nebo na dálku?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Na blízko.",dia_tandor_equipment_nah);
	Info_AddChoice(dia_tandor_equipment,"Na dálku.",dia_tandor_equipment_fern);
};

func void dia_tandor_equipment_nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//Na blízko.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//Bojuješ jednou rukou, nebo obìma?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Jednou rukou.",dia_tandor_equipment_ein);
	Info_AddChoice(dia_tandor_equipment,"Obìma rukama.",dia_tandor_equipment_zwei);
};

func void dia_tandor_equipment_fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//Na dálku.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//Luk, nebo kuši?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Luk.",dia_tandor_equipment_bow);
	Info_AddChoice(dia_tandor_equipment,"Kuše.",dia_tandor_equipment_crossbow);
};

func void dia_tandor_equipment_ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//Jednou rukou.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//Tak si vezmi tohle. Je to dobrá zbraò.
	b_giveinvitems(self,other,itmw_steinbrecher,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//Obìma rukama.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//S tímhle obouruèákem bys mìl být spokojený.
	b_giveinvitems(self,other,itmw_zweihaender1,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Luk.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//Tenhle lovecký luk je pro tebe jako dìlaný. Dám ti také nìjaké šípy.
	b_giveinvitems(self,other,itrw_bow_l_03,1);
	b_giveinvitems(self,other,itrw_arrow,50);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Kuše.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//V tom pøípadì si vezmi tuhle lehkou kuši. Mùžu ti dát také nìjaké šipky.
	b_giveinvitems(self,other,itrw_crossbow_l_02,1);
	b_giveinvitems(self,other,itrw_bolt,50);
	Info_ClearChoices(dia_tandor_equipment);
};


instance DIA_TANDOR_KAP3_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap3_exit_condition;
	information = dia_tandor_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_tandor_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_KAP4_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap4_exit_condition;
	information = dia_tandor_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_tandor_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_NEWS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 40;
	condition = dia_tandor_news_condition;
	information = dia_tandor_news_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_tandor_news_condition()
{
	if((KAPITEL == 4) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_news_info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//Nìco nového?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//V poslední dobì se stala jediná vìc - pøišli drakobijci.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//Pøijeli drakobijci.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//Vypadají jako pìknì tvrdí parchanti - a to doufám jsou, protože jinak moc dlouho nevydrží.
	};
};


instance DIA_TANDOR_KAP5_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap5_exit_condition;
	information = dia_tandor_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_tandor_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_WASISTLOS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 51;
	condition = dia_tandor_wasistlos_condition;
	information = dia_tandor_wasistlos_info;
	permanent = TRUE;
	description = "Netváøíš se zrovna šastnì.";
};


func int dia_tandor_wasistlos_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_wasistlos_info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//Netváøíš se zrovna šastnì.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//Skøetù bude stále víc a víc. Dokud nebude po nás.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//Už týden jsem poøádnì nejedl. Mám hlad jako vlk.
	};
};


instance DIA_TANDOR_KAP6_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap6_exit_condition;
	information = dia_tandor_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_tandor_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_PICKPOCKET(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_pickpocket_condition;
	information = dia_tandor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_tandor_pickpocket_condition()
{
	return c_beklauen(47,90);
};

func void dia_tandor_pickpocket_info()
{
	Info_ClearChoices(dia_tandor_pickpocket);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_BACK,dia_tandor_pickpocket_back);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_PICKPOCKET,dia_tandor_pickpocket_doit);
};

func void dia_tandor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tandor_pickpocket);
};

func void dia_tandor_pickpocket_back()
{
	Info_ClearChoices(dia_tandor_pickpocket);
};

