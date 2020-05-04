
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Jestli chce� n�co k pit�, mus� si to objednat.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif prod�v� v p��stavn� kr�m� n�poje.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "Po��t�m, �e tady zaslechne� spoustu v�c�.";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Po��t�m, �e tady zaslechne� spoustu v�c�.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//No a co je ti po tom?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Nov� zpr�vy v�dycky v�t�m s otev�enou n�ru��.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//A je stejn� otev�en� i tvoje pen�enka?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Ka�d� informace, kterou ti d�m, t� bude st�t 10 zla��k�.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, hospodsk� v p��stavn� kr�m�, prod�v� informace.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Ned�m ti za informaci v�c ne� 5 zla��k�.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Zapome� na to - najdu si je jinde.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"No dob�e, souhlas�m.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//No dob�e, souhlas�m.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Um� dob�e smlouvat (usm�je se). Jsem ti v�dycky k slu�b�m.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Ned�m ti za informaci v�c ne� 5 zla��k�.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Co�e, 5 zla��k�? Chce� m� o�ebra�it? (kr�tce se zamysl�) Tak to zaokrouhleme na 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Ne, takhle to nefunguje. �ekn�me 6.",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"Fajn, 7 zla��k� zn� rozumn�.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Zapome� na to - najdu si informace jinde.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//No dobr�, dobr�... slev�m tedy na 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Fajn, 7 zla��k� zn� rozumn�.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"Ne, ty tv� informace vlastn� a� tak nutn� nepot�ebuji.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Fajn, 7 zla��k� zn� rozumn�.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(zazub� se) To je moudr� rozhodnut�. Tak�e a� bude� n�co pot�ebovat, klidn� se m� zeptej.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Ne, ty tv� informace vlastn� a� tak nutn� nepot�ebuji.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hej, po�kej... (povzdech) - dobr�, 5 zla��k�, ale to je moje posledn� nab�dka!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"A pro� jsi to ne�ekl hned?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//A pro� jsi to ne�ekl hned?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//�le, prost� nejsem �pln� fit. Ale a� je to jak chce, u� jsme se dohodli.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Ne, takhle to nefunguje. �ekn�me 6.
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ty jsi p�kn� lump, v� to? No, kdy� na tom trv�, tak �ekn�me 6 zla��k� za ka�dou informaci.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "R�d bych si dal n�co k pit�.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//R�d bych si dal n�co k pit�.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "Pot�ebuji informace.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Pot�ebuji informace.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Vra� se, a� bude� m�t dost zlata.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Kdo pat�� mezi nejvlivn�j�� ob�any tohoto m�sta?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Kdo pat�� mezi nejvlivn�j�� ob�any tohoto m�sta?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Tady dole v p��stavu nenajde� nikoho. Jedin� zdej�� mocn� mu� je Lehmar.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Lichv�� nen� zrovna popul�rn�, ale m� zlato a p�r jin�ch vlivn�ch m욝an� mu dlu�� pen�ze.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Kupci a �emesln�ci maj� tak� dost velk� vliv - a� moc velk�, �ekl bych.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "Kdo v�echno Lehmarovi n�co dlu��?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Kdo v�echno Lehmarovi n�co dlu��?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(sm�je se) Jestli to chce� zjistit, m�l bys nahl�dnout do jeho ��etn� knihy.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Akor�t ur�it� nebude snadn� tam jen tak nepozorovan� nakouknout.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Pokud v�m, v�dycky ji nos� u sebe.
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "Kde bych mohl naj�t pr�ci?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Kde bych mohl naj�t pr�ci?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Tady v p��stavu pr�ci asi jen tak nenajde�. Bude� muset zaj�t za �emesln�ky v doln� ��sti m�sta.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Ale jestli m� trochu slu�n� me�, m��e� zkusit vyzvat na souboj Alrika. Bije se za pen�ze - najde� ho za skladi�t�m.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_ADDON_KARDIF_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_addon_kardif_missingpeople_condition;
	information = dia_addon_kardif_missingpeople_info;
	permanent = TRUE;
	description = "V� n�co o hledan�ch m욝anech?";
};


