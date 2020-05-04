
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "Ty jsi tady farmáøem?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Ty jsi tady farmáøem?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Dalo by se to tak øíct, ale jsem jen nájemce.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Veškeré pozemky patøí velkostatkáøi.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "Jak si obstaráváš obživu?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Jak si obstaráváš obživu?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//Vìtšinou lovem a kácením stromù. Taky samozøejmì chováme ovce a obdìláváme pùdu.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar mi sem poslal všechny tyhle lidi a já je musím živit. A jen málo z nich umí vzít za práci, jak sis asi sám všiml.
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "Zamìstnáváš nádeníky?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zamìstnáváš nádeníky?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar vyhodil lidi, co mu na jeho farmì nebyli k nièemu.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Pak je poslal ke mnì. Dávám jim najíst a oni pro mì pracují.
};


instance DIA_ADDON_BENGAR_MISSINGPEOPLE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_missingpeople_condition;
	information = dia_addon_bengar_missingpeople_info;
	description = "Stalo se v poslední dobì nìco divného?";
};


func int dia_addon_bengar_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Stalo se v poslední dobì nìco divného?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//Vypadá to, že celkem dost vìcí.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Ale nejpodivnìjší z nich je záhadné zmizení Pardose.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//Je jeden z mých nejlepších farmáøù. Není ten typ, že by hodil ruèník do ringu a zmizel pøes noc, víš??
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Farmáø Bengar postrádá svého dìlníka Pardose.");
	MIS_BENGAR_BRINGMISSPEOPLEBACK = LOG_RUNNING;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_bengar_missingpeople);
	Info_AddChoice(dia_addon_bengar_missingpeople,DIALOG_BACK,dia_addon_bengar_missingpeople_back);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Nìjaké dùvody, které by ho vedly k útìku?",dia_addon_bengar_missingpeople_hint);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Možná toho tady mìl jenom dost.",dia_addon_bengar_missingpeople_voll);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Co je pøesnì tak zvláštního na jeho zmizení?",dia_addon_bengar_missingpeople_was);
};

func void dia_addon_bengar_missingpeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Co je pøesnì tak zvláštního na jeho zmizení?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos je starostlivý typ. Nikdy se nezatoulal dál, než jsou hranice mého pozemku.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Vzal by nohy na ramena, kdyby vidìl žravou štìnici plazit se jeho smìrem.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Ikdyž to nejsou pìkná stvoøení, nejsou vùbec nebezpeèná.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(zhnusenì) Dokonce jsem slyšel, že je nìkdo i jí. Odporné.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Zvykneš si na to.
};

func void dia_addon_bengar_missingpeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Možná toho tady mìl jenom dost.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Práce na poli byla pro nìho vším. Neumím si pøedstavit, že teï pracuje pro jiného farmáøe.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//Mohl si dìlat, co chtìl.
};

func void dia_addon_bengar_missingpeople_hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Nìjaké dùvody, které by ho vedly k útìku?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//Pøedpokládám, že ho sebrali banditi. Toulali se tu pár dní okolo.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//Jednou jsem vidìl, jak vzali obèana mìsta a táhli si ho do tábora.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//Vypadá to, jako by ho chtìli zotroèit..
	Info_AddChoice(dia_addon_bengar_missingpeople,"Kde je tábor banditù?",dia_addon_bengar_missingpeople_lager);
};


var int bengar_toldaboutrangerbandits;

func void dia_addon_bengar_missingpeople_lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//Kde je tábor banditù?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//Na konci mojeho pole jsou schody vedoucí dolù do malé kotliny. Tak tam se utáboøili.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//Rád bych se tam šel podívat a Pardose najít, ale nechci se zaplést s tìmi hrdloøezy.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//Na tvém místì bych se od nich držel dál. Nekladou otázky.
	BENGAR_TOLDABOUTRANGERBANDITS = TRUE;
};

