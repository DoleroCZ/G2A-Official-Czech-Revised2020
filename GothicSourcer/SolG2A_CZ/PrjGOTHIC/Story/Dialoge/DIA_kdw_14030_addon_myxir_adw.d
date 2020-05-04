
instance DIA_ADDON_MYXIR_ADW_EXIT(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 999;
	condition = dia_addon_myxir_adw_exit_condition;
	information = dia_addon_myxir_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_ADWHELLO(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_adwhello_condition;
	information = dia_addon_myxir_adwhello_info;
	description = "Máš nìjaké zprávy?";
};


func int dia_addon_myxir_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Máš nìjaké zprávy?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Stavitelé tìchto ruin mì fascinují!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Je to škoda, e jejich jazyk je mrtví jako oni sami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(zamyšlenì) Jejich pozoruhodné rituály a také pøivolávání pro nì nebyli ádnou záchranou.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Pøivolávání?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Stavitelé mìli silné spojení se svìtem duchù.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jestli jsem pochopil správnì jejich myšlení, mìli spojení se svımi pøedky celou dobu.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Kvùli tomu pravidelnì poøádali pøivolávání a rituály, aby dostali radu.
	Info_ClearChoices(dia_addon_myxir_adwhello);
	Info_AddChoice(dia_addon_myxir_adwhello,"Jak funguje to pøivolávání?",dia_addon_myxir_adwhello_wie);
	Info_AddChoice(dia_addon_myxir_adwhello,"Nemrtví, co já vím, toho moc nenamluví.",dia_addon_myxir_adwhello_watt);
};

func void dia_addon_myxir_adwhello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak funguje to pøivolávání?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Stráci mrtvıch mìli svá speciální kouzla, kterımi klidnili duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Texty, které se zde dají najít, jsou docela zmatené. Pøesné odpovìïi na mé otázky nenalézám jen velmi málo kdy.
};

func void dia_addon_myxir_adwhello_watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Nemrtví, co já vím, toho moc nenamluví.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Stavitelé nestvoøili bezduché nemrtvé jako zombie nebo jiné zlé nestvùry.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//S duchy jsou duše velkıch bojovníkù, knìí a vládcù.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Doteï nemám ádné pochybnosti, e opravdu existují.
};


instance DIA_ADDON_MYXIR_PERMADW(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 10;
	condition = dia_addon_myxir_permadw_condition;
	information = dia_addon_myxir_permadw_info;
	permanent = TRUE;
	description = "Pokud potkám ducha, dám ti vìdìt.";
};


func int dia_addon_myxir_permadw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_adwhello) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Pokud potkám ducha, dám ti vìdìt.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(smìje se) Ano, to urèitì udìlej.
};


instance DIA_ADDON_MYXIR_GEISTTAFEL(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geisttafel_condition;
	information = dia_addon_myxir_geisttafel_info;
	description = "Saturas mì poslal.";
};


func int dia_addon_myxir_geisttafel_condition()
{
	if((SATURAS_RIESENPLAN == TRUE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geisttafel_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas mì poslal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven se ukryl do chrámu a zavøel za sebou portál.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas se domnívá, e získal znalosti o chrámu od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(zdrcenı) Oh Adane!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Musel pøivolat vrchního knìze Khardimona, aby se ho zeptal na cestu do chrámu.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Podle zaznamù má hrob v jeskyních pod pevností!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Musíš udìlat to samé.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale Khardimona se u zeptat nemùeš ...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//Hrob váleèníka Quahodrona leí na západì údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Musíš ho najít ... a probudit Quahodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//V tìchto nápisech je napsáno, jak vìøící Adanose mùe pøivolat ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Myslíš, e opravdu fungují?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Pøeèetl jsem hodnì písma.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Napøíklad zápisi Y'Beriona, vùdce Bratrstva Spáèe.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale vìøím kadému slovu autora TÌCHTO spiskù!
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_RUNNING;
	Info_ClearChoices(dia_addon_myxir_geisttafel);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Myslíš to vánì?",dia_addon_myxir_geisttafel_geist);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Proè Quarhodron? Proè ne vrchní knìz Khardimon osobnì?",dia_addon_myxir_geisttafel_khardimon);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Bratrstvo Spáèe neøíkalo jenom li. Spáè je vydával.",dia_addon_myxir_geisttafel_psi);
};

func void dia_addon_myxir_geisttafel_khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Proè Quarhodron? Proè ne vrchní knìz Khardimon osobnì?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven znesvìtil hrob svım pøivoláváním. To je jisté.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Musíme se podívat po jiném duchovi.
};

