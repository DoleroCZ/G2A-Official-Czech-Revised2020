
instance DIA_OPOLOS_KAP1_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap1_exit_condition;
	information = dia_opolos_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_opolos_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLO(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_hello_condition;
	information = dia_opolos_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_hello_info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Ahoj, ty musíš být ten nový chlapík.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Jsem Opolos. Starám se tady o ovce.
};


instance DIA_OPOLOS_WURST(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_wurst_condition;
	information = dia_opolos_wurst_info;
	permanent = FALSE;
	description = "Mám tu pro tebe skopovou klobásu.";
};


func int dia_opolos_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_opolos_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//Mám tu pro tebe skopovou klobásu.
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//No èlovìèe, to je skvìlý! Koneènì další výborná skopová klobása.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_OPOLOS_HOWLONG(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_howlong_condition;
	information = dia_opolos_howlong_info;
	permanent = FALSE;
	description = "Jak dlouho už jsi v klášteøe?";
};


func int dia_opolos_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello))
	{
		return TRUE;
	};
};

func void dia_opolos_howlong_info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Jak dlouho už jsi v klášteøe?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Jsem tady tøi roky. Ale zatím jsem vùbec nestudoval, i když bych rád.
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Proè ne?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Mojí prací je starat se o ovce - ne studovat spisy.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//Dokud mì mistr Parlan neuvolní z téhle služby, nemùžu studovat v knihovnì.
	MIS_HELPOPOLOS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_OPOLOSSTUDY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSSTUDY,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSSTUDY,"Opolos hlídá ovce, ale rád by si prostudoval i spisky v knihovnì.");
};


instance DIA_OPOLOS_MONASTERY(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_monastery_condition;
	information = dia_opolos_monastery_info;
	permanent = FALSE;
	description = "Jak se mám tady v klášteøe chovat?";
};


func int dia_opolos_monastery_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_monastery_info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Jak se mám tady v klášteøe chovat?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Nikdy nelži mágùm. Neprohøeš se proti bratrovi ze spoleèenstva.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Respektuj majetek spoleèenstva. Pokud tato pravidla porušíš, budeš se zodpovídat mistru Parlanovi.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Kromì toho bych tì mìl varovat, aby ses mìl na pozoru pøed Agonem. Když nebudeš dost opatrný, skonèíš jako Babo.
};


instance DIA_OPOLOS_BEIBRINGEN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_beibringen_condition;
	information = dia_opolos_beibringen_info;
	permanent = FALSE;
	description = "Mohl bys mì nìco nauèit?";
};


func int dia_opolos_beibringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_opolos_beibringen_info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Mohl bys mì nìco nauèit?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Jasnì, kdysi jsem býval docela dobrý rváè. Mùžu ti ukázat, jak posílit paže.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Ale já bych se rád nauèil nìco o lektvarech, hlavnì o tìch magických.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//Jak bych ti s tím jen mohl pomoci?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//No, kdybys pracoval pro Neorase, urèitì by se ti naskytla pøíležitost 'vypùjèit' si na chvíli jeden z jeho receptù.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Když mi ho pøineseš, abych se na nìj mohl podívat, nìco tì urèitì nauèím.
	Log_CreateTopic(TOPIC_OPOLOSREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSREZEPT,"Opolos chce letmo nahlédnout do receptu na lektvary many. Když budu pracovat pro Neorase, možná bych si mohl nìjaký takový spisek pùjèit.");
};


instance DIA_OPOLOS_REZEPT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_rezept_condition;
	information = dia_opolos_rezept_info;
	permanent = TRUE;
	description = "O tom receptu...";
};


var int dia_opolos_rezept_permanent;

func int dia_opolos_rezept_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_OPOLOS_REZEPT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_rezept_info()
{
	if(Npc_HasItems(other,itwr_manarezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//Mám ten recept, který jsi chtìl.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Dobrá, pùjè mi ho, a si ho pøeètu.
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Aha... hm... ano... jo takhle... dobrá, dobrá...
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Tak a je to. Pokud chceš, mùžu tì nìco nauèit.
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		OPOLOS_REZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"S Opolovou pomocí se mohu stát silnìjším.");
	}
	else if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//Už jsem ten recept vrátil Neorasovi.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//A dopr... Asi se tady nic nenauèím. Ale co. Stejnì ti nìco ukážu.
		OPOLOS_REZEPT = LOG_FAILED;
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"S Opolovou pomocí se mohu stát silnìjším.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//K tomu se dostanu pozdìji.
	};
};


