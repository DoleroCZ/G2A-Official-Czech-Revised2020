
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
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Ještì že jsi tu. Máme strašný strach.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//To sotva. Co se dìje?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Mìj oèí nastražené a jílec pøi ruce, je tu velmi nebezpeèno.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Nìkterá zvíøata jsme pøedtím nikdy nevidìli.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Nedaleko je rozlehlá tùò, mùže tam být už stovky let.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nebylo dne, kdy na nás bestie od tùnì neútoèily.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Varuji tì, buï opatrný kdykoli kolem procházíš.
};


instance DIA_ADDON_CRONOS_WAECHTERADW(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 5;
	condition = dia_addon_cronos_waechteradw_condition;
	information = dia_addon_cronos_waechteradw_info;
	description = "Víš nìco nového ohlednì kamenných strážcù?";
};


func int dia_addon_cronos_waechteradw_condition()
{
	return TRUE;
};

func void dia_addon_cronos_waechteradw_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Víš nìco nového ohlednì kamenných strážcù?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Èást jsme jich zneškodnili.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stojí jako kamenné sochy a za boha se nepohnou.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Vzhled dokáže oklamat. Octneš-li se moc blízko, zaútoèí na tebe.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Tedy není pochybností. Zdroj jejich síly musí být nìkde tady, kdekoli.
};


instance DIA_ADDON_CRONOS_ADW_TRADE(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 99;
	condition = dia_addon_cronos_adw_trade_condition;
	information = dia_addon_cronos_adw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Chtìl bych nìco koupit.";
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

