
instance DIA_CONSTANTINO_EXIT(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 999;
	condition = dia_constantino_exit_condition;
	information = dia_constantino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_constantino_exit_condition()
{
	return TRUE;
};

func void dia_constantino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 900;
	condition = dia_constantino_pickpocket_condition;
	information = dia_constantino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_constantino_pickpocket_condition()
{
	return c_beklauen(59,90);
};

func void dia_constantino_pickpocket_info()
{
	Info_ClearChoices(dia_constantino_pickpocket);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_BACK,dia_constantino_pickpocket_back);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_PICKPOCKET,dia_constantino_pickpocket_doit);
};

func void dia_constantino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_constantino_pickpocket);
};

func void dia_constantino_pickpocket_back()
{
	Info_ClearChoices(dia_constantino_pickpocket);
};


instance DIA_CONSTANTINO_HALLO(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_hallo_condition;
	information = dia_constantino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_constantino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Co chce�? Nic tady nen� zadarmo.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "Cht�l bych k n�komu vstoupit do u�en�.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Cht�l bych k n�komu vstoupit do u�en�.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Skute�n�? A ke komu se chce� zapsat?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "Pot�ebuji uzdravit.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Pot�ebuji uzdravit.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(�se�n�) Copak, jsi zran�n�?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"Vlastn� ne.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"Ano.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Ano.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Tak si zajdi za Vatrasem, ten t� d� zase do po��dku. A p�esta� mi tu svinit podlahu od krve!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//V�dy� m� sotva �r�m a j� m�m na pr�ci d�le�it�j�� v�ci, ne� se s tebou vybavovat.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//Vlastn� ne.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Tak se ztra�, nebo taky m��e� p�ij�t k �razu.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CONSTANTINO_LESTERSKRAEUTER(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_addon_constantino_lesterskraeuter_condition;
	information = dia_addon_constantino_lesterskraeuter_info;
	description = "Zaj�m� t� koup� n�jak�ch bylin?";
};


func int dia_addon_constantino_lesterskraeuter_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == 0) && (MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0))
	{
		return TRUE;
	};
};

func void dia_addon_constantino_lesterskraeuter_info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Zaj�m� t� koup� n�jak�ch bylin?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Pokud je tu n�co, co m��e� nab�dnout ...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Uka� mi sv� zbo��.
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Constantino prod�v� alchymistick� z�soby.");
		CONSTANTINO_LOGPATCH1 = TRUE;
	};
};


instance DIA_CONSTANTINO_BEIDIR(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_beidir_condition;
	information = dia_constantino_beidir_info;
	permanent = FALSE;
	description = "Cht�l bych se st�t tv�m u�edn�kem.";
};


func int dia_constantino_beidir_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_beidir_info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Cht�l bych se st�t tv�m u�edn�kem.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//M�M u�edn�kem? Ne! U� jsem jednou tu pochybnou �est m�l a to mi �pln� sta�ilo. S ��dn�m dal��m u�edn�kem u� se otravovat nebudu.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Cel� l�ta jsem mu p�ed�val v�domosti a nakonec se ten pitomec zbl�znil a otr�vil se!
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//B� se zapsat k n�komu z ostatn�ch mistr�.
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "Cht�l bych se zapsat u n�kter�ho z ostatn�ch mistr�.";
};


func int dia_constantino_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_zustimmung_info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Cht�l bych se zapsat u n�kter�ho z ostatn�ch mistr�.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//P�i�el jsi m� po��dat o doporu�en�?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hm - co se m� t��e, m��e� se zapsat, u koho chce�.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//V�, ty to nech�pe�! To, co jsem o tob� sly�el, nijak nemluv� ve tv�j prosp�ch.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Nep�imluv�m se za to, aby zlo�inec jako ty zast�val ve m�st� n�jakou �estnou pozici.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Dokud v�echno neurovn� s velitelem str��, m� odpov�� bude ne!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Constantino mi d� sv� doporu�en�, pokud se ve m�st� nezapletu do ��dn�ho zlo�inu.");
		CONSTANTINO_LOGPATCH2 = TRUE;
	};
};


