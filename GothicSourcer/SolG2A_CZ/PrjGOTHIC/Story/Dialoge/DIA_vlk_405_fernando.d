
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = "(Kr�de� jeho portmonky by byla dosti riskantn�.)";
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nic moc. Kdy� je�t� st�la bari�ra, bylo to lep�� �asy.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Trestanci dod�vali tuny a tuny rudy z dol� a m� lod� ji pak odv�ely na pevninu.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//A zp�tky zase p�iv�ely potraviny a jin� zbo��.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Ale te� jsme od��znuti od pevniny a jsme se z�sobami z�visl� na farm���ch.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "Z �eho te� �ije�?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z �eho te� �ije�?
	if(FERNANDO_IMKNAST == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if(FERNANDO_HATSZUGEGEBEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nev�m. Vyh�b�m se �ern�mu trhu.
	}
	else if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Zrovna te� �iju ze sv�ch z�sob. Ale jestli se zase neza�ne obchodovat, do�iju se stra�n�ch �as�.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Je ze m� �ebr�k. M�l jsem poslechnout sv�ho otce a dr�et se od toho hornick�ho k�eftu d�l.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE) && (FERNANDO_HATSZUGEGEBEN == FALSE) && (FERNANDO_IMKNAST == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hej ty - po�kej chvilku. M� nam��eno do Hornick�ho �dol�, �e ano?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//A?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//M�m pro tebe nab�dku. Ty mi d� v�d�t, jak se to m� s rudou a j� ti pak za to d�m...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... runov� k�men.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... prsten, co pos�l� tvou �ivotn� energii.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Uvid�m, co se d� d�lat.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Obchodn�k Fernando chce v�d�t, co se v Hornick�m �dol� d�je s rudou.");
};


instance DIA_ADDON_FERNANDO_BANDITTRADER(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_addon_fernando_bandittrader_condition;
	information = dia_addon_fernando_bandittrader_info;
	description = "Prod�vals zbran� bandit�m.";
};


func int dia_addon_fernando_bandittrader_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))))
	{
		return TRUE;
	};
};

func void dia_addon_fernando_bandittrader_info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Prod�vals zbran� bandit�m.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(p�ekvapen�) Huh. Jak jsi p�i�el na ten n�pad?
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Fernando, z�mo�sk� kupec, p�iznal, �e dod�v� zbran� bandit�m.");
	b_giveplayerxp(XP_ADDON_FERNANDO_HATSZUGEGEBEN);
	FERNANDO_HATSZUGEGEBEN = TRUE;
	if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//To je soupis zbo��. Dostal jsem ho od bandit�. Je na n�m tv�j podpis.
	};
	if(Npc_HasItems(other,itri_addon_bandittrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Na�el jsem tak� tento prsten u z�mo�sk�ho pr�vodce Araxosose. A ty jsi z�mo�sk� obchodn�k.
		if(Npc_HasItems(other,itmw_addon_bandittrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//A me�e bandit� jsou podeps�ny tv�m inici�lem 'F'.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Me�e bandit� jsou podeps�ny tv�m inici�lem 'F'
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nemus� zap�rat. Odkryl jsem tvou nekalou �innost.
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Tak tos byl ty? Tys m� zradil. Za to zaplat�.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Mysl�m, �e odtud poputuje� n�kam jinam. Nicm�n�, jsem si jist, �e t� nenechaj� j�t zase tak brzy na sv�tlo.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(nazloben�) M�j �as nade�el.
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(�ebrav�) Mus� mi v��it, �e jsem to necht�l ud�lat!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(�ebrav�) Prvn� to bylo pouze j�dlo, co cht�li. M�j obchod ne�lapal zrovna tak, jak by m�l, tak jsem souhlasil.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(�ebrav�) A �asem mi za�ali vyhro�ovat, �e m� zabij�, pokud jim nebudu dod�vat v�c a v�c me��.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(�ebrav�) Nem��e� m� vinit z toho, co jsem ud�lal. Jsem pouze ob�!
		if(FERNANDO_IMKNAST == FALSE)
		{
			Info_ClearChoices(dia_addon_fernando_bandittrader);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Kolik mi zaplat�, pokud t� nech�m uprchnout?",dia_addon_fernando_bandittrader_preis);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Za�ne se o tebe zaj�mat domobrana.",dia_addon_fernando_bandittrader_mil);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Oh, to m� opravdu rozesmutn�lo.",dia_addon_fernando_bandittrader_uptown);
		};
	};
};

func void dia_addon_fernando_bandittrader_uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Oh, to m� fakt rozesmutn�lo. V�, jsi docela hnusn� na n�koho, kdo �ije v horn� �tvrti.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Prodat svou du�i za p�r kus� zlata.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Mus�m si vyd�lat na �ivobyt�. Kdy� nepokryju n�klady, vyhod� m� z p��stavu. Stane se ze m� ch�tra.
};

