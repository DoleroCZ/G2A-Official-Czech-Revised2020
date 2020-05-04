
instance DIA_ADDON_RIORDIAN_ADW_EXIT(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 999;
	condition = dia_addon_riordian_adw_exit_condition;
	information = dia_addon_riordian_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HELLOADW(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_helloadw_condition;
	information = dia_addon_riordian_helloadw_info;
	description = "Èekal jsi nìco takového?";
};


func int dia_addon_riordian_helloadw_condition()
{
	return TRUE;
};

func void dia_addon_riordian_helloadw_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Èekal si nìco takového?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Ne. Jsem ohromenı, jak velké muselo bıt to mìsto.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Vìtšina budov je pochovaná pod kameòím a hlínou, ale ruiny, které pøeily dlouhé vìky, jsou roztroušené po celé krajinì.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//ilo jich tu tisíce.
};


instance DIA_ADDON_RIORDIAN_WHATTOFIND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_whattofind_condition;
	information = dia_addon_riordian_whattofind_info;
	description = "S èím vším se mùu potkat zde v údolí?";
};


func int dia_addon_riordian_whattofind_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_helloadw))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_whattofind_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//S èím vším se mùu potkat zde v údolí?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na vıchodì leí velká pevnost v bainì.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Domníváme se, e se zde utáboøili banditi.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Kdyby jsem byl na tvojem místì, nešel bych tam dolù. Postavili tam mnoho stráí.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Vyhıbej se moèálu, pokud nemáš víc zkušeností, nebo si nájdi cestu, jak se dostat okolo banditù.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Objevili jsme piráty na západì.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nejsem si jistı, ale myslím, e nás spozorovali.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Vypadá to tak, e je naše pøítomnost ruší.
};


instance DIA_ADDON_RIORDIAN_GEGEND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_gegend_condition;
	information = dia_addon_riordian_gegend_info;
	permanent = TRUE;
	description = "Povìz mi víc o této oblasti.";
};


func int dia_addon_riordian_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_whattofind) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};


var int dia_addon_riordian_gegend_info_onetime;

func void dia_addon_riordian_gegend_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Povìz mi víc o této oblasti.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co by si chtìl vìdìt?
	Info_ClearChoices(dia_addon_riordian_gegend);
	Info_AddChoice(dia_addon_riordian_gegend,DIALOG_BACK,dia_addon_riordian_gegend_back);
	if((dia_addon_riordian_gegend_info_onetime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld) == FALSE))
	{
		Info_AddChoice(dia_addon_riordian_gegend,"Je nìjaká mapa oblasti?",dia_addon_riordian_gegend_map);
		dia_addon_riordian_gegend_info_onetime = TRUE;
	};
	Info_AddChoice(dia_addon_riordian_gegend,"Kde si vidìl piráty?",dia_addon_riordian_gegend_piraten);
	Info_AddChoice(dia_addon_riordian_gegend,"Ještì jednou, kdee jsou ti banditi?",dia_addon_riordian_gegend_bandits);
	Info_AddChoice(dia_addon_riordian_gegend,"Byl si u na západì?",dia_addon_riordian_gegend_west);
	Info_AddChoice(dia_addon_riordian_gegend,"Co leí na vıchodì?",dia_addon_riordian_gegend_ost);
	Info_AddChoice(dia_addon_riordian_gegend,"Kam se dostanu, kdy pùjdu na jih?",dia_addon_riordian_gegend_sued);
	Info_AddChoice(dia_addon_riordian_gegend,"Co je na severu?",dia_addon_riordian_gegend_nord);
};

func void dia_addon_riordian_gegend_back()
{
	Info_ClearChoices(dia_addon_riordian_gegend);
};

func void dia_addon_riordian_gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Je nìjaká mapa oblasti?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos jednu udìlal. Urèite ti ji pøenechá.
};

func void dia_addon_riordian_gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Ještì jednou, kdee jsou ti banditi?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Mají jakousi pevnost s velkım mnostvím stráních vìí na vıchodì.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby si se tam dostal, musíš pøejít pøes velkı moèál.
};

func void dia_addon_riordian_gegend_piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Kde si vidìl piráty?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Byli na západì.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Myslím, e lovili.
};

func void dia_addon_riordian_gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co je na severu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Pokud mám veøit záznamùm Stavitelù, nájdeš tam dlouhé údolí obklopené vysokımi skálami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Tamnìjší povrch je jen pouš.
};

func void dia_addon_riordian_gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Kam se dostanu, kdy  pùjdu na jih?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Krajina na jihu je ve¾mi divoká.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Nájdeš tam klikaté cestièky, vodopády a ruiny z kamení.
};

func void dia_addon_riordian_gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co leí na vıchodì?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Velkı moèál, ta oblast je velmi nebezpeèná.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Nestøetneš tam jen bandity, ale i velmi nebezpeènou zvìø.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Mìl by si si dávat pozor.
};


var int dia_addon_riordian_gegend_west_onetime;

