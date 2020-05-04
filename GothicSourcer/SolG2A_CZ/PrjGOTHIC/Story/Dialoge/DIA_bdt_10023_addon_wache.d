
instance DIA_ADDON_10023_WACHE_EXIT(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 999;
	condition = dia_addon_10023_wache_exit_condition;
	information = dia_addon_10023_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10023_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_10023_WACHE_HI(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 2;
	condition = dia_addon_10023_wache_hi_condition;
	information = dia_addon_10023_wache_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10023_wache_hi_condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void dia_addon_10023_wache_hi_info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hej, kam jde�? Zam��l� j�t d�le touto stezkou?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//Pro� ne?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Tam dole je v�c otrok�. M��e� vstoupit, jestli chce�. Nebij je moc, jinak nebudou m�ct d�le pracovat.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//Nechceme, aby tady posed�vali. Musej� dolovat zlato.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Vid�m. A kdo za t�m stoj�?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//Je to pod p��m�m dohledem Bloodwyna.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//A mysl�m, �e Raven je tu nejvy��� ��f.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//To je v po��dku. Otroci jsou vlastn� jeho dar Bloodwynovi. U� je v�c nepot�ebuje.
	pardos.attribute[ATR_HITPOINTS] = 70;
	b_logentry(TOPIC_ADDON_SKLAVEN,"Raven nem� dal�� pou�it� pro otroky. Nyn� jsou zotro�eni Bloodwynem.");
};


var int prisonguard_rules;

instance DIA_ADDON_10023_WACHE_GO(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 99;
	condition = dia_addon_10023_wache_go_condition;
	information = dia_addon_10023_wache_go_info;
	permanent = TRUE;
	description = "Osvobo� otroky!";
};


func int dia_addon_10023_wache_go_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_go_info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Osvobo� otroky!
	if(PRISONGUARD_RULES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//Poslouchej k�mo, Bloodwyn tady d�v� rozkazy. Otroci jsou jeho a jen on je m��e osvobodit.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Taky Thorus tady m� n�jakou autoritu. A co ty?
		PRISONGUARD_RULES = TRUE;
		b_logentry(TOPIC_ADDON_SKLAVEN,"Pouze Bloodwyn a Thorus m��ou osvobodit otroky.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Jsi tu v�bec d�le�it�?
	Info_ClearChoices(dia_addon_10023_wache_go);
	Info_AddChoice(dia_addon_10023_wache_go,DIALOG_BACK,dia_addon_10023_wache_go_back);
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"Mluvil jsem s Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else if(Npc_IsDead(bloodwyn) && (Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"(Uka� Bloodwynovu hlavu)",dia_addon_10023_wache_go_blood);
	}
	else
	{
		Info_AddChoice(dia_addon_10023_wache_go,"Jsem ten, kdo rozhoduje o vstupu do dolu.",dia_addon_10023_wache_go_wer);
	};
};

func void dia_addon_10023_wache_go_back()
{
	Info_ClearChoices(dia_addon_10023_wache_go);
};

func void dia_addon_10023_wache_go_wer()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//Jsem ten, kdo rozhoduje o vstupu do dolu.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//Tak ty nyn� d�l� Estebanovu pr�ci? Tak to znamen�, �e tu nem� ��dn� vliv. Vypadni!
	Info_ClearChoices(dia_addon_10023_wache_go);
};


var int wache_einmal;

func void dia_addon_10023_wache_go_blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//To sta��?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(odpudiv�) Dej to pry�! Nechci to vid�t.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Tak�e nyn� u� pust� otroky?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//Poslouchej, Bloodwyn nen� jedinn�, kdo o tom rozhoduje. Nem��u je pustit, dokud mi to Thorus nepovol�.
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_ClearChoices(dia_addon_10023_wache_go);
		Info_AddChoice(dia_addon_10023_wache_go,"Mluvil jsem s Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else
	{
		if(WACHE_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//Ale �ekls, �e Bloodwyn vlastn� otroky.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Jo. Nicm�n� je nemohu pustit bez Thorusova svolen�.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Ty jsi jeden z t�ch chl�pk�, co bez svolen� neud�l� ani prd, �e?
			WACHE_EINMAL = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//Cht�l jsem ��ct, �e ...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//... jo, jo, v�e v po��dku. �et�i slovy.
		};
		Info_ClearChoices(dia_addon_10023_wache_go);
	};
};

func void dia_addon_10023_wache_go_thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Mluvil jsem s Thorusem. Propus� ty otroky!
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Dob�e, kdy� to chce Thorus. Ale zaj�malo by m�, pro� to ud�lal ...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//... ale ty nejsi placen� za to, aby ses divil.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Dobr�, dobr� - tady u� jsem zbyte�n�. Jdu si d�t dobrou pol�vku.
	READY_TOGO = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

