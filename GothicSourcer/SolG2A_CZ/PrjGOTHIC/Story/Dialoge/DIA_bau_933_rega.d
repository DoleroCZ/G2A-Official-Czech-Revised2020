
instance DIA_REGA_EXIT(C_INFO)
{
	npc = bau_933_rega;
	nr = 999;
	condition = dia_rega_exit_condition;
	information = dia_rega_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rega_exit_condition()
{
	return TRUE;
};

func void dia_rega_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGA_HALLO(C_INFO)
{
	npc = bau_933_rega;
	nr = 3;
	condition = dia_rega_hallo_condition;
	information = dia_rega_hallo_info;
	description = "Jak se vede?";
};


func int dia_rega_hallo_condition()
{
	return TRUE;
};

func void dia_rega_hallo_info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//Jak se vede?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Ty jsi z m�sta, co?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Jsi jeden z t�ch Onarov�ch �old�k�, co?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Ty jsi m�g, co?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Ty nejsi jeden z n�s, co?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//Na tv�m m�st� bych odsud p�kn� rychle vypadla.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Pro�?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//Nikdy to tady nebyl ��dn� med, ale alespo� jsme m�li klid po celou dobu, co d�l�me pro Sekoba.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Ale posledn� dobu u� je to nesnesiteln�.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Banditi jsou �pln� v�ude, poln� �k�dci ni�� ve�kerou �rodu a z velkostatk��e se stal p�knej kru�as.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "Tak�e se boj�te velkostatk��e?";
};


func int dia_rega_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_onar_info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Tak�e se boj�te velkostatk��e?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Se vsa�. Kdy� se mu nel�b� n��� ksicht, po�le na n�j sv� �old�ky. To je taky posledn� chv�le, kdy toho nebo��ka n�kdo uvid�.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Tak�e rad�j dr��me zob�k.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "Copak se o ty poln� �k�dce nepostaraj� �old�ci?";
};


func int dia_rega_sld_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_sld_info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Copak se o ty poln� �k�dce nepostaraj� �old�ci?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Nev�m, za co jsou placen�, ale ur�it� ne za pomoc n�m, oby�ejn�m lidem.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//Probl�m s poln�mi �k�dci je te� na mal�ch farm���ch, co si pronajali od Onara p�du.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "Jak se br�n�te proti bandit�m?";
};


func int dia_rega_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_banditen_info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Jak se br�n�te proti bandit�m?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Nijak. Prost� ute�eme. Je�t� n�co?
};


instance DIA_REGA_BRONKO(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_bronko_condition;
	information = dia_rega_bronko_info;
	description = "(Zeptat se na Bronca.)";
};


func int dia_rega_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && (MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_rega_bronko_info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//Tak kdo je ten hnusnej chl�pek t�mhle?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Nep�eber si to �patn�, ale nechci se dostat do pot��. Zeptej se n�koho jin�ho.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "No tak, trochu kur�e.";
};


func int dia_rega_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_permkap1_info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//No tak, trochu kur�e.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//Tob� se to mluv�. Ty p�ece bydl� ve m�st�.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Kdyby ti �old�ci nebyli takov� hajzlov�, v�echno ostatn� by se dalo p�ekousnout.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//M�g� je tu po��d m�� a m��. Douf�m, �e ty nejsi posledn�. Pot�ebujeme v�s - v�c ne� kdykoli jindy.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//Nen� to tak snadn�, kdy� mak� pro toho otrok��sk�ho Sekoba.
	};
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PICKPOCKET(C_INFO)
{
	npc = bau_933_rega;
	nr = 900;
	condition = dia_rega_pickpocket_condition;
	information = dia_rega_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rega_pickpocket_condition()
{
	return c_beklauen(25,40);
};

func void dia_rega_pickpocket_info()
{
	Info_ClearChoices(dia_rega_pickpocket);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_BACK,dia_rega_pickpocket_back);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_PICKPOCKET,dia_rega_pickpocket_doit);
};

func void dia_rega_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rega_pickpocket);
};

func void dia_rega_pickpocket_back()
{
	Info_ClearChoices(dia_rega_pickpocket);
};