instance DIA_CONSTANTINO_BRINGHERBS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_bringherbs_condition;
	information = dia_constantino_bringherbs_info;
	permanent = FALSE;
	description = "Co mus�m ud�lat, abych se mohl st�t TV�M u�edn�kem?";
};


func int dia_constantino_bringherbs_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_beidir) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_bringherbs_info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Co mus�m ud�lat, abych se mohl st�t TV�M u�edn�kem?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(povzdechne si) U� si nevezmu na sv�dom� ��DN�HO dal��ho diletanta.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//V�ude kolem roste spousta rozli�n�ch bylin. V r�zn�ch obm�n�ch jsou jejich ��inky velmi rozd�ln�.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Ty nejsp� nezn� ani polovinu z nich.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(povzdechne si) Tum� - tohle je seznam t�ch nejd�le�it�j��ch rostlin.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//P�ines mi od ka�d� jeden exempl�� a mo�n� si rozmysl�m, zda t� p�ijmout za u�edn�ka.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Constantino chce jednu rostlinu od ka�d�ho druhu, jinak m� jako u�edn�ka nep�ijme.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "Co se t��e t�ch rostlin...";
};


func int dia_constantino_herbsrunning_condition()
{
	if(MIS_CONSTANTINO_BRINGHERBS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_herbsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Co se t��e t�ch rostlin...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Jestli to nezvl�dne� s�m, nikdy z tebe po��dn� alchymista nebude!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"Aha.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"U� jsem sehnal v�echny rostliny, kter� jsem ti m�l p�in�st!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//U� jsem sehnal v�echny rostliny, kter� jsem ti m�l p�in�st!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Co�e? Tah� m� za nos, co?
	AI_PrintScreen("(D�t 11 bylin)",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itpl_mana_herb_01,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_02,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_03,1);
	Npc_RemoveInvItems(other,itpl_health_herb_01,1);
	Npc_RemoveInvItems(other,itpl_health_herb_02,1);
	Npc_RemoveInvItems(other,itpl_health_herb_03,1);
	Npc_RemoveInvItems(other,itpl_dex_herb_01,1);
	Npc_RemoveInvItems(other,itpl_strength_herb_01,1);
	Npc_RemoveInvItems(other,itpl_speed_herb_01,1);
	Npc_RemoveInvItems(other,itpl_temp_herb,1);
	Npc_RemoveInvItems(other,itpl_perm_herb,1);
	CreateInvItems(self,itpl_mana_herb_01,1);
	CreateInvItems(self,itpl_mana_herb_02,1);
	CreateInvItems(self,itpl_mana_herb_03,1);
	CreateInvItems(self,itpl_health_herb_01,1);
	CreateInvItems(self,itpl_health_herb_02,1);
	CreateInvItems(self,itpl_health_herb_03,1);
	CreateInvItems(self,itpl_dex_herb_01,1);
	CreateInvItems(self,itpl_strength_herb_01,1);
	CreateInvItems(self,itpl_speed_herb_01,1);
	CreateInvItems(self,itpl_temp_herb,1);
	CreateInvItems(self,itpl_perm_herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//P�i Adanovi! V�echno je opravdu v po��dku.
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Kdo v�, mo�n� �e z tebe p�ece jenom jednou bude slu�n� alchymista.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Constantino m� p��jme do u�en�, jen kdy� z�sk�m doporu�en� od �ty�ech mistr�.");
	Info_ClearChoices(dia_constantino_herbsrunning);
};

func void dia_constantino_herbsrunning_running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Aha.
	Info_ClearChoices(dia_constantino_herbsrunning);
};


var int constantino_startguild;

instance DIA_CONSTANTINO_LEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_lehrling_condition;
	information = dia_constantino_lehrling_info;
	permanent = TRUE;
	description = "Mohu se te� st�t tv�m u�edn�kem?";
};