func void dia_addon_riordian_gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Byl si u na západì?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Ne. Podle všeho tam musí bıt pobøeí.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Pøedpokládám, e piráti tam mají svùj tábor.
	if((dia_addon_riordian_gegend_west_onetime == FALSE) && Npc_HasItems(vlk_4304_addon_william,itwr_addon_william_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Našli jsme tìlo rybáøe nedaleko odtud.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Mìl by si se na to jít podívat.
		b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
		dia_addon_riordian_gegend_west_onetime = TRUE;
	};
};


instance DIA_ADDON_RIORDIAN_HOUSESOFRULERS(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_housesofrulers_condition;
	information = dia_addon_riordian_housesofrulers_info;
	description = "Posílá mì Saturas. Hledám 5 uèení Jharkendaru.";
};


func int dia_addon_riordian_housesofrulers_condition()
{
	if(MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_housesofrulers_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Posílá mì Saturas. Hledám 5 uèení Jharkendaru?
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Budu potøebovat mnoho èasu na najití uèení podle záznamù.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale teï ti to u mùu øíct pøesnì.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_RUNNING;
};


instance DIA_ADDON_RIORDIAN_WHEREAREHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_wherearehouses_condition;
	information = dia_addon_riordian_wherearehouses_info;
	description = "Kde mùu najít 5 uèení Jharkendaru?";
};


func int dia_addon_riordian_wherearehouses_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && (SATURAS_SCBROUGHTALLTOKEN == FALSE))
	{
		return TRUE;
	};
};


var int b_whrearehousesofrulersonetime;

func void b_whrearehousesofrulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Dùm uèencù je velká budova. Musí byt nìkde na severu.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Dùm váleèníkù je pevnost obklopená kamením na vıchode.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Knìzi a strácové mìli svoje budovy blízko sebe. Mìl by si je najít na jihozápadì.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//Léèitelé mìli svoje obydlí na jihovıchodì.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Pokud budou tyto budovy stát, poznáš je podle stylu v jakém jsou postavené.
		b_whrearehousesofrulersonetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Jsou vyvıšené. Schody vedou do vchodu krytého vysokım podloubím.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Doufám, e ti to pomùe.
	};
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Dùm uèencù je velká budova. Musí bıt nìkde na severu.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dùm váleèníkù je pevnost na vıchodì, obklopená útesy.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Knìí a strácové byli blízko pøi sobì, mìl by jsem je najít na jihozápadì.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dùm leèitelù byl na jihovıchodì.");
};

func void dia_addon_riordian_wherearehouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Kde mùu najít 5 uèení Jharkendaru?
	b_whrearehousesofrulers();
};


instance DIA_ADDON_RIORDIAN_FOUNDHOUSE(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundhouse_condition;
	information = dia_addon_riordian_foundhouse_info;
	permanent = TRUE;
	description = "Hmm, o tìch uèení...";
};


