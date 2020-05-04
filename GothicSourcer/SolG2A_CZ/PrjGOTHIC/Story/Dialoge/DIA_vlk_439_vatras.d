
var int vatras_schickeleuteweg;
var int vatras_laresexit;
var int vatras_more;

instance DIA_ADDON_VATRAS_KILLERWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_killerwarning_condition;
	information = dia_addon_vatras_killerwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_killerwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 3) && (MADKILLERCOUNT < 7) && (VATRASPISSEDOFFFOREVER == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_killerwarning_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Hodnì zvìstí se o tobì v Khorinisu šíøí.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Øíká se, e jsi zapleten do vraød nevinnıch lidí.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Mohu tì jen varovat synu, doufaje e správnì.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nesestupuj z cesty rovnováhy a záchrany tohoto svìta. Jinak se budeš muset pøipravit nést následky.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Jak mohu bıt mimo slubu?
};


instance DIA_ADDON_VATRAS_LASTWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_lastwarning_condition;
	information = dia_addon_vatras_lastwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_lastwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 7) && (VATRASPISSEDOFFFOREVER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_lastwarning_info()
{
	b_lastwarningvatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Je nìco, co bys chtìl dodat?
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Vypadni",dia_addon_vatras_lastwarning_arsch);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Je mi líto. Nevìdìl jsem co dìlám.",dia_addon_vatras_lastwarning_reue);
};

func void dia_addon_vatras_lastwarning_arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Vypadni
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Ve tvıch slovech není ádnı náznak lítosti.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nedal jsi mi jinou monost.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	b_vatraspissedoff();
};

func void dia_addon_vatras_lastwarning_reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Je mi líto. Nevìdìl jsem co dìlám.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Budu se za tebe modlit a doufat, e jednoho dne opìt najdeš rovnováhu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Buï opatrnı a opova se ještì nìkdy zaplést do vrady.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	VATRASMADKILLERCOUNT = MADKILLERCOUNT;
};


instance DIA_ADDON_VATRAS_PISSEDOFF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_pissedoff_condition;
	information = dia_addon_vatras_pissedoff_info;
	important = TRUE;
};


func int dia_addon_vatras_pissedoff_condition()
{
	if((MADKILLERCOUNT > VATRASMADKILLERCOUNT) && Npc_KnowsInfo(other,dia_addon_vatras_lastwarning) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissedoff_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Tvá slova jsou stejnì špatná jako tvé èiny.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Tvé necitelné vradìní zjevnì nikdy neskonèí.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Nedáváš mi jinou monost.
	b_vatraspissedoff();
};


instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (VATRAS_LARESEXIT == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Poèkej!
		if(VATRAS_GEHZULARES == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Pokud se setkáš s Laresem....
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Je tu jedna malá vìc, o kterou bych tì chtìl poádat.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Bì do pøístavu. Najdeš tam chlapíka jménem Lares.
			VATRAS_GEHZULARES = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Doruè mu tento ornament a povìz mu, aby ho odnesl zpìt. Bude vìdìt, co udìlat dál.
		CreateInvItems(self,itmi_ornament_addon_vatras,1);
		b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
		VATRAS_LARESEXIT = TRUE;
	};
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos tì provázej.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Jsem Vatras, sluebník Adanùv, stráce boské i pozemské rovnováhy.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co pro tebe mohu udìlat?
};


instance DIA_ADDON_VATRAS_CAVALORN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_cavalorn_condition;
	information = dia_addon_vatras_cavalorn_info;
	description = "Mám pro tebe dopis.";
};


func int dia_addon_vatras_cavalorn_condition()
{
	if(((Npc_HasItems(other,itwr_saturasfirstmessage_addon_sealed) >= 1) && (MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_RUNNING)) || (Npc_HasItems(other,itwr_saturasfirstmessage_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalorn_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//Mám pro tebe dopis.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Pro mì?
	if(SATURASFIRSTMESSAGEOPENED == FALSE)
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon_sealed,1);
	}
	else
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS_OPENED);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Jo, ale...byl otevøen. Doufám e ho neèetl nikdo, kdo ho nemá vidìt.
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Vskutku. To je opravdu dùleitá zpráva.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Divím se, e se ti ta zpráva dostala vùbec do rukou.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
	Info_AddChoice(dia_addon_vatras_cavalorn,"Sebral jsem to banditùm",dia_addon_vatras_cavalorn_bandit);
	if(MIS_ADDON_CAVALORN_KILLBRAGO == LOG_SUCCESS)
	{
		Info_AddChoice(dia_addon_vatras_cavalorn,"Dal mi ji Cavalorn.",dia_addon_vatras_cavalorn_cavalorn);
	};
	MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_SUCCESS;
};

func void dia_addon_vatras_cavalorn_bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Sebral jsem to banditùm
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(znepokojenì) U Adanose! To není dobré. To vùbec není dobré.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Pokud je tvé vyprávìní pravdivé, pak máme obrovskı problém.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Budu se tím zabıvat hned, jak to bude moné.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};

func void dia_addon_vatras_cavalorn_cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Dal mi ji Cavalorn.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(pøekvapenì) Cavalorn? Kde je?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Øekl mi, abych ti vyøídil, e nemohl dopis doruèit. Nyní je na cestì k místu obvyklého setkání. A u je to cokoliv.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Vidím, e sis získal jeho dùvìru. Mìl bych ti také vìøit synu.
	b_giveplayerxp(XP_ADDON_CAVALORNTRUST);
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};


var int vatras_why;

instance DIA_ADDON_VATRAS_CAVALORNSENTME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_cavalornsentme_condition;
	information = dia_addon_vatras_cavalornsentme_info;
	permanent = FALSE;
	description = "Cavalorn mì za tebou poslal!";
};


func int dia_addon_vatras_cavalornsentme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE) && Npc_KnowsInfo(other,dia_addon_cavalorn_ring) && (VATRAS_WHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalornsentme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn mì za tebou poslal!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//A co øíkal?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Zmínil se, e máš kolem sebe nìkolik schopnıch lidí, co ti pomáhají. Prı bych se mohl taky pøidat.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(usmìv)Tak .... chtìl by ses k nám pøidat synu?
};


instance DIA_ADDON_VATRAS_TELLME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_tellme_condition;
	information = dia_addon_vatras_tellme_info;
	permanent = TRUE;
	description = "Povìz mi nìco o Kruhu Vody.";
};


