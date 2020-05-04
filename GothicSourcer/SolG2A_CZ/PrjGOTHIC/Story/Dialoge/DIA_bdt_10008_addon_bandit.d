
instance ADDON_10008_BANDIT_EXIT(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 999;
	condition = addon_10008_bandit_exit_condition;
	information = addon_10008_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int addon_10008_bandit_exit_condition()
{
	return TRUE;
};

func void addon_10008_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_10008_BANDIT_PICKPOCKET(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 900;
	condition = dia_addon_10008_bandit_pickpocket_condition;
	information = dia_addon_10008_bandit_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_10008_bandit_pickpocket_condition()
{
	return c_beklauen(55,99);
};

func void dia_addon_10008_bandit_pickpocket_info()
{
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
	Info_AddChoice(dia_addon_10008_bandit_pickpocket,DIALOG_BACK,dia_addon_10008_bandit_pickpocket_back);
	Info_AddChoice(dia_addon_10008_bandit_pickpocket,DIALOG_PICKPOCKET,dia_addon_10008_bandit_pickpocket_doit);
};

func void dia_addon_10008_bandit_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
};

func void dia_addon_10008_bandit_pickpocket_back()
{
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
};


instance DIA_ADDON_10008_BANDIT_HI(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 2;
	condition = dia_addon_10008_bandit_hi_condition;
	information = dia_addon_10008_bandit_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10008_bandit_hi_condition()
{
	if((Npc_GetDistToNpc(other,skinner) <= 600) && !Npc_IsDead(skinner) && (skinner.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_10008_bandit_hi_info()
{
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_00");	//NEBUÏ HO!
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Hi_15_01");	//Cože???
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_02");	//Jestli chceš sám sobì udìlat laskavost, vyhýbej se Skinnerovi.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_03");	//Ten hoch je nepøedvídatelný. Zabil posledního chlápka, co se ho snažil vzbudit.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_04");	//Nech ho spát, je to nejlepší pro každého.
};


instance DIA_ADDON_10008_BANDIT_SOUP(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 2;
	condition = dia_addon_10008_bandit_soup_condition;
	information = dia_addon_10008_bandit_soup_info;
	permanent = FALSE;
	description = "Ty jsi kopáè?";
};


func int dia_addon_10008_bandit_soup_condition()
{
	return TRUE;
};

func void dia_addon_10008_bandit_soup_info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_soup_15_00");	//Ty jsi kopáè?
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_01");	//Kvùli kalhotùm? Ne, já je nosím, protože jsou pohodlné.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_02");	//Já vaøím jen masovou polévku, zde, zkus to - budeš silnìjší.
	b_giveinvitems(self,other,itfo_addon_meatsoup,1);
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_03");	//Je dùležité cvièit tvoji sílu - venku tì èeká mnoho nebezpeèí.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_04");	//Jestli chceš, pomùžu ti zvednout tvoji sílu.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Bandita u kuchaøského hrnce mi mùže pomoci cvièit mou sílu.");
};


instance DIA_ADDON_10008_BANDIT_TEACH(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 7;
	condition = dia_addon_10008_bandit_teach_condition;
	information = dia_addon_10008_bandit_teach_info;
	permanent = TRUE;
	description = "Chci se stát silnìjším.";
};


func int dia_addon_10008_bandit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_10008_bandit_soup))
	{
		return TRUE;
	};
};

func void dia_addon_10008_bandit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Teach_15_00");	//Chci se stát silnìjším.
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

func void dia_addon_10008_bandit_teach_back()
{
	Info_ClearChoices(dia_addon_10008_bandit_teach);
};

func void dia_addon_10008_bandit_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

func void dia_addon_10008_bandit_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

