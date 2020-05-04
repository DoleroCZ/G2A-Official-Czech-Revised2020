
instance DIA_ADDON_BILL_EXIT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 999;
	condition = dia_addon_bill_exit_condition;
	information = dia_addon_bill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bill_exit_condition()
{
	return TRUE;
};

func void dia_addon_bill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BILL_PICKPOCKET(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 900;
	condition = dia_addon_bill_pickpocket_condition;
	information = dia_addon_bill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bill_pickpocket_condition()
{
	return c_beklauen(80,205);
};

func void dia_addon_bill_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_BACK,dia_addon_bill_pickpocket_back);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_PICKPOCKET,dia_addon_bill_pickpocket_doit);
};

func void dia_addon_bill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bill_pickpocket);
};

func void dia_addon_bill_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
};


instance DIA_ADDON_BILL_HELLO(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 1;
	condition = dia_addon_bill_hello_condition;
	information = dia_addon_bill_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bill_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//Vše ok?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Co je? Henry tì sem poslal?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Øekni mu, e dostane svá prkna, jakmile je dodìlám.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//Jestli se mu to nebude líbit, mùe si je jít udìlat sám.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BILL_PLANKS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 2;
	condition = dia_addon_bill_planks_condition;
	information = dia_addon_bill_planks_info;
	description = "Co dìláš s tìmi deskami?";
};


func int dia_addon_bill_planks_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_planks_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Co dìláš s tìmi deskami?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//Jsou na palisádu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg si myslí, e je dobrı nápad opevnit tábor.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Ale kdy se mì ptáš, moná bychom se nemìli rušit.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Jestli na nás chtìjí banditi zaútoèit, tyto smìšné palisády je jistì nezastaví.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Nikdy jsme je nemìli tolerovat v našem údolí.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Kdybych to vìdìl døív, zùstal bych v Khorinisu.
};


var int bill_perm_once;

instance DIA_ADDON_BILL_PERM(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 4;
	condition = dia_addon_bill_perm_condition;
	information = dia_addon_bill_perm_info;
	permanent = TRUE;
	description = "Mùu ti pomoct?";
};


func int dia_addon_bill_perm_condition()
{
	if((GREGISBACK == FALSE) && Npc_WasInState(self,zs_saw))
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Mùu ti pomoct?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Bez starostí, zvládnu to sám.
	if(BILL_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//Pøidal jsem sem teprve nedávno a kdybych nechal dìlat lidi svou práci, dlouho bych tu nebyl. Chápeš?
		BILL_PERM_ONCE = TRUE;
	};
};


instance DIA_ADDON_BILL_PERM2(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 5;
	condition = dia_addon_bill_perm2_condition;
	information = dia_addon_bill_perm2_info;
	permanent = TRUE;
	description = "Co dìláš?";
};


func int dia_addon_bill_perm2_condition()
{
	if(GREGISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm2_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Co dìláš?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Zaprvé odpoèívám.
	if(!Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(radostnì) Francis mi dal mou starou práci.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Pro mì, za mì, mùu tu dìlat desky, dokud peklo nezamrzne.
	};
};


instance DIA_ADDON_BILL_ANGUSNHANK(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 11;
	condition = dia_addon_bill_angusnhank_condition;
	information = dia_addon_bill_angusnhank_info;
	permanent = FALSE;
	description = "Hledám Anguse a Hanka.";
};


func int dia_addon_bill_angusnhank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushank) && Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_angusnhank_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Hledám Anguse a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(povzdechne si) Nemám ani ponìtí, kde by mohli bıt. Hádal bych, e je dostali banditi.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Byli jste pøátelé, nebo ne?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//Vše, co vím, je, e se chtìli setkat s bandity v nedaleké jeskyni.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//Mìlo by to bıt nìkde na vıchod od tábora.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Nevím ale pøesnì kde. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Nejlepší se zeptat Aligatora Jacka. Je vdy nìkde pøed táborem.
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Angus a Hank mìli jeskyni na vıchod od tábora. Aligator Jack by mohl vìdìt víc.");
};


instance DIA_ADDON_BILL_FOUNDFRIENDS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 12;
	condition = dia_addon_bill_foundfriends_condition;
	information = dia_addon_bill_foundfriends_info;
	permanent = FALSE;
	description = "Našel jsem tvé pøátele.";
};


