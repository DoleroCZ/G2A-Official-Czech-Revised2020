
instance DIA_ADDON_SENYAN_EXIT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 999;
	condition = dia_addon_senyan_exit_condition;
	information = dia_addon_senyan_exit_info;
	permanent = TRUE;
	description = "Uvidíme se ...";
};


func int dia_addon_senyan_exit_condition()
{
	return TRUE;
};

func void dia_addon_senyan_exit_info()
{
	if(SENYAN_ERPRESSUNG == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//Víš co dìlat ...
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SENYAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 900;
	condition = dia_addon_senyan_pickpocket_condition;
	information = dia_addon_senyan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_senyan_pickpocket_condition()
{
	return c_beklauen(45,88);
};

func void dia_addon_senyan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_BACK,dia_addon_senyan_pickpocket_back);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_PICKPOCKET,dia_addon_senyan_pickpocket_doit);
};

func void dia_addon_senyan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void dia_addon_senyan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void b_senyan_attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(podceòuje) Jak mi mùeš bıt nápomocen, pane k nièemu?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(volá) Hej lidi, podívejte, kdo to je!
	SENYAN_CALLED = TRUE;
	SENYAN_ERPRESSUNG = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_senyan_erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Kolik chceš?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(hraje provinilého) Ale ne, prosím. Nikdy by mì nenapadlo tì vydírat. Nikdy.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Nedávno se nìkdo pokusil zabít Estebana. Nicménì byl zabit jeho stráci.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Jdi k Estebanovi a promluv s ním. Popovídáme si po tom.
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_ADDON_SENYAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SENYAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SENYAN,"Seynan mì poznal. Ví kdo jsem. Chce to pouít pro své vlastní plány. Plánuje nìco a teï chce abych si promluvil s Estebanem.");
};


instance DIA_ADDON_BDT_1084_SENYAN_HI(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_hi_condition;
	information = dia_addon_senyan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_hi_condition()
{
	return TRUE;
};


var int senyan_msg;
var int senyan_bad;
var int senyan_good;

func void dia_addon_senyan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Ah! Podívejme, kdo to je.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Dobrá, dobrá, jestlipak to nejsi ty. Mám pro tebe pár dobrıch a špatnıch zpráv.
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chci nejdøív slyšet dobré zprávy.",dia_addon_bdt_1084_senyan_hi_good);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chci nejdøív slyšet špatné zprávy.",dia_addon_bdt_1084_senyan_hi_bad);
};

func void dia_addon_bdt_1084_senyan_hi_good()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Chci nejdøív slyšet dobré zprávy.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A co dobré zprávy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nevím jistì proè, ale buï si jistı, e tu máš vlivné nepøátele.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Pova sám, e jsi mìl štìstí, e jsem tì poznal jako první, a ne nìkdo jinı.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jsem velmi rozumná, chápavá a spoleèenská osoba.
	SENYAN_GOOD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_BAD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A co špatné zprávy?",dia_addon_bdt_1084_senyan_hi_bad);
	};
};

func void dia_addon_bdt_1084_senyan_hi_bad()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chci nejdøív slyšet špatné zprávy.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A co špatné zprávy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Raven tì hledá. Jeho stráe tì hledají. Vlastnì, všichni bandité ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Zabijí tì, pokud na nì narazíš.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Nebudou první, kdo to zkouší.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Tvoje bojové schopnosti jsou pozoruhodné jako tvoje chytrost. Nasadit si jedno z našich brnìní a pøijít k nám do tábora je jako ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//... kdy ovce vejde vlkovi pøímo do tlamy. Chodíš po tenkém ledì, chlape.
	SENYAN_BAD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_GOOD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A co dobré zprávy?",dia_addon_bdt_1084_senyan_hi_good);
	};
};


instance DIA_ADDON_SENYAN_UNTERWEGS(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 99;
	condition = dia_addon_senyan_unterwegs_condition;
	information = dia_addon_senyan_unterwegs_info;
	permanent = TRUE;
	description = "O Estebanovi ...";
};


func int dia_addon_senyan_unterwegs_condition()
{
	if((MIS_JUDAS != LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_unterwegs_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//O Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//U jsi s ním promluvil?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Ještì ne.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Dobrá, neèekej pøíliš dlouho.
};


instance DIA_ADDON_SENYAN_ATTENTAT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 2;
	condition = dia_addon_senyan_attentat_condition;
	information = dia_addon_senyan_attentat_info;
	permanent = FALSE;
	description = "U jsem s ním promluvil.";
};


func int dia_addon_senyan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//U jsem s ním promluvil.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Zmínil se o pokuse o vradu?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Je mım úkolem najít osobu, která je za to zodpovìdná. Nevíš o tom nìco?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Ne víc ne ty. Osobnì hledám pachatele. A zajímavá èást je ...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//ANO?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chci, aby si tu práci udìlal ty a poøádnì. Chci, abys našel toho zrádce.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(chladnì) A jen, co ho najdeš, zabij ho - pro mì.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//'Já' budu odmìnìn.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//Mìj stále na pamìti, e mám tvùj plakát. Udìlej svoji práci a udìlej ji dobøe. Mùeš hádat, co by se jinak stalo.
	Info_ClearChoices(dia_addon_senyan_attentat);
	Info_AddChoice(dia_addon_senyan_attentat,"Pak nemám jinou volbu ...",dia_addon_senyan_attentat_ja);
	Info_AddChoice(dia_addon_senyan_attentat,"Není cesty!",dia_addon_senyan_attentat_no);
};

func void dia_addon_senyan_attentat_no()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Není cesty!
	b_senyan_attack();
	Info_ClearChoices(dia_addon_senyan_attentat);
};

func void dia_addon_senyan_attentat_ja()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Pak nemám jinou volbu ...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//Vìdìl jsem, e budeš souhlasit.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(nevrle) Jestli nìco zjistíš o jeho identitì, pùjdem zabít toho bastarda spoleènì. A teï se ztra!
	SENYAN_ERPRESSUNG = LOG_RUNNING;
	Info_ClearChoices(dia_addon_senyan_attentat);
	b_logentry(TOPIC_ADDON_SENYAN,"Seynan chce abych našel a zabil spiklence. Jenom pro nìj získat odmìnu.");
};


instance DIA_ADDON_SENYAN_CHANGEPLAN(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_changeplan_condition;
	information = dia_addon_senyan_changeplan_info;
	permanent = FALSE;
	description = "Ještì jsem si to promyslel. Nechci s tebou dále pracovat!";
};


func int dia_addon_senyan_changeplan_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (SNAF_TIP_SENYAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_changeplan_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Ještì jsem si to promyslel. Nechci s tebou dále pracovat!
	b_senyan_attack();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_1084_SENYAN_FOUND(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_found_condition;
	information = dia_addon_senyan_found_info;
	permanent = FALSE;
	description = "Našel jsem zrádce. Je to Fisk.";
};


func int dia_addon_senyan_found_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_found_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Našel jsem zrádce. Je to Fisk.
	b_senyan_attack();
};


instance DIA_ADDON_BDT_1084_SENYAN_DERBE(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_derbe_condition;
	information = dia_addon_senyan_derbe_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_derbe_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS) && (Npc_IsDead(fisk) || Npc_IsDead(esteban)))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_derbe_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(naštvanì) Znièil jsi naši dohodu.
	b_senyan_attack();
};

