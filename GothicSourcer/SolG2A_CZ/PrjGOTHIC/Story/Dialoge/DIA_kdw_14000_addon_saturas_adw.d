
instance DIA_ADDON_SATURAS_ADW_EXIT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 999;
	condition = dia_addon_saturas_adw_exit_condition;
	information = dia_addon_saturas_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adw_exit_info()
{
	AI_StopProcessInfos(self);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Nech tì Adanos ochraòuje.
};


instance DIA_ADDON_SATURAS_ADWSTART(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 1;
	condition = dia_addon_saturas_adwstart_condition;
	information = dia_addon_saturas_adwstart_info;
	important = TRUE;
};


func int dia_addon_saturas_adwstart_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adwstart_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Díky Adanosovi. Koneène jsi tady. Mysleli jsme, e u se neukáeš.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(rozzlobenì) Coe? Jakto e u tady jste?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Kdy jsi prošel skrz portál, tak jsme tì následovali. Krátce poté jsme se objevili zde.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Ale ty jsi tady nebyl. U jsme tady nìkolik dní.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(pøekvapenì) NÌKOLIK DNÍ? Jak se to mohlo stát?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Nebyl jsi k nalezení, Nefarius se snail zjistit, co se mohlo pokazit. Nevìdìl si s tím rady.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Dobøe. Teï jsi tady a mùeme zaèít s naší prací.
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(dia_addon_saturas_adwstart);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co se mezitím stalo?",dia_addon_saturas_adwstart_was);
};

func void dia_addon_saturas_adwstart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co se mezitím stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Zjistili jsme toho docela dost.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Zìmìtøesení stále sílí. Nejsme daleko od epicentra.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Stavitelé tìchto starıch staveb tu nejdøív postavili tohle mìsto, jen jsme ji objevili.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Bez zjevnıch dùvodù jejich kultura zanikla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Teï bychom mohli u jenom spekulovat proè.
	Info_AddChoice(dia_addon_saturas_adwstart,"Našli jste nìco nového ohlednì tìch ztracenıch lidí?",dia_addon_saturas_adwstart_missingpeople);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co se dìje s Ravenem?",dia_addon_saturas_adwstart_raven);
};

func void dia_addon_saturas_adwstart_raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Co se dìje s Ravenem?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//V Ravenovì dopise se hovoøí o nìjaké svatyni, do které se pokouší dostat.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Shodli jsme se na tom, e by to mohl bıt Adanosùv chrám a Raven se jej pokusí znesvìtit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Zemìtøesení jsou zøejmì dùsledkem poskvròujícího zaklínadla, které neustále naráí na mocná protikouzla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Brány tohoto chrámu jsou magicky uzavøené a pøi pokusech o sejmutí kouzla oivují kamenné stráce.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Chrám zatím odolává. Musíme zastavit Ravena døíve, ne se dostane dovnitø.
	Info_AddChoice(dia_addon_saturas_adwstart,"Co teï udìláme?",dia_addon_saturas_adwstart_wastun);
	Info_AddChoice(dia_addon_saturas_adwstart,"Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?",dia_addon_saturas_adwstart_ravenonlybaron);
	Info_AddChoice(dia_addon_saturas_adwstart,"Proè se chce Raven do chrámu dostat?",dia_addon_saturas_adwstart_ravenaim);
};

func void dia_addon_saturas_adwstart_ravenaim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Proè se chce Raven do chrámu dostat?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Víme jen to, e mu jde o mocnı artefakt, kterı nìjak souvisí s Adanosem a Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(rozzuøenì) Mìli jsme vìdìt, e má nìco za lubem.
};

func void dia_addon_saturas_adwstart_ravenonlybaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Moná to nedìlá on. Moná je to jinı mág, kterı poslouchá jeho rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Kadopádnì musíme odvrátit tohle zlo.
};

func void dia_addon_saturas_adwstart_missingpeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Našli jste nìco nového, ohlednì tìch ztracenıch lidí?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zrovna vèera jsme našli mrtvolu rybáøe. Leí v ruinách na vıchod.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Vypadá jako rybáø z Khorinisu. Mìl by ses tam jít podívat.
	SATURAS_ABOUTWILLIAM = TRUE;
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
};

func void dia_addon_saturas_adwstart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co teï udìláme?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//My tady zùstaneme a budeme nadále studovat tuhle kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Staré svitky stavitelù zachovávají mnoho tajemství, které musíme vyøešit - pokud chceme zjistit, co se tu v minulosti stalo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Ty musíš pro nás ještì udìlat pár vìcí.
	Info_AddChoice(dia_addon_saturas_adwstart,"Co bych mìl udìlat?",dia_addon_saturas_adwstart_wastun2);
};

