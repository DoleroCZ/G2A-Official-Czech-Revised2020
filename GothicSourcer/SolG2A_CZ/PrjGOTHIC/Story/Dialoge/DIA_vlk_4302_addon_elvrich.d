
instance DIA_ADDON_ELVRICH_EXIT(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 999;
	condition = dia_addon_elvrich_exit_condition;
	information = dia_addon_elvrich_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_elvrich_exit_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_PICKPOCKET(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 900;
	condition = dia_addon_elvrich_pickpocket_condition;
	information = dia_addon_elvrich_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_elvrich_pickpocket_condition()
{
	return c_beklauen(62,110);
};

func void dia_addon_elvrich_pickpocket_info()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_BACK,dia_addon_elvrich_pickpocket_back);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_PICKPOCKET,dia_addon_elvrich_pickpocket_doit);
};

func void dia_addon_elvrich_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};

func void dia_addon_elvrich_pickpocket_back()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};


instance DIA_ADDON_ELVRICH_BANDITSTHERE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_banditsthere_condition;
	information = dia_addon_elvrich_banditsthere_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_elvrich_banditsthere_noperm;

func int dia_addon_elvrich_banditsthere_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_banditsthere_info()
{
	if(Npc_IsDead(bdt_10307_addon_rangerbandit_m) && Npc_IsDead(bdt_10308_addon_rangerbandit_l) && Npc_IsDead(bdt_10309_addon_rangerbandit_l) && Npc_IsDead(bdt_10310_addon_rangerbandit_m))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Díky Bohu. Banditi už nejsou.
		DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM = TRUE;
		self.aivar[AIV_NOFIGHTPARKER] = FALSE;
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ELVRICH_WER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wer_condition;
	information = dia_addon_elvrich_wer_info;
	description = "Kdo jsi?";
};


func int dia_addon_elvrich_wer_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Jmenuji se Elvrich. Jsem z mìsta.
	if(MIS_THORBEN_BRINGELVRICHBACK == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistr Thorben mi øekl, že jsi zmizel.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Tito strašní lidé mì sem dotáhli a drželi mì tu jako vìznì.
};


instance DIA_ADDON_ELVRICH_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_missingpeople_condition;
	information = dia_addon_elvrich_missingpeople_info;
	description = "Hodnì lidí tady ve mìstì chybí.";
};


func int dia_addon_elvrich_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Hodnì lidí tady ve mìstì chybí.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//O tom nevím nic. Mùžu ti jenom øíct, co se stalo MÌ.
};


instance DIA_ADDON_ELVRICH_WHATEXACTLY(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whatexactly_condition;
	information = dia_addon_elvrich_whatexactly_info;
	description = "Co se ti pøesnì stalo?";
};


func int dia_addon_elvrich_whatexactly_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whatexactly_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co se ti pøesnì stalo?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Šel jsem na schùzku s holkou.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Jmenuje se Lucie. Mìli jsme v plánu utéct do hor. Pryè z mìsta a ode všech, co tam žijí.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Jen co jsem dorazil na místo, vyvalilo se z køoví nìkolik banditù a oba nás zajali.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Samozøejmì jsem bojoval, ale bylo to k nièemu. Bylo jich pøíliš mnoho. Nemìl jsem šanci.
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Co od tebe banditi chtìli?",dia_addon_elvrich_whatexactly_want);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Povìz mi o Lucii.",dia_addon_elvrich_whatexactly_lucia);
};

func void dia_addon_elvrich_whatexactly_want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Co od tebe banditi chtìli?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Nìkdy, v noci, se mi podaøilo je odpslouchávat. Nerozumnìl jsem tomu dobøe, ale myslím, že nás chtìli zotroèit.
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Kam vás chtìli odvléct?",dia_addon_elvrich_whatexactly_pirates);
};

func void dia_addon_elvrich_whatexactly_pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Kam vás chtìli odvléct?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//Nìkam na ostrov Khorinisu. Ale podle mì se tam nejde dostat bez lodi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Odvedli mì na jakési kotvištì na pobøeží. Táboøili tam nìjací piráti.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z banditù šel napøed nìco vyjednat a s tìmi piráty. Mìli prudké argumenty.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Myslím, že banditi chtìli, aby je piráti pøevezli a mì s nima.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale piráti s tím myslím nesouhlasili. Nakonec se banditi vrátili sem a od té doby tady sedíme.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Vypadali pìknì bezradní. A pak ses objevil ty.
	ELVRICH_SCKNOWSPIRATS = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Elvrich, uèedník truhláøe Thorbena byl unesen bandity. Vypadá to, že piráti se s bandity moc rádi nemají.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Piráti v Khorinisu?",dia_addon_elvrich_whatexactly_here);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Kde mají piráti svou skrýš?",dia_addon_elvrich_whatexactly_pirat);
};

func void dia_addon_elvrich_whatexactly_here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Piráti v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Moc o nich nevím. Na tom kotvišti jsem je vidìl poprvé.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Vždycky stojí v pozadí. Každý z nich je hledaný zloèinec v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Bojí se šibenice. Proto je nikdy neuvidíš ve mìstì.
};

