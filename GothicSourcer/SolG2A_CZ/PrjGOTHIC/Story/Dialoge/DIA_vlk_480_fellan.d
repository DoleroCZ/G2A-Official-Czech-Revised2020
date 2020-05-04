
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
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Dobrá, tak jsi mì dostal. To byl ale hrdinský kousek.
		if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Tak pøestaneš už do toho bušit, nebo ti mám znovu nandat?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Ne, už mi neubližuj. Pøestanu. Ale jestli to tady kolem všechno spadne, tak je to jen tvoje chyba!
			FELLANGESCHLAGEN = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co se dìje? Chceš další ránu pìstí?
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Co seš to za blázna? Bojuj, nebojuj, øekni - co vlastnì chceš?
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
	description = "Proè tady do toho mlátíš?";
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
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Proè tady do toho mlátíš?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Nìkolik posledních dní se zoufale snažím zamezit tomu, aby mi zatékalo do domu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krov se mi drobí pokaždé, když pøijde poøádný liják. Takže se mi všechno rozsejpá pod rukama!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_STOP(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 3;
	condition = dia_fellan_stop_condition;
	information = dia_fellan_stop_info;
	permanent = FALSE;
	description = "Mùžeš pøestat s tím boucháním?";
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
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Mùžeš pøestat s tím boucháním?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Ne, musím to dodìlat.
	Info_ClearChoices(dia_fellan_stop);
	Info_AddChoice(dia_fellan_stop,"Pøestaò s tím, nebo ti zpøerážim všechny kosti v tìle.",dia_fellan_stop_bones);
	Info_AddChoice(dia_fellan_stop,"Dám ti 10 zlatých, když s tím rámusem pøestaneš.",dia_fellan_stop_gold);
	Info_AddChoice(dia_fellan_stop,"Prostì pøestaò bušit, fajn?",dia_fellan_stop_just);
};

func void dia_fellan_stop_bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Pøestaò s tím, nebo ti zpøerážim všechny kosti v tìle.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomeò na to, nebo ti do tvý palice svym kladivem vtluèu alespoò trochu rozumu.
	AI_StopProcessInfos(self);
};

func void dia_fellan_stop_gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dám ti 10 zlatých, když s tím rámusem pøestaneš.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hej... To je od tebe opravdu milé. Ale jako s tim zlatem, mùžeš...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... fajn, ty víš, co se s tim dá dìlat.
};

func void dia_fellan_stop_just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Prostì pøestaò bušit, fajn?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Prostì mì zkus neposlouchat, fajn?
};


instance DIA_FELLAN_KLAR(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 5;
	condition = dia_fellan_klar_condition;
	information = dia_fellan_klar_info;
	permanent = TRUE;
	description = "Halóóó - je ti dobøe?";
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
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Halóóó - je ti dobøe?
	if(FELLANGESCHLAGEN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fajn, jestli se mi podaøí tohle všechno vèas opravit.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Ta støecha je èím dál tím horší. Až pøíštì zaprší, bude mi voda téct rovnou na hlavu. A za to všechno mùžeš ty!
	};
	AI_StopProcessInfos(self);
};