func void dia_addon_saturas_adwstart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Co bych mìl udìlat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Najdi Ravena a nedovol mu znesvìtit chrám.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//Øíkaš e ho mám zabít?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Pokud to bude jediná moná cesta jak ho zastavit, tak ve jménu Adanosovì... Ano!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Posbírej všechny pozùstatky po stavitelích, které najdeš a pøines nám je.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Musíme se dozvìdìt nìco víc o tomto národì a jeho osudu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Jestli chceme Ravena zastavit, musíme vìdìt, co plánuje.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Navíc musíš nìjakım zpùsobem osvobodit otroky.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(cynicky) To je všechno? To udìlám i se zavázanıma oèima.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(mrzutì) Vím, e to bude tvrdı oøíšek, ale podívej - máš šanci získat si mou dùvìru.
	MIS_ADDON_SATURAS_GOTORAVEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven znesvìcuje Adanosùv chrám. Musím ho zastavit. I kdybych ho mìl zabít.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_SKLAVEN,"Saturas chce, abych osvobodil vìznì.");
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,"Saturas chce, abych mu donesl všechno, co by mohlo souviset se starımi staviteli tìchto budov.");
	Info_AddChoice(dia_addon_saturas_adwstart,"Ja tedy u pùjdu.",dia_addon_saturas_adwstart_back);
};

func void dia_addon_saturas_adwstart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Ja tedy u pùjdu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Ještì nìco ... pro Ravena pracuje mnoho banditù.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Po dobu tvé nepøítomnosti jsme pøijali dalšího èlena 'Kruhu vody'
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Poslali jsme ho do bain. Ještì se nevrátil.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//Pøedpokládáme, e bandité útoèí na všechno, co nevypadá jako oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Obstarej si zbroj banditù.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Budeš mít šanci dostat se blí bez toho, aby na tebe zaútoèili.
	Log_CreateTopic(TOPIC_ADDON_BDTRUESTUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BDTRUESTUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bandité útoèí na všechno co nevypadá jako oni. Musím si najít bandití zbroj, abych se mohl dostat blí.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SATURAS_POORRANGER(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_poorranger_condition;
	information = dia_addon_saturas_poorranger_info;
	description = "Co za blázna jsi poslal do moèálu?";
};


func int dia_addon_saturas_poorranger_condition()
{
	return TRUE;
};

func void dia_addon_saturas_poorranger_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Co za blázna jsi poslal do moèálu?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Jmenuje se Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Myslím, e se nedostal moc daleko.
	Log_CreateTopic(TOPIC_ADDON_LANCE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LANCE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_LANCE,"Saturas poslal do moèálu nìkoho jménem Lance. Obává se, e se nedostal moc daleko.");
};


instance DIA_ADDON_SATURAS_PIRATEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_piraten_condition;
	information = dia_addon_saturas_piraten_info;
	description = "Kde získam tu potøebnou zbroj banditù?";
};


func int dia_addon_saturas_piraten_condition()
{
	if((alligatorjack.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (greg.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_piraten_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Kde získam tu potøebnou zbroj banditù?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zapadì je tábor pirátù.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Pokud vím, mají s bandity nìjaké kontakty.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nemyslím, e na tebe zaútoèi, kdy tì spozorují.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Moná ti tam pomohou.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Saturas vìøí, e piráti mi pomohou získat banditskou zbroj.");
};


instance DIA_ADDON_SATURAS_LANCELEICHE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_lanceleiche_condition;
	information = dia_addon_saturas_lanceleiche_info;
	description = "Našel jsem Lanceho mrtvolu.";
};


func int dia_addon_saturas_lanceleiche_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_poorranger) && (Npc_HasItems(none_addon_114_lance_adw,itri_lancering) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lanceleiche_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Našel jsem Lanceho mrtvolu.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Nech jeho duše vstoupí do øíše Adanosovy.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Buï opatrnı synu. Nechci pøijít o dalšího èlena.
	TOPIC_END_LANCE = TRUE;
	b_giveplayerxp(XP_ADDON_LANCELEICHE);
};


instance DIA_ADDON_SATURAS_LANCERING(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_lancering_condition;
	information = dia_addon_saturas_lancering_info;
	description = "Mám Lanceho akvamarínovı prsten.";
};


func int dia_addon_saturas_lancering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_lanceleiche) && Npc_HasItems(other,itri_lancering))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lancering_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//Mám Lanceho akvamarínovı prsten.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Bude nejlepší, kdy mi ho dáš døív, ne se dostane do nesprávnıch rukou.
	b_giveinvitems(other,self,itri_lancering,1);
	b_giveplayerxp(XP_ADDON_LANCERING);
};


