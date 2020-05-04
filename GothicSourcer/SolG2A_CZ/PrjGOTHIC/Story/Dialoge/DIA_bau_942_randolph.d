
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "Je všechno v poøádku?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Je všechno v poøádku?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmm... jakmile tu øekne nìkdo nìco špatnì, zaène tanec... Take si dávej pozor na jazyk, jinak se taky nemusíš doít zítøejšího rána.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Budeš taky bojovat?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Nebudu tady jenom stát a civìt, a se nìco semele. Ale nehodlám ani nic zaèínat.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akilùv statek ohroují oldnéøi.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Je všechno v poøádku?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Je všechno v poøádku?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Teï, kdy Kati a Akil odešli do Innosovy øíše, asi zaènu hospodaøit.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Ano, je mi dobøe. Ten Alvares byl poslední dobou stále drzejší a drzejší. Dobøe, e u je to za námi.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//Co bych zrovna teï potøeboval, je poøádnej odvaz v hospodì.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Poslal mì Baltram. Mám tu pro nìj vyzvednou nìjakı balík.";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Poslal mì Baltram. Mám tu pro nìj vyzvednou nìjakı balík.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Fajn. U jsem všechno pøipravil. Tady je tvùj balík.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "Ty nejsi zdejší, viï?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Ty nejsi zdejší, viï?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Pocházím z jiních ostrovù. Øíkalo se, e tady v Korinidu budou zapotøebí lidi kvùli magické rudì.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Ale kdy jsem se sem dostal, mìli tady obrovskou bariéru. A mnì se tam zrovna nechtìlo. Tak jsem zaèal pracovat v pøístavu.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//No, pak pøestaly lodì vydìlávat, tak jsem šel pracovat pro Akila. U jsem dìlal horší vìci, vánì.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "Ty jsi vysedával v hospodì?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Ty jsi vysedával v hospodì?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//Jo, pøesnì tak. Ale teï u ne.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//U si to nemùu dovolit.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "Co se vlastnì v té hospodì dìje?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//Co se vlastnì v té hospodì dìje?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Hraje se tam.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Ti chlápkové tam soutìej kadej s kadım. Kdo vydrí nejvíc piv, vyhrál.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//Nakonec jsem nedìlal nic jiného ne prohrával, a teï potøebuju vydìlat nìco penìz.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"V hospodì se uzavírají sázky.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "Proti komu jsi hrál?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Proti komu jsi hrál?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Proti Rukharovi, tomu starımu budiknièemovi. Co vím, pokadı mì porazil.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Ale mám takovı nejasnı tušení, e mi ten mizernej hajzl vdycky øíznul pivo ginem.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Nejspíš ho má schovanej ve svı truhle. Ten všiváckej zkurvysyn!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Nìkdo by mu do tı jeho truhly mìl nastrèit èistou vodu. Pak by toho mohl do piva pøidávat, kolik by chtìl.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Kdybych tak mìl dost penìz, abych si to s ním mohl rozdat ještì jednou.
	b_logentry(TOPIC_WETTSAUFEN,"Randolph mi vyprávìl o Rukharovi a o soutìi v pití a také o tom, e u nemìl dost penìz, aby s Rukharem zmìøil síly ještì jednou.");
	b_logentry(TOPIC_WETTSAUFEN,"Randolph se domnívá, e Rukhar pøi souboji v pití podvádìl. Rád by mu v truhlici vymìnil jednu láhev ginu za láhev vody.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "Kolik na tu soutì potøebuješ?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Kolik na tu soutì potøebuješ?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 zlatıch.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "Dám ti ty peníze, aby sis to mohl rozdat s Rukharem.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Dám ti ty peníze, aby sis to mohl rozdat s Rukharem.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(nadšenì) Fakt? Díky moc. Brzo ti to vrátím.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Kdy vyhraju, vyklopím ještì o trochu víc, ne jsi mi dal. Ještì se uvidíme.
		b_logentry(TOPIC_WETTSAUFEN,"U jsem si vsadil a teï se na to podívám.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//To je v poøádku. Nemáš dost ani pro sebe.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "Kocovina?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Kocovina?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Pøímo matka všech kocovin. A já jí nemùu zbavit. U nebudu chlastat, pøísahám.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Tvoje peníze jsou fuè. Je mi líto.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Ani nápad. Je mi fajn, vánì.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//Tak to tentokrát koneènì vyšlo. Ještì jednou dík za peníze. Tady, vezmi si je zpátky.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Vypadá to, e Rukhar nevstane zrovna brzo.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "Jsi v poøádku?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Jsi v poøádku?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Posíláš mì tam bez jedinı zlatky a vùbec se neobtìuješ mi øíct, e to je tak drahı?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta po mnì chce 300 zlatıch.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Nemùu ti dát víc ne 150 zlatıch. Prosím, musíš mi pomoct. Prosím.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Jsem vánì na dnì. I kdybych pøestal pít, zabije mì absák. Vánì potøebuju pomoct.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Je tu jeden zpùsob, jak bys mi mohl pomoct.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, ta stará bylinkáøka, to pro mì pøipravuje. Ale nemyslím si, e bych to mohl dokázat, kdy je teï v okolí tolik skøetù.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Randolph prı nechal pití a poslal mì za bylinkáøkou Sagittou, aby mu dala nìco na jeho abstinenèní pøíznaky.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Ještì poøád se mi trochu pletou nohy, ale jinak jsem v pohodì.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "Chlast ti nalezl do hlavy, co?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Chlast ti nalezl do hlavy, co?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//U si nedám ani panáka. Ne v tomhle ivotì. To se mùeš vsadit, chlape.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Tady. To by mìlo zmírnit abstinenèní pøíznaky.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Tady. To by mìlo zmírnit abstinenèní pøíznaky.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Ach! Díky, chlape. Teï si zase budu moct odpoèinout.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Jak se ti za to budu moct kdy odvdìèit?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Hádám, e tìchhle pár mincí je dobrejch akorát k tomu, abych si zachoval tváø. Ale to je všechno, je mi líto.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Zaplatil jsem za tebe spoustu penìz a tìch tvejch pár ušmudlanejch mincí nestaèí ani na pokrytí mejch nákladù.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Fajn - v tom pøípadì mùu mluvit o štìstí, e jsem potkal tak vstøícného paladina, nemyslíš?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};

