
instance DIA_BENNET_DI_EXIT(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 999;
	condition = dia_bennet_di_exit_condition;
	information = dia_bennet_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_di_exit_condition()
{
	return TRUE;
};

func void dia_bennet_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DI_HELLO(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 10;
	condition = dia_bennet_di_hello_condition;
	information = dia_bennet_di_hello_info;
	permanent = TRUE;
	description = "V�echno klape?";
};


func int dia_bennet_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bennet_di_hello_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Hello_15_00");	//V�echno klape?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_01");	//Kov�rna na t�hle lodi je tak kapku zarezl�. M��e za to ta mo�sk� s�l. Vyrobit tam n�co komplikovan�j�� m��e b�t docela probl�m. Ale zase na druhou stranu...
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_02");	//M��eme za��dit, aby se sk�eti nevr�tili zp�t.
	};
};


instance DIA_BENNET_DI_TRADE(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 7;
	condition = dia_bennet_di_trade_condition;
	information = dia_bennet_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jak� zbran� mi m��e� prodat?";
};


func int dia_bennet_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bennet_di_trade_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Jak� zbran� mi m��e� prodat?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Pouze ty nejlep��. To p�ece v�.
};


instance DIA_BENNET_DI_SMITH(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 7;
	condition = dia_bennet_di_smith_condition;
	information = dia_bennet_di_smith_info;
	permanent = TRUE;
	description = "M��e� m� nau�it sv� um�n�?";
};


func int dia_bennet_di_smith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_di_smith_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//M��e� m� nau�it sv� um�n�?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Z�le�� na tom, co chce� d�lat.
	Info_ClearChoices(dia_bennet_di_smith);
	Info_AddChoice(dia_bennet_di_smith,DIALOG_BACK,dia_bennet_di_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring("Nau�it se kov��stv� ",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),dia_bennet_di_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),dia_bennet_di_smith_1hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),dia_bennet_di_smith_2hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),dia_bennet_di_smith_1hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),dia_bennet_di_smith_2hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),dia_bennet_di_smith_1hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),dia_bennet_di_smith_2hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_04)),dia_bennet_di_smith_1hspecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_di_smith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_04)),dia_bennet_di_smith_2hspecial4);
		};
	};
};

func void dia_bennet_di_smith_back()
{
	Info_ClearChoices(dia_bennet_di_smith);
};

func void dia_bennet_di_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void dia_bennet_di_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_di_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_di_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_di_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_di_smith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_di_smith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_di_smith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_di_smith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_TEACHSTR(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 150;
	condition = dia_bennet_teachstr_condition;
	information = dia_bennet_teachstr_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t siln�j��m.";
};


func int dia_bennet_teachstr_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bennet_teachstr_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSTR_15_00");	//Cht�l bych se st�t siln�j��m.
	AI_Output(self,other,"DIA_Bennet_TeachSTR_06_01");	//V takov�chto dob�ch se budou siln� pa�e hodit.
	Info_ClearChoices(dia_bennet_teachstr);
	Info_AddChoice(dia_bennet_teachstr,DIALOG_BACK,dia_bennet_teachstr_back);
	Info_AddChoice(dia_bennet_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_bennet_teachstr_str_1);
	Info_AddChoice(dia_bennet_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_bennet_teachstr_str_5);
};

func void dia_bennet_teachstr_back()
{
	Info_ClearChoices(dia_bennet_teachstr);
};

func void dia_bennet_teachstr_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(dia_bennet_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_bennet_teachstr_str_1);
};

func void dia_bennet_teachstr_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(dia_bennet_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_bennet_teachstr_str_5);
};


instance DIA_BENNET_DI_DRAGONEGG(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 99;
	condition = dia_bennet_di_dragonegg_condition;
	information = dia_bennet_di_dragonegg_info;
	description = "M�m tady dra�� vejce.";
};


func int dia_bennet_di_dragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_bennet_di_dragonegg_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_00");	//M�m tady dra�� vejce.
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_01");	//No?
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_02");	//No. Myslel jsem...
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_03");	//V�m, na co mysl�. Zapome� na to, nech si tu v�c. J� to nechci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENNET_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 7;
	condition = dia_bennet_di_undeaddragondead_condition;
	information = dia_bennet_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Ud�lali jsme v�echno, co jsme pot�ebovali ud�lat.";
};


func int dia_bennet_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_bennet_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_UndeadDragonDead_15_00");	//Ud�lali jsme v�echno, co jsme pot�ebovali ud�lat.
	AI_Output(self,other,"DIA_Bennet_DI_UndeadDragonDead_06_01");	//To r�d sly��m. U� jsem m�l po krk t�hle star� kov�rny. Pot�ebuju se zase postavit na zem pevn�ma nohama.
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DI_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet_di;
	nr = 900;
	condition = dia_bennet_di_pickpocket_condition;
	information = dia_bennet_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_di_pickpocket_condition()
{
	return c_beklauen(35,65);
};

func void dia_bennet_di_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_di_pickpocket);
	Info_AddChoice(dia_bennet_di_pickpocket,DIALOG_BACK,dia_bennet_di_pickpocket_back);
	Info_AddChoice(dia_bennet_di_pickpocket,DIALOG_PICKPOCKET,dia_bennet_di_pickpocket_doit);
};

func void dia_bennet_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_di_pickpocket);
};

func void dia_bennet_di_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_di_pickpocket);
};

