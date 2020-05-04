
instance DIA_HALVOR_EXIT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 999;
	condition = dia_halvor_exit_condition;
	information = dia_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_halvor_exit_condition()
{
	return TRUE;
};

func void dia_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HALVOR_PICKPOCKET(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 900;
	condition = dia_halvor_pickpocket_condition;
	information = dia_halvor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_halvor_pickpocket_condition()
{
	return c_beklauen(78,150);
};

func void dia_halvor_pickpocket_info()
{
	Info_ClearChoices(dia_halvor_pickpocket);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_BACK,dia_halvor_pickpocket_back);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_PICKPOCKET,dia_halvor_pickpocket_doit);
};

func void dia_halvor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_halvor_pickpocket);
};

func void dia_halvor_pickpocket_back()
{
	Info_ClearChoices(dia_halvor_pickpocket);
};


instance DIA_HALVOR_HALLO(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hallo_condition;
	information = dia_halvor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void dia_halvor_hallo_info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, nepotøebuješ nìjaké ryby? Vyber si tady, èerstvé, pøímo z moøských hlubin!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Halvor prodává v pøístavu ryby.");
};


instance DIA_HALVOR_TRADE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_trade_condition;
	information = dia_halvor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své ryby.";
};


func int dia_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_halvor_hallo) && Wld_IsTime(5,0,20,0) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Ukaž mi své ryby.
};


instance DIA_HALVOR_NIGHT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_night_condition;
	information = dia_halvor_night_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_halvor_night_condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,zs_talk) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_night_info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, jestli máš zájem o mé ryby, pøijï do mého stánku zítra, dobrá?
};


instance DIA_ADDON_HALVOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 5;
	condition = dia_addon_halvor_missingpeople_condition;
	information = dia_addon_halvor_missingpeople_info;
	description = "Øekl bys mi nìco o ztracených lidech, tedy pokud o tom nìco víš?";
};


func int dia_addon_halvor_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_halvor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Øekl bys mi nìco o ztracených lidech, tedy pokud o tom nìco víš?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Ztracení lidé? Chlape, tohle je pøístavištì. Jak asi víš, nìkdo se tu obèas ztratí.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Moøe se s nikým nepatlá. Je to tak, buï je nìjakej ten útes nebo moøská obluda a hned je koho hledat.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Ale ztratil se také kapitán, který najímal posádku do velké lodi kotvící tady v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//A když už nebyli dobrovolníci vyplul, po chvíli se nìco stalo a po lodi ani vidu ani slechu.
	Info_ClearChoices(dia_addon_halvor_missingpeople);
	Info_AddChoice(dia_addon_halvor_missingpeople,DIALOG_BACK,dia_addon_halvor_missingpeople_back);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Jaká loï to byla?",dia_addon_halvor_missingpeople_schiff);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Víš nìco o lidech, kteøí zmizeli?",dia_addon_halvor_missingpeople_wer);
	Info_AddChoice(dia_addon_halvor_missingpeople,"A TY postrádáš nìkoho?",dia_addon_halvor_missingpeople_you);
};

func void dia_addon_halvor_missingpeople_back()
{
	Info_ClearChoices(dia_addon_halvor_missingpeople);
};

func void dia_addon_halvor_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Víš nìco o lidech, kteøí zmizeli?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nic moc. Zkus se zeptat rybáøù.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Halvorovi není moc do øeèi, proto mì poslal k rybáøùm.");
};

func void dia_addon_halvor_missingpeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Jaká loï to byla?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Dobrá otázka. Dlouho tu žádné lodì nebyly.
};

func void dia_addon_halvor_missingpeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A TY postrádáš nìkoho?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//Já? Ne.
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "Mám dojem, že tenhle kousek papíru patøí tobì.";
	trade = FALSE;
};


