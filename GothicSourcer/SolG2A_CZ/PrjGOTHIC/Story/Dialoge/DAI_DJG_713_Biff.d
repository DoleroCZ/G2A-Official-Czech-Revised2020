
func void b_kommmit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Pojï za mnou!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Nemám zapotøebí, aby si ze mì nìkdo dìlal blázny.
};

func void b_biffsanteil_berechnung()
{
	var int momentankohle;
	var int ueberschusskohle;
	momentankohle = Npc_HasItems(hero,itmi_gold);
	ueberschusskohle = momentankohle - DJG_BIFF_SCGOLD;
	BIFFSANTEIL = ueberschusskohle / 2;
};

func void b_biffsanteil_printscreen()
{
	var string biffsanteiltext_teil;
	var string biffsanteiltext;
	var string anteil;
	anteil = IntToString(BIFFSANTEIL);
	biffsanteiltext_teil = ConcatStrings(PRINT_BIFFSANTEIL,anteil);
	biffsanteiltext = ConcatStrings(biffsanteiltext_teil,PRINT_BIFFGOLD);
	AI_PrintScreen(biffsanteiltext,-1,45,FONT_SCREENSMALL,4);
};

func void b_biff_setrefusetalk()
{
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		Npc_SetRefuseTalk(biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(biff,600);
	};
};


instance DIA_BIFF_EXIT(C_INFO)
{
	npc = djg_713_biff;
	nr = 999;
	condition = dia_biff_exit_condition;
	information = dia_biff_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_exit_condition()
{
	return TRUE;
};

func void dia_biff_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_HALLO(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_hallo_condition;
	information = dia_biff_hallo_info;
	description = "Co tady dìláš?";
};


func int dia_biff_hallo_condition()
{
	return TRUE;
};

func void dia_biff_hallo_info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//To je ta nejblbìjší otázka, jakou jsem kdy slyšel. Co asi tak myslíš?
	Info_AddChoice(dia_biff_hallo,"Z tak pøiblblýho výrazu, jakej máš ty, se nedá nic poznat. Proto jsem se taky musel zeptat.",dia_biff_hallo_spott);
	Info_AddChoice(dia_biff_hallo,"Tak o tom nemám ani tucha.",dia_biff_hallo_keineahnung);
	Info_AddChoice(dia_biff_hallo,"To nic.",dia_biff_hallo_doof);
};

func void dia_biff_hallo_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//To nic.
	Info_ClearChoices(dia_biff_hallo);
};

func void dia_biff_hallo_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//Z tak pøiblblýho výrazu, jakej máš ty, se nedá nic poznat. Proto jsem se taky musel zeptat.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//Na mùj vkus máš nìjak moc velkou hubu. Je naèase, aby ti ji nìkdo zavøel.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};

func void dia_biff_hallo_keineahnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Tak o tom nemám ani tucha.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//Èekám, co se tu nakonec semele.
	Info_AddChoice(dia_biff_hallo,"Co èekáš, že se stane?",dia_biff_hallo_keineahnung_was);
};

func void dia_biff_hallo_keineahnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//Co èekáš, že se stane?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Hele chlape, ty sis vážnì nebyl dvakrát, když Innos rozdával rozum. Kdybych to vìdìl, na nic bych neèekal.
	Info_AddChoice(dia_biff_hallo,"Tak co se chystá?",dia_biff_hallo_keineahnung_was_was2);
};

func void dia_biff_hallo_keineahnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//Tak co se chystá?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Už mi lezeš na nervy. Hele, nestarám se o to, co se stane. Až do tý chvíle, kdy se to stane.
	Info_AddChoice(dia_biff_hallo,"Tak proè nìco nedìláš?",dia_biff_hallo_keineahnung_was_was2_was3);
};

func void dia_biff_hallo_keineahnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//Tak proè nìco nedìláš?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Jestli mi okamžitì nepøestaneš dávat ty pøiblblý otázky, tak ti tu tvojí nevymáchanou hubu rychle zavøu.
	Info_AddChoice(dia_biff_hallo,"Když tu budeš jen tak èekat, nikdy se nic nestane!",dia_biff_hallo_keineahnung_was_was2_was3_was4);
};

func void dia_biff_hallo_keineahnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Když tu budeš jen tak èekat, nikdy se nic nestane!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Jo, tak to je!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_WASHIERIMTAL(C_INFO)
{
	npc = djg_713_biff;
	nr = 7;
	condition = dia_biff_washierimtal_condition;
	information = dia_biff_washierimtal_info;
	description = "Co doufáš, že tu najdeš?";
};


