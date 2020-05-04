
instance DIA_LOBART_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_exit_condition;
	information = dia_lobart_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lobart_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_stolencloths_condition;
	information = dia_lobart_stolencloths_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_stolencloths_condition()
{
	if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_stolencloths_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//Nev���m sv�m o��m! Ten bastard se tu produc�ruje v M�CH �atech!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Hej, ty!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Od t� doby cos tu byl naposled se mi ztratilo p�r v�c� z moj� truhly!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//M�l bys d�lat n�co u�ite�n�ho, ne �muchat kolem m�ho domu, ty l�nej mizero!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//Okam�it� mi vra� moje �aty!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"Zapome�!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"Tady, vezmi si je zp�tky.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"U� je nem�m.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Tady, vezmi si je zp�tky.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//Pokud je chce�, m��e� za n� taky ZAPLATIT!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(odm��en�) Te� b� d�lat n�co u�ite�n�ho!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//U� je nem�m.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//Prodals je, co? (�ve) J� ti uk�u, mlad�ku!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//Zapome�!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(�ve) J� ti uk�u, mlad�ku!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};


instance DIA_LOBART_HALLO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_hallo_condition;
	information = dia_lobart_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Co otravuje� na m�m pozemku?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//(zkoumav�) Na �� stran� jsi? Vzbou�enc�, nebo kr�le?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"Nerozum�m ...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"Jsem na kr�lov� stran�!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"Jsem s roln�ky!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Co pro tebe m��u ud�lat?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Jsem s roln�ky!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! Ten zpropadenej �tv�� Onar n�s dostane v�echny do hrobu!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Co mysl�, jak dlouho budou je�t� paladinov� jen tak st�t a p�ihl�et?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//Po tom, co Onar provedl, je cel� m�sto vzh�ru nohama.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Jsem na kr�lov� stran�!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(pohrdav�) 'Na kr�lov� stran�!' To sam� ��kali voj�ci z domobrany, kdy� mi vzali p�lku m�ch ovc�.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Ale kde jsou ti bastardi, kdy� si na n�s do�l�pnou banditi? A kde asi tak budou, a� n�s napadnou sk�eti?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//J� ti �eknu kde: ve m�st�, za �irok�mi hradbami.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Tak m� s t�m sv�m kr�lem neotravuj.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//Nerozum�m...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Co?! Nezahr�vej si se mnou, hochu! Chci v�d�t, na �� stran� jsi! Tak pro koho jsi?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "Pot�ebuju n�jak� vhodn� �aty!";
};


func int dia_lobart_kleidung_condition()
{
	if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_kleidung_info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Pot�ebuju n�jak� vhodn� �aty!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//M��u ti d�t �ist� farm��sk� pracovn� od�v.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//A m��e� za n�j zaplatit?
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"Sedl�k Lobart mi prod� pracovn� od�v.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//M��e� si ��st ceny odpracovat. Pokud teda HLED�� pr�ci.
		b_logentry(TOPIC_KLEIDUNG,"��st ceny si mohu odpracovat na statku. ��m v�c pr�ce odvedu, t�m m�n� m� ty �aty budou st�t.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "Kolik za ty pracovn� �aty chce�?";
};


func int dia_lobart_buyclothes_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void dia_lobart_buyclothes_info()
{
	WERT_LOBARTSRUESTUNG = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Kolik za ty pracovn� �aty chce�?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Dobr�, tak�e...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Pracoval jsi pro m� na poli.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Pomohl jsi m� �en�.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino ��kal, �es mu opravdu pomohl. A to u� n�co znamen� - ne poka�d� dr�� s n�den�ky.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth ��kal, �es zahnal bandity. Ti bastardi n�m zp�sobili hodn� pot��. D�ky, �es je odstranil z cesty!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//Levn�j�� u� to nebude.
		b_logentry(TOPIC_KLEIDUNG,"Ale neprod� mi je za m�n� ne� 30 zla��k�.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"To je moc drah�.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"Tak mi tedy dej ten pracovn� od�v (ochrana: zbran� 15, ��py 15).",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Tak to mi ty �aty dej.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Fajn, chlap�e. S poctivost� nejd�l dojde�. Tady je m�!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//V m�m dom� je truhla, ve kter� najde� �ist� od�v.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//Ale ani nepomysli na to, �e by sis bez opt�n� vzal cokoli dal��ho!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//Nem� dost zlata!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//To je moc drah�.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Jak je libo...
	Info_ClearChoices(dia_lobart_buyclothes);
};


instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_aufstandinfo_condition;
	information = dia_lobart_aufstandinfo_info;
	permanent = FALSE;
	description = "A co jinak?";
};


func int dia_lobart_aufstandinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_aufstandinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//A co jinak?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Jak, jinak? Hochu, ODKUD jsi? Jsme na pokraji ob�ansk� v�lky!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//A� dote� pohl�eli v�ichni farm��i na odvody m�stu jako na spravedlivou formu zdan�n�.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Ale od t� doby, co jsou v Khorinisu paladinov�, n�s voj�ci z domobrany nav�t�vuj� ��m d�l t�m �ast�jc a u� si pomalu berou �pln� v�echno.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Jestli to tak p�jde d�l, nic u� n�m nezbude.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//N�kte�� farm��i se za�ali bou�it. Onar byl prvn�!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "�ekni mi n�co o tom Onarovi.";
};


