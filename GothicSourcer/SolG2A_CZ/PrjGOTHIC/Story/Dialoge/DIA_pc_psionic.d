
instance DIA_LESTER_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_exit_condition;
	information = dia_lester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_HELLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hello_condition;
	information = dia_lester_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lester_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hello_info()
{
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Opravdu! Chlape, ani netušíš, jak rád tì vidím!
	Info_ClearChoices(dia_lester_hello);
	Info_AddChoice(dia_lester_hello,"Mìl bych tì znát?",dia_lester_hello_youknowme);
	Info_AddChoice(dia_lester_hello,"Lestere! Jak ses sem dostal?",dia_lester_hello_lester);
};

func void dia_lester_hello_lester()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses sem dostal?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to šílenı útìk. Kdy bariéra vybuchla, chvíli jsem se naprosto zmatenì toulal po okolí.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Pak jsem se celé dny snail probojovat skrz tyhle lesy, a jsem koneènì našel tohle údolí.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou poøád v Hornickém údolí. Aspoò si to myslím.
};

func void dia_lester_hello_youknowme()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Mìl bych tì znát?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Haló? Je nìkdo doma? Riskoval jsem vlastní kùi, abys mohl dostat ten divnı kámen.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Nìco mi dluíš. TENTOKRÁT by sis to mìl pamatovat.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//Pamatuješ ještì na Diega, Miltena a Gorna?
	Info_AddChoice(dia_lester_hello,"Diego, Milten a KDO?",dia_lester_hello_whofourfriends);
	Info_AddChoice(dia_lester_hello,"Jasnì. Co je s nimi?",dia_lester_hello_knowfourfriends);
};

func void dia_lester_hello_knowfourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasnì. Co je s nimi?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud vím, tak znièení bariéry mìli pøeít.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nemám ponìtí, kde jdou teï - všichni tøi ještì nejspíš døepí nìkde v Hornickém údolí.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Kdybys na nì náhodou narazil, dej mi vìdìt.
};

func void dia_lester_hello_whofourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nesna se mi namluvit, e si na to nepamatuješ. Ty ohniskové kameny - ten trol - ta ohromná kupa rudy vodních mágù?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jist...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To pøijde. I mnì chvíli trvalo, ne jsem si to všechno v hlavì srovnal.
};


instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_whathappened_condition;
	information = dia_lester_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_lester_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_whathappened_info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//Co byl Spáè poraen, celé Bratrstvo ztratilo hlavu.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Bez vùdce byli jako prázdné skoøápky.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Já na tom byl úplnì stejnì. Mìl jsem noèní mùry a dokonce halucinace. Ale jakmile jsem zaèal více ménì pøemıšlet zase normálnì, utekl jsem.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zdálo, e vidím obrovskı èernı stín, jak vyrazil na skupinu uprchlíkù a spálil je na prach.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//V tu chvíli jsem si vánì myslel, e mì pøišel zabít drak.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Vidìl jsi ještì nìco?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Ne - vzal jsem nohy na ramena a utekl!
};


instance DIA_LESTER_MINECOLONY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_minecolony_condition;
	information = dia_lester_minecolony_info;
	permanent = FALSE;
	description = "Jak dlouho se u ukrıváš v tomhle údolí?";
};


func int dia_lester_minecolony_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_minecolony_info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Jak dlouho se u ukrıváš v tomhle údolí?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Pøesnì to nevím. Moná tıden. Ale napadá mì ještì jedna vìc:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Kdy jsem sem jednoho veèera pøišel, podíval jsem se na vrcholek hory - bylo tam jenom pár stromù.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//A kdy jsem se tam podíval druhı den ráno, stála tam vì. Pøísahal bych, e tam pøedtím nebyla. Od té doby jsem z údolí nevytáhl paty.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Myslíš Xardasovu vì? Vìdìl jsem, e je mocnı, ale vytvoøit vì jenom tak...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? To on ije v té vìi? Nevím, jestli se mi to dvakrát zamlouvá.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Uklidni se, byl to právì on, kdo mì zachránil ze Spáèova chrámu. Je na naší stranì.
};


instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_send_xardas_condition;
	information = dia_lester_send_xardas_info;
	permanent = FALSE;
	description = "Musíš øíct Xardasovi o tom stínu, mohlo by to bıt dùleité.";
};


