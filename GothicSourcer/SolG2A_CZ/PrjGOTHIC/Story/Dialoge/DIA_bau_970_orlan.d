
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
	description = "Pøinesl jsem víno z kláštera.";
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
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Pøinesl jsem víno z kláštera.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Výbornì. To je to, na co jsem èekal.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Už jsem pøistoupil na Goraxovu cenu. Hned teï ti dám 100 zlatých.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Dobrá, tak mi dej to zlato.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"Ty se mì snažíš napálit?",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Dobrá, tak mi dej to zlato.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Tady máš. Bylo mi potìšením s tebou obchodovat.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Pokoušíš se mì obrat? Cena je 240 zlatých.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Gorax tì snad varoval, ne? Dobrá, možná bychom na tom mohli vydìlat oba. Hele - dám ti za to víno 100 zlatých.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Øekneš Goraxovi, že jsem tì natáhl, a já ti dám ÈTYØI magické svitky.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Hej, prostì mi dej 240 zlatých.",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"Dobrá, to zní docela férovì. Dej mi ty svitky.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"Co to je za svitky?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, prostì mi dej 240 zlatých.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Copak na tom nechceš vydìlat, co? (povzdych) Dobrá, tady je zlato.
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
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Dobrá, to zní docela férovì. Dej mi ty svitky.
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
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Netuším - o tomhle já nic nevím. Jsou od hosta, co... ehm... je tady zapomnìl, jo.
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
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Jsem Orlan, majitel téhle skromné hospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Co sháníš, cizinèe? Možná poøádný meè, nebo snad kus dobrého brnìní?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Doušek nìèeho dobrého z venkovských palíren, nebo jen nìjakou informaci?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Mùžu ti to nabídnou všechno a dokonce ještì víc, pokud jsou tvé mince pravé.
};


instance DIA_ADDON_ORLAN_GREG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_greg_condition;
	information = dia_addon_orlan_greg_info;
	description = "Znáš toho chlápka s páskou pøes oko?";
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
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Znáš toho chlápka s páskou pøes oko?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//Už jsem ho tu jednou vidìl - takový hrubián.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Ubytoval se v jednom z mých pokojù. Mìl s sebou obrovskou truhlu.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//Až když jsem mu to nìkolikrát pøipomínal, tak mi koneènì zaplatil nájem za pokoj - vùbec s tím nespìchal.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//A pak byl jednou prostì pryè. I se svou truhlou. Už nechci nic mít s lidmi jako on.
};


instance DIA_ADDON_ORLAN_RANGER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_ranger_condition;
	information = dia_addon_orlan_ranger_info;
	description = "Zdá se mi to nebo fakt zíráš na mùj prsten?";
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
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Zdá se mi to nebo fakt zíráš na mùj prsten?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Nejsem si jistý co s tím.
	ORLAN_KNOWSSCASRANGER = TRUE;
	Info_ClearChoices(dia_addon_orlan_ranger);
	Info_AddChoice(dia_addon_orlan_ranger,"Èlovìèe! Patøím ke 'Kruhu Vody'!",dia_addon_orlan_ranger_idiot);
	Info_AddChoice(dia_addon_orlan_ranger,"Je to akvamarín. Už jsi nìkdy nìjaký vidìl?",dia_addon_orlan_ranger_aqua);
};

func void dia_addon_orlan_ranger_aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Je to akvamarín. Už jsi nìkdy nìjaký vidìl?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Jo. Vítej na velitelství, bratøe Kruhu.
	if(Npc_KnowsInfo(other,dia_addon_orlan_nomeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//... i když se nazdáš být nejchytøejší ...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Co pro tebe mùžu udìlat?
	Info_ClearChoices(dia_addon_orlan_ranger);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_orlan_ranger_idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Èlovìèe! Patøím ke 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Vidím, vidím. Vypadá to, jako by zjistili, že jsou to správní pitomci ...
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Co chceš?
	Info_ClearChoices(dia_addon_orlan_ranger);
};


instance DIA_ADDON_ORLAN_TELEPORTSTEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_teleportstein_condition;
	information = dia_addon_orlan_teleportstein_info;
	description = "Už jsi nìkdy použil teleportarèní kámen?";
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
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Už jsi nìkdy použil teleportaèní kámen?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Zbláznil ses? Dokud mi mágové Vody neøeknou, že je to bezpeèné, nepøiblížím se na 10 krokù.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Povìøili mì, abych schoval jeden z tìch teleportaèních kámenù a to je pøesnì to, co chci udìlat.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_orlan_teleportstein);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Mùžu se na ten teleportarèní kámen mrknout?",dia_addon_orlan_teleportstein_sehen);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Kde je pøesnì ten teleportaèní kámen?",dia_addon_orlan_teleportstein_wo);
};

func void dia_addon_orlan_teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//Mùžu se na ten teleportaèní kámen mrknout?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Pro mì za mì. Tady je klíè. Zatarasil jsem vchod.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	b_giveinvitems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Orlan zamkl teleportaèní kámen v jeskyni na jihozápad od jeho hospody.");
};

func void dia_addon_orlan_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Kde je pøesnì ten teleportaèní kámen?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Kousek na jih od mojí hospody. Tam ho našli mágové Vody.
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
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//(štiplavì) Nevidím prsten. Chceš nìco k pití?
};