func int dia_lobart_onarstory_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_onarstory_info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//�ekni mi n�co o tom Onarovi.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Ty jsi �old�k, ne? Tak co bych ti m�l dal��ho ��kat o tv�m ��fovi?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar je nejv�t�� farm�� v okol�. Odtrhl se od m�sta.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//��k� se, �e si najal �old�ky, aby udr�el domobranu na uzd�!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Nen� se mu co divit.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//V ka�d�m p��pad� se na jeho farmu u� ��dn� kr�lovsk� voj�k neodv�� vstoupit.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "Kdo jsou ti �oldn��i, co si Onar najal?";
};


func int dia_lobart_sldinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_sldinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Kdo jsou ti �oldn��i, co si Onar najal?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//O t�ch chlapech toho moc nev�m. �dajn� jsou to v�t�inou b�val� v�z�ov� z trestaneck� kolonie.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(opovr�liv�) V�ichni moc dob�e v�d�, co se od nich d� o�ek�vat.
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "A co ty? Na �� stran� jsi? Roln�ci, nebo kr�l?";
};


func int dia_lobart_whichside_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_whichside_info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//A co ty? Na �� stran� jsi? Roln�ci, nebo kr�l?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Jsem p��li� bl�zko m�stu, ne� abych m�l na v�b�r.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Ale j� jsem vlastn� r�d. Nev�d�l bych, jak se rozhodnout.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Kr�l n�s vys�v� a Onar pos�l� sv� �old�ky na ka�d�ho, kdo se k n�mu odm�tl p�idat.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//To je taky d�vod, pro� se v�t�ina ostatn�ch farm��� je�t� nerozhodla. Ale d��ve �i pozd�ji se budou muset k jedn� stran� p�idat.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "Hled�m pr�ci.";
};


func int dia_lobart_worknow_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths) || Npc_KnowsInfo(other,dia_lobart_kleidung))
	{
		if(KAPITEL < 3)
		{
			return TRUE;
		};
	};
};

func void dia_lobart_worknow_info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Hled�m pr�ci.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//Dal��ho roln�ka u� nem��u pot�ebovat. Ale m��u ti nab�dnout pr�ci n�den�ka.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//T�m mysl�m, �e m��e� p�ilo�it ruku k d�lu na poli. A taky se ur�it� najde p�r dal��ch v�c�, co se tu kolem mus� ud�lat.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//M��u ti zaplatit zlatem. Nebo ti d�m n�jak� slu�n� v�ci na sebe.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Ty v�ci docela stoj� za to. Nem��u ti je d�t zadarmo, ale m��u ti je pak prodat se slevou.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"Sedl�k Lobart mi m��e prodat pracovn� od�v. ��st ceny si mohu odpracovat na jeho statku - ��m v�c pr�ce odvedu, t�m m�n� m� ty �aty budou st�t.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Ale kdy� na tebe tak kouk�m, mus�m ��ct: vezmi si ty �aty.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Ale ty u� m� �aty, tak�e asi bude� cht�t zlato.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Tak�e - ten tu��nov� z�hon za stodolou se mus� sklidit.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"J� m�m tahat ze zem� tu��n? To si mus� d�lat srandu!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"Dobr� ...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Dobr�...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Tak si s t�m koukej posp�it, ne� si to rozmysl�m.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Sedl�k Lobart chce, abych mu z pole sklidil tu��ny. Za odm�nu dostanu p�r zla��k� a budu si u n�j moci koupit o�acen� se slevou.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//J� m�m tahat ze zem� tu��n? To si mus� d�lat srandu!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Po��dn� chlapsk� pr�ce nen� pro takov�ho 'nafrn�n�ho d�entlmena', eh?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Bu� vytahej ty tu��ny ze zem�, nebo t�hni z moj� farmy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//Pr�v� te� pro tebe nem�m ��dnou dal�� pr�ci.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Sedl�k Lobart chce, abych mu z pole sklidil tu��ny. Za odm�nu dostanu p�r zla��k� a budu si u n�j moci koupit o�acen� se slevou.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};


instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_ruebenrunning_condition;
	information = dia_lobart_ruebenrunning_info;
	permanent = TRUE;
	description = "Tady jsou tvoje tu��ny!";
};


func int dia_lobart_ruebenrunning_condition()
{
	if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_ruebenrunning_info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Tady jsou tvoje tu��ny!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Hej, ty p�ece jen nebude� takovej darmo�rout.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Dej je m� �en� v kuchyni a �ekni j�, a� je uva��.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"Mus�m ty tu��ny doru�it do domu a p�edat je Lobartov� �en�, kter� z nich n�co dobr�ho uva��.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//A co moje mzda?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//M��u ti d�t 5 zlat�ch.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//... nebo ti slevit z ceny t�ch �at�. Tak co to bude?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"Ud�lej mi za ty hadry lep�� cenu!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"Dej mi t�ch 5 zlat�ch!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Ale to nen� v�ech 20!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Jsi tady na dovolen�?! Douf�m, �e ne, chlap�e, jinak m��e� na svou mzdu zapomenout!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Vra� se tam a p�ines jich v�c! Mazej do pr�ce, nebo ti uk�u!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Dej mi t�ch 5 zlat�ch!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Tady.
	b_giveinvitems(self,other,itmi_gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//A hned to nepropij.
	};
	Info_ClearChoices(dia_lobart_ruebenrunning);
};

func void dia_lobart_ruebenrunning_billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Ud�lej mi za ty hadry lep�� cenu!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Fajn! D�m ti je o 10 zlat�ch levn�jc.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "M� pro m� je�t� n�jakou dal�� pr�ci?";
};


func int dia_lobart_morework_condition()
{
	if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_morework_info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//M� pro m� je�t� n�jakou dal�� pr�ci?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Nejd��v skli� ty tu��ny a pak se uvid�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//J� ne, ale m��e� se zeptat m� �eny nebo chlap� na pol�ch. T�eba budou pot�ebovat s n���m pomoct.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "Andre m� poslal za tebou. M� pro m� n�jakou pr�ci?";
};


func int dia_lobart_andrehelplobart_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lobart_andrehelplobart_info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Andre m� poslal za tebou. M� pro m� n�jakou pr�ci?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Jo, jasn�. Z t�ch zatracenejch poln�ch �k�dc� u� se mi zved� kufr.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Odd�lej je v�echny. Je mi jedno jak!
	Log_AddEntry(TOPIC_BECOMEMIL,"Lobartova pole su�uj� poln� �k�dci - m�m je v�echny zahnat.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "Zato�il jsem s t�ma v�cma!";
};


var int dia_lobart_bugdead_noperm;