instance DIA_OPOLOS_TEACH_STR(C_INFO)
{
	npc = nov_605_opolos;
	nr = 99;
	condition = dia_opolos_teach_str_condition;
	information = dia_opolos_teach_str_info;
	permanent = TRUE;
	description = "Chtìl bych se stát silnìjším.";
};


func int dia_opolos_teach_str_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (OPOLOS_TEACHSTR == TRUE))
	{
		return TRUE;
	};
};

func void dia_opolos_teach_str_info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Chtìl bych se stát silnìjším.
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//Už teï jsi dost silný. Tìžko bych tì nauèil nìco nového.
	};
	Info_ClearChoices(dia_opolos_teach_str);
};

func void dia_opolos_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};


instance DIA_OPOLOS_AGON(C_INFO)
{
	npc = nov_605_opolos;
	nr = 4;
	condition = dia_opolos_agon_condition;
	information = dia_opolos_agon_info;
	permanent = FALSE;
	description = "Kdo jsou Agon a Babo?";
};


func int dia_opolos_agon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_agon_info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Kdo jsou Agon a Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon se staré o bylinkovou zahradu. Je také novic, ale chová se, jako by byl sám Vyvolený.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Babo pøišel do kláštera krátce pøed tebou. Zpoèátku pomáhal Agonovi v zahradì.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Ale museli se asi nìjak poprat a od té doby Babo jen zametá dvùr.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Víš, co se stalo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Ne tak docela pøesnì. Na to se budeš muset zeptat jich. Ale Agonovo slovo má vìtší váhu než kohokoliv z novicù, protože je synovec místodržícího.
};


instance DIA_OPOLOS_LIESEL(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_liesel_condition;
	information = dia_opolos_liesel_info;
	permanent = TRUE;
	description = "Podívej, pøivedl jsem Betsy. Mùžu ji nechat u tebe?";
};


func int dia_opolos_liesel_condition()
{
	if((other.guild == GIL_NOV) && (LIESEL_GIVEAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_liesel_info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Podívej, pøivedl jsem Betsy. Mùžu ji nechat u tebe?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = zs_mm_allscheduler;
		LIESEL_GIVEAWAY = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Ano, samozøejmì. Hezké zvíøátko. Dobøe se o ni postarám.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Hm... zdá se, že jsem to špatnì založil. Vrátím se pozdìji.
	};
};


instance DIA_OPOLOS_BIBLOTHEK(C_INFO)
{
	npc = nov_605_opolos;
	nr = 98;
	condition = dia_opolos_biblothek_condition;
	information = dia_opolos_biblothek_info;
	permanent = TRUE;
	description = "Co se týèe knihovny...";
};


func int dia_opolos_biblothek_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_opolos_howlong))
	{
		return TRUE;
	};
};

