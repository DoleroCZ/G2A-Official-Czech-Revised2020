
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "Chci se stát obèanem tohoto mìsta!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chci se stát obèanem tohoto mìsta!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//A proè to øíkáš mnì? Zajdi za jedním z øemeslnických mistrù v dolní èásti mìsta. Možná, když budeš mít štìstí, bude nìkterý z nich hledat uèedníka.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru mìšanù.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Ale teï na to mùžeš rovnou zapomenout. Od té doby, co sem pøišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//A jejich velitel, lord Hagen, zaruèenì nemá na podobné vìci èas.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle mìstì požívá nejvìtší vážnosti?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Kdo v tomhle mìstì požívá nejvìtší vážnosti?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Kromì paladinù... øemeslniètí mistøi v dolní èásti mìsta. Ti jsou také velmi vážení.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "Co je tu zajímavého k vidìní?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Co je tu zajímavého k vidìní?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//V pøístavu je obrovská loï, kterou paladinové pøipluli. Je to neuvìøitelnì velké plavidlo. Mìl by ses na nìj podívat.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Ale nedokážu si pøedstavit, že by tì pustili na palubu. Paladinové støeží svoji loï jako korunovaèní klenoty.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Není divu. Taky to je jediná námoøní loï široko daleko.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Každý se v poslední dobì cití nesvùj, lidé jsou nervozní.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jako kdyby toho nebylo dost - vtrhli sem paladinové - teï když se lidé ztrácejí!
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Je èas, aby s tím domobrana nìco udìlala.
		if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
		{
			Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
			b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		};
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Všichni èekají na to, až paladinové oznámí, proè tu doopravdy jsou. Pøedpokládám, že kvùli skøetùm. Urèitì co nevidìt zaútoèí!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Paladinové možná mají Innosovo požehnání, ale až se objeví skøeti, bude to na nás.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Øíká se, že tu paladinové jsou jen kvùli tomu, aby dostali všechnu rudu z ostrova. Prý kvùli válce na pevninì.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Víš, co to znamená? Královi je úplnì volný, jestli tady chcípnem, až skøeti zaútoèí.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Budu se snažit být na palubì, až budou paladinové zvedat kotvy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Øíká se, že skøeti pøiletí do našeho mìsta na dracích, co jsou velcí jako polovina mìsta! Nemáme žádnou šanci!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Mezi lidmi se povídá, že draci byli poražení. Mùže to být pravda?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

