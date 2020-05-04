
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
	AI_Output(self,other,"DIA_Egill_HALLO_08_01");	//Uû je to hodnÏ dlouho, co jsme na naöem pozemku naposledy vidÏli nÏjakÈho cizince, co n·s nechtÏl st·hnout z k˘ûe.
	AI_Output(self,other,"DIA_Egill_HALLO_08_02");	//Douf·m, ûe se v tobÏ nem˝lÌm.
	AI_Output(self,other,"DIA_Egill_HALLO_08_03");	//Jsem Egill.
	if(Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim))
	{
		AI_Output(self,other,"DIA_Egill_HALLO_08_04");	//A t·mhle ten divnej pt·Ëek je m˘j bratr Ehnim.
	};
};


instance DIA_EGILL_FELDARBEIT(C_INFO)
{
	npc = bau_945_egill;
	nr = 4;
	condition = dia_egill_feldarbeit_condition;
	information = dia_egill_feldarbeit_info;
	description = "Jak jdou polnÌ pr·ce?";
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
	AI_Output(other,self,"DIA_Egill_FELDARBEIT_15_00");	//Jak jdou polnÌ pr·ce?
	AI_Output(self,other,"DIA_Egill_FELDARBEIT_08_01");	//V˝bornÏ. Kdyby ty mizern˝ polnÌ ök˘dci po¯·d neniËili naöi ˙rodu...
};


instance DIA_EGILL_FELDRAEUBER(C_INFO)
{
	npc = bau_945_egill;
	nr = 5;
	condition = dia_egill_feldraeuber_condition;
	information = dia_egill_feldraeuber_info;
	description = "ProË s tÏmi ök˘dci nÏco neudÏl·te?";
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
	AI_Output(other,self,"DIA_Egill_FELDRAEUBER_15_00");	//ProË s tÏmi ök˘dci nÏco neudÏl·te?
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_01");	//Si dÏl·ö srandu. Od t˝ doby, co jsem na t˝hle farmÏ, uû jsem jich zabil tolik, ûe uû to ani nespoËÌt·m.
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_02");	//Ale bohuûel, vûdycky p¯ijdou dalöÌ.
};


instance DIA_EGILL_STREIT2(C_INFO)
{
	npc = bau_945_egill;
	nr = 6;
	condition = dia_egill_streit2_condition;
	information = dia_egill_streit2_info;
	description = "Tv˘j bratr mi vypr·vÏl nÏco podobn˝ho.";
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
	AI_Output(other,self,"DIA_Egill_STREIT2_15_00");	//Tv˘j bratr mi vypr·vÏl nÏco podobn˝ho.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_01");	//(prohnanÏ) Aha. Co p¯esnÏ ¯Ìkal?
	AI_Output(other,self,"DIA_Egill_STREIT2_15_02");	//ée taky sejmul spoustu polnÌch ök˘dc˘.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_03");	//Co? Ten b¯Ìdil nedok·ûe s·m ani najÌt cestu dom˘.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_04");	//ÿekni mu, ûe se takhle nem˘ûe vytahovat.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_STREIT4(C_INFO)
{
	npc = bau_945_egill;
	nr = 7;
	condition = dia_egill_streit4_condition;
	information = dia_egill_streit4_info;
	description = "Ehnim je kv˘li tomu trochu naötvanej.";
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
	AI_Output(other,self,"DIA_Egill_STREIT4_15_00");	//Ehnim je kv˘li tomu trochu naötvanej.
	AI_Output(self,other,"DIA_Egill_STREIT4_08_01");	//Aù se tak nenaparuje, nebo mu utrhnu hlavu. ÿekni mu to.
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
	AI_Output(self,other,"DIA_Egill_PERMKAP1_08_00");	//NenadÏlal uû jsi dost ökody? M·m dojem, ûe bys mÏl vypadnout. Hned.
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

