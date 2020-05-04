
instance DIA_STRF_1107_EXIT(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 999;
	condition = dia_strf_1107_exit_condition;
	information = dia_strf_1107_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_1107_exit_condition()
{
	return TRUE;
};

func void dia_strf_1107_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_finger_condition;
	information = dia_strf_1107_finger_info;
	important = TRUE;
};


func int dia_strf_1107_finger_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_1107_finger_info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Od mých hrncù ruce pryè! Nikdo se mých hrncù nesmí ani dotknout, jasný?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Jsem zodpovìdný za jídlo, a to znamená, že nikdo jiný tady nemá co dìlat! Doufám, že jsem se vyjádøil jasnì!
};


instance DIA_STRF_1107_COOK(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_cook_condition;
	information = dia_strf_1107_cook_info;
	description = "Kdo z tebe udìlal kuchaøe?";
};


func int dia_strf_1107_cook_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cook_info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kdo z tebe udìlal kuchaøe?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Byl to velitel Garond. Než jsem stal trestancem, býval jsem kuchaøem U divoèáka.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//A za co tì zavøeli?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Bylo to takový menší nedorozumìní mezi hostem, sekáèkem na maso a mnou.
};


instance DIA_STRF_1107_PERM(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 900;
	condition = dia_strf_1107_perm_condition;
	information = dia_strf_1107_perm_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_strf_1107_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Nìco nového?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jestli se chceš dozvìdìt nìjaký novinky, promluv si s rytíøi. Já tady jen vaøím.
};