func int dia_constantino_lehrling_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Mohu se te� st�t tv�m u�edn�kem?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Co se m� t��e, tak ano.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Haradovi z�le�� p�edev��m na tom, abys dok�zal v p��pad� sk�et�ho �toku ubr�nit m�sto.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//A vypad� to, �es ho o tom p�esv�d�il.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Ale on si mysl�, �e jsi zbab�lec.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Ale Harad tvrd�, �e t� je�t� nikdy nevid�l.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper se o tv�ch kvalit�ch zm�nil pouze zdr�enliv�.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Po��t�m, �e by si t� rad�i vzal do u�en� s�m.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Ale nakonec p�ece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Odep��t souhlas zrovna z takov�ho d�vodu rozhodn� nen� nijak �estn�!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Ale jestli t� doporu�� i ostatn� mist�i, nebude� jeho hlas pot�ebovat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//A Bosper t� zat�m v�bec nezn�.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben je velmi pobo�n�.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Ale po�ehnal ti - to je dobr� znamen�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Sv�j souhlas ti v�ak d� pouze tehdy, a� si vypros� i po�ehn�n� od boh�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben ani nev�, kdo jsi.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//A co se t��e Mattea, ten na tebe v�ude p�je chv�lu.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo tvrd�, �e mu je�t� n�co dlu��. Chce�-li jeho souhlas, rad�i bys tu z�le�itost m�l co nejrychleji vy��dit.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo tvrd�, �e s tebou o t�hle v�ci zat�m nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo t� pr� ve sv�m kr�mku je�t� nikdy nevid�l.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//To znamen�, �es z�skal doporu�en� ode v�ech mistr�!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Nyn� t� doporu�uj� �ty�i mist�i - to posta��, abys mohl k n�komu vstoupit do u�en�.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Jsi p�ipraven vstoupit do u�en� ke mn�?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"Nejd��v se na to mus�m vyspat.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Ano, mist�e.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Chce�-li k n�komu v doln� ��sti m�sta vstoupit do u�en�, pot�ebuje� souhlas alespo� �ty� mistr�.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Tak�e by sis m�l promluvit se v�emi, kte�� ti zat�m souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(podr�d�n�) Ani n�hodou! Sly�el jsem, �es byl tady v Khorinisu ob�alov�n z n�jak�ho zlo�inu!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Nep�ijmu t� do u�en�, dokud tu z�le�itost u velitele m�stsk� str�e neurovn�.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Ano, mist�e.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(povzdechne si) No tak dob�e! Douf�m, �e sv�ho rozhodnut� nebudu litovat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//Od t�hle chv�le se tedy pova�uj za m�ho u�edn�ka.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	Npc_ExchangeRoutine(lothar,"START");
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Constantino m� p�ijal za u�edn�ka. Nyn� m�m p��stup do horn� �tvrti.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Nejd��v se na to mus�m vyspat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//No dob�e! Jestli do toho opravdu nechce� d�t v�echno, pak by sis m�l zvolit jin� povol�n�.
	Info_ClearChoices(dia_constantino_lehrling);
};


var int constantino_milkommentar;
var int constantino_innoskommentar;

instance DIA_CONSTANTINO_ALSLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_alslehrling_condition;
	information = dia_constantino_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_constantino_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_CONSTANTINO) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_constantino_alslehrling_info()
{
	if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(podr�d�n�) Odm�t�m t� d�l u�it, dokud bude� ob�alovan� ze zlo�inu.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Zajdi za lordem Andrem a dej to n�jak do po��dku.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Tak ty ses p�idal k domobran�? U� jsem o tom sly�el.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Chce� se rychle vyu�it a pak se p�idat k domobran�? Postar�m se, abys to nem�l tak jednoduch�.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Douf�m ale, �e se bude� dr�et na�� dohody a bude� mi pravideln� nosit rostliny a houby.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//A jestli jsou na tebe dv� povol�n� moc, tak prost� trochu m�� spi!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Vid�m, �es vstoupil do Innosov�ch slu�eb. To tedy nejsp� znamen�, �e od nyn�j�ka u� nebude� m�t tolik �asu, abys starci nosil byliny.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Ale i tak si pova�uji za �est, �e jsem t� na tv� cest� podpo�il.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//Pokud si i p�es sv� nov� povinnosti vy�et�� trochu �asu na alchymii, v�z, �e t� tu v�dycky r�d p�iv�t�m.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Kam t�m m���?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Po��t�m, �e v�t�ina m�ch u�edn�k� sem pak prost� zasko�� jen jednou za uhersk� rok!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//P�inesl jsi mi aspo� n�jak� houby?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Tak t� tu zase m�me.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_CONSTANTINO_AUFGABEN(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_aufgaben_condition;
	information = dia_constantino_aufgaben_info;
	permanent = FALSE;
	description = "Co m�m d�lat?";
};


