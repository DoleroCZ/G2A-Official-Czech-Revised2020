
instance DIA_AKIL_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_exit_condition;
	information = dia_akil_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_akil_exit_info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Už musím jít.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nenech se zdržovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Tak zatím. Rád bych pro tebe udìlal nìco víc.
	};
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_HALLO(C_INFO)
{
	npc = bau_940_akil;
	nr = 4;
	condition = dia_akil_hallo_condition;
	information = dia_akil_hallo_info;
	permanent = FALSE;
	description = "Nìjaké problémy?";
};


func int dia_akil_hallo_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_hallo_info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Nìjaké problémy?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(potí se)... Eh... ne, ne... Všechno v poøádku. (nervóznì) Bylo... bylo by lepší, kdybys hned odešel.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Jsi si jistý?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Eh... jo, jo... všechno je dobrý. Ty... eh... Já... teï s tebou nemùžu mluvit.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akilùv statek ohrožují žoldáci.");
	AKILS_SLDSTILLTHERE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NICHTJETZT(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_nichtjetzt_condition;
	information = dia_akil_nichtjetzt_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_akil_nichtjetzt_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
	{
		return TRUE;
	};
};

func void dia_akil_nichtjetzt_info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Eh... teï ne, teï s tebou nemùžu mluvit.
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NACHKAMPF(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_akil_nachkampf_condition;
	information = dia_akil_nachkampf_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_akil_nachkampf_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_nachkampf_info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Díky Innosovi. Už jsem si myslel, že je se mnou konec.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Jmenuju se Akil. Obdìlávám tenhle skromnej kousek pùdy.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kdo byli ti lidé?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Ty bys je mìl znát. Byli to žoldnéøi z Onarovy farmy. Jako ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//To byli žoldáci z Onarovy farmy. Ti bastardi neznají nic než vraždìní a rabování.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Obával jsem se nejhoršího.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(hluboký povzdech)... Dobrá, díky Innosovi, žes nepøišel pozdì. Øekni mi, proè jsi to pro mì udìlal?
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"Jen tak. Prostì abys to pøeèkal ve zdraví.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"Co takhle trochu zlata?",dia_akil_nachkampf_gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
	{
		Npc_ExchangeRoutine(kati,"Start");
		AI_ContinueRoutine(kati);
		kati.flags = 0;
	};
	if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
	{
		Npc_ExchangeRoutine(randolph,"Start");
		AI_ContinueRoutine(randolph);
		randolph.flags = 0;
	};
	TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_akil_nachkampf_ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Jen tak. Prostì abys to pøeèkal ve zdraví.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Takoví chlapi se už jen tak nevidí. A tì na tvých cestách Innos provází.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Co takhle trochu zlata?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Je mi líto, ale asi tì zklamu - jsme jen chudí farmáøi. Je to tak akorát pro skromné živobytí.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Všechno, co ti mùžu nabídnout, je nìco k jídlu. Zajdi za Kati, a se o tebe postará.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
	Info_ClearChoices(dia_akil_nachkampf);
	KATI_MAHLZEIT = TRUE;
};


instance DIA_AKIL_SOELDNER(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_soeldner_condition;
	information = dia_akil_soeldner_info;
	permanent = FALSE;
	description = "Co po tobì ti žoldáci chtìli?";
};


func int dia_akil_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf))
	{
		return TRUE;
	};
};

func void dia_akil_soeldner_info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Co po tobì ti žoldáci chtìli?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Ty si ze mì utahuješ. Chtìli ode mì vybrat nájem.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Ty to nevíš? Najal je Onar, ten velkostatkáø. Hlídají jeho farmu a vybírají pro nìj renty.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znamená, že chodí od farmy k farmì a berou si vše, co se jim líbí. A jediné, èím platí, je chu jejich oceli.
	};
};


instance DIA_ADDON_AKIL_MISSINGPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_missingpeople_condition;
	information = dia_addon_akil_missingpeople_info;
	description = "Slyšels nìco o mizejících lidech?";
};


func int dia_addon_akil_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_akil_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Slyšels nìco o mizejících obyvatelích?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Ty jsi ale vtipálek. Jestli slyšel? Nìkolik mých vlastních lidí se ztratilo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Tonak a Tabor pracovali na mých polích ještì pøed 3 dny.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//A vím jistì, že by farmu neopustili beze slova.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Nicménì zmizeli a nikdo mi neøekel, co se stalo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Pokud najdeš alespoò nìjaké znamení, že žijí, tak mi to pøijï øíct. Pøijdeš, že?
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Farmáø Akil postrádá své dva lidi : Tonaka a Telbora.");
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_RUNNING;
};


instance DIA_ADDON_AKIL_RETURNPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_returnpeople_condition;
	information = dia_addon_akil_returnpeople_info;
	permanent = FALSE;
	description = "O tìch farmáøích ...";
};


