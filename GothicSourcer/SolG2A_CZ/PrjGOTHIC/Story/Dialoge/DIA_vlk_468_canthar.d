
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = "Mus�m j�t!";
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Mus�m j�t!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Jak je libo.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//To od tebe bylo opravdu hloup�, �e jsi m� napadl.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(posm�n�) To sis myslel, �e m� p�em��e� tak snadno?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Bu� mi to n�jak vynahrad�, nebo se budu d�vat na to, jak ho�ce lituje� sv�ch �in�!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//A co p�esn� mysl�?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"Nem�l jsem toho tolik!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"Tady je zlato - zapomeneme na tu v�c!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Tady je zlato - zapomeneme na tu v�c!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//To je od tebe hodn� rozumn�!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//Nem�l jsem toho tolik!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Tak pro� pl�tv� m�m �asem?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Tak kohopak to tu m�me?
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Jsi na cest� do m�sta, nem�m pravdu?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Mo�n�.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Hm! (odfrkne) Vypad� jako uprchl�k! V�ichni uprchl�ci maj� nam��eno do m�sta.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Dokonce bys mohl b�t b�val�m v�zn�m z hornick� kolonie.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(kvapn�) Je mi jedno, odkud jde�. Ale v���m, �e bych pro tebe m�l zaj�mavou nab�dku.
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde pr�ce, roln�ku?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"Vypad�m snad jako farm��?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"Nemohu si st�ovat.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Co pro tebe mohu ud�lat?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nem��u si st�ovat.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//M��u pro tebe n�co ud�lat?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Vypad�m snad jako roln�k?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//P�esn� jako roln�k. Ale nemluv� tak!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(hloubav�) Jestli nejsem �pln� mimo, tak bych pro tebe m�l zaj�mavou nab�dku.
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "Co je to za nab�dku?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Co je to za nab�dku?
	if(CANTHAR_GOTME == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Tak, jak si to ty p�edstavuje�, t� str�e do m�sta nikdy nepust�.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//(ironicky) Jestli bude� v o��ch str�� tak "p�esv�d�iv�" jako v t�ch m�ch, nikdy t� do m�sta nepust�.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//M��u ti pomoct dostat se do m�sta.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//M�m tady kousek pap�ru. S kr�lovskou pe�et� a podpisem m�stodr��c�ho. Propustku.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//S timhle kouskem pap�ru v kapse m��e� vypadat tak otrhan�, jak se ti zachce, a str�e t� nechaj� na pokoji.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//M� z�jem?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"Ne! Nech si ten pap�r!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"Co za tu propustku chce�?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"Jak se dostane� do m�sta TY?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"V tom mus� b�t n�jak� h��ek ...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Jsem obchodn� cestuj�c�. Prod�v�m od ka�d�ho trochu.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Canthar obchoduje se v��m mo�n�m zbo��m.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//V tom mus� b�t n�jak� h��ek.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//(p�ehr�v�) Ne. ��dn� h��ek. Jenom mi bude� dlu�it laskavost.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//Jak se dostane� do m�sta TY?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Str�e u� m� znaj�. Prost� jim �eknu, �e jsem svoji propustku ztratil.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Co za tu propustku chce�?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(spokojen�) V�D�L JSEM, �e ty jsi ten prav�!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Poslouchej. Te� ode m� dostane� tu propustku.
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Jen tak?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Jen tak. ALE: A� t� ve m�st� potk�m, m�m u tebe laskavost.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Dohodnuto?
	Info_AddChoice(dia_canthar_whatoffer,"Jasn�. Dej mi ten pap�r.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Jasn�. Dej mi ten pap�r.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Tady. Bu� na to opatrn�, je to velmi cenn�.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//Je�t� jedna v�c: Ani nepomysli na to, �e bys poru�il slovo!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Jako obchodn�k se ve m�st� t��m velk� v�nosti - nedopadlo by to pro tebe dob�e, v�� mi!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Od obchodn�ka Canthara jsem dostal propustku, s jej� pomoc� mohu vej�t do m�sta. A� ho tam potk�m, dlu��m mu za to protislu�bu.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Ne! Nech si ten pap�r!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Hm. Vypad� to, �e jsem se v tob� spletl, co?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Dobr�. Chce� je�t� n�co? M��u ti uk�zat sv� zbo��?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��!";
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Uka� mi sv� zbo��!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Vyber si.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//Je�t� st�le mi dlu�� laskavost. P�i�el �as splatit dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Hej, ty. M�m pro tebe �kol.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Co chce�?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Chci zp�tky sv�j st�nek na tr�i�ti. Sarah mi ho ukradla.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//Ale u� to m�sto zab�rala dost dlouho. Chci, aby mi ho vr�tila.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//A co j� s t�m?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//D�m ti dopis, co j� str�� do kapsy.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Pak p�jde� za lordem Andrem a �ekne� mu, �e Sarah prod�v� zbran� Onarovi.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Skon�� ve v�zen�, ty shr�bne� pen�ze a j� dostanu zp�tky sv�j st�nek.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//M� na to dva dny.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//Co z toho budu m�t?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Jakmile budu m�t zp�tky st�nek, dostane� ode m� zbra� - zatracen� dobrou zbra�.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"Ne, nechci s t�m nic m�t.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"NO tak dob�e, ud�l�m to.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"Co se stane, kdy� odm�tnu?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//Co se stane, kdy� odm�tnu?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//To by od tebe bylo opravdu hloup�. V�m, �e jsi b�val� trestanec.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Pokud se to roznese, m��e to o�kliv� ubl�it tv� pov�sti ve m�st�.
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Ne, nechci s t�m nic m�t.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//To bylo �patn� rozhodnut�, chlap�e. Je�t� si spolu promluv�me.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//Dobr�, vypad� to, �e nem�m na vybranou.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Chytrej kluk. Tady m� ten dopis.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//Jak j� ten dopis m�m podstr�it?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Nech ji, a� ti uk�e sv� zbo�� -  a mezit�m k n� ten dopis schovej.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//A nezapome�, �e m�m ve m�st� zna�n� vliv, tak�e ��dn� hlouposti.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"Canthar po mn� nyn� chce tu laskavost, kterou mu st�le dlu��m.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"Canthar mi za onu laskavost sl�bil p�knou zbra�.");
	};
	b_logentry(TOPIC_CANTHAR,"M�m obchodnici Sarah nen�padn� podstr�it dopis, kter� bud� zd�n�, �e prod�v� zbran� Onarovi. Pak m�m zaj�t za lordem Andreem a udat ji.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "Pokud jde o Sarah...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//Nem� co na pr�ci?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Nejd��v ten dopis podstr� Sarah, pak zajdi za Andrem a obvi� ji.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Ud�lej to a nepokou�ej se m� podv�st. Litoval bys toho.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//Ut�k� ti �as. Za�ni s t�m u�!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Sarah je mrtv�.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Opravdu? V�born�. Tak to jsi splnil polovinu na�eho mal�ho pl�nu.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "Pokud jde o Sarah...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Dobr� pr�ce. Sarah je tam, kde si zaslou��.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//P�evezmu jej� zbo��, tak�e jestli pot�ebuje� zbra�, stav se u m�.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Chystal ses mi d�t zbra�.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Spr�vn�. Tady, tahle zbra� je mistrovsk�m kouskem kov��sk�ho um�n�.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Hm, ty jsi tu znovu.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Jak to, �e nejsi ve v�zen�?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Byl jsem propu�t�n. Jak u� jsem ti ��kal - m�m ve m�st� velk� vliv.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//A mezit�m jsem se se Sarah dohodl s�m. M��e� na tu v�c s dopisem zapomenout.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Copak jsem t� nevaroval? Bylo by l�p, kdybys ud�lal, co jsem ti �ekl.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Te� se mezi obchodn�ky pov�d�, �e jsi trestanec.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Politov�n�hodn� v�c - te� tady na tr�i�ti nedostane� ani kousek chleba.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//Samoz�ejm� bych tu v�c mohl zase urovnat, �ekn�me...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Zaplat�?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"No tak dob�e, zaplat�m...",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"Nem�m u sebe dost pen�z ...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"Kolik �e to bylo?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Dobr�, zaplat�m. Ned�v� mi jinou mo�nost.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(sm�je se) V�born�. Tak to bych se m�l pod�vat na to, aby tv� reputace mezi obchodn�ky zase stoupla.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//Nem�m u sebe dost pen�z.
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Tak si je se�e�.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Kolik �e to bylo?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Varoval jsem t�, ale tys neposlouchal. Probereme to pozd�ji.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//A te� se ztra�, chci si odpo�inout.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "Prod�v� neleg�ln� d�ln� akcie!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Prod�v� neleg�ln� d�ln� akcie!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//No a? Co teda! Kdybych to ned�lal j�, chytne se toho n�kdo jin�.
	b_giveplayerxp(XP_AMBIENT);
};