func int dia_addon_vatras_tellme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_tellme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Povìz mi nìco o Kruhu Vody.
	if(!Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(netrpìlivì) A proè bych ti mìl nìco øíkat?
		VATRAS_WHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nemusíš vìdìt VŠECHNO, dokud nejsi jedním z nás.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Øeknu ti vše, co mohu.
		Info_ClearChoices(dia_addon_vatras_tellme);
		Info_AddChoice(dia_addon_vatras_tellme,DIALOG_BACK,dia_addon_vatras_tellme_back);
		Info_AddChoice(dia_addon_vatras_tellme,"Tak co máte nyní v plánu?",dia_addon_vatras_tellme_philo);
		Info_AddChoice(dia_addon_vatras_tellme,"Kde jsou ostatní mágové Vody?",dia_addon_vatras_tellme_otherkdw);
		Info_AddChoice(dia_addon_vatras_tellme,"Kdo jsou èlenové Kruhu Vody?",dia_addon_vatras_tellme_wernoch);
	};
};

func void dia_addon_vatras_tellme_back()
{
	Info_ClearChoices(dia_addon_vatras_tellme);
};

func void dia_addon_vatras_tellme_philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Tak co máte nyní v plánu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stojíme mezi øádem Innose a chaosem Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Pokud by jedna strana pøevaovala, mìlo by to za následek buï ztrátu svobody nebo pøíchod smrtnesoucího chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//A pokoušíme se zajistit rovnováhu. Je to jediná cesta pro ivot na tomto svìtì.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == 0)
	{
		Info_AddChoice(dia_addon_vatras_tellme,"Mohl bys bıt trochu víc konkrétní?",dia_addon_vatras_tellme_konkret);
	};
};

func void dia_addon_vatras_tellme_konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(udivenì) Mohl bys bıt trochu víc konkrétní?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Po té, co bariera padla to tu je velmi nebezpeèné.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Jedna z nejvìtších hrozeb jsou zjevnì banditi.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Je skoro nemoné cestovat po ostrovì neozbrojen ...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... ve mìstì je dokonce nìkdo, kdo bandity podporuje!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Zjistili jsme, e bandité nakupují zbranì od jednoho z místních obchodníkù.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Napøíklad takové lidi se snaíme najít, abychom zabránili jakémukoliv zlu ve mìstì.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Pokud by si se o tom chceš dozvìdìt víc, tak mi øekni.
	VATRAS_TOMARTIN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"V Khorinisu je dodavatel zbraní pro bandity. Vatras mì povìøil vyšetøováním.");
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin, proviantmistr paladinù, o dodavateli zbraní nìco ví. Najdu ho ve skladu paladinù v pøístavu.");
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Kruh Vody se zabıvá problémem s bandity v okolí mìsta Khorinis.");
};

func void dia_addon_vatras_tellme_otherkdw()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Kde jsou ostatní mágové Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Na severovıchodì zkoumají ruiny prastarého národa.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Domníváme se, e v ruinách je vchod na doposud neobjevenou èást ostrova.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Ostatní mágové Vody prozkoumávají ruiny starého národa na severovıchodì Khorinisu.  Je to asi vstup do doposud neobjevenıch èástí Khorinisu.");
	Info_AddChoice(dia_addon_vatras_tellme,"Øekni mi víc o té neprozkoumané èásti.",dia_addon_vatras_tellme_unexplored);
};

func void dia_addon_vatras_tellme_unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Øekni mi víc o té neprozkoumané èásti.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mohu napsat dopis a poslat tì s ním za Saturasem, máš-li zajem o pøipojení se k vıpravì.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Samozøejmì, e se na tom mùeš podílet jen jako jeden z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Jistì.
	b_logentry(TOPIC_ADDON_KDW,"Døíve ne se mohu pøipojit k mágské expedici, musím se podle Vatrase stát èlenem Kruhu Vody.");
};

func void dia_addon_vatras_tellme_wernoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kdo jsou èlenové Kruhu Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//To se dozvíš, a budeš jedním z nás.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Jsem si jist, e se s nìkım z nás setkáš.
};


instance DIA_ADDON_VATRAS_WANNABERANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_wannaberanger_condition;
	information = dia_addon_vatras_wannaberanger_info;
	description = "Chci se pøidat ke  Kruhu Vody!";
};


func int dia_addon_vatras_wannaberanger_condition()
{
	if(SC_KNOWSRANGER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chci se pøidat ke  Kruhu Vody!
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Ano? Dobøe, ji jsi splnil první poadavek.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O èem to mluvíš?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Nìkdo z nás ti vìøí. Jinak bys o nás vùbec nevìdìl.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale 'já' o tobì nic nevím ...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Co bys rád vìdìl?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//No, mohl bys mi prozradit, odkud pøicházíš a proè jsi vkroèil do mìsta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Nesu dùleitou zprávu veliteli paladinù.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co je to za zprávu?
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Objevili se tu draci...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Brzy se stanou hrozné vìci.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Zatímco tu spolu hovoøíme, sbírá se proti nám obrovská armáda, kterou vedou draci a která si chce podmanit celou zemi.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Pokud je to skuteènì pravda, pak by to mohlo narušit rovnováhu celé zemì. Kdo ti to øekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(pøemıšlivì) Draci? Myslíš ty tvory, o kterıch se vyprávìjí legendy? Jak jsi na to pøišel?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"No, nìkde jsem nìco zaslechl.",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Povìdìl mi to mág Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Brzy se stanou hrozné vìci.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(rozlícenì) Aha. A kdo ti to øekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Hrozné vìci, hmmm... a jak to víš?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"No, nìkde jsem nìco zaslechl.",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Povìdìl mi to mág Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Povìdìl mi to mág Xardas a také mi nakázal, abych varoval paladiny.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Vím, e tento mu je moudrı a mocnı mistr magickıch vìd. A odkud pøicházíš ty?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Nekromant... take ije... (pøemıšlivì) a poslal tì sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem pouhım dobrodruhem z jihu...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem bıvalı trestanec...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//No, nìkde jsem nìco zaslechl.
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(otrávenì) Pamatuješ si alespoò, odkud pøicházíš?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. A právì proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem dobrodruhem z dalekého jihu.",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem bıvalı trestanec...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void b_vatras_influence_repeat()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobøe, tak si to shròme:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jsi bıvalı trestanec,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jsi dobrodruhem z dalekého jihu,
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//kterého sem poslal nekromant Xardas,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//kterı se nìkde doslechl,
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//e naši zemi napadnou draci.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//e se v brzké dobì stanou hrozné vìci.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//A tak jsi to pøišel ohlásit paladinùm.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//To zní sice fantasticky, ale nezdá se mi, e bys mi lhal.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Proto musím uznat, e tvé pohnutky jsou ušlechtilé.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Máš šanci pøipojit se ke 'Kruhu Vody'.
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Myslím, e jsi mi neøekl úplnì všechno.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jestli se bojíš, e bych mohl tvá slova nìkomu vyzradit, pak nemìj strach.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Pøísahal jsem, e všechna tajemství, která mi nìkdo svìøí, si ponechám pro sebe.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co zdejší lidé?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Ti rozumí pouze polovinì toho, co jim KÁU, take nemìj obavy.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Zaènìme tedy znovu od zaèátku. Co je to za zprávu?
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Objevili se tu draci...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Brzy se stanou hrozné vìci.",dia_vatras_influence_first_lie);
	};
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Jsem bıvalı vìzeò z trestanecké kolonie v Khorinisu.
	VATRAS_THIRD = TRUE;
	b_vatras_influence_repeat();
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Jsem dobrodruhem z dalekého jihu.
	VATRAS_THIRD = FALSE;
	b_vatras_influence_repeat();
};


