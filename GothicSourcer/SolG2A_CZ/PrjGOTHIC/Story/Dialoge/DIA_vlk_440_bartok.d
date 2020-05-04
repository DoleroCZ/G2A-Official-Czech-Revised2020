
instance DIA_BARTOK_EXIT(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 999;
	condition = dia_bartok_exit_condition;
	information = dia_bartok_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bartok_exit_condition()
{
	return TRUE;
};

func void dia_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BARTOK_PICKPOCKET(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 900;
	condition = dia_bartok_pickpocket_condition;
	information = dia_bartok_pickpocket_info;
	permanent = TRUE;
	description = "(Ukrást tento toulec se šípy je tak snadné, jako vzít dítìti bonbón.)";
};


func int dia_bartok_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itrw_arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bartok_pickpocket_info()
{
	Info_ClearChoices(dia_bartok_pickpocket);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_BACK,dia_bartok_pickpocket_back);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_PICKPOCKET,dia_bartok_pickpocket_doit);
};

func void dia_bartok_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itrw_arrow,40);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bartok_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bartok_pickpocket_back()
{
	Info_ClearChoices(dia_bartok_pickpocket);
};


instance DIA_BARTOK_HALLO(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_hallo_condition;
	information = dia_bartok_hallo_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ty nejsi tady z okolí, co? Nevadí - ani já ne.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Kde ses toulal døív?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//V lesích, spoleènì s dalšími lovci jsme chytali mrchožrouty a vlky.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale nechal jsem toho. Teï jsou nebezpeèný èasy. Pohybuje se tu spousta rùzný chátry.
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Kde najdu ty ostatní lovce?";
};


func int dia_bartok_jaeger_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_jaeger_info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Kde najdu ty ostatní lovce?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//Mìli jsme tábor venku, poblíž krèmy, napùl cesty k Onarovì farmì.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Ale nevím, jestli tam ještì nìkdo zùstal.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Nedávno jsme byli ještì oba ve mìstì.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//Mùj kámoš Trokar je velmi zruèný lovec.
};


instance DIA_ADDON_BARTOK_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_addon_bartok_missingpeople_condition;
	information = dia_addon_bartok_missingpeople_info;
	description = "Kde je tvùj kamarád teï?";
};


func int dia_addon_bartok_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_jaeger))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//Kde je tvùj kamarád teï?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//No, to je divný pøíbìh.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Pøed pár dny jsme se oba potulovali kolem Coraganovi hospody a povídali si o lovu.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Neptej se mì, co se stalo. Byl jsem totiž dost opilý.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Jenom si pamtuju, že Trokar chtìl nìjakou trávu z bažin? Ale nikdy se už nevrátil.
	MIS_BARTOK_MISSINGTROKAR = LOG_RUNNING;
	Info_ClearChoices(dia_addon_bartok_missingpeople);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Ty jsi ho nehledal?",dia_addon_bartok_missingpeople_such);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Odkud máš to stéblo z bažin?",dia_addon_bartok_missingpeople_wo);
};

func void dia_addon_bartok_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Kde shánìl tu trávu z bažin?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Myslím, že nìkde z pøístavní ètvrti.
};

func void dia_addon_bartok_missingpeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ty jsi ho nehledal?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Ne, ale øekl jsem o tom domobranì.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//A nikdo z nich nebyl schopný ho najít.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Doufám, že ho nenapadnul nìjaký vlk nebo nìco horšího.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//Myšlenka, že pøi lovu zakopnu o jeho chladné tìlo mì dìsí.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Nevím, jestli bych to pøenesl pøes srdce.
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Bosper øíkal, že jsi pro nìj pracoval.";
};


func int dia_bartok_bosper_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_bartok) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_bosper_info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper øíkal, že jsi pro nìj pracoval.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Ano, pracoval. Ale on se zajímal jen o ty svý kùže.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Øíkal jsem mu, jak je to venku nebezpeèný. Ale vùbec mì neposlouchal.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No, ale jinak platil dobøe - na to si nemùžu stìžovat.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Mùžeš mi o nìm nìco øíct?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(smích) Bosperovi nìkdo nedávno ukradl luk. Za bílého dne.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Nìjakej chlap prostì nakráèel do jeho skladu, vzal ten luk a zmizel.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Ti zlodìji jsou èím dál tím drzejší!
	if(MIS_BOSPER_BOGEN != LOG_SUCCESS)
	{
		MIS_BOSPER_BOGEN = LOG_RUNNING;
	};
};


instance DIA_BARTOK_WANNALEARN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_wannalearn_condition;
	information = dia_bartok_wannalearn_info;
	permanent = FALSE;
	description = "Mùžeš mì nauèit nìco o lovu?";
};


func int dia_bartok_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_wannalearn_info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Mùžeš mì nauèit nìco o lovu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Mùžu tì nauèit, jak se poøádnì plížit a jak zacházet s lukem.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Jestli se chceš nauèit stahovat zvíøata, zajdi za Bosperem. On už bude vìdìt, co a jak.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Bartok mì nauèí lukostøelbì a umìní plížit se.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nauè mì, jak se plížit!",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
};


