
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
	description = "Chci se st�t ob�anem tohoto m�sta!";
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
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chci se st�t ob�anem tohoto m�sta!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//A pro� to ��k� mn�? Zajdi za jedn�m z �emeslnick�ch mistr� v doln� ��sti m�sta. Mo�n�, kdy� bude� m�t �t�st�, bude n�kter� z nich hledat u�edn�ka.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//Jindy bys mohl zaj�t za m�stodr��c�m a nechat se zapsat do registru m욝an�.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Ale te� na to m��e� rovnou zapomenout. Od t� doby, co sem p�i�li paladinov�, nem� m�stodr��c� ��dn� pravomoci.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//A jejich velitel, lord Hagen, zaru�en� nem� na podobn� v�ci �as.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Krom� paladin�... �emeslni�t� mist�i v doln� ��sti m�sta. Ti jsou tak� velmi v�en�.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "Co je tu zaj�mav�ho k vid�n�?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Co je tu zaj�mav�ho k vid�n�?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//V p��stavu je obrovsk� lo�, kterou paladinov� p�ipluli. Je to neuv��iteln� velk� plavidlo. M�l by ses na n�j pod�vat.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Ale nedok�u si p�edstavit, �e by t� pustili na palubu. Paladinov� st�e�� svoji lo� jako korunova�n� klenoty.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Nen� divu. Taky to je jedin� n�mo�n� lo� �iroko daleko.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Ka�d� se v posledn� dob� cit� nesv�j, lid� jsou nervozn�.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jako kdyby toho nebylo dost - vtrhli sem paladinov� - te� kdy� se lid� ztr�cej�!
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Je �as, aby s t�m domobrana n�co ud�lala.
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
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//V�ichni �ekaj� na to, a� paladinov� ozn�m�, pro� tu doopravdy jsou. P�edpokl�d�m, �e kv�li sk�et�m. Ur�it� co nevid�t za�to��!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Paladinov� mo�n� maj� Innosovo po�ehn�n�, ale a� se objev� sk�eti, bude to na n�s.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//��k� se, �e tu paladinov� jsou jen kv�li tomu, aby dostali v�echnu rudu z ostrova. Pr� kv�li v�lce na pevnin�.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//V�, co to znamen�? Kr�lovi je �pln� voln�, jestli tady chc�pnem, a� sk�eti za�to��.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Budu se sna�it b�t na palub�, a� budou paladinov� zvedat kotvy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//��k� se, �e sk�eti p�ilet� do na�eho m�sta na drac�ch, co jsou velc� jako polovina m�sta! Nem�me ��dnou �anci!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Mezi lidmi se pov�d�, �e draci byli pora�en�. M��e to b�t pravda?
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

