
instance DIA_JACK_DI_EXIT(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 999;
	condition = dia_jack_di_exit_condition;
	information = dia_jack_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_di_exit_condition()
{
	return TRUE;
};

func void dia_jack_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_DI_GREET(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_greet_condition;
	information = dia_jack_di_greet_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_jack_di_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_jack_di_greet_onetime;

func void dia_jack_di_greet_info()
{
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//Douf�m, �e v�, co d�l�, chlap�e.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//U� to nebude trvat dlouho.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//Zachovej si chladnou hlavu a vra� se v jednom kuse.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_JACK_DI_GREET_ONETIME == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//Co tam dole d�l�?
			b_giveplayerxp(XP_AMBIENT);
			DIA_JACK_DI_GREET_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//I kdyby se m�lo samo peklo zjevit, j� tu lo� odsud dostanu. S tebou, nebo bez tebe. Sly��?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//Nic takov�ho. Jdu do toho.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//Tak to sebou ho�.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_JACK_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_undeaddragondead_condition;
	information = dia_jack_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Dok�zal jsem to. Zni�il jsem nep��tele.";
};


func int dia_jack_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jack_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//Dok�zal jsem to. Zni�il jsem nep��tele.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//Doufal jsem, �e v�echno dob�e dopadne. Ale musim p�iznat, �e posledn�ch p�r hodin jsem si t�m nebyl v�bec jistej.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//Tak u� m��em znovu vyplout?
	Info_ClearChoices(dia_jack_di_undeaddragondead);
	Info_AddChoice(dia_jack_di_undeaddragondead,"Je�t� po�kej.",dia_jack_di_undeaddragondead_moment);
	Info_AddChoice(dia_jack_di_undeaddragondead,"Ano, tak to skon�eme.",dia_jack_di_undeaddragondead_over);
};

func void dia_jack_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//Je�t� po�kej. Je tu n�co dal��ho, co mus�m ud�lat.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//Ho� sebou, jasn�? Nechci tu dostat kurd�je.
	AI_StopProcessInfos(self);
};

func void dia_jack_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

