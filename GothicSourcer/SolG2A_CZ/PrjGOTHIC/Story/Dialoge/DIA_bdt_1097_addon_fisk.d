
instance DIA_ADDON_FISK_EXIT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 999;
	condition = dia_addon_fisk_exit_condition;
	information = dia_addon_fisk_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fisk_exit_condition()
{
	return TRUE;
};

func void dia_addon_fisk_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FISK_PICKPOCKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 900;
	condition = dia_addon_fisk_pickpocket_condition;
	information = dia_addon_fisk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_fisk_pickpocket_condition()
{
	return c_beklauen(118,300);
};

func void dia_addon_fisk_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_BACK,dia_addon_fisk_pickpocket_back);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_PICKPOCKET,dia_addon_fisk_pickpocket_doit);
};

func void dia_addon_fisk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};

func void dia_addon_fisk_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};


instance DIA_ADDON_FISK_HI(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 1;
	condition = dia_addon_fisk_hi_condition;
	information = dia_addon_fisk_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_fisk_hi_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, jestli hled� f�rov�ho obchodn�ka, tak jsi ho pr�v� na�el.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moje chatr� stoj� p�esn� za Estebanovou. Tak�e, pokud bude� n�co pot�ebovat, zastav se.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Fisk obchoduje se v�emi druhy zbran�.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_FISK_TRADE(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 888;
	condition = dia_addon_fisk_trade_condition;
	information = dia_addon_fisk_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_fisk_trade_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_trade_info()
{
	b_say(other,self,"$TRADE_2");
	b_givetradeinv(self);
	if(Npc_HasItems(self,itrw_bolt) < 50)
	{
		CreateInvItems(self,itrw_bolt,50 - Npc_HasItems(self,itrw_bolt));
	};
	if(Npc_HasItems(self,itrw_arrow) < 50)
	{
		CreateInvItems(self,itrw_arrow,50 - Npc_HasItems(self,itrw_arrow));
	};
};


instance DIA_ADDON_FISK_ATTENTAT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_attentat_condition;
	information = dia_addon_fisk_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fisk_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Pozorn� poslouchej, nem�m s t�m nic spole�n�ho, jasn�?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//(nevinn�) M�m sv� vlastn� probl�my, jsem jen ob�.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Pro�?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//Za svoji posledn� dod�vku jsem zaplatil kopu zlata.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale ta nikdy nedorazila! N�jak� svin� ji musela sebrat!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//(zhnusen�) N�kdo mi ji ukradl - asi od jednoho z mojich chlap�!
};


instance DIA_ADDON_FISK_LIEFERUNG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 3;
	condition = dia_addon_fisk_lieferung_condition;
	information = dia_addon_fisk_lieferung_info;
	permanent = FALSE;
	description = "Co to bylo za dod�vku?";
};


func int dia_addon_fisk_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_lieferung_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to bylo za dod�vku?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Bal��ek pln� pakl���. N�kdo by je mohl st�elit pir�t�m.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale ten chl�pek se j� zmocnil.(na�tvan�) Se v��m zlatem, co jsem mu dal.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten zkurvysyn se schov�v� n�kde v ba�in� ...
	MIS_LENNAR_LOCKPICK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_FISK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FISK,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"N�jak� chl�pek jm�nem Juan byl pov��en obchodovat s bandity. ��k� se, �e se ukryl n�kde v ba�in�ch.");
	b_logentry(TOPIC_ADDON_FISK,"Juan ukradl Fiskovu dod�vku (bal��ek s pakl��i). Schov�v� se n�kde v ba�in�.");
};