instance DIA_ADDON_SATURAS_TOKENS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_tokens_condition;
	information = dia_addon_saturas_tokens_info;
	permanent = TRUE;
	description = "O relikviích ...";
};


func int dia_addon_saturas_tokens_condition()
{
	if(SATURAS_SCBROUGHTALLTOKEN == FALSE)
	{
		return TRUE;
	};
};


var int dia_addon_saturas_tokens_onetime;
var int saturas_scbroughtalltoken;
var int saturas_broughttokenamount;
var int scbroughttoken;
var int saturas_scfound_itmi_addon_stone_01;
var int saturas_scfound_itmi_addon_stone_02;
var int saturas_scfound_itmi_addon_stone_03;
var int saturas_scfound_itmi_addon_stone_04;
var int saturas_scfound_itmi_addon_stone_05;

func void dia_addon_saturas_tokens_info()
{
	var int broughttoken;
	var int xp_broughttokens;
	var int kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//O relikviích ...
	if((DIA_ADDON_SATURAS_TOKENS_ONETIME == FALSE) && (c_schasmagicstoneplate() || Npc_HasItems(other,itwr_stoneplatecommon_addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Myslím, e tady pro tebe nìco mám.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//O tìchto kamennıch deskách u víme. Ty nám ji nepomùou.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Musí tam toho bıt víc ne jen tohle.
		DIA_ADDON_SATURAS_TOKENS_ONETIME = TRUE;
	};
	broughttoken = 0;
	xp_broughttokens = 0;
	if((Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Máš pro to vyuití?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Vypadá to dobøe. Kde jsi to našel?
		b_logentry(TOPIC_ADDON_RELICTS,"Saturas si odemne vzal tato uèení:");
		if(Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_01,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_01 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Bandité pouívali tyhle kamenné desky jako nìjakı druh penìz.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Desky nesou symbol Quarhodona, velkého bojovníka.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Byl to vojevùdce a jeho syn Rhademes znièil celé mìsto.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(opovrenì) Tse. Vsadím se, e bandité ani netuší, s èím to obchodují.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Èervenou kamennou desku, kterou bandité pouívají jako peníze. Je na ní zobrazen velkı váleèník Quarhodon.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_02,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_02 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Tuhle desku jsem našel v jedné budovì na jihu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Deska strácù smrti. Pomocí ní vyvolávali duchy smrti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Souvislost mezi staviteli a jejich pùvodem je velmi blízká.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Fialováou kamennou desku ze sídla Strácù smrti na jihu.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_03,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_03 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Našel jsem tuhle desku v budovì na jihozápadì.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Soudì podle toho, co øíka tahle deska, byl to Dùm knìze ve mìstì.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Veleknìz se jmenoval KHARDIMON. Zatím toho o nìm moc nevíme.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Modrou kamenou desku z obydlí veleknìze na jihozápadì.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_04,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_04 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Tahle vìc leela v budovì blízko moèálu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//To by mohl bıt Dùm léèitelù.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Zatím o nich moc nevíme. Zdá se, e byli první, co odsud zmizeli.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Zelenou kamennou desku z Domu léèitelù v jiní èásti bainy.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_05,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_05 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Tahle èást leela ve velké budovì v kaòonu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Tohle je z knihovny starého národa.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Podle všeho je to deska uèencù.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Vìtšina rukopisù, které jsme našli se vztahovaly na vùdce 'Domu uèencù'
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Zvláštní, e na tìch zápiscích nenechal své jméno ...
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- lutou kamenou desku z knihovny uèencù na severu.");
		};
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == TRUE)
		{
		};
		xp_broughttokens = XP_ADDON_FORONETOKEN * broughttoken;
		b_giveplayerxp(xp_broughttokens);
		SATURAS_BROUGHTTOKENAMOUNT = SATURAS_BROUGHTTOKENAMOUNT + broughttoken;
		if(SATURAS_BROUGHTTOKENAMOUNT < 5)
		{
			if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Velmi dobøe. Obrázek mìsta se poøád vyjasòuje, ale stále toho nevíme dost.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//V téhle oblasti musí bıt ukryto pìt kamennıch desek.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Nájdi je a pøines je sem.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Pøíjmi tohle zlato za svou ochotu.
		kohle = 200 * broughttoken;
		CreateInvItems(self,itmi_gold,kohle);
		b_giveinvitems(self,other,itmi_gold,kohle);
		SCBROUGHTTOKEN = TRUE;
	};
	if(SATURAS_BROUGHTTOKENAMOUNT == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Teï jsme u posbírali všechna uèení, která potøebujeme.
		if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Udìlal jsi pro nás velkou slubu, díky ti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Je to velikı pokrok pro naše studia.
		};
		MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_SUCCESS;
		SATURAS_SCBROUGHTALLTOKEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Uvidím, jestli se mi nìco podaøí najít.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dobøe. Pospìš si. Èas utíká.
	};
};


instance DIA_ADDON_SATURAS_STONEPLATEHINT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_stoneplatehint_condition;
	information = dia_addon_saturas_stoneplatehint_info;
	important = TRUE;
};


func int dia_addon_saturas_stoneplatehint_condition()
{
	if(((MERDARION_GOTFOCUSCOUNT >= 2) || (RAVENISINTEMPEL == TRUE)) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_stoneplatehint_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dobøe e ses vrátil. Musím ti øíct nìco nového.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Poslouchám.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Ztracene mìsto se jmenovalo Jharkendar. Bylo tady pìt vládcù, kteøí øídili svùj lid.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Kadı s tìchto vládcù mìl své sídlo, ve kterém il a mìl svùj majetek.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Myslím si, e by jsi mìl hledat ona uèení po staré kultuøe zrovna v tìchto místech.
	MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_RUNNING;
	Info_ClearChoices(dia_addon_saturas_stoneplatehint);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"Co kdy u ta uèení neexistují?",dia_addon_saturas_stoneplatehint_unter);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"Kde pøesnì bych mìl ta uèení hledat?",dia_addon_saturas_stoneplatehint_wo);
};

