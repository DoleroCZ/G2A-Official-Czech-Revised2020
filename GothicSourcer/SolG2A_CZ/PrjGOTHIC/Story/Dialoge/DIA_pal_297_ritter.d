
instance DIA_PAL_297_EXIT(C_INFO)
{
	npc = pal_297_ritter;
	nr = 999;
	condition = dia_pal_297_exit_condition;
	information = dia_pal_297_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_297_exit_condition()
{
	return TRUE;
};

func void dia_pal_297_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 2;
	condition = dia_pal_297_trespas_condition;
	information = dia_pal_297_trespas_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_pal_297_trespas_condition()
{
	return TRUE;
};

func void dia_pal_297_trespas_info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak se vede?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Okolí je hodnì nebezpeèné, takže by ses mìl možná vrátit - rozhodnì nechceme, aby se ti nìco stalo.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Vstoupit do údolí chce hodnì odvahy. Alespoò že u sebe máš dostatek léèivých lektvarù.
	};
};


instance DIA_ADDON_PAL_297_RANGERBANDITS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 5;
	condition = dia_addon_pal_297_rangerbandits_condition;
	information = dia_addon_pal_297_rangerbandits_info;
	description = "Prošli tudy v poslední dobì nìjací banditi?";
};


func int dia_addon_pal_297_rangerbandits_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_pal_297_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Prošli tudy v poslední dobì nìjací banditi?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//Nevím o èem to mluvíš. Za tu dobu, co jsme tu na stráži tudy nikdo neprošel. A už vùbec ne nikdo z tìch všivých banditù.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Farmáøi na otázky moc odpovídat nechtìjí. Možná nìco zahlédli.
};

