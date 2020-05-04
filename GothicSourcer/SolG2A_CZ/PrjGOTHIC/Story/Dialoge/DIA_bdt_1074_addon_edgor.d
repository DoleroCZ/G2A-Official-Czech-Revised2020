
var int edgor_exiteinmal;

instance DIA_ADDON_EDGOR_EXIT(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 999;
	condition = dia_addon_edgor_exit_condition;
	information = dia_addon_edgor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_edgor_exit_condition()
{
	return TRUE;
};

func void dia_addon_edgor_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2) && (EDGOR_EXITEINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Potìšením tì zmlátit ...
		EDGOR_EXITEINMAL = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EDGOR_PICKPOCKET(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 900;
	condition = dia_addon_edgor_pickpocket_condition;
	information = dia_addon_edgor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_edgor_pickpocket_condition()
{
	return c_beklauen(10,7);
};

func void dia_addon_edgor_pickpocket_info()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_BACK,dia_addon_edgor_pickpocket_back);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_PICKPOCKET,dia_addon_edgor_pickpocket_doit);
};

func void dia_addon_edgor_pickpocket_doit()
{
	b_beklauen();
	b_say(self,self,"$AWAKE");
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};

func void dia_addon_edgor_pickpocket_back()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};


instance DIA_ADDON_EDGOR_HI(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_hi_condition;
	information = dia_addon_edgor_hi_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_edgor_hi_condition()
{
	return TRUE;
};

func void dia_addon_edgor_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chceš vìdìt, jak to jde? Øeknu ti, jak to jde.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Byl jsem na tohle místo pøivezen nìkolika piráty. V bouølivé noci. Chlape, vyzvracel jsem všechno pøes palubu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//Dobrá, a potom Raven zamkl dùl, protože nìkolik debilù bylo pøíliš chtivých.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//A Franco se stal velitelem lovcù a má sklony zabíjet každého, kdo je proti nìmu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Tak, øekl bych, že to jde docela špatnì.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_EDGOR_FRANCO(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_franco_condition;
	information = dia_addon_edgor_franco_info;
	permanent = FALSE;
	description = "Jak se Franco stal velitelem téhle party?";
};


func int dia_addon_edgor_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//Jak se Franco stal velitelem tohoto tábora?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//To bylo velice lehké. Zabil Fletchera, minulého velitele.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher byl dobrý. Franco, ten nás opravdu vytáèí.
};


instance DIA_ADDON_EDGOR_MIS2(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_mis2_condition;
	information = dia_addon_edgor_mis2_info;
	permanent = FALSE;
	description = "Franco se mì zaptal na kamenné desky. Našel jsi je?";
};


func int dia_addon_edgor_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franco se mì zaptal na kamenné desky. Našel jsi je?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Chlape, ani jsem je nehledal. Všechno, co vím, je, že to má být ve staré budovì v pravo v bažinì.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A víš, mùj vnitøní hlas mi øíká, Edgore zùstaò hezky daleko od tìch starých budov umístìných hluboko v bažinì.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Jako bych mìl riskovat svùj zadek, kvùli tomu arogantnímu idiotovi Francovi!
	b_logentry(TOPIC_ADDON_STONEPLATE,"Edgor nikdy nepùjde hledat kamenné desky . Myslí, že jsou nìkde ve staré budovì v bažinì.");
};


instance DIA_ADDON_EDGOR_WEG(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_weg_condition;
	information = dia_addon_edgor_weg_info;
	permanent = FALSE;
	description = "Kde že je ta stará budova?";
};


func int dia_addon_edgor_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_weg_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Kde že je ta stará budova?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Vidíš tu velkou skálu tady? Následuj stezku od ní nelevo. Po chvíli se dostaneš skrz další skály.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tady se musíš dát doleva ... nebo doprava. Chlape, nepamatuji se, už je to nìjaká doba.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruiny jsou umístìny na malém kopci, skryté uvnitø rostlin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Možná budeš mít štìstí a nenajdeš to ...
};


instance DIA_ADDON_EDGOR_FOUND(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_found_condition;
	information = dia_addon_edgor_found_info;
	permanent = FALSE;
	description = "Našel jsem kamennou desku!";
};


func int dia_addon_edgor_found_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && !Npc_IsDead(franco) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_found_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//(šastný) Našel jsem kamennou desku!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(znudìnì) Opravdu. Jsi stateèný chlap.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(znudìnì) Hádám, že tím si možná vydìláš propustku do tábora. (zívá)
};


instance DIA_ADDON_EDGOR_TEACH(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_teach_condition;
	information = dia_addon_edgor_teach_info;
	permanent = FALSE;
	description = "Je tady nìco, co by jsi mì mohl nauèit?";
};


func int dia_addon_edgor_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Je tady nìco, co by jsi mì mohl nauèit?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Znám pár vìcí o krvavých mouchách. Nenávidím tyhle stvoøení málem víc než Franca!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Ale vím, jak mùžeš odtrhnout køídla a žihadlo z jejich mrtvých tìl. (nepatrnì šílenì) Ano, urvat ...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//K tomu vím jak získat extrakt z jejich žihadel.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//Mùžu tì to nauèit všechno, pokud chceš.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//ne zadarmo samozøejmì ...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Edgor toho hodnì ví o krvavých mouchách a jejich trofejích.");
	EDGOR_TEACH = TRUE;
};

func void b_edgor_notenoughgold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//Pøines trochu zlata. Pøijímám pouze mince, ne nìjaké drobky.
};


instance DIA_ADDON_EDGOR_TRAINSTART(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_start_condition;
	information = dia_addon_edgor_start_info;
	permanent = TRUE;
	description = "O krvavých mouchách ...";
};


func int dia_addon_edgor_start_condition()
{
	if(EDGOR_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_edgor_start_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//O krvavých mouchách ...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chceš vìdìt?
	Info_ClearChoices(dia_addon_edgor_trainstart);
	Info_AddChoice(dia_addon_edgor_trainstart,DIALOG_BACK,dia_addon_edgor_trainstart_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Vyndat žihadlo. (Stojí: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Utrhnout køídla. (Stojí: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_wing);
	};
	if(KNOWS_BLOODFLY == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Získat sekret z žihadla (Stojí: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_gift);
	};
};

func void dia_addon_edgor_trainstart_back()
{
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_sting()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak mùžu vyjmout žihadlo?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Zakru jím a usekni ho široce rozevøené. Teï rozsekni maso okolo ocasní èásti.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Teï mùžeš lehce vyndat žihadlo.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_wing()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jaká je nejlepší cesta k vyjmutí køídel?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//Lehké. Vezmi køídlo jednou rukou a usekni horní èást kùže skrz ostatní.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_gift()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(other.lp >= 1)
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak mùžu získat sekret krvavých much?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Usekni horní vrstvu otevøeného žihadla - mìl by jsi vidìt léèivý sekret vykapávající ven.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Není žádný risk v pití nebo používaní toho sekretu na lektvary.
			other.lp = other.lp - 1;
			KNOWS_BLOODFLY = TRUE;
			PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
			b_say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

