
instance DIA_328_MILIZ_EXIT(C_INFO)
{
	npc = mil_328_miliz;
	nr = 999;
	condition = dia_328_miliz_exit_condition;
	information = dia_328_miliz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_328_miliz_exit_condition()
{
	return TRUE;
};

func void dia_328_miliz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_328_MILIZ_HI(C_INFO)
{
	npc = mil_328_miliz;
	nr = 1;
	condition = dia_328_miliz_hi_condition;
	information = dia_328_miliz_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_328_miliz_hi_condition()
{
	return TRUE;
};

func void dia_328_miliz_hi_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Hele, tady nemáš co dìlat. Rozumíš?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//Po tom ti vùbec nic není! Šéfuju tomu tady, jasný?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//Šéfuješ? Èemu? Tìm bednám?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Hele, skladištì spadá pod mùj dohled, jasný? Tak vypadni, nebo si poneseš zuby v klobouku.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
};


instance DIA_328_MILIZ_KILL(C_INFO)
{
	npc = mil_328_miliz;
	nr = 2;
	condition = dia_328_miliz_kill_condition;
	information = dia_328_miliz_kill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_328_miliz_kill_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_328_miliz_kill_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Hej, ty jsi poøád ještì tady. Neøíkal jsem ti, že máš vypadnout?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Teï ti ukážu, kdo je tady šéf!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	b_attack(self,other,AR_KILL,1);
};

