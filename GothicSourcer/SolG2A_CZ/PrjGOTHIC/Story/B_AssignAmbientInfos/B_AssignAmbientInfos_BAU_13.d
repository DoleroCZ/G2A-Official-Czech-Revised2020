
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
	description = "�ekni mi v�c o t�ch �oldn���ch!";
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
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//�ekni mi v�c o t�ch �oldn���ch!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Pokud jsi s nima je�t� nem�l ��dn� probl�my, zajdi za Leem. On je ten, pro koho my farm��i d�l�me. Je na sv� lidi v�n� p��snej.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Kdy� kdokoli z nich ud�l� n�co �patn�, nech� mu to p�kn� se�rat.
};


instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_13_people_condition;
	information = dia_bau_13_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu vel�?";
};


func int dia_bau_13_people_condition()
{
	return TRUE;
};

func void dia_bau_13_people_info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Kdo tady tomu vel�?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Kdy� to chce� v�d�t, tak �old�ci. Jasn�, Onar je plat�, ale jen Innos v�, jak dlouho se jim bude je�t� cht�t poslouchat jeho rozkazy.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//A� si �old�ci vzpomenou, �e u� jim tady k ni�emu neni, necht�l bych bejt v jeho k��i.
};


instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_13_location_condition;
	information = dia_bau_13_location_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o tomhle m�st�?";
};


func int dia_bau_13_location_condition()
{
	return TRUE;
};

func void dia_bau_13_location_info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Co mi m��e� ��ct o tomhle m�st�?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//Jsou tady t�i farmy. Onarova na v�chod� a Sekobova na severn�m konci �dol�.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//Po cest� se dostane� na n�horn� planinu na jihov�chod�. Tam je Bengarova farma.
};


instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_13_standard_condition;
	information = dia_bau_13_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_bau_13_standard_condition()
{
	return TRUE;
};

func void dia_bau_13_standard_info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Voj�ci z m�sta u� n�m nebudou odv�d�t n� dobytek a br�t na�i �rodu! Te�, kdy� u� se m��eme br�nit, n�jak ztratili z�jem!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Paladin�m ve m�st� jsme my farm��i �pln� ukraden�. Jestli sk�eti za�to��, mus�me se spolehnout jen sami na sebe.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Draci! Prosl�ch� se, �e se v Hornick�m �dol� objevili draci. Ur�it� se brzo dostanou p�es br�nu!
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//U� vid�li n�kolik bandit� z hor, jak m��� do Hornick�ho �dol�. To je pro m� moc nebezpe�n�.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Jestli se sn�� dan� a my dostaneme za svou pr�ci odpov�daj�c� odm�nu, pak m��eme s m�stem za��t znovu obchodovat.
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

