
instance DIA_BAU_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_7_exit_condition;
	information = dia_bau_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_7_exit_condition()
{
	return TRUE;
};

func void dia_bau_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_7_join_condition;
	information = dia_bau_7_join_info;
	permanent = TRUE;
	description = "Co víš o tìch žoldnéøích?";
};


func int dia_bau_7_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_7_join_info()
{
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Co víš o tìch žoldnéøích?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Onar si je najal, aby chránili jeho farmu.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//Vìtšina se jich chová, jako by jim farma snad patøila. Ale v každém pøípadì nás chrání.
};


instance DIA_BAU_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_7_people_condition;
	information = dia_bau_7_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int dia_bau_7_people_condition()
{
	return TRUE;
};

func void dia_bau_7_people_info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Ta velká farma patøí Onarovi. Stejnì jako ty malý okolo. Ale ty jsou teï v pronájmu.
};


instance DIA_BAU_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_7_location_condition;
	information = dia_bau_7_location_info;
	permanent = TRUE;
	description = "Øekni mi víc o tomhle místì.";
};


func int dia_bau_7_location_condition()
{
	return TRUE;
};

func void dia_bau_7_location_info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//Øekni mi víc o tomhle místì.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Ta velká farma tady na východì údolí patøí Onarovi. Sekobova leží na severu.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//A Begarova farma je na náhorní plošinì na jihovýchodì. Z údolí se tam dostaneš celkem snadno - vedou tam velké kamenné schody.
};


instance DIA_BAU_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_7_standard_condition;
	information = dia_bau_7_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_bau_7_standard_condition()
{
	return TRUE;
};

func void dia_bau_7_standard_info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Vyhlásili jsme nezávislost - už nebudeme mìstu dál odvádìt danì. Král pro nás nehne ani prstem - už jsme toho mìli prostì dost!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//Teï se tady toho moc nedìje.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Zaèaly se tu proslýchat zvìsti o dracích! Král si vždycky vymyslí nìco novýho, jen aby mohl z lidí vymáèknout další peníze.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Dávej si pozor, poslední dobou se sem pøes bránu dostává strašnì moc temnejch postav a divoký zvìøe.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Teï, když jsou draci mrtví, se koneènì pánové paladinové uráèili odtáhnout z mìsta. Už je na èase, aby se sem vrátila spravedlnost.
	};
};

func void b_assignambientinfos_bau_7(var C_NPC slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