func void dia_addon_saturas_stoneplatehint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Kde pøesnì bych mìl ta uèení hledat?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian tì obeznámí s uspoøádáním staveb v Jharkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Poví ti, kde je máš hledat.
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Saturas chce, abych se poohlédl po nìjakych uiteènıch záznamech stavitelù. Riordian mi poví, kde je mám hledat.");
};

func void dia_addon_saturas_stoneplatehint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//Co kdy u ta uèení neexistují?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Jestli nenajdeš nìkterı z onìch Domù, tak potom byly zrejmì znièeny spolu s mìstem.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale pokud ještì stále existují, budou neocenitelnou pomocí pro naše studium.
};


instance DIA_ADDON_SATURAS_SCBROUGHTALLTOKEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_scbroughtalltoken_condition;
	information = dia_addon_saturas_scbroughtalltoken_info;
	description = "Na co potøebuješ tìch pìt kamennıch desek?";
};


func int dia_addon_saturas_scbroughtalltoken_condition()
{
	if((SCBROUGHTTOKEN == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scbroughtalltoken_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Na co potøebuješ tìch pìt kamennıch desek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Záznamy, které jsi našel v ruinách nejsou kompletní.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale v zápisech stavitelù se øíka o pìti vládcích, kteøí øídili mìsto.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Kadı z tìchto vládcù mìl jednu z desek, které symbolizovali jeho autoritu.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Myslím, e tyhle desky jsou klíèem na mé otázky.
};


instance DIA_ADDON_SATURAS_FLUT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_flut_condition;
	information = dia_addon_saturas_flut_info;
	description = "Nefarius mi øekl o pøílivu.";
};


func int dia_addon_saturas_flut_condition()
{
	if((NEFARIUSADW_TALK2SATURAS == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_flut_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius mi øekl o pøílivu.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Ukázalo se, e Adanos sestoupil z nebes, aby potrestal nevìøících a vyhnal je do svìta mrtvıch.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Ve svém svatém hnìvu nechal moøem pohltit mìsto a smetl jej pryè.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Baina na vıchodì je ještì stále svìdectvím tìchto událostí.
	TOPIC_END_FLUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SATURAS_ADANOSZORN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_adanoszorn_condition;
	information = dia_addon_saturas_adanoszorn_info;
	description = "Co se Adanosovi stalo, e se tak rozhnìval?";
};


func int dia_addon_saturas_adanoszorn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_flut) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adanoszorn_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Co se Adanosovi stalo, e se tak rozhnìval?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//Chrámem tohoto mìsta byla kdysi velká záøivá budova.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Všichni ji obdivovali a modlili se k nášemu bohu Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rhademes, syn vojevùdce Quahodrona, znesvìtil chrám.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po druhém podlehli zlu.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Pøedpokládam, e Adanos jim nemohl odpustit a jeho pomsta postihla celı kraj.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Proto je tak dùleité, aby jsme Ravena zastavili.
};


instance DIA_ADDON_SATURAS_RAVENINFOS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 9;
	condition = dia_addon_saturas_raveninfos_condition;
	information = dia_addon_saturas_raveninfos_info;
	permanent = TRUE;
	description = "Ohlednì Ravena ...";
};


