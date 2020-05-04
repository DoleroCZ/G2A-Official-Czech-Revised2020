
instance DIA_SAGITTA_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_exit_condition;
	information = dia_sagitta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HALLO(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 4;
	condition = dia_sagitta_hallo_condition;
	information = dia_sagitta_hallo_info;
	description = "Tak sama, tady venku?";
};


func int dia_sagitta_hallo_condition()
{
	return TRUE;
};

func void dia_sagitta_hallo_info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Tak sama, tady venku?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Øekni, co ode mì chceš, a pak vypadni. Mám práci.
	Info_ClearChoices(dia_sagitta_hallo);
	Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
	Info_AddChoice(dia_sagitta_hallo,"Mùžeš mì vyléèit?",dia_sagitta_hallo_heil);
	Info_AddChoice(dia_sagitta_hallo,"Co tady dìláš?",dia_sagitta_hallo_was);
	Info_AddChoice(dia_sagitta_hallo,"Kdo jsi?",dia_sagitta_hallo_wer);
};

func void dia_sagitta_hallo_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Tak tys o mnì ještì neslyšel?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Bylinkáøka, alespoò se tomu tak øíká. Šarlatánka, nebo tak nìjak mì nazývají.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Ale, když je jim zle, vždycky je jim stará Sagitta se svými léèivými bylinkami dobrá.
};

func void dia_sagitta_hallo_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Žiju tady, co se pamatuju a starám se o své bylinky.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Les je mým pøítelem. Poskytujeme mi vše, co potøebuju.
};

func void dia_sagitta_hallo_heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Mùžeš mì vyléèit?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//To je to, proè jsi tady, že? Tak povídej, co je v nepoøádku.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"U Sagitty za Sekobovou farmou si mohu nakoupit vybavení.");
};

func void dia_sagitta_hallo_ende()
{
	Info_ClearChoices(dia_sagitta_hallo);
};


instance DIA_SAGITTA_TEACHALCHEMYREQUEST(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 6;
	condition = dia_sagitta_teachalchemyrequest_condition;
	information = dia_sagitta_teachalchemyrequest_info;
	permanent = TRUE;
	description = "Mùžeš mì nauèit nìco o bylinkách?";
};


func int dia_sagitta_teachalchemyrequest_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo) && (MIS_SAGITTA_HERB == FALSE))
	{
		return TRUE;
	};
};


var int dia_sagitta_teachalchemyrequest_onetime;

func void dia_sagitta_teachalchemyrequest_info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Mùžeš mì nauèit nìco o bylinkách?
	if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Jak zajímavé. O nìco takového mì lidé nežádají zrovna èasto.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Takže, ty by ses chtìl stát mým studentem? To bys mìl nejdøív prokázat, že to s tím zájmem myslíš vážnì.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Právì pøipravuju velmi vzácný lektvar, který vyžaduje vybrané bylinky a extrakty.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Když mi seženeš jednu ingredienci - velmi vzácnou bylinu, kterou tady bohužel nemám - mùžu tì nìèemu nauèit.
		DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Už jsem ti øekla, že ano. Až mi pøineseš tu vzácnou bylinu.
	};
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Promiò, nemám zájem.",dia_sagitta_teachalchemyrequest_nein);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"A kde ji najdu?",dia_sagitta_teachalchemyrequest_wo);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"A o jakou ingredienci se jedná?",dia_sagitta_teachalchemyrequest_was);
};

func void dia_sagitta_teachalchemyrequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//A o jakou ingredienci se jedná?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//Je to nesmírnì vzácná rostlina - øíká se jí sluneèní aloe. Poznáš ji podle pronikavé mandlové vùnì.
};

func void dia_sagitta_teachalchemyrequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//A kde ji najdu?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Ta bylina, co potøebuju, roste jen na místech, kde má všechny potøebné živiny.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Ty se nacházejí v exkrementech èerného trola.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//To je ten dùvod, proè je pro mì tak obtížné tu kytku získat.
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Uvidíme, co se s tím dá dìlat.",dia_sagitta_teachalchemyrequest_wo_ja);
};

