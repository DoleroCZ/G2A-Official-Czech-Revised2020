
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Jestli chceš nìco k pití, musíš si to objednat.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif prodává v pøístavní krèmì nápoje.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "Poèítám, e tady zaslechneš spoustu vìcí.";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Poèítám, e tady zaslechneš spoustu vìcí.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//No a co je ti po tom?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Nové zprávy vdycky vítám s otevøenou náruèí.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//A je stejnì otevøená i tvoje penìenka?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Kadá informace, kterou ti dám, tì bude stát 10 zlaákù.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, hospodskı v pøístavní krèmì, prodává informace.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Nedám ti za informaci víc ne 5 zlaákù.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Zapomeò na to - najdu si je jinde.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"No dobøe, souhlasím.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//No dobøe, souhlasím.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Umíš dobøe smlouvat (usmìje se). Jsem ti vdycky k slubám.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Nedám ti za informaci víc ne 5 zlaákù.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Coe, 5 zlaákù? Chceš mì oebraèit? (krátce se zamyslí) Tak to zaokrouhleme na 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Ne, takhle to nefunguje. Øeknìme 6.",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"Fajn, 7 zlaákù zní rozumnì.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Zapomeò na to - najdu si informace jinde.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//No dobrá, dobrá... slevím tedy na 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Fajn, 7 zlaákù zní rozumnì.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"Ne, ty tvé informace vlastnì a tak nutnì nepotøebuji.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Fajn, 7 zlaákù zní rozumnì.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(zazubí se) To je moudré rozhodnutí. Take a budeš nìco potøebovat, klidnì se mì zeptej.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Ne, ty tvé informace vlastnì a tak nutnì nepotøebuji.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hej, poèkej... (povzdech) - dobrá, 5 zlaákù, ale to je moje poslední nabídka!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"A proè jsi to neøekl hned?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//A proè jsi to neøekl hned?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ále, prostì nejsem úplnì fit. Ale a je to jak chce, u jsme se dohodli.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Ne, takhle to nefunguje. Øeknìme 6.
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ty jsi pìknı lump, víš to? No, kdy na tom trváš, tak øeknìme 6 zlaákù za kadou informaci.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Rád bych si dal nìco k pití.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Rád bych si dal nìco k pití.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "Potøebuji informace.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Potøebuji informace.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Vra se, a budeš mít dost zlata.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Kdo patøí mezi nejvlivnìjší obèany tohoto mìsta?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Kdo patøí mezi nejvlivnìjší obèany tohoto mìsta?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Tady dole v pøístavu nenajdeš nikoho. Jedinı zdejší mocnı mu je Lehmar.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Lichváø není zrovna populární, ale má zlato a pár jinıch vlivnıch mìšanù mu dluí peníze.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Kupci a øemeslníci mají také dost velkı vliv - a moc velkı, øekl bych.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "Kdo všechno Lehmarovi nìco dluí?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Kdo všechno Lehmarovi nìco dluí?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(smìje se) Jestli to chceš zjistit, mìl bys nahlédnout do jeho úèetní knihy.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Akorát urèitì nebude snadné tam jen tak nepozorovanì nakouknout.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Pokud vím, vdycky ji nosí u sebe.
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "Kde bych mohl najít práci?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Kde bych mohl najít práci?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Tady v pøístavu práci asi jen tak nenajdeš. Budeš muset zajít za øemeslníky v dolní èásti mìsta.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Ale jestli máš trochu slušnı meè, mùeš zkusit vyzvat na souboj Alrika. Bije se za peníze - najdeš ho za skladištìm.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_ADDON_KARDIF_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_addon_kardif_missingpeople_condition;
	information = dia_addon_kardif_missingpeople_info;
	permanent = TRUE;
	description = "Víš nìco o hledanıch mìšanech?";
};


var int dia_addon_kardif_missingpeople_permanent;

