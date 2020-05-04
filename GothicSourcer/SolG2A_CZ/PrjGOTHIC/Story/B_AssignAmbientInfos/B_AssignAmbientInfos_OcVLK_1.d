
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
	description = "Kdo tomu tady velí?";
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
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Velitel Garond. Ale od chvíle, co se tu situace zhoršila, ho nikdo nevidìl nikde jinde než v trùnním sálu. Je mi líto, že to vzalo tak špatný konec.
};


instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_1_location_condition;
	information = dia_ocvlk_1_location_info;
	permanent = TRUE;
	description = "Co víš o Hornickém údolí?";
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
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Co víš o Hornickém údolí?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//Nìkolik z našich hochù je ještì stále v dolech a snaží se tìžit. Teda alespoò, co vím.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Nechtìl bych si to s nimi mìnit. Celé údolí se hemží skøety. A to se ani nezmiòuju o dracích.
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
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Skøeti nás mají pøesnì tam, kde nás chtìli mít! Bez posil se dlouho neudržíme! Docela mì pøekvapuje, že nás draci jednoduše nedodìlali všechny.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//Tak se koneènì pøece jen doèkáme posil.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//Slyším dobøe, že všichni draci byli zabiti? Díky Innosovi!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Tahle zpropadená ruda. Mìli bysme ji všechnu shodit dolù z cimbuøí. Pak by nás skøeti možná nechali na pokoji.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Ty smìšné bedny, které tak nedbale naházeli pøed vchod, nemùžou skøetùm nijak pøekazit jejich plány!
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

