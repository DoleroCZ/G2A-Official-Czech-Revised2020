
instance DIA_OCVLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_6_exit_condition;
	information = dia_ocvlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_6_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_6_people_condition;
	information = dia_ocvlk_6_people_info;
	permanent = TRUE;
	description = "Kdo tady tomu vel�?";
};


func int dia_ocvlk_6_people_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//Kdo tady tomu vel�?
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//Garond m� velen� nad celou pevnost� - nebo alespo� nad t�m, co z n� zbylo.
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//Ale s�m se prakticky o nic nestar� - leda kdy� se n�kter� z jeho mu�� dostane do pot��.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//Pokud chce� n�jak� vybaven�, m�l bys zaj�t za Engorem. Najde� ho v domku naproti Garondovi.
	};
};


instance DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_6_location_condition;
	information = dia_ocvlk_6_location_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o situaci v Hornick�m �dol�?";
};


func int dia_ocvlk_6_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_6_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//Co mi m��e� ��ct o situaci v Hornick�m �dol�?
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//Ta sk�et� palis�da mi d�l� starosti. Rad�ji ani nechci v�d�t, co za n� sk�eti skr�vaj�.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//Nejd��v se jich tu potulovalo jen p�r - postavili palis�du. Pak jedn� noci p�it�hli i s obl�hac�mi stroji.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//M�li jsme �t�st� a poda�ilo se n�m �tok odrazit.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//Za tou zd� se rozprost�r� mo�e. Pokud je�t� p�iplujou dal�� lod� se sk�ety na palub�, nebudeme m�t ��dnou �anci.
};


instance DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_6_standard_condition;
	information = dia_ocvlk_6_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_ocvlk_6_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//Jak se vede?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//Vstup do arm�dy a bude se ti dob�e da�it, ��kali. A te� tohle.
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//Te� je pod trestem smrti zak�z�no se jen p�ibl�it k z�sob�m potravin. Zd� se, �e se Garond boj�, �e bychom mohli vyplenit z�soby a pak vz�t kramle. (zatrpkl� sm�ch)
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//V�ichni pochc�peme hlady, pokud n�s teda d��v neusma�� ti zatracen� draci!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//Drakobijci. Nenech se vysm�t! Ti nic nezm��ou.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//��k� se, �e v�ichni draci jsou mrtv�! Te� m�me �anci!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//Tahle zpropaden� ruda. M�li bysme ji v�echnu shodit dol� z cimbu��. Pak by n�s sk�eti mo�n� nechali na pokoji.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//Ty sm�n� bedny, kter� tak nedbale nah�zeli p�ed vchod, nem��ou sk�et�m nijak p�ekazit jejich pl�ny!
		};
	};
};

func void b_assignambientinfos_ocvlk_6(var C_NPC slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