func int dia_addon_kardif_missingpeople_condition()
{
	if((DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_kardif_missingpeople_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Víš nìco o hledanıch mìšanech?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Vím nìco o tìch, co zmizeli nedávno.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Byli to lidé tady odtud z pøístavu. Mìl by ses tu projí a poptat se jich.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//Nìkteøí popisovali nìjaké pøípady v niších ètvrtích mìsta.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Víc by ti poradil asi Coragon.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//Má krèmu v niší ètvti mìsta, bude-li mít èas, urèitì ti nìco zajímanıho poví.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Ještì je tu taky rybáø Halvor, ten by také mohl nìco vìdìt a øek bych, e se s tebou o to rád podìlí.
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kardif si myslí, e krèmáø Coragon nebo pøístavní rybáø Halvor by mohli o hledanıch lidech vìdìt víc.");
		DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "Kdo mì tady mùe nìco nauèit?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Kdo mì tady mùe nìco nauèit?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Tady v pøístavišti najdeš pár schopnıch lidí.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Kováø Carl je poøádnı silák. Vsadím se, e s jeho pomocí si mùeš zvıšit sílu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Alrik toho ví spoustu o boji a Lares je prohnanı lump. Nìkdy ho mùeš najít i tady v pøístavu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//A jestli jsi dostateènì praštìnı, zastav se u starého Ignaze - ví všechno o tuhlecté aleche... almich... o lektvarech.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Kde bych je všechny našel?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(mruèí) Hochu, ne bych ti to vysvìtlil, tak by král vyhrál celou tuhle válku proti skøetùm.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Prostì se porozhlédni po pøístavní ètvrti a musíš je najít. A pokud to tu moc neznáš, stav se u Brahima a kup si od nìj mapu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//JEHO najdeš snadno. Má chıši hned vedle mé hospody. (mruèí) Za tohle bych si mìl úètovat dvojnásobek.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, kováø z pøístavní ètvrti, mi mùe pomoci vylepšit sílu.");
		b_logentry(TOPIC_CITYTEACHER,"Lares mi vylepší obratnost a sílu.");
		b_logentry(TOPIC_CITYTEACHER,"Alrik mì vycvièí v boji jednoruèními zbranìmi. Potlouká se kdesi za skladištìm v pøístavní ètvrti.");
		b_logentry(TOPIC_CITYTEACHER,"Ignaz mi ukáe nìkteré recepty na míchání lektvarù. ije v pøístavní ètvrti.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brahim kreslí a prodává mapy. Bydlí poblí pøístavu.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "Mùu dostat tøeba nìjakou 'zvláštní' práci?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Mùu dostat tøeba nìjakou "zvláštní" práci, abych mohl rychle pøijít k nìjakım penìzùm?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Nìco zvláštního øíkáš? Hmmmm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...tak si zkus promluvit s Nagurem, moná ti pomùe.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "Máš pro mì nìjakou 'zvláštní' práci?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Máš pro mì nìjakou "zvláštní" práci?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Nìco pro tebe mám - ale to tì bude zajímat jenom tehdy, pokud jsi opravdu všestrannı.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Co máš?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//No, Zuris, co prodává na trišti lektvary, má zrovna u sebe hosta - mága ohnì Darona.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//A?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Tesaø Thorben mu zvláš vyrobil novou truhlu.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//A ten Daron mu prı pøinesl spoustu cenného zboí. Ale nic jsi ode mì neslyšel, rozumíš?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "Kde bych tu koupil nìjakou trávu?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Kde bych tu koupil nìjakou trávu?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Urèitì ne tady - s takovımi vìcmi nechci nic mít.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Urèitì ne tady.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//A kde tedy?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Bıt tebou, promluvím si s Meldorem - ten hulí od rána do veèera.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "Co víš o balíku trávy z bain?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Co víš o balíku trávy z bain?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Ten, kdo takovı balík vlastní, je boháè. A nejspíš taky tìkı pohodáø!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Nesna se mì oblbnout. Ty nìco víš, tak to vyklop!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Nojo, nojo - takovı chlápek ke mnì onehdá pøišel. Patøil k oldákùm.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//e prı v pøístavu prodal balík trávy z bain, ale samozøejmì byl totálnì zhulenı. Víc nevím.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Kardif hovoøil s oldnéøem, kterı se snail prodat balík trávy z bain.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if((MIS_THIEFGUILD_SUCKED == TRUE) || ((DIEBESGILDE_OKAY >= 3) && Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hej ty, pojï sem. Nìco pro tebe mám.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Jeden chlápek tu s tebou chtìl mermomocí mluvit.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Kdy tì tu nezastihl, nechal tu pro tebe vzkaz.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Chce se s tebou sejít. Za Halvorovım obchodem s rybami.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Tahle informace je zadarmo - to je ale vıjimka, hochu! Všecko ostatní tì zase bude nìco stát.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Jak ten chlápek vypadal?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//To ti mùu øíct, ale napøed za to musíš zaplatit, kámo. (zašklebí se)
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Kadá informace, kterou ti dám, tì bude stát 10 zlaákù.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "Jak ten chlápek vypadal?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Jak ten chlápek vypadal?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//No, byl pomìrnì vysokı, silnı a mìl tmavou ple - ale ádnou uniformu. Pùsobil tak nìjak... hrozivì.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//A jeho tváø?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Tváø? Kdy se na mì podíval, byl jsem rád, e si nepøišel pro mì.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Z oèí mu koukala dìsná zloba - ale i tak bys za ním mìl zajít. Urèitì to bude zajímavé.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Ale otázkou je, pro koho.
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "Ten bastard se mì snail zabít!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Ten bastard se mì snail zabít!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hele, já za to pøece nemùu! Já ti jenom pøedal informaci!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Jestli ti nìkdo šlape na paty, pak k tomu má nejspíš své dùvody.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(Pøedvést zlodìjskı signál.)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Aha, ty ses zapletl s tím gangem. No dobøe, v tom pøípadì tu pro tebe nìco mám.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(tiše) Kdy budeš potøebovat nìjaké šperháky, pøijï za mnou, pár jich tu ještì mám. A staèí, kdy si øekneš o nìco k pití.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "Ještì poøád potøebuji pár námoøníkù.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Ještì poøád potøebuji pár námoøníkù.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Èasy jsou zlé, pøíteli. V celém Khorinisu asi dost námoøníkù neseeneš - vìtšina z nich z mìsta odešla.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Ale kdy si najdeš dobrého kapitána, posádku seeneš celkem rychle - pár chytrıch chlápkù se tu vdycky najde.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Kde bych našel kapitána?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//To se neptáš toho nepravého, já jenom vedu tuhle hospodu.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Kardif mì poslal ke starému Jackovi, kterı mi nejspíš mùe pomoci.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Promluv si se starım Jackem. Bloumá tu po pøístavu u hezky dlouho. Kdy pøijde na námoønictví, je to tvùj mu.
	};
};