func int dia_addon_bill_foundfriends_condition()
{
	if(!Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_foundfriends_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Našel jsem tvé pøátele.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//A? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(naštvanì) To byli ti prokletí banditi!
	if(SC_KNOWS_JUANMURDEREDANGUS == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Moná.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Ti hnusní bastardi. Pøeji si, aby odešli do pekla.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//(k sobì, naštvanì) Rád bych znal jména tìch, co to udìlali ...
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLJUAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLJUAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Bill byl úplnì rozrušen, kdy jsem mu povìdìl o smrti Angude a Hanka. Chce znát jména vrahù.");
};


instance DIA_ADDON_BILL_JUANMURDER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 13;
	condition = dia_addon_bill_juanmurder_condition;
	information = dia_addon_bill_juanmurder_info;
	description = "Vím, kdo zabil Angude a Hanka.";
};


func int dia_addon_bill_juanmurder_condition()
{
	if((MIS_ADDON_BILL_SEARCHANGUSMURDER == LOG_RUNNING) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_juanmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//Vím, kdo zabil Angude a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//(rozrušenì) Kdo? Kdo to byl?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//Jeho jméno je Juan a je jedním z banditù.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Budu ho pronásledovat a do konce, slyšíš mì?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Nesmí se odtud dostat iví!
	b_logentry(TOPIC_ADDON_KILLJUAN,"Já zabiju Juana. Pomstím Anguse a Hanka.");
};


instance DIA_ADDON_BILL_KILLEDESTEBAN(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 14;
	condition = dia_addon_bill_killedesteban_condition;
	information = dia_addon_bill_killedesteban_info;
	description = "O Juana je postaráno.";
};


func int dia_addon_bill_killedesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_juanmurder) && Npc_IsDead(juan))
	{
		return TRUE;
	};
};

func void dia_addon_bill_killedesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//O Juana je postaráno.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//(horlivì) A? Trpìl?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Nech to bıt.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(povzdechne si) Máš pravdu. Koneènì je mrtev.
	b_logentry(TOPIC_ADDON_KILLJUAN,"Juan je mrtev. Bill je celkem potìšen.");
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_BILL_KILLANGUSMURDER);
};


instance DIA_ADDON_BILL_KHORINIS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 21;
	condition = dia_addon_bill_khorinis_condition;
	information = dia_addon_bill_khorinis_info;
	description = "Bıvávals v Khorinisu?";
};


func int dia_addon_bill_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_planks))
	{
		return TRUE;
	};
};

func void dia_addon_bill_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//Bıvávals v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Ano, bıval jsem malım kapesním zlodìjem a podvodníkem.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Ale kdy pøijídìlo ménì a ménì lodí, obchod trpìl.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//A nemohl jsem vìdìt, jak domobrana prahne po pìnìzích.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//Tak jsem se pøidal k Gregovi. A nyní jsem zde.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(povzdechne si) Øeu celı den desky na palisádu, která bude stejnì k nièemu.
	};
};


instance DIA_ADDON_BILL_TEACHPLAYER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 22;
	condition = dia_addon_bill_teachplayer_condition;
	information = dia_addon_bill_teachplayer_info;
	description = "Mùeš mì nìco nauèit?";
};


func int dia_addon_bill_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_bill_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Mùeš mì nìco nauèit?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Mùu tì nauèit, jak vyprázdnit kapsy ostatním, ani by si toho všimli.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Ale musíš bıt aspoò trochu obratnı, jinak to nemá vıznam.
	BILL_ADDON_TEACHPICKPOCKET = TRUE;
};


instance DIA_ADDON_BILL_LEARNTALENT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 23;
	condition = dia_addon_bill_learntalent_condition;
	information = dia_addon_bill_learntalent_info;
	permanent = TRUE;
	description = "Uka mi, jak vybírat kapsy(10 LP).)";
};


func int dia_addon_bill_learntalent_condition()
{
	if((BILL_ADDON_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_learntalent_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Uka mi, jak vybírat kapsy.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Kdy budeš chtít nìkoho okrást, ujisti se, e jsi v bezpeèí a e tì nikdo nesleduje.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//Pøijdeš k nim a normálnì s nimi promluvíš.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Kdy nìco bereš, ujisti si, e si obì nièeho nevšimla.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Nìco dalšího?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Ano, zlepšuj se v obratnosti. Èím jsi obratnìjší, tím lépe ti to pùjde.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//A hlavnì se nenech chytit.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//To je vše, co se tıèe teorie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Zapomeò na to, jsi pøíliš nemotornı.
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Buï se staò obratnìjším nebo si seeò lepšího uèitele.
	};
};

