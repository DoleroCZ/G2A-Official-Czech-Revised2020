
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_9_exit_condition;
	information = dia_ocpal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_9_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_9_people_condition;
	information = dia_ocpal_9_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady vel�?";
};


func int dia_ocpal_9_people_condition()
{
	return TRUE;
};

func void dia_ocpal_9_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Kdo tomu tady vel�?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Velitelem hradu je Garond. Jeho pr�ci mu v�n� nen� co z�vid�t.
};


instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_9_location_condition;
	information = dia_ocpal_9_location_info;
	permanent = TRUE;
	description = "V� n�co zaj�mav�ho o tomhle �dol�?";
};


func int dia_ocpal_9_location_condition()
{
	return TRUE;
};

func void dia_ocpal_9_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//V� n�co zaj�mav�ho o tomhle �dol�?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//Na v�chod� sk�eti postavili obrovskou obrannou ze� - aby mohli chr�nit sv� z�soby, p�edpokl�d�m. Za tou zd� je i m�sto, kde mohou kotvit jejich lod�.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Douf�m, �e sk�eti nedostanou sv� z�soby v�as. U� te� mi docela sta��, s ��m m�me tu �est.
};


instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_9_standard_condition;
	information = dia_ocpal_9_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_ocpal_9_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_9_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak se vede?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Draci znovu za�to�ili! Ale Innos n�m v bitv� poskytl svou ochranu. Ty stv�ry zaplat� vysokou da� svou vlastn� krv�!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//Drakobijci! M�li n�m poslat paladiny!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Te�, kdy� jsme se zbavili t�ch drak�, se m��eme kone�n� vypo��dat se sk�ety!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Pot�ebujeme dostat rudu na lo� a odplout z pekla t�hle zpropaden� zem�.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Zrada! Ta br�na nem�la b�t nikdy otev�ena. Smrt v�em zr�dc�m!
		};
	};
};

func void b_assignambientinfos_ocpal_9(var C_NPC slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

