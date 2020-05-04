
instance DIA_ADDON_HUNO_EXIT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 999;
	condition = dia_addon_huno_exit_condition;
	information = dia_addon_huno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_huno_exit_condition()
{
	return TRUE;
};

func void dia_addon_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 900;
	condition = dia_addon_huno_pickpocket_condition;
	information = dia_addon_huno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_huno_pickpocket_condition()
{
	return c_beklauen(85,102);
};

func void dia_addon_huno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_BACK,dia_addon_huno_pickpocket_back);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_PICKPOCKET,dia_addon_huno_pickpocket_doit);
};

func void dia_addon_huno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_huno_pickpocket);
};

func void dia_addon_huno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
};


instance DIA_ADDON_HUNO_ABWIMMELN(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_abwimmeln_condition;
	information = dia_addon_huno_abwimmeln_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_huno_abwimmeln_condition()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		return TRUE;
	};
	if((HUNO_ZUSNAF == TRUE) && !Npc_KnowsInfo(other,dia_addon_fisk_meeting) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_huno_abwimmeln_info()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Co po��d chce�? T�hni!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co �ek�? Jdi do hospody!
	};
	AI_StopProcessInfos(self);
};


var int knows_flucht;
var int huno_angepisst;

instance DIA_ADDON_HUNO_HI(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_hi_condition;
	information = dia_addon_huno_hi_info;
	permanent = FALSE;
	description = "Na prvn� pohled je jasn�, �e v� co d�l�.";
};


func int dia_addon_huno_hi_condition()
{
	return TRUE;
};

func void dia_addon_huno_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Na prvn� pohled je jasn�, �e v� co d��.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Jednou jsem to u� sly�el ... p�inesl jsi tu ocel?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Ocel? Ne, mysl�m, �e si m� s n�k�m plete� ...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hm ... p�ipad� mi zn�m�. Nepotkali jsme se u�?
	Info_ClearChoices(dia_addon_huno_hi);
	Info_AddChoice(dia_addon_huno_hi,"Jasn�, ve Star�m t�bo�e.",dia_addon_huno_hi_ja);
	Info_AddChoice(dia_addon_huno_hi,"Nepamatuji se.",dia_addon_huno_hi_no);
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Huno prod�v� kov��sk� vybaven�.");
};

func void dia_addon_huno_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Jasn�, ve Star�m t�bo�e.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//Star� t�bor ... aha ... ty jsi ten zv�dav� chl�pek ... myslel jsem, �e jsi mrtv�.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//No jo, to si mysl� v�ichni. Kdo je�t� p�e�il?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//P�r lid�. N�kte�� prchli s Ravenem jako j�. Hodn� chlap� v�ak zahynulo v t�bo�e.
	Info_ClearChoices(dia_addon_huno_hi);
	KNOWS_FLUCHT = TRUE;
};

func void dia_addon_huno_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nepamatuji se.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hm ... m�m hlavu jak st�ep ... k �ertu s t�m ...
	Info_ClearChoices(dia_addon_huno_hi);
};


instance DIA_ADDON_HUNO_BLITZ(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 2;
	condition = dia_addon_huno_blitz_condition;
	information = dia_addon_huno_blitz_info;
	permanent = FALSE;
	description = "�ekni mi o tv�m �t�ku.";
};


