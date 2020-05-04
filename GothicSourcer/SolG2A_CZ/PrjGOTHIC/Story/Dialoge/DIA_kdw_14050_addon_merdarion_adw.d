
instance DIA_ADDON_MERDARION_ADW_EXIT(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 999;
	condition = dia_addon_merdarion_adw_exit_condition;
	information = dia_addon_merdarion_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_ADWHELLO(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adwhello_condition;
	information = dia_addon_merdarion_adwhello_info;
	description = "Jak to jde?";
};


func int dia_addon_merdarion_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adwhello_back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Slyšel jsem dost.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
};

func void dia_addon_merdarion_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(poslouchej) Slyšels to? ... Cizí, ne?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmmmm ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Tyto teleportaèní kameny vypadají, jako kdyby již nefungovali, ale nìkdy jde slyšet, jak vrèí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//I když jsou neèinné, skrývá se v nich mnoho energie.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co pohání teleportaèní kameny?",dia_addon_merdarion_adwhello_reaktor);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co si myslíš, že by je mohlo aktivovat?",dia_addon_merdarion_adwhello_was);
};

func void dia_addon_merdarion_adwhello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Co si myslíš, že by je mohlo aktivovat?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//Mám nápad. Potøeboval bych ale dokázat svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//Pøed pár dny, jsem mìl pocit, jako kdybych styl tìchto budov už vidìl.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Myslím, že jim budeme muset dodat velké množství magické energie, abychom je znovu zprovoznili.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Kde jsi už vidìl tyto teleportaèní kameny?",dia_addon_merdarion_adwhello_wo);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Jakou magickou energii bychom jim mohli dodat ...",dia_addon_merdarion_adwhello_focus);
};

func void dia_addon_merdarion_adwhello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Jakou magickou energii bychom jim mohli dodat ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Myslím, že pouze jediná. A to energie z Ohniskových kamenù.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Myslím ty ohniskové kameny, které byly použity k vytvoøení magické bariéry v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Pokud vím, tak jsi je pro nás nedávno sbíral.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Ano, vzpomínám si.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Øíkáš, že potøebuješ ovìøit svou teorii.",dia_addon_merdarion_adwhello_focusproof);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Kde jsou nyní ohniskové kameny?",dia_addon_merdarion_adwhello_focuswo);
};

func void dia_addon_merdarion_adwhello_focuswo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Kde jsou nyní ohniskové kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Byly mi svìøeny. Mìl jsem je opatrovat dokud pro nì nenajdeme další využití.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Myslím, že jsme jej právì našli.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Slyšel jsem dost.",dia_addon_merdarion_adwhello_back);
};

func void dia_addon_merdarion_adwhello_focusproof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//Øíkáš, že potøebuješ ovìøit svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Nìkdo by musel umístit ohniskový kamen k teleportaènímu kamenu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nevím kam.
};

func void dia_addon_merdarion_adwhello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Kde jsi vidìl tyto teleportaèní kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Byl jsi také v trestanecké kolonii? Tos nikdy nenarazil na teleportaèní kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jsem si celkem jistý, že tam mohou být i nyní.
};

func void dia_addon_merdarion_adwhello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co pohání teleportaèní kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Stavitelé byli velmi pokrokoví lidé.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Používali magii takovým zpùsobem, jaký jsem nevidìl nikdy pøedtím.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Sí teleportaèních kamenù byla postavena tak, aby dopravovala rychle po mìstì.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kameny na TOMTO místì se zdají jako výchozí místo pro ostatní.
};


instance DIA_ADDON_MERDARION_FOKUSGEBEN(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_fokusgeben_condition;
	information = dia_addon_merdarion_fokusgeben_info;
	description = "Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.";
};


func int dia_addon_merdarion_fokusgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_fokusgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Dobrá tedy, vpoøádku. Ale starej se o nìj dobøe, slyšíš?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas by mi rozbil hlavu, kdybychom je ztratili.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Vodní mág Merdarion mi dal jeden starý ohniskový kámen, který byl použit k vztyèení magické bariéry v Údolí dolù. Chce abych s ním aktivoval jeden teleportaèní kámen.");
};


