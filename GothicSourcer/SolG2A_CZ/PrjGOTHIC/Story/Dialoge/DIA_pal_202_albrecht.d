
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
	description = "Pot�ebuji mluvit s lordem Hagenem!";
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
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Pot�ebuji mluvit s lordem Hagenem!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Je ve velk� s�ni, p��mo tady.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Ale a� po n�m chce� cokoliv, sna� se to neprotahovat - je to velice zam�stnan� �lov�k!
};


instance DIA_ALBRECHT_HALLO(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 2;
	condition = dia_albrecht_hallo_condition;
	information = dia_albrecht_hallo_info;
	permanent = FALSE;
	description = "Co obn�� b�t paladinem?";
};


func int dia_albrecht_hallo_condition()
{
	return TRUE;
};

func void dia_albrecht_hallo_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Co obn�� b�t paladinem?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Paladin je Innos�v v�le�n�k. �ije, aby mu slou�il, a bojuje, aby mu tak prokazoval �est.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//On n�m na opl�tku prop�j�uje dar magie. Magie run - tu dost�v�me jako uzn�n� za na�e skutky.
};


instance DIA_ALBRECHT_CANTEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 99;
	condition = dia_albrecht_canteach_condition;
	information = dia_albrecht_canteach_info;
	permanent = TRUE;
	description = "M��e� m� n��emu nau�it?";
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
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//M��e� m� n��emu nau�it?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Pokud se uk�e, �e jsi toho hoden, v�nuji ti magickou runu paladin�.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Krom� toho t� mohu nau�it, jak si zv��it magickou s�lu.
		ALBRECHT_TEACHMANA = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Albrecht mi pom��e zv��it magickou moc.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//U��m pouze paladiny.
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
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//Na znamen� tv� hodnosti ti d�v�m Runu sv�tla. Je to symbol pravdy a spravedlnosti.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Osv�tluj cestu v�em, kdo jdou po stop�ch Innosov�ch.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//V�echny ostatn� runy si mus� vyslou�it. Vra� se, a� nabude� dojmu, �e jich jsi hoden.
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(self,itru_pallight,1);
		b_giveinvitems(self,other,itru_pallight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Kterou cestu sis zvolil?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Cestu uzdravov�n�, nebo cestu boje?
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Vol�m cestu uzdravov�n�.",dia_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Vol�m cestu boje.",dia_albrecht_teachpalrunes_combat);
	};
};

func void dia_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_albrecht_teachpalrunes);
};

func void b_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Je�t� nejsi hoden obdr�et dal�� kouzlo t�to cesty.
};

func void dia_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Vol�m cestu uzdravov�n�.
	if((PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("L��ba lehk�ch zran�n�",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("L��ba st�edn� t�k�ch zran�n�",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Vol�m cestu boje.
	if((PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Svat� st�ela",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Za�ehn�n� zla",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palrepelevil);
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
	description = "Chci zv��it svou magickou s�lu.";
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
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Chci zv��it svou magickou s�lu.
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Pokud bys cht�l zv��it svou magickou s�lu je�t� v�c, bude� si u� muset naj�t jin�ho u�itele.
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

