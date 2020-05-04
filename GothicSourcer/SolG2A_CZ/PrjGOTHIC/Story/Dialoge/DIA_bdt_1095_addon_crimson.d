
instance DIA_ADDON_CRIMSON_EXIT(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 999;
	condition = dia_addon_crimson_exit_condition;
	information = dia_addon_crimson_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_crimson_exit_condition()
{
	return TRUE;
};

func void dia_addon_crimson_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRIMSON_PICKPOCKET(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 900;
	condition = dia_addon_crimson_pickpocket_condition;
	information = dia_addon_crimson_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_crimson_pickpocket_condition()
{
	return c_beklauen(66,66);
};

func void dia_addon_crimson_pickpocket_info()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_BACK,dia_addon_crimson_pickpocket_back);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_PICKPOCKET,dia_addon_crimson_pickpocket_doit);
};

func void dia_addon_crimson_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};

func void dia_addon_crimson_pickpocket_back()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};


instance DIA_ADDON_CRIMSON_HI(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_hi_condition;
	information = dia_addon_crimson_hi_info;
	permanent = FALSE;
	description = "Co to dìláš? Tavíš zlato?";
};


func int dia_addon_crimson_hi_condition()
{
	return TRUE;
};

func void dia_addon_crimson_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co to dìláš? Tavíš zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Ne, vaøím zeleninu - samozøejmì, že tady tavím zlato a dìlám z nìj mince.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Zkus si pøedstavit krásný veèer, když pøide Raven a vmáèkne mi do ruky známku za dìlání mincí.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Z jednoho zlatého nugetu udìlám kopu mincí - má práce je dobrá, nikdo nepozná rozdíl.
};


instance DIA_ADDON_CRIMSON_HOW(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_how_condition;
	information = dia_addon_crimson_how_info;
	permanent = FALSE;
	description = "Kolik mincí mi dáš za nuget?";
};


func int dia_addon_crimson_how_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_hi))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_how_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Kolik mincí mi dáš za nuget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nevím to jistì, ale víš co, udìlám ti pøátelskou cenu, dám ti ...
	b_say_gold(self,other,10);
};


instance DIA_ADDON_CRIMSON_FEILSCH(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_feilsch_condition;
	information = dia_addon_crimson_feilsch_info;
	permanent = FALSE;
	description = "Chci víc zlatých!";
};


func int dia_addon_crimson_feilsch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_feilsch_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Chci víc zlatých!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm ... ne. To je normální cena, jakou dostane každý.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Myslím, že toto je cena pro pøítele.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//To je, tady jsme všichni pøátelé.
};


instance DIA_ADDON_CRIMSON_GOLD(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 99;
	condition = dia_addon_crimson_gold_condition;
	information = dia_addon_crimson_gold_info;
	permanent = TRUE;
	description = "Obchodujme ...";
};


func int dia_addon_crimson_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Obchodujme ...
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn všechny zlaté nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn 1 zlatý nuget",dia_addon_crimson_gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale ty nemáš žádné nugety
	};
};

func void dia_addon_crimson_gold_back()
{
	Info_ClearChoices(dia_addon_crimson_gold);
};

func void dia_addon_crimson_gold_alle()
{
	var int currentnuggets;
	currentnuggets = Npc_HasItems(other,itmi_goldnugget_addon);
	b_giveinvitems(other,self,itmi_goldnugget_addon,currentnuggets);
	b_giveinvitems(self,other,itmi_gold,currentnuggets * 10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn všechny zlaté nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn 1 zlatý nuget",dia_addon_crimson_gold_1);
	};
};

func void dia_addon_crimson_gold_1()
{
	b_giveinvitems(other,self,itmi_goldnugget_addon,1);
	b_giveinvitems(self,other,itmi_gold,10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn všechny zlaté nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vymìn 1 zlatý nuget",dia_addon_crimson_gold_1);
	};
};

func void b_say_crimsonbeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(prosebnì) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_ADDON_CRIMSON_RAVEN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 9;
	condition = dia_addon_crimson_raven_condition;
	information = dia_addon_crimson_raven_info;
	permanent = FALSE;
	description = "Co víš o Ravenovi?";
};


func int dia_addon_crimson_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nebudeš tomu vìøit. Byl jsem tam. Vidìl jsem, co dìlal v hrobce!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(bázlivì) Mumlal a øíkal jakási divná slova. Znovu a znovu ...
	b_say_crimsonbeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(hlasitì) A potom jsem uvidìl oslepující svìtlo a slyšel ten strašný výkøik.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//Mùj bože, ten zvuk. Bylo to, jako by se hroutil svìt.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven s tím mluvil, rozprávìli - Raven a TEN zvuk!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nevzpomínám si, o èem spolu mluvili - vzpomínám si pouze, že jsem se nemohl ještì dlouho pohnout.
};


instance DIA_ADDON_CRIMSON_FATAGN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 98;
	condition = dia_addon_crimson_fatagn_condition;
	information = dia_addon_crimson_fatagn_info;
	permanent = TRUE;
	description = "Mùžeš mi zopakovat Ravenova slova jìštì jednou?";
};


func int dia_addon_crimson_fatagn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_raven) && (CRIMSON_SAYBELIAR < 4))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_fatagn_info()
{
	CRIMSON_SAYBELIAR = CRIMSON_SAYBELIAR + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Mùžeš mi zopakovat Ravenova slova jìštì jednou?
	if(CRIMSON_SAYBELIAR <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Jistì, mùžu.
		Info_ClearChoices(dia_addon_crimson_fatagn);
		Info_AddChoice(dia_addon_crimson_fatagn,"Ano?",dia_addon_crimson_fatagn_los);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Myslím že bude lépe, když toho necháme ...
	};
};

func void dia_addon_crimson_fatagn_los()
{
	Snd_Play("Mystery_09");
	b_say_crimsonbeliar();
	if(CRIMSON_SAYBELIAR == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(dia_addon_crimson_fatagn);
};

