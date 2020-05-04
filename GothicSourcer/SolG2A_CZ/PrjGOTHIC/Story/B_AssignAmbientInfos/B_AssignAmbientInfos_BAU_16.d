
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
	description = "Øekni mi víc o tìch žoldnéøích!";
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
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Øekni mi víc o tìch žoldnéøích!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Celé dny se poflakují kolem farmy, mlátìj se mezi sebou jen tak, aby si zkrátili dlouhou chvíli, a myslej si, jaká je to sranda.
};


instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_16_people_condition;
	information = dia_bau_16_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int dia_bau_16_people_condition()
{
	return TRUE;
};

func void dia_bau_16_people_info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Když se na to ptáš, tak žoldáci.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar je sice platí, ale vìtšina z nich si dìlá, co se jim zachce.
};


instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_16_location_condition;
	information = dia_bau_16_location_info;
	permanent = TRUE;
	description = "Co mi mùžeš øíct o tomhle místì?";
};


func int dia_bau_16_location_condition()
{
	return TRUE;
};

func void dia_bau_16_location_info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mi mùžeš øíct o tomhle místì?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Jsou tu tøi farmy. Onarova na východì a Sekobova na severním konci údolí.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Po cestì se dostaneš na náhorní planinu na jihovýchodì. Tam je Bengarova farma.
};


instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_16_standard_condition;
	information = dia_bau_16_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_bau_16_standard_condition()
{
	return TRUE;
};

func void dia_bau_16_standard_info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Vojáci z mìsta už nám nebudou odvádìt náš dobytek a brát naši úrodu! Teï, když už se mùžeme bránit, nìjak ztratili zájem!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Øíká se, že se v Hornickém údolí shromažïuje obøí armáda. Za chvíli tady budou.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Zaslechl jsem nìjaké zvìsti o tom, že jsou v Hornickém údolí draci. Stìží tomu mùžu uvìøit.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Nìkteøí že žoldnéøù zmizeli. Nevím, jestli to mám považovat ze dobrou, nebo špatnou vìc.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Paladinové na tažení do Hornického údolí - co to všechno má znamenat?
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

