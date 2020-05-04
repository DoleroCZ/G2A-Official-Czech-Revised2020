
instance DIA_GORNNW_KAP3_EXIT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 999;
	condition = dia_gornnw_kap3_exit_condition;
	information = dia_gornnw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_kap3_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_HALLO(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_hallo_condition;
	information = dia_gornnw_hallo_info;
	permanent = FALSE;
	description = "Jsi v poøádku?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//Jsi v poøádku?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//Zachránils mi krk, chlape.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//Nikdy na to nezapomenu.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Milten mì z toho dostal.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//Nikdy na to nezapomenu.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "Co budeš dìlat teï?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//Co budeš dìlat teï?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//Myslím, že se ze všeho nejdøív poøádnì nadlábnu.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//A pak?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Kdo ví... Možná se vrátím do tìžaøské kolonie.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Nìkdo by mìl dávat pozor na skøety - jinak se objeví u našeho prahu bez jediného varování.
};