func void dia_opolos_biblothek_info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//Co se týèe knihovny...
	if(PARLAN_ERLAUBNIS == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//Je to ta zamèená místnost nalevo, vedle vrat.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Ale klíè dostaneš až ve chvíli, kdy mistr Parlan dojde k názoru, že mùžeš studovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Ty máš víc štìstí než rozumu! Máš klíè ke knihovnì, a pøitom jsi tady jenom takovou chvilku.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Využij té pøíležitosti a uè se ze starých spisù!
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLOAGAIN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_helloagain_condition;
	information = dia_opolos_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_helloagain_condition()
{
	if((other.guild == GIL_KDF) && (MIS_HELPOPOLOS == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_opolos_helloagain_info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Ahoj. Dìkuji, žes mi pomohl. Pokusím se z téhle šance vytìžit co nejvíc a nauèit se tolik, co jen pùjde.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Ale urèitì nemáš èas jen tak klábosit s obyèejným novicem, mistøe.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HOWISIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_howisit_condition;
	information = dia_opolos_howisit_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_opolos_howisit_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_opolos_howisit_info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Jak se vede?
	if(MIS_HELPOPOLOS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Výbornì. Od chvíle, co mohu studovat, je všechno vynikající.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Poslušnì plním všechny zadané úkoly, mistøe.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Každý den pøede mne Innos klade nové výzvy. Budu nadále pracovat na vlastním zdokonalování.
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP2_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap2_exit_condition;
	information = dia_opolos_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_opolos_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap3_exit_condition;
	information = dia_opolos_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_PERM(C_INFO)
{
	npc = nov_605_opolos;
	nr = 39;
	condition = dia_opolos_kap3_perm_condition;
	information = dia_opolos_kap3_perm_info;
	permanent = TRUE;
	description = "Jak je oveèkám?";
};


func int dia_opolos_kap3_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Jak je oveèkám?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//Jak by jim asi tak bylo? Stojí tady a pøežvykují trávu.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Radši bych vìdìl, co se dìje venku. Zdá se, že mágové jsou nìjak pøehnanì nervózní.
	Info_ClearChoices(dia_opolos_kap3_perm);
	Info_AddChoice(dia_opolos_kap3_perm,DIALOG_BACK,dia_opolos_kap3_perm_back);
	Info_AddChoice(dia_opolos_kap3_perm,"V Hornickém údolí jsou draci. Spoleènì s armádou skøetù obléhají královské jednotky.",dia_opolos_kap3_perm_dragons);
	Info_AddChoice(dia_opolos_kap3_perm,"Po krajinì se potulují divní lidé v èerných róbách.",dia_opolos_kap3_perm_dmt);
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_opolos_kap3_perm,"Pedro nás zradil.",dia_opolos_kap3_perm_pedro);
	};
};

func void dia_opolos_kap3_perm_back()
{
	Info_ClearChoices(dia_opolos_kap3_perm);
};


var int opolos_dragons;

func void dia_opolos_kap3_perm_dragons()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//V Hornickém údolí jsou draci. Spoleènì s armádou skøetù obléhají královské jednotky.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Draci? Vždycky jsem si myslel, že existují jenom ve strašidelných pøíbìzích.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//Jsou tam, vìø mi.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Ale královští paladini si s nimi snad poradí, ne?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Uvidíme.
	if(OPOLOS_DRAGONS == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DRAGONS = TRUE;
	};
};


var int opolos_dmt;

func void dia_opolos_kap3_perm_dmt()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Po krajinì se potulují divní lidé v èerných róbách.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Jak to myslíš? Jací divní lidé?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nikdo neví, odkud pøišli. Nosí dlouhé èerné pláštì a tváøe mají zakryté.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Vypadá to na nìjaký druh mágù. Pøinejmenším jsou schopni provozovat magii.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//To zní nepøíjemnì, ale jsem si jistý, že Nejvyšší rada tenhle problém vyøeší.
	if(OPOLOS_DMT == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DMT = TRUE;
	};
};


var int opolos_pedro;

func void dia_opolos_kap3_perm_pedro()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro nás zradil.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//Slyšel jsem o tom, ale nevìdìl jsem, že o tom také víš. Proto jsem nic neøíkal.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Nepøítel je silnìjší než my. Chci øíct - dokážeme ho porazit?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Ještì nejsme mrtví.
	if(OPOLOS_PEDRO == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_PEDRO = TRUE;
	};
};


instance DIA_OPOLOS_KAP4_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap4_exit_condition;
	information = dia_opolos_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_opolos_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP5_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap5_exit_condition;
	information = dia_opolos_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_opolos_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_PICKPOCKET(C_INFO)
{
	npc = nov_605_opolos;
	nr = 900;
	condition = dia_opolos_pickpocket_condition;
	information = dia_opolos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_opolos_pickpocket_condition()
{
	return c_beklauen(54,70);
};

func void dia_opolos_pickpocket_info()
{
	Info_ClearChoices(dia_opolos_pickpocket);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_BACK,dia_opolos_pickpocket_back);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_PICKPOCKET,dia_opolos_pickpocket_doit);
};

func void dia_opolos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_opolos_pickpocket);
};

func void dia_opolos_pickpocket_back()
{
	Info_ClearChoices(dia_opolos_pickpocket);
};

