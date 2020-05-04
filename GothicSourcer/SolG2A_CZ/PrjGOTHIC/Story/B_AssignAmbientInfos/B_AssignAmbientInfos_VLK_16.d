
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
	description = "Chci se st�t ob�anem tohoto m�sta!";
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
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chci se st�t ob�anem tohoto m�sta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Pom��e� n�m br�nit m�sto proti sk�et�m?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Pokud jsi ob�anem Khorinisu, m��e� se p�idat k domobran� - promluv si n�k�m od m�stsk�ch str��.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladinov� obsadili horn� ��st m�sta.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "Co je tu zaj�mav�ho k vid�n�?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Co je tu zaj�mav�ho k vid�n�?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na tr�i�ti nalezne� vystaven� ve�ker� druhy zbo��.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Douf�m, �e domobrana kone�n� zjist� pro� se populace Khorinisu zmen�uje.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//�lov�k se mus� b�t o sv�j �ivot, kdy� sly�� kolik lid� zmizelo.
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
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//U� jsi to sly�el? Za hradbami byli vid�ni sk�eti. Doufejme, �e paladinov� maj� dostatek mu��.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//R�da bych v�d�l, jestli to n�hodu nen� ten d�vod, pro� farm��i p�estali chodit na trh.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//�oldn��, o kter�m se ��kalo, �e zavra�dil Lothara, je nevinn�. Objevily se d�kazy o tom, �e na n�j n�kdo u�il boudu. Zaslechla jsem to na tr�i�ti.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To je nesl�chan�. Ten statk��sk� �old�k zabil ctihodn�ho Lothara p��mo uprost�ed ulice.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Ale Innos ho za jeho h��chy potrest�. Nikdo nesm� vzt�hnout ruku na ryt��e na�eho P�na.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Sly�ela jsem, �e ti �ibeni�n�ci opustili Onarovu farmu. ��k� se, �e se ze strachu p�ed lordem Hagenem st�hli zp�t do Hornick�ho �dol�.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Sly�ela jsem, �e se odd�l paladin� vydal do Hornick�ho �dol� pob�t ty stra�n� draky.
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

