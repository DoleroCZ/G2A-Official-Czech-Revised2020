
instance DIA_SAGITTA_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_exit_condition;
	information = dia_sagitta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HALLO(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 4;
	condition = dia_sagitta_hallo_condition;
	information = dia_sagitta_hallo_info;
	description = "Tak sama, tady venku?";
};


func int dia_sagitta_hallo_condition()
{
	return TRUE;
};

func void dia_sagitta_hallo_info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Tak sama, tady venku?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//�ekni, co ode m� chce�, a pak vypadni. M�m pr�ci.
	Info_ClearChoices(dia_sagitta_hallo);
	Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
	Info_AddChoice(dia_sagitta_hallo,"M��e� m� vyl��it?",dia_sagitta_hallo_heil);
	Info_AddChoice(dia_sagitta_hallo,"Co tady d�l�?",dia_sagitta_hallo_was);
	Info_AddChoice(dia_sagitta_hallo,"Kdo jsi?",dia_sagitta_hallo_wer);
};

func void dia_sagitta_hallo_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Tak tys o mn� je�t� nesly�el?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Bylink��ka, alespo� se tomu tak ��k�. �arlat�nka, nebo tak n�jak m� naz�vaj�.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Ale, kdy� je jim zle, v�dycky je jim star� Sagitta se sv�mi l��iv�mi bylinkami dobr�.
};

func void dia_sagitta_hallo_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//�iju tady, co se pamatuju a star�m se o sv� bylinky.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Les je m�m p��telem. Poskytujeme mi v�e, co pot�ebuju.
};

func void dia_sagitta_hallo_heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//M��e� m� vyl��it?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//To je to, pro� jsi tady, �e? Tak pov�dej, co je v nepo��dku.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"U Sagitty za Sekobovou farmou si mohu nakoupit vybaven�.");
};

func void dia_sagitta_hallo_ende()
{
	Info_ClearChoices(dia_sagitta_hallo);
};


instance DIA_SAGITTA_TEACHALCHEMYREQUEST(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 6;
	condition = dia_sagitta_teachalchemyrequest_condition;
	information = dia_sagitta_teachalchemyrequest_info;
	permanent = TRUE;
	description = "M��e� m� nau�it n�co o bylink�ch?";
};


func int dia_sagitta_teachalchemyrequest_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo) && (MIS_SAGITTA_HERB == FALSE))
	{
		return TRUE;
	};
};


var int dia_sagitta_teachalchemyrequest_onetime;

func void dia_sagitta_teachalchemyrequest_info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//M��e� m� nau�it n�co o bylink�ch?
	if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Jak zaj�mav�. O n�co takov�ho m� lid� ne��daj� zrovna �asto.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Tak�e, ty by ses cht�l st�t m�m studentem? To bys m�l nejd��v prok�zat, �e to s t�m z�jmem mysl� v�n�.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Pr�v� p�ipravuju velmi vz�cn� lektvar, kter� vy�aduje vybran� bylinky a extrakty.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Kdy� mi se�ene� jednu ingredienci - velmi vz�cnou bylinu, kterou tady bohu�el nem�m - m��u t� n��emu nau�it.
		DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//U� jsem ti �ekla, �e ano. A� mi p�inese� tu vz�cnou bylinu.
	};
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Promi�, nem�m z�jem.",dia_sagitta_teachalchemyrequest_nein);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"A kde ji najdu?",dia_sagitta_teachalchemyrequest_wo);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"A o jakou ingredienci se jedn�?",dia_sagitta_teachalchemyrequest_was);
};

func void dia_sagitta_teachalchemyrequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//A o jakou ingredienci se jedn�?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//Je to nesm�rn� vz�cn� rostlina - ��k� se j� slune�n� aloe. Pozn� ji podle pronikav� mandlov� v�n�.
};

func void dia_sagitta_teachalchemyrequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//A kde ji najdu?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Ta bylina, co pot�ebuju, roste jen na m�stech, kde m� v�echny pot�ebn� �iviny.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Ty se nach�zej� v exkrementech �ern�ho trola.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//To je ten d�vod, pro� je pro m� tak obt�n� tu kytku z�skat.
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Uvid�me, co se s t�m d� d�lat.",dia_sagitta_teachalchemyrequest_wo_ja);
};

