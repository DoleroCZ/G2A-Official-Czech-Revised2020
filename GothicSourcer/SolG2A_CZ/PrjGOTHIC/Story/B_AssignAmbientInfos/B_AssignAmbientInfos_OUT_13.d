
instance DIA_OUT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_out_13_exit_condition;
	information = dia_out_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_out_13_exit_condition()
{
	return TRUE;
};

func void dia_out_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_13_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_out_13_standard_condition;
	information = dia_out_13_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_out_13_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_out_13_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_00");	//Až doteï jsem byli schopni udržet si skøety od tìla. Ale v souèasnosti je jich tu èím dál víc.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_01");	//Už nám nepomùže ani domobrana. Chodí si sem z mìsta jen proto, aby nám sebrali úrodu a dobytek.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_02");	//Onar asi není pøi smyslech, že se mìstu postavil teï, když tu jsou paladinové.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_out_13(var C_NPC slf)
{
	dia_out_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_13_standard.npc = Hlp_GetInstanceID(slf);
};