func int dia_addon_huno_blitz_condition()
{
	if((KNOWS_FLUCHT == TRUE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_blitz_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//�ekni mi o tv�m �t�ku.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//V den, kdy padla bari�ra, nastal obrovsk� zmatek.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//N�kte�� se schovali - jin� utekli a v�echno bylo vyplen�no.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co jsi ud�lal?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Zkusil jsem ut�ct z t�bora, jenom�e se n�hle vyjasnilo a mou k��� projela �hav� bolest.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//trefil m� ten zatracen� blesk! Ale vypad� to, �e jsem neohluchl ...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//A� pozd�ji mi �ekli, �e m� Thorus na�el a vzal s sebou.
};


var int huno_armorperm;

instance DIA_ADDON_HUNO_ARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_armor_condition;
	information = dia_addon_huno_armor_info;
	permanent = TRUE;
	description = "Pot�ebuju lep�� zbroj.";
};


func int dia_addon_huno_armor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_hi) && (HUNO_ARMORPERM == FALSE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_armor_info()
{
	Info_ClearChoices(dia_addon_huno_armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Pot�ebuju lep�� zbroj.
	if(HUNO_ARMORCHEAP == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Tak�e - m��e� ho m�t. To, �e je tak drah�, je Estebanovo na��zen�.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten zmetek si bere pod�l z ka�d� zbroje, co prod�m.
		BDT_ARMOR_H_VALUE = 2100;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Koupit t�kou zbroj bandity (Ochrana proti zbran�m: 50, ��p�m: 50, cena: 2100)",dia_addon_huno_armor_buy);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk mi �ekl, �e bys pro m� mohl ud�lat speci�ln� cenu.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Tak Fisk? Hm, fajn. Stejn� mu dlu��m laskavost.
		BDT_ARMOR_H_VALUE = 1400;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Koupit t�kou zbroj bandity (Ochrana proti zbran�m: 45, ��p�m: 45, cena: 1400)",dia_addon_huno_armor_buy);
	};
};

func void dia_addon_huno_armor_back()
{
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Ok, vezmu si tu zbroj.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_H_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Vypad� dob�e.
		b_giveinvitems(self,other,itar_bdt_h,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nem� pen�ze, nebude zbroj.
	};
	if(BDT_ARMOR_H_VALUE < 2100)
	{
		HUNO_ARMORPERM = TRUE;
	};
	Info_ClearChoices(dia_addon_huno_armor);
};


instance DIA_ADDON_HUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_attentat_condition;
	information = dia_addon_huno_attentat_info;
	permanent = FALSE;
	description = "O tom pokusu zavra�dit Estebana ...";
};


func int dia_addon_huno_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_huno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(v�hru�n�) Co ode m� chce�?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Hled�m zam�stnavatele ...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//A pro� s t�m leze� za mnou?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Myslel jsem, �e o tom n�co v�.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Ka�lu ti na to!
};


var int huno_nochmal;
var int huno_somethings_perm;
var int huno_counter;

func void b_addon_huno_stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(vzdych�) Te� poslouchej! A� u� t� tu nevid�m nebo se nezn�m!
	HUNO_ANGEPISST = TRUE;
};


instance DIA_ADDON_HUNO_SOMETHINGS(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_somethings_condition;
	information = dia_addon_huno_somethings_info;
	permanent = TRUE;
	description = "Sly�el jsem o tob� n�jak� zv�sti ...";
};


