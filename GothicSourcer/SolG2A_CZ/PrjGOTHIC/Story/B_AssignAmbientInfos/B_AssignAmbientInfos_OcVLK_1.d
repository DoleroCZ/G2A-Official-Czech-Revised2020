
instance DIA_OCVLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_1_exit_condition;
	information = dia_ocvlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_1_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_1_people_condition;
	information = dia_ocvlk_1_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady vel�?";
};


func int dia_ocvlk_1_people_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Kdo tomu tady vel�?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Velitel Garond. Ale od chv�le, co se tu situace zhor�ila, ho nikdo nevid�l nikde jinde ne� v tr�nn�m s�lu. Je mi l�to, �e to vzalo tak �patn� konec.
};


instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_1_location_condition;
	information = dia_ocvlk_1_location_info;
	permanent = TRUE;
	description = "Co v� o Hornick�m �dol�?";
};


func int dia_ocvlk_1_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Co v� o Hornick�m �dol�?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//N�kolik z na�ich hoch� je je�t� st�le v dolech a sna�� se t�it. Teda alespo�, co v�m.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Necht�l bych si to s nimi m�nit. Cel� �dol� se hem�� sk�ety. A to se ani nezmi�uju o drac�ch.
};


instance DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_1_standard_condition;
	information = dia_ocvlk_1_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_ocvlk_1_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//Jak se vede?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Sk�eti n�s maj� p�esn� tam, kde n�s cht�li m�t! Bez posil se dlouho neudr��me! Docela m� p�ekvapuje, �e n�s draci jednodu�e nedod�lali v�echny.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//Tak se kone�n� p�ece jen do�k�me posil.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//Sly��m dob�e, �e v�ichni draci byli zabiti? D�ky Innosovi!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Tahle zpropaden� ruda. M�li bysme ji v�echnu shodit dol� z cimbu��. Pak by n�s sk�eti mo�n� nechali na pokoji.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Ty sm�n� bedny, kter� tak nedbale nah�zeli p�ed vchod, nem��ou sk�et�m nijak p�ekazit jejich pl�ny!
		};
	};
};

func void b_assignambientinfos_ocvlk_1(var C_NPC slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

