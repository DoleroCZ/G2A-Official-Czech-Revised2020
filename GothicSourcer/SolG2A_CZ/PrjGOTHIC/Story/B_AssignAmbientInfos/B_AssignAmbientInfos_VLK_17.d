
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_17_exit_condition;
	information = dia_vlk_17_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_17_exit_condition()
{
	return TRUE;
};

func void dia_vlk_17_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_17_join_condition;
	information = dia_vlk_17_join_info;
	permanent = TRUE;
	description = "Co musím udìlat, abych se mohl stát obèanem mìsta?";
};


func int dia_vlk_17_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_17_join_info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co musím udìlat, abych se mohl stát obèanem mìsta?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Tady v Khorinisu mají velké slovo øemeslniètí mistøi z dolní èásti mìsta. Mìl by sis s jedním z nich promluvit.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle mìstì požívá nejvìtší vážnosti?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kdo v tomhle mìstì požívá nejvìtší vážnosti?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Jakmile dorazili paladinové do mìsta, pøevzali velení nad celým Khorinisem.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Lord Andre tu pøedstavuje zákon. Nalezneš ho v kasárnách.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//Ale smysl k nìmu má chodit jen tehdy, pokud se dostaneš do konfliktu se zákonem nebo se budeš chtít pøidat k domobranì.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "Co je tady v Khorinisu nejzajímavìjší?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Co je tady v Khorinisu nejzajímavìjší?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(smích) Možná by ses na to mìl radìji zeptat nìjakého chlapa. Pokud máš na mysli zábavu, zkus se podívat do pøístavu.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Ale pokud chceš nìco koupit, zajdi na trh u východní brány nebo do dolní èásti mìsta.
};


instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_17_standard_condition;
	information = dia_vlk_17_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vlk_17_standard_condition()
{
	return TRUE;
};

func void dia_vlk_17_standard_info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co je nového?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zajímalo by mì, proè tady ti paladinové vlastnì jsou. Zabrali radnici, kasárna i pøístav, ale zatím neudìlali vùbec nic.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Pokud pøijeli kvùli skøetùm a banditùm, mìli zakroèit už pøed drahnou dobou. Musí mít ještì jiný dùvod.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Už mi došlo, proè tu ti paladinové jsou - je to kvùli rudì. Udìlali by líp, kdyby místo toho radìji bránili naše mìsto.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Doufám, že je na tìch draèích povídaèkách nìco pravdy. V tom pøípadì totiž bude muset lord Hagen zaèít nìco dìlat. Nemùže nás pøece jen tak nechat drakùm napospas.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Teï, když jsou ti draci mrtví, zatoèí paladinové snadno i ostatním neøádstvem.
	};
};

func void b_assignambientinfos_vlk_17(var C_NPC slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