func int dia_biff_washierimtal_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_hallo))
	{
		return TRUE;
	};
};

func void dia_biff_washierimtal_info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Co doufáš, že tu najdeš?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Slávu a zlato. Co víc? Až se vypoøádám s tìmi draky, budu se topit v penìzích.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//A doufám, že budu mít dost na to, abych si mohl do konce života užívat po všech hospodách a nevìstincích v zemi.
	Info_AddChoice(dia_biff_washierimtal,"Fajn, tak ti pøeju hodnì štìstí.",dia_biff_washierimtal_vielglueck);
	Info_AddChoice(dia_biff_washierimtal,"Buï tak, nebo budeš mrtvej!",dia_biff_washierimtal_ihrtot);
};

func void dia_biff_washierimtal_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Buï tak, nebo budeš mrtvej!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//A co? To k tomu patøí. Když chceš bejt bohatej, musíš trochu riskovat.
	Info_ClearChoices(dia_biff_washierimtal);
};

func void dia_biff_washierimtal_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Fajn, tak ti pøeju hodnì štìstí.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//Nepotøebuju žádný štìstí. Staèí mi moje sekera.
	Info_ClearChoices(dia_biff_washierimtal);
};


instance DIA_BIFF_ARBEITEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 8;
	condition = dia_biff_arbeiten_condition;
	information = dia_biff_arbeiten_info;
	permanent = TRUE;
	description = "Jak by se ti líbilo pracovat pro mì?";
};


func int dia_biff_arbeiten_condition()
{
	if((DJG_BIFFPARTY == FALSE) && Npc_KnowsInfo(other,dia_biff_hallo) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_arbeiten_info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Jak by se ti líbilo pracovat pro mì?
	b_logentry(TOPIC_DRAGONHUNTER,"Drakobijce Biff je žoldnéø tìlem i duší. Když mu zaplatím, bojovat po mém boku.");
	if(DJG_BIFFPARTY_NOMORE >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//Už jsme to jednou zkusili. Moc to nefungovalo. Díky, nemám zájem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Mmh. Proè ne? Co z toho budu mít?
	};
	Info_ClearChoices(dia_biff_arbeiten);
	Info_AddChoice(dia_biff_arbeiten,"Budeš rád, když tì nechám naživu.",dia_biff_arbeiten_lebenlassen);
	Info_AddChoice(dia_biff_arbeiten,"Dám ti pùlku koøisti.",dia_biff_arbeiten_halbehalbe);
	Info_AddChoice(dia_biff_arbeiten,"Dám ti 100 zlatých.",dia_biff_arbeiten_100);
};

func void dia_biff_arbeiten_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//Dám ti 100 zlatých.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Tak dobrá. Mimochodem, to je jen pro zaèátek. Jdeme. Pùjdu za tebou.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		b_biff_setrefusetalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BIFFPARTY = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
	};
};

func void dia_biff_arbeiten_halbehalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Dám ti pùlku koøisti.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//To zní dobøe. Ale varuju tì, nepokoušej se mì podvést, jinak toho budeš litovat.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//A ještì jedna vìc, nezajímají mì žádné zbranì ani další krámy, co tady najdeš. Chci jen zlato, jasný?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BIFFPARTY = TRUE;
	DJG_BIFF_HALBEHALBE = TRUE;
	b_biff_setrefusetalk();
	if(DJG_BIFF_HALBEHALBE_AGAIN == FALSE)
	{
		DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		DJG_BIFF_HALBEHALBE_AGAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Ale co to øíkám. Tohle všechno už jsi vìdìl.
	};
};

func void dia_biff_arbeiten_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Budeš rád, když tì nechám naživu.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_GELDEINTREIBEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 9;
	condition = dia_biff_geldeintreiben_condition;
	information = dia_biff_geldeintreiben_info;
	important = TRUE;
	permanent = TRUE;
};


var int biff_labert_geldeintreiben;

