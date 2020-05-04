
instance DIA_ANGARDJG_EXIT(C_INFO)
{
	npc = djg_705_angar;
	nr = 999;
	condition = dia_angardjg_exit_condition;
	information = dia_angardjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angardjg_exit_condition()
{
	return TRUE;
};

func void dia_angardjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_HALLO(C_INFO)
{
	npc = djg_705_angar;
	nr = 5;
	condition = dia_angardjg_hallo_condition;
	information = dia_angardjg_hallo_info;
	description = "Neznáme se? Ty jsi Cor Angar. Býval jsi templáøem v táboøe v bažinách.";
};


func int dia_angardjg_hallo_condition()
{
	return TRUE;
};

func void dia_angardjg_hallo_info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Neznáme se? Ty jsi Cor Angar. Býval jsi templáøem v táboøe v bažinách.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//(rezignovanì) Øíkej mi Angar. Ten titul už nepoužívám. Spáèovo bratrstvo už neexistuje.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Zajímavé, ale vypadá to, jako bys mì už odnìkud znal. Nìjak si tì nemohu vybavit.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Co to s tebou je?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//(pøehlíživì) Ach, nebyl jsem jeden èas vùbec schopen usnout. Poøád jsem mìl noèní mùry.
	b_logentry(TOPIC_DRAGONHUNTER,"V Hornickém údolí jsem našel Angara.");
};

func void b_sctellsangaraboutmadpsi()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Spáèovo bratrstvo si zotroèilo zlo.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Tví døívìjší pøátelé ze starého tábora procházejí zemí v èerných róbách a vypadají, že je vše, co se hýbe, neskuteènì štve.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//O èem to mluvíš?
	};
};

func void b_sctellsangaraboutmadpsi2()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Slouží nepøíteli a nejsou nièím jiným než bezduchými bojovníky zla.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//U všech bohù. Vìdìt to, nebyl bych tak zaslepeným. Už se to víckrát nestane, Pøísahám..
		b_giveplayerxp(XP_ANGAR_KNOWSMADPSI);
		ANGAR_KNOWSMADPSI = TRUE;
	};
};


instance DIA_ANGAR_WIEKOMMSTDUHIERHER(C_INFO)
{
	npc = djg_705_angar;
	nr = 6;
	condition = dia_angar_wiekommstduhierher_condition;
	information = dia_angar_wiekommstduhierher_info;
	description = "Jak ses sem dostal?";
};


func int dia_angar_wiekommstduhierher_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_hallo))
	{
		return TRUE;
	};
};

func void dia_angar_wiekommstduhierher_info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//Poté, co zanikla bariéra, jsem se ukryl v horách. Pak bylo naèase, abych zaèal nìco dìlat.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//Bloudil jsem nìkolik dní a pak jsem se náhle objevil na tomhle hradì. Neptej se mì, co se stalo. Já to nevím.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//A jako by toho bylo málo, ještì jsem ztratil amulet, který jsem mìl už dlouhá léta. Nejspíš se zblázním, když se mi ho nepodaøí znovu nalézt.
	Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
	b_logentry(TOPIC_ANGARSAMULETT,"Angar ztratil svùj amulet a teï se jej zoufale snaží najít.");
	Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
	Info_AddChoice(dia_angar_wiekommstduhierher,"Kde pøesnì jsi ten amulet ztratil?",dia_angar_wiekommstduhierher_amulett);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Spáèovo bratrstvo si zotroèilo zlo.",dia_angar_wiekommstduhierher_andere);
	}
	else
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co se stalo s ostatníma z tábora v bažinách?",dia_angar_wiekommstduhierher_andere);
	};
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co budeš dìlat dál?",dia_angar_wiekommstduhierher_nun);
	};
};

func void dia_angar_wiekommstduhierher_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Kde pøesnì jsi ten amulet ztratil?
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Nìkde na jihu, krátce pøedtím, než jsem se objevil tady na hradì.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet by mìl ležet kdesi na jihu. Angar se po nìm jde podívat.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//Nìkde musí být.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet se nachází u kamenné hrobky na jihu Hornického údolí.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Bojím se, že ho nìkdo ukradl. Musím ho za každou cenu dostat zpátky.
};

func void dia_angar_wiekommstduhierher_andere()
{
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//Co se stalo s ostatníma z tábora v bažinách?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Poslední vìc, na kterou si pamatuju, bylo znièení bariéry a nervy drásající jekot, který ho doprovázel.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//V panické hrùze jsme se vrhli k zemi a svíjeli se bolestí. Ten zvuk. A poøád sílil.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//A pak, když bylo po všem, se všichni zbláznili a s hlasitým øevem zmizeli ve tmì.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//Pak už jsem je nikdy nevidìl.
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi2();
	};
};

