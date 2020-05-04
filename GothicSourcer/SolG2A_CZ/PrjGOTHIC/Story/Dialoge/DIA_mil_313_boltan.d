
instance DIA_BOLTAN_EXIT(C_INFO)
{
	npc = mil_313_boltan;
	nr = 999;
	condition = dia_boltan_exit_condition;
	information = dia_boltan_exit_info;
	permanent = TRUE;
	description = "Jenom tudy procházím.";
};


func int dia_boltan_exit_condition()
{
	return TRUE;
};

func void dia_boltan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOLTAN_HALLO(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallo_condition;
	information = dia_boltan_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallo_condition()
{
	return TRUE;
};

func void dia_boltan_hallo_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Co tady chceš?
};


instance DIA_BOLTAN_TOCONVICTS(C_INFO)
{
	npc = mil_313_boltan;
	nr = 2;
	condition = dia_boltan_toconvicts_condition;
	information = dia_boltan_toconvicts_info;
	permanent = TRUE;
	description = "Chtìl bych vidìt vìznì.";
};


func int dia_boltan_toconvicts_condition()
{
	return TRUE;
};

func void dia_boltan_toconvicts_info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Chtìl bych vidìt vìznì.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Jasan, jen bìž a rozluè se se svým kamarádíèkem.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Zabásli jsme tu svini, co zavraždila paladina Lothara.
		};
	}
	else if((CANTHAR_AUSGELIEFERT == FALSE) && (SARAH_AUSGELIEFERT == FALSE) && (RENGARU_AUSGELIEFERT == FALSE) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Všechny cely jsou momentálnì prázdné.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Dobrá, kámo.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Samozøejmì.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Jen bìž, ale nebuï tam dlouho, rozumíš?
	};
};


instance DIA_BOLTAN_HALLOBENNET(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallobennet_condition;
	information = dia_boltan_hallobennet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallobennet_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_boltan_hallobennet_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Nepøišel jsi odsud vysekat toho svého pøítelíèka, že ne?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Tak na to zapomeò! Jakmile spustím poplach, okamžitì tady budou ostatní hoši!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//A pak si dáme pár žoldanátkù! (ošklivì se zasmìje)
};


instance DIA_BOLTAN_HALLOCANTHAR(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallocanthar_condition;
	information = dia_boltan_hallocanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallocanthar_condition()
{
	if(((KAPITEL != 3) || ((KAPITEL == 3) && ((MIS_RESCUEBENNET == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (CANTHAR_WIEDERRAUS == TRUE) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_boltan_hallocanthar_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Hej, ty jsi ten chlapík, co obžaloval toho kupce Canthara.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Pøišla se za nìj pøimluvit spousta lidí. Docela významných lidí.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Celá ta vìc musela být jedno velké nedorozumìní. To se stává.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//Pøíštì by sis mìl dávat vìtší pozor, koho dáváš do vìzení.
};

