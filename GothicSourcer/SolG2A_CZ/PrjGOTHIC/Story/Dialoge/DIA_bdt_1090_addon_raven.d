
instance DIA_ADDON_RAVEN_EXIT(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 999;
	condition = dia_addon_raven_exit_condition;
	information = dia_addon_raven_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_raven_exit_condition()
{
	return TRUE;
};

func void dia_addon_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAVEN_HI(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 1;
	condition = dia_addon_raven_hi_condition;
	information = dia_addon_raven_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_raven_hi_condition()
{
	return TRUE;
};

func void dia_addon_raven_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Á, podívejme se, kdo to sem pøišel.
	if(c_bodystatecontains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Mùj pán mì varoval, že Innos na mì pošle svého oblíbence.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Neoèekával jsem tì ale tak brzy.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Dobøe, nyní když jsi tu tak rychle, mùžu tì ujistit, že zemøeš stejnì.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Ty jsi ten, kdo zemøe.",dia_addon_raven_hi_du);
	Info_AddChoice(dia_addon_raven_hi,"Tys zaprodal svou duši Beliarovi!",dia_addon_raven_hi_soul);
};

func void dia_addon_raven_hi_du()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ty jsi ten, kdo zemøe.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(posmìšnì) Ty pro mì nejsi hrozba. Já ovládám Beliarùv dráp.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Já povedu draky na pevninu. Spoleènì pak pøinesem temnotu na svìt lidí.
};

func void dia_addon_raven_hi_soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Tys zaprodal svou duši Beliarovi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Byl to ale dobrý obchod. Budu hlavním vùdcem jeho armád.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A ty? Jaká je cena za TVOU duši?
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, slyšel jsem dost. Pojïme na to ...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Dìlám pouze to, co musí být udìláno.",dia_addon_raven_hi_only);
};

func void dia_addon_raven_hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Dìlám pouze to, co musí být udìláno.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(usmìvavì) Poslouchej ho. Opravdový služebníku Innosùv! (hlasitý smích)
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, slyšel jsem dost. Pojïme na to ...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Jsi si jistý, že jsem Innosùv služebník?",dia_addon_raven_hi_sure);
};

func void dia_addon_raven_hi_sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jsi si jistý, že jsem Innosùv služebník?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O èem to mluvíš?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A co když jsem služebník Adanose?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(posmìšnì) Nesmysl!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Možná 'JÁ' také sloužím Beliarovi - nebo pouze sám sobì.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(posmívá se) Dobøe, když je to tak, pak pro mì nejsi vùbec nepøítel.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, slyšel jsem dost. Pojïme na to ...",dia_addon_raven_hi_attack);
};

func void dia_addon_raven_hi_attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobrá, slyšel jsem dost. Pojïme na to ...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(posmívá se) Ty fakt chceš tak rychle zemøít? Dobrá, když to tak chceš ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

