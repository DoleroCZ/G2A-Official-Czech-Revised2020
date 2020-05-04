
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Podívejme, koho tady máme. Velkı zastánce práva. Fajn, hrdino, copak tu pohledáváme?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Hledám pár odpovìdí.
	if(RANGER_SCKNOWSDEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Neèekal jsem, e sem vlezeš dobrovolnì.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to má znamenat?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To zanemená, e jsem vypsal odmìnu na tvou hlavu. Ještì jsi nevydìl ty plakáty?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Je na nich TVÙJ oblièej. Ano ... jsi hledanı mu. Nevíš o tom?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//NÌKDO dal do obìhu papíry s mojí tváøí. NÌKDO mi øekl, es to byl ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//NÌKDO moc mluvil.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Máš ale pravdu. Stáhl jsem je. A co se nestalo? Pøišel jsi sám.
		MIS_STECKBRIEFE = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Co ode mì chceš?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Já? Nic. Ale mùj šéf tì chce šílenì vidìt mrtvého.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//To je to, proè jsem tì mìl najít a pøinést mu tvoji hlavu.
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Nevìøím ti ani slovo.";
};


func int dia_dexter_glaube_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nevìøím ti ani slovo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hele, je to pravda. Pøísahám na hrob svı matky!
};


instance DIA_ADDON_DEXTER_PATRICK(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_patrick_condition;
	information = dia_addon_dexter_patrick_info;
	description = "Byl tady vidìn oldák jménem Patrick.";
};


func int dia_addon_dexter_patrick_condition()
{
	if((MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_patrick_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Byl tady vidìn oldák jménem Patrick.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrik? Eh? Nikdy jsem o nìm neslyšel.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//Pamatuju se na oldáka, kterı byl zvyklı si to nìkdy rozdat s mımi lidmi.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//(nápadnì le) Aèkoli jsem ho poslední dobou nevidìl.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//(zlomyslnì) Moná ho chlapci povìsili. Tìko øíct.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Dexter tvrdí, e o oldákovi Patrickovi nic neví.");
	DEXTER_KNOWSPATRICK = TRUE;
	b_giveplayerxp(XP_ADDON_DEXTER_KNOWSPATRICK);
};


instance DIA_ADDON_DEXTER_GREG(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_addon_dexter_greg_condition;
	information = dia_addon_dexter_greg_info;
	description = "Je tady nìjakı chlap se záplatou na oku. Hledá TÌ.";
};


func int dia_addon_dexter_greg_condition()
{
	if((SC_KNOWSGREGSSEARCHSDEXTER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Je tady nìjakı chlap se záplatou na oku. Hledá TÌ.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Vypadá to, e mì všichni hledají. Nestarám se o to.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jestli ten chap nìco potøebuje, má pøijít sem.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_DEXTER_MISSINGPEOPLE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_missingpeople_condition;
	information = dia_addon_dexter_missingpeople_info;
	description = "Bylo mi øeèeno, e unášíš lidi z Khorinisu.";
};


func int dia_addon_dexter_missingpeople_condition()
{
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Bylo mi øeèeno, e unášíš lidi z Khorinisu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Take jsi to nakonec zjistil. Dobrá práce, gratuluji.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//Myslím, e budu muset své stopy zahlazovat lépe.
	Info_ClearChoices(dia_addon_dexter_missingpeople);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kdo ti dal ten pøíkaz?",dia_addon_dexter_missingpeople_wer);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kde ti lidé konèí? Tady okolo dolù?",dia_addon_dexter_missingpeople_wo);
};

func void dia_addon_dexter_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Kde ti lidé konèí? Tady okolo dolù?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(smìje se) Skonèí daleko. Za horami na severo-vıchodì a z tvého dosahu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Mohl bych ti ukázat, kde pøesnì, ale nevím proè bych mìl.
};

func void dia_addon_dexter_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kdo ti dal ten pøíkaz?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//Mùj šéf. Nebezpeènı èlovìk. Ty ho znáš. Je to Raven, jeden z trestaneckıch rudnıch baronù, ze Starého tábora v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Potøebuje je pro svùj plán. To je vše, co potøebuješ vìdìt.
	Info_AddChoice(dia_addon_dexter_missingpeople,"Raven nebezpeènı? No ...",dia_addon_dexter_missingpeople_raven);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Rudnı baron tady v Khorinisu?",dia_addon_dexter_missingpeople_raventot);
};

func void dia_addon_dexter_missingpeople_raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Raven nebezpeènı? No ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(popuzenı) CO si myslíš, e víš? Neznáš ho tak jako já.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(rozrušenı) Byl to blb, ale teï ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Od té doby, co padla bariéra, se zmìnil. Jeho tváø je zataená èernım stínem.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(vystrašenı) Jeho pohled tebou pronikne, jako dráp dravce, kdy mu budeš hledìt do oèí moc dlouho.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Mùu ti jen poradit, abys opustil Khorinis co nejrychleji, dokud máš ještì èas, protoe za chvíli u bude pøíliš pozdì.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(sklíèenì) Tady tì nic neèeká, jenom jistá smrt.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Dexter má šéfa. Jmenuje se Raven. Raven je trestaneckı rudnı baron. Nakonec to vypadá, e Raven je ten, kdo stojí za tìmi únosy. Všechno co potøebuju je dùkaz.");
	Info_ClearChoices(dia_addon_dexter_missingpeople);
};