func int dia_biff_geldeintreiben_condition()
{
	if((DJG_BIFF_SCGOLD < (Npc_HasItems(hero,itmi_gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void dia_biff_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Poèkej chvilku! Neøíkals, že pùlka koøisti patøí mnì? Dej to sem!
	b_biffsanteil_berechnung();
	b_biffsanteil_printscreen();
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"To si nemùžu dovolit.",dia_biff_geldeintreiben_zuteuer);
	Info_AddChoice(dia_biff_geldeintreiben,"Tady je tvùj podíl.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Tady je tvùj podíl.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Dobrá. Tak jdeme.
	AI_StopProcessInfos(self);
	b_giveinvitems(other,self,itmi_gold,BIFFSANTEIL);
	b_biff_setrefusetalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};

func void dia_biff_geldeintreiben_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//To si nemùžu dovolit.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Pøestaò do mì huèet. Dohodli jsme se na polovinì.
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Teï se musíme rozdìlit, je mi líto.",dia_biff_geldeintreiben_zuteuer_trennen);
	Info_AddChoice(dia_biff_geldeintreiben,"Tady je tvùj podíl.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_zuteuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//Teï se musíme rozdìlit, je mi líto.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Když to øíkáš. Tak to si prostì vezmu svùj podíl.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_ICHBLEIBHIER(C_INFO)
{
	npc = djg_713_biff;
	nr = 6;
	condition = dia_biff_ichbleibhier_condition;
	information = dia_biff_ichbleibhier_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_ichbleibhier_condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(swampdragon) == FALSE) && (swampdragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(rockdragon) == FALSE) && (rockdragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(firedragon) == FALSE) && (firedragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(icedragon) == FALSE) && (icedragon.flags != 0))) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void dia_biff_ichbleibhier_info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Tohle je vážnì nebezpeèná oblast. Bìž dopøedu. Budu ti krejt záda.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_BIFF_STAY = TRUE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_STAY_AWAYFROMOC(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_stay_awayfromoc_condition;
	information = dia_biff_stay_awayfromoc_info;
	nr = 3;
	permanent = TRUE;
	description = "(Opìt vzít Biffa s sebou.)";
};


func int dia_biff_stay_awayfromoc_condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 500) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 500)) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_stay_awayfromoc_info()
{
	b_kommmit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_BIFF_STAY = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_KOHLEWEGGEBEN(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_kohleweggeben_condition;
	information = dia_biff_kohleweggeben_info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_kohleweggeben_condition()
{
	if((DJG_BIFF_SCGOLD > Npc_HasItems(hero,itmi_gold)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
	};
};

func void dia_biff_kohleweggeben_info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Nerozházej to všechno najednou
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Tak to bude lepší, když ho dáš mnì.
	AI_StopProcessInfos(self);
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_BIFFLOSWERDEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 11;
	condition = dia_biff_biffloswerden_condition;
	information = dia_biff_biffloswerden_info;
	permanent = TRUE;
	description = "Mám dojem, že tady by naše spolupráce mìla skonèit.";
};


func int dia_biff_biffloswerden_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_biffloswerden_info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//Mám dojem, že tady by naše spolupráce mìla skonèit.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Jak je libo. Taky bych mìl zaèít myslet na lepší vìci. Tak zatím.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_MEHRGELD(C_INFO)
{
	npc = djg_713_biff;
	nr = 12;
	condition = dia_biff_mehrgeld_condition;
	information = dia_biff_mehrgeld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_mehrgeld_condition()
{
	if((DJG_BIFFPARTY == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};


var int dia_biff_mehrgeld_info_onetime;

func void dia_biff_mehrgeld_info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//Zaèínám mít dojem, že bych z tebe mohl dostat víc penìz.
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 zlatých by to mìlo spravit.
		if(dia_biff_mehrgeld_info_onetime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Žádnej problém. Jasnì, že jsem nezapomnìl, že si máme rozdìlit koøist.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//Proto jsem tì taky tak èasto otravoval, abys mi dal víc penìz.
			dia_biff_mehrgeld_info_onetime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Chci dalších 100 zlatých.
	};
	Info_ClearChoices(dia_biff_mehrgeld);
	Info_AddChoice(dia_biff_mehrgeld,"To si nemùžu dovolit.",dia_biff_mehrgeld_zuteuer);
	Info_AddChoice(dia_biff_mehrgeld,"Dobrá. Za to mi ještì stojíš.",dia_biff_mehrgeld_ok);
};

func void dia_biff_mehrgeld_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Dobrá. Za to mi ještì stojíš.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Dá se to tak øíct. Tak jdeme.
		AI_StopProcessInfos(self);
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		};
		b_biff_setrefusetalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//Ty mizernej bøídile, nemùžeš ani zaplatit poøádnýho ozbrojence.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//Mám dojem, že si najdu jinýho obchodního partnera.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_BIFF_HALBEHALBE = FALSE;
		DJG_BIFFPARTY = FALSE;
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
	};
};

func void dia_biff_mehrgeld_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//To si nemùžu dovolit.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Tak to si teïka dál šlapej sám.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
};


instance DIA_BIFF_HEILUNG(C_INFO)
{
	npc = djg_713_biff;
	nr = 4;
	condition = dia_biff_heilung_condition;
	information = dia_biff_heilung_info;
	permanent = TRUE;
	description = "Nepotøebuješ nìjaký léèivý lektvar?";
};