instance DIA_ADDON_VATRAS_HOWTOJOIN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_howtojoin_condition;
	information = dia_addon_vatras_howtojoin_info;
	description = "Co musím udìlat k pøijetí?";
};


func int dia_addon_vatras_howtojoin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_howtojoin_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co musím udìlat k pøijetí?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Musíš si uvìdomit, e vstupem mezi nás na sebe bereš velkou zodpovìdnost.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nepøijmám kde koho, jen protoe si o to øekne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Pokud chceš bıt jedním z nás, synu, chovej se tak, jako kdybys u byl jedním z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//Tím myslíš ... ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Kadı mladı mu musí splnit hlavní úkol, ne se mùe pøidat.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Pouze pak mohu uvaovat o tvém pøipojení k nám v našem úkolu udrování rovnováhy sil na tomto ostrovì.
	Info_ClearChoices(dia_addon_vatras_howtojoin);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Dobøe, jak tì mùu pøesvìdèit?",dia_addon_vatras_howtojoin_whatsgreat);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Osvobodil jsem mnoho lidí. Bariéra byla znièena.",dia_addon_vatras_howtojoin_freedmen);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Porazil jsem Spáèe. To by se dalo nazvat hlavní zkouška.",dia_addon_vatras_howtojoin_sleeper);
};

func void dia_addon_vatras_howtojoin_sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Porazil jsem Spáèe. To by se dalo nazvat hlavní zkouška.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Slyším poslední dobou mnoho povídaèek.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Vèetnì té o monstru zvaném Spáè a jeho odstranìním z tohoto svìta.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Neslyšel jsem o tom, e jsi za to zodpovìdnı jen ty - ale pøesto tvé oèi øíkají, e vìøíš v to, co øíkáš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Ponìkud mì to popuzuje, ale nejsem si jist, jestli mì mé smysly nezrazují.
};

func void dia_addon_vatras_howtojoin_freedmen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Osvobodil jsem mnoho lidí. Bariéra byla znièena.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Pokud za tím OPRAVDU stojíš ty...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Lidém, kterım jsi dal svobodu nejsou jen mágové Vody èi nevinní obèané.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Zloèinci z celé zemì jsou teï rozlezlí po celém ostrovì a ohroují obèany tohoto mìsta.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Také u kontrolují nìkteré èásti ostrova blízko mìsta. Je témìø nemoné opustit Khorinis beze úrazu.
};

func void dia_addon_vatras_howtojoin_whatsgreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//Dobøe, jak tì mùu pøesvìdèit?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Nìco podivného se tyto dny dìje v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Poèet zmizelıch lidí se zvyšuje kadım dnem.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Pokud zjistíš, co se s nimi stalo, pøijmeme tì rádi do Kruhu Vody.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras mì nepøíjme dokud ta záleitost s Kruhem Vody a mizejícími lidmi nebude vyøešena.");
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_RUNNING;
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Ale ...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Ano?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... mìl by sis nejdøíve promluvit s paladiny a øíci jim o zprávì, kterou jim neseš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Myslím, e to je neobyèejnì dùleité!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Promluv si s Lordem Hagenem.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras chce, abych paladinùm nejprve pøedal zprávu o dracích v Hornickém údolí.");
	Info_ClearChoices(dia_addon_vatras_howtojoin);
};


instance DIA_ADDON_VATRAS_GUILDBYPASS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypass_condition;
	information = dia_addon_vatras_guildbypass_info;
	description = "Ale oni mì nepustí!";
};


func int dia_addon_vatras_guildbypass_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypass_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale oni mì nepustí!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Pustí. Pokud jsi èlenem vlivné gildy.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kruh má pár uiteènıch kontaktù.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Pokusíme se zajistit, aby jsi mohl doruèit zprávu Lordu Hagenovi, co nejrychleji to bude moné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Mìl by ses zeptat pøítele Larese. Mohl by ti pomoci.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Ke vstupu k Lordu Hagenovi musím bıt èlenem nìjaké mocné khorinisské gildy.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Udìlám to.",dia_addon_vatras_guildbypass_back);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Ke které gildì bych se mìl pøidat?",dia_addon_vatras_guildbypass_whichguild);
};

func void dia_addon_vatras_guildbypass_back()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Udìlám to.
	VATRAS_GEHZULARES = TRUE;
	Info_ClearChoices(dia_addon_vatras_guildbypass);
};

func void dia_addon_vatras_guildbypass_whichguild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Ke které gildì bych se mìl pøidat?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jsou zde pouze tøi gildy, které jsou dostateènì vlivné a silné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//Domobrana, mágové Ohnì nebo oldáci na Onarovì farmì.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Je to tvá volba.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Myslím, e Lares ti mùe pomoci s tímto obtínım rozhodováním. Navrhuju, aby sis s ním promluvil.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Jsou zde tøi mocné gildy ke kterım se mùeš pøidat: mágové Ohnì, domobrana nebo oldáci na velkostatkáøovì dvoøe.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Udìlám to.",dia_addon_vatras_guildbypass_back);
};