func int dia_bartok_teachsneak_condition()
{
	if((BARTOK_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void dia_bartok_teachsneak_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Nauè mì, jak se plížit!
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobrá - tak nejdøív se musíš ujistit, že správnì pøesouváš své tìžištì.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Na to musíš ohnout kolena a došlapovat na paty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Musíš mít vždycky váhu svýho tìla na noze, na který stojíš, až do tý doby, než tou druhou jistì došlápneš.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Kolem vìtšiny zvíøat se nemùžeš proplížit, pokud nespí. Ty potvory tì prostì vycítí.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Takže vždycky, když jsi venku, dávej dobrej pozor.
	};
};


var int bosper_merkebow;

instance DIA_BARTOK_TEACH(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teach_condition;
	information = dia_bartok_teach_info;
	permanent = TRUE;
	description = "Chci se nauèit líp zacházet s lukem!";
};


func int dia_bartok_teach_condition()
{
	if(BARTOK_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_teach_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chci se nauèit líp zacházet s lukem!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Fajn, tak se podíváme, jestli s tím mùžu nìco dìlat.
	BOSPER_MERKEBOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Mìl by ses podívat po nìkom, kdo o tom ví víc než já.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Dobrá, už jsi dosáhl vìtší pøesnosti.
	};
	Info_ClearChoices(dia_bartok_teach);
};

func void dia_bartok_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};


var int bartok_bereit;
var int bartok_later;

instance DIA_BARTOK_ZUSAMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_zusammen_condition;
	information = dia_bartok_zusammen_info;
	permanent = TRUE;
	description = "Co takhle jít lovit spoleènì?";
};


func int dia_bartok_zusammen_condition()
{
	if((BARTOK_BEREIT == FALSE) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_zusammen_info()
{
	if(BARTOK_LATER == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Co takhle jít lovit spoleènì?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmm. Ve dvou to nebude tak nebezpeèné, to je pravda.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//Víš aspoò nìco o lovu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Myslím, jak stahovat zvíøata?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//Máš 50 zlaákù?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Ano.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobrá, ale chci nejdøív vidìt 50 zlatých. Za to si mùžeš nechat všechny kùže a prodat je Bosperovi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//To je férová nabídka, ne?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Pozdìji...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Tady jsou ...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Ne.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//V tom pøípadì to za to nestojí.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Vra se, až se nìco nauèíš.
	};
};

func void dia_bartok_zusammen_later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Pozdìji...
	BARTOK_LATER = TRUE;
	Info_ClearChoices(dia_bartok_zusammen);
};

func void dia_bartok_zusammen_pay()
{
	Info_ClearChoices(dia_bartok_zusammen);
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Tady jsou.
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//A kde? Nemáš zlato.
	};
};


var int bartok_los;

instance DIA_BARTOK_HUNTNOW(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_huntnow_condition;
	information = dia_bartok_huntnow_info;
	permanent = FALSE;
	description = "Jdeme na lov!";
};


func int dia_bartok_huntnow_condition()
{
	if(BARTOK_BEREIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_huntnow_info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Jdeme na lov!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Dobrá, pojï za mnou. Venku za jižní bránou je les, kde se dá tý havìti najít víc než dost.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(pro sebe) Možná víc, než by nám mohlo líbit.
	BARTOK_LOS = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int bartok_orkstillthere;

instance DIA_BARTOK_IMWALD(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_imwald_condition;
	information = dia_bartok_imwald_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_imwald_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_imwald_info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Tak co myslíš, pùjdeme dál do lesa, nebo ne?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Vrame se!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"Pokraèujem.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Vrame se!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Taky bych se radìj vrátil. Nejspíš by se nám podaøilo vbìhnout pøímo do náruèí nìjakýmu skøetovi.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Pokraèujem.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Dobrá. (pro sebe) Doufejme, že se to nìjak vyøeší.
	if(!Npc_IsDead(cityorc))
	{
		BARTOK_ORKSTILLTHERE = TRUE;
	};
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int bartok_ende;

instance DIA_BARTOK_ANGEKOMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_angekommen_condition;
	information = dia_bartok_angekommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_angekommen_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_angekommen_info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Tak! Myslím, že se vrátim do mìsta.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tady venku je to pro mì prostì pøíliš nebezpeèný - dokonce pro nás oba.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Tak nashle!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Mùžeš ty kùže prodat Bosperovi.
	BARTOK_ENDE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_BARTOK_PERM(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_perm_condition;
	information = dia_bartok_perm_info;
	permanent = TRUE;
	description = "V pohodì?";
};


func int dia_bartok_perm_condition()
{
	if(BARTOK_LOS == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_perm_info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//V pohodì?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Ano. Ale za brány mìsta už mì nikdy nikdo nedostane - alespoò ne v dohledný dobì.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Poøád se mi klepou strachy kolena, že nás dostane do spárù nìjakej skøet.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasnì. Jen ulovíme pár bestií!
	};
};

