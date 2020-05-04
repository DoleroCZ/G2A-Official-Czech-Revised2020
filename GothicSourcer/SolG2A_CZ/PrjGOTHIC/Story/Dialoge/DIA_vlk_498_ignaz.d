
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Á - pøišel jsi právì vèas. Potøebuju pro své magické pokusy nìjakého asistenta.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jsem si jistý, že jsi celý nedoèkavý, jak mi ve vìdeckém zájmu udìlat malou laskavost.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Pomalu, pøíteli. Nejdøív mi øekni, o co vlastnì jde.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Vymyslel jsem nové kouzlo. Kouzlo zapomnìní.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Už jsem úspìšnì provedl nìkolik praktických zkoušek, ale na finální test se mi nedostává èasu.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "Co z toho budu mít, když ti pomùžu?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co z toho budu mít, když ti pomùžu?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Mùžu tì nauèit, jak se pøipravují lektvary.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Znám recepty na léèivou esenci, esenci many a lektvar rychlosti.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "Øekni mi o tom experimentu a kouzlu víc.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Øekni mi o tom experimentu a kouzlu víc.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//To kouzlo má za následek, že si urèitá osoba nepamatuje rùzné události.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Už se mi podaøilo zjistit, že to funguje, pokud je dotyèná osoba naštvaná - napøíklad, pokud ji nìkdo právì dal nakládaèku, nebo ji oloupil.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Dokonce i když je jen svìdkem takové události, tak se jí to pak vymaže z pamìti.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//To bych jako mìl nìkoho srazit na zem a pak na nìj seslat kouzlo?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//Funguje to jen v pøípadì, že je obì po boji OPRAVDU naštvaná.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(pro sebe) Tady v pøístavní ètvrti se to mlátí poøád. Radìji bych si mìl obì vyhlídnout nìkde jinde.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Ano, mám dojem, žes trefil høebíèek na hlavièku. Ale abys nìkoho naštval, staèí, abys ho napadl, nemusíš ho srazit k zemi.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Takže by sis mìl vybrat nìkoho, kdo je o samotì - pokud kolem budou lidé, jen se dostaneš do potíží s lordem Andrem.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Taky nemá žádný smysl sesílat kouzlo na nìkoho, kdo na tebe právì útoèí. Poèkej na ten správný okamžik.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "Dobrá, vyzkouším to kouzlo.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobrá, vyzkouším to kouzlo.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Tak si vezmi tenhle svitek a vyzkoušej si život pokusné myši.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Až to provedeš, tak se vra o tom poreferovat.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"Mám vyzkoušet nové Ignazovo kouzlo - kouzlo zapomnìní. Když se na mì nìkdo pøi bitce nebo z jiného dùvodu rozhnìvá, urèitì se se mnou už nebude chtít bavit. A tehdy nastane pravá chvíle pro použití tohoto zaklínadla.");
	b_logentry(TOPIC_IGNAZ,"Tohle je ideální pøíležitost vyzkoušet to kouzlo - pod jeho pùsobením také zapomene ohlásit mimoøádnou událost. Nemyslím si, že mi v pøístavu bude nìkdo bránit, když mu dám ránu.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "K tomu experimentu...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//K tomu experimentu...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Tak co, uspìl jsi? Nebo jsi to kouzlo jen tak zbùhdarma vyplýtval? Co?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Jestli potøebuješ další svitky, tak si je ode mì mùžeš koupit.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "Použil jsem ten svitek.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Použil jsem ten svitek.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Fajn, fajn. A povedlo se?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Ano, funguje to.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Výbornì. Malý krok pro vìdu, ale obrovský pro mì!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Teï mùžu nìco ze svého èasu využít na to, abych tì zasvìtil do tajù alchymie.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Taky ti mùžu dát nìkolik užiteèných vìcí, jestli máš zájem.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ignaz z pøístavní ètvrti mi mùže ukázat recepty na výrobu lektvarù.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "Nauè mì nìco z alchymie.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Nauè mì nìco z alchymie.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Lektvar rychlosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esence hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//OK pøípravì lektvaru s pomocí alchymistické kolony potøebuješ laboratorní baòku.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Na každý lektvar budeš taky potøebovat rùzné rostliny a další ingredience.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co bys rád vìdìl?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Už znáš všechno, èemu bych tì mohl nauèit.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

