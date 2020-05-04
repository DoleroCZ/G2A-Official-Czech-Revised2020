
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
	description = "Zanepr�zdn�n?";
};


func int dia_addon_merdarion_hallo_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Zanepr�zdn�n?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Tyhle hrobky jsou pro m� �plnou z�hadou. Nepochop�m, �e z�staly nepov�imnuty po tak dlouhou dobu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Vyhloubili jsme vstup bez pot��.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Lid� jsou tak zabr�ni do jejich pr�ce, �e nikdo nem�l �as se bl�e d�vat na tyto stavby.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nem�m ��dn� dal�� vysv�tlen�.
};


instance DIA_ADDON_MERDARION_AUFGABE(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_aufgabe_condition;
	information = dia_addon_merdarion_aufgabe_info;
	description = "Jak� je zde v� �kol?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Jak� je zde v� �kol?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Zkou��m zjistit, kam by n�s port�l mohl zav�st.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Tak� pom�h�m Nefariusovi s hled�n�m ztracen�ch ornament�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Je jist�, �e port�l n�s zavede na �pln� jinou ��st ostrova. Nikdo ale nev� kam.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(hloubav�) Nem��u si vzpomenout, zda jsem o tom �etl nebo sly�el ...
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(cronos_nw,"START");
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_logentry(TOPIC_ADDON_KDW,"Nefarius hled� ztracen� ornamenty.");
	};
};


instance DIA_ADDON_MERDARION_DADURCH(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_dadurch_condition;
	information = dia_addon_merdarion_dadurch_info;
	description = "Vy chcete proj�t port�lem?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Vy chcete proj�t port�lem?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Jist�. Proto pochopiteln� pot�ebujeme naj�t zmizel� ornamenty.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Mus�m ale ��ct, �e je to celkem riskantn� pokus.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale my mus�me naj�t p�irozen� d�vod t�chto zem�t�esen�.
};


instance DIA_ADDON_MERDARION_BEDROHUNG(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_bedrohung_condition;
	information = dia_addon_merdarion_bedrohung_info;
	description = "Co v� o t�ch zem�t�esen�ch?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co v� o t�ch zem�t�esen�ch?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//N�co na druh� stran� je ��d�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Pravd�podobn� to sam� zap���inilo n�hl� probuzen� str�c�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale toto nen� m�j �kol. Saturas a Cronos ti o tom �eknou v�c.
};


instance DIA_ADDON_MERDARION_WASDAHINTER2(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_wasdahinter2_condition;
	information = dia_addon_merdarion_wasdahinter2_info;
	description = "Co si mysl�, �e najdete na druh� stran�?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co si mysl�, �e najdete na druh� stran�?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Nev�m jist�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Ale p�edpokl�d�m, �e tam bude stavba podobn� t�hle. A druh� ��st port�lu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//V�e ostatn� se uvid�, jakmile tam budeme.
};


instance DIA_ADDON_MERDARION_PERM(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 99;
	condition = dia_addon_merdarion_perm_condition;
	information = dia_addon_merdarion_perm_info;
	permanent = TRUE;
	description = "M��e� m� nau�it n�co z magie?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//M��e� m� nau�it n�co z magie?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Jakmile budeme na druh� stran�, velice r�d ti pomohu.
};


instance DIA_ADDON_MERDARION_TELEPORTSTEIN(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportstein_condition;
	information = dia_addon_merdarion_teleportstein_info;
	description = "Jak� je nejrychlej�� cesta zp�t do m�sta?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jak� je nejrychlej�� cesta zp�t do m�sta?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Nejlep�� je j�t cestou, kterou jsi pr�v� p�i�el.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(zaduman�) Nebo bys mohl ... Ne. Je to p��li� nebezpe�n�.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Nech to b�t.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Dob�e. Stavitel� t�chto s�n� m�li jejich vlastn� zp�sob cestov�n�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Mysl�me, �e nejsp� byli schopni se teleportovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//Co je na tom tak zvl�tn�?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Teleporta�n� kameny, kter� jsme na�li v Khorinisu, jsou tou cestou.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Zd� se, �e teleporta�n� kameny vedly z t�chto s�n� p��mo do p��stavu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Nicm�n�, nikdo z n�s nem�l dost odvahy, aby to zkusil.
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Co si mysl�, �e se stane, kdy� to zkus�m?",dia_addon_merdarion_teleportstein_ich);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Kde je teleporta�n� k�men?",dia_addon_merdarion_teleportstein_wo);
};

func void dia_addon_merdarion_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Kde je teleporta�n� k�men?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//V m�stnosti s d�rou jsou dve�e. Vid�l jsem ho za nimi.
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Dej mi kl��. Chci se na to pod�vat.",dia_addon_merdarion_teleportstein_key);
};

func void dia_addon_merdarion_teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Co si mysl�, �e se stane, kdy� to zkus�m?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Zde nen� nic, co k tomu dodat. V�me o tom p��li� m�lo. Je celkem pravd�podobn�, �e nep�e�ije�.
};

func void dia_addon_merdarion_teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Dej mi kl��. Chci to zkusit.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(neur�it�) Opravdu? Ale nebudeme za to zodpov�dn�.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Dej mi ho.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Kdy� ho chce�. Zde m�.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	b_giveinvitems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GOTPORTALTEMPELWALKTHROUGHKEY = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Merdarion mi dal kl��, kter� otev�r� zam�en� dve�e v komo�e bl�zko port�lu. Douf�m, �e je to teleport, kter� m� hod� zp�tky do p��stavu.");
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
};


instance DIA_ADDON_MERDARION_WHEREOTHERTELEPORTS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_whereotherteleports_condition;
	information = dia_addon_merdarion_whereotherteleports_info;
	description = "Kde jsou dal�� teleporta�n� kameny?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Kde jsou dal�� teleporta�n� kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Na�li jsme je�t� jeden. P��mo z centra Khorinisu.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Bl�zko hospody u "Mrtv� harpyje".
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Bl�zko hospody 'U mrtv� harpyje' je pravd�pdobn� dal�� teleport.");
};


instance DIA_ADDON_MERDARION_TELEPORTSTEINSUCCESS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportsteinsuccess_condition;
	information = dia_addon_merdarion_teleportsteinsuccess_info;
	description = "Teleporta�n� kameny pracuj� velice dob�e, jak se zd�.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Teleporta�n� kameny pracuj� velice dob�e, jak se zd�.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Chce� ��ct, �e jsi je vyzkou�el? �l�pl jsi na jeden?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Ano. A jak se zd�, st�le funguj�.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinovan�) Neuv��iteln�. Pozd�ji se na to bl� pod�v�m.
};

