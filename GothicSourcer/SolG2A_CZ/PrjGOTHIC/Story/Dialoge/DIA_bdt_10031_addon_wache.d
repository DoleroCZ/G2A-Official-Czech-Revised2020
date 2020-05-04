
instance DIA_ADDON_BDT_10031_WACHE_EXIT(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 999;
	condition = dia_addon_10031_wache_exit_condition;
	information = dia_addon_10031_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10031_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10031_WACHE_SCATTY(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_scatty_condition;
	information = dia_addon_10031_wache_scatty_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10031_wache_scatty_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_scatty_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hej, snad nechce� j�t dolovat? Nezapome� si vz�t n�jak� vybaven� od Scattyho.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co pot�ebuji?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Aspo� krump��. A n�jak� j�dlo ti taky nebude na �kodu.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//A taky p�r l��iv�ch lektvar�? Jsou tam d�ln� �ervi.
	AI_StopProcessInfos(self);
};


var int wache_joker;

instance DIA_ADDON_BDT_10031_WACHE_HI(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_hi_condition;
	information = dia_addon_10031_wache_hi_info;
	permanent = TRUE;
	description = "V�e ok?";
};


func int dia_addon_10031_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//V�e ok?
	if((SKLAVEN_FLUCHT == TRUE) && (WACHE_JOKER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Chlape, otroci maj� nasp�ch.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Kdy� se doslechli, �e jsou voln�, ut�kali pry� jako kr�lici!
		WACHE_JOKER = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Ano. Ned�lej bordel a bude v�e v po��dku.
};

