
instance DIA_ADDON_LUCIA_EXIT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 999;
	condition = dia_addon_lucia_exit_condition;
	information = dia_addon_lucia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_lucia_exit_condition()
{
	return TRUE;
};

func void dia_addon_lucia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LUCIA_PICKPOCKET(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 900;
	condition = dia_addon_lucia_pickpocket_condition;
	information = dia_addon_lucia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80_FEMALE;
};


func int dia_addon_lucia_pickpocket_condition()
{
	return c_beklauen(80,100);
};

func void dia_addon_lucia_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_BACK,dia_addon_lucia_pickpocket_back);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_PICKPOCKET,dia_addon_lucia_pickpocket_doit);
};

func void dia_addon_lucia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};

func void dia_addon_lucia_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};


instance DIA_ADDON_LUCIA_HI(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_hi_condition;
	information = dia_addon_lucia_hi_info;
	permanent = FALSE;
	description = "A? Jak to jde?";
};


func int dia_addon_lucia_hi_condition()
{
	return TRUE;
};

func void dia_addon_lucia_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//A? Jak to jde?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Poslouchej, jestli bys r�d n�co k j�dlu, obra� se tam na Snafa. Jestli chce� n�co k pit�, pak mluv� se spr�vnou osobou.
};


instance DIA_ADDON_LUCIA_WAS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_was_condition;
	information = dia_addon_lucia_was_info;
	permanent = FALSE;
	description = "Tak co mi m��e� nab�dnout?";
};


func int dia_addon_lucia_was_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_was_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Tak co mi m��e� nab�dnout?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Bohu�el nem�me dost piva. Dostupn� je jenom na ostrovech, kam ho p�ivezli paladinov�.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//Tak dobr�, alespo� na n�co byli dob�� ...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A mimo to my obvykle pijeme ko�alku. M�m ko�alku vlastn� v�roby, grog a b�l� rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//(chutn�) hmmm ... Opravdu bys m�l zkusit TOTO. M�m recept od Samuela. Ten star� chl�pek fakt v�, jak m�chat pit�.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Lucia obchoduje s tvrd�m chlastem - ko�alkou.");
};


instance DIA_ADDON_LUCIA_KHORINIS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_khorinis_condition;
	information = dia_addon_lucia_khorinis_info;
	permanent = FALSE;
	description = "Hej, nejsi z Khorinisu?";
};


func int dia_addon_lucia_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bromor_lucia) || (NADJA_GAVELUCIAINFO == TRUE) || Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, nejsi z Khorinisu?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nep�ipom�nej mi to m�sto! M�j �ivot tam byl stra�n�.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Pod�vej, byla to velk� akce, kdy� dorazila lo� s nov�mi odsouzenci.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale tito ostatn� chlapi ... (sm�je se) Ne, d�ky. Mo�n� proto, �e jsme na ostrov�. No dobr�, ty �asy jsou pry�.
	if((MIS_LUCIASLETTER != 0) || (SC_KNOWSLUCIACAUGHTBYBANDITS != 0) || (NADJA_GAVELUCIAINFO != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Mluvila jsem s Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Pro�?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Jak� zbab�lost. Neud�lal nic, kdy� banditi p�i�li a zajali m�.
		TOPIC_END_LUCIA = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
	TOPIC_END_LUCIA = TRUE;
};


instance DIA_ADDON_LUCIA_JETZT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_jetzt_condition;
	information = dia_addon_lucia_jetzt_info;
	permanent = FALSE;
	description = "A co pl�nuje� ud�lat nyn�?";
};


func int dia_addon_lucia_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//A co pl�nuje� ud�lat nyn�?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Uvid�me. Pr�v� nyn� mi vyhovuje b�t zde se Snafem, Fiskem a ostatn�mi.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Ji� jsi hovo�il s Thorusem? (omdl�) � bo�e, to je fakt chlap!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(se sm�chem) Sorry ... zp�t k tvoj� ot�zce ... Nem�m ��dn� c�l, nech�v�m v�e n�hod�.
};


instance DIA_ADDON_LUCIA_PALADINE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_paladine_condition;
	information = dia_addon_lucia_paladine_info;
	permanent = FALSE;
	description = "Nem� moc v l�sce paladiny, �e?";
};


