
instance DIA_GEROLD_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_exit_condition;
	information = dia_gerold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_gerold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_HALLO(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_hallo_condition;
	information = dia_gerold_hallo_info;
	permanent = FALSE;
	description = "Co to hlídáš?";
};


func int dia_gerold_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gerold_hallo_info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//Co to hlídáš?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//Vìznì.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//A kdo to je?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//Pár trestancù a oldnéø jménem Gorn. Tuhı chlapík - je silnı jako bık.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Potøebovali jsme ètyøi chlapy, abychom ho mohli dát pod zámek.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "Pustíš mì do vìzení?";
};


func int dia_gerold_jail_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_jail_info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Pustíš mì do vìzení?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Ne. NIKDO do vìzení nesmí. To platí pro KADÉHO. Pro tebe, pro Miltena a pro všechny ostatní.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//Tohle není ádná hospoda, kam bys mohl vcházet a vycházet podle libosti. Pamatuj si to.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "Nemùeš pro mì udìlat vıjimku?";
};


func int dia_gerold_ausnahme_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_ausnahme_info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Nemùeš pro mì udìlat vıjimku?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Ne.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "A co kdy ti dobøe zaplatím?";
};


func int dia_gerold_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_gold_info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//A co kdy ti dobøe zaplatím?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... hm...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Ne.
};


instance DIA_GEROLD_DEAL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_deal_condition;
	information = dia_gerold_deal_info;
	permanent = FALSE;
	description = "Mám tady vzkaz pro jednoho z vìzòù. Mùeš mu ho pøedat?";
};


func int dia_gerold_deal_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_deal_info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//Mám tady vzkaz pro jednoho z vìzòù. Mùeš mu ho pøedat?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hm... v zásadì nevidím jedinı dùvod, proè ne. Pro koho je ten vzkaz?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Pro Gorna.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//Velice dùleitı vìzeò. Nemyslím, e by s tím Garond souhlasil. Ale pokud to je pro tebe tak podstatné, jsem si jist, e se nìjak dohodneme.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Co chceš?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Naše pøídìly jídla se vıraznì sníily. Rád bych se pro zmìnu jednou poøádnì najedl.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Pøines mi nìjakou slušnou klobásku a èerstvı krajíc chleba - a trochu sladkého medu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//A k tomu ještì láhev vína... Jo, to by mìlo staèit. Urèitì se ti to podaøí. Vra se, a to budeš mít.
	b_logentry(TOPIC_RESCUEGORN,"Pokud Geroldovi pøinesu klobásu, chléb, víno a med, pøedá Gornovi zprávu.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "Nìco pro tebe mám...";
};


var int dia_gerold_stuff_permanent;

func int dia_gerold_stuff_condition()
{
	if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_stuff_info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//Nìco pro tebe mám. Jídlo, které jsi chtìl.
	if((Npc_HasItems(other,itfo_honey) >= 1) && (Npc_HasItems(other,itfo_bread) >= 1) && (Npc_HasItems(other,itfo_wine) >= 1) && (Npc_HasItems(other,itfo_sausage) >= 1))
	{
		AI_PrintScreen("Honig gegeben",-1,34,FONT_SCREENSMALL,2);
		AI_PrintScreen("Brot gegeben",-1,37,FONT_SCREENSMALL,2);
		AI_PrintScreen("Wein gegeben",-1,40,FONT_SCREENSMALL,2);
		AI_PrintScreen("Wurst gegeben",-1,43,FONT_SCREENSMALL,2);
		Npc_RemoveInvItems(other,itfo_honey,1);
		Npc_RemoveInvItems(other,itfo_bread,1);
		Npc_RemoveInvItems(other,itfo_wine,1);
		Npc_RemoveInvItems(other,itfo_sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Dobrá, dej mi ten dlabanec. Máš ten vzkaz?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Ano, tady. Nezapomeò, je to pro Gorna.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Vra se zítra, tou dobou u bude ten vzkaz mít.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gerold dostal, co chtìl, a teï pøedá zprávu pøíslušnému adresátovi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Vra se, a budeš mít vìci, které jsem chtìl.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "Dostal Gorn ten vzkaz?";
};


var int dia_gerold_antwort_permanent;

func int dia_gerold_antwort_condition()
{
	if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_antwort_info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Dostal Gorn ten vzkaz?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Ano, a mám ti od nìj vyøídit tohle:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//A?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//Je to u jiní brány.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Øíkal ještì nìco?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Ne. Netuším, co to mìlo znamenat. Ty to víš?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Moná. Ale radši bys o tom nemìl moc pøemıšlet.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Ano, to asi bude lepší.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gorn tvrdí, e jeho zlato najdu u jiní brány.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Ne, ještì ne. Vra se pozdìji.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_setgornfree_condition;
	information = dia_gerold_setgornfree_info;
	permanent = FALSE;
	description = "Propus Gorna na svobodu. Je to rozkaz od velitele Garonda.";
};


func int dia_gerold_setgornfree_condition()
{
	if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gerold_setgornfree_info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Propus Gorna na svobodu. Je to rozkaz od velitele Garonda.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//U o tom vím. Tady máš klíè, mùeš dovnitø.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Gerold mi svìøil klíè od vìznice.");
};


instance DIA_GEROLD_PERM(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_perm_condition;
	information = dia_gerold_perm_info;
	permanent = TRUE;
	description = "To nikdy nespíš?";
};


func int dia_gerold_perm_condition()
{
	if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
	{
		return TRUE;
	};
};

func void dia_gerold_perm_info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//To nikdy nespíš?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Ne. Innos sám mi dal sílu, abych nikdy nepotøeboval odpoèinek.
};


instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap4_exit_condition;
	information = dia_gerold_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
	npc = pal_261_gerold;
	nr = 30;
	condition = dia_gerold_kap4_allesruhig_condition;
	information = dia_gerold_kap4_allesruhig_info;
	description = "Všechno v poøádku?";
};


