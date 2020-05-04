
instance DIA_GRIMES_EXIT(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 999;
	condition = dia_grimes_exit_condition;
	information = dia_grimes_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int grimes_first;

func int dia_grimes_exit_condition()
{
	return TRUE;
};

func void dia_grimes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMES_HALLO(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_hallo_condition;
	information = dia_grimes_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimes_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_grimes_hallo_info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ty? Kdo by to byl �ekl, �e se znovu setk�me.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Tak to vypad�, �e oba v�me, jak z�stat na �ivu a jak vid� propadl jsem prospektorstv�.
	if(GRIMES_FIRST == FALSE)
	{
		Wld_InsertNpc(snapper,"OW_PATH_148_A");
		Wld_InsertNpc(snapper,"OW_PATH_146");
		Wld_InsertNpc(snapper,"OW_PATH_147");
		Wld_InsertNpc(snapper,"OW_PATH_148");
		Wld_InsertNpc(snapper,"OW_PATH_264");
		GRIMES_FIRST = TRUE;
	};
};


instance DIA_GRIMES_ERZ(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_erz_condition;
	information = dia_grimes_erz_info;
	permanent = FALSE;
	description = "Kolik rudy u� jsi vyt�il?";
};


func int dia_grimes_erz_condition()
{
	if((KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_grimes_erz_info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Kolik rudy u� jsi vyt�il?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//N�kolik beden. Ale nic z toho tady nez�stalo.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladin Marcos se rozhodl vz�t rudu do hradu, proto�e n�s po��d ohro�ovali sk�eti.
};


instance DIA_GRIMES_WEG(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_weg_condition;
	information = dia_grimes_weg_info;
	permanent = FALSE;
	description = "V�, kudy se Marcos vydal?";
};


func int dia_grimes_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_erz) && (Npc_KnowsInfo(other,dia_marcos_garond) == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimes_weg_info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//V�, kudy se Marcos vydal?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Ne�el p��mou cestou - m�sto toho cht�l p�ej�t �eku tam, kde byla zamrzl�.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Cht�l si to zkr�tit a dostat se k hradu ze z�padu.
};


instance DIA_GRIMES_GRIMES(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_grimes_condition;
	information = dia_grimes_grimes_info;
	permanent = FALSE;
	description = "Nechce� opustit �dol�?";
};


func int dia_grimes_grimes_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grimes_grimes_info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Nechce� opustit �dol�?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Ne, z�stanu a budu t�it rudu.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Nenech�m se zastavit n�kolika sk�ety - u� jsem p�e�kal hor�� �asy.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Pamatuje�, jak jsme t�ili ve star�m dole, a najednou se dovnit� provalila voda...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Ale to jsou star� p��b�hy.
};


instance DIA_GRIMES_PERM(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_perm_condition;
	information = dia_grimes_perm_info;
	permanent = TRUE;
	description = "Jak to jinak jde?";
};


func int dia_grimes_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_grimes_perm_info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Jak to jinak jde?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Tahle sk�la je zatracen� nepoddajn� - �pln� jako by se sna�ila n�m zabr�nit v z�sk�v�n� rudy.
};


instance DIA_GRIMES_PICKPOCKET(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 900;
	condition = dia_grimes_pickpocket_condition;
	information = dia_grimes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_grimes_pickpocket_condition()
{
	return c_beklauen(43,21);
};

func void dia_grimes_pickpocket_info()
{
	Info_ClearChoices(dia_grimes_pickpocket);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_BACK,dia_grimes_pickpocket_back);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_PICKPOCKET,dia_grimes_pickpocket_doit);
};

func void dia_grimes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimes_pickpocket);
};

func void dia_grimes_pickpocket_back()
{
	Info_ClearChoices(dia_grimes_pickpocket);
};