func int dia_addon_akil_returnpeople_condition()
{
	if((MIS_AKIL_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (MISSINGPEOPLERETURNEDHOME == TRUE) && ((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_akil_returnpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//O tìch farmáøích ...
	if((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Tys je pøivedl zpìt - ty jsi ale blázen.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Aspoò jeden pøežil pøechod.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Vezmi si toto zlato jako vyjádøení mých díkù
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveplayerxp(XP_AMBIENT);
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_SUCCESS;
};


instance DIA_AKIL_LIEFERUNG(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_lieferung_condition;
	information = dia_akil_lieferung_info;
	permanent = FALSE;
	description = "Poslal mì Baltram...";
};


func int dia_akil_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_akil_lieferung_info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Poslal mì Baltram. Mám tu pro nìj vyzvednout nìjaký balík.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Tak ty jsi teï jeho nový poslíèek. Fajn, už jsem to pøipravil.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"Získal jsem tu zásilku. Teï už ji mohu pøinést Baltramovi.");
	b_logentry(TOPIC_NAGUR,"Získal jsem tu zásilku. Teï už ji mohu pøinést Nagurovi.");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "Urèitì se tady kolem vyznáš.";
};


func int dia_akil_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int knows_taverne;

func void dia_akil_gegend_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Urèitì se tady kolem vyznáš.
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Jasnì, co potøebuješ vìdìt?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "Kde najdu Onarovu farmu?";
};


func int dia_akil_hof_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_hof_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Kde najdu Onarovu farmu?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Staèí se vrátit ke kamenným schodùm a jít po cestì na východ.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Stejnou cestou se dostaneš i do krèmy. Odsud pùjdeš dál na východ, dokud nedorazíš k obrovským lánùm. To je místo, kde se poflakují žoldáci.
	KNOWS_TAVERNE = TRUE;
};


instance DIA_AKIL_TAVERNE(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_taverne_condition;
	information = dia_akil_taverne_info;
	permanent = FALSE;
	description = "Co je to za krèmu na východ odsud?";
};


func int dia_akil_taverne_condition()
{
	if(KNOWS_TAVERNE == TRUE)
	{
		return TRUE;
	};
};

func void dia_akil_taverne_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Co je to za krèmu na východ odsud?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zeptej se Randolpha. Ví o tom víc než já. Nìkolikrát se tam stavil.
};


instance DIA_AKIL_WALD(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_wald_condition;
	information = dia_akil_wald_info;
	permanent = FALSE;
	description = "Co je v tìch lesích za farmou?";
};


func int dia_akil_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_wald_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Co je v tìch lesích za farmou?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Jenom nìjaký pøíšery - a vlci jsou z nich ti nejmíò nebezpeèný.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Taky se povídá, že tam má úkryt nìkolik banditù. No, ale už pìknì dlouho nechali moji farmu na pokoji.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "Stalo se ještì nìco?";
};


func int dia_akil_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_akil_perm_info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Stalo se ještì nìco?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Ne. Doufám, že ovce zùstanou tam, co jsou teï.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Moje ovce zmizely. Za chvíli nebudu mít co do úst.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Všude se objevují skøeti. Kdosi nìco øíkal o jejich základnì. Zeptej se na to farmáøe Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Taky tu spatøili spoustu ještìranù. Být tebou, do jeskyní bych vùbec nechodil.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Hledají tì zakuklenci v èerných kápích.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//No tak to je novinka.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Dobrá. Prostì jsem myslel, že bych se o tom mìl zmínit.
		};
	};
};


instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap3_exit_condition;
	information = dia_akil_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_akil_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdieb_condition;
	information = dia_akil_schafdieb_info;
	description = "Ještì nìjaký zprávy?";
};


func int dia_akil_schafdieb_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_akil_schafdieb_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Ještì nìjaký zprávy?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Poslední dobou mi poøád nìkdo krade ovce. Už celé noci jsem se poøádnì nevyspal.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"To není mùj problém.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"Kolik ovcí ti chybí?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"Kdo by to mohl dìlat?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"Akilovi nìkdo stále krade ovce. Domnívá se, že to mají na svìdomí banditi z jeskynì v nedalekém lese.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kdo by to mohl dìlat?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Tak to nemám ani tušení.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//Nìjaký fakt odporný chlápci se usadili v jeskyních za tím lesem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Nechce se mi vìøit, že by se živili jen bobulema. Jsem si skoro jistej, že oni jsou ten dùvod, proè se mi ztrácejí ovce.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Kolik ovcí ti chybí?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Teï se mi ztratily minimálnì tøi.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To není mùj problém.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Rozumím. Máš na práci jiné vìci.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "Našel jsem ty zlodìje ovcí.";
};


func int dia_akil_schafdiebeplatt_condition()
{
	if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
	{
		return TRUE;
	};
};

func void dia_akil_schafdiebeplatt_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Našel jsem ty zlodìje ovcí.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Mìl jsi pravdu. Dìlali to ti chlápci z lesní jeskynì. Už ti žádnou další ovci nevezmou.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Díky ti, šlechetný služebníku Innose.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Díky. Tak se pøece jen domobrana dokáže postarat o nás, malé farmáøe.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Díky. Vážnì jsi divnej žoldák. Vùbec ne jako ti ostatní, co znám.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Vezmi si tohle jako malé vyjádøení mých díkù za tvou nezištnou pomoc.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
	b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};


instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_akilsschaf_condition;
	information = dia_akil_akilsschaf_info;
	description = "(Vrátit Akilovi ovci.)";
};


func int dia_akil_akilsschaf_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
	{
		return TRUE;
	};
};

func void dia_akil_akilsschaf_info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Výbornì. Tady máš trochu zlata. Doufám, že to staèí.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
	follow_sheep_akil.wp = "NW_FARM2_OUT_02";
	follow_sheep_akil.start_aistate = zs_mm_allscheduler;
	b_giveplayerxp(XP_AKILSSCHAF);
};


instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap4_exit_condition;
	information = dia_akil_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_akil_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap5_exit_condition;
	information = dia_akil_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_akil_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap6_exit_condition;
	information = dia_akil_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_akil_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_PICKPOCKET(C_INFO)
{
	npc = bau_940_akil;
	nr = 900;
	condition = dia_akil_pickpocket_condition;
	information = dia_akil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_akil_pickpocket_condition()
{
	return c_beklauen(37,30);
};

func void dia_akil_pickpocket_info()
{
	Info_ClearChoices(dia_akil_pickpocket);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};

func void dia_akil_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_akil_pickpocket);
};

func void dia_akil_pickpocket_back()
{
	Info_ClearChoices(dia_akil_pickpocket);
};

