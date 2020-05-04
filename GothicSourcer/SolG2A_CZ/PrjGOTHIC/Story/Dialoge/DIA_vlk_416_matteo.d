
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Co pro tebe mohu ud�lat?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "Co prod�v�?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Co prod�v�?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Mohu ti nab�dnout v�echno, co pot�ebuje� pro p�e�it� v divo�in�. Zbran�, pochodn�, z�soby - dokonce i zbroj.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//Tak� tu m�m i n�jak� zvl�tn� zbo��.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Dvojn�sob tvrzenou zbroj z ch�apav�� k��e - nepou�itou. Nem� z�jem?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matte�v obchod le�� u ji�n� m�stsk� br�ny. Prod�v� vybaven�, zbran� i potraviny.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Uka� mi sv� zbo��.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Od t� doby, co �old�ci odd�lali paladina Lothara, to tu ti jeho kamar�d��kov� pro��our�vaj� mnohem p��sn�ji.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Douf�m, �e a� vraha pov�s�, tak se to zlep��.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Vypad� to, �e paladinov� to tentokr�t mysl� v�n� - dokonce odvolali i str�e z lod�.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Je�t� �e n�m zase obnovuje� z�soby. Kdo v�, jestli p��t� t�den bude na�e m�sto je�t� st�t.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Koupit ko�enou zbroj. Ochrana: zbran� 25, ��py 20. (250 zla��k�)";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Dob�e, tak mi tu zbroj dej.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Bude se ti moc l�bit. (u�kl�bne se)
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Zbroj m� svou cenu - a opravdu za to stoj�. Tak�e se vra�, a� d� dohromady dost zlata.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "Co v� o paladinech?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Co v� o paladinech?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Od chv�le, kdy ti bastardi dorazili do m�sta, nezn�m nic jin�ho ne� sam� trampoty.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Posledn� jsem m��il do horn� ��sti m�sta, ale str�e mi zastoupily cestu a cht�ly v�d�t, co tam pohled�v�m!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//A?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Samoz�ejm� m� pak pustili dovnit�!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//M�j obchod ve m�st� st�l je�t� d��v, ne� ti nabub�el� hejhulov� d�ev�n�m me�em zapichovali podsvin�ata!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//A v�era sem ti bastardi jen tak m�rnyx-t�rnyx p�i�li a zabavili mi p�lku zbo��!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "Paladinov� ti zabavili zbo��?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Paladinov� ti zabavili zbo��?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//V�ecko, co jsem m�l uskladn�n� vzadu na dvorku.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Prost� ke vchodu na dv�r postavily str�.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//M�m kliku, �e mi nesebrali �pln� v�ecko - aspo� tu zbroj tu mohli nechat.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "M��e� mi pomoci proniknout do horn� �tvrti?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//M��e� mi pomoci proniknout do horn� �tvrti?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(udiven�) Co�e? A co TAM chce� d�lat?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//Nesu n�jakou d�le�itou zpr�vu.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//No, v�... U� ses zkou�el dostat p�es str�e?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(ho�k� �sm�v) Zapome� na to, chlape!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(usm�je se) To je pro ty man�ky TYPICK�!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Nech�pu, pro� bych to m�l v�bec zkou�et.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Nejsp� m� pravdu.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Nev�m, JAK d�le�it� ta tvoje zpr�va je, a vlastn� mi do toho ani nic nen�.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Ale i kdy� jim �ekne�, �e v p��stavu pr�v� zakotvila lo� pln� sk�et�, stejn� t� po�lou pry�.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Proto�e maj� sv� ROZKAZY.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Zd� se, �e ti na tom opravdu z�le��.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(potuteln�) Ot�zka zn�, JAK MOC ti na tom z�le��.
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//O co ti jde?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Mohu ti pomoci - koneckonc� tu pat��m k nejvlivn�j��m lidem.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Ale nebude to zadarmo.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "Tak�e mi m��e� pomoci proniknout do horn� �tvrti?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Tak�e mi m��e� pomoci proniknout do horn� �tvrti?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Pomoz mi vstoupit do u�en� k n�kter�mu z ostatn�ch mistr�!";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Co za svou pomoc chce�?
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "Co za svou pomoc chce�?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Co za svou pomoc chce�?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 zlat�ch.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"To je zatracen� hodn�...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"Ty chamtiv�e!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Kl�dek - nemysl�m zrovna TVOJE zlato!
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//Ale?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//V z�sad� jde o MOJE zlato.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Tesa�ova nete� Gritta mi toti� u� cel� v�ky nezaplatila, co mi dlu��.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//A p�itom se tu ten mal� spratek produc�ruje ka�dou chv�li v nov�ch hadrech - to znamen�, �e pen�z m� dost.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//R�d bych to z n� vyml�til, ale mistr Thorben - tesa� - tu m� taky dost velk� vliv.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Kdy� mi d� ty pen�ze, pom��u ti.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Gritta, nete� tesa�e Thorbena, dlu�� Matteovi 100 zla��k�. Kdy� mu je vr�t�m, pom��e mi v cest� do horn� �tvrti.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ty chamtiv�e!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//To je zatracen� hodn�...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Kde bych tu Grittu na�el?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Kde bych tu Grittu na�el?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Jak jsem �ekl, je to tesa�ova nete�. Jeho d�m najde� dole v ulici, posledn� staven� napravo p�ed kov�rnou.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Tady m� t�ch 100 zla��k�!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Tady m� t�ch 100 zla��k�!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//Na tom zlat� je Grittina krev! J� ti p�ece ani v nejmen��m nenak�zal, abys ji zabil!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//S t�m nechci nic m�t - a na na�i �mluvu rovnou zapome�! A u� na m� v�ckr�t nemluv!
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//Tak co? D�lala n�jak� probl�my?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Nic, co by st�lo za zm�nku.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Dob�e. Svou ��st �mluvy jsi tedy dodr�el.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ty to za ni chce� zaplatit? Hmm, dal bych sp� p�ednost tomu, kdybys to vym��kl p��mo z n�!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Ale - 100 zla��k� je po��d 100 zla��k�.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Svou ��st �mluvy jsi t�m dodr�el.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//Po��t�n� nen� zrovna tvoje siln� str�nka, co? V�dy� ty t�ch 100 zla��k� nem�.
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Pomoz mi vstoupit do u�en� k n�kter�mu z ostatn�ch mistr�!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Pomoz mi vstoupit do u�en� k n�kter�mu z ostatn�ch mistr�!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//��dn� strachy - j� svou ��st dohody dodr��m.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Ostatn�m mistr�m budu o tob� vykl�dat jenom to nejlep��.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Matteo bude souhlasit, budu-li cht�t vstoupit do u�en� u n�koho jin�ho.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Jedno po druh�m. Nejd��v spl� svou ��st dohody a p�ines mi zlato!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "Co KONKR�TN� pro mne m��e� ud�lat?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Co KONKR�TN� pro mne m��e� ud�lat?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//To je jednoduch�. Vyu�iju sv�j vliv a p�esv�d��m jednoho z m�stn�ch �emesln�k�, aby t� p�ijal jako u�edn�ka.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Tak se prakticky stane� m욝anem a bude� moci vstoupit i do horn� �tvrti. A krom toho si i trochu p�ivyd�l�.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Matteo mi m��e pomoci, aby m� n�kter� z �emeslnick�ch mistr� p�ijal do u�en�.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "Kde bych tedy mohl vstoupit do u�en�?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Kde bych tedy mohl vstoupit do u�en�?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//Vlastn� ke komukoliv z mistr� tady na hlavn� ulici.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//M��e to b�t kov�� Harad, v�robce luk� Bosper, tesa� Thorben nebo alchymista Constantino.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Jeden z nich t� mus� p�ijmout.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Ale d�le�it� je, aby s t�m souhlasili i ostatn� mist�i. Tak je to tady v Khorinisu zvykem.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Mohu vstoupit do u�en� k v�robci luk� Bosperovi, kov��i Haradovi, tesa�i Thorbenovi, nebo k alchymistovi Constantinovi.");
	b_logentry(TOPIC_LEHRLING,"Je�t� ne� k n�komu vstoup�m do u�en�, mus�m z�skat svolen� ostatn�ch mistr�.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "Jak z�sk�m souhlas ostatn�ch mistr�?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Jak z�sk�m souhlas ostatn�ch mistr�?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Prost� je mus� n�jak p�esv�d�it. Zastav se u nich a promluv si s nimi.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Ale jestli si proti sob� popud� v�c jak jednoho, nebude� m�t �anci! Tak se koukej chovat slu�n�!
	b_logentry(TOPIC_LEHRLING,"Ostatn� mist�i mi daj� sv� doporu�en� pouze za p�edpokladu, �e jim dok�u svou cenu.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "A pro� m� do u�en� nep�ijme� TY?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//A pro� m� do u�en� nep�ijme� TY?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//R�d bych - ale museli by s t�m souhlasit i ostatn� mist�i.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Ned�vno jsem p�ijal jin�ho u�edn�ka.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "Existuje i jin� zp�sob, jak se dostat do horn� �tvrti?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Existuje i jin� zp�sob, jak se dostat do horn� �tvrti?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Snad ano - jestli na n�co p�ijdu, d�m ti v�d�t.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "Mezi tv�m zbo��m vid�m i n�jak� d�ln� akcie. Kdo ti je prodal?";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Mezi tv�m zbo��m vid�m i n�jak� d�ln� akcie. Kdo ti je prodal?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(nerv�zn�) D�ln� akcie? Jejda, kde se tu vzaly? Nem�m pon�t�, jak jsem k nim p�i�el. �estn� slovo, na mou du�i.
	b_giveplayerxp(XP_AMBIENT);
};