func int dia_constantino_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_aufgaben_info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Co m�m d�lat?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Nejsem tak naivn�, abych si myslel, �e mlad�k jako ty bude cel� den tr�vit se mnou mezi �ty�mi st�nami.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Sta��, kdy� mi �as od �asu p�inese� rostliny, kter� pot�ebuji, a j� t� na opl�tku budu u�it alchymistick�mu um�n�.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Tak� si u m� m��e� nakoupit lahvi�ky. V�t�inu p��sad si ale u� bude� muset opat�it s�m.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//A z�rove� po��t�m, �e tady ve m�st� bude� jako ��dn� ob�an sekat latinu.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "Jak� rostliny m�m obstarat?";
};


func int dia_constantino_mushrooms_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aufgaben))
	{
		return TRUE;
	};
};

func void dia_constantino_mushrooms_info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Jak� rostliny m�m obstarat?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Koup�m v�echno, co mi p�inese� - a zaplat�m ti za to obvyklou cenu.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Za houby ale dostane� zvl᚝ slu�nou sumi�ku.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Constantinovi mohu prod�vat houby za mimo��dn� v�hodnou cenu.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "Cht�l jsi n�jak� houby.";
};


func int dia_constantino_mushroomsrunning_condition()
{
	if(MIS_CONSTANTINO_MUSHROOMS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_mushroomsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Cht�l jsi n�jak� houby.
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"Tak j� ti n�jak� p�inesu...",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Pro� jsou tak d�le�it�?",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"M�m tu p�r...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Poda�ilo se mi z�skat p�r tmav�ch hub.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//P�ni - ty jsou nejlep��! Skv�l� pr�ce - a tady m� zlato!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER = CONSTANTINO_DUNKELPILZCOUNTER + Npc_HasItems(other,itpl_mushroom_01);
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_01) * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Npc_HasItems(other,itpl_mushroom_01));
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//A tady jsou je�t� n�jak� dal��.
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//M�m tu pro tebe p�r hub!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Sice nejsou tak dobr� jako tmav� houby, ale i tak ti za n� zaplat�m.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_02) * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Npc_HasItems(other,itpl_mushroom_02));
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Pro� jsou tak d�le�it�?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//I kdy� jsi m�m u�edn�kem, nevy�van�m ti �pln� v�echno.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//No dob�e - tak j� ti to tedy pov�m. Ale mus� si to nechat pro sebe.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Tmav� houby jsou pln� magick� energie a poka�d�, kdy� n�kterou sn�, se ti ��st jej� s�ly usad� v t�le.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Sn�-li dostate�n� po�et t�chto hub, tv� magick� energie se zv���.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Kdybych ti to �ekl d��ve, nejsp� by sis v�echny houby k�e�koval pro sebe, vi�?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(povzdechne si) Ale �lov��e!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//U� ses m� na to ptal. (�kodolib�) Kdo v�, mo�n� �e ti to jednou p�ece jenom prozrad�m.
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Tak j� ti n�jak� p�inesu.
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Skv�l�! P�ines mi jich co nejv�c!
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "Nau� m� alchymistick�mu um�n�!";
};


