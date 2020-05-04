
instance DIA_EGILL_EXIT(C_INFO)
{
	npc = bau_945_egill;
	nr = 999;
	condition = dia_egill_exit_condition;
	information = dia_egill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_egill_exit_condition()
{
	return TRUE;
};

func void dia_egill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_HALLO(C_INFO)
{
	npc = bau_945_egill;
	nr = 3;
	condition = dia_egill_hallo_condition;
	information = dia_egill_hallo_info;
	description = "Co se stalo?";
};


func int dia_egill_hallo_condition()
{
	return TRUE;
};

func void dia_egill_hallo_info()
{
	AI_Output(other,self,"DIA_Egill_HALLO_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Egill_HALLO_08_01");	//U� je to hodn� dlouho, co jsme na na�em pozemku naposledy vid�li n�jak�ho cizince, co n�s necht�l st�hnout z k��e.
	AI_Output(self,other,"DIA_Egill_HALLO_08_02");	//Douf�m, �e se v tob� nem�l�m.
	AI_Output(self,other,"DIA_Egill_HALLO_08_03");	//Jsem Egill.
	if(Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim))
	{
		AI_Output(self,other,"DIA_Egill_HALLO_08_04");	//A t�mhle ten divnej pt��ek je m�j bratr Ehnim.
	};
};


instance DIA_EGILL_FELDARBEIT(C_INFO)
{
	npc = bau_945_egill;
	nr = 4;
	condition = dia_egill_feldarbeit_condition;
	information = dia_egill_feldarbeit_info;
	description = "Jak jdou poln� pr�ce?";
};


func int dia_egill_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_hallo))
	{
		return TRUE;
	};
};

func void dia_egill_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Egill_FELDARBEIT_15_00");	//Jak jdou poln� pr�ce?
	AI_Output(self,other,"DIA_Egill_FELDARBEIT_08_01");	//V�born�. Kdyby ty mizern� poln� �k�dci po��d neni�ili na�i �rodu...
};


instance DIA_EGILL_FELDRAEUBER(C_INFO)
{
	npc = bau_945_egill;
	nr = 5;
	condition = dia_egill_feldraeuber_condition;
	information = dia_egill_feldraeuber_info;
	description = "Pro� s t�mi �k�dci n�co neud�l�te?";
};


func int dia_egill_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_egill_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Egill_FELDRAEUBER_15_00");	//Pro� s t�mi �k�dci n�co neud�l�te?
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_01");	//Si d�l� srandu. Od t� doby, co jsem na t�hle farm�, u� jsem jich zabil tolik, �e u� to ani nespo��t�m.
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_02");	//Ale bohu�el, v�dycky p�ijdou dal��.
};


instance DIA_EGILL_STREIT2(C_INFO)
{
	npc = bau_945_egill;
	nr = 6;
	condition = dia_egill_streit2_condition;
	information = dia_egill_streit2_info;
	description = "Tv�j bratr mi vypr�v�l n�co podobn�ho.";
};


func int dia_egill_streit2_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim)))
	{
		return TRUE;
	};
};

func void dia_egill_streit2_info()
{
	AI_Output(other,self,"DIA_Egill_STREIT2_15_00");	//Tv�j bratr mi vypr�v�l n�co podobn�ho.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_01");	//(prohnan�) Aha. Co p�esn� ��kal?
	AI_Output(other,self,"DIA_Egill_STREIT2_15_02");	//�e taky sejmul spoustu poln�ch �k�dc�.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_03");	//Co? Ten b��dil nedok�e s�m ani naj�t cestu dom�.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_04");	//�ekni mu, �e se takhle nem��e vytahovat.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_STREIT4(C_INFO)
{
	npc = bau_945_egill;
	nr = 7;
	condition = dia_egill_streit4_condition;
	information = dia_egill_streit4_info;
	description = "Ehnim je kv�li tomu trochu na�tvanej.";
};


func int dia_egill_streit4_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_streit3) && (Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim)))
	{
		return TRUE;
	};
};

func void dia_egill_streit4_info()
{
	AI_Output(other,self,"DIA_Egill_STREIT4_15_00");	//Ehnim je kv�li tomu trochu na�tvanej.
	AI_Output(self,other,"DIA_Egill_STREIT4_08_01");	//A� se tak nenaparuje, nebo mu utrhnu hlavu. �ekni mu to.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_PERMKAP1(C_INFO)
{
	npc = bau_945_egill;
	condition = dia_egill_permkap1_condition;
	information = dia_egill_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_egill_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_egill_permkap1_info()
{
	AI_Output(self,other,"DIA_Egill_PERMKAP1_08_00");	//Nenad�lal u� jsi dost �kody? M�m dojem, �e bys m�l vypadnout. Hned.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_PICKPOCKET(C_INFO)
{
	npc = bau_945_egill;
	nr = 900;
	condition = dia_egill_pickpocket_condition;
	information = dia_egill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_egill_pickpocket_condition()
{
	return c_beklauen(45,24);
};

func void dia_egill_pickpocket_info()
{
	Info_ClearChoices(dia_egill_pickpocket);
	Info_AddChoice(dia_egill_pickpocket,DIALOG_BACK,dia_egill_pickpocket_back);
	Info_AddChoice(dia_egill_pickpocket,DIALOG_PICKPOCKET,dia_egill_pickpocket_doit);
};

func void dia_egill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_egill_pickpocket);
};

func void dia_egill_pickpocket_back()
{
	Info_ClearChoices(dia_egill_pickpocket);
};

