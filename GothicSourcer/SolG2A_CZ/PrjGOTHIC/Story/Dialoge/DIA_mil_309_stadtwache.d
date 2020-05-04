
instance DIA_MIL_309_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 999;
	condition = dia_mil_309_stadtwache_exit_condition;
	information = dia_mil_309_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_309_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_HALLO(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 2;
	condition = dia_mil_309_stadtwache_hallo_condition;
	information = dia_mil_309_stadtwache_hallo_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_mil_309_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Co se stalo?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//V�echno v pohod�. M�li bychom m�t o�i na stopk�ch.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Te� poslouchej. Nem��eme t� pustit do m�sta.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Ale d�m ti tip, a to naprosto zadarmo.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Dr� se d�l od toho lesa p�ed n�mi - potuluj� se po n�m l�t� bestie.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Zalez zp�tky pod �utr�k, �erve!
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Poslouchej - te� m� povolen p��stup do m�sta. Ale to neznamen�, �e by sis tady mohl d�lat, co se ti zl�b�.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Kdy� nebude� dodr�ovat pravidla, p�ijde� o v�echna sv� pr�va!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//Tak b� - padej!
	};
	AI_StopProcessInfos(self);
};