func int dia_addon_lucia_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_paladine_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nem� moc v l�sce paladiny, �e?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Fanatick� vrahy ovl�dan� M�gy ohn�? Ne.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Tento Lord Hagen a jeho nohsledi maj� kontrolu nad m�stem a ka�d�m ob�anem.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to je to, co m� v�bec nezaj�m�. Nechci �ekat U �erven� lucerny a� m� zav�ou.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(dia_addon_lucia_paladine);
		Info_AddChoice(dia_addon_lucia_paladine,"KONEC",dia_addon_lucia_paladine_back);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladinov� nebojuj� ve jm�nu Innose. On si vyb�r� sv� bojovn�ky s�m.",dia_addon_lucia_paladine_wahl);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladinov� jsou bojovn�ci Innose, ne vrazi.",dia_addon_lucia_paladine_murder);
	};
};

func void dia_addon_lucia_paladine_back()
{
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_wahl()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Paladinov� nebojuj� ve jm�nu Innose. On si vyb�r� sv� bojovn�ky s�m.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Opravdu? Mysl�m, �e lid� si vyb�raj� sv�j osud.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Nicm�n�, tv� slova m� p�ekvapuj�. Mluv�, jako bys byl jedn�m z nich.
	Info_AddChoice(dia_addon_lucia_paladine,"U� jsi n�kdy n�koho zabila?",dia_addon_lucia_paladine_kill);
};

func void dia_addon_lucia_paladine_kill()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//U� jsi n�kdy n�koho zabila?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Ne, a jsem docela r�da, �e je to tak.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Pros�m, nemluvme u� o takov�ch v�cech.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Vychutnejme si pit� a u�ime ka�dou chvilku, kterou n�m bohov� dali.
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_weib()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Ty chce� po�pinit jm�no Innosovo, �eno?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak to m��u ud�lat? To jsou mu�i, kte�� d�laj� zlo v jeho jm�n�.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//J� nicm�n� nepochybuji o Innosov� bo�stv�.
};

func void dia_addon_lucia_paladine_murder()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Paladinov� jsou Innosovi v�le�n�ci. Nejsou vrazi.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Opravdu? Jejich zbran� jsou poskvrn�ny krv� stejn� jako zbran� bandit� a pir�t�.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jedin�m rozd�lem je to, �e oni to d�laj� ve jm�nu Innose. Ne proto, aby p�e�ili.
	Info_AddChoice(dia_addon_lucia_paladine,"Ty chce� po�pinit jm�no Innosovo, �eno?",dia_addon_lucia_paladine_weib);
};


instance DIA_ADDON_LUCIA_ATTENTAT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 9;
	condition = dia_addon_lucia_attentat_condition;
	information = dia_addon_lucia_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_lucia_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lucia_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nic.
};


instance DIA_ADDON_LUCIA_TRADE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 99;
	condition = dia_addon_lucia_trade_condition;
	information = dia_addon_lucia_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Chci n�co k pit�.";
};


func int dia_addon_lucia_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chci n�co k pit�.
	b_givetradeinv(self);
};


instance DIA_ADDON_LUCIA_LERNEN(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 19;
	condition = dia_addon_lucia_lernen_condition;
	information = dia_addon_lucia_lernen_info;
	permanent = FALSE;
	description = "Je je�t� n�co, co m� m��e� nau�it?";
};


func int dia_addon_lucia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_lernen_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Je je�t� n�co, co m� m��e� nau�it?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(sm�je se) Ur�it�. M��u ti pomoct zv��it OBRATNOST.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Lucia mi m��e zv��it obratnost.");
};


instance DIA_ADDON_LUCIA_TEACH(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 101;
	condition = dia_addon_lucia_teach_condition;
	information = dia_addon_lucia_teach_info;
	permanent = TRUE;
	description = "Chci b�t obratn�j��.";
};


func int dia_addon_lucia_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_lernen))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chci b�t obratn�j��.
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_back()
{
	Info_ClearChoices(dia_addon_lucia_teach);
};

func void dia_addon_lucia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

