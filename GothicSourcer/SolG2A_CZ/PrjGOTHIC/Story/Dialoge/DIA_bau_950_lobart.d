
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
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//NevÏ¯Ìm sv˝m oËÌm! Ten bastard se tu producÌruje v M›CH öatech!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Hej, ty!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Od t˝ doby cos tu byl naposled se mi ztratilo p·r vÏcÌ z mojÌ truhly!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//MÏl bys dÏlat nÏco uûiteËn˝ho, ne Ëmuchat kolem m˝ho domu, ty lÌnej mizero!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//OkamûitÏ mi vraù moje öaty!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"ZapomeÚ!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"Tady, vezmi si je zp·tky.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"Uû je nem·m.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Tady, vezmi si je zp·tky.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//Pokud je chceö, m˘ûeö za nÏ taky ZAPLATIT!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(odmÏ¯enÏ) TeÔ bÏû dÏlat nÏco uûiteËn˝ho!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//Uû je nem·m.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//Prodals je, co? (¯ve) J· ti uk·ûu, mladÌku!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//ZapomeÚ!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(¯ve) J· ti uk·ûu, mladÌku!
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
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Co otravujeö na m˝m pozemku?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//(zkoumavÏ) Na ËÌ stranÏ jsi? Vzbou¯enc˘, nebo kr·le?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"NerozumÌm ...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"Jsem na kr·lovÏ stranÏ!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"Jsem s rolnÌky!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Co pro tebe m˘ûu udÏlat?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Jsem s rolnÌky!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! Ten zpropadenej ötv·Ë Onar n·s dostane vöechny do hrobu!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Co myslÌö, jak dlouho budou jeötÏ paladinovÈ jen tak st·t a p¯ihlÌûet?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//Po tom, co Onar provedl, je cel˝ mÏsto vzh˘ru nohama.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Jsem na kr·lovÏ stranÏ!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(pohrdavÏ) 'Na kr·lovÏ stranÏ!' To sam˝ ¯Ìkali voj·ci z domobrany, kdyû mi vzali p˘lku m˝ch ovcÌ.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Ale kde jsou ti bastardi, kdyû si na n·s doöl·pnou banditi? A kde asi tak budou, aû n·s napadnou sk¯eti?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//J· ti ¯eknu kde: ve mÏstÏ, za öirok˝mi hradbami.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Tak mÏ s tÌm sv˝m kr·lem neotravuj.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//NerozumÌm...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Co?! Nezahr·vej si se mnou, hochu! Chci vÏdÏt, na ËÌ stranÏ jsi! Tak pro koho jsi?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "Pot¯ebuju nÏjakÈ vhodnÈ öaty!";
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
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Pot¯ebuju nÏjakÈ vhodnÈ öaty!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//M˘ûu ti d·t Ëist˝ farm·¯sk˝ pracovnÌ odÏv.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//A m˘ûeö za nÏj zaplatit?
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"Sedl·k Lobart mi prod· pracovnÌ odÏv.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//M˘ûeö si Ë·st ceny odpracovat. Pokud teda HLED¡ä pr·ci.
		b_logentry(TOPIC_KLEIDUNG,"»·st ceny si mohu odpracovat na statku. »Ìm vÌc pr·ce odvedu, tÌm mÈnÏ mÏ ty öaty budou st·t.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "Kolik za ty pracovnÌ öaty chceö?";
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
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Kolik za ty pracovnÌ öaty chceö?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Dobr·, takûe...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Pracoval jsi pro mÏ na poli.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Pomohl jsi mÈ ûenÏ.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino ¯Ìkal, ûes mu opravdu pomohl. A to uû nÏco znamen· - ne pokaûdÈ drûÌ s n·denÌky.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth ¯Ìkal, ûes zahnal bandity. Ti bastardi n·m zp˘sobili hodnÏ potÌûÌ. DÌky, ûes je odstranil z cesty!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//LevnÏjöÌ uû to nebude.
		b_logentry(TOPIC_KLEIDUNG,"Ale neprod· mi je za mÈnÏ neû 30 zlaù·k˘.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"To je moc drahÈ.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"Tak mi tedy dej ten pracovnÌ odÏv (ochrana: zbranÏ 15, öÌpy 15).",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Tak to mi ty öaty dej.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Fajn, chlapËe. S poctivostÌ nejd·l dojdeö. Tady je m·ö!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//V mÈm domÏ je truhla, ve kterÈ najdeö Ëist˝ odÏv.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//Ale ani nepomysli na to, ûe by sis bez opt·nÌ vzal cokoli dalöÌho!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//Nem·ö dost zlata!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//To je moc drahÈ.
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
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Jak, jinak? Hochu, ODKUD jsi? Jsme na pokraji obËanskÈ v·lky!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//Aû doteÔ pohlÌûeli vöichni farm·¯i na odvody mÏstu jako na spravedlivou formu zdanÏnÌ.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Ale od tÈ doby, co jsou v Khorinisu paladinovÈ, n·s voj·ci z domobrany navötÏvujÌ ËÌm d·l tÌm ËastÏjc a uû si pomalu berou ˙plnÏ vöechno.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Jestli to tak p˘jde d·l, nic uû n·m nezbude.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//NÏkte¯Ì farm·¯i se zaËali bou¯it. Onar byl prvnÌ!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "ÿekni mi nÏco o tom Onarovi.";
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
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//ÿekni mi nÏco o tom Onarovi.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Ty jsi ûold·k, ne? Tak co bych ti mÏl dalöÌho ¯Ìkat o tvÈm öÈfovi?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar je nejvÏtöÌ farm·¯ v okolÌ. Odtrhl se od mÏsta.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//ÿÌk· se, ûe si najal ûold·ky, aby udrûel domobranu na uzdÏ!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//NenÌ se mu co divit.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//V kaûdÈm p¯ÌpadÏ se na jeho farmu uû û·dn˝ kr·lovsk˝ voj·k neodv·ûÌ vstoupit.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "Kdo jsou ti ûoldnÈ¯i, co si Onar najal?";
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
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Kdo jsou ti ûoldnÈ¯i, co si Onar najal?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//O tÏch chlapech toho moc nevÌm. ⁄dajnÏ jsou to vÏtöinou b˝valÌ vÏzÚovÈ z trestaneckÈ kolonie.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(opovrûlivÏ) Vöichni moc dob¯e vÏdÌ, co se od nich d· oËek·vat.
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "A co ty? Na ËÌ stranÏ jsi? RolnÌci, nebo kr·l?";
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
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//A co ty? Na ËÌ stranÏ jsi? RolnÌci, nebo kr·l?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Jsem p¯Ìliö blÌzko mÏstu, neû abych mÏl na v˝bÏr.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Ale j· jsem vlastnÏ r·d. NevÏdÏl bych, jak se rozhodnout.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Kr·l n·s vys·v· a Onar posÌl· sv˝ ûold·ky na kaûd˝ho, kdo se k nÏmu odmÌtl p¯idat.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//To je taky d˘vod, proË se vÏtöina ostatnÌch farm·¯˘ jeötÏ nerozhodla. Ale d¯Ìve Ëi pozdÏji se budou muset k jednÈ stranÏ p¯idat.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "Hled·m pr·ci.";
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
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Hled·m pr·ci.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//DalöÌho rolnÌka uû nem˘ûu pot¯ebovat. Ale m˘ûu ti nabÌdnout pr·ci n·denÌka.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//TÌm myslÌm, ûe m˘ûeö p¯iloûit ruku k dÌlu na poli. A taky se urËitÏ najde p·r dalöÌch vÏcÌ, co se tu kolem musÌ udÏlat.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//M˘ûu ti zaplatit zlatem. Nebo ti d·m nÏjakÈ sluönÈ vÏci na sebe.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Ty vÏci docela stojÌ za to. Nem˘ûu ti je d·t zadarmo, ale m˘ûu ti je pak prodat se slevou.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"Sedl·k Lobart mi m˘ûe prodat pracovnÌ odÏv. »·st ceny si mohu odpracovat na jeho statku - ËÌm vÌc pr·ce odvedu, tÌm mÈnÏ mÏ ty öaty budou st·t.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Ale kdyû na tebe tak kouk·m, musÌm ¯Ìct: vezmi si ty öaty.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Ale ty uû m·ö öaty, takûe asi budeö chtÌt zlato.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Takûe - ten tu¯Ìnov˝ z·hon za stodolou se musÌ sklidit.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"J· m·m tahat ze zemÏ tu¯Ìn? To si musÌö dÏlat srandu!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"Dobr· ...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Dobr·...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Tak si s tÌm koukej pospÌöit, neû si to rozmyslÌm.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Sedl·k Lobart chce, abych mu z pole sklidil tu¯Ìny. Za odmÏnu dostanu p·r zlaù·k˘ a budu si u nÏj moci koupit oöacenÌ se slevou.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//J· m·m tahat ze zemÏ tu¯Ìn? To si musÌö dÏlat srandu!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Po¯·dn· chlapsk· pr·ce nenÌ pro takov˝ho 'nafrnÏn˝ho dûentlmena', eh?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//BuÔ vytahej ty tu¯Ìny ze zemÏ, nebo t·hni z mojÌ farmy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//Pr·vÏ teÔ pro tebe nem·m û·dnou dalöÌ pr·ci.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Sedl·k Lobart chce, abych mu z pole sklidil tu¯Ìny. Za odmÏnu dostanu p·r zlaù·k˘ a budu si u nÏj moci koupit oöacenÌ se slevou.");
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
	description = "Tady jsou tvoje tu¯Ìny!";
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
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Tady jsou tvoje tu¯Ìny!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Hej, ty p¯ece jen nebudeö takovej darmoûrout.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Dej je mÈ ûenÏ v kuchyni a ¯ekni jÌ, aù je uva¯Ì.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"MusÌm ty tu¯Ìny doruËit do domu a p¯edat je LobartovÏ ûenÏ, kter· z nich nÏco dobrÈho uva¯Ì.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//A co moje mzda?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//M˘ûu ti d·t 5 zlat˝ch.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//... nebo ti slevit z ceny tÏch öat˘. Tak co to bude?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"UdÏlej mi za ty hadry lepöÌ cenu!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"Dej mi tÏch 5 zlat˝ch!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Ale to nenÌ vöech 20!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Jsi tady na dovolenÈ?! Douf·m, ûe ne, chlapËe, jinak m˘ûeö na svou mzdu zapomenout!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Vraù se tam a p¯ines jich vÌc! Mazej do pr·ce, nebo ti uk·ûu!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Dej mi tÏch 5 zlat˝ch!
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
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//UdÏlej mi za ty hadry lepöÌ cenu!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Fajn! D·m ti je o 10 zlat˝ch levnÏjc.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "M·ö pro mÏ jeötÏ nÏjakou dalöÌ pr·ci?";
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
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//M·ö pro mÏ jeötÏ nÏjakou dalöÌ pr·ci?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Nejd¯Ìv skliÔ ty tu¯Ìny a pak se uvidÌ.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//J· ne, ale m˘ûeö se zeptat mÈ ûeny nebo chlap˘ na polÌch. T¯eba budou pot¯ebovat s nÏËÌm pomoct.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "Andre mÏ poslal za tebou. M·ö pro mÏ nÏjakou pr·ci?";
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
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Andre mÏ poslal za tebou. M·ö pro mÏ nÏjakou pr·ci?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Jo, jasnÏ. Z tÏch zatracenejch polnÌch ök˘dc˘ uû se mi zved· kufr.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//OddÏlej je vöechny. Je mi jedno jak!
	Log_AddEntry(TOPIC_BECOMEMIL,"Lobartova pole suûujÌ polnÌ ök˘dci - m·m je vöechny zahnat.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "ZatoËil jsem s tÏma vÏcma!";
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
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//ZatoËil jsem s tÏma vÏcma!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Dobr· pr·ce. Nejsi zas tak öpatnej deratiz·tor. DoporuËÌm tÏ soused˘m. Na opl·tku si vezmi tohle.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BECOMEMIL,"PolnÌ ök˘dci uû nebudou Lobarta obtÏûovat - vöichni uû jsou pryË.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//ZatoËil jsem s tÏma vÏcma!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Nepokouöej si ze mÏ dÏlat bl·zny. Po¯·d je tam vidÌm. BuÔ ty zvÌ¯ata zabijeö, nebo na celou tu vÏc zapomeÚ.
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
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//Uû se to ned· vydrûet.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Najednou se tu objevili ti chl·pci v Ëern˝ch k·pÌch a post·vajÌ u cesty a u mojÌ farmy.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Nejd¯Ìv hroznÏ dlouho mluvili s Vinem a pak zmizeli i s nÌm.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"Kam odvlekli Vina?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"Co mÏli za köefty s Vinem?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Jenom zase nÏjak· choroba. Uû moc dlouho jen leûÌ v posteli. St·v· se jÌ to Ëasto.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//J· uû se z toho sloûÌm!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(dia_lobart_dmt,"ProË svou ûenu nevezmeö k lÈËiteli?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"ProË s tÏmi Ëernokab·tnÌky nÏco neudÏl·ö?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"Mluvil jsi s tÏmi muûi v ËernÈm?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//ProË svou ûenu nevezmeö k lÈËiteli?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//MÏli bychom zajÌt do mÏsta za Vatrasem, ale nem˘ûu vyt·hnout paty z domu, dokud se to tu nÏjak neurovn·.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"LobartovÏ ûenÏ HildÏ je öpatnÏ, ale Vatras by pro ni mÏl mÌt nÏjak˝ lÈk.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Mluvil jsi s tÏmi muûi v ËernÈm?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//JasnÏ. Tomu se nejde vyhnout.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//M·m dojem, ûe nÏkoho hledajÌ.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//ProË s tÏmi Ëernokab·tnÌky nÏco neudÏl·ö?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//V·ûnÏ bych r·d. Ale vidÏl jsem, jak jednoho ËlovÏka z mÏsta up·lili zaûiva. Jenom tak.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//ProË bych mÏl riskovat ûivot?
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//Co mÏli za köefty s Vinem?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//To ne¯Ìkal. ProstÏ ho vzali s sebou.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Kam odvlekli Vina?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Odeöli s nÌm do hor.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "Vino se uû nevr·tÌ.";
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
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino se uû nevr·tÌ.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Je mrtv˝.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//P¯ivedli ho k öÌlenstvÌ.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//U Innose. Doufejme, ûe ta noËnÌ m˘ra uû brzy skonËÌ.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "D·vej na svou farmu pozor!";
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
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//D·vej na svou farmu pozor!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//PokusÌm se.
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
	description = "M·ö problÈm se sk¯ety?";
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
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//M·ö problÈm se sk¯ety?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(¯ve) ZatracenÏ. Copak to nikdy neskonËÌ?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Kdyû to takhle p˘jde d·l, nebude mÌt moje farma hodnotu ani 3 zlat˝ch.
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"Na LobartovÏ statku se usadili sk¯eti. M·m je nÏjak zahnat.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "Vyhnal jsem ty sk¯ety z tvÈho pozemku.";
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
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Vyhnal jsem ty sk¯ety z tvÈho pozemku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//Nedovol nikomu, aby o paladinech ¯Ìkal, ûe pro n·s malÈ farm·¯e nic nedÏlajÌ.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//DÌky Innosovi. Nem˘ûu ti toho d·t zrovna moc, ale douf·m, ûe alespoÚ ocenÌö vyj·d¯enÌ mÈ vdÏËnosti.
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

