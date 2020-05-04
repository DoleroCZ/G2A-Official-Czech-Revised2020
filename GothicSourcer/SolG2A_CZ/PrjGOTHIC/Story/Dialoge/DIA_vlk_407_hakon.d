
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Ztra se, ty kriminálníku! Canthar mi øekl, jakej mizernej bastard seš!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jsem Hakon, prodavaè zbraní.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//V tyhle dny by mìl mít každý muž u sebe zbraò. Zvláš, když se vydá za hradby.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Hakon prodává na tržišti zbranì.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Ukaž mi své zboží.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Je pro mì velkou ctí, když se o mé zboží zajímá pøedstavitel svaté církve.
	};
};


instance DIA_ADDON_HAKON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_addon_hakon_missingpeople_condition;
	information = dia_addon_hakon_missingpeople_info;
	description = "Nevíš náhodou nìco o ztracených obyvatelích Khorinisu?";
};


func int dia_addon_hakon_missingpeople_condition()
{
	if(SC_HEAREDABOUTMISSINGPEOPLE == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hakon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Nevíš náhodou nìco o ztracených obyvatelích Khorinisu?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Vidìl jsem mnoho lidí procházet východní branou.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Nìkteré z nich jsem v životì nevidìl. A mnoho z nich se nikdy nevrátilo.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Ale, nìco opravdu divného se asi dìje.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//Tamhle byl nìjaký týpek. Myslím, že se jmenoval Joe. Poøád se vychloubal, že bude brzy pracháè.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Vyzvídal, jak se má dostat do jedné z mìstských vìží, kam si domobrana ukládá zbranì.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Potom jsem ho už nikdy nevidìl. Chodil jsem okolo nìj každý den, dokud se neztratil.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Byl jsem udiven, když ho domobrana zatkla a ptala se nás na nìj.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nevìdìl, o èem jsem mluvil a nechtìl o tom chlápkovi už slyšet.
	Log_CreateTopic(TOPIC_ADDON_JOE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_JOE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_JOE,"Hakon, obchodník v Khorinisu, vídal chlápka jménem Joe, než se ztratil. Joe se chtìl dostat do jedné z mìstských vìží, kde si domobrana skladovala zbranì.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "Øekni mi nìco o okolí mìsta.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Øekni mi nìco o okolí mìsta.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Je to tam èím dál nebezpeènìjší.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Jednak kvùli banditùm, a taky kvùli divoké zvìøi.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Vypadá to, jako by ani zvíøata v tìchhle zatracených èasech nemìla èím zahnat hlad.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Odvažují se k mìstu stále blíž.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "Víš nìco o paladinech?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Víš nìco o paladinech?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ano! Ti chlapi mi maøí moje obchody!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//Všechno, co si pøi nejlepší vùli mùžeš v tomhle mìstì koupit, je krátký meè.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Seberou všechno, co je delší než stopu a pùl.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(jízlivì) A na oplátku se teï mùžu v hotelu válet zdarma - ha!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Odkud bereš své zbranì?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Odkud bereš své zbranì?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Odnikud! Až doteï byl mým dodavatelem Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Až doteï byl mým dodavatelem kováø Harad.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Nedìlá teï na nièem jiném než na zakázce pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje pro ty chlápky dnem i nocí jako magor bez nároku na odmìnu. Má dojem, že to jeho povinnost.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Všechno, co ti mùžu nabídnout, jsou zbytky mých zásob.
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Harad mi øekl o útoku banditù.";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad mi øekl o útoku banditù.
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Hm? A?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Dá mi souhlas pro pøijetí do uèení, když se vypoøádám s tìmi bandity.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(smích) Starý dobrý Harad. To asi bude zpùsob, jakým se mi chtìl omluvit za to, že pro mì nemùže dìlat žádné zbranì.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "Co víš o banditech?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co o nich vím? Cestou do mìsta mì oloupili!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//A nejsem jediný. To se jen tak nezmìní.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Domobrana se je snaží vyslídit, ale nìjak se to nedaøí.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Hakona, obchodníka se zbranìmi, okradli za mìstem bandité.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "Mùžu se o to postarat.";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Mùžu se o to postarat.
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY se chceš pustit do banditù? To jako ty sám? Ty jsi asi dost dobrý bojovník, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Jak moc ti na tom záleží?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(potutelnì) Chceš se dostat k Haradovým biblím, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nemyslím, že bych ti za to mìl platit.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Je to pìknì nebezpeèné.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No, mnì to nevadí. Jestli ty bandity pøemùžeš, dám ti 100 zlaákù.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Nemáš ponìtí, kdo z domobrany se pátrání úèastnil?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Nemáš ponìtí, kdo z domobrany se pátrání úèastnil?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Jo, ten chlapík se jmenoval Pablo. Spolu s pár ostatními po banditech pátrali, ale nikoho nenašli.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//A nevíš, kde bych toho Pabla našel?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Je na stráži ve mìstì. Buï ho potkáš v chrámové ulièce, nebo v dolní ètvrti.
	b_logentry(TOPIC_HAKONBANDITEN,"Neúspìšného pátrání po banditech se úèastnil i Pablo, pøíslušník mìstské gardy.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Kde tì pøepadli?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Kde tì pøepadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//U Akilova statku. Když odsud vyjdeš mìstskou branou a pak se dáš cestou doprava, nemùžeš to minout.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Za chvíli narazíš na pár schodù - a právì odtamtud se na mì ti bastardi vyøítili. Vsadím se, že nìkde v tìch lesích mají doupì.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "Už jsem ty bandity vyøídil.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Už jsem ty bandity vyøídil.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Opravdu? To by mohl øíct každý. Máš nìjaký dùkaz?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(povzdech) To se tam mám vrátit a usekat jim hlavy, nebo co?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(rychle) Ne - to snad ani nebude nutné. Vìøím ti.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Prokázal jsi mìstským obchodníkùm nesmírnou službu.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Harad bude spokojený - aspoò myslím.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//A tady máš slíbenou odmìnu.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Kde jsi sehnal ty dùlní akcie, které prodáváš?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Kde jsi sehnal ty dùlní akcie, které prodáváš?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Je mi líto, ale to ti nemùžu prozradit. Je to moc nebezpeèné.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//Už zase TY!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad koneènì skonèil s tou zatrachtilou misí pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//To znaèí, že ti teï mùžu nabídnout nové zbranì. Máš zájem?
};