func void dia_sagitta_teachalchemyrequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Uvid�me, co se s t�m d� d�lat.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Dobr� tedy. Tak hodn� �t�st� p�i hled�n�.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	MIS_SAGITTA_HERB = LOG_RUNNING;
	Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
	b_logentry(TOPIC_SAGITTAHERB,"Sagitta pot�ebuje zvl�tn� rostlinu zvanou slune�n� aloe, kter� roste pouze na exkrementech �ern�ho trola.");
};

func void dia_sagitta_teachalchemyrequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Promi�, nem�m z�jem.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Tak p�esta� pl�tvat m�m �asem s t�mi tv�mi nesmysly.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};


instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_sagitta_herb_condition;
	information = dia_sagitta_sagitta_herb_info;
	description = "Na�el jsem slune�n� aloi.";
};


func int dia_sagitta_sagitta_herb_condition()
{
	if(Npc_HasItems(other,itpl_sagitta_herb_mis) && (MIS_SAGITTA_HERB == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_sagitta_herb_info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Na�el jsem slune�n� aloi.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//D�ky. A te� se m� ohledn� lektvar� m��e� pt�t, na co chce�.
	b_giveinvitems(other,self,itpl_sagitta_herb_mis,1);
	SAGITTA_TEACHALCHEMY = TRUE;
	MIS_SAGITTA_HERB = LOG_SUCCESS;
	b_giveplayerxp(XP_SAGITTA_SONNENALOE);
};


instance DIA_SAGITTA_TEACH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 2;
	condition = dia_sagitta_teach_condition;
	information = dia_sagitta_teach_info;
	permanent = TRUE;
	description = "Jak� lektvary m� m��e� nau�it p�ipravovat?";
};


var int dia_sagitta_teach_permanent;

func int dia_sagitta_teach_condition()
{
	if((DIA_SAGITTA_TEACH_PERMANENT == FALSE) && (SAGITTA_TEACHALCHEMY == TRUE) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Jak� lektvary m� m��e� nau�it p�ipravovat?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE))
	{
		Info_ClearChoices(dia_sagitta_teach);
		Info_AddChoice(dia_sagitta_teach,DIALOG_BACK,dia_sagitta_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esence hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_sagitta_teach_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Extrakt hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_sagitta_teach_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_sagitta_teach_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_sagitta_teach_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elix�r many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_sagitta_teach_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elix�r ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_sagitta_teach_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elix�r obratnosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_sagitta_teach_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//P�edt�m, ne� t� nau��m n�co z m� alchymie, ti mus�m ��ct, co v�echno bude� na p��pravu lektvar� pot�ebovat.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Alchymistick� kolona slou�� jako kuchy� pro p��pravu lektvar�. Bude� pot�ebovat pr�zdn� laboratorn� ba�ky, ve kter�ch se lektvary uchov�vaj�.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Pak p�id� ingredience a m� po�adovan� lektvar.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Tomu se samoz�ejm� m��e� ode m� nau�it.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//Tak jak� lektvar by to m�l b�t?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//U� zn� v�e, co bych t� mohla nau�it.
		DIA_SAGITTA_TEACH_PERMANENT = TRUE;
	};
};

func void dia_sagitta_teach_back()
{
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_sagitta_teach);
};


instance DIA_SAGITTA_HEAL(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 99;
	condition = dia_sagitta_heal_condition;
	information = dia_sagitta_heal_info;
	permanent = TRUE;
	description = "Vyle� m�.";
};


func int dia_sagitta_heal_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_heal_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Vyle� m�.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Uka�, pod�v�m se. Mmh. Na ty nejhor�� zran�n� by m�la moje masti�ka sta�it.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//V t�hle chv�li nepot�ebuje� ��dn� l��en�.
	};
};


instance DIA_SAGITTA_TRADE(C_INFO)
{
	npc = bau_980_sagitta;
	condition = dia_sagitta_trade_condition;
	information = dia_sagitta_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jak� zbo�� mi m��e� nab�dnout?";
};