func int dia_lobart_bugdead_condition()
{
	if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_bugdead_info()
{
	if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//Zato�il jsem s t�ma v�cma!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Dobr� pr�ce. Nejsi zas tak �patnej deratiz�tor. Doporu��m t� soused�m. Na opl�tku si vezmi tohle.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BECOMEMIL,"Poln� �k�dci u� nebudou Lobarta obt�ovat - v�ichni u� jsou pry�.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//Zato�il jsem s t�ma v�cma!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Nepokou�ej si ze m� d�lat bl�zny. Po��d je tam vid�m. Bu� ty zv��ata zabije�, nebo na celou tu v�c zapome�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap3_exit_condition;
	information = dia_lobart_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lobart_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_DMT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 30;
	condition = dia_lobart_dmt_condition;
	information = dia_lobart_dmt_info;
	description = "Jak to jde s tvou farmou?";
};


func int dia_lobart_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_lobart_dmt_info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//Jak to jde s tvou farmou?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//U� se to ned� vydr�et.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Najednou se tu objevili ti chl�pci v �ern�ch k�p�ch a post�vaj� u cesty a u moj� farmy.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Nejd��v hrozn� dlouho mluvili s Vinem a pak zmizeli i s n�m.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"Kam odvlekli Vina?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"Co m�li za k�efty s Vinem?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Jenom zase n�jak� choroba. U� moc dlouho jen le�� v posteli. St�v� se j� to �asto.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//J� u� se z toho slo��m!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(dia_lobart_dmt,"Pro� svou �enu nevezme� k l��iteli?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"Pro� s t�mi �ernokab�tn�ky n�co neud�l�?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"Mluvil jsi s t�mi mu�i v �ern�m?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Pro� svou �enu nevezme� k l��iteli?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//M�li bychom zaj�t do m�sta za Vatrasem, ale nem��u vyt�hnout paty z domu, dokud se to tu n�jak neurovn�.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"Lobartov� �en� Hild� je �patn�, ale Vatras by pro ni m�l m�t n�jak� l�k.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Mluvil jsi s t�mi mu�i v �ern�m?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//Jasn�. Tomu se nejde vyhnout.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//M�m dojem, �e n�koho hledaj�.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Pro� s t�mi �ernokab�tn�ky n�co neud�l�?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//V�n� bych r�d. Ale vid�l jsem, jak jednoho �lov�ka z m�sta up�lili za�iva. Jenom tak.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Pro� bych m�l riskovat �ivot?
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//Co m�li za k�efty s Vinem?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//To ne��kal. Prost� ho vzali s sebou.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Kam odvlekli Vina?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Ode�li s n�m do hor.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "Vino se u� nevr�t�.";
};


func int dia_lobart_vinotot_condition()
{
	if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lobart_vinotot_info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino se u� nevr�t�.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Je mrtv�.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//P�ivedli ho k ��lenstv�.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//U Innose. Doufejme, �e ta no�n� m�ra u� brzy skon��.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "D�vej na svou farmu pozor!";
};


func int dia_lobart_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
	{
		return TRUE;
	};
};

func void dia_lobart_perm_info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//D�vej na svou farmu pozor!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//Pokus�m se.
};


instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap4_exit_condition;
	information = dia_lobart_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lobart_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 41;
	condition = dia_lobart_orkproblem_condition;
	information = dia_lobart_orkproblem_info;
	description = "M� probl�m se sk�ety?";
};


func int dia_lobart_orkproblem_condition()
{
	if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
	{
		return TRUE;
	};
};

func void dia_lobart_orkproblem_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//M� probl�m se sk�ety?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(�ve) Zatracen�. Copak to nikdy neskon��?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Kdy� to takhle p�jde d�l, nebude m�t moje farma hodnotu ani 3 zlat�ch.
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"Na Lobartov� statku se usadili sk�eti. M�m je n�jak zahnat.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "Vyhnal jsem ty sk�ety z tv�ho pozemku.";
};


func int dia_lobart_orksweg_condition()
{
	if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lobart_orksweg_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Vyhnal jsem ty sk�ety z tv�ho pozemku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//Nedovol nikomu, aby o paladinech ��kal, �e pro n�s mal� farm��e nic ned�laj�.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//D�ky Innosovi. Nem��u ti toho d�t zrovna moc, ale douf�m, �e alespo� ocen� vyj�d�en� m� vd��nosti.
	b_startotherroutine(vino,"Start");
	b_startotherroutine(lobartsbauer1,"Start");
	b_startotherroutine(lobartsbauer2,"Start");
	TOPIC_END_LOBARTSORKPROBLEM = TRUE;
	b_giveplayerxp(XP_KILLEDLOBARTORKS);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap5_exit_condition;
	information = dia_lobart_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lobart_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap6_exit_condition;
	information = dia_lobart_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lobart_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_PICKPOCKET(C_INFO)
{
	npc = bau_950_lobart;
	nr = 900;
	condition = dia_lobart_pickpocket_condition;
	information = dia_lobart_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_lobart_pickpocket_condition()
{
	return c_beklauen(65,80);
};

func void dia_lobart_pickpocket_info()
{
	Info_ClearChoices(dia_lobart_pickpocket);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};

func void dia_lobart_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lobart_pickpocket);
};

func void dia_lobart_pickpocket_back()
{
	Info_ClearChoices(dia_lobart_pickpocket);
};