func void dia_angar_wiekommstduhierher_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//Co budeš dìlat dál?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Nejdøív jsem si musel trochu odpoèinout, abych mohl zaèít hledat svùj ztracený amulet.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//Zaslechl jsem nìco o dracích.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Také se povídá, že se do Hornického údolí vydalo mnoho bojovníkù na jejich lov.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Uvažuju o tom, že bych se k nim pøidal.
	ANGAR_WILLDJGWERDEN = TRUE;
};

func void dia_angar_wiekommstduhierher_gehen()
{
	Info_ClearChoices(dia_angar_wiekommstduhierher);
};


instance DIA_ANGAR_SCTELLSANGARABOUTMADPSI2(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_sctellsangaraboutmadpsi2_condition;
	information = dia_angar_sctellsangaraboutmadpsi2_info;
	description = "Spáèovo bratrstvo si zotroèilo zlo.";
};


func int dia_angar_sctellsangaraboutmadpsi2_condition()
{
	if((SC_KNOWSMADPSI == TRUE) && (ANGAR_KNOWSMADPSI == FALSE) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void dia_angar_sctellsangaraboutmadpsi2_info()
{
	b_sctellsangaraboutmadpsi();
	b_sctellsangaraboutmadpsi2();
};


instance DIA_ANGAR_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_foundamulett_condition;
	information = dia_angar_foundamulett_info;
	description = "Našel jsem tvùj amulet.";
};


func int dia_angar_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void b_angarsamulettabgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Našel jsem tvùj amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Díky. Myslel jsem, že už ho nikdy neuvidím.
	b_giveinvitems(other,self,itam_mana_angar_mis,1);
	DJG_ANGARGOTAMULETT = TRUE;
	b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};

func void dia_angar_foundamulett_info()
{
	b_angarsamulettabgeben();
	Info_AddChoice(dia_angar_foundamulett,"Proè je pro tebe tak dùležitý?",dia_angar_foundamulett_besonders);
	Info_AddChoice(dia_angar_foundamulett,"Co budeš dìlat teï?",dia_angar_foundamulett_nun);
};

func void dia_angar_foundamulett_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//Proè je pro tebe tak dùležitý?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Byl to dárek.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Aha.
};

func void dia_angar_foundamulett_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Co budeš dìlat teï?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Vypadnu z tohodle zatracenýho údolí.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Možná se ještì nìkdy setkáme. Sbohem.
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
	{
		Npc_ExchangeRoutine(self,"LeavingOW");
	};
};


instance DIA_ANGAR_DJG_ANWERBEN(C_INFO)
{
	npc = djg_705_angar;
	nr = 8;
	condition = dia_angar_djg_anwerben_condition;
	information = dia_angar_djg_anwerben_info;
	description = "Možná bych ti mohl pomoct s nalezením toho amuletu.";
};


func int dia_angar_djg_anwerben_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_djg_anwerben_info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Možná bych ti mohl pomoct s nalezením toho amuletu.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Proè ne. Trocha pomoci nemùže škodit.
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"Už musím jít.",dia_angar_djg_anwerben_gehen);
		Info_AddChoice(dia_angar_djg_anwerben,"Kam chceš vyrazit?",dia_angar_djg_anwerben_wo);
		Info_AddChoice(dia_angar_djg_anwerben,"Kdy pùjdeš?",dia_angar_djg_anwerben_wann);
	};
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"Co ti drakobijci?",dia_angar_djg_anwerben_djg);
	};
};

func void dia_angar_djg_anwerben_djg()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//Co ti drakobijci?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Promluvím si s nimi pozdìji. Možná se jim moje silné paže budou hodit.
};

func void dia_angar_djg_anwerben_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Kdy pùjdeš?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Jakmile mi bude líp.
};

func void dia_angar_djg_anwerben_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//Kam chceš vyrazit?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//Mìl bych se vydat na jih, tam, co jsem byl naposled.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Je tam jeskynní hrob obklopený balvany.
};

func void dia_angar_djg_anwerben_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Buï opatrný.
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
	npc = djg_705_angar;
	nr = 9;
	condition = dia_angardjg_wasmachstdu_condition;
	information = dia_angardjg_wasmachstdu_info;
	description = "Nìco je špatnì?";
};


func int dia_angardjg_wasmachstdu_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,dia_angar_djg_anwerben) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Nìco je špatnì?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//Slyšels to? Ještì nikdy jsem v celém svém životì neslyšel tak pøíšerný zvuk!
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Co myslíš? Neslyšel jsem ani hlásku!
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Celá tahle oblast páchne smrtí a zkázou. Ta zahnívající stvoøení hlídají skalní pøístup do krypty, tam pøed námi.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//Skrývá se tam nìco pøíšerného a vysílá to své nohsledy na povrch zemì.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Jsem si témìø jistý, že jsem ten amulet ztratil nìkde tady.
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angardjg_wasmachstdu,"Mluvil jsi s drakobijci?",dia_angardjg_wasmachstdu_djg);
	};
};