func void dia_addon_fernando_bandittrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Domobrana se o tebe za�ne zaj�mat.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Nem��e� to ud�lat!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Jist�, �e m��u.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Ve jm�nu Innosov�, jsem na mizin�.
	b_npcclearobsessionbydmt(self);
};

func void dia_addon_fernando_bandittrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Kolik mi zaplat�, pokud t� nech�m uprchnout?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Zn� mou situaci. Nemohu ti moc zaplatit.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Co tak 200 zlata a cenn� prsten?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//To je v�e, co ti mohu d�t. D� mi te� ten seznam?
	Info_ClearChoices(dia_addon_fernando_bandittrader);
	Info_AddChoice(dia_addon_fernando_bandittrader,"No, nechyst�m se ti to d�t.",dia_addon_fernando_bandittrader_nein);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Okay. Ujedn�no.",dia_addon_fernando_bandittrader_ja);
};

func void dia_addon_fernando_bandittrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Okay. Dohodnuto.
	b_giveplayerxp(XP_AMBIENT);
	Npc_RemoveInvItems(hero,itmw_addon_bandittrader,Npc_HasItems(other,itmw_addon_bandittrader));
	Npc_RemoveInvItem(hero,itri_addon_bandittrader);
	Npc_RemoveInvItem(hero,itwr_addon_bandittrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Dobr�, tady je zlato.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//A prsten. Nyn� jsme dohodnuti.
	CreateInvItems(self,itri_prot_point_01,1);
	b_giveinvitems(self,other,itri_prot_point_01,1);
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};

func void dia_addon_fernando_bandittrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Ne, nechyst�m se ti to d�t.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobr�. Vem si to, ale nezkou�ej m� podv�st...
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "Byl jsem v Hornick�m �dol�.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Byl jsem v Hornick�m �dol�.
	if(FERNANDO_IMKNAST == FALSE)
	{
		FERNANDO_ERZ = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//A? Jak se to tam m�?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//V�echny doly jsou vyt�eny, je tam sotva p�r truhel rudy. Nem� cenu tam v�bec kopat.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To nem��e b�t pravda! To znamen�, �e je ze m� �ebr�k.
		if(FERNANDO_HATSZUGEGEBEN == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co na�e dohoda?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Te� k tv� odm�n�...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Tady, vezmi si ten runov� k�men.
				b_giveinvitems(self,other,itmi_runeblank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Tady je tv�j prsten.
				b_giveinvitems(self,other,itri_hp_02,1);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_FERNANDO,LOG_OBSOLETE);
		b_logentry(TOPIC_FERNANDO,"Fernando doesn't want the information anymore. And I don't want to get any other fee neither.");
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Jsi v po��dku?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "Ty jsi posedl�!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ty jsi posedl�!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Jdi pry�. Tak jdi u�.
	b_npcclearobsessionbydmt(self);
};