func int dia_lester_send_xardas_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_whathappened) && Npc_KnowsInfo(other,dia_lester_minecolony) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_send_xardas_info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Musíš øíct Xardasovi o tom stínu, mohlo by to bıt dùleité.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Ty si nemyslíš, e to byl jen vıplod mojí pøedstavivosti? To jako e to doopravdy byl...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... drak. Ano.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Zase se do toho pouštíš po hlavì, e?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Neøekl bych, e po hlavì... ještì ne.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(povzdychne si) No dobrá, kdy je to tak dùleité, tak za ním pùjdu - ale ještì ne.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Teï si chci odpoèinout. Ještì poøád jsem úplnì vyèerpanı z toho útìku z trestanecké kolonie.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Øekl bych, e máš velké plány. Uvidíme se pozdìji u Xardase.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LESTER_STADT(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_stadt_condition;
	information = dia_addon_lester_stadt_info;
	description = "Jsem na cestì do Khorinisu! Co o tom mìstì víš?";
};


func int dia_addon_lester_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_stadt_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Jsem na cestì do Khorinisu! Co o tom mìstì víš?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Khorinis? Hm, je to pøístav. Nic zvláštního.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//Proè se ptáš?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Potøebuju si promluvit s paladiny, kteøí by mìli bıt ve mìstì.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(smìje se) To myslíš vánì? I kdyby ses u dostal do mìsta, tak k paladinùm nikdy.
};


instance DIA_ADDON_LESTER_VORSCHLAG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_vorschlag_condition;
	information = dia_addon_lester_vorschlag_info;
	description = "Máš nìjakı návrh, jak bych se mohl dostat do mìsta?";
};


func int dia_addon_lester_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lester_stadt) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Máš nìjakı návrh, jak bych se mohl dostat do mìsta?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Vlastnì ano. Nedávno jsem pracoval pro starého alchymistu Constantina.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Má ve mìstì urèitı vliv a naøídil stráím, aby pustili lidi, kteøí mu nesou vzácné byliny.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Ve skuteènosti to však není tak sloité. Jednoduše nasbíráš hrst bylin, které tu rostou všude kolem. A pak jednoduše pøedstíráš, e dìláš pro Constantina. Mìli by tì pustit.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Nicménì, ujisti se, e máš všechny druhy stejné. Ne jenom náhodnì sebrané. Stráe nejsou pøíliš bystøí a neví skoro nic o alchymii.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Take, trs, kterı obsahuje rostliny pouze jednoho druhy by je mìl zmást.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Hádal bych, e 10 bude staèit.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Díky za radu.
	Log_CreateTopic(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_PICKFORCONSTANTINO,"Lester si myslí, e bych se mohl dostat do mìsta, kdy stráím u brány ukáu 10 rostlin stejného druhu. Jen musím pøedstírat, e je nesu pro alchymistu Constantina.");
	MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_RUNNING;
};


instance DIA_ADDON_LESTER_PASSAGEPLANTSSUCCESS(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_addon_lester_passageplantssuccess_condition;
	information = dia_addon_lester_passageplantssuccess_info;
	description = "Ten 'trik' s rostlinami fungoval. Prošel jsem kolem stráí.";
};


func int dia_addon_lester_passageplantssuccess_condition()
{
	if(MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_lester_passageplantssuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Ten 'trik' s rostlinami fungoval. Prošel jsem kolem stráí.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//Jak øíkám. Víš, e poslouchat moje rady se vyplatí, kámo.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LESTER_PERM(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_perm_condition;
	information = dia_lester_perm_info;
	permanent = TRUE;
	description = "Co víš o tomhle místì?";
};


func int dia_lester_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void dia_lester_perm_info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Co víš o tomhle místì?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Kdy pùjdeš tudy dolù, dojdeš na farmu. O kousek dál u zaèíná mìsto.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Ale buï opatrnı. Nepotulují se tam jen vlci a krysy, ale také goblini a banditi!
};


instance DIA_LESTER_SLEEP(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_sleep_condition;
	information = dia_lester_sleep_info;
	permanent = TRUE;
	description = "Ještì poøád jsi unavenı?";
};


