
instance DIA_ORLAN_EXIT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 999;
	condition = dia_orlan_exit_condition;
	information = dia_orlan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orlan_exit_condition()
{
	return TRUE;
};

func void dia_orlan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORLAN_WEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_wein_condition;
	information = dia_orlan_wein_info;
	permanent = FALSE;
	description = "P�inesl jsem v�no z kl�tera.";
};


func int dia_orlan_wein_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
	{
		return TRUE;
	};
};

func void dia_orlan_wein_info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//P�inesl jsem v�no z kl�tera.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//V�born�. To je to, na co jsem �ekal.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//U� jsem p�istoupil na Goraxovu cenu. Hned te� ti d�m 100 zlat�ch.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Dobr�, tak mi dej to zlato.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"Ty se m� sna�� nap�lit?",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Dobr�, tak mi dej to zlato.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Tady m�. Bylo mi pot�en�m s tebou obchodovat.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Pokou�� se m� obrat? Cena je 240 zlat�ch.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Gorax t� snad varoval, ne? Dobr�, mo�n� bychom na tom mohli vyd�lat oba. Hele - d�m ti za to v�no 100 zlat�ch.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//�ekne� Goraxovi, �e jsem t� nat�hl, a j� ti d�m �TY�I magick� svitky.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Hej, prost� mi dej 240 zlat�ch.",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"Dobr�, to zn� docela f�rov�. Dej mi ty svitky.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"Co to je za svitky?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, prost� mi dej 240 zlat�ch.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Copak na tom nechce� vyd�lat, co? (povzdych) Dobr�, tady je zlato.
	b_giveinvitems(self,other,itmi_gold,240);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
	PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Dobr�, to zn� docela f�rov�. Dej mi ty svitky.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Tady jsou svitky a zlato.
	b_giveinvitems(other,self,itfo_wine,12);
	CreateInvItems(hero,itsc_light,2);
	CreateInvItems(hero,itsc_lightheal,1);
	CreateInvItems(hero,itsc_sumgobskel,1);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to je za svitky?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Netu��m - o tomhle j� nic nev�m. Jsou od hosta, co... ehm... je tady zapomn�l, jo.
};


instance DIA_ORLAN_WERBISTDU(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_orlan_werbistdu_condition;
	information = dia_orlan_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_orlan_werbistdu_condition()
{
	return TRUE;
};

func void dia_orlan_werbistdu_info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Jsem Orlan, majitel t�hle skromn� hospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Co sh�n�, cizin�e? Mo�n� po��dn� me�, nebo snad kus dobr�ho brn�n�?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Dou�ek n��eho dobr�ho z venkovsk�ch pal�ren, nebo jen n�jakou informaci?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//M��u ti to nab�dnou v�echno a dokonce je�t� v�c, pokud jsou tv� mince prav�.
};


instance DIA_ADDON_ORLAN_GREG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_greg_condition;
	information = dia_addon_orlan_greg_info;
	description = "Zn� toho chl�pka s p�skou p�es oko?";
};


func int dia_addon_orlan_greg_condition()
{
	if((SC_SAWGREGINTAVERNE == TRUE) && (KAPITEL <= 3) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Zn� toho chl�pka s p�skou p�es oko?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//U� jsem ho tu jednou vid�l - takov� hrubi�n.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Ubytoval se v jednom z m�ch pokoj�. M�l s sebou obrovskou truhlu.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//A� kdy� jsem mu to n�kolikr�t p�ipom�nal, tak mi kone�n� zaplatil n�jem za pokoj - v�bec s t�m nesp�chal.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//A pak byl jednou prost� pry�. I se svou truhlou. U� nechci nic m�t s lidmi jako on.
};


instance DIA_ADDON_ORLAN_RANGER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_ranger_condition;
	information = dia_addon_orlan_ranger_info;
	description = "Zd� se mi to nebo fakt z�r� na m�j prsten?";
};