instance DIA_ADDON_VATRAS_NOWRANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_nowranger_condition;
	information = dia_addon_vatras_nowranger_info;
	permanent = TRUE;
	description = "Jsem pøipraven pøidat se ke Kruhu!";
};


func int dia_addon_vatras_nowranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (SC_ISRANGER == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_nowranger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jsem pøipraven pøidat se ke Kruhu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Donesl jsi svou zprávu Lordu Hagenovi?
	if(KAPITEL >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, øekl mi, e mám jít do hornického údolí a pøinést dùkaz sıch tvrzní!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Musíš se rozhodnout, co dál.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doruèení zprávy bylo dùleité pro mì. Teï je na nìm, aby si pospíšil, nebo poèkal na tvùj dùkaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se tıèe tebe ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrá.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dokázal jsi, e mùeš bıt pro nás dùleitı. Mùeš bıt jedním z nás. Chodit po svìtì a šíøit Adanosovu vùli.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Tímto ti udìluji prsten Kruhu Vody. Pomùe ti najít spojence a starat se s nimi o rovnováhu svìta.
		CreateInvItems(self,itri_ranger_addon,1);
		b_giveinvitems(self,other,itri_ranger_addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Jsem velmi potìšen tím, e jsi prvním mágem Ohnì, kterı se k nám pøidal.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Nech tì Adanos ochraòuje. Nyní bì a setkej se svımi bratry.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Èekají tì v hostinci U mrtvé harpyje na pøijmací rituál.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Pøedpokladám, e ten hostince znáš. Procháziš kolem nìj po cestì na Onarùv statek.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nezapomeò si nasadit prsten, tak mohou bratøi poznat, e jsi jeden z nich.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Teï patøím ke Kruhu Vody a mám se setkat s naši partou v hospodì u Mrtvé Harpyje.");
		SC_ISRANGER = TRUE;
		LARES_CANBRINGSCTOPLACES = TRUE;
		MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
		b_giveplayerxp(XP_ADDON_SC_ISRANGER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Ještì ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Pak si pospìš. Tvá zpráva se zdá bıt velice dùleitou!
	};
};


instance DIA_ADDON_VATRAS_CLOSEMEETING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_closemeeting_condition;
	information = dia_addon_vatras_closemeeting_info;
	description = "Bratøi Kruhu mì poslali za tebou.";
};


func int dia_addon_vatras_closemeeting_condition()
{
	if(LARES_TAKEFIRSTMISSIONFROMVATRAS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_closemeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Bratøi Kruhu mì poslali za tebou.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Skvìle! U jsem na tebe èekal!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Pošlu tì skrze portál s ostatními mágy Vody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Pùjdeš po stopì rudobarona Ravena a vypátráš proè unáší obèany Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//A my se pokusíme postarat o hrozbu, kterou skıtají bandité.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Pøines tuto zprávu Saturasovi. Od této chvíle budeš získávat úkoly od nìj.
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares tì tam zavede v pøípadì, e ještì nepøinesl zpìt ornament.
	};
	CreateInvItems(self,itwr_vatras2saturas_findraven,1);
	b_giveinvitems(self,other,itwr_vatras2saturas_findraven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Nech Adanos vede tvou cestu.
	b_logentry(TOPIC_ADDON_KDW,"Vatras mì poslal s dopisem za Saturasem. Mìl bych teï jít s ostatními mágy Vody skrze portál a chytit bıvalého rudobarona Ravena.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKLAVEN,"Mám zjistit proè Raven unáší obèany Khorinisu.");
	RANGERMEETINGRUNNING = LOG_SUCCESS;
	b_schlussmitrangermeeting();
	b_giveplayerxp(XP_AMBIENT);
};



var int missingpeopleinfo[20];

instance DIA_ADDON_VATRAS_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_missingpeople_condition;
	information = dia_addon_vatras_missingpeople_info;
	permanent = TRUE;
	description = "O zmizelıch lidech ...";
};


func int dia_addon_vatras_missingpeople_condition()
{
	if(MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int dia_addon_vatras_missingpeople_wo_noperm;

func void dia_addon_vatras_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//O zmizelıch lidech ...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Ano?
	Info_ClearChoices(dia_addon_vatras_missingpeople);
	Info_AddChoice(dia_addon_vatras_missingpeople,DIALOG_BACK,dia_addon_vatras_missingpeople_back);
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Vím kde jsou.",dia_addon_vatras_missingpeople_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Povím ti, co jsem doposud vypátral ...",dia_addon_vatras_missingpeople_report);
	};
	if(DIA_ADDON_VATRAS_MISSINGPEOPLE_WO_NOPERM == FALSE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Kde bych mìl zaèít hledat stopy?",dia_addon_vatras_missingpeople_wo);
	};
};

func void dia_addon_vatras_missingpeople_back()
{
	Info_ClearChoices(dia_addon_vatras_missingpeople);
};

func void dia_addon_vatras_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Kde bych mìl zaèít hledat stopy?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Vìtšina zmizela v pøístavu. To zní jako dobré místo pro zaèátek.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Nejvíce lidí zmizelo v khorinisském pøístavu. Mìl bych zaèít hledat tam.");
	dia_addon_vatras_missingpeople_wo_noperm = TRUE;
};

func void dia_addon_vatras_missingpeople_report()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	vatras_missingpeoplereports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Povím ti, co jsem doposud našel ...
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Farmáøi také postrádají nìkolik lidí.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Taky jsem se doslechl, e jsou za to odpovìdní bandité.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, uèeò mistra Thorbena, mi øekl, e bandité odváejí zajaté lidi na moøe.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Vypadá to, e s tím mají nìco spoleèného také piráti. Ale nejsem si jejich rolí v tom všem pøíliš jistı.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Osvobodil jsem Elvricha ze zajetí banditù.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Dívka jménem Lucia byla taky unesena bandity.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Unesená Lucia se vzápìtí s bandity spolèila.
		if(MIS_LUCIASLETTER == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Vypadá to, e to udìlala z vlastního pøesvìdèení.
		};
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Dexter je vùdcem banditù. Je odpovìdnı za ty únosy.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamatuju si Dextera z kolonie. Pracoval tenkrát pro rudobarona Gomeze.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//A on si urèitì bude pamatovat tebe. Mìl by sis dát pozor.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(vatras_missingpeoplereports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Myslím, e jsi na dobré cestì. Dr se ji.
		xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
		b_giveplayerxp(xp_vatras_missingpeoplereports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Co jsi zjistil?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Bohuel, zatím nic smìrodatného.
	};
};

