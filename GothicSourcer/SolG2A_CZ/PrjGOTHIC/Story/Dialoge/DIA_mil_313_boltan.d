
instance DIA_BOLTAN_EXIT(C_INFO)
{
	npc = mil_313_boltan;
	nr = 999;
	condition = dia_boltan_exit_condition;
	information = dia_boltan_exit_info;
	permanent = TRUE;
	description = "Jenom tudy proch�z�m.";
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
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Co tady chce�?
};


instance DIA_BOLTAN_TOCONVICTS(C_INFO)
{
	npc = mil_313_boltan;
	nr = 2;
	condition = dia_boltan_toconvicts_condition;
	information = dia_boltan_toconvicts_info;
	permanent = TRUE;
	description = "Cht�l bych vid�t v�zn�.";
};


func int dia_boltan_toconvicts_condition()
{
	return TRUE;
};

func void dia_boltan_toconvicts_info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Cht�l bych vid�t v�zn�.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Jasan, jen b� a rozlu� se se sv�m kamar�d��kem.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Zab�sli jsme tu svini, co zavra�dila paladina Lothara.
		};
	}
	else if((CANTHAR_AUSGELIEFERT == FALSE) && (SARAH_AUSGELIEFERT == FALSE) && (RENGARU_AUSGELIEFERT == FALSE) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//V�echny cely jsou moment�ln� pr�zdn�.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Dobr�, k�mo.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Samoz�ejm�.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Jen b�, ale nebu� tam dlouho, rozum�?
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
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Nep�i�el jsi odsud vysekat toho sv�ho p��tel��ka, �e ne?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Tak na to zapome�! Jakmile spust�m poplach, okam�it� tady budou ostatn� ho�i!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//A pak si d�me p�r �oldan�tk�! (o�kliv� se zasm�je)
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
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Hej, ty jsi ten chlap�k, co ob�aloval toho kupce Canthara.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//P�i�la se za n�j p�imluvit spousta lid�. Docela v�znamn�ch lid�.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Cel� ta v�c musela b�t jedno velk� nedorozum�n�. To se st�v�.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//P��t� by sis m�l d�vat v�t�� pozor, koho d�v� do v�zen�.
};