func int dia_constantino_alchemy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_alchemy_info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Nau� m� alchymistick�mu um�n�!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//No dob�e, tak nejd��v z�klady.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Ka�d� lektvar se vyr�b� z rostlin, kter� maj� r�znou moc.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Samy o sob� nijak nep�sob�, ale v kombinaci s jin�mi bylinami jejich ��inky rostou - a �kolem alchymie je pr�v� tuto moc upravovat a vyu��vat.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//OK p��prav� lektvaru s pomoc� alchymistick� kolony pot�ebuje� laboratorn� ba�ku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//D�le mus� zn�t spr�vnou formuli a samoz�ejm� m�t po ruce i p��slu�n� ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//N�kter� u�ite�n� informace ti mohu p�edat.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Lektvary, kter� ti vr�t� ztracenou s�lu, ba dokonce i elix�ry, kter� ti s�lu zv��� natrvalo.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//V�echno najednou se ale nau�it nem��e�.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino nau�� alchymistick�mu um�n�.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "R�d bych se dozv�d�l n�jak� nov� recepty na lektvary.";
};


func int dia_constantino_newrecipes_condition()
{
	if((PLAYER_ISAPPRENTICE != APP_CONSTANTINO) && (PLAYER_ISAPPRENTICE > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void dia_constantino_newrecipes_info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//R�d bych se dozv�d�l n�jak� nov� recepty na lektvary.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//M� s alchymi� n�jak� p�edchoz� zku�enosti?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Ano, m�m.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//A jsi st�le na�ivu - to nen� �patn� kvalifikace.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Mysl�m, �e p�r formul� ti mohu prozradit. Samoz�ejm� ale z�le�� na tom, co p�esn� chce� v�d�t.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino m� zasv�t� do taj� alchymie.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "O jak� recepty se se mnou m��e� pod�lit?";
};


func int dia_constantino_teach_condition()
{
	if(CONSTANTINO_TEACHALCHEMY == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_teach_info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//O jak� recepty se se mnou m��e� pod�lit?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Lituji, ale nic v�c u� t� nau�it nemohu.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//N�kolik jich zn�m - vyber si s�m.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Esence hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Extrakt hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elix�r hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elix�r �ivota",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_constantino_teach_permhealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_constantino_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_constantino_teach_mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elix�r s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_constantino_teach_permstr);
	};
};

func void dia_constantino_teach_back()
{
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Pro esenci hojiv� s�ly pot�ebuje� l��iv� rostliny a lu�n� pohanku.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//OK p��prav� extraktu hojiv� s�ly si mus� opat�it l��iv� byliny a lu�n� pohanku.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//A dej si pozor, abys ten extrakt spr�vn� pova�il
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//K vytvo�en� elix�ru hojiv� s�ly je zapot�eb� trochu zku�enost�.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Mus� si sehnat l��iv� ko�eny a lu�n� pohanku a velmi opatrn� v�echno oh��vat.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Elix�r �ivota! Vz�cn� to odvar! Ne �e by jeho p��prava byla tak slo�it� - vlastn� jej lze nam�chat docela snadno.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Ale p��sady jsou velmi vz�cn� - l��iv� ko�eny a kr�lovsk� ��ov�k.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Esence magie je nejjednodu���m z magick�ch lektvar�.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Natrhej p�t ohniv�ch kop�iv, lu�n� pohanku a v�e pomalu pova�.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Jakmile dovede� p�ipravit esenci magie, s trochou �sil� bys m�l dok�zat vyrobit i jej� extrakt.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//P�i p��prav� tohoto elix�ru sta�� m�t tro�ku citu a nechat jej jemn� p�ej�t varem. Jeho ingredience tvo�� ohniv� kop�ivy a lu�n� pohanka.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Elix�r s�ly! V�te�n� to mok! K jeho nam�ch�n� v�ak pot�ebuje� vz�cn� dra�� ko�en a kr�lovsk� ��ov�k.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//P�i varu pak d�vej pozor, aby bublinky nebyly p��li� velk� a nedo�kal ses pak nemil�ho p�ekvapen�!
	};
	Info_ClearChoices(dia_constantino_teach);
};

