
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
	description = "Kdo tomu tady velí?";
};


func int dia_ocpal_4_people_condition()
{
	return TRUE;
};

func void dia_ocpal_4_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//Velitel Garond. Najdeš ho v tý nejvìtší budovì tady uvnitø hradu.
};


instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_4_location_condition;
	information = dia_ocpal_4_location_info;
	permanent = TRUE;
	description = "Co mi mùžeš øíct o Hornickém údolí?";
};


func int dia_ocpal_4_location_condition()
{
	return TRUE;
};

func void dia_ocpal_4_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//Co mi mùžeš øíct o Hornickém údolí?
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//Co vím, tak je tu nìkolik dolù - pokud tedy všechny nepadly do drápù skøetùm.
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//Jednotky z vìtší èásti sestávají z vìzòù, ale najdeš tu i pár paladinù.
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
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//Obklíèili nás skøeti! Ale budeme se bránit do posledního muže. A Innos nám pomùže v boji proti drakùm!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//Už je to pìknì dlouho, co skøeti zaútoèili. Kde jsou ty zatracený posily?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//Nemùžeš pøeci vážnì vìøit tomu, že ty jako drakobijec máš šanci proti VŠEM tìm drakùm?
			}
			else
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//Ti takzvaní drakobijci toho moc nesvedou!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//Díky Innosovi! Ty zatracený potvory jsou poraženy!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//Nezdá se, že by smrt drakù skøety nìjak vyvedla z míry. Proè u Innose koneènì neodtáhnou? Dìje se tu nìco divnýho.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//Ta zpropadená brána se zasekla. Skøeti se valí do hradu a nic už je nemùže zastavit.
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//Nìkdo musí informovat lorda Hagena. Potøebujeme ho TADY.
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

