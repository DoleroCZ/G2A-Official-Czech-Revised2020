
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
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Co chceš? Nic tady není zadarmo.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "Chtìl bych k nìkomu vstoupit do uèení.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Chtìl bych k nìkomu vstoupit do uèení.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Skuteènì? A ke komu se chceš zapsat?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "Potøebuji uzdravit.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Potøebuji uzdravit.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(úseènì) Copak, jsi zranìnı?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"Vlastnì ne.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"Ano.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Ano.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Tak si zajdi za Vatrasem, ten tì dá zase do poøádku. A pøestaò mi tu svinit podlahu od krve!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//Vdy máš sotva šrám a já mám na práci dùleitìjší vìci, ne se s tebou vybavovat.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//Vlastnì ne.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Tak se ztra, nebo taky mùeš pøijít k úrazu.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CONSTANTINO_LESTERSKRAEUTER(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_addon_constantino_lesterskraeuter_condition;
	information = dia_addon_constantino_lesterskraeuter_info;
	description = "Zajímá tì koupì nìjakıch bylin?";
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
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Zajímá tì koupì nìjakıch bylin?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Pokud je tu nìco, co mùeš nabídnout ...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "Uka mi své zboí.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Uka mi své zboí.
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Constantino prodává alchymistické zásoby.");
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
	description = "Chtìl bych se stát tvım uèedníkem.";
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
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Chtìl bych se stát tvım uèedníkem.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//MİM uèedníkem? Ne! U jsem jednou tu pochybnou èest mìl a to mi úplnì staèilo. S ádnım dalším uèedníkem u se otravovat nebudu.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Celá léta jsem mu pøedával vìdomosti a nakonec se ten pitomec zbláznil a otrávil se!
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Bì se zapsat k nìkomu z ostatních mistrù.
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "Chtìl bych se zapsat u nìkterého z ostatních mistrù.";
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
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Chtìl bych se zapsat u nìkterého z ostatních mistrù.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Pøišel jsi mì poádat o doporuèení?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hm - co se mì tıèe, mùeš se zapsat, u koho chceš.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Víš, ty to nechápeš! To, co jsem o tobì slyšel, nijak nemluví ve tvùj prospìch.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Nepøimluvím se za to, aby zloèinec jako ty zastával ve mìstì nìjakou èestnou pozici.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Dokud všechno neurovnáš s velitelem stráí, má odpovìï bude ne!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Constantino mi dá své doporuèení, pokud se ve mìstì nezapletu do ádného zloèinu.");
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
	description = "Co musím udìlat, abych se mohl stát TVİM uèedníkem?";
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
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Co musím udìlat, abych se mohl stát TVİM uèedníkem?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(povzdechne si) U si nevezmu na svìdomí ÁDNÉHO dalšího diletanta.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//Všude kolem roste spousta rozliènıch bylin. V rùznıch obmìnách jsou jejich úèinky velmi rozdílné.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Ty nejspíš neznáš ani polovinu z nich.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(povzdechne si) Tumáš - tohle je seznam tìch nejdùleitìjších rostlin.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Pøines mi od kadé jeden exempláø a moná si rozmyslím, zda tì pøijmout za uèedníka.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Constantino chce jednu rostlinu od kadého druhu, jinak mì jako uèedníka nepøijme.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "Co se tıèe tìch rostlin...";
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
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Co se tıèe tìch rostlin...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Jestli to nezvládneš sám, nikdy z tebe poøádnı alchymista nebude!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"Aha.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"U jsem sehnal všechny rostliny, které jsem ti mìl pøinést!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//U jsem sehnal všechny rostliny, které jsem ti mìl pøinést!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Coe? Taháš mì za nos, co?
	AI_PrintScreen("(Dát 11 bylin)",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
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
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Pøi Adanovi! Všechno je opravdu v poøádku.
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Kdo ví, moná e z tebe pøece jenom jednou bude slušnı alchymista.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Constantino mì pøíjme do uèení, jen kdy získám doporuèení od ètyøech mistrù.");
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
	description = "Mohu se teï stát tvım uèedníkem?";
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
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Mohu se teï stát tvım uèedníkem?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Co se mì tıèe, tak ano.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Haradovi záleí pøedevším na tom, abys dokázal v pøípadì skøetího útoku ubránit mìsto.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//A vypadá to, es ho o tom pøesvìdèil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Ale on si myslí, e jsi zbabìlec.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Ale Harad tvrdí, e tì ještì nikdy nevidìl.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper se o tvıch kvalitách zmínil pouze zdrenlivì.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Poèítám, e by si tì radši vzal do uèení sám.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Ale nakonec pøece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Odepøít souhlas zrovna z takového dùvodu rozhodnì není nijak èestné!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Ale jestli tì doporuèí i ostatní mistøi, nebudeš jeho hlas potøebovat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//A Bosper tì zatím vùbec nezná.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben je velmi pobonı.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Ale poehnal ti - to je dobré znamení.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Svùj souhlas ti však dá pouze tehdy, a si vyprosíš i poehnání od bohù.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben ani neví, kdo jsi.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//A co se tıèe Mattea, ten na tebe všude pìje chválu.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo tvrdí, e mu ještì nìco dluíš. Chceš-li jeho souhlas, radši bys tu záleitost mìl co nejrychleji vyøídit.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo tvrdí, e s tebou o téhle vìci zatím nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo tì prı ve svém krámku ještì nikdy nevidìl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//To znamená, es získal doporuèení ode všech mistrù!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Nyní tì doporuèují ètyøi mistøi - to postaèí, abys mohl k nìkomu vstoupit do uèení.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Jsi pøipraven vstoupit do uèení ke mnì?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"Nejdøív se na to musím vyspat.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Ano, mistøe.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Chceš-li k nìkomu v dolní èásti mìsta vstoupit do uèení, potøebuješ souhlas alespoò ètyø mistrù.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Take by sis mìl promluvit se všemi, kteøí ti zatím souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(podrádìnì) Ani náhodou! Slyšel jsem, es byl tady v Khorinisu obalován z nìjakého zloèinu!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Nepøijmu tì do uèení, dokud tu záleitost u velitele mìstské stráe neurovnáš.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Ano, mistøe.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(povzdechne si) No tak dobøe! Doufám, e svého rozhodnutí nebudu litovat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//Od téhle chvíle se tedy povauj za mého uèedníka.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	Npc_ExchangeRoutine(lothar,"START");
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Constantino mì pøijal za uèedníka. Nyní mám pøístup do horní ètvrti.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Nejdøív se na to musím vyspat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//No dobøe! Jestli do toho opravdu nechceš dát všechno, pak by sis mìl zvolit jiné povolání.
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
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(podrádìnì) Odmítám tì dál uèit, dokud budeš obalovanı ze zloèinu.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Zajdi za lordem Andrem a dej to nìjak do poøádku.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Tak ty ses pøidal k domobranì? U jsem o tom slyšel.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Chceš se rychle vyuèit a pak se pøidat k domobranì? Postarám se, abys to nemìl tak jednoduché.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Doufám ale, e se budeš dret naší dohody a budeš mi pravidelnì nosit rostliny a houby.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//A jestli jsou na tebe dvì povolání moc, tak prostì trochu míò spi!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Vidím, es vstoupil do Innosovıch slueb. To tedy nejspíš znamená, e od nynìjška u nebudeš mít tolik èasu, abys starci nosil byliny.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Ale i tak si povauji za èest, e jsem tì na tvé cestì podpoøil.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//Pokud si i pøes své nové povinnosti vyšetøíš trochu èasu na alchymii, vìz, e tì tu vdycky rád pøivítám.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Kam tím míøíš?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Poèítám, e vìtšina mıch uèedníkù sem pak prostì zaskoèí jen jednou za uherskı rok!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Pøinesl jsi mi aspoò nìjaké houby?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Tak tì tu zase máme.
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
	description = "Co mám dìlat?";
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
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Co mám dìlat?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Nejsem tak naivní, abych si myslel, e mladík jako ty bude celı den trávit se mnou mezi ètyømi stìnami.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Staèí, kdy mi èas od èasu pøineseš rostliny, které potøebuji, a já tì na oplátku budu uèit alchymistickému umìní.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Také si u mì mùeš nakoupit lahvièky. Vìtšinu pøísad si ale u budeš muset opatøit sám.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//A zároveò poèítám, e tady ve mìstì budeš jako øádnı obèan sekat latinu.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "Jaké rostliny mám obstarat?";
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
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Jaké rostliny mám obstarat?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Koupím všechno, co mi pøineseš - a zaplatím ti za to obvyklou cenu.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Za houby ale dostaneš zvláš slušnou sumièku.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Constantinovi mohu prodávat houby za mimoøádnì vıhodnou cenu.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "Chtìl jsi nìjaké houby.";
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
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Chtìl jsi nìjaké houby.
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"Tak já ti nìjaké pøinesu...",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Proè jsou tak dùleité?",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Mám tu pár...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Podaøilo se mi získat pár tmavıch hub.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Páni - ty jsou nejlepší! Skvìlá práce - a tady máš zlato!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER = CONSTANTINO_DUNKELPILZCOUNTER + Npc_HasItems(other,itpl_mushroom_01);
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_01) * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Npc_HasItems(other,itpl_mushroom_01));
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//A tady jsou ještì nìjaké další.
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//Mám tu pro tebe pár hub!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Sice nejsou tak dobré jako tmavé houby, ale i tak ti za nì zaplatím.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_02) * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Npc_HasItems(other,itpl_mushroom_02));
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Proè jsou tak dùleité?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//I kdy jsi mım uèedníkem, nevyvaním ti úplnì všechno.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//No dobøe - tak já ti to tedy povím. Ale musíš si to nechat pro sebe.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Tmavé houby jsou plné magické energie a pokadé, kdy nìkterou sníš, se ti èást její síly usadí v tìle.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Sníš-li dostateènı poèet tìchto hub, tvá magická energie se zvıší.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Kdybych ti to øekl døíve, nejspíš by sis všechny houby køeèkoval pro sebe, viï?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(povzdechne si) Ale èlovìèe!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//U ses mì na to ptal. (škodolibì) Kdo ví, moná e ti to jednou pøece jenom prozradím.
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Tak já ti nìjaké pøinesu.
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Skvìlé! Pøines mi jich co nejvíc!
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "Nauè mì alchymistickému umìní!";
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
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Nauè mì alchymistickému umìní!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//No dobøe, tak nejdøív základy.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Kadı lektvar se vyrábí z rostlin, které mají rùznou moc.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Samy o sobì nijak nepùsobí, ale v kombinaci s jinımi bylinami jejich úèinky rostou - a úkolem alchymie je právì tuto moc upravovat a vyuívat.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//OK pøípravì lektvaru s pomocí alchymistické kolony potøebuješ laboratorní baòku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Dále musíš znát správnou formuli a samozøejmì mít po ruce i pøíslušné ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Nìkteré uiteèné informace ti mohu pøedat.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Lektvary, které ti vrátí ztracenou sílu, ba dokonce i elixíry, které ti sílu zvıší natrvalo.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Všechno najednou se ale nauèit nemùeš.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino nauèí alchymistickému umìní.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "Rád bych se dozvìdìl nìjaké nové recepty na lektvary.";
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
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Rád bych se dozvìdìl nìjaké nové recepty na lektvary.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//Máš s alchymií nìjaké pøedchozí zkušenosti?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Ano, mám.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//A jsi stále naivu - to není špatná kvalifikace.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Myslím, e pár formulí ti mohu prozradit. Samozøejmì ale záleí na tom, co pøesnì chceš vìdìt.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino mì zasvìtí do tajù alchymie.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "O jaké recepty se se mnou mùeš podìlit?";
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
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//O jaké recepty se se mnou mùeš podìlit?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Lituji, ale nic víc u tì nauèit nemohu.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Nìkolik jich znám - vyber si sám.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Esence hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Extrakt hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixír hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixír ivota",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_constantino_teach_permhealth);
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
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixír síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_constantino_teach_permstr);
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
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Pro esenci hojivé síly potøebuješ léèivé rostliny a luèní pohanku.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//OK pøípravì extraktu hojivé síly si musíš opatøit léèivé byliny a luèní pohanku.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//A dej si pozor, abys ten extrakt správnì povaøil
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//K vytvoøení elixíru hojivé síly je zapotøebí trochu zkušeností.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Musíš si sehnat léèivé koøeny a luèní pohanku a velmi opatrnì všechno ohøívat.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Elixír ivota! Vzácnı to odvar! Ne e by jeho pøíprava byla tak sloitá - vlastnì jej lze namíchat docela snadno.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Ale pøísady jsou velmi vzácné - léèivé koøeny a královskı šovík.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Esence magie je nejjednodušším z magickıch lektvarù.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Natrhej pìt ohnivıch kopøiv, luèní pohanku a vše pomalu povaø.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Jakmile dovedeš pøipravit esenci magie, s trochou úsilí bys mìl dokázat vyrobit i její extrakt.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Pøi pøípravì tohoto elixíru staèí mít trošku citu a nechat jej jemnì pøejít varem. Jeho ingredience tvoøí ohnivé kopøivy a luèní pohanka.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Elixír síly! Vıteènı to mok! K jeho namíchání však potøebuješ vzácnı draèí koøen a královskı šovík.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//Pøi varu pak dávej pozor, aby bublinky nebyly pøíliš velké a nedoèkal ses pak nemilého pøekvapení!
	};
	Info_ClearChoices(dia_constantino_teach);
};

