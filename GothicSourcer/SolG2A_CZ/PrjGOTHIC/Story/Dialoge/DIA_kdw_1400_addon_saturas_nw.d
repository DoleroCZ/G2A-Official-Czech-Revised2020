
instance DIA_ADDON_SATURAS_EXIT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 999;
	condition = dia_addon_saturas_exit_condition;
	information = dia_addon_saturas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_exit_info()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Protoe nemohu pøedvídat pracovitost ostatních mágu, doruèíš jednomu z nich zprávu.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Povìz Riordianovi, e s ním chci mluvit.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Zdruje se v zadní èásti kobky. Tam ho najdeš.
		MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ADDON_HOLRIORDIAN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_HOLRIORDIAN,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_HOLRIORDIAN,"Saturas ode mì chce, abych za ním poslal vodního mága, Riordiana. Ten je kdesi v hlubších èástech podzemí.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_NEFARIUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_nefarius_condition;
	information = dia_addon_saturas_nefarius_info;
	description = "Mìl bych najít ztracené èásti ornamentu pro Nefariuse.";
};


func int dia_addon_saturas_nefarius_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_nefarius_info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Mìl bych najít ztracené èásti ornamentu pro Nefariuse.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Co? To je nemoné! Ty jsi do toho taky zapleten?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Nièeho se nebojím, donesu sem ty vìci.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(vzdych) Víš aspoò, kde máš hledat?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius mi dal mapu ...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Uka mi ji!
		b_usefakescroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmmm. Ve velkém lese je to velmi nebezpeèné. Nemìl bys tam jít sám.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Zkus najít v Khorinisu nìkoho, kdo by šel s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Nechci, aby tì zvíøata serala - a ornament s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Tady, vezmi si zpìt mapu ...
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas si myslí, e pøi hledání ornamentù bych nemìl chodit do lesa sám. Mám si v Khorinisu najít nìkoho, kdo se mnou pùjde.");
	};
};


instance DIA_ADDON_SATURAS_HALLO(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_hallo_condition;
	information = dia_addon_saturas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_hallo_condition()
{
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,gobbo_skeleton,zs_mm_attack,-1) == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_hallo_weißtdu()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_00");	//Máš vùbec ponìtí o tom, co jsi udìlal?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_01");	//Dostal jsi strukturu magie do takového chaosu, e se o tom dozví celı Khorinis.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_02");	//Mùeš dìkovat nebesùm, e bariéra padla.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_weißtdu_15_03");	//Proè si teda stìuješ? Všechno dobøe dopadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_04");	//(vøísknutí) Buï ticho!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_05");	//Co k èertu chceš?
	Info_ClearChoices(dia_addon_saturas_hallo);
};

func void dia_addon_saturas_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Zmiz odtud!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//V tìchto kobkách je pøíliš nebezpeèné hrát si na dobrodruha.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(nahnìvanì) Ale øekni mi. Známe se? Samozøejmì. Ty zkurvysynu...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//Nemysli si, e jsme zapomìli, jak jsi nás tehdy v Novém táboøe zradil!
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"Já...",dia_addon_saturas_hallo_video);
};

func void dia_addon_saturas_hallo_video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//Ty jsi vysál z naší rudy všechnu magickou sílu a pak zmizel!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(nahnìvanì) Proè jsi to udìlal?
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"Je mi líto. Nevìdìl jsem co dìlám.",dia_addon_saturas_hallo_sorry);
	Info_AddChoice(dia_addon_saturas_hallo,"Vaše plány by nefungovaly.",dia_addon_saturas_hallo_spott);
	Info_AddChoice(dia_addon_saturas_hallo,"Bylo to nevyhnutelné.",dia_addon_saturas_hallo_notwendig);
};

func void dia_addon_saturas_hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Bylo to nevyhnutelné. Bez síly rudy bych nebyl schopen porazit Spáèe.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//O èem to mluvíš? Spáè? Poraen?
	dia_addon_saturas_hallo_weißtdu();
};

func void dia_addon_saturas_hallo_spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Vaše plány by nefungovaly. Znièit bariéru s rudou - to je nejvìtší blbost, jakou jsem kdy slyšel.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Spíš by jste znièili sami sebe.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//Jaká drzost. Kdo ti dal právo posuzovat nás a naše úmysly?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Kdybys nebyl tak mírumilovnı èlovìk, pøivolal bych na tebe Adanosùv hnìv.
	dia_addon_saturas_hallo_weißtdu();
};

func void dia_addon_saturas_hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Je mi to líto. Nevìdìl jsem co dìlám.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//Líto? A ty si myslíš, e je teï všechno v poøádku?
	dia_addon_saturas_hallo_weißtdu();
};


instance DIA_ADDON_SATURAS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_keineahnung_condition;
	information = dia_addon_saturas_keineahnung_info;
	description = "Nemám ponìtí.";
};


