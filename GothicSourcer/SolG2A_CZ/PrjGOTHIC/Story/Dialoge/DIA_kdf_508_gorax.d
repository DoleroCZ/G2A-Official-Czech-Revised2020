
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(Ukrast tento kl�� bude zatracen� t�k�)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Mohu ti n�jak pomoci?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "P�inesl jsem kopu zlata.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//P�inesl jsem kopu zlata.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(pln o�ek�v�n�) Ach - p�in�� dar Innosovi. Velmi dob�e, m�j synu.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Pou�iju tv�j dar ve prosp�ch kl�tera, jak si Innos p�eje.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi s t�m zlatem ud�lal? Utratils ho? P�ines ho sem!
	};
};


instance DIA_ADDON_GORAX_DARONSSTATUE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_addon_gorax_daronsstatue_condition;
	information = dia_addon_gorax_daronsstatue_info;
	permanent = TRUE;
	description = "M�m tady so�ku, kterou m�l Daron doru�it do kl�tera.";
};


func int dia_addon_gorax_daronsstatue_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gorax_daronsstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//M�m tady so�ku, kterou m�l Daron doru�it do kl�tera.
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(povzdychne) Je to hanebn�, �e takov� vz�cn� kus sem mus� p�in�st novic.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//A p�ece, je to sv�dectv� o tv�m odhodlan� slou�it Innosovi.
		if(b_giveinvitems(other,self,itmi_lostinnosstatue_daron,1))
		{
			Npc_RemoveInvItems(self,itmi_lostinnosstatue_daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Bu� si jist� mou vd��nost�, mlad� novici.
		MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_RETURNEDLOSTINNOSSTATUE_DARON);
		DIA_GORAX_GOLD_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//So�ka? Nevid�m ��dnou so�ku. Dones mi ji a j� budu ve�it tv�mu mal�mu p��behu.
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "Hled�m m�sto, kde bych se mohl vyspat.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Hled�m m�sto, kde bych se mohl vyspat.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Hned vedle dve�� je voln� postel. Prvn� napravo, vedle vchodu. M��e� sp�t tam.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Svoje v�ci si m��e� d�t do n�kter� z nepou��van�ch truhel.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//A nezapome� - v lo�nic�ch m�g� nem� co pohled�vat. Tak� nesm� vstupovat do knihovny, leda �e bys m�l v�slovn� povolen�.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "M� pro m� n�jak� �kol?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//M� pro m� n�jak� �kol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Vy novicov� v posledn� dob� pracujete tvrd�. A ti, kdo hodn� pracuj�, by tak� m�li hodn� j�st.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Tady m� kl�� od spi��rny. Najde� tam skopov� klob�sy. Rozd�l je mezi novice - ale spravedliv�!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//A� bude� hotov, zase za mnou p�ij�.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Mistr Gorax chce, abych skopov� klob�sy ze spi��rny spravedliv� rozd�lil mezi novice. Krom� m� jich kl�ter ob�v� celkem t�in�ct.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "Rozd�lil jsem ty klob�sy.";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Rozd�lil jsem ty klob�sy.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//A u�inil jsi tak spravedliv�. Vezmi si tenhle svitek s l��iv�m kouzlem - a b� si zase po sv� pr�ci.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//V�n�? V tom p��pad� ses ale p�i pln�n� toho �kolu moc nesna�il.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Bu� jsi ty klob�sy sn�dl s�m, nebo jsi n�komu dal v�c, ne� mu n�le�elo.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Poslouchej, proto�e jsi nov�, nech�m to protentokr�t b�t. Ale p��t� budu p��sn�j��!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "M� pro m� n�jak� dal�� �kol?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//M� pro m� n�jak� dal�� �kol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Ano. Jak v�, d�l�me tady v�born� v�no a tak� je prod�v�me.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, majitel hostince "U Mrtv� harpyje", si objednal dod�vku. Dohodli jsme se, �e za ty l�hve zaplat� 240 zlat�ch.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Dones mu tyto l�hve - ale nenech se o�idit.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Mistr Gorax chce, abych hospodsk�mu Orlanovi doru�il dvan�ct lahv� v�na. Cena za kus �in� 240 zla��k�.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "Byl jsem za Orlanem.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Byl jsem za Orlanem.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//A dostal jsi 240 zlat�ch?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"Ten �izu�k m� o�ulil! (P�edat 100 zla��k�.)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"Tady je zlato. (Odevzdat 240 zla��k�.)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi s t�m zlatem ud�lal? Utratils ho? P�ines ho sem!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Dal mi m�n�!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Tys mu to prodal lacin�ji? To ne, pro� jen jsem ze v�ech lid� pos�lal pr�v� TEBE?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Jsi naprosto a tot�ln� neschopn�. B� mi z o��.
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Dostal jsem ty pen�ze.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//V�born�. Jsi v�n� schopn�. Jako odm�nu si vezmi tenhle svitek s l��iv�m kouzlem. A te� b� a najdi si n�jakou dal�� pr�ci.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Ale ��st t�ch pen�z jsi u� sta�il utratit, co? Jsi k ni�emu - zmiz!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "Co tu m� na pr�ci?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//Co tu m� na pr�ci?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//M� �koly jsou mnoh� a r�znorod�. Nejsem jen spr�vce, jsem t� str�cem pokladnice.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Nav�c dohl��m na vinn� sklep a star�m se o kl�tern� z�soby j�dla.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Tak�e pokud bude� n�co pot�ebovat, m��e� za mnou kdykoliv zaj�t a dostane� to - samoz�ejm� za rozumnou protihodnotu.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistr Gorax m� m��e z�sobit v��m, co bych mohl v kl�te�e upot�ebit.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pot�ebuji p�r v�c�.";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Pot�ebuji p�r v�c�.
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "Pot�ebuji nov� m�sto na span�.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Pot�ebuji nov� m�sto na span�.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//Napravo odsud je voln� pokoj. Vezmi si tenhle kl��. Najde� tam v�echno, co pot�ebuje�.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Po�kej, �old�ku. Pot�ebuji si s tebou promluvit.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Co chce�?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Kl�ter se ocitl ve velice delik�tn� situaci.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//Moment�ln� se zd�, �e nikdo nev��� nikomu. A potom ta v�c s Pedrem, to je nav�sost... (polkne)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//M�m pro tebe �kol p��mo z nejvy���ch m�st. Nejsi �lenem Bratrstva ohn�, a tedy jedin�, kdo tu v�c m��e za��dit.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Ale mus�m t� varovat. Pokud ti ten �kol zad�m, bude� jej muset splnit. Jakmile se dozv�, o co se jedn�, nebude� u� m�t na v�b�r. Rozum�?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Zapome� na to. Je to na m� p��li� riskantn�.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"�ekni, co chce�.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Zapome� na to. Je to na m� p��li� riskantn�.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//V po��dku. V tom p��pad� zapome�, �e bych cokoliv ��kal.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//�ekni, co chce�.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Dobr�. Poslouchej dob�e, proto�e to �eknu jenom jednou.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes chce, abys Pedra za jeho zradu potrestal smrt�, jakmile se ti dostane do rukou.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Jakmile sv�j �kol spln�, dostane� zaplaceno.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Nikdy jsem to ne�ekl. A tys tak� nic nesly�el, rozum�?
	b_logentry(TOPIC_TRAITORPEDRO,"Gorax mi vy��dil vzkaz od Serpenta, �e pokud naraz�m na zr�dce Pedra, m�m ho bez okolk� zab�t.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};

