
instance DIA_OCPAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_4_exit_condition;
	information = dia_ocpal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_4_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_4_people_condition;
	information = dia_ocpal_4_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady vel�?";
};


func int dia_ocpal_4_people_condition()
{
	return TRUE;
};

func void dia_ocpal_4_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//Kdo tomu tady vel�?
	AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//Velitel Garond. Najde� ho v t� nejv�t�� budov� tady uvnit� hradu.
};


instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_4_location_condition;
	information = dia_ocpal_4_location_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o Hornick�m �dol�?";
};


func int dia_ocpal_4_location_condition()
{
	return TRUE;
};

func void dia_ocpal_4_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//Co mi m��e� ��ct o Hornick�m �dol�?
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//Co v�m, tak je tu n�kolik dol� - pokud tedy v�echny nepadly do dr�p� sk�et�m.
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//Jednotky z v�t�� ��sti sest�vaj� z v�z��, ale najde� tu i p�r paladin�.
};


instance DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_4_standard_condition;
	information = dia_ocpal_4_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_ocpal_4_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_4_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak se vede?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//Obkl��ili n�s sk�eti! Ale budeme se br�nit do posledn�ho mu�e. A Innos n�m pom��e v boji proti drak�m!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//U� je to p�kn� dlouho, co sk�eti za�to�ili. Kde jsou ty zatracen� posily?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//Nem��e� p�eci v�n� v��it tomu, �e ty jako drakobijec m� �anci proti V�EM t�m drak�m?
			}
			else
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//Ti takzvan� drakobijci toho moc nesvedou!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//D�ky Innosovi! Ty zatracen� potvory jsou pora�eny!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//Nezd� se, �e by smrt drak� sk�ety n�jak vyvedla z m�ry. Pro� u Innose kone�n� neodt�hnou? D�je se tu n�co divn�ho.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//Ta zpropaden� br�na se zasekla. Sk�eti se val� do hradu a nic u� je nem��e zastavit.
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//N�kdo mus� informovat lorda Hagena. Pot�ebujeme ho TADY.
		};
	};
};

func void b_assignambientinfos_ocpal_4(var C_NPC slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

