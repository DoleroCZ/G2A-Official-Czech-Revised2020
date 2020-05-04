
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Podle zpráv, které jsem dostal, je Hornické údolí dost nebezpeèné místo.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Než odejdeš, poøádnì se vybav.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Situace v Hornickém údolí je vážná. Ale pøipravíme nìjaký plán, jak odtamtud dostat naše chlapce i s rudou.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Myslel jsem, že sis pøišel promluvit s lordem Hagenem. Mìl bys jít dál a popovídat si s ním.
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "Jaká je situace na kontinentu?";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jaká je situace na kontinentu?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Válka ještì není vyhraná, i když královské síly už ženou skøety zpìt.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Na mnohých místech se ale shromažïují menší tlupy skøetù a snaží se naší armádu roztøíštit.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Bojují beze cti a bez víry - musíme tedy zvítìzit.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "Mùžeš mì nìco nauèit?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Mùžeš mì nìco nauèit?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Mùžu tì nauèit, jak si posílit paže, abys mohl používat zbranì efektivnìji.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Ingmar mi mùže pomoci zvýšit sílu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Uèím pouze èleny našeho Øádu.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "Chtìl bych se stát silnìjším.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chtìl bych se stát silnìjším.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Už jsi silný jako trol. Není nic, co bych tì mohl nauèit.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "Skøeti plánují hlavní ofenzívu.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Skøeti plánují hlavní ofenzívu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Vážnì. Tak to je velice zajímavé. A na základì èeho se tak domníváš?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Mluvil jsem s nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Po kraji se potulují jejich velitelé.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hmm. To nezní jako typická skøetí strategie.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"Radìji bys mìl pøijít na nìco, jak se jich zbavit.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"Co udìláme?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"Co to znamená?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ingmar se velmi zajímá o pøíbìh skøetích elitních váleèníkù.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Radìji bys mìl pøijít na nìco, jak se jich zbavit.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Mìlo by staèit, kdybychom mìli víc informací. Pošlu nìkoho, aby prozkoumal okolí.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to znamená?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Pokud to, co øíkáš, je pravda, tak nás chtìjí oslabit zevnitø tím, že na nás budou útoèit jejich nejlepší váleèníci.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Obvykle jeden takový velitel vede skupinu skøetích bojovníkù. Málokdy jich vidíš dva nebo víc pohromadì.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//Dìlají to z nìjakého dùvodu. Jejich vùdci tvoøí jádro útoèné strategie a vìtšinou jsou obklopeni skøetími váleèníky.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Je tedy velice tìžké se k nìkomu z nich dostat, aniž by bylo nutné si prosekat cestu alespoò tøiceti nepøáteli.
	b_logentry(TOPIC_ORCELITE,"Ingmar se zmínil o hlavním skøetím vojevùdci.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co udìláme?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Když jich je tolik jako teï, jedná se vìtšinou o nájezdnou patrolu, kterou vede ten nejvýše postavený z nich.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Nejvýše postavený vojevùdce si zaøídí hlavní stan v nìjaké jeskyni, odkud vysílá své vojsko do boje.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Pokud by se nám podaøilo tohoto velitele zneškodnit, získali bychom tak nezanedbatelnou výhodu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Skøetí velitel se vìtšinou pohybuje v blízkosti svých nepøátel. Asi by bylo dobré hledat jeho jeskyni nìkde nedaleko mìsta.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Nìkolik skøetù bylo spatøeno poblíž Lobartovy farmy. Asi by bylo moudré zaèít s pátráním tam.
	b_logentry(TOPIC_ORCELITE,"Podle Ingmara bych mìl skøetího plukovníka hledat v jeskyni kdesi u Lobartova statku. Mám ho najít a znièit.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "Našel jsem hlavní stan skøetù. Jejich vojevùdce padl.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Našel jsem hlavní stan skøetù. Jejich vojevùdce padl.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To je vynikající zpráva. Skøeti tak nebudou mít nìjaký èas na útok ani pomyšlení.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//To není špatné. Kdybychom mìli víc rytíøù jako jsi ty, byla by nadcházející bitva pøedem rozhodnuta.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Vezmi si tohle zlato a kup si za nìj nìjakou poøádnou výbavu.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(Tento svitek je témìø nemožné ukrást.)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

