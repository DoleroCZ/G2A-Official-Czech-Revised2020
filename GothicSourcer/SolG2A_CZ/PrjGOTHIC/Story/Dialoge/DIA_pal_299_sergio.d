
instance DIA_SERGIO_EXIT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 999;
	condition = dia_sergio_exit_condition;
	information = dia_sergio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sergio_exit_condition()
{
	return TRUE;
};

func void dia_sergio_exit_info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Nech� Innos osv�tluje tvou cestu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_WELCOME(C_INFO)
{
	npc = pal_299_sergio;
	nr = 5;
	condition = dia_sergio_welcome_condition;
	information = dia_sergio_welcome_info;
	important = TRUE;
};


func int dia_sergio_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,dia_sergio_isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_welcome_info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Innos t� doprov�zej, co pro tebe mohu ud�lat?
};


instance DIA_SERGIO_ISGAROTH(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_isgaroth_condition;
	information = dia_sergio_isgaroth_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_isgaroth_condition()
{
	if(Npc_KnowsInfo(hero,pc_prayshrine_paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_sergio_isgaroth_info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Modlil ses za m� bratry. R�d bych ti za to pod�koval. �ekni mi, co pro tebe mohu ud�lat.
	Info_ClearChoices(dia_sergio_isgaroth);
	Info_AddChoice(dia_sergio_isgaroth,"Co takhle mal� pen�n� dar?",dia_sergio_isgaroth_spende);
	Info_AddChoice(dia_sergio_isgaroth,"Pod�l se se mnou o sv� v�le�nick� zku�enosti.",dia_sergio_isgaroth_xp);
};

func void dia_sergio_isgaroth_spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Co takhle mal� pen�n� dar?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Snad ti budou tyhle zla��ky k u�itku.
	b_giveinvitems(self,other,itmi_gold,100);
	Info_ClearChoices(dia_sergio_isgaroth);
};

func void dia_sergio_isgaroth_xp()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Pod�l se se mnou o sv� v�le�nick� zku�enosti.
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Kdy� bojuje�, d�vej si pozor, aby ti nikdo nemohl vpadnout do zad.
	other.hitchance[NPC_TALENT_2H] = other.hitchance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_sergio_isgaroth);
};


instance DIA_SERGIO_AUFGABE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_aufgabe_condition;
	information = dia_sergio_aufgabe_info;
	description = "Pot�ebuji se dostat do knihovny.";
};


func int dia_sergio_aufgabe_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_sergio_isgaroth))
	{
		return TRUE;
	};
};

func void dia_sergio_aufgabe_info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Pot�ebuji se dostat do knihovny.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//No, tam t� bohu�el nemohu pustit. Nejprve mus� splnit sv� �koly.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Ale mohu ti pomoci. Jdi za mistrem Isgarothem a promluv si s n�m. Sly�el jsem, �e pot�ebuje n�jakou pomoc. �el bych s�m - ale p�enech�m to tob�.
	SERGIO_SENDS = TRUE;
	Wld_InsertNpc(blackwolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(TOPIC_ISGAROTHWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ISGAROTHWOLF,LOG_RUNNING);
	b_logentry(TOPIC_ISGAROTHWOLF,"Mistr Isgaroth pot�ebuje pomoci ve svatyni. M�l bych se po n�m pod�vat.");
};


instance DIA_SERGIO_WHAT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_what_condition;
	information = dia_sergio_what_info;
	description = "Co tady d�l�?";
};


func int dia_sergio_what_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_sergio_what_info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Modl�m se k Innosovi, aby pos�lil m� pa�e a v�li.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Tak budu moci �elit v�em nebezpe��m a zni��m ka�d�ho jeho nep��tele k jeho v�t�� sl�v�.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//Jak� nep��tele?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//V�echny, kte�� se protiv� Innosov� v�li. A� u� to jsou lid� nebo p��ery.
};


instance DIA_SERGIO_BABO(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_babo_condition;
	information = dia_sergio_babo_info;
	description = "Nemohl by sis proj�t n�kolik lekc� s Babem?";
};


