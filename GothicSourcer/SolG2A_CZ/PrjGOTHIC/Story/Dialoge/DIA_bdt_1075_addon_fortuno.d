
instance DIA_ADDON_FORTUNO_EXIT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 999;
	condition = dia_addon_fortuno_exit_condition;
	information = dia_addon_fortuno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_addon_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FORTUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 900;
	condition = dia_addon_fortuno_pickpocket_condition;
	information = dia_addon_fortuno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_fortuno_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_addon_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_BACK,dia_addon_fortuno_pickpocket_back);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_PICKPOCKET,dia_addon_fortuno_pickpocket_doit);
};

func void dia_addon_fortuno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};

func void dia_addon_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};


instance DIA_ADDON_FORTUNO_HI(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_hi_condition;
	information = dia_addon_fortuno_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_fortuno_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (FORTUNO_GEHEILT_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_hi_info()
{
	if(FORTUNO_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(vystrašenì) Èerný mrak nad domem ... ON pøichází ...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//S krví ... pøivolává ho ... ON mì sleduje ... on mì sleduje ... oh ne, ztra se, vypadni ...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Jsi v poøádku?
		FORTUNO_EINMAL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_FORTUNO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno je mimo. Potøebuje 'Zeleného Novice'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zelený ... zelený novic ... nemùžu ho najít ...
	Info_ClearChoices(dia_addon_fortuno_hi);
	Info_AddChoice(dia_addon_fortuno_hi,"Vrátím se pozdìji...(konec)",dia_addon_fortuno_hi_back);
	Info_AddChoice(dia_addon_fortuno_hi,"Mùžu ti pomoci?",dia_addon_fortuno_hi_hilfe);
	if(Npc_HasItems(other,itmi_joint) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Tady, vezmi si tohle stéblo.",dia_addon_fortuno_hi_joint);
	};
	if(Npc_HasItems(other,itmi_addon_joint_01) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Ok, zkus tohle - 'Zelený Novic'.",dia_addon_fortuno_hi_green);
	};
};

func void dia_addon_fortuno_hi_back()
{
	Info_ClearChoices(dia_addon_fortuno_hi);
	AI_StopProcessInfos(self);
};

func void dia_addon_fortuno_hi_hilfe()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//Mùžu ti pomoci?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//zelený ... zelený novic pomáhá novicùm ...
};

func void dia_addon_fortuno_hi_joint()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Tady, vezmi si tohle stéblo.
	if(b_giveinvitems(other,self,itmi_joint,1))
	{
		AI_UseItem(self,itmi_joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Není zelený, není silný, není zelený, není silný ...
};

func void dia_addon_fortuno_hi_green()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Ok, zkus tohle - 'Zelený Novic'.
	if(b_giveinvitems(other,self,itmi_addon_joint_01,1))
	{
		AI_UseItem(self,itmi_addon_joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(vyléèený) AAAHHH ...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moje myšlenky ... kdo ... jsem ... Fortuno ... co ... co se dìje?
	Info_ClearChoices(dia_addon_fortuno_hi);
	FORTUNO_GEHEILT_01 = TRUE;
	b_giveplayerxp(XP_ADDON_FORTUNO_01);
	b_logentry(TOPIC_ADDON_FORTUNO,"'Zelený Novic' obnovil Fortunovy smysly.");
};


instance DIA_ADDON_FORTUNO_WER(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_wer_condition;
	information = dia_addon_fortuno_wer_info;
	permanent = FALSE;
	description = "Ok, teï mi øekni, co s tebou je.";
};


func int dia_addon_fortuno_wer_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Ok, teï mi øekni, co s tebou je.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Jednou jsem byl èlenem Bratrstva Spáèe. Na cestì zpìt bylo ještì vše v poøádku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Jistì, všichni jsme byli pøesvìdèení kriminálníci, ale život byl pro nás novice celkem dobrý ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, já jsem byl také vìzeò dùlní kolonie. Øekni mi nìco, co ještì nevím.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//Já ... nic si nepamatuju. Temnota zastøela moji mysl ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//No tak. Zkus se soustøedit. Co se stalo? Jak mùžeš znovu získat vìdomí?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven ... pamatuju si jenom na Ravena a ... temné pokoje.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//Co je s Ravenem? Co ti udìlal?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(vzdychá) Omlouvám se. Vypadá to, jako by byla moje mysl uvìznìna ... Sám tomu nerozumím ...
};


instance DIA_ADDON_FORTUNO_FREE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 5;
	condition = dia_addon_fortuno_free_condition;
	information = dia_addon_fortuno_free_info;
	permanent = FALSE;
	description = "Musí existovat cesta jak ti vrátit vzpomínky.";
};


func int dia_addon_fortuno_free_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_wer))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_free_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Musí existovat cesta jak ti vrátit vzpomínky.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm ... jo, možná by to šlo.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali všechno možné o manipulaci s myslí.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY o tom nìco víš?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Ne, bojím se, že tyto znalosti už jsou pryè ...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Kruci. Jestli je tady cesta jak ti pomoci, najdu ji.
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno už je duševnì v poøádku, stále si ale nic nepamatuje.");
};


