
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "Mohu tu dostat nìco k pití?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Mohu tu dostat nìco k pití?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Mùžeš dostat dokonce nìco k jídlu, pokud máš zlato.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jídlo a pití mùžu nakoupit u hostinského Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Tak co, jak jdou kšefty?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Tak co, jak jdou kšefty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Ani mi nemluv. Lord Andre dává pivo zadarmo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Nyní sem chodí docela dost lidí z horní ètvti, jen tak posedìt.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//A co je s nimi?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(pobavenì) Nìkteøí z tìch chlápkù mi opravdu lezou na nervy.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Napøíklad Valentino - nemohu toho chlapa vystát.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale nemohu si vybírat zákazníky, potøebuji každou minci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//Všechno mi ukradli, dokonce i mé støíbro.
};


instance DIA_ADDON_CORAGON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_addon_coragon_missingpeople_condition;
	information = dia_addon_coragon_missingpeople_info;
	description = "Víš nìco o zmizelých?";
};


func int dia_addon_coragon_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_coragon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Víš nìco o zmizelých?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Slyšel jsem, že jsou to povìtšinou lidé z pøístavu. Znám to tam a vùbec mì to nepøekvapuje.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Dokonce Thorben øíká, že mu zmizel uèedník.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Hakon, jeden z obchodníkù na tržišti mi øekl velmi podivnou historku.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Øíkal, že vídával jednoho chlápka každý den. Jednoho krásného dne prostì zmizel. Dokonce se na to ptal i domobrany.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Mnoho obyvatel pak propadlo panice. Nevím, co si o tom myslet, ale øekl bych, že je to nesmysl.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis je tvrdé mìsto a za jeho branami na tebe èeká mnoho nebezpeèí.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Mimo mìsto mùžeš být pøepaden bandity nebo divokými zvíøaty. Je to jednoduché.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Hakon - obchodník na tržišti - a Thorben - tesaø - by mi mohli nìco povìdìt.");
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Cože, okradli tì?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Cože, okradli tì?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Ano, pøed pár dny. Toto místo bylo pøecpané a já jsem tu nebyl jen chvilku.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nebyl jsem za barem jen chvilièku - ale tìm parchantùm ta chvilka staèila.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Øekl jsem to domobranì - samozøejmì nic nenašli. Mají plno práce s pitím piva venku.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Tady je tvá odmìna.
	b_giveinvitems(self,other,itfo_coragonsbeer,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Je to SPECIÁLNÍ pivo. Mùj poslední sud.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Toto je poslední doušek.
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "Tvoje støíbro mám zrovna u sebe.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Tvoje støíbro mám zrovna u sebe.
	if(b_giveinvitems(other,self,itmi_coragonssilber,8))
	{
		Npc_RemoveInvItems(self,itmi_coragonssilber,8);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Opravdu!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "Podívej, co tady mám.";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Podívej, co tady mám.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm? To je Lehmarùv dluhopis!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co s tím zamýšlíš dìlat?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Tady máš svou knihu.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Tady máš svou knihu.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Díky! Zachránils mì! Lehmar je docela nepøíjemný pokud jde o jeho peníze.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "Co musím udìlat, abych se dostal do horní ètvrti?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Co musím udìlat, abych se dostal do horní ètvrti?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Musíš se stát obèanem. Najdi si nìjakou práci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Možná bys mìl promluvit s obchodníky, co dìlají v dolní èásti mìsta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Pokud ti to nestaèí, mùžeš promluvit s lordem Andrem, který je v kasárnách.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Možná tì nechá stát se mìstskou stráží. Pak mùžeš také do horní ètvrti.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "Co je s tím Valentinem?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//Co je s tím Valentinem?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Je docela bohatý a nemusí pracovat. A dává to každému najevo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Bez ohledu jestli tì to zajímá nebo ne.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Pije hodnì a odchází obvykle nad ránem. A pak se pomalu vrací zpìt do horní ètvrti.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Každý den.
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino mìl vèera tìžkou noc.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Snažil se mi namluvit, že byl okraden a dušoval se, že zaplatí pøíštì. Vážnì!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//He, pøedtím se vytahoval, kolik penìz u sebe má.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//A pak se podíval do penìženky, hloupì se zatváøil a rozhlédl se kolem. Pak mi øekl, že byl okraden.
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//A jak ses zachoval ty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Dal jsem mu dal poøádnej výprask!
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Na, vezmi si tento prsten.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Na, vezmi si tento prsten.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nerozumím ...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Je to Valentinùv prsten.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Pøedej ho zase nìkomu, kdo mu dá výprask pøíštì.
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