func int dia_addon_orlan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (SCISWEARINGRANGERRING == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Zd� se mi to nebo fakt z�r� na m�j prsten?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Nejsem si jist� co s t�m.
	ORLAN_KNOWSSCASRANGER = TRUE;
	Info_ClearChoices(dia_addon_orlan_ranger);
	Info_AddChoice(dia_addon_orlan_ranger,"�lov��e! Pat��m ke 'Kruhu Vody'!",dia_addon_orlan_ranger_idiot);
	Info_AddChoice(dia_addon_orlan_ranger,"Je to akvamar�n. U� jsi n�kdy n�jak� vid�l?",dia_addon_orlan_ranger_aqua);
};

func void dia_addon_orlan_ranger_aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Je to akvamar�n. U� jsi n�kdy n�jak� vid�l?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Jo. V�tej na velitelstv�, brat�e Kruhu.
	if(Npc_KnowsInfo(other,dia_addon_orlan_nomeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//... i kdy� se nazd� b�t nejchyt�ej�� ...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Co pro tebe m��u ud�lat?
	Info_ClearChoices(dia_addon_orlan_ranger);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_orlan_ranger_idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//�lov��e! Pat��m ke 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Vid�m, vid�m. Vypad� to, jako by zjistili, �e jsou to spr�vn� pitomci ...
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Co chce�?
	Info_ClearChoices(dia_addon_orlan_ranger);
};


instance DIA_ADDON_ORLAN_TELEPORTSTEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_teleportstein_condition;
	information = dia_addon_orlan_teleportstein_info;
	description = "U� jsi n�kdy pou�il teleportar�n� k�men?";
};


func int dia_addon_orlan_teleportstein_condition()
{
	if((ORLAN_KNOWSSCASRANGER == TRUE) && (SCUSED_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//U� jsi n�kdy pou�il teleporta�n� k�men?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Zbl�znil ses? Dokud mi m�gov� Vody ne�eknou, �e je to bezpe�n�, nep�ibl��m se na 10 krok�.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Pov��ili m�, abych schoval jeden z t�ch teleporta�n�ch k�men� a to je p�esn� to, co chci ud�lat.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_orlan_teleportstein);
	Info_AddChoice(dia_addon_orlan_teleportstein,"M��u se na ten teleportar�n� k�men mrknout?",dia_addon_orlan_teleportstein_sehen);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Kde je p�esn� ten teleporta�n� k�men?",dia_addon_orlan_teleportstein_wo);
};

func void dia_addon_orlan_teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//M��u se na ten teleporta�n� k�men mrknout?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Pro m� za m�. Tady je kl��. Zatarasil jsem vchod.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	b_giveinvitems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Orlan zamkl teleporta�n� k�men v jeskyni na jihoz�pad od jeho hospody.");
};

func void dia_addon_orlan_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Kde je p�esn� ten teleporta�n� k�men?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Kousek na jih od moj� hospody. Tam ho na�li m�gov� Vody.
};


instance DIA_ADDON_ORLAN_NOMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_nomeeting_condition;
	information = dia_addon_orlan_nomeeting_info;
	description = "Jsem zde uveden do 'Kruhu Vody'!";
};


func int dia_addon_orlan_nomeeting_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && !Npc_KnowsInfo(other,dia_addon_orlan_ranger) && (SCISWEARINGRANGERRING == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_nomeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Jsem zde uveden do 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//(�tiplav�) Nevid�m prsten. Chce� n�co k pit�?
};


instance DIA_ADDON_ORLAN_WHENRANGERMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_whenrangermeeting_condition;
	information = dia_addon_orlan_whenrangermeeting_info;
	description = "Sly�el jsem n�co o srazu 'Kruhu' ve tv� hospod�.";
};


func int dia_addon_orlan_whenrangermeeting_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_orlan_ranger))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_whenrangermeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Sly�el jsem n�co o srazu 'Kruhu' ve tv� hospod�.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//To je pravda. M�l by ka�dou chv�li za��t.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Zaj�malo by m�, co je zdr�elo.
	b_giveplayerxp(XP_AMBIENT);
	b_addon_orlan_rangersreadyforcoming();
	self.flags = 0;
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Jsem si jist�, �e se brzy objev�.",dia_addon_orlan_whenrangermeeting_theycome);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Ten sraz je dneska?",dia_addon_orlan_whenrangermeeting_today);
};

