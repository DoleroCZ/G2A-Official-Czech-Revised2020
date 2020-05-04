
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
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Pot�en�m t� zml�tit ...
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
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chce� v�d�t, jak to jde? �eknu ti, jak to jde.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Byl jsem na tohle m�sto p�ivezen n�kolika pir�ty. V bou�liv� noci. Chlape, vyzvracel jsem v�echno p�es palubu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//Dobr�, a potom Raven zamkl d�l, proto�e n�kolik debil� bylo p��li� chtiv�ch.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//A Franco se stal velitelem lovc� a m� sklony zab�jet ka�d�ho, kdo je proti n�mu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Tak, �ekl bych, �e to jde docela �patn�.
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
	description = "Jak se Franco stal velitelem t�hle party?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//Jak se Franco stal velitelem tohoto t�bora?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//To bylo velice lehk�. Zabil Fletchera, minul�ho velitele.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher byl dobr�. Franco, ten n�s opravdu vyt���.
};


instance DIA_ADDON_EDGOR_MIS2(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_mis2_condition;
	information = dia_addon_edgor_mis2_info;
	permanent = FALSE;
	description = "Franco se m� zaptal na kamenn� desky. Na�el jsi je?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franco se m� zaptal na kamenn� desky. Na�el jsi je?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Chlape, ani jsem je nehledal. V�echno, co v�m, je, �e to m� b�t ve star� budov� v pravo v ba�in�.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A v�, m�j vnit�n� hlas mi ��k�, Edgore z�sta� hezky daleko od t�ch star�ch budov um�st�n�ch hluboko v ba�in�.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Jako bych m�l riskovat sv�j zadek, kv�li tomu arogantn�mu idiotovi Francovi!
	b_logentry(TOPIC_ADDON_STONEPLATE,"Edgor nikdy nep�jde hledat kamenn� desky . Mysl�, �e jsou n�kde ve star� budov� v ba�in�.");
};


instance DIA_ADDON_EDGOR_WEG(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_weg_condition;
	information = dia_addon_edgor_weg_info;
	permanent = FALSE;
	description = "Kde �e je ta star� budova?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Kde �e je ta star� budova?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Vid� tu velkou sk�lu tady? N�sleduj stezku od n� nelevo. Po chv�li se dostane� skrz dal�� sk�ly.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tady se mus� d�t doleva ... nebo doprava. Chlape, nepamatuji se, u� je to n�jak� doba.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruiny jsou um�st�ny na mal�m kopci, skryt� uvnit� rostlin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Mo�n� bude� m�t �t�st� a nenajde� to ...
};


instance DIA_ADDON_EDGOR_FOUND(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_found_condition;
	information = dia_addon_edgor_found_info;
	permanent = FALSE;
	description = "Na�el jsem kamennou desku!";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//(��astn�) Na�el jsem kamennou desku!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(znud�n�) Opravdu. Jsi state�n� chlap.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(znud�n�) H�d�m, �e t�m si mo�n� vyd�l� propustku do t�bora. (z�v�)
};


instance DIA_ADDON_EDGOR_TEACH(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_teach_condition;
	information = dia_addon_edgor_teach_info;
	permanent = FALSE;
	description = "Je tady n�co, co by jsi m� mohl nau�it?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Je tady n�co, co by jsi m� mohl nau�it?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Zn�m p�r v�c� o krvav�ch mouch�ch. Nen�vid�m tyhle stvo�en� m�lem v�c ne� Franca!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Ale v�m, jak m��e� odtrhnout k��dla a �ihadlo z jejich mrtv�ch t�l. (nepatrn� ��len�) Ano, urvat ...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//K tomu v�m jak z�skat extrakt z jejich �ihadel.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//M��u t� to nau�it v�echno, pokud chce�.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//ne zadarmo samoz�ejm� ...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Edgor toho hodn� v� o krvav�ch mouch�ch a jejich trofej�ch.");
	EDGOR_TEACH = TRUE;
};

func void b_edgor_notenoughgold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//P�ines trochu zlata. P�ij�m�m pouze mince, ne n�jak� drobky.
};


instance DIA_ADDON_EDGOR_TRAINSTART(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_start_condition;
	information = dia_addon_edgor_start_info;
	permanent = TRUE;
	description = "O krvav�ch mouch�ch ...";
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
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//O krvav�ch mouch�ch ...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chce� v�d�t?
	Info_ClearChoices(dia_addon_edgor_trainstart);
	Info_AddChoice(dia_addon_edgor_trainstart,DIALOG_BACK,dia_addon_edgor_trainstart_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Vyndat �ihadlo. (Stoj�: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Utrhnout k��dla. (Stoj�: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_wing);
	};
	if(KNOWS_BLOODFLY == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Z�skat sekret z �ihadla (Stoj�: 1 LP, 100 Zlata)",dia_addon_edgor_trainstart_gift);
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak m��u vyjmout �ihadlo?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Zakru� j�m a usekni ho �iroce rozev�en�. Te� rozsekni maso okolo ocasn� ��sti.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Te� m��e� lehce vyndat �ihadlo.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jak� je nejlep�� cesta k vyjmut� k��del?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//Lehk�. Vezmi k��dlo jednou rukou a usekni horn� ��st k��e skrz ostatn�.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak m��u z�skat sekret krvav�ch much?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Usekni horn� vrstvu otev�en�ho �ihadla - m�l by jsi vid�t l��iv� sekret vykap�vaj�c� ven.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Nen� ��dn� risk v pit� nebo pou��van� toho sekretu na lektvary.
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