func int dia_biff_heilung_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_heilung_info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Nepotøebuješ nìjaký léèivý lektvar?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Jasnì. To nemùže bejt na škodu.
	Info_ClearChoices(dia_biff_heilung);
	Info_AddChoice(dia_biff_heilung,"Dám ti nìjaký pozdìji.",dia_biff_heilung_spaeter);
	Info_AddChoice(dia_biff_heilung,"(Nejslabší léèivý lektvar.)",dia_biff_heilung_heiltranklow);
	Info_AddChoice(dia_biff_heilung,"(Nejlepší léèivý lektvar.)",dia_biff_heilung_heiltrank);
};

func void dia_biff_heilung_heiltrank()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//Hádám, že si budu muset poèkat, dokud pro mì nìjaký nebudeš mít.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltranklow()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//Bohužel, žádný zrovna nemáš. Ještì se tu pozdìji pro nìjaký zastavím.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//Dám ti nìjaký pozdìji.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Ale nezapomeò.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DRACHENTOT(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_drachentot_condition;
	information = dia_biff_drachentot_info;
	description = "Tak, a je to. Všichni draci jsou mrtví.";
};


func int dia_biff_drachentot_condition()
{
	if(DJG_BIFFSURVIVEDLASTDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_drachentot_info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//Tak, a je to. Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Jo. A já jsem poøád tady.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Jseš si jistej, že tohle byl poslední?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//Myslím, že jo.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//To je špatný. Právì jsem se rozehøál.
	b_giveplayerxp(XP_BIFFSURVIVEDLASTDRAGON);
};


instance DIA_BIFF_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_713_biff;
	nr = 2;
	condition = dia_biff_knowwhereenemy_condition;
	information = dia_biff_knowwhereenemy_info;
	permanent = TRUE;
	description = "Nemìl bys chu na menší výlet kolem svìta?";
};


func int dia_biff_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BIFF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Nemìl bys chu na menší výlet kolem svìta?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Co?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Zapomeò na to. Stejnì už mám plnou loï.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Pøestaò si ze mì utahovat, chlape.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Chystám se opustit Khorinis a vyrazit na ostrov, abych se tam poohlédl po nìjakých nových protivnících.
		Info_ClearChoices(dia_biff_knowwhereenemy);
		Info_AddChoice(dia_biff_knowwhereenemy,"Prostì jsem si myslel, že bych se o tom mìl zmínit.",dia_biff_knowwhereenemy_no);
		Info_AddChoice(dia_biff_knowwhereenemy,"Nechceš jít taky?",dia_biff_knowwhereenemy_yes);
	};
};

func void dia_biff_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Nechceš jít taky?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Další nepøátelé mì neberou. Chci...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Tam, kam jedeme, bude víc zlata, než uneseš.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//Když je to tak, tak to jsem pro. Kam jedeme?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Ale nejdøív tì musíme dostat pryè z Hornického údolí.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//Žádný problém. Dostanu se odsud. Potkáme se v prùsmyku.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Biff se ke mnì pøi vidinì nesmírného bohatství pøidal. Pokud mu poskytnu dost zlata, mohu s ním poèítat.");
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BIFF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	BIFF_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(dia_biff_knowwhereenemy);
};

func void dia_biff_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Prostì jsem si myslel, že bych se o tom mìl zmínit.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Dobrá, dobrá, tak hodnì štìstí.
	BIFF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_biff_knowwhereenemy);
};


instance DIA_BIFF_PASS(C_INFO)
{
	npc = djg_713_biff;
	nr = 55;
	condition = dia_biff_pass_condition;
	information = dia_biff_pass_info;
	permanent = TRUE;
	description = "Dostaneš se pøes prùsmyk?";
};


func int dia_biff_pass_condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (BIFF_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_biff_pass_info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Dostaneš se pøes prùsmyk?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Pøestaò žvanit. Pokraèuj. Chci už to koneènì mít za sebou.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff;
	nr = 900;
	condition = dia_biff_pickpocket_condition;
	information = dia_biff_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_pickpocket_condition()
{
	return c_beklauen(92,320);
};

func void dia_biff_pickpocket_info()
{
	Info_ClearChoices(dia_biff_pickpocket);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_BACK,dia_biff_pickpocket_back);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_PICKPOCKET,dia_biff_pickpocket_doit);
};

func void dia_biff_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_pickpocket);
};

func void dia_biff_pickpocket_back()
{
	Info_ClearChoices(dia_biff_pickpocket);
};

