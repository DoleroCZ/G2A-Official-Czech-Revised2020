
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_16_exit_condition;
	information = dia_vlk_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_16_exit_condition()
{
	return TRUE;
};

func void dia_vlk_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_16_join_condition;
	information = dia_vlk_16_join_info;
	permanent = TRUE;
	description = "Chci se stát obèanem tohoto mìsta!";
};


func int dia_vlk_16_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_16_join_info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chci se stát obèanem tohoto mìsta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Pomùžeš nám bránit mìsto proti skøetùm?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Pokud jsi obèanem Khorinisu, mùžeš se pøidat k domobranì - promluv si nìkým od mìstských stráží.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle mìstì požívá nejvìtší vážnosti?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kdo v tomhle mìstì požívá nejvìtší vážnosti?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladinové obsadili horní èást mìsta.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "Co je tu zajímavého k vidìní?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Co je tu zajímavého k vidìní?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na tržišti nalezneš vystavené veškeré druhy zboží.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Doufám, že domobrana koneènì zjistí proè se populace Khorinisu zmenšuje.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//Èlovìk se musí bát o svùj život, když slyší kolik lidí zmizelo.
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
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Už jsi to slyšel? Za hradbami byli vidìni skøeti. Doufejme, že paladinové mají dostatek mužù.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Ráda bych vìdìl, jestli to náhodu není ten dùvod, proè farmáøi pøestali chodit na trh.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Žoldnéø, o kterém se øíkalo, že zavraždil Lothara, je nevinný. Objevily se dùkazy o tom, že na nìj nìkdo ušil boudu. Zaslechla jsem to na tržišti.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To je neslýchané. Ten statkáøský žoldák zabil ctihodného Lothara pøímo uprostøed ulice.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Ale Innos ho za jeho høíchy potrestá. Nikdo nesmí vztáhnout ruku na rytíøe našeho Pána.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Slyšela jsem, že ti šibenièníci opustili Onarovu farmu. Øíká se, že se ze strachu pøed lordem Hagenem stáhli zpìt do Hornického údolí.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Slyšela jsem, že se oddíl paladinù vydal do Hornického údolí pobít ty strašné draky.
	};
};

func void b_assignambientinfos_vlk_16(var C_NPC slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