func void dia_addon_orlan_whenrangermeeting_today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Ten sraz je dneska?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Pokud si to dob�e pamatuju tak ano.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Douf�m, �e zase p�ijdou pozd�.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(V�ce)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_theycome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Jsem si jist�, �e se brzy objev�.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Uvid�me.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(V�ce)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_los()
{
	AI_StopProcessInfos(self);
	b_addon_orlan_comingranger();
};


instance DIA_ORLAN_RUESTUNG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_orlan_ruestung_condition;
	information = dia_orlan_ruestung_info;
	permanent = TRUE;
	description = "Jak� druh zbroje mi m��e� nab�dnout?";
};


var int dia_orlan_ruestung_noperm;

func int dia_orlan_ruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_orlan_ruestung_info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jak� druh zbroje mi m��e� nab�dnout?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//M�m tady jeden velmi p�kn� kousek, kter� se ti ur�it� bude l�bit.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"Ko�en� zbroj. Ochrana: zbran� 25, ��py 20, ohe� 5 (250 zla��k�)",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Cht�l bych si koupit lehkou zbroj.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_LEATHER_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Moudr� rozhodnut�.
		CreateInvItems(self,itar_leather_l,1);
		b_giveinvitems(self,other,itar_leather_l,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Promi�. Dokud nem� pen�ze, ��dn� obchody nebudou.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chce�. Ale neot�lej p��li� dlouho.
	Info_ClearChoices(dia_orlan_ruestung);
};


instance DIA_ORLAN_TRADE(C_INFO)
{
	npc = bau_970_orlan;
	nr = 70;
	condition = dia_orlan_trade_condition;
	information = dia_orlan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_orlan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_trade_info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Uka� mi sv� zbo��.
	b_givetradeinv(self);
	if((SC_ISRANGER == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Samoz�ejm�, brat�e kruhu.
		ORLAN_KNOWSSCASRANGER = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Samoz�ejm�. Je to pro m� velk� �est, p�ijmout tak d�le�it� �kol.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Zajist�, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Pokud na to m�.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "Kolik si ��tuje� za pokoj?";
};


var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;

func int dia_orlan_hotelzimmer_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_hotelzimmer_info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Kolik si ��tuje� za pokoj?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
	{
		if((SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Pro bratra 'Kruhu'? V�bec nic.
			ORLAN_RANGERHELPZIMMER = TRUE;
			ORLAN_KNOWSSCASRANGER = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Pro kr�lovy ryt��e m�m v�dycky voln� pokoj. Samoz�ejm� zdarma.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nikdy bych si nedovolil br�t pen�ze od z�stupc� Innose.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Tady je kl�� od ho�ej��ch pokoj�. Jeden z nich si zaber.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Dej mi 50 zlat�ch na t�den a m��e� si vybrat n�kter� z pokoj�.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"To je zatracen� drah�.",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"Dobr�. Tady jsou prachy.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Dobr�. Tady jsou prachy.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Tady m� kl��. Pokoje jsou naho�e nad schody. Ale moc to tam nezama� a pla� v�as, jasn�?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nem� 50. Nejd��v pen�ze, pak z�bava.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Tak to je zatracen� drah�.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Tak to by ses m�l poohl�dnout po n��em jin�m, p��teli.
	Info_ClearChoices(dia_orlan_hotelzimmer);
};


var int orlan_angriffwegenmiete;

instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 10;
	condition = dia_orlan_mietefaellig_condition;
	information = dia_orlan_mietefaellig_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_orlan_mietefaellig_nomore;

func int dia_orlan_mietefaellig_condition()
{
	if((SC_ISRANGER == TRUE) || (ORLAN_RANGERHELPZIMMER == TRUE))
	{
		return FALSE;
	};
	if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
			ORLAN_ANGRIFFWEGENMIETE = FALSE;
			return FALSE;
		};
	};
	if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_mietefaellig_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(�lisn�) Jsem pot�en tvou ctihodnou n�v�t�vou. Z�sta� tu tak dlouho, jak bude� cht�t. Je to pro m� �est.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kdy kone�n� dostanu n�jem?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"Zapome� na to, u� ti ned�m ani zl�manou gre�li.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"Tady je tv�ch 50 zlat�ch.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Tady je tv�ch 50 zlat�ch.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Fajn, u� bylo na�ase.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Kde ses cel� den toulal?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Do toho ti nic nen�.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Dobr�, stejn� to nen� moje v�c.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Hele, pokou�� se m� podv�st? Nem� dost pen�z ani na to, abys zaplatil tohle j�dlo. J� ti uk�u, ty, ty...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Zapome� na to. U� ti nezaplat�m.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Fajn, j� ti uk�u, ty mizernej podvodn�ku.
	ORLAN_ANGRIFFWEGENMIETE = TRUE;
	Info_ClearChoices(dia_orlan_mietefaellig);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 7;
	condition = dia_orlan_wettkampflaeuft_condition;
	information = dia_orlan_wettkampflaeuft_info;
	important = TRUE;
};


func int dia_orlan_wettkampflaeuft_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void dia_orlan_wettkampflaeuft_info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Tak p�ece ses uk�zal. �ekal jsem na tebe.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co se stalo?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Sout� v pit� skon�ila.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kdo vyhr�l?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tentokr�t Randolph. Rukhar musel m�t �patnej den.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar to u� zase Randolphovi nandal. To se dalo jen o�ek�vat.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Tak dobr�, douf�m, �e to bylo naposledy. O takov�hle pozdvi�en� ve sv�m dom� nestoj�m, zapi�te si to v�ichni za u�i.
	};
	b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(randolph,"Start");
	if(Hlp_IsValidNpc(rukhar))
	{
		if(RUKHAR_WON_WETTKAMPF == TRUE)
		{
			b_startotherroutine(rukhar,"WettkampfRukharWon");
		}
		else
		{
			b_startotherroutine(rukhar,"WettkampfRukharLost");
		};
	};
	MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 8;
	condition = dia_orlan_eingebrockt_condition;
	information = dia_orlan_eingebrockt_info;
	important = TRUE;
};