var int dia_addon_saturas_raveninfos_onetime1;
var int dia_addon_saturas_raveninfos_onetime2;
var int dia_addon_saturas_raveninfos_onetime3;
var int dia_addon_saturas_raveninfos_onetime4;
var int dia_addon_saturas_raveninfos_onetime5;
var int addon_saturas_fortuno;

func int dia_addon_saturas_raveninfos_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_RUNNING) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raveninfos_info()
{
	var int ravenneuigkeit;
	var int xp_ravenneuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Ohlednì Ravena ...
	ravenneuigkeit = 0;
	if((thorus.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 == FALSE) && (RAVENISINTEMPEL == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Byl jsem v táboøe banditú. Raven je jejich vùdce.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Ale na to, abych se dostal blí k Ravenovi, se budu muset zbavit nìkolika banditù.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dobøe. Hodnì štìstí. Ale nezapomìò, e to musíš udìlat rychle.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Raven nesmí za ádnych okolností dosáhnout svého cíle.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Má svùj zlatı dùl, a nutí zajatce hledat zlato.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To se mu podobá. Musíš zajatce osvobodit.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(povzdych) Jasnì. Pracuji na tom.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSFORTUNOINFOS == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Mezi bandity je jeden chlap, kterı tvrdí, e zná Ravenùv plán.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Jmenuje se Fortuno. Myslí si, e Raven se chce dostat do chrámu, aby získal mocnı artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//A? Ví nìco víc o tom artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Øekl mi jen to, e Raven nechal vykopat hrob jednoho z Adanosovıch kneí.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Moná ten hrob obsahuje klíè ke chrámu. Snad bychom se tam mìli porozhlédnout.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Raven pøinutil zajatce, aby hrob vykopali.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To je zlé. Musíš si pospíšit a zastavit Ravena.
		ADDON_SATURAS_FORTUNO = TRUE;
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Vtrhl jsem do Ravenova doupìte.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//A? Co se stalo?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Pøišel jsem pozdì. Ztratil se v Adanosovì chrámu pøímo pøed mıma oèima.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(rozzuøene) Coe? To je KATASTROFA! Proè jsi ho nenásledoval?!
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 = TRUE;
		MIS_ADDON_SATURAS_GOTORAVEN = LOG_SUCCESS;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if(ravenneuigkeit != 0)
	{
		xp_ravenneuigkeit = ravenneuigkeit * XP_AMBIENT;
		b_giveplayerxp(xp_ravenneuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Pøišel jsi oznámit nìjaké nové zprávy?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Zatím ne.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Dám ti radu. Nepodceòuj Ravena, rozumíš?
	};
};


instance DIA_ADDON_SATURAS_TUERZU(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_tuerzu_condition;
	information = dia_addon_saturas_tuerzu_info;
	description = "Nemohu Ravena sledovat. Uzavøel bránu zevnitø.";
};


func int dia_addon_saturas_tuerzu_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_SUCCESS) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_tuerzu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nemohu Ravena sledovat. Uzavøel bránu zevnitø.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//(rozrušenì) Musím pøemıšlet ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Otázkou je, jak se Raven dostal dovnitø ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co udìlal pøedtím, ne prošel skrz bránu?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Vyslovil na bránu zaklínadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A pøed tím?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otevøel hrob.
	if(ADDON_SATURAS_FORTUNO == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//U jsem ti to jednou øíkal.
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Správnì!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//U vím, musel tam vykonat nìjakı ritual.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//Rituál ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Ano! To je ono!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Obávám se, e Raven získal sílu Strácù smrti.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//A teï získá vìdomosti ze svatynì!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Musíš jít za Myxirem a øíct mu to!
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Raven ovládl Stráce smrti. Taky získal od ducha informace o Adanosovì chrámu. Mìl bych to oznámit Myxirovi.");
	SATURAS_RIESENPLAN = TRUE;
};


instance DIA_ADDON_SATURAS_GHOSTQUESTIONS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_ghostquestions_condition;
	information = dia_addon_saturas_ghostquestions_info;
	description = "Mluvil jsem s Quarhodronem.";
};


func int dia_addon_saturas_ghostquestions_condition()
{
	if((Npc_IsDead(quarhodron) == FALSE) && (SC_TALKEDTOGHOST == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ghostquestions_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Mluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//A co øíkal?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Pomùe mi, jen kdy mu odpovím na jeho otázky.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//V èem je problém?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nevím správné odpovìdi.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hmm ... víme, e uèenci z tohoto mìsta postavili na severu knihovnu.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Byli velice usilovní a snaili se zapisovat všechny své dìjiny.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Moná nalezneš odpovìdi na Quarhodronovy otázky pravì tam.
	b_logentry(TOPIC_ADDON_QUARHODRON,"Saturas pøedpokládá, e bych mohl najít odpovìdi na Quarhodronovy otázky v knihovnì uèencù. Ta je daleko na severu.");
};


instance DIA_ADDON_SATURAS_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_talkedtoghost_condition;
	information = dia_addon_saturas_talkedtoghost_info;
	description = "Problém se vstupem do chrámu jsem vyøešil.";
};


func int dia_addon_saturas_talkedtoghost_condition()
{
	if((GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Problém se vstupem do chrámu jsem vyøešil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch promluvil?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Ano, promluvil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Víš jak se dostat do chrámu?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Ano. A navíc mi prozradil, co se skrıvá uvnitø.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Øíkal nìco o mocném meèi a o komnatách Adanose.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(zoufale) Ach Adanosi. Jsme ale hlupáci. Jakto e jsme nic netušili?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//(šokovanì) Podle tvıch slov ...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Ten meè mùe bıt jedinì 'Beliarùv dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Musíme pøekonat komnaty tak rychle, jak to jen jde a získat tu zbraò.
	Info_ClearChoices(dia_addon_saturas_talkedtoghost);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Co je to 'Beliarùv dráp'?",dia_addon_saturas_talkedtoghost_wasistdas);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Co jsou Adanosovy komnaty?",dia_addon_saturas_talkedtoghost_kammern);
};

func void dia_addon_saturas_talkedtoghost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co je to 'Beliarùv dráp'?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Je to pøevtìlené zlo. Sestrojil ho sám Beliar.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Kadı kdo ho pouívá, má hroznou zbraò nièení.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//Èím silnejší je nositel, tím mocnìjší je i 'dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jen ten, kdo má silného ducha a pevnou vùli, mùe odolat kletbì.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Teï je mi u jasné, proè stavitelé zablokovali tohle údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Pøinesli tuto ïábelskou zbraò do svého mìsta a oddali se jejímu kouzlu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Ti arogantní blázni zabili jeden druhého kvùli nenasytnosti.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Krutost neskonèila, Adanosùv hnìv se stáhnul okolo této krajiny a vše se potopilo do hlubin moøe.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Vskutku. Stavitelé portálu velmi dobøe ukryli tyto vìci pøed zbytkem svìta.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Jak tragickı konec pro tak úasnou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Pochopil jsi naléhavost naší mise?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Raven je silnı bojovník a je zaslepen touhou po moci.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//V jeho rukou se 'dráp' stává nástrojem zkázy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nesmí získat tu zbraò, jinak jsme všichni odsouzeni k záhubì.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"V Adanosovì chrámu je silná zbraò. Jmenuje se 'Beliarùv dráp'. Raven se ji nesmí zmocnit.");
};

func void dia_addon_saturas_talkedtoghost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Co jsou Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Zjistili jsme, e brána není jediná pøekáka na cestì do svatynì.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//V chrámu jsou tøi komnaty, jen mají zastavit vetøelce.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Barevné kamenné desky stavitelù jsou klíèem.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Jen kdy máš všechny desky a vyøešíš jejich hádanku, smíš vstoupit dovnitø.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nevím, jestli Raven rozluštil tajemství chrámu, ale pokud ano, tak máme velkı problém.
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,LOGTEXT_ADDON_RELICTS);
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,LOGTEXT_ADDON_RELICTS);
	SATURAS_KNOWSHOW2GETINTEMPEL = TRUE;
};


