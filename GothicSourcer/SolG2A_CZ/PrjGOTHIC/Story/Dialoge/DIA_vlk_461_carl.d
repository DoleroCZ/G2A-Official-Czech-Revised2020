
instance DIA_CARL_EXIT(C_INFO)
{
	npc = vlk_461_carl;
	nr = 999;
	condition = dia_carl_exit_condition;
	information = dia_carl_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_carl_exit_condition()
{
	return TRUE;
};

func void dia_carl_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_carlsayhallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Vypad� to, �e tu ve m�st� m�me p�r zlod�j�, co okr�daj� boh��e.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//M�stsk� str� ned�vno obr�tila p��stavn� �tvr� vzh�ru nohama, ale nena�li v�bec nic.
};


instance DIA_CARL_PICKPOCKET(C_INFO)
{
	npc = vlk_461_carl;
	nr = 900;
	condition = dia_carl_pickpocket_condition;
	information = dia_carl_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_carl_pickpocket_condition()
{
	return c_beklauen(34,40);
};

func void dia_carl_pickpocket_info()
{
	Info_ClearChoices(dia_carl_pickpocket);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_BACK,dia_carl_pickpocket_back);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_PICKPOCKET,dia_carl_pickpocket_doit);
};

func void dia_carl_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_carl_pickpocket);
};

func void dia_carl_pickpocket_back()
{
	Info_ClearChoices(dia_carl_pickpocket);
};


instance DIA_CARL_HALLO(C_INFO)
{
	npc = vlk_461_carl;
	nr = 2;
	condition = dia_carl_hallo_condition;
	information = dia_carl_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carl_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_carl_hallo_info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Co d�l� v t�hle uboh� �pinav� d��e? Co tady hled�?
	Info_ClearChoices(dia_carl_hallo);
	Info_AddChoice(dia_carl_hallo,"Zabloudil jsem.",dia_carl_hallo_verlaufen);
	Info_AddChoice(dia_carl_hallo,"Jen se d�v�m kolem.",dia_carl_hallo_umsehen);
};

func void dia_carl_hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Zabloudil jsem.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Tak si d�vej pozor, aby t� nikdo neokradl.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};

func void dia_carl_hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Jen se d�v�m kolem.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Aha. Tak si d�vej bacha, a� t� nikdo nechyt�, jak tu �enich�.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};


instance DIA_CARL_DIEBE(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_diebe_condition;
	information = dia_carl_diebe_info;
	permanent = FALSE;
	description = "Co v� o t�ch zlod�j�ch?";
};


func int dia_carl_diebe_condition()
{
	return TRUE;
};

func void dia_carl_diebe_info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Co v� o t�ch zlod�j�ch?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Nic. Ale v�ichni m욝an� jsou vyd�en� a za��naj� b�t ned�v��iv� - obzvl᚝ v��i cizinc�m.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Nenech se nachytat v ciz�m dom� - na to se tady nikdo nekouk� moc vl�dn�.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Ano, mus� se um�t br�nit zlod�j�m. Nejl�p na to j�t s po��dn� tlust�m klackem.
};


instance DIA_CARL_LERNEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_lernen_condition;
	information = dia_carl_lernen_info;
	permanent = FALSE;
	description = "M��u se u tebe n��emu p�iu�it?";
};


func int dia_carl_lernen_condition()
{
	return TRUE;
};

func void dia_carl_lernen_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//M��u se u tebe n��emu p�iu�it?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//No, vyrobil jsem n�kolik klik a n�co h�eb�k� a opravuju kovov� sou��stky.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Ale o kov�n� zbran� toho nev�m tolik, abych t� mohl u�it.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//Jestli se chce� n�co nau�it, zajdi za Haradem. On ur�it� v�, jak se vyr�b�j� zbran�!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Ale jestli si chce� trochu vypracovat svaly, tak s t�m ti m��u pomoct.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"S pomoc� kov��e Carla z p��stavn� �tvrti se mohu st�t siln�j��m.");
};


instance DIA_CARL_WIEVIEL(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_wieviel_condition;
	information = dia_carl_wieviel_info;
	permanent = FALSE;
	description = "Kolik si nech�v� platit za v�cvik?";
};


func int dia_carl_wieviel_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen))
	{
		return TRUE;
	};
};

func void dia_carl_wieviel_info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Kolik si nech�v� platit za v�cvik?
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//Sly�el jsem, �es pracoval pro Eddu. Budu t� cvi�it zadarmo.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 zlat�ch a j� ti dopom��u k v�t�� s�le.
	};
};


instance DIA_CARL_BEZAHLEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_bezahlen_condition;
	information = dia_carl_bezahlen_info;
	permanent = TRUE;
	description = "R�d bych se u tebe nechal vycvi�it (zaplatit 50 zla��k�).";
};


func int dia_carl_bezahlen_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_wieviel) && (CARL_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_carl_bezahlen_info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Cht�l bych s tebou cvi�it.
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//Sly�el jsem, �es pracoval pro Eddu. Budu t� cvi�it zadarmo.
		CARL_TEACHSTR = TRUE;
	}
	else if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Dob�e, m��eme za��t hned, jak bude� p�ipraven.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Dej mi zlato a pak t� budu tr�novat.
	};
};


instance DIA_CARL_TEACH(C_INFO)
{
	npc = vlk_461_carl;
	nr = 7;
	condition = dia_carl_teach_condition;
	information = dia_carl_teach_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t siln�j��m.";
};


func int dia_carl_teach_condition()
{
	if(CARL_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_carl_teach_info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Cht�l bych se st�t siln�j��m.
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_back()
{
	Info_ClearChoices(dia_carl_teach);
};

func void dia_carl_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