func int dia_addon_saturas_keineahnung_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Nemám ponìtí. Myslel jsem si, e se jen tak ukáu.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Mrháš mım èasem. Ztra se.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(sám pro sebe) Vyøídím si to s tebou pozdìji.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Našel jsem vodní mágy v jejich vykopávkach. Nejdøív musím zjistit co tu dìlají. Saturas nebyl ochoten mi to øíct. Je stále naštvanı kvùli té vìci v trestanecké kolonii.");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_RAUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_raus_condition;
	information = dia_addon_saturas_raus_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_saturas_raus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_keineahnung) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raus_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Vypadni odsud døív, ne se ti nìco stane.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_LARES(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_lares_condition;
	information = dia_addon_saturas_lares_info;
	description = "Pøišel jsem s Laresem.";
};


func int dia_addon_saturas_lares_condition()
{
	if(LARES_ANGEKOMMEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lares_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Pøišel jsem s Laresem.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//Lares? Skuteènì? Kde je?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Jsem sám. Lares se vrací opìt do mìsta.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//He? A on tì sem poslal samotného? Co si vùbec myslí?
};


instance DIA_ADDON_SATURAS_ORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_ornament_condition;
	information = dia_addon_saturas_ornament_info;
	description = "Pøinesl jsem ti ornamenty.";
};


func int dia_addon_saturas_ornament_condition()
{
	if((Npc_HasItems(other,itmi_ornament_addon_vatras) && (LARES_ANGEKOMMEN == FALSE)) || ((LARES_ANGEKOMMEN == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_lares) && Npc_HasItems(other,itmi_ornament_addon_vatras)))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Pøinesl jsem ti ornamenty.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Jako teï?
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Kdo ti to dal? Neøíkej, e ti to Lares jen tak nechal.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Uklidni se. Já jsem to donesl tobì. Chceš to nebo ne?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Jistì. Ale znepokojuje mì, e jsi se do toho zapletl.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Proè dìláš problémy, kvùli staré historce?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//No, stejnì jsem pro tebe pracoval naposled. Nepoèítej se mnou do budoucna.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(vzdych) A co jsem získal? Pfff, nemysli si, e ti veøím.
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_SUCCESS;
	Wld_InsertNpc(bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(giant_bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_ADDON_SATURAS_GEHEIMBUND(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_geheimbund_condition;
	information = dia_addon_saturas_geheimbund_info;
	description = "Chci se pøidat do 'Kruhu Vody'.";
};


func int dia_addon_saturas_geheimbund_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_geheimbund_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Chci se pøidat do 'Kruhu Vody'.
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(rozzuøenì) CO??? Odkud to víš? Kdo ... ? LARES ... já ho zabiju.
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//On porušil naše pravidlá. Nikdo nemluví o 'Kruhu Vody'.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(konèí) Nemám slov. Já ti vìøím, jenom pokud mám nad tebou dohled.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//Vatras mi øekl o prstenu.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(odevzdanì) Co? Vatras? (jedovatì) Paráda! Narazil jsi na mága Vody, kterı tì NEPOZNAL ...
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Poslocuhej, neblázni!
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(pokojnì) Já se postarám ...
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas není ochoten pøijmout mì do 'Kruhu Vody'. Nechává rozhodnutí Vatrasovi.");
};


instance DIA_ADDON_SATURAS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_wasmachstdu_condition;
	information = dia_addon_saturas_wasmachstdu_info;
	description = "Co tu dole dìláš?";
};


func int dia_addon_saturas_wasmachstdu_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Co tu dole dìláš?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(dìsivì) Tyhle sínì drí staré tajemství. Záhadné tajemství.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//Nápisy a fresky naznaèují velmi starou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Všechno co uvidíš, je napsáno v neznámém jazyce.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Nauèili jsme se porozumìt tomuto jazyku.
};


instance DIA_ADDON_SATURAS_ERDBEBEN(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 6;
	condition = dia_addon_saturas_erdbeben_condition;
	information = dia_addon_saturas_erdbeben_info;
	description = "Proè se stále objevují ta zemìtøesení?";
};


func int dia_addon_saturas_erdbeben_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_saturas_wasmachstdu) && Npc_KnowsInfo(other,dia_addon_merdarion_bedrohung))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_erdbeben_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Proè se stále objevují ta zemìtøesení?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//To je záhada, kterou se pokouším vyøešit.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Struktura magie je narušena kdesi za tìmito horami.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Zøejmì nìkdo pouil magii a rozptılil velmi silné kouzlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Bojím se, e zanedlouho zemìtøesení postihnou celı ostrov.
};


instance DIA_ADDON_SATURAS_WHATSORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_whatsornament_condition;
	information = dia_addon_saturas_whatsornament_info;
	description = "Proè je tenhle ornament tak dùleitı?";
};


