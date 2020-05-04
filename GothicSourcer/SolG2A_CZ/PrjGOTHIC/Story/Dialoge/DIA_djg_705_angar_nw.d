
instance DIA_ANGAR_NW_KAP5_EXIT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 999;
	condition = dia_angar_nw_kap5_exit_condition;
	information = dia_angar_nw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_nw_kap5_exit_condition()
{
	return TRUE;
};

func void dia_angar_nw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 59;
	condition = dia_angar_nw_alldragonsdead_condition;
	information = dia_angar_nw_alldragonsdead_info;
	description = "Jak se vede?";
};


func int dia_angar_nw_alldragonsdead_condition()
{
	return TRUE;
};

func void dia_angar_nw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Docela dob¯e. Ale po¯·d m·m ty öÌlenÈ bolesti. I kdyû od tÈ doby, co nejsem v HornickÈm ˙dolÌ, se to dost zlepöilo.
	if(ANGAR_ISONBOARD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Z˘stanu tady. Takûe kdybys mÏ pot¯eboval, vÌö, kde mÏ hledat.
	};
};


instance DIA_ANGAR_NW_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_knowwhereenemy_condition;
	information = dia_angar_nw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Chyst·m se opustit Khorinis. Chceö se p¯idat?";
};


func int dia_angar_nw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (ANGAR_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_angar_nw_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_angar_nw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Chyst·m se opustit Khorinis. Chceö se p¯idat?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//»Ìm d·l budu od HornickÈho ˙dolÌ, tÌm lÌp. Kdy vyrazÌme?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Angar je r·d za kaûdou mÌli, o kterou se vzd·lÌ od HornickÈho ˙dolÌ. NabÌdl mi, ûe mÏ na cestÏ doprovodÌ.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Moment·lnÏ m·m dost lidÌ na to, aby mohli ¯Ìdit loÔ. Moûn· se k tobÏ pozdÏji jeötÏ vr·tÌm.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Fajn. Budu tady, kdybys mÏ pot¯eboval.
	}
	else
	{
		Info_ClearChoices(dia_angar_nw_knowwhereenemy);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"D·m ti vÏdÏt, aû budeme vyplouvat.",dia_angar_nw_knowwhereenemy_no);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"Zajdi tedy do p¯Ìstavu. Pak se tam potk·me.",dia_angar_nw_knowwhereenemy_yes);
	};
};

func void dia_angar_nw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Zajdi tedy do p¯Ìstavu. Pak se tam potk·me.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//To se mi lÌbÌ.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};

func void dia_angar_nw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//D·m ti vÏdÏt, aû budeme vyplouvat.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Dobr·.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};


instance DIA_ANGAR_NW_LEAVEMYSHIP(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_leavemyship_condition;
	information = dia_angar_nw_leavemyship_info;
	permanent = TRUE;
	description = "Z˘staÚ tady a starej se o svÈ problÈmy.";
};


func int dia_angar_nw_leavemyship_condition()
{
	if((ANGAR_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_leavemyship_info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Z˘staÚ tady a starej se o svÈ problÈmy.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Dobr·. Vr·tÌm se. Moûn· to bude tak lepöÌ.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_NW_STILLNEEDYOU(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_stillneedyou_condition;
	information = dia_angar_nw_stillneedyou_info;
	permanent = TRUE;
	description = "Vraù se na palubu.";
};


func int dia_angar_nw_stillneedyou_condition()
{
	if(((ANGAR_ISONBOARD == LOG_OBSOLETE) || (ANGAR_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_angar_nw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Vraù se na palubu.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Jsi horöÌ neû j·. Trochu vÌc rozhodnosti by ti jen prospÏlo. JeötÏ se uvidÌme.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
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


instance DIA_ANGAR_NW_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 900;
	condition = dia_angar_nw_pickpocket_condition;
	information = dia_angar_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_nw_pickpocket_condition()
{
	return c_beklauen(47,34);
};

func void dia_angar_nw_pickpocket_info()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_BACK,dia_angar_nw_pickpocket_back);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_PICKPOCKET,dia_angar_nw_pickpocket_doit);
};

func void dia_angar_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_nw_pickpocket);
};

func void dia_angar_nw_pickpocket_back()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
};


instance DIA_ANGAR_NW_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 7;
	condition = dia_angar_nw_foundamulett_condition;
	information = dia_angar_nw_foundamulett_info;
	description = "Naöel jsem tv˘j amulet.";
};


func int dia_angar_nw_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_foundamulett_info()
{
	b_angarsamulettabgeben();
};

