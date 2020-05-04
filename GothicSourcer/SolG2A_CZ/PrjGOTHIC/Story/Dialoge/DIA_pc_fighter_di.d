
instance DIA_GORN_DI_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_di;
	nr = 999;
	condition = dia_gorn_di_kap5_exit_condition;
	information = dia_gorn_di_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorn_di_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gorn_di_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORN_DI_HALLO(C_INFO)
{
	npc = pc_fighter_di;
	nr = 2;
	condition = dia_gorn_di_hallo_condition;
	information = dia_gorn_di_hallo_info;
	permanent = TRUE;
	description = "V�echno v po��dku?";
};


func int dia_gorn_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_gorn_di_hallo_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//V�echno v po��dku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//Zat�m ano. Nezapome�, �e bych cht�l vid�t n�jakou po��dnou akci.
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//Je tam naho�e v�c sk�et�? Zave� je ke mn�. Pr�v� se za��n�m dost�vat do n�lady.
	};
};


instance DIA_GORN_DI_TEACH(C_INFO)
{
	npc = pc_fighter_di;
	nr = 10;
	condition = dia_gorn_di_teach_condition;
	information = dia_gorn_di_teach_info;
	permanent = TRUE;
	description = "Pot�ebuji v�cvik.";
};


func int dia_gorn_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_gorn_di_teach_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Pot�ebuji v�cvik.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//To nem��e u�kodit.
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//No. B�val jsi lep��.
	};
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Dr� zbra� o n�co v��. Tenhle kryt by prorazil i slepec svou hol�.
	};
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_back()
{
	Info_ClearChoices(dia_gorn_di_teach);
};


instance DIA_GORN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_fighter_di;
	nr = 2;
	condition = dia_gorn_di_undeaddragondead_condition;
	information = dia_gorn_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Z�stal jsi u lodi?";
};


func int dia_gorn_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_gorn_di_undeaddragondead_onetime;

func void dia_gorn_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//Z�stal jsi u lodi?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//Samoz�ejm�. Jen si p�edstav, co by se stalo, kdyby tady u� nebyla.
	if(DIA_GORN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//Co bude te�?
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//Nic nebude. Chci dom�.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//(sm�je se) Dom�? A kde to m� b�t? Pokud v�m, nic takov�ho t� ne�ek�.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//Nech m� h�dat. Zapadneme do dal�� hospody a zt��sk�me se do n�moty.
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//Hmm. Mo�n�.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//Hej, u� toho nech, chlape. Je po v�em.
		};
		DIA_GORN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	if(Npc_KnowsInfo(other,dia_biff_di_plunder))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//N�kdo to mus� vy��dit Biffovi, jinak na tomhle ostrov� shnije.
		if(Npc_IsDead(biff_di) == FALSE)
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//Vr�t� se v�as.
		};
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//U� tady nem�me co pohled�vat. �ekni kapit�novi, aby se p�ipravil k vyplut�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_FIGHTER_DI_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_di;
	nr = 900;
	condition = dia_fighter_di_pickpocket_condition;
	information = dia_fighter_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_di_pickpocket_condition()
{
	return c_beklauen(10,45);
};

func void dia_fighter_di_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_di_pickpocket);
	Info_AddChoice(dia_fighter_di_pickpocket,DIALOG_BACK,dia_fighter_di_pickpocket_back);
	Info_AddChoice(dia_fighter_di_pickpocket,DIALOG_PICKPOCKET,dia_fighter_di_pickpocket_doit);
};

func void dia_fighter_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_di_pickpocket);
};

func void dia_fighter_di_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_di_pickpocket);
};