func int dia_addon_huno_somethings_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_attentat) && (HUNO_SOMETHINGS_PERM == FALSE) && ((FINN_TELLALL == TRUE) || (PAUL_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_huno_somethings_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//Sly�el jsem o tob� n�jak� zv�sti ...
	if(HUNO_NOCHMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//No?
		HUNO_NOCHMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Zase ty? (hroz�) Douf�m, �e tentokr�t je to n�co d�le�it�ho ...
	};
	HUNO_COUNTER = 0;
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Sly�el jsem, �e v dob� toho pokusu o vra�du jsi nebyl tam kde bys m�l ...
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(v�hru�n�) Pokra�uj?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(PAUL_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul ��kal, �e Estebana nen�vid�.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(v�hru�n�) Jo? Opravdu? A co je�t� ��kal?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(EMILIO_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio t� prozradil! Tutov� o t� vra�d� n�co v�!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(klidn�) Tak ti jsi mluvil se star�m Emiliem, jo??
		if(HUNO_COUNTER > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//A on nen� jedin�, kdo t� pode�r�v�.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//No a?
			HUNO_SOMETHINGS_PERM = TRUE;
			Info_ClearChoices(dia_addon_huno_somethings);
			Info_AddChoice(dia_addon_huno_somethings,"Pot�ebuji si n�co vyjasnit se zam�stnavatelem!",dia_addon_huno_somethings_contra);
			Info_AddChoice(dia_addon_huno_somethings,"Jestli jsi za tou vra�dou, zaplat� za to!",dia_addon_huno_somethings_pro);
			b_logentry(TOPIC_ADDON_ESTEBAN,"Vypad� to, �e m�m Huna v hrsti.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(vyhro�uje) Mo�n� by si si s n�m m�l promluvit je�t� jednou. Jsem si jist�, �e POZD�JI bude tvrdit p�esn� opak!
			b_addon_huno_stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic dal��ho ...
		b_addon_huno_stress();
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_huno_somethings_pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Jestli jsi za tou vra�dou, zaplat� za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(doch�z� mu trp�livost) Jsi idiot! Opravdu si mysl�, �e se t�m Estebanovi zavd���?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//T�hni!
	HUNO_MEGA_ANGEPISST = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Pot�ebuji si n�co vyjasnit se zam�stnavatelem!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//S Estebanem? Fakt? Poslu� si!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//U� na tu dod�vku oceli od pir�t� �ek�m p��li� dlouho.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Tipnul bych, �e Esteban ji zabavil, aby mi ji pak mohl prodat dr�.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Ned�l� to osobn�. M� na to p�r pra�iv�ch bandit�, kte�� jsou na jeho v�platn� p�sce.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Kde jsi to sly�el?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Opil� banditi moc mluv� ...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Zn� jm�no toho sd�ln�ho bandity?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//To nestoj� za pozornost. Ale ten chl�pek, kter�ho hled�, je Juan. Ale u� jsem ho v t�bo�e dlouho nevid�l.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Bude� ho muset naj�t n�kde v t� �ump� venku.
	MIS_HUNO_STAHL = LOG_RUNNING;
	HUNO_ANGEPISST = FALSE;
	Log_CreateTopic(TOPIC_ADDON_HUNO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HUNO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HUNO,"Huno �ek� na dod�vku oceli od pir�t�. Mysl� si, �e n�jak� chl�pek Juan ji zastavil na Esteban�v p��kaz a schov�v� se n�kde v ba�in�ch.");
	Info_ClearChoices(dia_addon_huno_somethings);
	Info_AddChoice(dia_addon_huno_somethings,"Nejprve mi �ekni, kdo je ten, co t� zam�stnal!",dia_addon_huno_somethings_tellmenow);
	Info_AddChoice(dia_addon_huno_somethings,"Ok, ud�l�m to pro tebe!",dia_addon_huno_somethings_mission);
};

func void dia_addon_huno_somethings_mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Ok, ud�l�m to pro tebe!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dob�e. Uvid�me, jestli se ti d� v��it.
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_tellmenow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Nejprve mi �ekni, kdo je ten, co t� zam�stnal!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Ne. Nev���m ti.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//D�vej pozor. Dal�� m�j rozhovor bude s t�m zam�stnavatelem nebo s Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//S k�m se bav� je tvoje v�c.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(vzdych�) Tak dob�e! Zprost�edkuju ti s n�m setk�n�. Ale bude po m�m, rozum�?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Jdi do hospody a promluv si s barmanem. On ti �ekne, co d�l.
	HUNO_ZUSNAF = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno mi �ekl, �e bych si m�l promluvit se Snafem.");
};


instance DIA_ADDON_HUNO_PAKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_paket_condition;
	information = dia_addon_huno_paket_info;
	permanent = FALSE;
	description = "M�m tu ocel.";
};


func int dia_addon_huno_paket_condition()
{
	if((MIS_HUNO_STAHL == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_steel_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_huno_paket_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//M�m tu ocel.
	b_giveinvitems(other,self,itmi_addon_steel_paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//A? Byl tam i Juan?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Byl.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//V�d�l jsem to. Ta krysa Esteban v tom byl namo�en�.
	if(HUNO_ZUSNAF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jsi fajn. Abych byl up��mn�, tak jsem to od tebe ne�ekal.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Tady, vezmi si tuhle odm�nu.
		b_giveinvitems(self,other,itmi_gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//A co te� bude s na�� dohodou?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Mu�, se kter�m chce� mluvit, t� �ek� v hospod�. Promluv si s barmanem.
		HUNO_ZUSNAF = TRUE;
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno mi �ekl, �e bych si m�l promluvit se Snafem.");
	MIS_HUNO_STAHL = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HUNOSTAHL);
};


instance DIA_ADDON_HUNO_TRADE(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 888;
	condition = dia_addon_huno_trade_condition;
	information = dia_addon_huno_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_huno_trade_condition()
{
	if(HUNO_ANGEPISST == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_huno_trade_info()
{
	b_say(other,self,"$TRADE_3");
	b_givetradeinv(self);
};

