
instance DIA_FELLAN_EXIT(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 999;
	condition = dia_fellan_exit_condition;
	information = dia_fellan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fellan_exit_condition()
{
	return TRUE;
};

func void dia_fellan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_PICKPOCKET(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 900;
	condition = dia_fellan_pickpocket_condition;
	information = dia_fellan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fellan_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_fellan_pickpocket_info()
{
	Info_ClearChoices(dia_fellan_pickpocket);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_BACK,dia_fellan_pickpocket_back);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_PICKPOCKET,dia_fellan_pickpocket_doit);
};

func void dia_fellan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fellan_pickpocket);
};

func void dia_fellan_pickpocket_back()
{
	Info_ClearChoices(dia_fellan_pickpocket);
};


instance DIA_FELLAN_NEWS(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 1;
	condition = dia_fellan_news_condition;
	information = dia_fellan_news_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_fellan_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_news_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Dobr�, tak jsi m� dostal. To byl ale hrdinsk� kousek.
		if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Tak p�estane� u� do toho bu�it, nebo ti m�m znovu nandat?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Ne, u� mi neubli�uj. P�estanu. Ale jestli to tady kolem v�echno spadne, tak je to jen tvoje chyba!
			FELLANGESCHLAGEN = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co se d�je? Chce� dal�� r�nu p�st�?
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Co se� to za bl�zna? Bojuj, nebojuj, �ekni - co vlastn� chce�?
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_FELLAN_HALLO(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 2;
	condition = dia_fellan_hallo_condition;
	information = dia_fellan_hallo_info;
	permanent = FALSE;
	description = "Pro� tady do toho ml�t�?";
};


func int dia_fellan_hallo_condition()
{
	if(FELLANGESCHLAGEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_fellan_hallo_info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Pro� tady do toho ml�t�?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//N�kolik posledn�ch dn� se zoufale sna��m zamezit tomu, aby mi zat�kalo do domu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krov se mi drob� poka�d�, kdy� p�ijde po��dn� lij�k. Tak�e se mi v�echno rozsejp� pod rukama!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_STOP(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 3;
	condition = dia_fellan_stop_condition;
	information = dia_fellan_stop_info;
	permanent = FALSE;
	description = "M��e� p�estat s t�m bouch�n�m?";
};


func int dia_fellan_stop_condition()
{
	if(MIS_ATTACKFELLAN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fellan_stop_info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//M��e� p�estat s t�m bouch�n�m?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Ne, mus�m to dod�lat.
	Info_ClearChoices(dia_fellan_stop);
	Info_AddChoice(dia_fellan_stop,"P�esta� s t�m, nebo ti zp�er�im v�echny kosti v t�le.",dia_fellan_stop_bones);
	Info_AddChoice(dia_fellan_stop,"D�m ti 10 zlat�ch, kdy� s t�m r�musem p�estane�.",dia_fellan_stop_gold);
	Info_AddChoice(dia_fellan_stop,"Prost� p�esta� bu�it, fajn?",dia_fellan_stop_just);
};

func void dia_fellan_stop_bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//P�esta� s t�m, nebo ti zp�er�im v�echny kosti v t�le.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapome� na to, nebo ti do tv� palice svym kladivem vtlu�u alespo� trochu rozumu.
	AI_StopProcessInfos(self);
};

func void dia_fellan_stop_gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//D�m ti 10 zlat�ch, kdy� s t�m r�musem p�estane�.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hej... To je od tebe opravdu mil�. Ale jako s tim zlatem, m��e�...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... fajn, ty v�, co se s tim d� d�lat.
};

func void dia_fellan_stop_just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Prost� p�esta� bu�it, fajn?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Prost� m� zkus neposlouchat, fajn?
};


instance DIA_FELLAN_KLAR(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 5;
	condition = dia_fellan_klar_condition;
	information = dia_fellan_klar_info;
	permanent = TRUE;
	description = "Hal��� - je ti dob�e?";
};


func int dia_fellan_klar_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_hallo))
	{
		return TRUE;
	};
};

func void dia_fellan_klar_info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hal��� - je ti dob�e?
	if(FELLANGESCHLAGEN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fajn, jestli se mi poda�� tohle v�echno v�as opravit.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Ta st�echa je ��m d�l t�m hor��. A� p��t� zapr��, bude mi voda t�ct rovnou na hlavu. A za to v�echno m��e� ty!
	};
	AI_StopProcessInfos(self);
};