func void dia_addon_vatras_missingpeople_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Vím, kde jsou zmizelí lidé.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Byli uneseni a vzati na vzdálené místo na ostrovì chlápkem jménem Raven.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//A proè jsi si tím tak jistı?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Èetl jsem jeho rozkazy. Banditi všude okolo pracují pro nìj.
	if(Npc_HasItems(other,itwr_ravenskidnappermission_addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Tady.
		b_usefakescroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dobøe. Dobrá práce. U jsem se bál, e nikdy nezjistíme pravdu.
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_VATRAS_WHEREAREMISSINGPEOPLE);
};


instance DIA_ADDON_VATRAS_FREE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_free_condition;
	information = dia_addon_vatras_free_info;
	permanent = FALSE;
	description = "Ztracení lidé se vrátili.";
};


func int dia_addon_vatras_free_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_free_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Ztracení lidé se vrátili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Ano, dokázal jsi to. Nakonec to dobøe dopadlo.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Avšak, tvá cesta ještì nekonèí. Nech ti Adanos poehná.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(modlí se) Adanosi, poehnej tomuto mui. Osvi jeho pou, dej mu sílu obstát všem nebezpeèím.
	b_raiseattribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_ADDON_VATRAS_WAFFEN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_waffen_condition;
	information = dia_addon_vatras_waffen_info;
	permanent = TRUE;
	description = "O dodavateli zbraní.....";
};


func int dia_addon_vatras_waffen_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_waffen_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//O dodavateli zbraní.....
	Info_ClearChoices(dia_addon_vatras_waffen);
	Info_AddChoice(dia_addon_vatras_waffen,DIALOG_BACK,dia_addon_vatras_waffen_back);
	if((FERNANDO_IMKNAST == TRUE) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Znám toho dodavatele zbraní pro bandity!",dia_addon_vatras_waffen_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Co víš o tom prodejci zbraní?",dia_addon_vatras_waffen_tomartin);
	};
};

func void dia_addon_vatras_waffen_back()
{
	Info_ClearChoices(dia_addon_vatras_waffen);
};

func void dia_addon_vatras_waffen_tomartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co víš o tom prodejci zbraní?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Promluv si s Martinem, proviantmistrem paladinù. Mùe mít nìjaké informace.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Obdrel úkol odhalit toho dodavatele.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Martina najdeš v pøístavu. Pokud pobìíš podel tìch beden, zásob a paladinù, mìl bys ho najít.
	VATRAS_TOMARTIN = TRUE;
};

func void dia_addon_vatras_waffen_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Znám obchodníka, kterı dodává zbranì banditùm!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Jmenuje se Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Velmi dobøe. Postaral se Martin o to, aby u Fernando nikdy nemohl prodávat zbranì?
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Jo. Martin se postaral, aby moc brzo neopustil kobky aláøe.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Skvìlá práce, synu.
		if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger) && (SC_ISRANGER == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(smìle) Znamená to, e jsem nyní pøipraven vstoupit do Kruhu Vody?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(usmìv) To nebylo pøesné znìní naši dohody - a ty to moc dobøe víš.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Nech Adanos osvítí tvou cestu.
		MIS_VATRAS_FINDTHEBANDITTRADER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_VATRAS_FINDTHEBANDITTRADER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Ještì ne.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Tak pospìš a zprav ho o tom! Toto musí bıt okamitì zastaveno.
	};
};


instance DIA_ADDON_VATRAS_WISP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Je nìco, co by mi mohlo pomoct s hledáním?";
};


func int dia_addon_vatras_wisp_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER != 0)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Je nìco, co by mi mohlo pomoct s hledáním?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Dost na tom trváš mladı mui. Nicménì, mùe tu bıt nìco, co moná tvùj úkol trochu zlehèí.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Dám ti tento amulet z rudy. Budeš ho urèitì potøebovat.
	CreateInvItems(self,itam_addon_wispdetector,1);
	b_giveinvitems(self,other,itam_addon_wispdetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Je to amulet bludièky.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Takovıch je velmi málo. Bludièka v tomto amuletu má zvláštní schopnosti.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Pomáhá to zviditelnit vìci, které pouhım okem nespatøíme.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Funguje to, kdy si to nasadíš.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Jestlie bludièka zmizí, jednoduše si amulet nasaï znovu.
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Vatras mi dal 'Amulet Hledající bludièky'. Mìl by mi pomoci v hledání dodavatele zbraní.");
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Bludièka umí najít zbranì.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Tahle vìc se hodí na to patrání po dodavateli zbraní pro bandity.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Zacházej s tím dobøe a mùeš se na to vdy spolehnout.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Díky! Budu si to pamatovat.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"Je to vše co ta bludièka umí?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"V tom amuletu je bludièka?",dia_addon_vatras_wisp_amulett);
	SC_GOTWISP = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Díky! Budu si to pamatovat.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//Je to vše, co ta bludièka umí?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//Víc ne hledaní zbraní? Jen pokud ji nauèíš novım dovednostem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Pokud vím, má o tìchto vìcech velmi dobré znalosti Riordian. Momentálnì je ovšem se Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//To je vše, co mùu øíct.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Bludièka umí víc ne jen hledat zbranì. Riordian, mág Vody, mùe uèit mou bludièku hledat další vìci.");
	};
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//V tom amuletu je bludièka?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Bludièky jsou zajímavá stvoøení. Skládají se z èisté magické energie.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Jsou vázány k magické rudì tohoto svìta. Je to pøirozenı zdroj jejich síly.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nepøekvapuje mì, e jsi o nich pøed tím neslyšel. Ukazují se pouze tìm, co u sebe mají odpovídající mnoství rudy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Divoké bludièky byly násilnì odstranìny z jejich pøirozeného zdroje a tak útoèí na kadé stvoøení, které se pøiblíí.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Tìmto nebohım stvoøením ji není pomoci.  Mìl by ses pokusit se jim vyhıbat.
};


instance DIA_ADDON_VATRAS_STONEPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_stoneplate_condition;
	information = dia_addon_vatras_stoneplate_info;
	description = "Našel jsem tuhle kamennou desku...";
};


