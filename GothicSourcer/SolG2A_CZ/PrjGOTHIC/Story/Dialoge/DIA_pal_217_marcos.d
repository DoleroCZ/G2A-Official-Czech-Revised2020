
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//ST�T - jm�nem Innose! Jsem Marcos, kr�lovsk� paladin. �ekni, co chce�, a mluv pravdu!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Innos�v Vyvolen� mluv� v�dycky pravdu.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Odpus�, ctihodn� m�gu. Neuv�domil jsem si, s k�m mluv�m.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//V po��dku, nic se nestalo.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Pokud se m��u zeptat - co t� sem p�iv�d�?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Uklidni se - jsem ve slu�b�ch lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Jsi jeden z voj�k�. Na jak� rozkaz tu jsi?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Klid, pracujeme pro stejn�ho hlavouna - lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Odkdy lord Hagen naj�m� �old�ky? Mluv! Co tady pohled�v�?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "Mus�m p�in�st lordu Hagenovi d�kaz, �e draci existuj�.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Mus�m p�in�st lordu Hagenovi d�kaz, �e draci existuj�.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Pak bys nem�l ztr�cet �as a zbyte�n� riskovat �ivot.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Mysl�, �e tady najde� dra�� �upinu, kterou bys mu mohl p�in�st?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Zkus se dostat do hradu a promluvit si s velitelem Garondem.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Mus� se dozv�d�t, �e t� pos�l� lord Hagen! Postar� se o to, aby ses nevr�til s pr�zdnou.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "P�ich�z�m od Garonda...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//P�ich�z�m od Garonda. Pot�ebuje v�d�t, kolik rudy je p�ipraveno k p�evozu.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Vy�i� Garondovi, �e jsem musel opustit d�l, proto�e �toky sk�et� za�aly b�t p��li� nebezpe�n�.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Sna�il jsem se dostat ke hradu je�t� s n�kolika dal��mi, ale p�e�il jsem nakonec jen j�.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Ulo�il jsem rudu do bezpe��. Jsou to �TY�I truhly. B� za Garondem a nahlas mu to.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//�ekni mu, �e budu rudu st�e�it vlastn�m �ivotem. Ale netu��m, za jak dlouho m� tu sk�eti vyp�traj�.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Vy�i� mu, aby mi poslal n�koho na pomoc.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Vy��d�m mu to.
	b_logentry(TOPIC_SCOUTMINE,"V mal�m �dol��ku st�e�� paladin Marcos �TY�I bedny rudy.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"Marcos ��d�, aby mu Garond poslal n�jakou pomoc.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Jak to vypad�?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Pot�ebuju po��dn� lok l��iv�ho lektvaru!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Vydr��m - ale douf�m, �e mi Garond brzy po�le posily.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//D�kuji ti za pomoc. Innos n�m d� s�lu, abychom st�li pevn� jako sk�la.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Budu st�t pevn�, proto�e je Innos se mnou!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