func int dia_halvor_message_condition()
{
	if(KNOWS_HALVOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_halvor_message_info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Mám dojem, že tenhle kousek papíru patøí tobì.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Ukaž, podívám se.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(potí se) Ehm... Dobrá, nikomu o tom ani muk - ehm... poslouchej. Musím se zbavit zboží, co jsem získal od banditù.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(uspìchanì) Ale není žádný dùvod jít pøímo za domobranou, jasný? Jsem si jist, že se nìjak dohodneme, co?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Tak to mi udìlej nabídku.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"Vypadá to, že patøíš do basy.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Tak to mi udìlej nabídku.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobrá. Nìco ti povím. Prodávám víc než jen ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Když mi dáš ten smìšný kousek papíru a, ehm... zapomeneš na tu vìc, mùžeme se stát obchodními partnery.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Dobrá, ujednáno.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"Vypadá to, že patøíš do basy.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"Vážnì? Co by to tak mohlo být za zboží?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Vypadá to, že patøíš do basy.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Ne, poèkej, to nemùžeš udìlat! Vždy pøece nejsem, vždy víš... nic jinýho než malá ryba.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//To sis mìl rozmyslet døív. Teï mám v úmyslu tì nahlásit lordu Andremu.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Toho budeš litovat.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Vážnì? Co by to tak mohlo být za zboží?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Dobrá, mùžu ti nabídnout docela zvláštní ryby, však víš. Ne jenom ty obyèejné, co se jedí.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Máš na mysli takové, ve kterých jsou ukryté tvé tajné zprávy?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Jo, trefils. Mám pár takových... rybek.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobrá, dohodnuto. Necháme si to malé tajemství pro sebe.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Díky. Zase se zastav, až budeš poblíž. Urèitì pro tebe budu mít nìco zajímavýho.
	b_giveinvitems(other,self,itwr_halvormessage,1);
	Npc_RemoveInvItems(self,itwr_halvormessage,1);
	HALVOR_DEAL = TRUE;
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
	CreateInvItems(self,itse_erzfisch,1);
	CreateInvItems(self,itse_goldfisch,1);
	CreateInvItems(self,itse_ringfisch,1);
	CreateInvItems(self,itse_lockpickfisch,1);
	Info_ClearChoices(dia_halvor_message);
};


instance DIA_HALVOR_ZEICHEN(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_zeichen_condition;
	information = dia_halvor_zeichen_info;
	permanent = FALSE;
	description = "(Pøedvést zlodìjský signál.)";
};


func int dia_halvor_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Vím. Nepøišel jsi jen nakupovat ryby.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(potichu) Udìlám ti nabídku. Jestli máš nìjaké støíbrné tácy nebo poháry, vezmu si je od tebe za dobrou cenu.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Halvor nakupuje støíbrné talíøe a kalichy za daleko lepší cenu než ostatní obchodníci.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(Prodat staré tallíøe a kalichy.)";
};


func int dia_halvor_hehlerei_condition()
{
	if(Npc_KnowsInfo(other,dia_halvor_zeichen) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_hehlerei_info()
{
	HALVOR_SCORE = 0;
	if(HALVOR_DAY != Wld_GetDay())
	{
		if((Npc_HasItems(other,itmi_silverplate) >= 1) || (Npc_HasItems(other,itmi_silvercup) >= 1))
		{
			HALVOR_SCORE = (Npc_HasItems(other,itmi_silverplate) * (VALUE_SILVERPLATE / 2)) + (Npc_HasItems(other,itmi_silvercup) * (VALUE_SILVERCUP / 2));
			if(HALVOR_SCORE <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za všechno, co máš, ti dám...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"Dobrá, prodáno.",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"Budu o tom pøemýšlet.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//Pøinesl jsi moc zboží. Nemùžu ti dát tolik zlata nejednou.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Vra se, až budeš mít nìjaké støíbrné podnosy nebo poháry.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Mùžeš se toho støíbra zbavit zítra. Dneska je moc brzo.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Promiò, dneska už žádné obchody. Vra se zítra, dobrá?
	};
};

func void dia_halvor_hehlerei_annehmen()
{
	var int amount;
	var string concattext;
	amount = Npc_HasItems(other,itmi_silverplate) + Npc_HasItems(other,itmi_silvercup);
	concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itmi_silvercup,Npc_HasItems(other,itmi_silvercup));
	Npc_RemoveInvItems(other,itmi_silverplate,Npc_HasItems(other,itmi_silverplate));
	b_giveinvitems(self,other,itmi_gold,HALVOR_SCORE);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Dobrá, prodáno.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Udìlali jsme dneska dobrej kšeft. Lepší to bude nejdøív zítra, jinak by nìkdo mohl dostat podezøení, však víš.
	HALVOR_DAY = Wld_GetDay();
	Info_ClearChoices(dia_halvor_hehlerei);
};

func void dia_halvor_hehlerei_ablehnen()
{
	Info_ClearChoices(dia_halvor_hehlerei);
};


instance DIA_HALVOR_CREW(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 51;
	condition = dia_halvor_crew_condition;
	information = dia_halvor_crew_info;
	permanent = FALSE;
	description = "Sháním posádku.";
};


func int dia_halvor_crew_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_crew_info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Sháním posádku.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//Ale jak se chceš odsud dostat?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"To je èistì moje vìc.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"Hodlám získat loï.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To je èistì moje vìc.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Jak je libo. To opravdu není moje vìc.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Tak jdeš do toho?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"Mùžeš mi pomoct?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Hodlám získat loï.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jo, jasnì. Jinak seš zdravej? Paladinové s tebou udìlaj krátkej proces, až na to pøijdou.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Jak je libo - neriskuješ mùj život.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Tak jdeš do toho?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"Mùžeš mi pomoct?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Tak jdeš do toho?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Ne, mám dojem, že ne. Mám tady spoustu práce a upøímnì, netoužím zrovna po tom, abych potkal otrokáøskou galéru plnou skøetù.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale pøeju ti hodnì štìstí.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Mùžeš mi pomoct?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Já na tohle nejsem ten pravej èlovìk. Ale zajdi si promluvit s Jackem. Mìl by se poflakovat nìkde tady po pøístavu. On bude vìdìt nejlíp, co na tu plavbu budeš potøebovat.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};

