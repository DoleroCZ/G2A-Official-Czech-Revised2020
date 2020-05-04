
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "Chci se p�idat k domobran�!";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//Chci se p�idat k domobran�!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//Je�t� ses nestal ob�anem Khorinisu! Pro� si mysl�, �e by t� m�l lord Andre p�ijmout?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Takhle by mohl p�ij�t ka�d� - dostal by zbra� a n�jakou zbroj a pak s t�m zmizel!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//Ale j� m�m dobrou pov�st!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//To nevysv�tluj mn�, ale lordu Andremu. Najde� ho v kas�rn�ch.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "Co v� o paladinech?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//Co v� o paladinech?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Nic moc. Nikdo po��dn� nev�, pro� jsou vlastn� tady. Alespo� nikdo z m�stsk� str�e.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//P�evzali kontrolu nad m�stem, zabrali m�stodr��c�mu jeho zastupitelskou s�� a ujali se funkce soudu.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//Pokud to chce� v�d�t, tak si mysl�m, �e to je jen ku prosp�chu v�ci. Ti nafoukan� oslov� u� v�n� pot�ebovali lekci slu�n�ho chov�n�.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "Co mohu tady ve m�st� d�lat?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//Co mohu tady ve m�st� d�lat?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//Pokud nechce� skon�it ve stoce v p��stavn� �tvrti, najdi si slu�n� zam�stn�n�. Poptej se tady v doln� ��sti m�sta - mo�n� se na tebe usm�je �t�st�.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//Jestli se tu chyst� z�stat trochu d�le, m�l by ses p�ipojit k domobran� nebo alespo� za��t s bojov�m v�cvikem.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//Vedouc� v�cviku, kter�ho najde� v kas�rn�ch, u�� i civilisty.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//Sk�eti p�ijdou u� brzo a pak bude� vd��n� za ka�dou hodinu, kterou jsi str�vil na cvi�i�ti.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//Jeden po druh�m lid� miz�. Bohu�el jsme je�t� nezjistili, co se s nimi stalo. M��ou za t�m b�t sk�eti?
			if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
			};
			SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//��k� se, �e se farm��i vzbou�ili. Takov� zatracen� probl�my n�m byl �ert dlu�en, zrovna te�, kdy� jsme uprost�ed v�lky se sk�ety!
		};
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//Je na �ase, aby paladinov� kone�n� tu rebelii potla�ili. Ka�d�, kdo poru�� z�kon, mus� b�t potrest�n. Zvl᚝ te�, kdy� jsme ve v�lce.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//�oldn��, co byl obvin�n z vra�dy Lothara, je pravd�podobn� nevinen. Kdosi p�inesl d�kaz o tom, �e na n�j n�kdo u�il boudu.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//Jeden z Onarov�ch �oldn��� zavra�dil ctihodn�ho paladina Lothara. Ale nakonec ho chytili a uvrhli do �al��e.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//N�kte�� ze �oldn��� u� Onarovu farmu opustili. N�kter� probl�my se vy�e�� �asem samy.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//Draci to maj� spo��tan�, ale je�t� nen� v�emu konec. Dal�� na �ad� jsou sk�eti. My sv� z�le�itosti �e��me s ��dnou d�slednost�!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