instance DIA_ADDON_SATURAS_RELICTSBACK(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_relictsback_condition;
	information = dia_addon_saturas_relictsback_info;
	description = "Co pøesnì mám  v chrámu s uèeními udìlat?";
};


func int dia_addon_saturas_relictsback_condition()
{
	if((SATURAS_SCBROUGHTALLTOKEN == TRUE) && (SATURAS_KNOWSHOW2GETINTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_relictsback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co pøesnì mám  v chrámu s uèeními udìlat?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//To zatím nevíme. Ale doufame, e to zjistíš, hned jak vstoupíš dovnitø.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Je mi líto, e ti nemohu øíct víc. Teï u je všechno jenom na tobì.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Vem si ta uèení a okamitì bì do chrámu.
	CreateInvItems(hero,itmi_addon_stone_01,1);
	CreateInvItems(hero,itmi_addon_stone_02,1);
	CreateInvItems(hero,itmi_addon_stone_03,1);
	CreateInvItems(hero,itmi_addon_stone_04,1);
	CreateInvItems(hero,itmi_addon_stone_05,1);
	AI_PrintScreen(PRINT_ITEMSERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	b_logentry(TOPIC_ADDON_KAMMERN,"Saturas mì posíla do Adonosova chrámu s pìti relikviemi po stavitelích. Musím se dostat dovnitø a zastavit Ravena.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Adanosi slituj se nad ním a ochraò nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Moná ještì není pozdì.
};


instance DIA_ADDON_SATURAS_RAVENSDEAD(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_ravensdead_condition;
	information = dia_addon_saturas_ravensdead_info;
	important = TRUE;
};


func int dia_addon_saturas_ravensdead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ravensdead_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Zemìtøesení se zastavilo a ty jsi ještì stále naivu.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Splnil jsi svùj úkol?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Ano. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Potom je u po všem. Díky Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Vedl sis dobøe synu. Jsme tvımi dluníky.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Zbav se této zlé a mocné zbanì a pøines rovnováhu zpìt do téhle èásti svìta.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Po dobu zemìtøesení jsme se radili, co budeme dìlat dál. A máme vısledek.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Bì a získej 'Beliarùv dráp'. Je ti pøedurèen.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//V tvıch rukách, by mohl bıt mocnım spojencem pro nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Pouívej jej moudøe, mùj synu. Adanos ti bude pomahat.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Zùstaneme zde, a ujistíme se, e chrám bude znovu záøit tak jako kdysi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Jen Myxir pùjde do Khorinisu a oznámí Vatrasovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras byl velmi dlouho v tom mìstì sám.
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Myxir šel do mìsta vystøídat Vatrase.");
	b_giveplayerxp(XP_ADDON_SATURAS_RAVENSDEAD);
};


instance DIA_ADDON_SATURAS_FREEDMISSINGPEOPLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_freedmissingpeople_condition;
	information = dia_addon_saturas_freedmissingpeople_info;
	description = "Osvobodil jsem vìznì.";
};


func int dia_addon_saturas_freedmissingpeople_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_freedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Osvobodil jsem vìznì.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Velmi dobøe. Teï se mohou vrátit zpìt domú.
	b_giveplayerxp(XP_ADDON_SATURAS_FREEDMISSINGPEOPLE);
};


instance DIA_ADDON_SATURAS_BELIARSWEAPON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarsweapon_condition;
	information = dia_addon_saturas_beliarsweapon_info;
	description = "Nechám si 'Beliarùv dráp'.";
};


