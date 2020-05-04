
instance DIA_BAU_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_16_exit_condition;
	information = dia_bau_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_16_exit_condition()
{
	return TRUE;
};

func void dia_bau_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_16_join_condition;
	information = dia_bau_16_join_info;
	permanent = TRUE;
	description = "�ekni mi v�c o t�ch �oldn���ch!";
};


func int dia_bau_16_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_16_join_info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//�ekni mi v�c o t�ch �oldn���ch!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Cel� dny se poflakuj� kolem farmy, ml�t�j se mezi sebou jen tak, aby si zkr�tili dlouhou chv�li, a myslej si, jak� je to sranda.
};


instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_16_people_condition;
	information = dia_bau_16_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu vel�?";
};


func int dia_bau_16_people_condition()
{
	return TRUE;
};

func void dia_bau_16_people_info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kdo tady tomu vel�?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Kdy� se na to pt�, tak �old�ci.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar je sice plat�, ale v�t�ina z nich si d�l�, co se jim zachce.
};


instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_16_location_condition;
	information = dia_bau_16_location_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o tomhle m�st�?";
};


func int dia_bau_16_location_condition()
{
	return TRUE;
};

func void dia_bau_16_location_info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mi m��e� ��ct o tomhle m�st�?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Jsou tu t�i farmy. Onarova na v�chod� a Sekobova na severn�m konci �dol�.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Po cest� se dostane� na n�horn� planinu na jihov�chod�. Tam je Bengarova farma.
};


instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_16_standard_condition;
	information = dia_bau_16_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_bau_16_standard_condition()
{
	return TRUE;
};

func void dia_bau_16_standard_info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Voj�ci z m�sta u� n�m nebudou odv�d�t n� dobytek a br�t na�i �rodu! Te�, kdy� u� se m��eme br�nit, n�jak ztratili z�jem!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//��k� se, �e se v Hornick�m �dol� shroma��uje ob�� arm�da. Za chv�li tady budou.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Zaslechl jsem n�jak� zv�sti o tom, �e jsou v Hornick�m �dol� draci. St�� tomu m��u uv��it.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//N�kte�� �e �oldn��� zmizeli. Nev�m, jestli to m�m pova�ovat ze dobrou, nebo �patnou v�c.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Paladinov� na ta�en� do Hornick�ho �dol� - co to v�echno m� znamenat?
	};
};

func void b_assignambientinfos_bau_16(var C_NPC slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

