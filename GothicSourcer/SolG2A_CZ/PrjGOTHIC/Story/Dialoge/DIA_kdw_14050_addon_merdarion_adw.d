
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Sly�el jsem dost.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
};

func void dia_addon_merdarion_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(poslouchej) Sly�els to? ... Ciz�, ne?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmmmm ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Tyto teleporta�n� kameny vypadaj�, jako kdyby ji� nefungovali, ale n�kdy jde sly�et, jak vr��.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//I kdy� jsou ne�inn�, skr�v� se v nich mnoho energie.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co poh�n� teleporta�n� kameny?",dia_addon_merdarion_adwhello_reaktor);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co si mysl�, �e by je mohlo aktivovat?",dia_addon_merdarion_adwhello_was);
};

func void dia_addon_merdarion_adwhello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Co si mysl�, �e by je mohlo aktivovat?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//M�m n�pad. Pot�eboval bych ale dok�zat svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//P�ed p�r dny, jsem m�l pocit, jako kdybych styl t�chto budov u� vid�l.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Mysl�m, �e jim budeme muset dodat velk� mno�stv� magick� energie, abychom je znovu zprovoznili.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Kde jsi u� vid�l tyto teleporta�n� kameny?",dia_addon_merdarion_adwhello_wo);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Jakou magickou energii bychom jim mohli dodat ...",dia_addon_merdarion_adwhello_focus);
};

func void dia_addon_merdarion_adwhello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Jakou magickou energii bychom jim mohli dodat ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Mysl�m, �e pouze jedin�. A to energie z Ohniskov�ch kamen�.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Mysl�m ty ohniskov� kameny, kter� byly pou�ity k vytvo�en� magick� bari�ry v Hornick�m �dol�.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Pokud v�m, tak jsi je pro n�s ned�vno sb�ral.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Ano, vzpom�n�m si.
	Info_AddChoice(dia_addon_merdarion_adwhello,"��k�, �e pot�ebuje� ov��it svou teorii.",dia_addon_merdarion_adwhello_focusproof);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Kde jsou nyn� ohniskov� kameny?",dia_addon_merdarion_adwhello_focuswo);
};

func void dia_addon_merdarion_adwhello_focuswo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Kde jsou nyn� ohniskov� kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Byly mi sv��eny. M�l jsem je opatrovat dokud pro n� nenajdeme dal�� vyu�it�.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Mysl�m, �e jsme jej pr�v� na�li.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Sly�el jsem dost.",dia_addon_merdarion_adwhello_back);
};

func void dia_addon_merdarion_adwhello_focusproof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//��k�, �e pot�ebuje� ov��it svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//N�kdo by musel um�stit ohniskov� kamen k teleporta�n�mu kamenu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nev�m kam.
};

func void dia_addon_merdarion_adwhello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Kde jsi vid�l tyto teleporta�n� kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Byl jsi tak� v trestaneck� kolonii? Tos nikdy nenarazil na teleporta�n� kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jsem si celkem jist�, �e tam mohou b�t i nyn�.
};

func void dia_addon_merdarion_adwhello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co poh�n� teleporta�n� kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Stavitel� byli velmi pokrokov� lid�.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Pou��vali magii takov�m zp�sobem, jak� jsem nevid�l nikdy p�edt�m.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//S� teleporta�n�ch kamen� byla postavena tak, aby dopravovala rychle po m�st�.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kameny na TOMTO m�st� se zdaj� jako v�choz� m�sto pro ostatn�.
};


instance DIA_ADDON_MERDARION_FOKUSGEBEN(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_fokusgeben_condition;
	information = dia_addon_merdarion_fokusgeben_info;
	description = "Dej mi ohniskov� k�men. Uvid�m, zda-li budu moci teleport zprovoznit.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Dej mi ohniskov� k�men. Uvid�m, zda-li budu moci teleport zprovoznit.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Dobr� tedy, vpo��dku. Ale starej se o n�j dob�e, sly��?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas by mi rozbil hlavu, kdybychom je ztratili.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Vodn� m�g Merdarion mi dal jeden star� ohniskov� k�men, kter� byl pou�it k vzty�en� magick� bari�ry v �dol� dol�. Chce abych s n�m aktivoval jeden teleporta�n� k�men.");
};


instance DIA_ADDON_MERDARION_FIRSTFOCUS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_firstfocus_condition;
	information = dia_addon_merdarion_firstfocus_info;
	description = "Aktivoval jsem jeden teleporta�n� k�men.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Aktivoval jsem jeden teleporta�n� k�men.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//A jak vid�m, jsi st�le je�t� v po��dku.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//U� jsem o tom mluvil s ostatn�mi.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chceme zkusit aktivovat i ostatn� teleporta�n� kameny.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Velmi n�m to pom��e v na�ich studi�ch, pokud se budeme moci rychle pohybovat z jedn� ��sti m�sta na jin�.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Zde je dal�� ohniskov� k�men.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	MERDARION_GOTFOCUSCOUNT = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Aktivuj ostatn�, pokud bude� moci.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Uvid�m, co budu moct ud�lat.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Merdarion mi dal dal�� ohnisko. Chce, abych aktivoval i dal�� teleporta�n� kameny. Poka�d� kdy� aktivuji dal��, dostanu i dal�� ohnisko.");
};


instance DIA_ADDON_MERDARION_ACTIVATETELEPORTS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_activateteleports_condition;
	information = dia_addon_merdarion_activateteleports_info;
	permanent = TRUE;
	description = "Aktivoval jsem dal�� teleporta�n� k�men.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Aktivoval jsem dal�� teleporta�n� k�men.
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Dej mi dal�� ohnisko.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Samoz�ejm�, tady je.
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	if(DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Bylo to obt�n�?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Ano a ne. Mohl bych dostat malou podporu?
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//M��u ti d�t trochu pen�z. Pomohlo by?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//To nem��e �kodit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Pod�vejme se ...
		DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME = TRUE;
	};
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Ud�lals to opravdu dob�e. M��u ti pouze pogratulovat k tv� pr�ci.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Nyn� v�echny znovu funguj�. N�dhern� pohled, nemysl�?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Zde je p�r zlat�ch minc�.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MERDARION_GOTFOCUSCOUNT = MERDARION_GOTFOCUSCOUNT + 1;
	if((MERDARION_GOTFOCUSCOUNT >= 1) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, m�lem bych zapom�l. Saturas s tebou cht�l mluvit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//M�l bys za n�m j�t, hned jak bude� moci.
	};
};


instance DIA_ADDON_MERDARION_ADW_PRETEACHMANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adw_preteachmana_condition;
	information = dia_addon_merdarion_adw_preteachmana_info;
	description = "M��e� m� nau�it n�co ze sv�ch magick�ch schopnost�?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//M��e� m� nau�it n�co ze sv�ch magick�ch schopnost�?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//M��u t� nau�it, jak zvednout tvou magickou moc.
	MERDARION_ADDON_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,"Merdarion mi m��e zvednout manu.");
};


instance DIA_ADDON_MERDARION_ADW_TEACH_MANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 99;
	condition = dia_addon_merdarion_adw_teach_mana_condition;
	information = dia_addon_merdarion_adw_teach_mana_info;
	permanent = TRUE;
	description = "Chci zv��it svou magickou moc.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chci zv��it svou magickou moc.
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//��d� po mn� v�c, ne� m��u splnit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//U� t� v�c nemohu nau�it.
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