func int dia_sergio_babo_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_anliegen))
	{
		return TRUE;
	};
};

func void dia_sergio_babo_info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Nemohl by sis proj�t n�kolik lekc� s Babem?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//Pro� m� nepo��d� s�m?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Mysl�m, �e se styd�.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Aha. Dobr�, pokud to pro n�j tolik znamen�, budu ho cvi�it dv� hodiny ka�d� r�no. Za��n�me v p�t hodin. Vy�i� mu to.
	Npc_ExchangeRoutine(self,"TRAIN");
	b_startotherroutine(babo,"TRAIN");
	b_logentry(TOPIC_BABOTRAIN,"Sergio souhlasil, �e od nyn�j�ka bude s Babem ka�d� r�no dv� hodiny tr�novat.");
};


instance DIA_SERGIO_WHY(C_INFO)
{
	npc = pal_299_sergio;
	nr = 4;
	condition = dia_sergio_why_condition;
	information = dia_sergio_why_info;
	description = "Pro� nejsi s ostatn�mi paladiny?";
};


func int dia_sergio_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_welcome) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_why_info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Pro� nejsi s ostatn�mi paladiny?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//Mo�n� vypad� nezvykle, �e jsem tady, a�koliv i my paladinov� slou��me m�g�m, proto�e to jsou oni, kdo vykon�v� Innosovu v�li.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//My paladinov� jsme v�le�n�ci ve jm�n� Innosov�. Jeho v�le je n� z�kon. Moment�ln� �ek�m na dal�� rozkazy od m�g�.
};


instance DIA_SERGIO_ORDERS(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_orders_condition;
	information = dia_sergio_orders_info;
	permanent = TRUE;
	description = "M� n�jak� nov� rozkazy?";
};


func int dia_sergio_orders_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_why) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_orders_info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//M� n�jak� nov� rozkazy?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Zat�m m�m �as hledat s�lu v modlitb�ch.
};


instance DIA_SERGIO_START(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_start_condition;
	information = dia_sergio_start_info;
	permanent = FALSE;
	description = "M� m� doprovodit do pr�smyku.";
};


func int dia_sergio_start_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (SERGIO_FOLLOW == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_start_info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//M� m� doprovodit do pr�smyku.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Dobr�, ud�l�m to. Cestu zn�m, tak�e poj� se mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_SERGIO_GUIDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_guide_condition;
	information = dia_sergio_guide_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_sergio_guide_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_guide_info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Doprovod�m t� do pr�smyku. Ale ta nejnebezpe�n�j�� ��st cesty za��n� a� tam.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//Ale nepl�tvejme �asem.
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_ENDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_ende_condition;
	information = dia_sergio_ende_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_ende_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_ende_info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Jsme tady. A� u� t� �ek� v Hornick�m �dol� cokoliv, douf�m, �e se dostane� zp�tky.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Neboj se - vr�t�m se.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Innos t� doprov�zej. A� t� v�dy ochra�uje.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_SERGIO_PERM(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_perm_condition;
	information = dia_sergio_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_perm_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//U Innose, brat�e. Pokud jsi p�i�el dozv�d�t se n�co o po�ehn�n� me�e, zeptej se Marduka.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//Sly�el jsem o tob�. Jsi ten chlap�k z farem, kter� byl v Hornick�m �dol�. M� moje uzn�n�.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_PICKPOCKET(C_INFO)
{
	npc = pal_299_sergio;
	nr = 900;
	condition = dia_sergio_pickpocket_condition;
	information = dia_sergio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sergio_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_sergio_pickpocket_info()
{
	Info_ClearChoices(dia_sergio_pickpocket);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_BACK,dia_sergio_pickpocket_back);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_PICKPOCKET,dia_sergio_pickpocket_doit);
};

func void dia_sergio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sergio_pickpocket);
};

func void dia_sergio_pickpocket_back()
{
	Info_ClearChoices(dia_sergio_pickpocket);
};