func void dia_addon_dexter_missingpeople_raventot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Rudnı baron tady v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//U není rudnı baron. Teï má své vlastní plány, a Khorinis brzy zjistí dost.
};


instance DIA_ADDON_DEXTER_BOSS(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_addon_dexter_boss_condition;
	information = dia_addon_dexter_boss_info;
	description = "Tvùj šéf? Kdo to mùe bıt?";
};


func int dia_addon_dexter_boss_condition()
{
	if((KNOWS_DEXTER == TRUE) && (SC_KNOWSDEXTERASKIDNAPPER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_boss_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Tvùj šéf? Kdo to mùe bıt?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(smìje se) Rád bys to vìdìl, co? Ano, umím si to pøedstavit.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(vánì) Nemùu uvaovat o dvojím øešení, tak proè bych ti to mìl øíkat.
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "A co máš teï v úmyslu? Zabít mì?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_dexter_missingpeople))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//A co máš teï v úmyslu? Zabít mì?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Jo. Ale tys nás odtamtud všechny dostal. Proto ti taky dám ještì jednu šanci. Zmizni, vypaø se, udìlej se neviditelnım. Jdi a u se mi nikdy nepøiple do cesty.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Musím zjistit, kde jsou zajatí lidé.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(smìje se) Jo. Mùeš to zkusit ze mì vytøískat.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(vıhrunì) Bude lepší, kdy odejdeš.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Kdy tì tu ještì nìkdy uvidím, bez rozpakù tì zabiju.
	DEXTER_NOMORESMALLTALK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((DEXTER_NOMORESMALLTALK == TRUE) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//(útoènì) Kdy je to tak, jak si pøeješ ...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ach jo, chlape. Udìlal bys líp, kdyby ses tu neukazoval. Jsi ve špatnou chvíli na špatnym místì.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	b_greg_comestodexter();
	Info_ClearChoices(dia_dexter_kill);
	Info_AddChoice(dia_dexter_kill,DIALOG_ENDE,dia_dexter_kill_ende);
};

func void dia_dexter_kill_ende()
{
	var C_ITEM itm;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	itm = Npc_GetEquippedArmor(greg_nw);
	if(Hlp_IsItem(itm,itar_pir_h_addon) == FALSE)
	{
		AI_EquipArmor(greg_nw,itar_pir_h_addon);
	};
};


instance DIA_DEXTER_KOPF(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_kopf_condition;
	information = dia_dexter_kopf_info;
	permanent = FALSE;
	description = "Chceš moji hlavu? Pojï si pro ni!";
};


func int dia_dexter_kopf_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_hallo))
	{
		return TRUE;
	};
};

func void dia_dexter_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chceš moji hlavu? Pojï si pro ni!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//(útoènì) Jak si pøeješ.
	dia_dexter_kill_ende();
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