func int dia_gerold_kap4_allesruhig_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_allesruhig_info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//Všechno v poøádku?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//V poøádku, ano.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Ale?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//Pupek mi drhne o páteø, chlape. Garond zase zmenšil pøídìly jídla.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Jestli nedostanu do chøtánu nìjakı slušnı dlabanec, zahryznu se do té Garondovy tlusté... zadku.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"To není mùj problém.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Moná bych ti mohl nìco dát.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Moná bych ti mohl nìco dát.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Zbláznil ses? Tady v ádném pøípadì. Kdyby to vidìli ostatní, budu mít hned tunu novıch pøátel, jestli chápeš, co tím chci øíct.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//A pùjdou všichni spát, najdeš mì v mágovì svatyni.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Rychle, pojï za mnou do mágovy svatynì, ne se ostatní vyhrabou. Nechce se mi èekat do zítøka.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//V tuhle dobu tam stejnì nikdo nebıvá. Poèkám tam na tebe.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Ale neukazuj se tam se suchım chlebem a syrovou flaksou masa, jasnı?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"Garond opìt omezil pøídìly potravin. Radši bych mìl Geroldovi dát nìco k jídlu, nebo z hladu vyvede nìjakou hroznou pitomost. ");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//To není mùj problém.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//Mùeš mluvit. Tobì Garond urèitì pøídìl nesníí.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//I kdy by to neuznal, má strachy staenı zadek a v tobì vidí jedinou spásu.
	AI_StopProcessInfos(self);
};


var int gerold_foodcounter;

instance DIA_GEROLD_FOOD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 31;
	condition = dia_gerold_food_condition;
	information = dia_gerold_food_info;
	important = TRUE;
};


func int dia_gerold_food_condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_gerold_morefood()
{
	Info_ClearChoices(dia_gerold_food);
	if(GEROLD_FOODCOUNTER > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//To staèí. To staèí. S tím na chvíli vystaèím.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Tady máš peníze. Tady si za nì stejnì nic nekoupím, take si je klidnì vezmi.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//U bych asi mìl jít, ne si nás nìkdo všimne.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
		b_giveplayerxp(XP_GEROLDGIVEFOOD);
		CreateInvItems(self,itmi_gold,450);
		b_giveinvitems(self,other,itmi_gold,450);
	}
	else
	{
		if(GEROLD_FOODCOUNTER == 0)
		{
			Info_AddChoice(dia_gerold_food,"Teï momentálnì nic nemám.",dia_gerold_food_nichts);
		}
		else
		{
			Info_AddChoice(dia_gerold_food,"To je všechno, co mám.",dia_gerold_food_kaese_nichtmehr);
			if(GEROLD_FOODCOUNTER < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Jasan. Dej to sem. Máš ještì další?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Jo. Víc, víc!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(Dát mu polévku.)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(Dát mu maso.)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(Dát mu šunku.)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"(Dát mu sır.)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"(Dát mu klobásu.)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Tady máš. Take co? Máš pro mì nìco k jídlu?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Teï momentálnì nic nemám.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Nejdøív kolem toho dìláš takovı humbuk a nakonec mì chceš podvést?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_gerold_food_kaese_nichtmehr()
{
	var int xp_geroldgivefoodlow;
	var int teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//To je všechno, co mám.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//A tomu mám vìøit? No dobrá, lepší nìco ne nic. Tady máš pár zlaákù.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//No. Mìl bych se vrátit na svoje místo.
	AI_StopProcessInfos(self);
	if(GEROLD_FOODCOUNTER < 4)
	{
		teiler = 3;
	}
	else
	{
		teiler = 2;
	};
	xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
	b_giveplayerxp(xp_geroldgivefoodlow);
};

func void dia_gerold_food_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//Co takhle pìknı špalík sıra?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//Kus klobásy?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//Mùu ti dát tuhle šunku.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Flák masa?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Dobrá polévka by se šikla, ne?
	if(b_giveinvitems(other,self,itfo_fishsoup,1))
	{
	}
	else
	{
		b_giveinvitems(other,self,itfo_stew,1);
	};
	dia_gerold_morefood();
};


instance DIA_GEROLD_PERM4(C_INFO)
{
	npc = pal_261_gerold;
	nr = 41;
	condition = dia_gerold_perm4_condition;
	information = dia_gerold_perm4_info;
	permanent = TRUE;
	description = "Ještì máš hlad?";
};


func int dia_gerold_perm4_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
	{
		return TRUE;
	};
};

func void dia_gerold_perm4_info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Ještì máš hlad?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Pokud skøeti znovu zaútoèí, nepomùe mi ani plné bøicho.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//To si dìláš srandu. U jsem plnı. Ještì jednou dìkuju.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Hm. Ale i tak ti dìkuju.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//Je to v poøádku, mistøe.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap5_exit_condition;
	information = dia_gerold_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gerold_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap6_exit_condition;
	information = dia_gerold_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_gerold_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_pickpocket_condition;
	information = dia_gerold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_gerold_pickpocket_condition()
{
	return c_beklauen(71,170);
};

func void dia_gerold_pickpocket_info()
{
	Info_ClearChoices(dia_gerold_pickpocket);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};

func void dia_gerold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gerold_pickpocket);
};

func void dia_gerold_pickpocket_back()
{
	Info_ClearChoices(dia_gerold_pickpocket);
};