instance DIA_ADDON_FORTUNO_HERB(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 99;
	condition = dia_addon_fortuno_herb_condition;
	information = dia_addon_fortuno_herb_info;
	permanent = FALSE;
	description = "Potøebuješ další stébla?";
};


func int dia_addon_fortuno_herb_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_herb_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Potøebuješ další stébla?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//No jooo. Vezmu si všechny, co máš.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Dokonce zaplatím více než Fisk.
};

func void b_fortuno_infomanager()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
	Info_AddChoice(dia_addon_fortuno_trade,DIALOG_BACK,dia_addon_fortuno_trade_back);
	if(Npc_HasItems(other,itpl_swampherb) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_trade,"(Pøedat všechny stébla)",dia_addon_fortuno_trade_all);
		Info_AddChoice(dia_addon_fortuno_trade,"(Pøedat jedno stéblo)",dia_addon_fortuno_trade_1);
	};
};


instance DIA_ADDON_FORTUNO_TRADE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 100;
	condition = dia_addon_fortuno_trade_condition;
	information = dia_addon_fortuno_trade_info;
	permanent = TRUE;
	description = "Mám pro tebe nìjaká stébla ...";
};


func int dia_addon_fortuno_trade_condition()
{
	if((Npc_HasItems(other,itpl_swampherb) >= 1) && Npc_KnowsInfo(other,dia_addon_fortuno_herb))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//Mám pro tebe nìjaká stébla ...
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_back()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
};

func void dia_addon_fortuno_trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,itpl_swampherb);
	if(b_giveinvitems(other,self,itpl_swampherb,amount))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,amount * VALUE_SWAMPHERB);
	b_giveplayerxp(amount * 10);
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_1()
{
	if(b_giveinvitems(other,self,itpl_swampherb,1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,VALUE_SWAMPHERB);
	b_giveplayerxp(10);
	b_fortuno_infomanager();
};


instance DIA_ADDON_FORTUNO_TRANK(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 3;
	condition = dia_addon_fortuno_trank_condition;
	information = dia_addon_fortuno_trank_info;
	permanent = FALSE;
	description = "Mám pro tebe tenhle lektvar ...";
};


func int dia_addon_fortuno_trank_condition()
{
	if((FORTUNO_GEHEILT_01 == TRUE) && Npc_KnowsInfo(other,dia_addon_fortuno_free) && ((Npc_HasItems(other,itpo_addon_geist_01) >= 1) || (Npc_HasItems(other,itpo_addon_geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//Mám pro tebe tenhle lektvar. Mìl by ti vrátit vzpomínky.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Budu ti vìøit ...
	if(Npc_HasItems(other,itpo_addon_geist_02) >= 1)
	{
		if(b_giveinvitems(other,self,itpo_addon_geist_02,1))
		{
			AI_UseItem(self,itpo_addon_geist_02);
		};
		b_giveplayerxp(XP_ADDON_FORTUNO_02);
	}
	else if(b_giveinvitems(other,self,itpo_addon_geist_01,1))
	{
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,itpo_addon_geist_01);
	};
};


instance DIA_ADDON_FORTUNO_MORE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_more_condition;
	information = dia_addon_fortuno_more_info;
	permanent = FALSE;
	description = "No ...?";
};


func int dia_addon_fortuno_more_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_more_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No ...?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Aáá! Já ... já si pamatuju! Vidím ... Adanos mi pomohl ... co mám udìlat!?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Jo, co máš udìlat? A hlavnì, co má Raven udìlat?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomohl jsem mu ... navázat kontakt. JEMU. Chtìl hodnì lektvarù ... Vaøil jsem mu je.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Snažil se otevøít portál aby se dostal do chrámu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Proè? Co chtìl dìlat v chrámu?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Mocný artefakt ... lži znièí každého kdo by ho chtìl ovládat. Mocný váleèník bude ten, kdo se mu podvolí ...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//A ... ?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nepodaøilo se nám otevøít portál ...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Nicménì, Raven byl pøesvìdèený, že ho otevøe, POKUD odkryje hrobku knìzù.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//A to je ten dùvod, proè sem dotáhl všechny ty otroky. Loutky, které tu budou pøinuceny kopat.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Hrobka knìzù?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Hrobka Adanosova knìze. Je v dole.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Také si pamatuju na nìjaké kamenné tabulky. Raven vìøí, že mu ukážou cestu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Nakonec se mu povedlo rozluštit nápis a já se pro nìho stal pøebyteèným.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Zaèaroval mì abych všechno zapomnìl. A ty jsi mì osvobodil.
	SC_KNOWSFORTUNOINFOS = TRUE;
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven plánuje získat nìjaký mocný artefakt z chrámu.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Z nìjakého dùvodu vykopal Raven ve zlatém dole hrob jednoho z knìzù staré kultury.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Raven vìøí, že nìkteré kamenné tabulky mu pomùžou.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_ADDON_FORTUNO_03);
};


instance DIA_ADDON_FORTUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 9;
	condition = dia_addon_fortuno_attentat_condition;
	information = dia_addon_fortuno_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fortuno_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pokus o vraždu? Promiò, nebyl jsem ... pøítomen. Nevím o tom nic.
};

