
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Á! To jsi zase ty!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Kdy dorazili paladinové, nejdøív jsem si myslela, e to je pøíleitost k dobrım obchodùm.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Ale pak nechali Harada, aby jim vyrábìl zbranì, a ani Hakon ani já jsme od nich nevidìli ani zlatku.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Navíc farmáøi u dál nechtìjí zásobovat mìsto potravinami, a všechny ceny tak jdou nahoru.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//e mi paladinové platí hotel, je jen slabou útìchou.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Sarah prodává na trišti zbranì.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "Co je s farmáøi za problémy?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//Co je s farmáøi za problémy?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Odmítají dováet své zboí.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Teï, kdy u sem nepøiplouvají ádné lodì, je mìsto samozøejmì závislé jen na tom, co poskytnou farmáøi.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//A Onar, ten nejvìtší z farmáøù, si najal oldnéøe, aby chránili jeho farmu pøed mìstskou stráí. Jinak by si domobrana všechno zabrala pro sebe.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Ale ti oldáci nechrání jenom Onarovu farmu.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Zašli tak daleko, e zastrašují i malé farmáøe tady u mìsta.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Vidìla jsem je, kdy jsem procházela pøes Akilovu farmu. Nechtìla bych teï bıt v jeho kùi.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Pokud odejdeš vıchodní bránou a dáš se cestou napravo, dostaneš se ke schodišti.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//To vede nahoru k Akilovì farmì.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Ale já bych tam teï nechodila - urèitì tam ještì poøád jsou oldáci.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Uka mi své zboí.";
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Uka mi své zboí.
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ty! Ty máš tu drzost tady ještì ukázat svùj ksicht! Nemùu to dokázat, ale vsadím se, e jsi namoèenej do pìknì špinavı hry.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Je to tvoje chyba, e jsem tady. Tvoje a toho zatracenıho Canthara - a vás Innos ztrestá!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "Canthar se tì snail obelstít...";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar se tì pokusil podvést a získat tvùj stánek pro sebe. Ale já jsem ho pøedhodil mìstskım stráím.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Tak to sis znepøátelil nebezpeèného mue. Znám toho bastarda u pìknì dlouho, a vdycky chtìl mùj stánek pro sebe.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Vezmi si tuhle zbraò jako vyjádøení mé vdìènosti.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

