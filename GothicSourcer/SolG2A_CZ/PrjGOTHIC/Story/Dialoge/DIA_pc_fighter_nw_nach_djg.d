
instance DIA_GORNNW_NACH_DJG_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 999;
	condition = dia_gornnw_nach_djg_kap5_exit_condition;
	information = dia_gornnw_nach_djg_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_nach_djg_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_nach_djg_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_NACH_DJG_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 59;
	condition = dia_gornnw_nach_djg_alldragonsdead_condition;
	information = dia_gornnw_nach_djg_alldragonsdead_info;
	permanent = TRUE;
	description = "OdpoËinul sis?";
};


func int dia_gornnw_nach_djg_alldragonsdead_condition()
{
	if(GORN_ISONBOARD != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//OdpoËinul sis?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//JasnÏ, proË ne? Draci jsou mrtvÌ, ne?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Je to troöku sloûitÏjöÌ.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(zasmÏje se) JasnÏ. Jako vûdycky. Dej mi vÏdÏt, aû budeö pot¯ebovat mou sekeru.
};


instance DIA_GORNNW_NACH_DJG_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_knowwhereenemy_condition;
	information = dia_gornnw_nach_djg_knowwhereenemy_info;
	permanent = TRUE;
	description = "MÏl bych pro tebe a tvou sekeru nÏjakou pr·ci.";
};


func int dia_gornnw_nach_djg_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (GORN_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//MÏl bych pro tebe a tvou sekeru nÏjakou pr·ci.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Jasan. Nep¯ekvapuje mÏ to. Co pro tebe m˘ûu udÏlat?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Plul bys se mnou na jeden ostrov a natrhnul tam zadek p·r nep¯·tel˘m?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(zasmÏje se) JasnÏ. KlidnÏ hned. Jen mi ¯ekni, co je zapot¯ebÌ.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Kdyû jsem Gornovi vypr·vÏl o ostrovÏ, byl jednoznaËnÏ pro. Budu-li pot¯ebovat sekeru, mohu ho smÏle vzÌt s sebou.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Moment·lnÏ m·m v pos·dce pln˝ stav, ale r·d bych vzal s sebou i tebe.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Pokud musÌö kv˘li mÏ vykopnout nÏkoho z pos·dky, vyber toho nejslaböÌho.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//V tÏchto tÏûk˝ch Ëasech je kaûd· ruka dobr·.
	}
	else
	{
		Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"D·m ti vÏdÏt, aû bude na Ëase.",dia_gornnw_nach_djg_knowwhereenemy_no);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Popluj se mnou. PoËkej na mÏ v p¯Ìstavu.",dia_gornnw_nach_djg_knowwhereenemy_yes);
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Popluj se mnou. PoËkej na mÏ v p¯Ìstavu.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//LoÔ? Ha! Teda ¯eknu ti, ûe s tebou se jeden nikdy nenudÌ. Brzy se uvidÌme.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};

func void dia_gornnw_nach_djg_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//D·m ti vÏdÏt, aû bude na Ëase.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Dobr·.
	GORN_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};


instance DIA_GORNNW_NACH_DJG_LEAVEMYSHIP(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_leavemyship_condition;
	information = dia_gornnw_nach_djg_leavemyship_info;
	permanent = TRUE;
	description = "Moûn· bys mÏl radÏji z˘stat tady.";
};


func int dia_gornnw_nach_djg_leavemyship_condition()
{
	if((GORN_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_leavemyship_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Moûn· bys mÏl radÏji z˘stat tady.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//To tÏ m·m nechat jÌt samotnÈho? Hmm. NenÌ to pro mÏ jednoduchÈ, ale je to konec konc˘ tvoje v·lka. Pokud bys nakonec p¯ece jenom chtÏl, abych öel s tebou, klidnÏ za mnou p¯ijÔ.
	GORN_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNNW_NACH_DJG_STILLNEEDYOU(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_stillneedyou_condition;
	information = dia_gornnw_nach_djg_stillneedyou_info;
	permanent = TRUE;
	description = "Vraù se. Pot¯ebuji tÏ.";
};


func int dia_gornnw_nach_djg_stillneedyou_condition()
{
	if(((GORN_ISONBOARD == LOG_OBSOLETE) || (GORN_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_stillneedyou_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Vraù se. Pot¯ebuji tÏ.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//No tak vidÌö. A j· uû si myslel, ûe mÏ tu nech·ö shnÌt, zatÌmco si budeö s·m uûÌvat. UvidÌme se pozdÏji.
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_FIGHTER_NACH_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 900;
	condition = dia_fighter_nach_djg_pickpocket_condition;
	information = dia_fighter_nach_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_nach_djg_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_fighter_nach_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_BACK,dia_fighter_nach_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_nach_djg_pickpocket_doit);
};

func void dia_fighter_nach_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

func void dia_fighter_nach_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