func void dia_sagitta_teachalchemyrequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Uvidíme, co se s tím dá dìlat.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Dobrá tedy. Tak hodnì štìstí pøi hledání.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	MIS_SAGITTA_HERB = LOG_RUNNING;
	Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
	b_logentry(TOPIC_SAGITTAHERB,"Sagitta potøebuje zvláštní rostlinu zvanou sluneèní aloe, která roste pouze na exkrementech èerného trola.");
};

func void dia_sagitta_teachalchemyrequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Promiò, nemám zájem.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Tak pøestaò plýtvat mým èasem s tìmi tvými nesmysly.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};


instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_sagitta_herb_condition;
	information = dia_sagitta_sagitta_herb_info;
	description = "Našel jsem sluneèní aloi.";
};


func int dia_sagitta_sagitta_herb_condition()
{
	if(Npc_HasItems(other,itpl_sagitta_herb_mis) && (MIS_SAGITTA_HERB == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_sagitta_herb_info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Našel jsem sluneèní aloi.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Díky. A teï se mì ohlednì lektvarù mùžeš ptát, na co chceš.
	b_giveinvitems(other,self,itpl_sagitta_herb_mis,1);
	SAGITTA_TEACHALCHEMY = TRUE;
	MIS_SAGITTA_HERB = LOG_SUCCESS;
	b_giveplayerxp(XP_SAGITTA_SONNENALOE);
};


instance DIA_SAGITTA_TEACH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 2;
	condition = dia_sagitta_teach_condition;
	information = dia_sagitta_teach_info;
	permanent = TRUE;
	description = "Jaké lektvary mì mùžeš nauèit pøipravovat?";
};


var int dia_sagitta_teach_permanent;

func int dia_sagitta_teach_condition()
{
	if((DIA_SAGITTA_TEACH_PERMANENT == FALSE) && (SAGITTA_TEACHALCHEMY == TRUE) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Jaké lektvary mì mùžeš nauèit pøipravovat?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE))
	{
		Info_ClearChoices(dia_sagitta_teach);
		Info_AddChoice(dia_sagitta_teach,DIALOG_BACK,dia_sagitta_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esence hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_sagitta_teach_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Extrakt hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_sagitta_teach_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_sagitta_teach_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_sagitta_teach_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixír many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_sagitta_teach_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixír ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_sagitta_teach_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixír obratnosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_sagitta_teach_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Pøedtím, než tì nauèím nìco z mé alchymie, ti musím øíct, co všechno budeš na pøípravu lektvarù potøebovat.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Alchymistická kolona slouží jako kuchyò pro pøípravu lektvarù. Budeš potøebovat prázdné laboratorní baòky, ve kterých se lektvary uchovávají.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Pak pøidáš ingredience a máš požadovaný lektvar.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Tomu se samozøejmì mùžeš ode mì nauèit.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//Tak jaký lektvar by to mìl být?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Už znáš vše, co bych tì mohla nauèit.
		DIA_SAGITTA_TEACH_PERMANENT = TRUE;
	};
};

func void dia_sagitta_teach_back()
{
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_sagitta_teach);
};


instance DIA_SAGITTA_HEAL(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 99;
	condition = dia_sagitta_heal_condition;
	information = dia_sagitta_heal_info;
	permanent = TRUE;
	description = "Vyleè mì.";
};


func int dia_sagitta_heal_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_heal_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Vyleè mì.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Ukaž, podívám se. Mmh. Na ty nejhorší zranìní by mìla moje mastièka staèit.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//V týhle chvíli nepotøebuješ žádné léèení.
	};
};


instance DIA_SAGITTA_TRADE(C_INFO)
{
	npc = bau_980_sagitta;
	condition = dia_sagitta_trade_condition;
	information = dia_sagitta_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jaké zboží mi mùžeš nabídnout?";
};