func int dia_lester_sleep_condition()
{
	if((KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void dia_lester_sleep_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Ještì poøád jsi unavenı?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//A jak. (zívne si) Øekl jsem Xardasovi všechno. Teï se na chvilku prospím. Tak den...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//... dva... moná déle.
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP3_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap3_exit_condition;
	information = dia_lester_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lester_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_BACKINTOWN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_backintown_condition;
	information = dia_lester_backintown_info;
	important = TRUE;
};


func int dia_lester_backintown_condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lester_backintown_info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//Hej, koneènì ses vrátil! Musíš jít okamitì za Xardasem, máme problém.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//Tak tomu naprosto vìøím.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//Co jsi odešel, propuklo naprosté peklo.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Promluv si s Xardasem, èeká na tebe!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//Xardas mi pro tebe dal tuhle runu. S její pomocí se k nìmu dostaneš rychleji. Setkáme se tam.
	CreateInvItems(self,itru_teleportxardas,1);
	b_giveinvitems(self,other,itru_teleportxardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LESTER_PERM3(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_lester_perm3_condition;
	information = dia_lester_perm3_info;
	permanent = TRUE;
	description = "Nevypadáš zrovna nadšenì.";
};


func int dia_lester_perm3_condition()
{
	if((KAPITEL >= 3) && (LESTER_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_lester_perm3_onetime;

func void dia_lester_perm3_info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Nevypadáš zrovna nadšenì.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_LESTER_PERM3_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//Taky moc nadšenı nejsem, chlape. Jsem úplnì vyøízenı a poøád mì bolí hlava.
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Pokadé, kdy se objeví ty èerné kápì, tak se to zhorší.
			if(SC_KNOWSMADPSI == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//A já ti mùu pøesnì øíct, proè to tak je.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Jo? Myslím, e to ani nechci vìdìt.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Ty èerné kápì - neboli Pátraèi, jak jim øíkáme my mágové - bıvali pøívrenci mocného arcidémona. Neøíká ti to nic?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Hmm. Ne. Leda e by ses mi snail naznaèit, e...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//Ano, pøesnì. Ti Pátraèi byli pøívrenci Spáèe. Odpadlická sekta pomatencù z tábora v bainách.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//Je to tvùj bıvalı lid, Lestere. Bıvalé Bratrstvo Spáèe. Teï z nich jsou pouzí bezduší pøisluhovaèi zla.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//Tušil jsem to, ale doufal jsem, e to není pravda. Chceš øíct, e se vrátil? Spáè je zpátky mezi námi?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Dobrá otázka. Jsem si jistı jenom tím, e musím Pátraèe zastavit døív, ne budou pøíliš mocní.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Nelíbí se mi to, ale asi máš pravdu. Je mi líto, ale tohle všechno mi zaèíná lézt na mozek.
				b_logentry(TOPIC_DEMENTOREN,"Má podezøení se potvrdila. Dokonce ani Lester u nepochybuje, e Pátraèi patøí ke Spáèovım pøisluhovaèùm ze starého tábora v bainách.");
				b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
				DIA_LESTER_PERM3_ONETIME = TRUE;
			};
		};
	}
	else if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//Bolest hlavy jen tak neustoupí, ale doufejme, e si jinak s tím problémem dokáeme brzy poradit.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//A tak nebo tak.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Ta bolest hlavy zaèíná bıt nesnesitelná. A teï na mì ještì poøád útoèí ti ještìrani. Musím se sám sebe ptát, odkud se berou.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Ta bolest hlavy nechce pøejít. Nìco se chystá.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(povzdechne si) Myslím, e si budu muset odpoèinout.
};


instance DIA_LESTER_KAP4_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap4_exit_condition;
	information = dia_lester_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lester_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP5_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap5_exit_condition;
	information = dia_lester_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_XARDASWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_xardasweg_condition;
	information = dia_lester_xardasweg_info;
	description = "Kde je Xardas?";
};


func int dia_lester_xardasweg_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_xardasweg_info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Kde je Xardas?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Je pryè a ve své vìi nechal ta démonická stvoøení.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Myslím, e nechce, aby po jeho vìi v jeho nepøítomnosti nìkdo slídil.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Kam šel?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//To neøíkal. Jenom mì poádal, abych ti pøedal tenhle dopis.
	CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
	b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Pøeèetl jsem si ho. Omlouvám se. Byl jsem zvìdavı.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//A?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//Nemám ponìtí, nerozumìl jsem ani slovu, chlape. Ale jedno mi je jasné: jen tak ho neuvidíme.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Asi mu zaèala hoøet zemì za patama, a tak se vydal do kopcù.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardas zmizel. Lester mi pouze pøedal dopis, kterı mi mág zanechal.");
};


instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_knowwhereenemy_condition;
	information = dia_lester_knowwhereenemy_info;
	permanent = TRUE;
	description = "Zjistil jsem, kde se ukrıvá nepøítel.";
};


