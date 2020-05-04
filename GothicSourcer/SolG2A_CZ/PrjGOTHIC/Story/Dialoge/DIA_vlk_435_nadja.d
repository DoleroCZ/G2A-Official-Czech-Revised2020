
instance DIA_NADJA_EXIT(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 999;
	condition = dia_nadja_exit_condition;
	information = dia_nadja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nadja_exit_condition()
{
	return TRUE;
};

func void dia_nadja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_PICKPOCKET(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 900;
	condition = dia_nadja_pickpocket_condition;
	information = dia_nadja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_nadja_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_nadja_pickpocket_info()
{
	Info_ClearChoices(dia_nadja_pickpocket);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_BACK,dia_nadja_pickpocket_back);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_PICKPOCKET,dia_nadja_pickpocket_doit);
};

func void dia_nadja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nadja_pickpocket);
};

func void dia_nadja_pickpocket_back()
{
	Info_ClearChoices(dia_nadja_pickpocket);
};


instance DIA_NADJA_STANDARD(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_standard_condition;
	information = dia_nadja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE))
	{
		return TRUE;
	};
};


var int nadja_luciainfo;

func void dia_nadja_standard_info()
{
	if(NADJA_LUCIAINFO == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//MusÌö si nejprve promluvit s Bromorem.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Hele, teÔ zrovna se ti nem˘ûu vÏnovat, feö·ku. Jestli se chceö pobavit, promluv si s Bromorem.
	};
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE) && (NADJA_LUCIAINFO == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//R·d bych se tÏ zeptal na p·r ot·zek ohlednÏ tÏch chybÏjÌcÌch lidÌ.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Dob¯e, je tady nÏco, co bych ti mohla ¯Ìct, ale ne tady, drahouöku.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//OK, tak pojÔme nahoru.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Dob¯e, ale to si musÌö prvnÌ za¯Ìdit s Bromorem. Nechci se dostat do problÈm˘.
		NADJA_LUCIAINFO = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_DANACH(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_danach_condition;
	information = dia_nadja_danach_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_danach_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE) && (NADJA_NACHT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nadja_danach_info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//P¯ÌötÏ p¯ijÔ zase!
	NADJA_NACHT = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_HOCHGEHEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_hochgehen_condition;
	information = dia_nadja_hochgehen_info;
	important = FALSE;
	permanent = TRUE;
	description = "PojÔme nahoru!";
};


func int dia_nadja_hochgehen_condition()
{
	if(BROMOR_PAY == 1)
	{
		return TRUE;
	};
};

func void dia_nadja_hochgehen_info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//PojÔme nahoru!
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Dneska m·ö öùastn˝ den, feö·ku. PojÔme.
	BROMOR_PAY = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_ADDON_NADJA_LUCIAINFO(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 5;
	condition = dia_addon_nadja_luciainfo_condition;
	information = dia_addon_nadja_luciainfo_info;
	description = "Ué m˘ûeme mluvit?";
};


func int dia_addon_nadja_luciainfo_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (NADJA_LUCIAINFO == TRUE))
	{
		return TRUE;
	};
};


var int nadja_gaveluciainfo;

func void dia_addon_nadja_luciainfo_info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//Ué m˘ûeme mluvit?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Nikdo n·s tu nebude ruöit.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor rozhodnÏ neoceÚuje, kdyû si povÌd·me s hosty bÏhem pr·ce - nevydÏl·v·me mu.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Takûe, ty bys r·d vÏdÏl nÏco o tÏch zmizel˝ch lidech z p¯ÌstavnÌ Ëtvrti, ûe?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//NevÌm jestli ti to pom˘ûe, ale m˘ûu ti ¯Ìct, kam odeöla Lucie.
	NADJA_GAVELUCIAINFO = TRUE;
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Kam odeöla?",dia_addon_nadja_luciainfo_wo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"A co Lucie?",dia_addon_nadja_luciainfo_lucia);
};

func void dia_addon_nadja_luciainfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//A co Lucie?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nikomu moc nevadÌ, ûe uû tu nenÌ.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//ProË?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//MÏla sklon zuûitkovat vöechny a vöechno.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//Fakt dÏvka!
};

