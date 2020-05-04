
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "Hal�, kr�sn� pan�.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Hal�, kr�sn� pan�.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hm. Odkud jsi utekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Co chce�?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "��k� se, �e jste se postavili kr�li?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//��k� se, �e jste se postavili kr�li?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//M�j otec se rozhodl, �e nade�el �as na to, abychom se za�ali spol�hat sami na sebe.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Domobrana n�m nikdy nepomohla. V�dycky jen p�i�li a sebrali n�m na�e z�soby j�dla.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "Jak� pr�ce je tady na farm� k dispozici?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Jak� pr�ce je tady na farm� k dispozici?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//M�j otec plat� ka�d�mu, kdo pom�h� br�nit farmu.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//M�l bys z�jem? Nevypad� jako n�kdo, kdo by se hrnul do pr�ce n�mezdn�ho roln�ka.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Kolik tv�j otec plat�?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//To bys m�l projednat sp� s n�m.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//V�m jen, �e ka�d� �old�k tady denn� dost�v� �old.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "M�te tu n�jak� pravidla, kter� bych m�l dodr�ovat?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//M�te tu n�jak� pravidla, kter� bych m�l dodr�ovat?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Nedot�kej se tu ni�eho, co nen� tvoje.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Vyh�bej se m�st�m, na kter�ch nem� co d�lat.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//A kdy� bude� muset za��t bojovat, dr� se pobl� �old�k�.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Pokud za�ne� h�dku s farm��i, budou tady v�ichni proti tob�.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "Jakou pr�ci tu vykon�v�?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//Jakou pr�ci tu vykon�v�?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Prod�v�m zbo��, kter� vyrob�me. Jestli chce� n�co koupit, sta�� d�t v�d�t.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Ale dovol mi t� varovat. Nestoj�m o ��dn� smlouv�n� a nem�m r�da dlouh� prsty, rozum�me si?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Ellena prod�v� na Onarov� statku r�zn� zbo��.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Uka� mi sv� zbo��!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Co ti m��u nab�dnout?
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Stalo se tu posledn� dobou n�co d�le�it�ho?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Stalo se tu posledn� dobou n�co d�le�it�ho?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//P�ed p�r dny m�j otec rozhl�sil, �e u� d�l nesm�me nic prod�vat ve m�st�.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Tak te� z�st�v�m na farm� a prod�v�m sv� zbo�� jenom n�v�t�vn�k�m statku.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Domobrana napad� sousedn� farmy ��m d�l t�m �ast�ji. Je to jen ot�zka �asu, kdy m�j otec zas�hne.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Zem� se stala pon�kud nebezpe�nou. Te� si nikdo netroufne ani za humna. U� je to p�kn� dlouho, co se n�kter� z n�s naposledy vypravil do m�sta.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//�oldn��i byli ��m d�l t�m v�c nesv�. Ale jakmile odt�hl Sylvio se sv�mi kump�ny, vypadaj� u� trochu klidn�ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//V�ichni tu mluv� o hroz�c�m sk�et�m �toku. Ale j� tomu moc nev���m. Podle m� jsme tady na farm� p�ed nimi v bezpe��.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "Prod�v� d�ln� akcie?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Prod�v� d�ln� akcie?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//No a co? S�m jsem za n� zaplatil posledn� drobn�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