func int dia_lester_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LESTER_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Zjistil jsem, kde se ukrıvá nepøítel.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Neptej se mì proè, ale mám pocit, e bych mìl jít s tebou.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Nedokáu to vysvìtlit, ale je mi jasné, e odpovìï se dozvím, jen kdy pùjdu s tebou.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Je mi líto, ale loï u je plná.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Moná je, moná je mùj osud bezvıznamnı v porovnání s vìcmi, které jsou pøed námi.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Sám musíš vìdìt, co bys mìl udìlat. Postav se zlu - se mnou si hlavu nelámej.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Nejsem nijak dùleitı.
	}
	else
	{
		Info_ClearChoices(dia_lester_knowwhereenemy);
		Info_AddChoice(dia_lester_knowwhereenemy,"Nemohu tì vzít s sebou.",dia_lester_knowwhereenemy_no);
		Info_AddChoice(dia_lester_knowwhereenemy,"Tak pojï se mnou a najdi své odpovìdi!",dia_lester_knowwhereenemy_yes);
	};
};

func void dia_lester_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Tak pojï se mnou a najdi své odpovìdi!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Setkáme se v pøístavu. Pøijdu tam, jakmile budu pøipraven.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Pospìš si, zaèíná nás tlaèit èas.
	self.flags = NPC_FLAG_IMMORTAL;
	LESTER_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lester_knowwhereenemy);
};

func void dia_lester_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Nemohu tì vzít s sebou.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Rozumím. Stejnì bych ti asi nebyl ádnou vıraznou oporou.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//A u si vezmeš s sebou kohokoliv, ujisti se, e mu mùeš vìøit.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//A dávej na sebe pozor.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lester_knowwhereenemy);
};


instance DIA_LESTER_LEAVEMYSHIP(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_leavemyship_condition;
	information = dia_lester_leavemyship_info;
	permanent = TRUE;
	description = "Nakonec pro tebe pøece jenom nemám místo.";
};


func int dia_lester_leavemyship_condition()
{
	if((LESTER_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//Nakonec pro tebe pøece jenom nemám místo.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Rozumím ti. Bıt ve tvé situaci, asi bych udìlal to samé.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Kdybys mì potøeboval, pomohu ti. Víš, kde mì hledat.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LESTER_STILLNEEDYOU(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_stillneedyou_condition;
	information = dia_lester_stillneedyou_info;
	permanent = TRUE;
	description = "Potøebuji pøítele, kterı by mi pomohl.";
};


func int dia_lester_stillneedyou_condition()
{
	if(((LESTER_ISONBOARD == LOG_OBSOLETE) || (LESTER_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lester_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Potøebuji pøítele, kterı by mi pomohl.
	if(LESTER_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Vìdìl jsem to! Projdeme tím bok po boku, stejnì jako pøedtím.
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Zlo by se mìlo mít na pozoru. Zaèínáme mu šlapat na paty.
		self.flags = NPC_FLAG_IMMORTAL;
		LESTER_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Nakonec bude pøece jenom asi lepší, kdy tady zùstanu. Hodnì štìstí.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LESTER_KAP6_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap6_exit_condition;
	information = dia_lester_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lester_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_PSIONIC_PICKPOCKET(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_pc_psionic_pickpocket_condition;
	information = dia_pc_psionic_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_pc_psionic_pickpocket_condition()
{
	return c_beklauen(76,20);
};

func void dia_pc_psionic_pickpocket_info()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_BACK,dia_pc_psionic_pickpocket_back);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_PICKPOCKET,dia_pc_psionic_pickpocket_doit);
};

func void dia_pc_psionic_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

func void dia_pc_psionic_pickpocket_back()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

