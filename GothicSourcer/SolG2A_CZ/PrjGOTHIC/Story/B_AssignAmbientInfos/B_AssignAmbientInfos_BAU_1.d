
instance DIA_BAU_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_1_exit_condition;
	information = dia_bau_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_1_exit_condition()
{
	return TRUE;
};

func void dia_bau_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_1_join_condition;
	information = dia_bau_1_join_info;
	permanent = TRUE;
	description = "Øekni mi víc o tìch žoldnéøích.";
};


func int dia_bau_1_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_1_join_info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Øekni mi víc o tìch žoldnéøích.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Jediný, co ti mùžu poradit, je, aby ses jim zdaleka vyhnul.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Jestli se nìkterýmu z nich nebude zamlouvat tvùj ksicht, prostì ti krapet vylepší nos.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Pak si mùžeš u Leeho stìžovat, ale ten nos už stejnì zùstane zlomenej.
};


instance DIA_BAU_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_1_people_condition;
	information = dia_bau_1_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int dia_bau_1_people_condition()
{
	return TRUE;
};

func void dia_bau_1_people_info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//Tohle je Onarova farma. On tady má všechno pod palcem.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Dovol, abych ti dal menší radu: Moc ty žoldáky neprovokuj. S tìmahle není radno si zahrávat.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Sylvio je takovej zkorumpovanej mizera. Ale jejich vùdce, Lee, je docela v klidu.
};


instance DIA_BAU_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_1_location_condition;
	information = dia_bau_1_location_info;
	permanent = TRUE;
	description = "A co je tady poblíž dalšího?";
};


func int dia_bau_1_location_condition()
{
	return TRUE;
};

func void dia_bau_1_location_info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//A co je tady poblíž dalšího?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Jen pole a farmy. A spousta žoldákù. Ale vìtšina jich je na východì na Onarovì farmì.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//Na sever leží Sekobova farma, ale tam chodí jen vybírat nájem.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//Na jihozápadì narazíš na cestu k Bengarovì farmì.
};


instance DIA_BAU_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_1_standard_condition;
	information = dia_bau_1_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_bau_1_standard_condition()
{
	return TRUE;
};

func void dia_bau_1_standard_info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar si najal žoldáky, aby udrželi domobranu ve mìstì. Jinak by nám odvedli i tu poslední ovci!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Nic moc. Poøád ty samý problémy. Domobrana, skøeti a polní škùdci.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Zaèaly se tu dít divný vìci. Pøed pár dny jsem v noci zahlídl èernou siluetu. A nebyl to èlovìk.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//Èím dál tím èastìjc tu vídáme skøety. Obèas mám dojem, jako by se jich za každýho mrtvýho objevilo nìkolik dalších.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//Paladinové vyrazili do Hornickýho údolí. Co to všechno má znamenat? Nemùžeme si dovolit ztratit jedinýho muže, abysme udrželi domobranu na uzdì.
	};
};

func void b_assignambientinfos_bau_1(var C_NPC slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

