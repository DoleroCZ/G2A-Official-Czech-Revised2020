
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "MusÌm jÌt!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hej! A co moje prachy?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Jsi b˝val˝ trestanec z d˘lnÌ kolonie, nic ti neprod·m!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaû mi svÈ zboûÌ.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Ukaû mi svÈ zboûÌ.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Innos tÏ prov·zej, cizinËe. Jestli si chceö po¯Ìdit dobrou cestovatelskou v˝bavu, pak jsi na tom spr·vnÈm mÌstÏ.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Ale varuji tÏ: jestli m·ö v pl·nu si invent·¯ vylepöit nÏjak pokoutnÏ bez placenÌ, zavol·m str·ûe!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//PoËkej, copak vypad·m jako nÏjak˝ chmat·k?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(pohrdavÏ) Pche! Dneska bys nebyl prvnÌ, kdo by se mi snaûil nÏco Ëmajznout.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jora prod·v· na trûiöti vöechny moûnÈ zbranÏ.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "NÏkdo tÏ okradl?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//NÏkdo tÏ okradl?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Nem˘ûu to dok·zat, ten manÌk byl zatracenÏ chytr˝. P¯edstavil se jako Rengaru - pokud to tedy je jeho skuteËnÈ jmÈno.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//PoslednÌch p·r dnÌ jen tak zevloval na trûiöti.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//A kaûd˝ veËer se p¯Ìmo na ulici nalÌv· pivem. VsadÌm boty, ûe ten ömejd chlast· za MOJE penÌze!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Jen jsem se na chvilku podÌval jinam a uû jsem byl bez portmonky!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Poslyö - jestli se ti povede z toho Rengaru vyt¯Ìskat moje prachy, povÌm ti vöechno, co vÌm.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "Mohl bych se pokusit zÌskat zp·tky tvoje penÌze.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Mohl bych se pokusit zÌskat zp·tky tvoje penÌze.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(ned˘vÏ¯ivÏ) Fakt? A jak to chceö udÏlat?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Ale za odmÏnu chci Ë·st zlata!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"R·d bych se dozvÏdÏl, jak se dostat do cechu zlodÏj˘.",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"P¯ijde na to - m˘ûu se s tvou pomocÌ dostat do hornÌ Ëtvrti?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//P¯ijde na to - m˘ûu se s tvou pomocÌ dostat do hornÌ Ëtvrti?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(smÏje se) To jsi na öpatnÈ adrese, j· v˘bec nejsem z mÏsta - jako vÏtöina kupc˘ na trûiöti.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Jestli se chceö dostat do hornÌ Ëtvrti, promluv si v dolnÌ Ë·sti mÏsta s nÏkter˝mi mÌstnÌmi obchodnÌky.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//R·d bych se dozvÏdÏl, jak se dostat do cechu zlodÏj˘.
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Moûn·, ûe ti mohu pomoci.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"UvidÌm, co se d· dÏlat.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Kolik penÏz to bylo?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"ProË jsi nezavolal str·ûe?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Ale za odmÏnu chci Ë·st zlata!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Nejd¯Ìv se postarej o to, aby mi vr·tili portmonku, a teprve PAK si promluvÌme o odmÏnÏ!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"UvidÌm, co se d· dÏlat.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Kolik penÏz to bylo?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"ProË jsi nezavolal str·ûe?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//ProË jsi nezavolal str·ûe?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Str·ûe jsou nÏco platnÈ, pouze pokud zlodÏje p¯istihneö p¯i Ëinu.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//A kdyû jsem zjistil, ûe jsem bez portmonky, ten parchant uû byl d·vno v prachu!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Kolik penÏz to bylo?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 zlaù·k˘ - v tÈhle mizernÈ dobÏ je to vÌc neû dost.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//UvidÌm, co se d· dÏlat.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Dej si pozor. Jestli toho lotra jen tak zml·tÌö, vloûÌ se do toho str·ûe.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//PoslednÌ dobou je to tu pÏknÏ drsnÈ. Od chvÌle, co do mÏsta p¯ibyli paladinovÈ, str·ûe kaûdÈho rv·Ëe bez milosti sejmou.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Budeö si muset nÏco vymyslet.
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//JasnÏ.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"ObchodnÌka Jora okradl chlapÌk jmÈnem Rengaru, kter˝ se p¯es den potuluje po trûiöti.");
	b_logentry(TOPIC_JORA,"MusÌm Jorovi vr·tit ukradenÈ zlato.");
	b_logentry(TOPIC_JORADIEB,"ObchodnÌka Jora okradl chlapÌk jmÈnem Rengaru - jestli ho chytÌm, moûn· z toho bude koukat i nÏjak· odmÏna.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "K tomu zlodÏji...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//K tomu zlodÏji...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Tak jak to vypad·? Chytils ho, a co je d˘leûitÏjöÌ, m·ö to moje zlato?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"No, stala se mu takov· tragick· nehoda.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"Uû jsem ho dostal. Je to v klidu.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"Utekl mi.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"JeötÏ st·le na tom pracuji.",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//JeötÏ st·le na tom pracuji.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Tak koukej, aù uû to zlato m·m zp·tky!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Utekl mi.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//A co moje zlato? To se taky ztratilo s nÌm?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Ano, lapil jsem ho, jak se pat¯Ì. TeÔ bude chvÌli bruËet v base.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//A co moje zlato?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//No, stala se mu takov· tragick· nehoda...
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//AspoÚ uû nikomu nic neukradne. Innosova spravedlnost zvÌtÏzila!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Kde je moje zlato?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "Tady je tÏch 50 zlaù·k˘, co ti ukradl.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Tady je tÏch 50 zlaù·k˘, co ti ukradl.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Innos buÔ pochv·len! Tak p¯ece je tady ve mÏstÏ jeötÏ nÏjak· spravedlnost!
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hej, tohle nenÌ 50 zlaù·k˘! SnaûÌö se mÏ taky oökubat, nebo co?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "Co vÌö o cechu zlodÏj˘?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Co vÌö o cechu zlodÏj˘?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//No dob¯e, tak poslouchej- ale jako bych ti nic ne¯ekl, kapiöto?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//Do krËmy v docÌch chodÌ p·r podez¯el˝ch t˝pk˘.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//VsadÌm se, ûe i s·m krËm·¯ jich nÏkolik zn·.
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Jestli chceö vystopovat zlodÏje, zkus si promluvit pr·vÏ s NÕM.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//M˘ûeö t¯eba p¯edstÌrat, ûe ses zapletl do nÏËeho nekalÈho. Na to by mohl naletÏt.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Ale mÏj p¯itom oËi otev¯enÈ - s tÏmi lidmi si nenÌ radno zahr·vat.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "Ale za odmÏnu chci Ë·st zlata!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Ale za odmÏnu chci Ë·st zlata!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Ale j· uû jsem ti dal cennou radu.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//Tohle by jako odmÏna mÏlo staËit.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//Jestli chceö zlato, tak vyp·trej zlodÏje a pak si u lorda Andreho vyzvedni odmÏnu.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//TeÔ se musÌm zase vÏnovat z·kaznÌk˘m.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "Alrik tvrdÌ, ûe m·ö jeho meË.";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik tvrdÌ, ûe m·ö jeho meË.
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//MyslÌö toho otrhance, co mi prodal svou zbraÚ za p·r pochodnÌ a kousk˘ masa?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Jo, to je on.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Jeho meË po¯·d jeötÏ m·m.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//A kolik za nÏj budeö chtÌt?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//No, ûe jsi to ty...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//¡le, vÌö co? Vem si ho zadarmo. Kdyû uû nic jinÈho, vr·tils mi moje penÌze.
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//No, ûe jsi to ty - 50 zlaù·k˘.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(mrzutÏ) J· uû ho ale nem·m! »ert vÌ, kam se podÏl.
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Tady je 50 zlaù·k˘, a teÔ mi dej Alrik˘v meË.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Tady je 50 zlaù·k˘, a teÔ mi dej Alrik˘v meË.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Tum·ö - (vychytrale) byl to dobr˝ obchod.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//Nem·ö sice dost zlata, ale to nevadÌ - nÏjak˝ Ëas ti tu ten meË odloûÌm. Takûe se m˘ûeö vr·tit pozdÏji.
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