func int dia_sagitta_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_trade_info()
{
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Jak� zbo�� mi m��e� nab�dnout?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//�ekni, co chce�.
};


instance DIA_SAGITTA_KAP3_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap3_exit_condition;
	information = dia_sagitta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_OBSESSION(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_obsession_condition;
	information = dia_sagitta_obsession_info;
	description = "M�m podivn� pocity �zkosti.";
};


func int dia_sagitta_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_obsession_info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Trp�m pocity strachu. Pot�ebuju pomoc.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Vid�m, �e sp�nek by ti moc nepomohl. Byl jsi vystaven temn�mu pohledu P�tra��.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Zajdi za Pyrokarem, nejvy���m m�gem kl�tera. Moje skromn� mo�nosti na tohle nesta��.
};


instance DIA_SAGITTA_THEKLA(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_thekla_condition;
	information = dia_sagitta_thekla_info;
	description = "Thekla m� poslala pro n�jak� bal�k.";
};


func int dia_sagitta_thekla_condition()
{
	if((MIS_THEKLA_PAKET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_thekla_info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla m� poslala pro n�jak� bal�k.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ach, ano. U� jsem ji o�ek�vala v�era.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Tady je ten bal�k. D�vej na n�j dobr� pozor!
	b_giveplayerxp(XP_AMBIENTKAP3);
	b_giveinvitems(self,other,itmi_theklaspaket,1);
};


instance DIA_SAGITTA_KAP4_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap4_exit_condition;
	information = dia_sagitta_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HEALRANDOLPH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_healrandolph_condition;
	information = dia_sagitta_healrandolph_info;
	permanent = TRUE;
	description = "Randolph m� abs��k.";
};


var int dia_sagitta_healrandolph_gotone;
var int dia_sagitta_healrandolph_knowsprice;

func int dia_sagitta_healrandolph_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && (Npc_HasItems(other,itpo_healrandolph_mis) == 0) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_healrandolph_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph m� abs��k.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//Kdy u� se ten chlap kone�n� pou��?
		DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
	};
	if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//U� jsem ti pro n�j p�ichystala d�vku. Tak se s t�m nikde moc nepoflakuj.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//D�m mu na to l�k. To mu bude na n�kolik dn� sta�it.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Tak to p�ijde na 300 zlat�ch.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Co?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Jedin� v�c, kterou dostane� �pln� zadarmo, je smrt, chlap�e.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
	Info_AddChoice(dia_sagitta_healrandolph,"Pff. Za takov� nesmysly utr�cet nebudu.",dia_sagitta_healrandolph_no);
	Info_AddChoice(dia_sagitta_healrandolph,"Tady jsou pen�ze.",dia_sagitta_healrandolph_geld);
};

func void dia_sagitta_healrandolph_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Tady jsou pen�ze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//V�born�. V�dycky ty pen�ze m��e� dostat zp�tky od n�j.
		CreateInvItems(self,itpo_healrandolph_mis,1);
		b_giveinvitems(self,other,itpo_healrandolph_mis,1);
		DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
		b_logentry(TOPIC_HEALRANDOLPH,"Sagitta mi dala l�k pro Randolpha.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Dokud mi ned� pen�ze, nebude ��dnej obchod.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
};

func void dia_sagitta_healrandolph_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Pff. Za takov� nesmysly utr�cet nebudu.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(sm�ch) Nedal ti pen�ze, co? To je cel� on!
	Info_ClearChoices(dia_sagitta_healrandolph);
};


instance DIA_SAGITTA_KAP5_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap5_exit_condition;
	information = dia_sagitta_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_KAP6_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap6_exit_condition;
	information = dia_sagitta_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_PICKPOCKET(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 900;
	condition = dia_sagitta_pickpocket_condition;
	information = dia_sagitta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120_FEMALE;
};


func int dia_sagitta_pickpocket_condition()
{
	return c_beklauen(103,360);
};

func void dia_sagitta_pickpocket_info()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_BACK,dia_sagitta_pickpocket_back);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_PICKPOCKET,dia_sagitta_pickpocket_doit);
};

func void dia_sagitta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sagitta_pickpocket);
};

func void dia_sagitta_pickpocket_back()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
};