func void dia_addon_bengar_missingpeople_back()
{
	Info_ClearChoices(dia_addon_bengar_missingpeople);
};


instance DIA_ADDON_BENGAR_RETURNPARDOS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_returnpardos_condition;
	information = dia_addon_bengar_returnpardos_info;
	description = "Už se Pardos vrátil?";
};


func int dia_addon_bengar_returnpardos_condition()
{
	if((MIS_BENGAR_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (Npc_GetDistToWP(pardos_nw,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_returnpardos_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Už se Pardos vrátil?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Ano, odpoèívá vevnitø. Díky za všechno ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Není zaè.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Poèkej, rád bych tì odmìnil, ale nemám toho dost ani pro sebe ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Zapomeò na to.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BENGAR_FERNANDOSWEAPONS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_fernandosweapons_condition;
	information = dia_addon_bengar_fernandosweapons_info;
	description = "Mìli banditi zbranì, když tudy naposledy šli?";
};


func int dia_addon_bengar_fernandosweapons_condition()
{
	if((BENGAR_TOLDABOUTRANGERBANDITS == TRUE) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Mìli banditi zbranì, když tudy naposledy šli?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//Co je to za blbou otázku? Už jsi nìkdy vidìl bandity beze zbraní?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Myslím velmi MNOHO zbraní. Nìco jako dodávka zbraní.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//Jo, pravda. Teï už vím. Mìli tìch zbraní spousty.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Nìkteré v sudech, jiné v balících na vozíku.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "Co si myslíš o Onarovi?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co si myslíš o Onarovi?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Je to nenažranej parchant, co nás nakonec všechny dostane na šibenici.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Jednou sem paladinové z mìsta dorazí a kvùli tomu bastardovi nás porubají.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale já nemám na výbìr. Domobrana si sem chodí jen, aby si odnesla naše zboží, ale chránit nás ji ani nenapadne.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Kdybych zùstal vìrný mìstu, byl bych na to teï sám.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Když už nic jiného, Onar pošle pár svých žoldákù hned a pak, aby se podívali, jak jsme dopadli.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "Co máš proti královským vojskùm?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co máš proti královským vojskùm?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//To je pøece jasný. Od tý doby, co jsou paladinové ve mìstì, se nic nezlepšilo. Právì naopak.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Teï ti zatracení vojáci z domobrany pøicházejí na naše pozemky stále èastìji a kradou, co se jim zachce. A paladinové proti tomu nehnou ani prstem.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jediní paladinové, které jsem kdy vidìl, jsou ti dva strážci u prùsmyku.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Nehodlají hnout ani prstem, dokud nás domobrana všechny nepovraždí.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "Prùsmyk?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Prùsmyk?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Jo. Prùsmyk do starého Hornického údolí u vodopádù na druhém konci náhorních pastvin.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Zeptej se na to Malaka. Poslední týden má spoustu èasu.
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "Øeknìme, že se na ten váš problém s domobranou podívám.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Øeknìme, že se na ten váš problém s domobranou podívám.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? Øekl jsem Onarovi, že by mìl poslat pár ŽOLDÁKÙ.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//Je to pøíležitost, jak se pøesvìdèit o svých kvalitách.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Výbornì. Je ti jasné, co se mnou domobrana udìlá, když to spackáš?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Nemìl jsem dojem, že by sem teï chtìl nìkdo z nich pøijít.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//Už jsem o tom Onarovi øíkal pøed pár dny. Za co mu tu rentu teda platím?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ti bastardi sem chodí jednou do týdne a vybírají danì pro mìsto.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Je fajn, žes pøišel právì teï. V tuhle dobu obvykle pøicházejí.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Mìli by tu být každou chvíli.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "Je vás tu tolik. Proè se domobranì prostì nepostavíte sami?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Je vás tu tolik. Proè se domobranì prostì nepostavíte sami?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//Je pravda, že nás tu je jak psù. Ale nemáme výcvik na boj s domobranou.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "Jen a si teda domobrana dorazí, já už to s nimi vyøídím!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Jen a si teda domobrana dorazí, já už to s nimi vyøídím!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nemùžu se doèkat. Už pøicházejí. Øíkal jsem ti to.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Jen to nezpackej!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Tak dobrá, hodnì štìstí! Ukaž jim to.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "Váš problém s domobranou už je minulostí.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Váš problém s domobranou už je minulostí.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Jsi blázen? Víš, co mi ti chlapi udìlají, až odsud odejdeš?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Zùstávají poøád poblíž. Øekni jim, a odtáhnou ÚPLNÌ!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//To není špatné. Možná nám teï na konci mìsíce zbude nìco i pro obchod. Díky.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Dokonce jsi za mì chtìl zaplatit. To je od tebe velmi milé.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "Ovèák Balthazar na vaše pastviny nesmí?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Ovèák Balthazar na vaše pastviny nesmí?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//No, ano. To je tak. Øekl jsem Sekobovi, že by mi mìl platit, když chce své ovce pást na mých pozemcích.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//Abych øekl pravdu, chtìl jsem to jen proto, aby už sem nechodil. Nemùžu Balthazara vystát.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Mám-li pøesvìdèit Bengara, aby Balthazara pustil na své pastviny, musím mu uèinit laskavost. Urèitì se k tomu nìjaká pøíležitost naskytne.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "Domobrana je pryè a Balthazar mùže tvoji pastvinu znovu používat.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Domobrana je pryè a Balthazar mùže tvoji pastvinu znovu používat.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Proè?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(výhružnì) Protože jsem to øekl.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Mmh. Dobrá, jak chceš.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//A si najde místo pro svoje zvíøata nìkde mezi poli.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "Dávej na sebe pozor.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Dávej na sebe pozor.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty taky.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "Jak to vypadá?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak to vypadá?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak zmizel a vzal s sebou všechno a každého, kdo pro mì pracoval. Øíkal, že má namíøeno do hor.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Už to tu nemohl vydržet.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Èasy jsou zlé. Nevím, jak dlouho tu ještì vydržím.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Vytáèí mì, jak z prùsmyku teï proudí záplavy pøíšer, aby plundrovaly náhorní pastviny.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Kdybych tu tak alespoò mìl nìjakou pomoc do žoldákù.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//Jeden z nich se chystal, že pro mì bude pracovat. Asi zmìnil názor. Mám dojem, že se jmenoval "Wolf".
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"Bengar zùstal na svém statku docela sám. Jeho pøítel Malak zmizel a všichni ostatní odešli s ním. Podle Bengara se nejspíš uchýlili do hor.");
	b_logentry(TOPIC_BENGARALLEIN,"Jeho statek je teï úplnì nechránìný a potøebuje pomoc. Zmiòoval se o nìjakém žoldnéøi jménem Wolf. Copak já toho chlápka neznám?");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "Malak je mrtvý.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak je mrtvý.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Teï se všechno obrací k horšímu.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "Najal jsem ty žoldáky, které jsi chtìl.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Najal jsem ty žoldáky, které jsi chtìl.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nikdy jsem na své farmì nikoho podobného nemìl. Jen doufám, že to bude fungovat.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Tady, vezmi si tohle. Mám dojem, že se ti to bude hodit.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "Malak se vrátil.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak se vrátil.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Už bylo naèase. Myslel jsem, že už ho víckrát neuvidím.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "To bude v poøádku.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//To bude v poøádku.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak se sice vrátil, ale na situaci to moc nemìní.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Pokud se nestane nìjaký zázrak, všichni to tu odskáèeme.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wolf je divnej chlap, ale myslím, že to nìjak zvládneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka tu nic nefunguje. Jestli se brzy nìco nestane, vzdám se farmy.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Snad se brzy vrátí.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