func int dia_addon_riordian_foundhouse_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_riordian_wherearehouses) && (RIORDIANHOUSESFOUNDCOUNT < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int LIBRARY = 1;
const int HEILER = 2;
const int WARRIOR = 3;
const int PRIEST = 4;
const int TOTENW = 5;
var int riordianhouseneuigkeit;
var int riordianhousesfoundcount;

func void dia_addon_riordian_foundhouse_info()
{
	var int riordianhousexps;
	RIORDIANHOUSENEUIGKEIT = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Hmmm, o tìch uèení...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Ano?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_ONETIME == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Skøeti mají zjevnì zájem o knihovnu Uèencù.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Myslíš si, e umí èíst ve starém jazyce?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nemyslím, ale kdo ví.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Take by si se mìl radìji postarat, aby zmizli.
		FOUNDHOUSEINFO[1] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
		Log_CreateTopic(TOPIC_ADDON_CANYONORCS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_CANYONORCS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_CANYONORCS,"Mág Vody Riordian by se redìji zbavil skøetù v kaòonu.");
	};
	if((Npc_IsDead(stoneguardian_heiler) || Npc_HasItems(other,itmi_addon_stone_04) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Domov leèitelù je uprostøed moèálu a hlídá ho mnoho kamennıch strácù.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Stále stojí?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Ano, ale do kdy?
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Bolí mì, kdy vidím dùkazy o minulosti v takovém stavu.
		FOUNDHOUSEINFO[2] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Sídlo váleèníkù pouil Raven jako úkryt.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynicky) Vybral si dobøe.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Je to nejbezpeènìjší pevnost v této oblasti.
		FOUNDHOUSEINFO[3] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(minecrawler_priest) || Npc_HasItems(other,itmi_addon_stone_03) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//V domì knìích je mnoho dùlních èervù.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Není tato oblast nepøirozená pro tato zvíøata?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Rozhodnì.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Och Adanosi, strašné vìci se dìjí v tomto kraji.
		FOUNDHOUSEINFO[4] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(mayazombie04_totenw) || Npc_HasItems(other,itmi_addon_stone_02) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Obydlí strácù smrti, co byli ovládaní silou ïábla.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Myslím, e jsem ještì nevidìl tolik zombií jako tady.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Toto je neštìstí. Strácové smrti se jistì stali vládci svojich schopností.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Jejich solidarita k svìtu mrtvıch jim uškodila. Doufám, e je dokáeš vyvést z omylu.
		FOUNDHOUSEINFO[5] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if(RIORDIANHOUSENEUIGKEIT > 0)
	{
		riordianhousexps = XP_ADDON_RIORDIAN_FOUNDHOUSE * RIORDIANHOUSENEUIGKEIT;
		b_giveplayerxp(riordianhousexps);
		RIORDIANHOUSESFOUNDCOUNT = RIORDIANHOUSESFOUNDCOUNT + RIORDIANHOUSENEUIGKEIT;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Povìz mi ještì jednou, kde je kadá èast.
		b_whrearehousesofrulers();
	};
};


instance DIA_ADDON_RIORDIAN_ORKSWEG(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_orksweg_condition;
	information = dia_addon_riordian_orksweg_info;
	description = "Skøeti ji brzy ztratí zájem o tento kraj.";
};


func int dia_addon_riordian_orksweg_condition()
{
	if(Npc_IsDead(orcshaman_sit_canyonlibrarykey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_orksweg_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Skøeti ji brzy ztratí zájem o tento kraj.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Co tím myslíš?
	if(orcshaman_sit_canyonlibrarykey.aivar[AIV_KILLEDBYPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabil jsem jejich velitele.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Jejich vùdce je mrtvı.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Doufám, e máš pravdu.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Opravdu nemùeme vyvolat takové nepokoje.
	TOPIC_END_CANYONORCS = TRUE;
	b_giveplayerxp(XP_ADDON_RIORDIAN_ORKSWEG);
};


instance DIA_ADDON_RIORDIAN_FOUNDALLHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundallhouses_condition;
	information = dia_addon_riordian_foundallhouses_info;
	description = "Našel jsem všechna uèení.";
};


func int dia_addon_riordian_foundallhouses_condition()
{
	if((RIORDIANHOUSESFOUNDCOUNT >= 5) && (MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_foundallhouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Našel jsem všecky uèení.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Byla všechna tam, kde jsem ti øekl?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ano, víceménì.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Fajn, tak moje práce mìla vıznam.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Díky.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FOUNDALLHOUSES);
};


instance DIA_ADDON_RIORDIAN_ADW_PRETEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_adw_preteach_condition;
	information = dia_addon_riordian_adw_preteach_info;
	description = "Mùeš mì nauèit nìco z tvıch schopnosti?";
};


func int dia_addon_riordian_adw_preteach_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Mùeš mì nauèit nìco z tvıch schopnosti?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Mùu tì nauèit alchymii.
	if(Npc_HasItems(other,itam_addon_wispdetector) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//A mùu ti ukázat, jak mùe tvoje bludièka hledat vìci.
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		Log_AddEntry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
	};
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACHALCHEMY);
	RIORDIAN_ADW_ADDON_TEACHWISP = TRUE;
	RIORDIAN_ADW_ADDON_TEACHALCHEMY = TRUE;
};


instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 90;
	condition = dia_addon_riordian_adw_teach_condition;
	information = dia_addon_riordian_adw_teach_info;
	permanent = TRUE;
	description = "Uká mi, jak mám trénovat mou bludièku.";
};


var int dia_addon_riordian_adw_teach_noperm;

func int dia_addon_riordian_adw_teach_condition()
{
	if((DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && (RIORDIAN_ADW_ADDON_TEACHWISP == TRUE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_adw_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_adw_teach);
		Info_AddChoice(dia_addon_riordian_adw_teach,DIALOG_BACK,dia_addon_riordian_adw_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_adw_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_adw_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_adw_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_adw_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_adw_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_adw_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_adw_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_adw_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};


instance DIA_RIORDIAN_ADW_TEACHALCHEMY(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 2;
	condition = dia_riordian_adw_teachalchemy_condition;
	information = dia_riordian_adw_teachalchemy_info;
	permanent = TRUE;
	description = "Uká mi, jak namíchat magické lektvary.";
};


var int dia_riordian_adw_teachalchemy_permanent;

func int dia_riordian_adw_teachalchemy_condition()
{
	if((DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT == FALSE) && (RIORDIAN_ADW_ADDON_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Uká mi, jak namíchat magické lektvary.
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE))
	{
		Info_ClearChoices(dia_riordian_adw_teachalchemy);
		Info_AddChoice(dia_riordian_adw_teachalchemy,DIALOG_BACK,dia_riordian_adw_teachalchemy_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esence ivotní síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_riordian_adw_teachalchemy_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Extrakt ivotní síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_riordian_adw_teachalchemy_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_riordian_adw_teachalchemy_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_riordian_adw_teachalchemy_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elixír many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_riordian_adw_teachalchemy_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elixír ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_riordian_adw_teachalchemy_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elixír obratnosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_riordian_adw_teachalchemy_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magické nápoje se pøipravují v alchymistické kolonì, jedna je ve tvém obydlí v poschodí.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Potøebuješ ale také prázdnou nádobu, ingredience a vìdomosti jak magickı lektvar pøipravit.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Ode mì mùeš mít vìdomosti, ale ostatní vìci si musíš opatøit sám.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chceš pøipravit?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nemùu tì nauèit u nic, co by si neumìl.
		DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT = TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_back()
{
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

