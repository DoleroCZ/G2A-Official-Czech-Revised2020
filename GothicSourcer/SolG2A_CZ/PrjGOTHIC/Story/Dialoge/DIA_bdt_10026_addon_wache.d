
instance DIA_ADDON_BDT_10026_WACHE_EXIT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 999;
	condition = dia_addon_10026_wache_exit_condition;
	information = dia_addon_10026_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10026_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_HI(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 99;
	condition = dia_addon_10026_wache_hi_condition;
	information = dia_addon_10026_wache_hi_info;
	permanent = TRUE;
	description = "Co se d�je?";
};


func int dia_addon_10026_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co se d�je?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		CreateInvItems(self,itfo_bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//�koda, �e jich p�r chc�plolo. Budeme muset n�kde naj�t nov�.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Tito chlapi jsou �pln� vy�erpan�. Mohlo by to b�t t�m, �e dost�vaj� m�lo naj�st. (sm�je se)
		b_useitem(self,itfo_bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Nicm�n� rad�ji bych je poslal zp�tky do dolu, ne� jim d�vat maso.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Ti minul� otroci odpadli p��li� brzy. Tak to vypad�, �e budeme muset kop��e znovu ztlouct.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_GRUFT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 2;
	condition = dia_addon_10026_wache_gruft_condition;
	information = dia_addon_10026_wache_gruft_info;
	permanent = TRUE;
	description = "Co v� o krypt�?";
};


func int dia_addon_10026_wache_gruft_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Co v� o krypt�?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Na konci t�to cesty je krypta.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(bez starost�) Sleduj mrtv� t�la a najde� to.
};