func void dia_addon_elvrich_whatexactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Povìz mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Holka z pøístavu. Pracovala pro toho teplouše Bromora. Je velmi pìkná.
};

func void dia_addon_elvrich_whatexactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Kde mají piráti svou skrýš?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Není to daleko od pøístavu v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Když stojíš na molu a díváš se na moøe, tak vem èlun a vesluj podél pobøeží na pravé stranì.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//První malá zátoka, kterou projedeš by to mìla být.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Abych našel skrýš pirátù, musím jít nejprve do pøístavu v Khorinisu. Jakmile budu stát na molu, èelem k moøi, musím plavat po pobøeží na pravé stranì.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,DIALOG_BACK,dia_addon_elvrich_whatexactly_back);
};

func void dia_addon_elvrich_whatexactly_back()
{
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
};


instance DIA_ADDON_ELVRICH_BROMOR(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_bromor_condition;
	information = dia_addon_elvrich_bromor_info;
	description = "Bromor øíkal, že mu Lucia ukradla zlatou misu ...";
};


func int dia_addon_elvrich_bromor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_bromor_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor øíkal, že mu Lucia ukradla zlatou misu ...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, pokud Lucie opravdu nìco ukradla, tak jí to bandité urèitì sebrali.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Bromorova zlatá misa je nejspíše u banditù v severním lese za Sekobovou farmou.");
};


instance DIA_ADDON_ELVRICH_WHEREISLUCIA(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whereislucia_condition;
	information = dia_addon_elvrich_whereislucia_info;
	description = "Kde je Lucie teï?";
};


func int dia_addon_elvrich_whereislucia_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_LUCIASLETTER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whereislucia_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Kde je Lucie teï?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Naše cesty se rozdìlili na velké køižovatce u Onarovy farmy.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Banditi ji odvlekli do lesa za Sekobovu farmu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Innos ji chraò.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucie byla odvleèena bandity do lesa za Sekobovou farmou nìkde na severu.");
	SC_KNOWSLUCIACAUGHTBYBANDITS = TRUE;
};


instance DIA_ADDON_ELVRICH_FERNANDOSWAFFEN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_fernandoswaffen_condition;
	information = dia_addon_elvrich_fernandoswaffen_info;
	description = "To jsou ti banditi, co obdrželi tu dodávku zbraní?";
};


func int dia_addon_elvrich_fernandoswaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_fernandoswaffen_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//To jsou ti banditi, co obdrželi tu dodávku zbraní?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//Jo. Na mou duši, mìli problémy ji celou unést.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Utekli za tu farmu a všechno vzali s sebou.
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Badndité, kteøí obdrželi velkou dodávku zbraní se skrývají nìkde za Sekobovou farmou na severu. ");
};


instance DIA_ADDON_ELVRICH_LUCIALETTER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 4;
	condition = dia_addon_elvrich_lucialetter_condition;
	information = dia_addon_elvrich_lucialetter_info;
	description = "Našel jsem dopis od Lucie.";
};


func int dia_addon_elvrich_lucialetter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && Npc_HasItems(other,itwr_luciasloveletter_addon))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_lucialetter_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Našel jsem dopis od Lucie.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(rozrušenì) Co? Dej to sem!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(v zoufalství) NE! Tomu nevìøím. Ne. To nemùže být pravda.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(v zoufalství) Nemohla mì takhle opustit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//(v zoufalství) Vezmi si ten dopis zpátky. Nechci ho. Pevnì vìøím, že se jednoho dne vrátí.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Elvrich nechce uvìøit, že Lucie šla s bandity dobrovolnì. Poøád doufá, že se vrátí, navzdory jejího dopisu na rozlouèenou.");
	b_giveplayerxp(XP_ADDON_LUCIASLETTER);
	MIS_LUCIASLETTER = LOG_SUCCESS;
};


instance DIA_ADDON_ELVRICH_WASNUN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wasnun_condition;
	information = dia_addon_elvrich_wasnun_info;
	permanent = FALSE;
	description = "Mìl by ses vrátit do mìsta!";
};


func int dia_addon_elvrich_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whereislucia))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_wasnun_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Mìl by ses vrátit do mìsta!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A co sis myslel, že bych dìlal? Pùjdu rovnou zpátky k mistru Thorbenovi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Budeš hledat bandity?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//No, hádal bych že asi jo ...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Pokud bys našel Lucii, vzal bys ji bezpeènì zpìt do mìsta, že jo?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Uvidím, co se dá dìlat.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich se vrátil ke svému truhláøskému mistrovi Thorbenovi.");
	ELVRICH_GOESBACK2THORBEN = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,itmw_1h_bau_mace);
};


instance DIA_ADDON_ELVRICH_PERM(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_perm_condition;
	information = dia_addon_elvrich_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_elvrich_perm_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && Npc_IsInState(self,zs_talk) && (MIS_LUCIASLETTER != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Dìkuji ti za záchranu!
};