func void dia_angardjg_wasmachstdu_djg()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Mluvil jsi s drakobijci?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Ano. Ale oèekával jsem spoleèenstvo podobné tomu, co jsme mìli v táboøe v bažinách.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//Ti chlapi ale nejsou nic víc než jen divoká nesourodá sbírka naprostých pitomcù. To není nic pro mì.
};


instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 10;
	condition = dia_angardjg_whatsinthere_condition;
	information = dia_angardjg_whatsinthere_info;
	description = "Co se skrývá v té jeskyni ve skalách?";
};


func int dia_angardjg_whatsinthere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_wasmachstdu) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_whatsinthere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Co se skrývá v té jeskyni ve skalách?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Nìco mi nechce dovolit se k té jeskyni pøiblížit!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//Støeží ji magická stvoøení. Vidìl jsem je v noci, jak prohledávají okolí. Nechutnost sama.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Obrátili se nazpìt a zmizeli mezi stromy. A tys mìl pocit, jako by vysáli všechen život z okolí jako houba vysává vodu.
	b_logentry(TOPIC_DRAGONHUNTER,"V Hornickém údolí jsem nalezl Angara.");
};


instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 11;
	condition = dia_angardjg_wanttogointhere_condition;
	information = dia_angardjg_wanttogointhere_info;
	description = "Jdeme spoleènì.";
};


func int dia_angardjg_wanttogointhere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_whatsinthere) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wanttogointhere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Jdeme spoleènì.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Zkusím to. Ale buï opatrný.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(skeletonmage_angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_ANGARANGRIFF = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ANGARDJG_UNDEADMAGEDEAD(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagedead_condition;
	information = dia_angardjg_undeadmagedead_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagedead_condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_ANGARANGRIFF == TRUE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagedead_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//(køièí) Jenom smrt a zkáza. Musím se odsud dostat.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_ANGARDJG_UNDEADMAGECOMES(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagecomes_condition;
	information = dia_angardjg_undeadmagecomes_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagecomes_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,dia_angardjg_wanttogointhere) && (Npc_KnowsInfo(other,dia_angardjg_undeadmagedead) == FALSE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagecomes_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//(šeptá) Tady to je! Slyšels to?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_ANGAR_WASISTLOS(C_INFO)
{
	npc = djg_705_angar;
	nr = 14;
	condition = dia_angar_wasistlos_condition;
	information = dia_angar_wasistlos_info;
	description = "Co se dìje?";
};


func int dia_angar_wasistlos_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angar_wasistlos_info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//Co se dìje?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//Dál už s tebou jít nemùžu.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Nìco mi øíká, že se odsud živý nedostanu.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Nedokážu to vysvìtlit, ale...
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//Mìl bych se z týhle zpropadený zemì dostat co nejrychlejš. Jinak mì potká stejný osud jako mé bratry.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Pokaždý, když narazím na tyhle... zplozence pekel, mám pocit, jako bych bojoval proti vlastním lidem.
	};
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_DRAGONHUNTER,"Angar prostì odešel. Pøi boji se všemi tìmi nemrtvými mìl pocit, jako by bojoval s vlastními druhy.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_ANGAR_WHYAREYOUHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 15;
	condition = dia_angar_whyareyouhere_condition;
	information = dia_angar_whyareyouhere_info;
	description = "Angare! Co tady dìláš?";
};


func int dia_angar_whyareyouhere_condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_angar_whyareyouhere_info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Angare! Co tady dìláš?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//Byl jsem na cestì k prùsmyku, když jsem narazil na skøety. Nedokázal jsem ty bezbožný barbary setøást.
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Zatím tady poèkám a pak projdu prùsmykem. Uvidíme se na druhé stranì!
	b_logentry(TOPIC_DRAGONHUNTER,"Opìt jsem se potkal s Angarem. Ještì poøád zùstává v Hornickém údolí.");
	b_giveplayerxp(XP_ANGARDJGAGAIN);
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PERMKAP4(C_INFO)
{
	npc = djg_705_angar;
	condition = dia_angar_permkap4_condition;
	information = dia_angar_permkap4_info;
	permanent = TRUE;
	description = "Vážnì tì mùžu nechat samotného?";
};


func int dia_angar_permkap4_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_whyareyouhere))
	{
		return TRUE;
	};
};

func void dia_angar_permkap4_info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//Vážnì tì mùžu nechat samotného?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Jasnì. Jdi. Uvidíme se.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar;
	nr = 900;
	condition = dia_angar_pickpocket_condition;
	information = dia_angar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_pickpocket_condition()
{
	return c_beklauen(47,55);
};

func void dia_angar_pickpocket_info()
{
	Info_ClearChoices(dia_angar_pickpocket);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_BACK,dia_angar_pickpocket_back);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_PICKPOCKET,dia_angar_pickpocket_doit);
};

func void dia_angar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_pickpocket);
};

func void dia_angar_pickpocket_back()
{
	Info_ClearChoices(dia_angar_pickpocket);
};