func int dia_addon_saturas_beliarsweapon_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarsweapon_info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Nechám si 'Beliarùv dráp'.
	if(Npc_HasItems(hero,itmw_beliarweapon_raven) && (SC_FAILEDTOEQUIPBELIARSWEAPON == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nemohu ho pouít.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Beliarùv dráp je velice zvláštní zbraò.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//Má vlastní vùli i ducha.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, majitel této mocné zbranì, jsi její pán.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Ta zbraò je èasí tebe a pøizpùsobuje se tvım schopnostem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nemùeš ji donutit, aby dìlala, co si zamaneš.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jenom sám Beliar ji mùe donutit, aby tì poslouchala.
	Info_ClearChoices(dia_addon_saturas_beliarsweapon);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Proè by mi mìl Beliar pomoci?",dia_addon_saturas_beliarsweapon_besser);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Co mùu dìlat s touhle zbraní?",dia_addon_saturas_beliarsweapon_wastun);
};

func void dia_addon_saturas_beliarsweapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co mùu dìlat s touhle zbraní?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To záleí na tobì. Ovládl jsi tu zbraò a teï jsi její pán.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mohu ti dát jenom radu, co s ní mùeš udìlat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Buï mi ji odevzdáš, a já zaruèím, e u nikdy nezpùsobí ádnou škodu ...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... nebo vyuiješ její moc a pouiješ ji k boji.
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Nemùeš si tu zbraò nechat?",dia_addon_saturas_beliarsweapon_geben);
};

func void dia_addon_saturas_beliarsweapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nemùeš si tu zbraò nechat?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Pokud mi ji dáš, znièím ji, take u ji nikdo nebude moci zneuít.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Take si promysli, co chceš.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"Mùu 'Beliarùv dráp' odevzdat Saturasovi anebo si ho nechat.");
};

