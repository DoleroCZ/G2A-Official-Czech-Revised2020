
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
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//Mus� si nejprve promluvit s Bromorem.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Hele, te� zrovna se ti nem��u v�novat, fe��ku. Jestli se chce� pobavit, promluv si s Bromorem.
	};
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE) && (NADJA_LUCIAINFO == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//R�d bych se t� zeptal na p�r ot�zek ohledn� t�ch chyb�j�c�ch lid�.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Dob�e, je tady n�co, co bych ti mohla ��ct, ale ne tady, drahou�ku.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//OK, tak poj�me nahoru.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Dob�e, ale to si mus� prvn� za��dit s Bromorem. Nechci se dostat do probl�m�.
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
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//P��t� p�ij� zase!
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
	description = "Poj�me nahoru!";
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
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Poj�me nahoru!
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Dneska m� ��astn� den, fe��ku. Poj�me.
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
	description = "U� m��eme mluvit?";
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
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//U� m��eme mluvit?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Nikdo n�s tu nebude ru�it.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor rozhodn� neoce�uje, kdy� si pov�d�me s hosty b�hem pr�ce - nevyd�l�v�me mu.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Tak�e, ty bys r�d v�d�l n�co o t�ch zmizel�ch lidech z p��stavn� �tvrti, �e?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//Nev�m jestli ti to pom��e, ale m��u ti ��ct, kam ode�la Lucie.
	NADJA_GAVELUCIAINFO = TRUE;
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Kam ode�la?",dia_addon_nadja_luciainfo_wo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"A co Lucie?",dia_addon_nadja_luciainfo_lucia);
};

func void dia_addon_nadja_luciainfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//A co Lucie?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nikomu moc nevad�, �e u� tu nen�.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Pro�?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//M�la sklon zu�itkovat v�echny a v�echno.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//Fakt d�vka!
};

func void dia_addon_nadja_luciainfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//Kam ode�la?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//�asto se sch�zela s Elvrichem, s t�m u�edn�kem Thorbena, ve spodn� ��sti m�sta.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Vsadila bych se, �e s n�m utekla.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Ta bezstarostn� sle�na, Lucie, zmizela z Bromorova nev�stince p�es noc. ���� se zv�sti, �e utekla s Torbenov�m tesa�sk�m u�edn�kem Elvrichem.");
	Info_AddChoice(dia_addon_nadja_luciainfo,"Kam mohli j�t?",dia_addon_nadja_luciainfo_elvrich);
};

func void dia_addon_nadja_luciainfo_elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Kam mohli j�t?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Mohli by b�t na n�jak� farm�, pokud je ov�em nese�rali vlci.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Kam jinam by mohli uprchnout?
	Info_AddChoice(dia_addon_nadja_luciainfo,"Je�t� n�co?",dia_addon_nadja_luciainfo_sonst);
};

func void dia_addon_nadja_luciainfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//Je�t� n�co?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//Zaslechla jsem p�r v�c� o t�ch chyb�j�c�ch lidech z p��stavn� �tvrti.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Ale nejsem si jist� nakolik jsou tyto zv�sti pravdiv�.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//M�l by sis promluvit s n�kter�m z obchodn�k�.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//Promi�, ale to je v�echno, co v�m.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//A co my dva, zlat��ko? Nakonec, za n�co jsi p�ece zaplatil.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Opravdu se mnou nechce� str�vit p�r chvilek ne� zase odejde�?
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		Info_AddChoice(dia_addon_nadja_luciainfo,PRINT_ADDON_NADJAWAIT,dia_addon_nadja_wait);
	};
	Info_AddChoice(dia_addon_nadja_luciainfo,"D�ky, ale u� opravdu mus�m j�t.",dia_addon_nadja_luciainfo_weiter);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Pro� ne? ...",dia_nadja_poppen_start);
};

func void dia_addon_nadja_luciainfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//D�ky, ale u� opravdu mus�m j�t.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//�koda. Mo�n� p��t�.
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
	description = "(U��t si)";
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
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Dal��ch p�r hodin pat�� jen a jen n�m.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Jen se hezky uvolni. Lehni si a u�ij si to!
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
	description = "Kde bych tu koupil n�jak� drogy?";
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
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Kde bych tu koupil n�jak� drogy?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//Jak to m�m v�d�t? A i kdybych to v�d�la, ur�it� bych to ne�ekla n�komu od m�stsk� str�e.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Jestli ti v�n� m�m n�co sd�lit, bude� se muset vytasit s ��jakou tou �kv�rou.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Kolik chce�?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//Spravilo by to 50 zla��k�.
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
	description = "Tak te� mi �ekni, kde bych mohl koupit n�jakou tr�vu (zaplatit 50 zla��k�).";
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
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//A te� mi pov�z, kde bych tu drogu koupil.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Je mi l�to, ale prost� si to nepamatuju.
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Promluv si s Borkou, fe��ku. Ten by pro tebe mohl trochu drogy m�t.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

