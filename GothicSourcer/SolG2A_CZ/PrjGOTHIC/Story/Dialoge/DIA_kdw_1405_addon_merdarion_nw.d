
instance DIA_ADDON_MERDARION_EXIT(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 999;
	condition = dia_addon_merdarion_exit_condition;
	information = dia_addon_merdarion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_HALLO(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_hallo_condition;
	information = dia_addon_merdarion_hallo_info;
	description = "Zaneprázdnìn?";
};


func int dia_addon_merdarion_hallo_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Zaneprázdnìn?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Tyhle hrobky jsou pro mì úplnou záhadou. Nepochopím, že zùstaly nepovšimnuty po tak dlouhou dobu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Vyhloubili jsme vstup bez potíží.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Lidé jsou tak zabráni do jejich práce, že nikdo nemìl èas se blíže dívat na tyto stavby.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nemám žádné další vysvìtlení.
};


instance DIA_ADDON_MERDARION_AUFGABE(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_aufgabe_condition;
	information = dia_addon_merdarion_aufgabe_info;
	description = "Jaký je zde váš úkol?";
};


func int dia_addon_merdarion_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_aufgabe_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Jaký je zde váš úkol?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Zkouším zjistit, kam by nás portál mohl zavést.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Také pomáhám Nefariusovi s hledáním ztracených ornamentù.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Je jisté, že portál nás zavede na úplnì jinou èást ostrova. Nikdo ale neví kam.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(hloubavì) Nemùžu si vzpomenout, zda jsem o tom èetl nebo slyšel ...
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(cronos_nw,"START");
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_logentry(TOPIC_ADDON_KDW,"Nefarius hledá ztracené ornamenty.");
	};
};


instance DIA_ADDON_MERDARION_DADURCH(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_dadurch_condition;
	information = dia_addon_merdarion_dadurch_info;
	description = "Vy chcete projít portálem?";
};


func int dia_addon_merdarion_dadurch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_dadurch_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Vy chcete projít portálem?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Jistì. Proto pochopitelnì potøebujeme najít zmizelé ornamenty.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Musím ale øíct, že je to celkem riskantní pokus.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale my musíme najít pøirozený dùvod tìchto zemìtøesení.
};


instance DIA_ADDON_MERDARION_BEDROHUNG(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_bedrohung_condition;
	information = dia_addon_merdarion_bedrohung_info;
	description = "Co víš o tìch zemìtøeseních?";
};


func int dia_addon_merdarion_bedrohung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_dadurch))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_bedrohung_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co víš o tìch zemìtøeseních?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Nìco na druhé stranì je øídí.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Pravdìpodobnì to samé zapøíèinilo náhlé probuzení strážcù.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale toto není mùj úkol. Saturas a Cronos ti o tom øeknou víc.
};


instance DIA_ADDON_MERDARION_WASDAHINTER2(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_wasdahinter2_condition;
	information = dia_addon_merdarion_wasdahinter2_info;
	description = "Co si myslíš, že najdete na druhé stranì?";
};


func int dia_addon_merdarion_wasdahinter2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_wasdahinter2_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co si myslíš, že najdete na druhé stranì?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Nevím jistì.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Ale pøedpokládám, že tam bude stavba podobná téhle. A druhá èást portálu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Vše ostatní se uvidí, jakmile tam budeme.
};


instance DIA_ADDON_MERDARION_PERM(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 99;
	condition = dia_addon_merdarion_perm_condition;
	information = dia_addon_merdarion_perm_info;
	permanent = TRUE;
	description = "Mùžeš mì nauèit nìco z magie?";
};


func int dia_addon_merdarion_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Mùžeš mì nauèit nìco z magie?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Jakmile budeme na druhé stranì, velice rád ti pomohu.
};


instance DIA_ADDON_MERDARION_TELEPORTSTEIN(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportstein_condition;
	information = dia_addon_merdarion_teleportstein_info;
	description = "Jaká je nejrychlejší cesta zpìt do mìsta?";
};


func int dia_addon_merdarion_teleportstein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jaká je nejrychlejší cesta zpìt do mìsta?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Nejlepší je jít cestou, kterou jsi právì pøišel.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(zadumanì) Nebo bys mohl ... Ne. Je to pøíliš nebezpeèné.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Nech to být.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Dobøe. Stavitelé tìchto síní mìli jejich vlastní zpùsob cestování.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Myslíme, že nejspíš byli schopni se teleportovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//Co je na tom tak zvláštní?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Teleportaèní kameny, které jsme našli v Khorinisu, jsou tou cestou.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Zdá se, že teleportaèní kameny vedly z tìchto síní pøímo do pøístavu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Nicménì, nikdo z nás nemìl dost odvahy, aby to zkusil.
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Co si myslíš, že se stane, když to zkusím?",dia_addon_merdarion_teleportstein_ich);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Kde je teleportaèní kámen?",dia_addon_merdarion_teleportstein_wo);
};

func void dia_addon_merdarion_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Kde je teleportaèní kámen?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//V místnosti s dírou jsou dveøe. Vidìl jsem ho za nimi.
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Dej mi klíè. Chci se na to podívat.",dia_addon_merdarion_teleportstein_key);
};

func void dia_addon_merdarion_teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Co si myslíš, že se stane, když to zkusím?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Zde není nic, co k tomu dodat. Víme o tom pøíliš málo. Je celkem pravdìpodobné, že nepøežiješ.
};

func void dia_addon_merdarion_teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Dej mi klíè. Chci to zkusit.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(neurèitì) Opravdu? Ale nebudeme za to zodpovìdní.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Dej mi ho.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Když ho chceš. Zde máš.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	b_giveinvitems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GOTPORTALTEMPELWALKTHROUGHKEY = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Merdarion mi dal klíè, který otevírá zamèené dveøe v komoøe blízko portálu. Doufám, že je to teleport, který mì hodí zpátky do pøístavu.");
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
};


instance DIA_ADDON_MERDARION_WHEREOTHERTELEPORTS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_whereotherteleports_condition;
	information = dia_addon_merdarion_whereotherteleports_info;
	description = "Kde jsou další teleportaèní kameny?";
};


func int dia_addon_merdarion_whereotherteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_whereotherteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Kde jsou další teleportaèní kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Našli jsme ještì jeden. Pøímo z centra Khorinisu.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Blízko hospody u "Mrtvé harpyje".
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Blízko hospody 'U mrtvé harpyje' je pravdìpdobnì další teleport.");
};


instance DIA_ADDON_MERDARION_TELEPORTSTEINSUCCESS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportsteinsuccess_condition;
	information = dia_addon_merdarion_teleportsteinsuccess_info;
	description = "Teleportaèní kameny pracují velice dobøe, jak se zdá.";
};


func int dia_addon_merdarion_teleportsteinsuccess_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein) && (SCUSED_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportsteinsuccess_info()
{
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Teleportaèní kameny pracují velice dobøe, jak se zdá.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Chceš øíct, že jsi je vyzkoušel? Šlápl jsi na jeden?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Ano. A jak se zdá, stále fungují.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinovanì) Neuvìøitelné. Pozdìji se na to blíž podívám.
};

