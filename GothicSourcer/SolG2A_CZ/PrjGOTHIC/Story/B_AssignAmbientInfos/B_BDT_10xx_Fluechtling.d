
func void b_dia_bdt_10xx_fluechtling_stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//Zapome� na to. Do v�zen� u� se nevr�tim.
};

func void b_dia_bdt_10xx_fluechtling_stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//U� se ti nepoda�� n�s znovu dostat do basy, jasn�?
};


instance DIA_BDT_1031_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 999;
	condition = dia_bdt_1031_fluechtling_exit_condition;
	information = dia_bdt_1031_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1031_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1031_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_FLUECHTLING_TIP1(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 2;
	condition = dia_bdt_1031_fluechtling_tip1_condition;
	information = dia_bdt_1031_fluechtling_tip1_info;
	important = TRUE;
};


func int dia_bdt_1031_fluechtling_tip1_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_tip1_info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//Jestli nechce� skon�it v base, ud�l� l�p, kdy� se ode m� bude� dr�et d�l.
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1031_fluechtling_tip1);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Nem�m v pl�nu na tebe don�et.",dia_bdt_1031_fluechtling_tip1_frei);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"P�i�el jsem t� zatknout.",dia_bdt_1031_fluechtling_tip1_knast);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Kde je Morgahard, tv�j velitel?",dia_bdt_1031_fluechtling_tip1_morgahard);
	};
};

func void dia_bdt_1031_fluechtling_tip1_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//Kde je Morgahard, tv�j velitel?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//Rozd�l�me se, tak�e n�s tak rychle nedostanou. Nebudeme v�d�t, kde jsou ostatn�.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"To je zl�. Tak to h�d�m, �e bych m�l dostat soudce.",dia_bdt_1031_fluechtling_tip1_morgahard_drohen);
};

func void dia_bdt_1031_fluechtling_tip1_morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//To je zl�. Tak to h�d�m, �e bych m�l dostat soudce.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//Fajn, fajn. Asi by se n�kte�� z n�s m�li zdejchnout do kr�my. Ale ode m� jste to nesly�eli, jasn�?
	AI_StopProcessInfos(self);
};

func void dia_bdt_1031_fluechtling_tip1_knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//P�i�el jsem t� zatknout.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//Jen p�es mou mrtvolu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1031_fluechtling_tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//Nem�m v pl�nu na tebe don�et.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//Jestli t� poslal soudce, tak mu vy�i�, �e se m��e j�t vycpat.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Tak co si provedl?",dia_bdt_1031_fluechtling_tip1_frei_verbrechen);
};

func void dia_bdt_1031_fluechtling_tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//Tak co si provedl?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//Do toho ti nic nen�.
};


instance DIA_BDT_1031_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 3;
	condition = dia_bdt_1031_fluechtling_perm_condition;
	information = dia_bdt_1031_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1031_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 999;
	condition = dia_bdt_1032_fluechtling_exit_condition;
	information = dia_bdt_1032_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1032_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1032_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 2;
	condition = dia_bdt_1032_fluechtling_perm_condition;
	information = dia_bdt_1032_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1032_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1032_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 999;
	condition = dia_bdt_1033_fluechtling_exit_condition;
	information = dia_bdt_1033_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1033_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1033_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_TIP2(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 2;
	condition = dia_bdt_1033_fluechtling_tip2_condition;
	information = dia_bdt_1033_fluechtling_tip2_info;
	important = TRUE;
};


func int dia_bdt_1033_fluechtling_tip2_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_tip2_info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//(vyd�en�) Co ode m� chce�?
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1033_fluechtling_tip2);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Kl�dek. Chci si jen promluvit.",dia_bdt_1033_fluechtling_tip2_frei);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Soudce m� poslal, abych t� p�ivedl zp�tky.",dia_bdt_1033_fluechtling_tip2_knast);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Kde je Morgahard, tv�j velitel?",dia_bdt_1033_fluechtling_tip2_morgahard);
	};
};

func void dia_bdt_1033_fluechtling_tip2_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//Kde je Morgahard, tv�j velitel?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//(vyd�en�) Nechci ��dn� probl�my. Zajdi za velkostatk��em. Cht�l si s�m najmout n�jak� �old�ky. A te� m� nech na pokoji.
	AI_StopProcessInfos(self);
};

func void dia_bdt_1033_fluechtling_tip2_knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//Soudce m� poslal, abych t� p�ivedl zp�tky.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//(k�i��) NE.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1033_fluechtling_tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//Kl�dek. Chci si jen promluvit.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//Ale j� s tebou mluvit nechci. Zmizni, chlape.
	Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Tys fakticky jenom ustra�en� sr�bek, co?",dia_bdt_1033_fluechtling_tip2_frei_verbrechen);
};

func void dia_bdt_1033_fluechtling_tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//Jse� pod�lanej strachy, co?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//M��e� mluvit. Ta �ibenice nen� pro tebe, kdyby t� n�hodou chytili.
};


instance DIA_BDT_1033_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 3;
	condition = dia_bdt_1033_fluechtling_perm_condition;
	information = dia_bdt_1033_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1033_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 999;
	condition = dia_bdt_1034_fluechtling_exit_condition;
	information = dia_bdt_1034_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1034_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1034_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 2;
	condition = dia_bdt_1034_fluechtling_perm_condition;
	information = dia_bdt_1034_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1034_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1034_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 999;
	condition = dia_bdt_1035_fluechtling_exit_condition;
	information = dia_bdt_1035_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1035_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1035_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 2;
	condition = dia_bdt_1035_fluechtling_perm_condition;
	information = dia_bdt_1035_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1035_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1035_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};

