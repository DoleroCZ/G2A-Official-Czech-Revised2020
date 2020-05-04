
instance DIA_ADDON_CRONOS_ADW_EXIT(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 999;
	condition = dia_addon_cronos_adw_exit_condition;
	information = dia_addon_cronos_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_ADWHELLO(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 1;
	condition = dia_addon_cronos_adwhello_condition;
	information = dia_addon_cronos_adwhello_info;
	important = TRUE;
};


func int dia_addon_cronos_adwhello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adwhello_info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Je�t� �e jsi tu. M�me stra�n� strach.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//To sotva. Co se d�je?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//M�j o�� nastra�en� a j�lec p�i ruce, je tu velmi nebezpe�no.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//N�kter� zv��ata jsme p�edt�m nikdy nevid�li.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Nedaleko je rozlehl� t��, m��e tam b�t u� stovky let.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nebylo dne, kdy na n�s bestie od t�n� ne�to�ily.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Varuji t�, bu� opatrn� kdykoli kolem proch�z�.
};


instance DIA_ADDON_CRONOS_WAECHTERADW(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 5;
	condition = dia_addon_cronos_waechteradw_condition;
	information = dia_addon_cronos_waechteradw_info;
	description = "V� n�co nov�ho ohledn� kamenn�ch str�c�?";
};


func int dia_addon_cronos_waechteradw_condition()
{
	return TRUE;
};

func void dia_addon_cronos_waechteradw_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//V� n�co nov�ho ohledn� kamenn�ch str�c�?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//��st jsme jich zne�kodnili.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stoj� jako kamenn� sochy a za boha se nepohnou.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Vzhled dok�e oklamat. Octne�-li se moc bl�zko, za�to�� na tebe.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Tedy nen� pochybnost�. Zdroj jejich s�ly mus� b�t n�kde tady, kdekoli.
};


instance DIA_ADDON_CRONOS_ADW_TRADE(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 99;
	condition = dia_addon_cronos_adw_trade_condition;
	information = dia_addon_cronos_adw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Cht�l bych n�co koupit.";
};


func int dia_addon_cronos_adw_trade_condition()
{
	return TRUE;
};


var int dia_addon_cronos_adw_trade_onetime;

func void dia_addon_cronos_adw_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};

