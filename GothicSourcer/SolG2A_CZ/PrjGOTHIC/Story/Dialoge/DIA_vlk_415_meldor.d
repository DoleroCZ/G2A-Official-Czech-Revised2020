
instance DIA_MELDOR_EXIT(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 999;
	condition = dia_meldor_exit_condition;
	information = dia_meldor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_meldor_exit_condition()
{
	return TRUE;
};

func void dia_meldor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELDOR_HALLO(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_hallo_condition;
	information = dia_meldor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_hallo_info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//Co chce�?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//Cht�l jsem se tu trochu porozhl�dnout.
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//A kam p�esn� m� nam��eno?
};


instance DIA_MELDOR_INTERESSANTES(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_interessantes_condition;
	information = dia_meldor_interessantes_info;
	permanent = FALSE;
	description = "Co je tu zaj�mav�ho k vid�n�?";
};


func int dia_meldor_interessantes_condition()
{
	return TRUE;
};

func void dia_meldor_interessantes_info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//Co je tu zaj�mav�ho k vid�n�?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//Najde� tu nev�stinec i hospodu. Hostinsk� se jmenuje Kardif a jestli hled� n�jak� informace, pak je on ten prav�, s k�m si m� promluvit.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//Mimochodem, nepot�ebuje� pen�ze?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, hospodsk� z p��stavn� kr�my, prod�v� krom ko�alky i informace.");
};


instance DIA_MELDOR_LEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 3;
	condition = dia_meldor_lehmar_condition;
	information = dia_meldor_lehmar_info;
	permanent = FALSE;
	description = "Ty se jich chce� zbavit?";
};


func int dia_meldor_lehmar_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_interessantes))
	{
		return TRUE;
	};
};

func void dia_meldor_lehmar_info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//Ty se jich chce� zbavit?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(znud�n�) Ne, ale p��mo naproti p�es ulici s�dl� Lehmar - lichv��.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//Ur�it� ti p�r zla��k� p�j��, jen b� d�l.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MELDOR_ARBEITEST(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 4;
	condition = dia_meldor_arbeitest_condition;
	information = dia_meldor_arbeitest_info;
	permanent = FALSE;
	description = "Ty pro Lehmara pracuje�?";
};


func int dia_meldor_arbeitest_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_arbeitest_info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//Ty pro Lehmara pracuje�?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//Bystrej hoch.
};


instance DIA_MELDOR_INSOV(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_insov_condition;
	information = dia_meldor_insov_info;
	permanent = FALSE;
	description = "Vlastn� jsem m�l nam��eno do horn� �tvrti.";
};


func int dia_meldor_insov_condition()
{
	return TRUE;
};

func void dia_meldor_insov_info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//Vlastn� jsem m�l nam��eno do horn� �tvrti.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(sarkasticky) No jasn�. A j� si zase cht�l najmout lo�, aby m� zavezla p��mo na kr�lovsk� dv�r k audienci.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//Od t� doby, co sem p�i�li paladinov�, nemaj� takov� jako ty nebo j� v horn� �tvrti co pohled�vat.
};


instance DIA_MELDOR_CITIZEN(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 6;
	condition = dia_meldor_citizen_condition;
	information = dia_meldor_citizen_info;
	permanent = FALSE;
	description = "Ty jsi ob�anem tohoto m�sta?";
};


func int dia_meldor_citizen_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_insov))
	{
		return TRUE;
	};
};

func void dia_meldor_citizen_info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//Ty jsi ob�anem tohoto m�sta?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//Pokud t�m mysl�, jestli tu bydl�m, pak ano. Ale stejn� m� do horn� �tvrti nepust�.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//Tam se mohou dostat jenom nabub�el� hejskov� nebo obchodn�ci a �emesln�ci z doln� ��sti.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//Lid� z p��stavu v Khorinisu nemaj� velkou moc. Dokonce tu nem�me ani st�lou hl�dku domobrany.
};


instance DIA_MELDOR_SMOKE(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_smoke_condition;
	information = dia_meldor_smoke_info;
	permanent = FALSE;
	description = "Nev�, kde bych sehnal n�jak� ku�ivo?";
};


func int dia_meldor_smoke_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_meldor_smoke_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Nev�, kde bych sehnal n�jak� ku�ivo?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(odhaduje) Ne, nem�m pon�t�.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//Hmm, b�t tebou, zkus�m �t�st� u �erven� lucerny.
	};
};


var int meldor_dgnews;

instance DIA_MELDOR_PERM(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 7;
	condition = dia_meldor_perm_condition;
	information = dia_meldor_perm_info;
	permanent = TRUE;
	description = "Stalo se v posledn� dob� n�co zaj�mav�ho?";
};


func int dia_meldor_perm_condition()
{
	return TRUE;
};

func void dia_meldor_perm_info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//Stalo se v posledn� dob� n�co zaj�mav�ho?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//P�ed ned�vnem obr�tily str�e celou p��stavn� �tvr� vzh�ru nohama.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//Hledaly n�jakou odcizenou v�c - posledn� dobou se tu kr�de�e dost rozrostly, zvl�t� v lep��ch �tvrt�ch.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//O�ividn� se sna�� ty chud�ky z p��stavu obvinit �pln� ze v�eho.
	}
	else if((ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE) && (MELDOR_DGNEWS == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//Doneslo se mi, �e dole ve stok�ch byl rozpr�en n�jak� zlod�jsk� klan. V�ichni krad�ci byli zabiti.
		MELDOR_DGNEWS = TRUE;
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//V Hornick�m �dol� jsou pr� draci. Zaj�malo by m�, jestli odsud te� paladinov� vyraz� a pust� se s nimi do boje.
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//Podle toho, co se ��k�, tak u� jsou v�ichni draci mrtv�. N�kdo je vymetl �elezn�m ko�t�tem.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Ne.
	};
};


instance DIA_MELDOR_VONLEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_vonlehmar_condition;
	information = dia_meldor_vonlehmar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_vonlehmar_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_vonlehmar_info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//Hej, po�kej...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//Nesu ti zpr�vu od Lehmara.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_MELDOR_PICKPOCKET(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 900;
	condition = dia_meldor_pickpocket_condition;
	information = dia_meldor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_meldor_pickpocket_condition()
{
	return c_beklauen(34,55);
};

func void dia_meldor_pickpocket_info()
{
	Info_ClearChoices(dia_meldor_pickpocket);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_BACK,dia_meldor_pickpocket_back);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_PICKPOCKET,dia_meldor_pickpocket_doit);
};

func void dia_meldor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_meldor_pickpocket);
};

func void dia_meldor_pickpocket_back()
{
	Info_ClearChoices(dia_meldor_pickpocket);
};

