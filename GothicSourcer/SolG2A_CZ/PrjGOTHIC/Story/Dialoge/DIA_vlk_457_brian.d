
instance DIA_BRIAN_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_exit_condition;
	information = dia_brian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_PICKPOCKET(C_INFO)
{
	npc = vlk_457_brian;
	nr = 900;
	condition = dia_brian_pickpocket_condition;
	information = dia_brian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_brian_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_brian_pickpocket_info()
{
	Info_ClearChoices(dia_brian_pickpocket);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_BACK,dia_brian_pickpocket_back);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_PICKPOCKET,dia_brian_pickpocket_doit);
};

func void dia_brian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brian_pickpocket);
};

func void dia_brian_pickpocket_back()
{
	Info_ClearChoices(dia_brian_pickpocket);
};


instance DIA_BRIAN_HALLO(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_hallo_condition;
	information = dia_brian_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brian_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_brian_hallo_info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//Jsi ve mìstì nový, co? Jsem Brian! Jsem uèedník mistra Harada.
};


instance DIA_BRIAN_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_aboutlehrling_condition;
	information = dia_brian_aboutlehrling_info;
	permanent = FALSE;
	description = "Co obnáší být kováøským uèedníkem?";
};


func int dia_brian_aboutlehrling_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//Co obnáší být kováøským uèedníkem?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Proè se ptáš? Chceš se stát mým nástupcem?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Možná.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Proè ne... Já už se brzy vyuèím, a pak opustím mìsto.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//Ale ne kvùli Haradovi. Je to dobrý mistr - hodnì jsem se od nìho nauèil.
};


instance DIA_BRIAN_WHYLEAVE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_whyleave_condition;
	information = dia_brian_whyleave_info;
	permanent = FALSE;
	description = "Proè chceš opustit mìsto?";
};


func int dia_brian_whyleave_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_whyleave_info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Proè chceš opustit mìsto?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Protože mi ti lidé tady lezou na nervy! Hlavnì ostatní mistøi.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//Ještì si pamatuju, co bylo kolem mého pøijetí za uèedníka u Harada povyku.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Vážnì, každej z tìch šaškù do toho musel kecat.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//Chci se rozhodovat sám, ke komu pùjdu, nebo nepùjdu dìlat uèedníka.
};


instance DIA_BRIAN_OTHERMASTERS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_othermasters_condition;
	information = dia_brian_othermasters_info;
	permanent = FALSE;
	description = "Kdo jsou ostatní mistøi?";
};


func int dia_brian_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_whyleave) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_othermasters_info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//Kdo jsou ostatní mistøi?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//No, je to tesaø Thorben, výrobce lukù Bosper, alchymista Constantino a Matteo.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//Prodává zbroje, ale je pøedevším kupcem.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//Všichni mistøi mají své obchody tady v téhle ulici.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//A Constantinova dílna je v prùchodu ke chrámu.
};


instance DIA_BRIAN_ABOUTHARAD(C_INFO)
{
	npc = vlk_457_brian;
	nr = 2;
	condition = dia_brian_aboutharad_condition;
	information = dia_brian_aboutharad_info;
	permanent = FALSE;
	description = "Øekni mi nìco víc o mistru Haradovi.";
};


func int dia_brian_aboutharad_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_aboutharad_info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Øekni mi nìco víc o mistru Haradovi.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//Teï zrovna nemá moc dobrou náladu.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//Pøed nìkolika dny za ním pøišli paladinové s rozkazem ukovat nìjaké meèe.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//Zakázali mu prodávat meèe komukoli jinému.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Teï døe celé dny a noci, jen aby tu zakázku dokonèil co nejdøíve.
};


instance DIA_BRIAN_NEEDWEAPONS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_needweapons_condition;
	information = dia_brian_needweapons_info;
	permanent = FALSE;
	description = "Mohu si od tebe koupit nìjaké zbranì?";
};


func int dia_brian_needweapons_condition()
{
	return TRUE;
};

func void dia_brian_needweapons_info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Mohu si od tebe koupit nìjaké zbranì?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Vážnì ne. Jsem jen pomocník.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//Ty zbranì, co se vyrábìjí tady v kovárnì, sebere domobrana a odnese je do vìží.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//Ale kdybys mìl zájem o nìco, co potøebuješ v kovárnì, možná bych ti mohl pomoct.
};


var int brian_trade_einmal;

instance DIA_BRIAN_WASKAUFEN(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_waskaufen_condition;
	information = dia_brian_waskaufen_info;
	permanent = TRUE;
	description = "Co od tebe mùžu získat?";
	trade = TRUE;
};


func int dia_brian_waskaufen_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_waskaufen_info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//Co od tebe mùžu získat?
	b_givetradeinv(self);
	if(Npc_IsDead(harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Jelikož ještì poøád mám nìkolik ocelových prutù, mùžou být tvoje. Obávám se, že to je všechno.
		if(MIS_JACK_NEWLIGHTHOUSEOFFICER == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//Jelikož už tu není Harad, dává na mì domobrana pozor.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//Já kovárnu nedokážu dál vést. Mají strach, že to celé prodám a prásku do bot.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//Mùžu ti prodat pár ocelových prutù.
	};
	if(BRIAN_TRADE_EINMAL == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Haradùv uèedník Brian prodává ocelové pruty.");
		BRIAN_TRADE_EINMAL = TRUE;
	};
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_BRIAN_KAP3_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap3_exit_condition;
	information = dia_brian_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brian_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_repairnecklace_condition;
	information = dia_brian_repairnecklace_info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};


func int dia_brian_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_brian_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//Jsem jen pomocník, budu rád, když nìkdy dokážu ukovat alespoò nìjaký nùž.
	if(Npc_IsDead(harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Šperky? Mìl by ses zeptat mistra.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BRIAN_KAP4_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap4_exit_condition;
	information = dia_brian_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brian_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_KAP5_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap5_exit_condition;
	information = dia_brian_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_brian_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_NEWLIGHTHOUSEOFFICER(C_INFO)
{
	npc = vlk_457_brian;
	nr = 51;
	condition = dia_brian_newlighthouseofficer_condition;
	information = dia_brian_newlighthouseofficer_info;
	description = "Zaslechl jsem, že ses zajímal o Jackùv starý maják.";
};


func int dia_brian_newlighthouseofficer_condition()
{
	if((KAPITEL == 5) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_newlighthouseofficer_info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//Zaslechl jsem, že ses zajímal o Jackùv starý maják.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Jack uvažuje o tom, že by se vrátil na moøe. Ale jeho maják pak nebude mít kdo hlídat.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//Ale snad je Jackovi jasné, že si tam u majáku zaøídím kovárnu, když tam už nebude.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Je v tom nìjaký problém?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//(smích) Pro mì ne. Stejnì se mi nechce zùstávat u Harada. Žádnej problém.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Souhlas. Uvidíme se u Jacka.
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_BRIAN_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_lighthousefree_condition;
	information = dia_brian_lighthousefree_info;
	permanent = TRUE;
	description = "A co jsi øíkal?";
};


func int dia_brian_lighthousefree_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_brian_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//A co jsi øíkal?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//No nazdar, takovej bordel. Jack to tu nepozná, až s tím budu hotov.
};