var int dia_addon_kardif_missingpeople_permanent;

func int dia_addon_kardif_missingpeople_condition()
{
	if((DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_kardif_missingpeople_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//V� n�co o hledan�ch m욝anech?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//V�m n�co o t�ch, co zmizeli ned�vno.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Byli to lid� tady odtud z p��stavu. M�l by ses tu proj� a poptat se jich.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//N�kte�� popisovali n�jak� p��pady v ni���ch �tvrt�ch m�sta.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//V�c by ti poradil asi Coragon.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//M� kr�mu v ni��� �tvti m�sta, bude-li m�t �as, ur�it� ti n�co zaj�man�ho pov�.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Je�t� je tu taky ryb�� Halvor, ten by tak� mohl n�co v�d�t a �ek bych, �e se s tebou o to r�d pod�l�.
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kardif si mysl�, �e kr�m�� Coragon nebo p��stavn� ryb�� Halvor by mohli o hledan�ch lidech v�d�t v�c.");
		DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "Kdo m� tady m��e n�co nau�it?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Kdo m� tady m��e n�co nau�it?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Tady v p��stavi�ti najde� p�r schopn�ch lid�.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Kov�� Carl je po��dn� sil�k. Vsad�m se, �e s jeho pomoc� si m��e� zv��it s�lu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Alrik toho v� spoustu o boji a Lares je prohnan� lump. N�kdy ho m��e� naj�t i tady v p��stavu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//A jestli jsi dostate�n� pra�t�n�, zastav se u star�ho Ignaze - v� v�echno o tuhlect� aleche... almich... o lektvarech.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Kde bych je v�echny na�el?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(mru��) Hochu, ne� bych ti to vysv�tlil, tak by kr�l vyhr�l celou tuhle v�lku proti sk�et�m.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Prost� se porozhl�dni po p��stavn� �tvrti a mus� je naj�t. A pokud to tu moc nezn�, stav se u Brahima a kup si od n�j mapu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//JEHO najde� snadno. M� ch��i hned vedle m� hospody. (mru��) Za tohle bych si m�l ��tovat dvojn�sobek.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, kov�� z p��stavn� �tvrti, mi m��e pomoci vylep�it s�lu.");
		b_logentry(TOPIC_CITYTEACHER,"Lares mi vylep�� obratnost a s�lu.");
		b_logentry(TOPIC_CITYTEACHER,"Alrik m� vycvi�� v boji jednoru�n�mi zbran�mi. Potlouk� se kdesi za skladi�t�m v p��stavn� �tvrti.");
		b_logentry(TOPIC_CITYTEACHER,"Ignaz mi uk�e n�kter� recepty na m�ch�n� lektvar�. �ije v p��stavn� �tvrti.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brahim kresl� a prod�v� mapy. Bydl� pobl� p��stavu.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "M��u dostat t�eba n�jakou 'zvl�tn�' pr�ci?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//M��u dostat t�eba n�jakou "zvl�tn�" pr�ci, abych mohl rychle p�ij�t k n�jak�m pen�z�m?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//N�co zvl�tn�ho ��k�? Hmmmm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...tak si zkus promluvit s Nagurem, mo�n� ti pom��e.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "M� pro m� n�jakou 'zvl�tn�' pr�ci?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//M� pro m� n�jakou "zvl�tn�" pr�ci?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//N�co pro tebe m�m - ale to t� bude zaj�mat jenom tehdy, pokud jsi opravdu v�estrann�.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Co m�?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//No, Zuris, co prod�v� na tr�i�ti lektvary, m� zrovna u sebe hosta - m�ga ohn� Darona.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//A?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Tesa� Thorben mu zvl᚝ vyrobil novou truhlu.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//A ten Daron mu pr� p�inesl spoustu cenn�ho zbo��. Ale nic jsi ode m� nesly�el, rozum�?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "Kde bych tu koupil n�jakou tr�vu?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Kde bych tu koupil n�jakou tr�vu?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Ur�it� ne tady - s takov�mi v�cmi nechci nic m�t.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Ur�it� ne tady.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//A kde tedy?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//B�t tebou, promluv�m si s Meldorem - ten hul� od r�na do ve�era.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "Co v� o bal�ku tr�vy z ba�in?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Co v� o bal�ku tr�vy z ba�in?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Ten, kdo takov� bal�k vlastn�, je boh��. A nejsp� taky t�k� pohod��!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Nesna� se m� oblbnout. Ty n�co v�, tak to vyklop!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Nojo, nojo - takov� chl�pek ke mn� onehd� p�i�el. Pat�il k �old�k�m.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//�e pr� v p��stavu prodal bal�k tr�vy z ba�in, ale samoz�ejm� byl tot�ln� zhulen�. V�c nev�m.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Kardif hovo�il s �oldn��em, kter� se sna�il prodat bal�k tr�vy z ba�in.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if((MIS_THIEFGUILD_SUCKED == TRUE) || ((DIEBESGILDE_OKAY >= 3) && Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hej ty, poj� sem. N�co pro tebe m�m.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Jeden chl�pek tu s tebou cht�l mermomoc� mluvit.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Kdy� t� tu nezastihl, nechal tu pro tebe vzkaz.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Chce se s tebou sej�t. Za Halvorov�m obchodem s rybami.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Tahle informace je zadarmo - to je ale v�jimka, hochu! V�ecko ostatn� t� zase bude n�co st�t.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Jak ten chl�pek vypadal?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//To ti m��u ��ct, ale nap�ed za to mus� zaplatit, k�mo. (za�kleb� se)
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Ka�d� informace, kterou ti d�m, t� bude st�t 10 zla��k�.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "Jak ten chl�pek vypadal?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Jak ten chl�pek vypadal?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//No, byl pom�rn� vysok�, siln� a m�l tmavou ple� - ale ��dnou uniformu. P�sobil tak n�jak... hroziv�.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//A jeho tv��?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Tv��? Kdy� se na m� pod�val, byl jsem r�d, �e si nep�i�el pro m�.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Z o�� mu koukala d�sn� zloba - ale i tak bys za n�m m�l zaj�t. Ur�it� to bude zaj�mav�.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Ale ot�zkou je, pro koho.
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "Ten bastard se m� sna�il zab�t!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Ten bastard se m� sna�il zab�t!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hele, j� za to p�ece nem��u! J� ti jenom p�edal informaci!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Jestli ti n�kdo �lape na paty, pak k tomu m� nejsp� sv� d�vody.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Aha, ty ses zapletl s t�m gangem. No dob�e, v tom p��pad� tu pro tebe n�co m�m.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(ti�e) Kdy� bude� pot�ebovat n�jak� �perh�ky, p�ij� za mnou, p�r jich tu je�t� m�m. A sta��, kdy� si �ekne� o n�co k pit�.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "Je�t� po��d pot�ebuji p�r n�mo�n�k�.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Je�t� po��d pot�ebuji p�r n�mo�n�k�.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//�asy jsou zl�, p��teli. V cel�m Khorinisu asi dost n�mo�n�k� nese�ene� - v�t�ina z nich z m�sta ode�la.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Ale kdy� si najde� dobr�ho kapit�na, pos�dku se�ene� celkem rychle - p�r chytr�ch chl�pk� se tu v�dycky najde.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Kde bych na�el kapit�na?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//To se nept� toho neprav�ho, j� jenom vedu tuhle hospodu.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Kardif m� poslal ke star�mu Jackovi, kter� mi nejsp� m��e pomoci.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Promluv si se star�m Jackem. Bloum� tu po p��stavu u� hezky dlouho. Kdy� p�ijde na n�mo�nictv�, je to tv�j mu�.
	};
};