func int dia_addon_vatras_stoneplate_condition()
{
	if((c_schasmagicstoneplate() == TRUE) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Našel jsem tuhle kamennou desku. Mùeš mi o ni nìco øíct?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Je to artefakt starobylé kultury, po které pátráme právì teï.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jsou jich rùzné druhy. Nìkteré obsahují informace o historii národa.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//A to jsou ty, jen mì zajímají. Pøines všechny, které najdeš ke mnì.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Budeš odmìnìn.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_VATRASTRADE);
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_VATRASTRADE);
};


instance DIA_ADDON_VATRAS_SELLSTONPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_sellstonplate_condition;
	information = dia_addon_vatras_sellstonplate_info;
	permanent = TRUE;
	description = "Mám pro tebe další kamenné desky ...";
};


func int dia_addon_vatras_sellstonplate_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_stoneplate) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_sellstonplate_info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,itwr_stoneplatecommon_addon);
	if(anzahl == 1)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Mám pro tebe další kamenné desky ...
	}
	else
	{
	};
	b_giveinvitems(other,self,itwr_stoneplatecommon_addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Vıbornì!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zvıším tvou magickou sílu!
		b_raiseattribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Tady, vem si za odmìnu nìjaké svitky ...
		b_giveinvitems(self,other,itsc_instantfireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Tady, vem si za odmìnu nìjaké lektvary ...
		b_giveinvitems(self,other,itpo_health_03,anzahl + 1);
	};
	b_giveplayerxp(XP_ADDON_VATRASSTONPLATE * anzahl);
};


var int vatras_senttodaron;

instance DIA_ADDON_VATRAS_GUILDHELP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_guildhelp_condition;
	information = dia_addon_vatras_guildhelp_info;
	description = "Lares øíkal, e mi mùeš pomoci dostat se do kláštera mágù Ohnì.";
};


func int dia_addon_vatras_guildhelp_condition()
{
	if(RANGERHELP_GILDEKDF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares øíkal, e mi mùeš pomoct dostat se do kláštera mágù Ohnì.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//To je tá volba? Cesta Ohnì?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Jo, hodlám se stát mágem Ohnì.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Pokud si dobøe pamatuji, nepøestali pøíjmát novice. Proè chceš tedy mou pomoc?
	if(SC_KNOWSKLOSTERTRIBUT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Novic pøed klášterem po mnì chce daò. Ovci a zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares se zmínil o dani na zaplacení ke vstupu do kláštera.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//No, nemohu ti pøímo pomoci, protoe jsem mágem Vody, jak víš. Ale znám velmi dobøe mága Ohnì Darona.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Je obvykle blízko trištì a vybírá dary.
	VATRAS_SENTTODARON = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//Aèkoliv to není jediná vìc, o kterou se tady stará.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Jednou mi øíkal o sošce, kterou mu ukradli.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Je to pro nìj velmi dùleité. Jsem si jist, e ti pomùe, pokud získáš jeho sošku zpìt.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Samozøejmì, tvé pøijetí k mágùm Ohnì neznamená, e se nemùeš pøipojit ke Kruhu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Pokud si to prokazatelnì zaslouíš.
	MIS_ADDON_VATRAS_GO2DARON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Mág Ohnì Daron na trišti potøebuje pomoci s malou vzácnou soškou. Mùe mi pomoci dostat se rychle do kláštera.");
};


instance DIA_VATRAS_MORE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 998;
	condition = dia_vatras_more_condition;
	information = dia_vatras_more_info;
	permanent = TRUE;
	description = "(Více)";
};


func int dia_vatras_more_condition()
{
	if(VATRAS_MORE == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_more_info()
{
	VATRAS_MORE = TRUE;
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 92;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Dej mi prosím své poehnání.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Dej mi prosím své poehnání.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//A proè bych ti mìl poehnat, cizinèe?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chci se stát uèedníkem u jednoho z mistrù v dolní èásti mìsta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Jdi s Adanovım poehnáním, synu!
	Snd_Play("LevelUp");
	b_giveplayerxp(XP_VATRASTRUTH);
	VATRAS_SEGEN = TRUE;
	b_logentry(TOPIC_THORBEN,"Mág vody Vatras mi poehnal.");
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 93;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Kde bych našel Innosova knìze?";
};


func int dia_vatras_wokdf_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (VATRAS_SEGEN == TRUE) && (VATRAS_SENTTODARON == FALSE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Kde bych našel Innosova knìze?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Nejlépe bude, kdy se rozhlédneš po trišti. Tam na nìkoho z kláštera jistì narazíš.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 94;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Rád bych Adanovi poskytl dar!";
};


func int dia_vatras_spende_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Rád bych Adanovi poskytl dar!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Darem Adanovu chrámu smyješ èást høíchù, které jsi moná spáchal, synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Kolik mùeš vìnovat?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Zrovna teï nemám penìz nazbyt...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"Mám u sebe 50 zlaákù...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"Mám u sebe 100 zlaákù...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Zrovna teï nemám penìz nazbyt.
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//To nevadí, své dobré úmysly mùeš vyjádøit pozdìji, synu.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mám u sebe 50 zlaákù.
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dìkuji ti ve jménu Adana, synu. Tvé zlato bude rozdìleno mezi potøebné.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mám u sebe 100 zlaákù.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Za tento šlechetnı èin ti ve jménu Adana ehnám!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Nech ti Adanos na tvé cestì poehná!
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Mág vody Vatras mi poehnal.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 95;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Mùeš mì nauèit nìco o magii?";
};


func int dia_vatras_canteach_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mùeš mì nauèit nìco o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Pouze vyvolenım Innose nebo Adana je dovoleno pouívat runovou magii.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale obyèejní smrtelníci mohou pouívat magii za pomoci kouzelnıch svitkù.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mohu ti ukázat, jak lze získat a rozšiøovat magické schopnosti.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Mág vody Vatras mi pomùe zvıšit magickou moc.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Chtìl bych posílit svoji magickou moc.";
};


func int dia_vatras_teach_condition()
{
	if((VATRAS_TEACHMANA == TRUE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chtìl bych posílit svoji magickou moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Tvá magická moc pøesáhla mé schopnosti.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "Øekni mi nìco o bozích.";
};


func int dia_vatras_gods_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Øekni mi nìco o bozích.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Co pøesnì bys chtìl vìdìt?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Øekni mi nìco o Innosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Velmi dobøe. (káe) Innos je prvním a nejvyšším bohem. Stvoøil slunce a svìt.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Ovládá svìtlo a oheò, své dary lidstvu. Je ztìlesnìním øádu a spravedlnosti.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jeho knìí jsou ohniví mágové, paladinové jsou jeho váleèníky.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Øekni mi nìco o Adanovi.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos je bùh støedu. Vymezuje právo a je strácem rovnováhy mezi Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Ovládá sílu pøemìn, jeho darem je voda všech oceánù, jezer a øek.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jeho knìí jsou vodní mágové, stejnì jako já jsem sluebníkem a knìzem Adanovım.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Øekni mi nìco o Beliarovi.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar je temnı bùh smrti, zkázy a všech nepøirozenıch vìcí.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Vede vìènou válku s Innosem, ale Adanos bdí nad tím, aby byly jejich síly stále vyrovnané.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Pouze nìkolik málo lidí následuje volání Beliara - nicménì on tìm, kdo tak èiní, zajistí velkou moc.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Øekni mi nìco o Beliarovi.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "Mùeš mì vyléèit?";
};


func int dia_vatras_heal_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Mùeš mì vyléèit?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbonì) Adane poehnej tomuto tìlu. Zbav ho jeho zranìní a posil ho novım ivotem.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Právì teï nepotøebuješ ádné magické léèení.
	};
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mám zprávu pro mistra Isgarotha. Støeí svatyni pøed klášterem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Kdy mu ji doruèíš, získáš odmìnu podle vlastního vıbìru.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Najdi si jinıho poslíèka, starochu!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Udìlám to.",dia_vatras_mission_yes);
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobøe. Tak teï pokraèuj ve své cestì k mistru Isgarothovi.
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Udìlám to.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Dobrá, tak si vezmi tu zprávu a vyber si jeden z tìchto kouzelnıch svitkù.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//A doruèíš tu zprávu, èeká tì náleitá odmìna.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras mi pøedal zprávu pro mistra Isgarota, kterého najdu ve svatyni naproti klášteru.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Vezmu si kouzlo Svìtla.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Vybral jsem si léèivı svitek.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Dej mi Ledovı šíp.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Teï ne!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//ádnı problém. Pošlu nìkoho jiného.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Vybral jsem si léèivı svitek.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Dej mi Ledovı šíp.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Vezmu si kouzlo Svìtla.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Doruèil jsem tvou zprávu.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Doruèil jsem tvou zprávu.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Pøijmi mé díky. A teï si vezmi svou odmìnu.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 královskı šovík",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Prsten obratnosti.",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 hrudka rudy",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Slyšte, lidé! Je mì potøeba nìkde jinde.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Nebude to mít dlouhého trvání. A se vrátím, dopovím vám zbytek pøíbìhu.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nevím, jestli se ještì vrátím. Pokud chcete znát konec, pøeètìte si ten pøíbìh v Písmu.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Adanos s vámi!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_ADDON_VATRAS_ABLOESEPRE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_abloesepre_condition;
	information = dia_addon_vatras_abloesepre_info;
	description = "Mám problém s Innosovım Okem.";
};


