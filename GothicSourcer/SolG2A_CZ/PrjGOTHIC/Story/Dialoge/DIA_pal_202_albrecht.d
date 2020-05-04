
instance DIA_ALBRECHT_EXIT(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 999;
	condition = dia_albrecht_exit_condition;
	information = dia_albrecht_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALBRECHT_HAGEN(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 1;
	condition = dia_albrecht_hagen_condition;
	information = dia_albrecht_hagen_info;
	permanent = FALSE;
	description = "Potøebuji mluvit s lordem Hagenem!";
};


func int dia_albrecht_hagen_condition()
{
	if(lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_hagen_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Potøebuji mluvit s lordem Hagenem!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Je ve velké síni, pøímo tady.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Ale a po nìm chceš cokoliv, snaž se to neprotahovat - je to velice zamìstnaný èlovìk!
};


instance DIA_ALBRECHT_HALLO(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 2;
	condition = dia_albrecht_hallo_condition;
	information = dia_albrecht_hallo_info;
	permanent = FALSE;
	description = "Co obnáší být paladinem?";
};


func int dia_albrecht_hallo_condition()
{
	return TRUE;
};

func void dia_albrecht_hallo_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Co obnáší být paladinem?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Paladin je Innosùv váleèník. Žije, aby mu sloužil, a bojuje, aby mu tak prokazoval èest.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//On nám na oplátku propùjèuje dar magie. Magie run - tu dostáváme jako uznání za naše skutky.
};


instance DIA_ALBRECHT_CANTEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 99;
	condition = dia_albrecht_canteach_condition;
	information = dia_albrecht_canteach_info;
	permanent = TRUE;
	description = "Mùžeš mì nìèemu nauèit?";
};


func int dia_albrecht_canteach_condition()
{
	if(ALBRECHT_TEACHMANA == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_canteach_info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Mùžeš mì nìèemu nauèit?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Pokud se ukáže, že jsi toho hoden, vìnuji ti magickou runu paladinù.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Kromì toho tì mohu nauèit, jak si zvýšit magickou sílu.
		ALBRECHT_TEACHMANA = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Albrecht mi pomùže zvýšit magickou moc.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//Uèím pouze paladiny.
	};
};


instance DIA_ALBRECHT_TEACHPALRUNES(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 100;
	condition = dia_albrecht_teachpalrunes_condition;
	information = dia_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = "Jsem hoden dostat runu?";
};


func int dia_albrecht_teachpalrunes_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teachpalrunes_info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Jsem hoden dostat runu?
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//Na znamení tvé hodnosti ti dávám Runu svìtla. Je to symbol pravdy a spravedlnosti.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Osvìtluj cestu všem, kdo jdou po stopách Innosových.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Všechny ostatní runy si musíš vysloužit. Vra se, až nabudeš dojmu, že jich jsi hoden.
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(self,itru_pallight,1);
		b_giveinvitems(self,other,itru_pallight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Kterou cestu sis zvolil?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Cestu uzdravování, nebo cestu boje?
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Volím cestu uzdravování.",dia_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Volím cestu boje.",dia_albrecht_teachpalrunes_combat);
	};
};

func void dia_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_albrecht_teachpalrunes);
};

func void b_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Ještì nejsi hoden obdržet další kouzlo této cesty.
};

func void dia_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Volím cestu uzdravování.
	if((PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Léèba lehkých zranìní",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Léèba støednì tìžkých zranìní",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Volím cestu boje.
	if((PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Svatá støela",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Zažehnání zla",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func int dia_albrecht_teachpalrunes_pallightheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
	CreateInvItems(self,itru_pallightheal,1);
	b_giveinvitems(self,other,itru_pallightheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	Info_ClearChoices(dia_albrecht_teachpalrunes);
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palmediumheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
	CreateInvItems(self,itru_palmediumheal,1);
	b_giveinvitems(self,other,itru_palmediumheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palholybolt()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
	CreateInvItems(self,itru_palholybolt,1);
	b_giveinvitems(self,other,itru_palholybolt,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palrepelevil()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
	CreateInvItems(self,itru_palrepelevil,1);
	b_giveinvitems(self,other,itru_palrepelevil,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};


instance DIA_ALBRECHT_TEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 101;
	condition = dia_albrecht_teach_condition;
	information = dia_albrecht_teach_info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou sílu.";
};


func int dia_albrecht_teach_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teach_info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Chci zvýšit svou magickou sílu.
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Pokud bys chtìl zvýšit svou magickou sílu ještì víc, budeš si už muset najít jiného uèitele.
	};
	Info_ClearChoices(dia_albrecht_teach);
};

func void dia_albrecht_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};


instance DIA_ALBRECHT_PICKPOCKET(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 900;
	condition = dia_albrecht_pickpocket_condition;
	information = dia_albrecht_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_albrecht_pickpocket_condition()
{
	return c_beklauen(41,160);
};

func void dia_albrecht_pickpocket_info()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_BACK,dia_albrecht_pickpocket_back);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_PICKPOCKET,dia_albrecht_pickpocket_doit);
};

func void dia_albrecht_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_albrecht_pickpocket);
};

func void dia_albrecht_pickpocket_back()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
};

