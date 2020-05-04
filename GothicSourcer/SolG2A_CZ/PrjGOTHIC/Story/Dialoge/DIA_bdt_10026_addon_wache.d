
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
	description = "Co se dìje?";
};


func int dia_addon_10026_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co se dìje?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		CreateInvItems(self,itfo_bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//Škoda, že jich pár chcíplolo. Budeme muset nìkde najít nové.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Tito chlapi jsou úplnì vyèerpaní. Mohlo by to být tím, že dostávají málo najíst. (smìje se)
		b_useitem(self,itfo_bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Nicménì radìji bych je poslal zpátky do dolu, než jim dávat maso.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Ti minulí otroci odpadli pøíliš brzy. Tak to vypadá, že budeme muset kopáèe znovu ztlouct.
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
	description = "Co víš o kryptì?";
};


func int dia_addon_10026_wache_gruft_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Co víš o kryptì?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Na konci této cesty je krypta.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(bez starostí) Sleduj mrtvé tìla a najdeš to.
};