func void dia_addon_saturas_beliarsweapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Proè by mi mìl Beliar pomoci?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Jenom pobonı èlovìk ho mùe vyprovokovat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Buï opatrnı. Beliar je nejhorší.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Pokud ho rozzuøíš, brzo to pocítíš.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_KLAUE,"Abych mohl ovládat 'Beliarùv dráp', musím se pomodlit k Beliarovi.");
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_SATURAS_PERMENDE_ADDON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_permende_addon_condition;
	information = dia_addon_saturas_permende_addon_info;
	permanent = TRUE;
	description = "Co teï budete dìlat?";
};


func int dia_addon_saturas_permende_addon_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_ravensdead))
	{
		return TRUE;
	};
};


var int dia_addon_saturas_permende_addon_onetime;

func void dia_addon_saturas_permende_addon_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Co teï budete dìlat?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Zùstaneme tady a zajistíme, aby chrám opìt odhalil svou krásu a velikost.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Pøílíš dlouho tyto zdi chátrají.
	if(DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//Díky ti synu ...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Velmi jsem se v tobì mılil. Jsi ochránce rovnováhy. O tom není pochyb.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez tvé pomoci a stateènosti by ostrov Khorinis zanikl. Dìkujeme ti a budeme oslavovat tvou èest.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Soustøeï se na své další úlohy, které leí pøed tebou a udruj tento svìt v rovnováze a míru.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Jdi a pøíjmi svùj osud ochránce. Budeme se za tebe modlit.
		DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME = TRUE;
	};
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgeben_condition;
	information = dia_addon_saturas_beliarweapgeben_info;
	description = "Vem si 'Beliarùv dráp' a zniè ho.";
};


func int dia_addon_saturas_beliarweapgeben_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_beliarsweapon))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Vem si 'Beliarùv dráp' a zniè ho.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak chceš, synu. Dej mi ho.
	b_clearbeliarsweapon();
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//U nikdy nikomu neublíí. Zahodím ho do hlubin moøe.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Adanos na to dohlédne.
	TOPIC_END_KLAUE = TRUE;
	b_giveplayerxp(XP_ADDON_BELIARSWEAPONABGEGEBEN);
	SATURAS_KLAUEINSMEER = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_PRETEACHCIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_adw_preteachcircle_condition;
	information = dia_addon_saturas_adw_preteachcircle_info;
	description = "Mùeš mì nauèit kruhy magie?";
};


func int dia_addon_saturas_adw_preteachcircle_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_preteachcircle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Mùeš mì nauèit kruhy magie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Jsi mág Ohnì. Co by øekl Pyrokar?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//To nemusí nikdo vìdìt.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//(povzdych) Vidím, e to opravdu myslíš vánì, jsem opravdu pøekvapen tvojí ádostí.
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Pokud budu mít dojem, e svoje vìdomosti pouíváš k ubliování nevinnım, tak se mnou víc nepoèítej.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//Doufám, e mì nezklameš.
	};
	SATURAS_ADDON_TEACHCIRCLE = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_SATURASTEACH);
};


instance DIA_ADDON_SATURAS_ADW_CIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 99;
	condition = dia_addon_saturas_adw_circle_condition;
	information = dia_addon_saturas_adw_circle_info;
	permanent = TRUE;
	description = "Chci se nauèit další kruh magie.";
};


var int dia_addon_saturas_adw_circle_noperm;

func int dia_addon_saturas_adw_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6) && (SATURAS_ADDON_TEACHCIRCLE == TRUE) && (DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_circle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Chci se nauèit další kruh magie.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (KAPITEL >= 2))
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Ano, jsi pripraven nauèit se o tom nìco víc.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Vstoupils do druhého kruhu magie. Adanos ti dává moudrost, abys pouil svou novou moc chytøe.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (KAPITEL >= 3))
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Ano, nastal správnı èas. Vstup do tøetího kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Tvé vìdomosti ti dovolují pouívat nová kouzla. Pouívej je opatrnì.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//U je naèase. Jsi pøipraven, abys vstoupil do ètvrtého kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Tvá slova a èiny jsou teï velmi mocná. Vybírej si svá nová kouzla opatrnì a s rozumem.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (KAPITEL >= 5))
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Dostal jsi oprávnìní vstoupit do pátého kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Kouzla, která teï dostaneš, jsou velice nièivá.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Uvìdom si svou moc a nepodléhej zlu.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//To u teï není má úloha.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Na to, aby ses nauèil šestı a zároveò poslední kruh magie, bys mìl navštívit klašter mágù Ohnì.
		DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Je ještì stále pøílíš brzy. Vra se pozdìji.
	};
};