func void dia_addon_nadja_luciainfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//Kam odeöla?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//»asto se sch·zela s Elvrichem, s tÌm uËednÌkem Thorbena, ve spodnÌ Ë·sti mÏsta.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Vsadila bych se, ûe s nÌm utekla.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Ta bezstarostn· sleËna, Lucie, zmizela z Bromorova nevÏstince p¯es noc. äÌ¯Ì se zvÏsti, ûe utekla s Torbenov˝m tesa¯sk˝m uËednÌkem Elvrichem.");
	Info_AddChoice(dia_addon_nadja_luciainfo,"Kam mohli jÌt?",dia_addon_nadja_luciainfo_elvrich);
};

func void dia_addon_nadja_luciainfo_elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Kam mohli jÌt?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Mohli by b˝t na nÏjakÈ farmÏ, pokud je ovöem neseûrali vlci.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Kam jinam by mohli uprchnout?
	Info_AddChoice(dia_addon_nadja_luciainfo,"JeötÏ nÏco?",dia_addon_nadja_luciainfo_sonst);
};

func void dia_addon_nadja_luciainfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//JeötÏ nÏco?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//Zaslechla jsem p·r vÏcÌ o tÏch chybÏjÌcÌch lidech z p¯ÌstavnÌ Ëtvrti.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Ale nejsem si jist· nakolik jsou tyto zvÏsti pravdivÈ.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//MÏl by sis promluvit s nÏkter˝m z obchodnÌk˘.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//PromiÚ, ale to je vöechno, co vÌm.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//A co my dva, zlatÌËko? Nakonec, za nÏco jsi p¯ece zaplatil.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Opravdu se mnou nechceö str·vit p·r chvilek neû zase odejdeö?
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		Info_AddChoice(dia_addon_nadja_luciainfo,PRINT_ADDON_NADJAWAIT,dia_addon_nadja_wait);
	};
	Info_AddChoice(dia_addon_nadja_luciainfo,"DÌky, ale uû opravdu musÌm jÌt.",dia_addon_nadja_luciainfo_weiter);
	Info_AddChoice(dia_addon_nadja_luciainfo,"ProË ne? ...",dia_nadja_poppen_start);
};

func void dia_addon_nadja_luciainfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//DÌky, ale uû opravdu musÌm jÌt.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//äkoda. Moûn· p¯ÌötÏ.
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_wait()
{
	Info_ClearChoices(dia_addon_nadja_luciainfo);
};


instance DIA_NADJA_POPPEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_poppen_condition;
	information = dia_nadja_poppen_info;
	permanent = TRUE;
	description = "(UûÌt si)";
};


func int dia_nadja_poppen_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void dia_nadja_poppen_info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//DalöÌch p·r hodin pat¯Ì jen a jen n·m.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Jen se hezky uvolni. Lehni si a uûij si to!
	Info_ClearChoices(dia_nadja_poppen);
	Info_AddChoice(dia_nadja_poppen,"Fajn...",dia_nadja_poppen_start);
};

func void dia_nadja_poppen_start()
{
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_luciainfo_pop()
{
	dia_nadja_poppen_start();
};


instance DIA_NADJA_BUYHERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_buyherb_condition;
	information = dia_nadja_buyherb_info;
	permanent = TRUE;
	description = "Kde bych tu koupil nÏjakÈ drogy?";
};


func int dia_nadja_buyherb_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_nadja_want_herb) == FALSE) && (NADJA_MONEY == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Kde bych tu koupil nÏjakÈ drogy?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//Jak to m·m vÏdÏt? A i kdybych to vÏdÏla, urËitÏ bych to ne¯ekla nÏkomu od mÏstskÈ str·ûe.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Jestli ti v·ûnÏ m·m nÏco sdÏlit, budeö se muset vytasit s ÚÏjakou tou ökv·rou.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Kolik chceö?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//Spravilo by to 50 zlaù·k˘.
			NADJA_MONEY = TRUE;
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
};


instance DIA_NADJA_WANT_HERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_want_herb_condition;
	information = dia_nadja_want_herb_info;
	permanent = FALSE;
	description = "Tak teÔ mi ¯ekni, kde bych mohl koupit nÏjakou tr·vu (zaplatit 50 zlaù·k˘).";
};


func int dia_nadja_want_herb_condition()
{
	if((Npc_HasItems(other,itmi_gold) >= 50) && (NADJA_MONEY == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_nadja_want_herb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//A teÔ mi povÏz, kde bych tu drogu koupil.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Je mi lÌto, ale prostÏ si to nepamatuju.
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Promluv si s Borkou, feö·ku. Ten by pro tebe mohl trochu drogy mÌt.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