func void b_addon_fisk_aboutjuan()
{
	if(Npc_IsDead(juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Je mrtv�.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobr�, u� nem��e d�le podv�d�t!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Po��d �ije ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ty jsi tu svini nechal ��t?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nebyl s�m ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Co u� - zlikviduju i ty chl�pky, co jsou s n�m ...
	};
};

func void b_addon_fisk_belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Pokud jde o tebe ...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//M�m dobr� styky s Hunem.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Zajist�m, abys dostal zbran� velmi levn�.
	HUNO_ARMORCHEAP = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Pod�vej, jednou jsem dostal tenhle k�men od Corrista.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Je to moje jedin� v�c, kterou jsem zachr�nil po �niku z bari�ry. Mysl�m, �e se ti bude hodit v�ce ne� m�.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//A je�t� nav�c ti d�m jednu z m�ch zbran�.
		if(other.hitchance[NPC_TALENT_2H] > other.hitchance[NPC_TALENT_1H])
		{
			b_giveinvitems(self,other,itmw_streitaxt1,1);
		}
		else
		{
			b_giveinvitems(self,other,itmw_bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//(podiv�nsky) Podraz� m� a j� podraz�m tebe - to plat� po��d.
};


instance DIA_ADDON_FISK_GIVEPAKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 4;
	condition = dia_addon_fisk_givepaket_condition;
	information = dia_addon_fisk_givepaket_info;
	permanent = FALSE;
	description = "M�m tv�j bal��ek.";
};


func int dia_addon_fisk_givepaket_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_lennar_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepaket_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//M�m tv�j bal��ek.
	b_giveinvitems(other,self,itmi_addon_lennar_paket,1);
	MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LENNARPAKET);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//(�tastn�) Fakt! (podez��vav�) A co Juan?
	b_addon_fisk_aboutjuan();
	b_addon_fisk_belohnung();
};


instance DIA_ADDON_FISK_PAKETOPEN(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 5;
	condition = dia_addon_fisk_paketopen_condition;
	information = dia_addon_fisk_paketopen_info;
	permanent = FALSE;
	description = "Otev�el jsem tv�j bal��ek!";
};


func int dia_addon_fisk_paketopen_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (LENNARPAKET_OPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_paketopen_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otev�el jsem tv�j bal��ek!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(sm�je se) To se dalo �ekat! Nemohl ses do�kat, �e?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//M� aspo� ty pakl��e?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co je d�le�it�j�� - co se stalo s Juanem?
	b_addon_fisk_aboutjuan();
};


instance DIA_ADDON_FISK_GIVEPICKS(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 6;
	condition = dia_addon_fisk_givepicks_condition;
	information = dia_addon_fisk_givepicks_info;
	permanent = TRUE;
	description = "Tady m� tucet pakl��� ...";
};


func int dia_addon_fisk_givepicks_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_paketopen) && (MIS_LENNAR_LOCKPICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepicks_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Tady m� tucet pakl��� ...
	if(b_giveinvitems(other,self,itke_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Perfektn�. Kdo si po�k�, ten se do�k�.
		b_addon_fisk_belohnung();
		MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_LENNARPAKET);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To nen� tucet! (chyt�e) Nechce� jen zbo�� p�en�et, co?
	};
};


instance DIA_ADDON_FISK_INSPEKTOR(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 7;
	condition = dia_addon_fisk_inspektor_condition;
	information = dia_addon_fisk_inspektor_info;
	permanent = FALSE;
	description = "Juan pracoval pro Estebana!";
};


func int dia_addon_fisk_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_lieferung) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracoval pro Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//(ohromen�) Co�e?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nehraj si se mnou! V�d�l jsi to!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(s jistotou) Dob�e. M� pravdu. Douf�m, �e ale ch�pe�, pro� jsem ti to ne�ekl.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//V�ichni v tomhle t�bo�e v�, �e d�l� pro Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nechci se do toho moc m�chat jenom kv�li tomu, �e ty chce� ten sv�j �erven� k�men.
	Info_ClearChoices(dia_addon_fisk_inspektor);
	Info_AddChoice(dia_addon_fisk_inspektor,"J� ned�l�m pro Estebana ...",dia_addon_fisk_inspektor_antiesteban);
	Info_AddChoice(dia_addon_fisk_inspektor,"Nev���m ti.",dia_addon_fisk_inspektor_dontbelieve);
	Info_AddChoice(dia_addon_fisk_inspektor,"Tomu rozum�m!",dia_addon_fisk_inspektor_isee);
};