func void dia_addon_myxir_geisttafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bratrstvo Spáèe neøíkalo jenom li. Spáè je vydával.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nebyly jenom jejich li, to je nepravdìpodobné, byli to jejich slova.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Slova byla víc nevysvìtlitelná ne pøesvìdèivá. Bylo to oveøené nadmìrnım pouíváním bahenních rostlin, které kouøili.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Je to závanìjší a rozvánìjší ve slovech této kamenné desky, co mì pøesvìdèilo o skuteènosti, e TEN mu sem napsal pravdu.
};

func void dia_addon_myxir_geisttafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Myslíš to vánì?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Nechci nechat jedinı kámen nerozluštìnı.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//I jestli pro nás existuje jenom nádech šance potkat jednoho ze stavitelù, pak to musíme zkusit.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Raven to také dokázal.
	Info_AddChoice(dia_addon_myxir_geisttafel,"Souhlasím, pøivolám ducha. Co mám udìlat?",dia_addon_myxir_geisttafel_wie);
};

func void dia_addon_myxir_geisttafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Souhlasím, pøivolám ducha. Co mám udìlat?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Najdi Quahodronùv hrob na západì údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Se slovy Strácù mrtvıch, které jsem napsal, bude jeho duch pøivolán.
	CreateInvItems(self,itwr_addon_summonancientghost,1);
	b_giveinvitems(self,other,itwr_addon_summonancientghost,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//To vše. Teï musíme najít jeho hrob.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Hodnì štìstí synu!
	b_logentry(TOPIC_ADDON_QUARHODRON,"Myxir chce abych probudil ducha pradávného váleèníka Quadrohona a zeptal se ho na radu. Dal mi dokument s magickou formulí, kterou mám nahlas pøeèíst v Quarhodronovì hrobì na západì.");
	Info_ClearChoices(dia_addon_myxir_geisttafel);
};


instance DIA_ADDON_MYXIR_GEISTPERM(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geistperm_condition;
	information = dia_addon_myxir_geistperm_info;
	description = "Jak to bylo znovu o váleèníkovi 'Quarhodronovi'?";
};


func int dia_addon_myxir_geistperm_condition()
{
	if(MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geistperm_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Jak to bylo znovu o váleèníkovi 'Quarhodronovi'?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Mìl bys najít jeho hrob a pøivolat ho pomocí slov Strácù mrtvıch.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Napsal jsem ty slova. Musíš je jenom nahlas pøeèíst.
};


instance DIA_ADDON_MYXIR_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_talkedtoghost_condition;
	information = dia_addon_myxir_talkedtoghost_info;
	description = "Promluvil jsem s Quarhodronem.";
};


func int dia_addon_myxir_talkedtoghost_condition()
{
	if((MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING) && (SC_TALKEDTOGHOST == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Promluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(nadšenı) Pak ho opravdu mùeš probudit z království mrtvıch?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To je opravdu zajímavé. Obdivuji tyto stavitele èím dál víc.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kdo ví, èeho mohli dosáhnout, pokud by stále existovali ...
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MYXIR_GEISTBESCHWOEREN);
	if((SATURAS_KNOWSHOW2GETINTEMPEL == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co ten duch øíkal?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Dal mi nìco, s èím se mohu dostat do chrámu.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Pak jdi pøímo k Saturasovi. Bude se o to zajímat.
		b_logentry(TOPIC_ADDON_QUARHODRON,"Mìl bych ohlásit Saturasovi, e jsem probudil Quarhodrona.");
	};
};


instance DIA_ADDON_MYXIR_ADW_TEACH(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 90;
	condition = dia_addon_myxir_adw_teach_condition;
	information = dia_addon_myxir_adw_teach_info;
	permanent = TRUE;
	description = "Nauè mì cizí jazyk.";
};


var int dia_addon_myxir_adw_teach_noperm;
var int dia_addon_myxir_adw_teach_onetime;

func int dia_addon_myxir_adw_teach_condition()
{
	if((DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if(DIA_ADDON_MYXIR_ADW_TEACH_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
		DIA_ADDON_MYXIR_ADW_TEACH_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_adw_teach);
		Info_AddChoice(dia_addon_myxir_adw_teach,DIALOG_BACK,dia_addon_myxir_adw_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_adw_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_adw_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_adw_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_adw_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_adw_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

