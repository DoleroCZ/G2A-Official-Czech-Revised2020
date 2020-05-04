
instance DIA_RODDJG_EXIT(C_INFO)
{
	npc = djg_702_rod;
	nr = 999;
	condition = dia_roddjg_exit_condition;
	information = dia_roddjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_roddjg_exit_condition()
{
	return TRUE;
};

func void dia_roddjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_HALLO(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_hallo_condition;
	information = dia_roddjg_hallo_info;
	description = "Jsi v po��dku?";
};


func int dia_roddjg_hallo_condition()
{
	if(DJG_SWAMPPARTY == FALSE)
	{
		return TRUE;
	};
};

func void dia_roddjg_hallo_info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//Jsi v po��dku?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//Ty boty m� zabijou! Ta nov� zbroj je v�born�, ale pro� je to �emen� na bot�ch tak nat�sno?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//Kdy� jsem je rozv�zal, zase mi m�lem spadly.
	if((Npc_IsDead(swampdragon) == FALSE) && (DJG_SWAMPPARTY == FALSE))
	{
		Info_AddChoice(dia_roddjg_hallo,"Na co �ek�?",dia_roddjg_hallo_warten);
	};
	Info_AddChoice(dia_roddjg_hallo,"Kdes sebral ty boty?",dia_roddjg_hallo_woher);
};

func void dia_roddjg_hallo_woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//Kdes sebral ty boty?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//Ten starej skunk Bennet je ud�lal pro drakobijce a nechal si za ty �krp�ly kr�lovsky zaplatit.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//A� se mi n�kdy dostane do rukou, nech�m ho nejd��v ty v�ci se�rat a pak z n�j vyml�tim svoje prachy.
};

func void dia_roddjg_hallo_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//Na co �ek�?
	Info_ClearChoices(dia_roddjg_hallo);
	if(Npc_IsDead(djg_cipher) == FALSE)
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//Na to, a� se Cipher ur��� p�inejmen��m zvednout ten sv�j zadek. U� je na�ase, abysme vypadli.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//P�em��lel jsem o tom, �e bychom m�li bl� prozkoumat tamtu ba�inatou oblast.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//Co m� na mysli? M�me tam spolu zaj�t a pod�vat se, co by se tam dalo naj�t?
		Info_AddChoice(dia_roddjg_hallo,"Zajdu tam s�m.",dia_roddjg_hallo_warten_allein);
		Info_AddChoice(dia_roddjg_hallo,"Co v� o t�ch ba�in�ch?",dia_roddjg_hallo_warten_wasweisstdu);
		Info_AddChoice(dia_roddjg_hallo,"Tak jdeme.",dia_roddjg_hallo_warten_zusammen);
	};
};

func void dia_roddjg_hallo_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//Tak jdeme.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//Dobr�, tak jdeme.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void dia_roddjg_hallo_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//Co v� o t�ch ba�in�ch?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//Jen to, �e smrd� a� do nebe a �e je tam mo�n� hora zlata. To by mohlo sta�it, ne?
};

func void dia_roddjg_hallo_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//Zajdu tam s�m.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//Fajn, tak ti p�eju hodn� �t�st�.
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_WARTEMAL(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_wartemal_condition;
	information = dia_roddjg_wartemal_info;
	permanent = TRUE;
	description = "Co to s tebou je?";
};


func int dia_roddjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_roddjg_hallo) || (DJG_SWAMPPARTY == TRUE))
	{
		return TRUE;
	};
};

func void dia_roddjg_wartemal_info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//Co to s tebou je?
	if(((DJG_SWAMPPARTY == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(djg_cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//Hele, chlape. M�m dojem, �e se n�m tahle v�c za��n� vymykat z rukou. Prost� odsud potichou�ku miz�m.
		DJG_SWAMPPARTY = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(kleje) Tyhle boty! Tyhle zpropaden� boty!
	};
	if(Npc_IsDead(swampdragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//A co bude� d�lat te�?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//Ty se teda dok�e� pt�t! Ze v�eho nejd��v si koup�m n�jak� nov� boty, chlape!
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROD_PICKPOCKET(C_INFO)
{
	npc = djg_702_rod;
	nr = 900;
	condition = dia_rod_pickpocket_condition;
	information = dia_rod_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rod_pickpocket_condition()
{
	return c_beklauen(16,320);
};

func void dia_rod_pickpocket_info()
{
	Info_ClearChoices(dia_rod_pickpocket);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_BACK,dia_rod_pickpocket_back);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_PICKPOCKET,dia_rod_pickpocket_doit);
};

func void dia_rod_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rod_pickpocket);
};

func void dia_rod_pickpocket_back()
{
	Info_ClearChoices(dia_rod_pickpocket);
};