func void dia_addon_fisk_inspektor_isee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Tomu rozum�m!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dob�e! Te� zav�i hubu! Jinak n�s n�kdo usly��.
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_dontbelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nev���m ti.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//V�� si �emu chce�! Ale d�m ti radu - pokud bys cht�l o m� Estebanovi navykl�dat n�jak� l�i, tak t� nakopu!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_antiesteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//J� ned�l�m pro Estebana ...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha? Tak ty bys cht�l toho blba o�idit?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Potom ti porad�m - ned�lej to.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Pokud jde o Estebana, nem��e� nikomu v��it - jenom sob�, ch�pe�?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Ale te� u� dost t�ch �e�� - n�kdo n�s usly��!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};


instance DIA_ADDON_FISK_MEETING(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_meeting_condition;
	information = dia_addon_fisk_meeting_info;
	permanent = FALSE;
	description = "TY jsi za tou vra�dou.";
};


func int dia_addon_fisk_meeting_condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,zs_talk) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_meeting_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//TY jsi za tou vra�dou.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Ano. Esteban je mi trnem v oku.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//��dn�ho z bandit�, kte�� pro m� d�laj�, nepust� do dolu. Ujist�l se, �e V�ICHNI d�laj� pro n�ho - jen pro n�ho.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Tak�e si m��e vz�t provizi z ka�d�ho obchodu a tak m��e ovl�dat cel� t�bor.
	Info_ClearChoices(dia_addon_fisk_meeting);
	Info_AddChoice(dia_addon_fisk_meeting,"A co chce� d�lat?",dia_addon_fisk_meeting_now);
	Info_AddChoice(dia_addon_fisk_meeting,"Chce� na jeho m�sto?",dia_addon_fisk_meeting_you);
	if(!Npc_IsDead(esteban))
	{
		Info_AddChoice(dia_addon_fisk_meeting,"Mohl bych t� vydat Estebanovi ...",dia_addon_fisk_meeting_sell);
	};
};

func void dia_addon_fisk_meeting_you()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Chce� na jeho m�sto?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Ne, j� jsem jen obchodn�k - jen nechci, aby se mi n�kdo m�chal do �emesla.
};

func void dia_addon_fisk_meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Mohl bych t� vydat Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//A pak? A co by bylo potom? Ty fakt v���, �e ti d�, co chce�?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapome� na to - m�m lep�� n�pad.
};

func void dia_addon_fisk_meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co che� d�lat?
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Zbav�me se Estebana. To znamen�, �e ho zabije� a nastoup� na jeho m�sto.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Ale jak, m� kolem sebe ty str�e, nem�m �anci.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Proto je mus�me n�jak odl�kat. A odl�k�me je pravdou.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jakou pravdou?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Ud�lal jsi svou pr�ci. V�, �e j� stoj�m za tou vra�dou.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//�ekni to Estebanovi a on po�le str�e, aby m� zabily. Budu je �ekat.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//A� budou pry�, m��e� si to s t�m zkurvysynem vy��dit a j� se postar�m o str�e.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban je mrtv�. Budu se d�l v�novat sv� pr�ci ...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Tady, to je pro tebe ...
		b_giveinvitems(self,other,itmi_gold,500);
	};
	Info_ClearChoices(dia_addon_fisk_meeting);
	MIS_JUDAS = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	b_logentry(TOPIC_ADDON_ESTEBAN,"Fisk stoj� za tou vra�dou na Estebana.");
};


instance DIA_ADDON_FISK_SIEG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_sieg_condition;
	information = dia_addon_fisk_sieg_info;
	permanent = FALSE;
	description = "Esteban byl zabit.";
};


func int dia_addon_fisk_sieg_condition()
{
	if((MIS_JUDAS == LOG_SUCCESS) && Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban byl zabit.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Na to jsem �ekal v��nost.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Mysl�m, �e m� je�t� ud�lat dost pr�ce a j� taky.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Pokud bys n�co pot�eboval, v�, kde m� naj�t.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};

