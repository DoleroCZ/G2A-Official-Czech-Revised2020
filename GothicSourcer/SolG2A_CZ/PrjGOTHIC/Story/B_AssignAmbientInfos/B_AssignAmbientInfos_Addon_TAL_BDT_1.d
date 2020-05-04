
instance DIA_ADDON_TAL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_1_exit_condition;
	information = dia_addon_tal_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_1_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_1_hi_condition;
	information = dia_addon_tal_bdt_1_hi_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_addon_tal_bdt_1_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Po�k�m dokud nepo��daj� o dal��ho.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Ze v�ech lid� venku se jedin� Franco dost�v� dovnit�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Te� kdy� je Franco mrtv�, budu douf�m m�t v�t�� �anci.
	};
};


instance DIA_ADDON_TAL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_1_lager_condition;
	information = dia_addon_tal_bdt_1_lager_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o t�bo�e?";
};


func int dia_addon_tal_bdt_1_lager_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mi m��e� ��ct o t�bo�e?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//D�vej bacha koho obt�uje�. Pokud si za�ne� s dob�e postavenou osobou, p�jdou po tob� v�ichni.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//V�t�ina z nich nechce ztratit svoje zlato - proto se n�kte�� navz�jem br�n�.
};


instance DIA_ADDON_TAL_BDT_1_RAVEN(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_1_raven_condition;
	information = dia_addon_tal_bdt_1_raven_info;
	permanent = TRUE;
	description = "Co v� o Ravenovi?";
};


func int dia_addon_tal_bdt_1_raven_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_raven_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co v� o Ravenovi?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Je to chlapik, kter� sem jako prvni p�i�el s jeho bandou.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//Je to v�dce t�bora. Douf�m, �e si s n�m nic nehodl� za��t.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Jednou po��dali o p�t nov�ch lid� proto�e si vylil sv�j vztek na sv�ch vlastn�ch lidech.
};

func void b_assignambientinfos_addon_tal_bdt_1(var C_NPC slf)
{
	dia_addon_tal_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_raven.npc = Hlp_GetInstanceID(slf);
};

