
instance DIA_JORGEN_DI_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 999;
	condition = dia_jorgen_di_kap3_exit_condition;
	information = dia_jorgen_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_hallo_condition;
	information = dia_jorgen_di_hallo_info;
	permanent = TRUE;
	description = "Je všechno v poøádku?";
};


func int dia_jorgen_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_jorgen_di_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Je všechno v poøádku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//Jasnì že jo - aspoò dokud se ty potvory od nás drží dál.
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//Další podobný skøetí útok už nepøežijeme, takže si pospìš - musíme odsud rychle zmizet.
		b_startotherroutine(jorgen_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_undeaddragondead_condition;
	information = dia_jorgen_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Nepøítel je už po smrti.";
};


func int dia_jorgen_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jorgen_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//Nepøítel je už po smrti.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//To je dobrá zpráva. Víc už jsme na tomhle ostrovì udìlat nemìli?
	Info_ClearChoices(dia_jorgen_di_undeaddragondead);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Ještì minutku - musím si tu nìco zaøídit.",dia_jorgen_di_undeaddragondead_moment);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Ano, to je ono - pojïme.",dia_jorgen_di_undeaddragondead_over);
};

func void dia_jorgen_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//Ještì minutku - musím si tu nìco zaøídit.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//Tak dobøe, ale pospìš si.
	AI_StopProcessInfos(self);
};

func void dia_jorgen_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