func int dia_orlan_eingebrockt_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_orlan_eingebrockt_info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Tos m� dostal do p�kn� ka�e. Te� abych Rukharovi je�t� nalil.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Pro�?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Dokud si tady po��d� ty sv� sout�e, je lep��, aby se o tom nikdo z venku nedozv�d�l. Nen� to dobr� pro obchod, jasn�?
};


instance DIA_ORLAN_PERM(C_INFO)
{
	npc = bau_970_orlan;
	nr = 99;
	condition = dia_orlan_perm_condition;
	information = dia_orlan_perm_info;
	permanent = TRUE;
	description = "Jak to jde s hospodou?";
};


func int dia_orlan_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_perm_info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak to jde s hospodou?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//U� to bylo lep��, v�ak v�.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Lid� u� nesahaj� do sv�ch m�c� tak ochotn�, jak by m�li.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Snad ty �ern� m�gov� brzy odt�hnou, jinak m��u hospodu zav��t.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//U� se skoro nikdo neodv�� zaj�t a� sem.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "Prod�v� d�ln� akcie?";
};


func int dia_orlan_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_minenanteil_info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Prod�v� d�ln� akcie?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasn�. Ode m� dostane� v�echno, tedy pokud na to m�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
	npc = bau_970_orlan;
	nr = 900;
	condition = dia_orlan_pickpocket_condition;
	information = dia_orlan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_orlan_pickpocket_condition()
{
	return c_beklauen(89,260);
};

func void dia_orlan_pickpocket_info()
{
	Info_ClearChoices(dia_orlan_pickpocket);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};

func void dia_orlan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_orlan_pickpocket);
};

func void dia_orlan_pickpocket_back()
{
	Info_ClearChoices(dia_orlan_pickpocket);
};

