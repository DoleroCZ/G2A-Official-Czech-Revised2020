
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
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_00");	//A� dote� jsem byli schopni udr�et si sk�ety od t�la. Ale v sou�asnosti je jich tu ��m d�l v�c.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_01");	//U� n�m nepom��e ani domobrana. Chod� si sem z m�sta jen proto, aby n�m sebrali �rodu a dobytek.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_02");	//Onar asi nen� p�i smyslech, �e se m�stu postavil te�, kdy� tu jsou paladinov�.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_out_13(var C_NPC slf)
{
	dia_out_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_13_standard.npc = Hlp_GetInstanceID(slf);
};