func int dia_sagitta_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_trade_info()
{
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Jaké zboží mi mùžeš nabídnout?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Øekni, co chceš.
};


instance DIA_SAGITTA_KAP3_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap3_exit_condition;
	information = dia_sagitta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_OBSESSION(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_obsession_condition;
	information = dia_sagitta_obsession_info;
	description = "Mám podivné pocity úzkosti.";
};


func int dia_sagitta_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_obsession_info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Trpím pocity strachu. Potøebuju pomoc.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Vidím, že spánek by ti moc nepomohl. Byl jsi vystaven temnému pohledu Pátraèù.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Zajdi za Pyrokarem, nejvyšším mágem kláštera. Moje skromné možnosti na tohle nestaèí.
};


instance DIA_SAGITTA_THEKLA(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_thekla_condition;
	information = dia_sagitta_thekla_info;
	description = "Thekla mì poslala pro nìjaký balík.";
};


func int dia_sagitta_thekla_condition()
{
	if((MIS_THEKLA_PAKET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_thekla_info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla mì poslala pro nìjaký balík.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ach, ano. Už jsem ji oèekávala vèera.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Tady je ten balík. Dávej na nìj dobrý pozor!
	b_giveplayerxp(XP_AMBIENTKAP3);
	b_giveinvitems(self,other,itmi_theklaspaket,1);
};


instance DIA_SAGITTA_KAP4_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap4_exit_condition;
	information = dia_sagitta_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HEALRANDOLPH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_healrandolph_condition;
	information = dia_sagitta_healrandolph_info;
	permanent = TRUE;
	description = "Randolph má absák.";
};


var int dia_sagitta_healrandolph_gotone;
var int dia_sagitta_healrandolph_knowsprice;

func int dia_sagitta_healrandolph_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && (Npc_HasItems(other,itpo_healrandolph_mis) == 0) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_healrandolph_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph má absák.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//Kdy už se ten chlap koneènì pouèí?
		DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
	};
	if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Už jsem ti pro nìj pøichystala dávku. Tak se s tím nikde moc nepoflakuj.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Dám mu na to lék. To mu bude na nìkolik dní staèit.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Tak to pøijde na 300 zlatých.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Co?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Jediná vìc, kterou dostaneš úplnì zadarmo, je smrt, chlapèe.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
	Info_AddChoice(dia_sagitta_healrandolph,"Pff. Za takové nesmysly utrácet nebudu.",dia_sagitta_healrandolph_no);
	Info_AddChoice(dia_sagitta_healrandolph,"Tady jsou peníze.",dia_sagitta_healrandolph_geld);
};

func void dia_sagitta_healrandolph_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Tady jsou peníze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Výbornì. Vždycky ty peníze mùžeš dostat zpátky od nìj.
		CreateInvItems(self,itpo_healrandolph_mis,1);
		b_giveinvitems(self,other,itpo_healrandolph_mis,1);
		DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
		b_logentry(TOPIC_HEALRANDOLPH,"Sagitta mi dala lék pro Randolpha.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Dokud mi nedáš peníze, nebude žádnej obchod.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
};

func void dia_sagitta_healrandolph_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Pff. Za takové nesmysly utrácet nebudu.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(smích) Nedal ti peníze, co? To je celý on!
	Info_ClearChoices(dia_sagitta_healrandolph);
};


instance DIA_SAGITTA_KAP5_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap5_exit_condition;
	information = dia_sagitta_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_KAP6_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap6_exit_condition;
	information = dia_sagitta_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_PICKPOCKET(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 900;
	condition = dia_sagitta_pickpocket_condition;
	information = dia_sagitta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120_FEMALE;
};


func int dia_sagitta_pickpocket_condition()
{
	return c_beklauen(103,360);
};

func void dia_sagitta_pickpocket_info()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_BACK,dia_sagitta_pickpocket_back);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_PICKPOCKET,dia_sagitta_pickpocket_doit);
};

func void dia_sagitta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sagitta_pickpocket);
};

func void dia_sagitta_pickpocket_back()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
};

