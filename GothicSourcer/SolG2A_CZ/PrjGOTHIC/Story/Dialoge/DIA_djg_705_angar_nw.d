
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
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Docela dob�e. Ale po��d m�m ty ��len� bolesti. I kdy� od t� doby, co nejsem v Hornick�m �dol�, se to dost zlep�ilo.
	if(ANGAR_ISONBOARD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Z�stanu tady. Tak�e kdybys m� pot�eboval, v�, kde m� hledat.
	};
};


instance DIA_ANGAR_NW_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_knowwhereenemy_condition;
	information = dia_angar_nw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Chyst�m se opustit Khorinis. Chce� se p�idat?";
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
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Chyst�m se opustit Khorinis. Chce� se p�idat?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//��m d�l budu od Hornick�ho �dol�, t�m l�p. Kdy vyraz�me?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Angar je r�d za ka�dou m�li, o kterou se vzd�l� od Hornick�ho �dol�. Nab�dl mi, �e m� na cest� doprovod�.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Moment�ln� m�m dost lid� na to, aby mohli ��dit lo�. Mo�n� se k tob� pozd�ji je�t� vr�t�m.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Fajn. Budu tady, kdybys m� pot�eboval.
	}
	else
	{
		Info_ClearChoices(dia_angar_nw_knowwhereenemy);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"D�m ti v�d�t, a� budeme vyplouvat.",dia_angar_nw_knowwhereenemy_no);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"Zajdi tedy do p��stavu. Pak se tam potk�me.",dia_angar_nw_knowwhereenemy_yes);
	};
};

func void dia_angar_nw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Zajdi tedy do p��stavu. Pak se tam potk�me.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//To se mi l�b�.
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
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//D�m ti v�d�t, a� budeme vyplouvat.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Dobr�.
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
	description = "Z�sta� tady a starej se o sv� probl�my.";
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
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Z�sta� tady a starej se o sv� probl�my.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Dobr�. Vr�t�m se. Mo�n� to bude tak lep��.
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
	description = "Vra� se na palubu.";
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
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Vra� se na palubu.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Jsi hor�� ne� j�. Trochu v�c rozhodnosti by ti jen prosp�lo. Je�t� se uvid�me.
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
	description = "Na�el jsem tv�j amulet.";
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