instance DIA_ADDON_ORLAN_WHENRANGERMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_whenrangermeeting_condition;
	information = dia_addon_orlan_whenrangermeeting_info;
	description = "Slyšel jsem nìco o srazu 'Kruhu' ve tvé hospodì.";
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
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Slyšel jsem nìco o srazu 'Kruhu' ve tvé hospodì.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//To je pravda. Mìl by každou chvíli zaèít.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Zajímalo by mì, co je zdrželo.
	b_giveplayerxp(XP_AMBIENT);
	b_addon_orlan_rangersreadyforcoming();
	self.flags = 0;
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Jsem si jistý, že se brzy objeví.",dia_addon_orlan_whenrangermeeting_theycome);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Ten sraz je dneska?",dia_addon_orlan_whenrangermeeting_today);
};

func void dia_addon_orlan_whenrangermeeting_today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Ten sraz je dneska?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Pokud si to dobøe pamatuju tak ano.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Doufám, že zase pøijdou pozdì.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(Více)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_theycome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Jsem si jistý, že se brzy objeví.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Uvidíme.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(Více)",dia_addon_orlan_whenrangermeeting_los);
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
	description = "Jaký druh zbroje mi mùžeš nabídnout?";
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
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jaký druh zbroje mi mùžeš nabídnout?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//Mám tady jeden velmi pìkný kousek, který se ti urèitì bude líbit.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"Kožená zbroj. Ochrana: zbranì 25, šípy 20, oheò 5 (250 zlaákù)",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Chtìl bych si koupit lehkou zbroj.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_LEATHER_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Moudré rozhodnutí.
		CreateInvItems(self,itar_leather_l,1);
		b_giveinvitems(self,other,itar_leather_l,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Promiò. Dokud nemáš peníze, žádné obchody nebudou.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Budu o tom pøemýšlet.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chceš. Ale neotálej pøíliš dlouho.
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
	description = "Ukaž mi své zboží.";
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
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Ukaž mi své zboží.
	b_givetradeinv(self);
	if((SC_ISRANGER == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Samozøejmì, bratøe kruhu.
		ORLAN_KNOWSSCASRANGER = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Samozøejmì. Je to pro mì velká èest, pøijmout tak dùležitý úkol.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Zajisté, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Pokud na to máš.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "Kolik si úètuješ za pokoj?";
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
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Kolik si úètuješ za pokoj?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
	{
		if((SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Pro bratra 'Kruhu'? Vùbec nic.
			ORLAN_RANGERHELPZIMMER = TRUE;
			ORLAN_KNOWSSCASRANGER = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Pro královy rytíøe mám vždycky volný pokoj. Samozøejmì zdarma.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nikdy bych si nedovolil brát peníze od zástupcù Innose.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Tady je klíè od hoøejších pokojù. Jeden z nich si zaber.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Dej mi 50 zlatých na týden a mùžeš si vybrat nìkterý z pokojù.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"To je zatracenì drahé.",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"Dobrá. Tady jsou prachy.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Dobrá. Tady jsou prachy.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Tady máš klíè. Pokoje jsou nahoøe nad schody. Ale moc to tam nezamaž a pla vèas, jasné?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nemáš 50. Nejdøív peníze, pak zábava.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Tak to je zatracenì drahý.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Tak to by ses mìl poohlédnout po nìèem jiném, pøíteli.
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
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(úlisnì) Jsem potìšen tvou ctihodnou návštìvou. Zùstaò tu tak dlouho, jak budeš chtít. Je to pro mì èest.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kdy koneènì dostanu nájem?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"Zapomeò na to, už ti nedám ani zlámanou grešli.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"Tady je tvých 50 zlatých.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Tady je tvých 50 zlatých.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Fajn, už bylo naèase.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Kde ses celý den toulal?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Do toho ti nic není.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Dobrá, stejnì to není moje vìc.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Hele, pokoušíš se mì podvést? Nemáš dost penìz ani na to, abys zaplatil tohle jídlo. Já ti ukážu, ty, ty...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Zapomeò na to. Už ti nezaplatím.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Fajn, já ti ukážu, ty mizernej podvodníku.
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
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Tak pøece ses ukázal. Èekal jsem na tebe.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co se stalo?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Soutìž v pití skonèila.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kdo vyhrál?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tentokrát Randolph. Rukhar musel mít špatnej den.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar to už zase Randolphovi nandal. To se dalo jen oèekávat.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Tak dobrá, doufám, že to bylo naposledy. O takovéhle pozdvižení ve svém domì nestojím, zapište si to všichni za uši.
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
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Tos mì dostal do pìkné kaše. Teï abych Rukharovi ještì nalil.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Proè?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Dokud si tady poøádá ty své soutìže, je lepší, aby se o tom nikdo z venku nedozvìdìl. Není to dobré pro obchod, jasný?
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
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Už to bylo lepší, však víš.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Lidé už nesahají do svých mìšcù tak ochotnì, jak by mìli.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Snad ty èerní mágové brzy odtáhnou, jinak mùžu hospodu zavøít.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Už se skoro nikdo neodváží zajít až sem.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "Prodáváš dùlní akcie?";
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
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Prodáváš dùlní akcie?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasnì. Ode mì dostaneš všechno, tedy pokud na to máš.
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

