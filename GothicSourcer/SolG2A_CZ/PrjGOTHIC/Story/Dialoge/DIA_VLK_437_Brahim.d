
var int brahim_showedmaps;

func void b_brahimnewmaps()
{
	if(BRAHIM_SHOWEDMAPS == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Vra se pozdìji, urèitì pro tebe pak budu nìco mít.
	};
};


instance DIA_BRAHIM_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_exit_condition;
	information = dia_brahim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_brahim_exit_info()
{
	b_brahimnewmaps();
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 900;
	condition = dia_brahim_pickpocket_condition;
	information = dia_brahim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brahim_pickpocket_condition()
{
	return c_beklauen(15,15);
};

func void dia_brahim_pickpocket_info()
{
	Info_ClearChoices(dia_brahim_pickpocket);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};

func void dia_brahim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brahim_pickpocket);
};

func void dia_brahim_pickpocket_back()
{
	Info_ClearChoices(dia_brahim_pickpocket);
};


instance DIA_BRAHIM_GREET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 2;
	condition = dia_brahim_greet_condition;
	information = dia_brahim_greet_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_brahim_greet_condition()
{
	return TRUE;
};

func void dia_brahim_greet_info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Jmenuji se Brahim. Kreslím mapy a pak je prodávám.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Tys tu novı, a tak by se ti nìjaká mapa mìsta jistì hodila.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Je pomìrnì levná a bude se ti dost hodit, dokud se tu úplnì nezorientuješ.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Brahim kreslí a prodává mapy. Sídlí poblí pøístavu.");
};


instance DIA_ADDON_BRAHIM_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 5;
	condition = dia_addon_brahim_missingpeople_condition;
	information = dia_addon_brahim_missingpeople_info;
	description = "Je to pravda, e obyvatelé tohohle mìsta mizejí bez jakékoli stopy?";
};


func int dia_addon_brahim_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brahim_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//Je to pravda, e obyvatelé tohohle mìsta mizejí bez jakékoli stopy?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Hej, taky sem o tom slyšel. Bohuel, nemùu øíct, jestli jsou ty pøíbehy pravdivé.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Jen se koukni okolo. Tohle skuteènì není místo kde bys chtel ít navdy, co?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//áden div, e lidé odcházejí.
};


instance DIA_BRAHIM_BUY(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 9;
	condition = dia_brahim_buy_condition;
	information = dia_brahim_buy_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka mi své mapy.";
};


func int dia_brahim_buy_condition()
{
	if(Npc_KnowsInfo(hero,dia_brahim_greet))
	{
		return TRUE;
	};
};

func void dia_brahim_buy_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Uka mi své mapy.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Lepší nenajdeš ani v tom svém klášteøe.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobré mapy jsou dùleité, zvláštì pro ty, kdo pøicházejí z pevniny, mistøe paladine.
	};
	BRAHIM_SHOWEDMAPS = TRUE;
};


instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_exit_condition;
	information = dia_brahim_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_exit_info()
{
	if(KAPITEL <= 4)
	{
		b_brahimnewmaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_first_exit_condition;
	information = dia_brahim_kap3_first_exit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_first_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_first_exit_info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Já vìdìl, e tì tenhle kousek bude zajímat.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Jakı kousek?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//No, ta stará mapa, kterou sis právì koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Znám takové, jako jsi ty. Nepropásnete jedinou šanci, jak pøijít k bohatství.
	Info_ClearChoices(dia_brahim_kap3_first_exit);
	Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Jak jsi získal tenhle dokument?",dia_brahim_kap3_first_exit_wheregetit);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Co je to za dokument?",dia_brahim_kap3_first_exit_content);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Proè si ji nenecháš sám?",dia_brahim_kap3_first_exit_keepit);
};

func void dia_brahim_kap3_first_exit_back()
{
	Info_ClearChoices(dia_brahim_kap3_first_exit);
};

func void dia_brahim_kap3_first_exit_wheregetit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Kde jsi získal tuhle mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//No, našel jsem ji ve štosu starıch map, kterı jsem nedávno koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Ten, kdo ji prodával, ji musel pøehlédnout.
};

func void dia_brahim_kap3_first_exit_content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co je to za mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Vypadá to jako nìjaká mapa k pokladu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Ty mi ale pøipadáš jako nìkdo, kdo by nìèemu takovému mohl pøijít na kloub.
};

func void dia_brahim_kap3_first_exit_keepit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Proè si ji nenecháš sám?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jsem u starı a èasy, kdy jsem vyráel na vıpravy, u jsou dávno pryè.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Teï u to nechávám na mladších.
};

