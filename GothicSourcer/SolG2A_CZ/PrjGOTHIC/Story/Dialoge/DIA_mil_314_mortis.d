
instance DIA_MORTIS_EXIT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 999;
	condition = dia_mortis_exit_condition;
	information = dia_mortis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mortis_exit_condition()
{
	return TRUE;
};

func void dia_mortis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORTIS_HALLO(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_hallo_condition;
	information = dia_mortis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mortis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Co chce�? Peck tady nen�. Tak�e nic nedostane�. P�ij� pozd�ji.
};


instance DIA_MORTIS_WAFFE(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_waffe_condition;
	information = dia_mortis_waffe_info;
	permanent = FALSE;
	description = "Kde je Peck?";
};


func int dia_mortis_waffe_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_waffe_info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//Kde je Peck?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Jsi u n�s nov�, co? V tom p��pad� v�tej mezi n�mi.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Peck u� je ve m�st� v�n� dost dlouho. Vsad�m se, �e se zase mot� kolem t� sla�ou�k� Vanji u �erven� lucerny.
};


instance DIA_MORTIS_PAKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_paket_condition;
	information = dia_mortis_paket_info;
	permanent = FALSE;
	description = "Co v� o tom bal�ku tr�vy z ba�in?";
};


func int dia_mortis_paket_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_paket_info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Co v� o tom bal�ku tr�vy z ba�in?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Hm... kdy� jsem byl posledn� v p��stavn� kr�m�, sly�el jsem, jak se o n�m bav� Kardif s n�jak�m dal��m chlap�kem.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Kdo byl ten druhej chl�pek?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Nem�m tu�en�. Ale ��kal, �e pro sv� rostlinky na�el nejlep�� mo�n� m�sto - pak se oba za�ali chl�mat jako opil� sk�eti.
	b_logentry(TOPIC_WAREHOUSE,"Mortis zaslechl, jak se hospodsk� Kardif v p��stavn� kr�m� domlouv� s n�jak�m dal��m mu�em o bal�ku tr�vy. Dohadovali se o tom, kde ji uskladnit.");
};


instance DIA_MORTIS_REDLIGHT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_redlight_condition;
	information = dia_mortis_redlight_info;
	permanent = FALSE;
	description = "Co v� o p��stavn� �tvrti?";
};


func int dia_mortis_redlight_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_redlight_info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Co v� o p��stavn� �tvrti? R�d bych na�el toho, kdo tu tr�vu z ba�in prod�v�.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Nooo, ti chl�pci odtamtud toho moc nenamluv�, a rozhodn� ne�eknou nic n�komu, kdo je od m�stsk� str�e.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Jestli chce� tam dole n�co zjistit, m�l bys - ne, MUS͊ - si sundat brn�n�.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Dobr�, a potom?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Nejlep�� asi bude zaj�t do kr�my a bordelu. Jestli se n�kde n�co dozv�, tak pr�v� tam.
	b_logentry(TOPIC_REDLIGHT,"Mortis se domn�v�, �e kdy� si budu cht�t v p��stavu koupit tr�vu, rad�i bych na sob� nem�l m�t ��dnou zbroj. Nejsp� bych to m�l zkusit v kr�m� nebo v nev�stinci.");
};


instance DIA_MORTIS_CANTEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 5;
	condition = dia_mortis_canteach_condition;
	information = dia_mortis_canteach_info;
	permanent = TRUE;
	description = "Chci se st�t siln�j��m.";
};


func int dia_mortis_canteach_condition()
{
	if(MORTIS_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_mortis_canteach_info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Chci se st�t siln�j��m.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Jasn�. Jestli jsi dost zku�en�, m��u ti pomoci s tr�ninkem.
		MORTIS_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Jasn�, �e bys cht�l. Ale proto�e nejsi ani jeden z n�s, ani paladin, tak z toho nic nebude.
	};
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Mortis, p��slu�n�k m�stsk� gardy, mi m��e pomoci zv��it s�lu.");
};


instance DIA_MORTIS_TEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 100;
	condition = dia_mortis_teach_condition;
	information = dia_mortis_teach_info;
	permanent = TRUE;
	description = "Chci se st�t siln�j��m.";
};


func int dia_mortis_teach_condition()
{
	if(MORTIS_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_mortis_teach_info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Chci se st�t siln�j��m.
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//U� jsi dost siln�. Jestli bys cht�l tr�novat d�l, mus� se poohl�dnout po n�kom jin�m.
	};
	Info_ClearChoices(dia_mortis_teach);
};

func void dia_mortis_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};


instance DIA_MORTIS_PICKPOCKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 900;
	condition = dia_mortis_pickpocket_condition;
	information = dia_mortis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_mortis_pickpocket_condition()
{
	return c_beklauen(38,60);
};

func void dia_mortis_pickpocket_info()
{
	Info_ClearChoices(dia_mortis_pickpocket);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_BACK,dia_mortis_pickpocket_back);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_PICKPOCKET,dia_mortis_pickpocket_doit);
};

func void dia_mortis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mortis_pickpocket);
};

func void dia_mortis_pickpocket_back()
{
	Info_ClearChoices(dia_mortis_pickpocket);
};