instance DIA_ADDON_MERDARION_FIRSTFOCUS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_firstfocus_condition;
	information = dia_addon_merdarion_firstfocus_info;
	description = "Aktivoval jsem jeden teleportaèní kámen.";
};


func int dia_addon_merdarion_firstfocus_condition()
{
	if(TRIGGEREDTELEPORTERADW != 0)
	{
		return TRUE;
	};
};


var int merdarion_gotfocuscount;

func void dia_addon_merdarion_firstfocus_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Aktivoval jsem jeden teleportaèní kámen.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//A jak vidím, jsi stále ještì v poøádku.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Už jsem o tom mluvil s ostatními.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chceme zkusit aktivovat i ostatní teleportaèní kameny.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Velmi nám to pomùže v našich studiích, pokud se budeme moci rychle pohybovat z jedné èásti mìsta na jiné.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Zde je další ohniskový kámen.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	MERDARION_GOTFOCUSCOUNT = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Aktivuj ostatní, pokud budeš moci.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Uvidím, co budu moct udìlat.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Merdarion mi dal další ohnisko. Chce, abych aktivoval i další teleportaèní kameny. Pokaždé když aktivuji další, dostanu i další ohnisko.");
};


instance DIA_ADDON_MERDARION_ACTIVATETELEPORTS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_activateteleports_condition;
	information = dia_addon_merdarion_activateteleports_info;
	permanent = TRUE;
	description = "Aktivoval jsem další teleportaèní kámen.";
};


func int dia_addon_merdarion_activateteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_firstfocus) && (TRIGGEREDTELEPORTERADW > MERDARION_GOTFOCUSCOUNT) && (MERDARION_GOTFOCUSCOUNT < 6))
	{
		return TRUE;
	};
};


var int dia_addon_merdarion_activateteleports_onetime;

func void dia_addon_merdarion_activateteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Aktivoval jsem další teleportaèní kámen.
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Dej mi další ohnisko.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Samozøejmì, tady je.
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	if(DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Bylo to obtížné?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Ano a ne. Mohl bych dostat malou podporu?
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Mùžu ti dát trochu penìz. Pomohlo by?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//To nemùže škodit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Podívejme se ...
		DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME = TRUE;
	};
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Udìlals to opravdu dobøe. Mùžu ti pouze pogratulovat k tvé práci.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Nyní všechny znovu fungují. Nádherný pohled, nemyslíš?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Zde je pár zlatých mincí.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MERDARION_GOTFOCUSCOUNT = MERDARION_GOTFOCUSCOUNT + 1;
	if((MERDARION_GOTFOCUSCOUNT >= 1) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, málem bych zapomìl. Saturas s tebou chtìl mluvit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Mìl bys za ním jít, hned jak budeš moci.
	};
};


instance DIA_ADDON_MERDARION_ADW_PRETEACHMANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adw_preteachmana_condition;
	information = dia_addon_merdarion_adw_preteachmana_info;
	description = "Mùžeš mì nauèit nìco ze svých magických schopností?";
};


func int dia_addon_merdarion_adw_preteachmana_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_preteachmana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Mùžeš mì nauèit nìco ze svých magických schopností?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Mùžu tì nauèit, jak zvednout tvou magickou moc.
	MERDARION_ADDON_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,"Merdarion mi mùže zvednout manu.");
};


instance DIA_ADDON_MERDARION_ADW_TEACH_MANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 99;
	condition = dia_addon_merdarion_adw_teach_mana_condition;
	information = dia_addon_merdarion_adw_teach_mana_info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou moc.";
};


var int merdarion_adw_empty;

func int dia_addon_merdarion_adw_teach_mana_condition()
{
	if((MERDARION_ADW_EMPTY == FALSE) && (MERDARION_ADDON_TEACHMANA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_teach_mana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chci zvýšit svou magickou moc.
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Žádáš po mnì víc, než mùžu splnit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Už tì víc nemohu nauèit.
		MERDARION_ADW_EMPTY = TRUE;
	};
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
};

func void dia_addon_merdarion_adw_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