func int dia_addon_vatras_abloesepre_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_abloesepre_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//Mám problém s Innosovım okem. Potøebuju tvoji podporu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//Budu kvùli tomu muset opustit mìsto?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//To nevím. Moná.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Èekám na svou náhradu u pár dní. Ostatní mágové Vody by se u mìli vrátit.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Ujisti se, e pošlou náhradníka a já ti pomohu.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Vatras mi nemùe pomoci s problémem 'Innosova Oka' dokud ve mìstì nebude jinı mág Vody, kterı ho zastoupí.");
};


instance DIA_ADDON_VATRAS_ADDONSOLVED(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_addonsolved_condition;
	information = dia_addon_vatras_addonsolved_info;
	description = "Náhrada dorazila.";
};


func int dia_addon_vatras_addonsolved_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_addonsolved_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Náhrada dorazila.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Je vše v poøádku za severo-vıchodními horami?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Ano. Raven je mrtvı a u nepøedstavuje ádnou hrozbu.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To je vskutku dobrá zpráva. Doufejme, e podobné vìci se u nikdy nestanou.
	if(Npc_KnowsInfo(other,dia_addon_vatras_abloesepre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//TEÏ ti mohu pomoci s tvım malım problémem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Pokud si dobøe pamatuji, tıkalo se to Innosova Oka e?
	};
	VATRASCANLEAVETOWN_KAP3 = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "Innosovo oko je rozbité.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Posílá mì Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Posílá mì Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Innosovo oko je rozbité.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Já vím. Slyšel jsem o tom od nìjakıch velmi rozrušenıch novicù.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Pátraèi zneuili Kruh slunce mágù Ohnì ke znièení Oka.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Øekl bych, e jsou ovládáni nepøítelem.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Po tomhle mìstì se novinky šíøí rychle.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Proè si Pyrokar ze všech lidí vybral právì tebe?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co se stane s Okem teï?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co se stane s Okem teï?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musíme ho znovu spravit. Ale bojím se, e to nebude jen tak.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Objímka se rozbila na dva kusy. Zruènı kováø by si s tím mìl umìt poradit.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale tohle není ten problém. Co mi dìlá starosti, je samotnı drahokam.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Je matnı a bez moci. Zdá se, e nepøítel pøesnì vìdìl, jak ho oslabit.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kde bych našel kováøe, kterı by to dokázal opravit?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Jak mùe drahokam získat zpìt svoji sílu?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Jak mùe drahokam získat zpìt svoji sílu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Vidím jen jedinou cestu. Spojení tøí vládnoucích bohù by mohlo zajistit potøebnı efekt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Dobøe pøipravenı rituál zvratu provedenı na místì znièení vrátí drahokamu jeho sílu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Nicménì, problém je, e na to místo musíš dostat pozemské zástupce kadého ze tøí bohù.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Navíc je potøeba mnoho trávy z bain. Odhaduju, e to budou nejménì tøi stébla.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kdo by mìli bıt ti tøi pozemští zástupci bohù?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kde najdu tu trávu z bain?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Kde najdu tu trávu z bain?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Slyšel jsem o staré mastièkáøce v lesích, co si øíká Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ale taky bys mohl zkusit štìstí dole v pøístavu.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kdo by mìli bıt ti tøi pozemští zástupci bohù?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adana bych mìl zastupovat já sám.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, nejvyšší ohnivı mág, bude ten pravı pøedstavitel boha Innose.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale pro Beliara nevím, koho vybrat. Musí to bıt nìkdo, kdo ovládá èernou magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Èernou magii? Co Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Èernou magii? Co Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//To je ono. To by mohlo fungovat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Ale ptám se sám sebe, jak ty tøi dostat k sobì.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Dokáu si pøedstavit, jak se Pyrokar bude tváøit, a se dozví, e musí spolupracovat s Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"U musím jít.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Kde najdu kováøe schopného opravit objímku Oka?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Poptej se tady po okolí po nìkom, kdo umí opravit šperk.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Proè si Pyrokar ze všech lidí vybral právì tebe?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Mìl jsem podezøení, e se døíve èi pozdìji nìco podobného pøihodí.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar se vdycky povaoval za tak nezranitelného a mocného, e to skoro hranièilo s nerozváností.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Proto byla jeho opatøení na ochranu Oka také tak... ehm, lajdácká.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Prostì si myslím, e mimovolnì spoléhal na schopnosti, je mi Adanos propùjèil.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Radìji ani nemyslím na to, co by se mohlo stát, kdybych teï nebyl k dispozici.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Po tomhle mìstì se novinky šíøí rychle.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Taky dobøe. Nepøítel se stejnì bude mít na pozoru.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//U musím jít.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Musím vyrazit a pøipravit v Kruhu slunce ten rituál.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Pošli tam Xardase a Pyrokara. A nezapomeò pøinést trávu z bain. Spoléhám na tebe.
	b_logentry(TOPIC_INNOSEYE,"Podle Vatrase mohu Oku navrátit moc pouze tak, e vykonám rituál v kruhu Slunce. Musím ovšem pøimìt Xardase a Pyrokara, aby se ho také zúèastnili, a zároveò najít kováøe, kterı dokáe rozbitı amulet opravit.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "Jak se to má s Innosovım okem?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Jak se to má s Innosovım okem?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Pamatuj: jedinì rituál zvratu v Kruhu slunce spoleènì s Xardasem a Pyrokarem mùe Oku navrátit sílu.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//A nezapomeò pøinést Oko s opravenou objímkou.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Udìlal jsem vše, co jsi øekl. Tady je opravené Oko.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Udìlal jsem vše, co jsi øekl. Tady je opravené Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Teï u nic nebrání provedení rituálu.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co tráva z bain?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Á, ano. Tak máš ty tøi rostlinky?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ahem. Ano. Tady jsou ty tøi rostlinky.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Vıbornì.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Ne. Bohuel ne.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Dobrá. Tak to budeme muset udìlat bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Udìlals to dobøe, ale teï se postav kousek stranou, a mùeme zaèít s rituálem. Nech se naše duše spojí.
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Hotovo. Podaøilo se nám pøekazit nepøíteli plány a opravit Oko.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//A ti Pyrokar vysvìtlí, jak pouívat jeho sílu.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Doufám, e se ještì uvidíme, a dokonèíš svou misi. Sbohem.
	b_logentry(TOPIC_INNOSEYE,"Oko je ji v poøádku. Pyrokar mi je vydá a pak pùjdu lovit draky.");
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "Díky za pomoc pøi obnovení síly Innosova oka.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Díky za pomoc pøi obnovení síly Innosova oka.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Neplıtvej tak svımi díky. Tvùj nejvìtší úkol na tebe ještì èeká.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Promluv si s Pyrokarem, vysvìtlí ti všechno ostatní.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Doufám, e tì ještì uvidím ivého a zdravého, mùj synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "Lobartovì enì Hildì je špatnì.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobartovì enì Hildì je špatnì.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? U zase? Ta dobrá ena by na sebe mìla dávat vìtší pozor.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jedna tuhá zima a u tu s námi nebude. Dobrá, dám ti pro ni medicínu, co potlaèí horeèku.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//A víš, kdy u jsi v tom, mìl bys na sebe taky dávat pozor.
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "Mám podivné pocity úzkosti.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Mám podivné pocity úzkosti.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Taky nevypadáš moc dobøe. Byl jsi vystaven èernému pohledu Pátraèù pøíliš dlouhou dobu.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Všechno, co svedu léèit, je tvoje tìlo, ale jedinì v klášteøe mohou oèistit tvou duši. Promluv si s Pyrokarem. Pomùe ti.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Ti draci u ádnou spouš nezpùsobí.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Ti draci u ádnou spouš nezpùsobí.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Vìdìl jsem, e se vrátíš ivı a zdravı. Nicménì, ještì poøád máš tu nejvìtší pøekáku pøed sebou.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Já vím.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Tak se poøádnì pøiprav a pøijï za mnou, kdykoli budeš nìco potøebovat. Také poøád u sebe nos Innosovo oko, slyšíš? Nech ti Adanos ehná.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Vím, kde jsou naši nepøátelé.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Vím, kde jsou naši nepøátelé.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Tak to u nesmíme ztrácet èas. Musíme je vyhledat døív, ne si pro nás pøijdou.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chceš se ke mnì pøidat?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Dlouho jsem o tom pøemıšlel a nikdy jsem si nebyl nièím tak jistı, pøíteli.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras mi pøekvapivì nabídl, e mì na cestì doprovodí. Mu s jeho dovednostmi a zkušenostmi pro mì bude jistì velmi cennı.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//U mám skupinu plnou. Obávám se, e pro tebe nezbylo místo.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Tak ho nìjak udìlej. Potøebuješ mì.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Ještì o tom popøemıšlím.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Povauju za velkou poctu mít tì po svém boku.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Povauju za velkou poctu mít tì po svém boku. Uvidíme se v pøístavu.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//A ti to netrvá moc dlouho. Nepøítel nikdy nespí, pøíteli.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Ještì o tom popøemıšlím.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak je libo. Vra se, jestli si to rozmyslíš.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "Radìji bys mìl zùstat tady. Mìsto tì potøebuje.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Radìji bys mìl zùstat tady. Mìsto tì potøebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Moná máš pravdu. Ale stejnì se k tobì pøidám, jestli máš zájem. To snad víš.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Pojeï se mnou na nepøátelskı ostrov.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Pojeï se mnou na nepøátelskı ostrov.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Moudré rozhodnutí. Doufám, e se toho budeš dret.
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_condition;
	information = dia_addon_vatras_pissoffforevver_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_condition()
{
	if((VATRASPISSEDOFFFOREVER == TRUE) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissoffforevver_info()
{
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
};