func int dia_addon_saturas_whatsornament_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSORNAMENT == FALSE) && (RITUALRINGRUNS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_whatsornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Proè je tenhle ornament tak dùleitı?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(nervóznì) Je to klíè k portálu.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Nic víc ti o tom neøeknu.
};


instance DIA_ADDON_SATURAS_SCRANGER(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_scranger_condition;
	information = dia_addon_saturas_scranger_info;
	permanent = TRUE;
	description = "Teï patøím do 'Kruhu Vody'.";
};


func int dia_addon_saturas_scranger_condition()
{
	if((SATURASKNOWS_SC_ISRANGER == FALSE) && (SC_ISRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scranger_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Teï patøím do 'Kruhu Vody'.
	itm = Npc_GetEquippedArmor(other);
	if(((SCISWEARINGRANGERRING == TRUE) && (RANGERRINGISLARESRING == FALSE)) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE))
	{
		if(Hlp_IsItem(itm,itar_ranger_addon) == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Jak vidím, máš na sobì brnìní našich dìtí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Jak vidím, nosíš naše tajné charakteristické znamení. Akvamarínovı prsten.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//Vidím v tvıch oèích, e nám øíkaš pravdu.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(mrmlá) V poøádku. Budu akceptovat tvùj vstup mezi nás.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Prosím, uvìdom si, e je to spojené s velkou zodpovìdností.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//Doufám, e to zvládneš.
		SATURASKNOWS_SC_ISRANGER = TRUE;
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas akceptoval mùj vstup do 'Kruhu Vody'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//A jak zjistím, e jsi jeden z nás?
		if(RANGERRINGISLARESRING == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Akvamarínovı prsten, kterı máš, patøí Laresovi. Poznávám ho.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Chceš mì podvést? Neèekal jsem nic jiného.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_OPENPORTAL(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_openportal_condition;
	information = dia_addon_saturas_openportal_info;
	permanent = TRUE;
	description = "Dej mi klíè z ornamentù. Otevøu portál.";
};


var int dia_addon_saturas_openportal_noperm;

func int dia_addon_saturas_openportal_condition()
{
	if((RITUALRINGRUNS == LOG_SUCCESS) && (DIA_ADDON_SATURAS_OPENPORTAL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_openportal_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Dej mi klíè z ornamentù. Otevøu portál.
	if(SATURASKNOWS_SC_ISRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//Dobøe! Jako novému èlenu našich dìtí ti patøí tahle pocta.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Ale stále èekám na zprávu od Vatrase. Dokud ji nedostanu, nemùu jít dál.
		if((RANGERMEETINGRUNNING == LOG_SUCCESS) && (Npc_HasItems(other,itwr_vatras2saturas_findraven) || Npc_HasItems(other,itwr_vatras2saturas_findraven_opened)))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//Mám pro tebe zprávu od Vatrase.
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven,Npc_HasItems(other,itwr_vatras2saturas_findraven));
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven_opened,Npc_HasItems(other,itwr_vatras2saturas_findraven_opened));
			b_usefakescroll();
			if(VATRAS2SATURAS_FINDRAVEN_OPEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(nahnìvanì) Dobrá. A ty ses nemohl dret pøíkazu a neotevøít ji, e?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//No, ehm...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(vıhrunì) Má velmi malá dùvìra k tobì stále klesá. Jen doufám, u kvùli tobì, e mì ji více nezklameš.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(ohromen) Velmi zajímavé. Dobøe.
				b_giveplayerxp(XP_AMBIENT);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Vezmi si tenhle krouek z ornamentù. Potkáme se u portálu a poèkáme na tebe.
			CreateInvItems(self,itmi_portalring_addon,1);
			b_giveinvitems(self,other,itmi_portalring_addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Pokud má Nefarius pravdu, portál se otevøe, hned jak tam vloíš krouek.
			DIA_ADDON_SATURAS_OPENPORTAL_NOPERM = TRUE;
			b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas mi dal ozdobnı prsten. Chce, abych ho vloil do mechanismu, kterı ovládá portál a prošel ním.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"OpenPortal");
			b_startotherroutine(kdw_1402_addon_nefarius_nw,"OpenPortal");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"OpenPortal");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"OpenPortal");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Ponechám si klíè z ornamentù, dokud mi Vatras neøekne, e ti mohu vìøit.
		SATURAS_WILLVERTRAUENSBEWEIS = TRUE;
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas mi nechce dát prsten, dokud ho nepøesvìdèím o tom, e mi mùe vìøit. Musím donést zprávu od Vatrase.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_PERM(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 99;
	condition = dia_addon_saturas_perm_condition;
	information = dia_addon_saturas_perm_info;
	permanent = TRUE;
	description = "Mùeš mì nauèit nìco o magii?";
};


func int dia_addon_saturas_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME != 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Mùeš mì nauèit nìco o magii?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Vzhledem k tomu, e mùeš ještì více narušit stabilitu magie, myslím, e ne.
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Na nìkoho takového, jako si ty, nemám èas.
};

