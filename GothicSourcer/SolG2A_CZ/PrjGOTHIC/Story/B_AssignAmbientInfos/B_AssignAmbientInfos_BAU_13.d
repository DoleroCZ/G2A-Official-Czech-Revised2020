
instance DIA_BAU_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_13_exit_condition;
	information = dia_bau_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_13_exit_condition()
{
	return TRUE;
};

func void dia_bau_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_13_join_condition;
	information = dia_bau_13_join_info;
	permanent = TRUE;
	description = "Øekni mi víc o tìch žoldnéøích!";
};


func int dia_bau_13_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_13_join_info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Øekni mi víc o tìch žoldnéøích!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Pokud jsi s nima ještì nemìl žádný problémy, zajdi za Leem. On je ten, pro koho my farmáøi dìláme. Je na svý lidi vážnì pøísnej.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Když kdokoli z nich udìlá nìco špatnì, nechá mu to pìknì sežrat.
};


instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_13_people_condition;
	information = dia_bau_13_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int dia_bau_13_people_condition()
{
	return TRUE;
};

func void dia_bau_13_people_info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Když to chceš vìdìt, tak žoldáci. Jasnì, Onar je platí, ale jen Innos ví, jak dlouho se jim bude ještì chtít poslouchat jeho rozkazy.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Až si žoldáci vzpomenou, že už jim tady k nièemu neni, nechtìl bych bejt v jeho kùži.
};


instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_13_location_condition;
	information = dia_bau_13_location_info;
	permanent = TRUE;
	description = "Co mi mùžeš øíct o tomhle místì?";
};


func int dia_bau_13_location_condition()
{
	return TRUE;
};

func void dia_bau_13_location_info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Co mi mùžeš øíct o tomhle místì?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//Jsou tady tøi farmy. Onarova na východì a Sekobova na severním konci údolí.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//Po cestì se dostaneš na náhorní planinu na jihovýchodì. Tam je Bengarova farma.
};


instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_13_standard_condition;
	information = dia_bau_13_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_bau_13_standard_condition()
{
	return TRUE;
};

func void dia_bau_13_standard_info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Vojáci z mìsta už nám nebudou odvádìt náš dobytek a brát naši úrodu! Teï, když už se mùžeme bránit, nìjak ztratili zájem!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Paladinùm ve mìstì jsme my farmáøi úplnì ukradený. Jestli skøeti zaútoèí, musíme se spolehnout jen sami na sebe.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Draci! Proslýchá se, že se v Hornickém údolí objevili draci. Urèitì se brzo dostanou pøes bránu!
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//Už vidìli nìkolik banditù z hor, jak míøí do Hornickýho údolí. To je pro mì moc nebezpeèný.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Jestli se sníží danì a my dostaneme za svou práci odpovídající odmìnu, pak mùžeme s mìstem zaèít znovu obchodovat.
	};
};

func void b_assignambientinfos_bau_13(var C_NPC slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

