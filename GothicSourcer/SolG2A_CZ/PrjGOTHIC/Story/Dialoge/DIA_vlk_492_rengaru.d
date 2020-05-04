
instance DIA_RENGARU_EXIT(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 999;
	condition = dia_rengaru_exit_condition;
	information = dia_rengaru_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rengaru_exit_condition()
{
	return TRUE;
};

func void dia_rengaru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_PICKPOCKET(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 900;
	condition = dia_rengaru_pickpocket_condition;
	information = dia_rengaru_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rengaru_pickpocket_condition()
{
	return c_beklauen(20,5);
};

func void dia_rengaru_pickpocket_info()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_BACK,dia_rengaru_pickpocket_back);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_PICKPOCKET,dia_rengaru_pickpocket_doit);
};

func void dia_rengaru_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rengaru_pickpocket);
};

func void dia_rengaru_pickpocket_back()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
};


instance DIA_RENGARU_HAUAB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hauab_condition;
	information = dia_rengaru_hauab_info;
	permanent = TRUE;
	description = "Co tady dìláš?";
};


func int dia_rengaru_hauab_condition()
{
	if((JORA_DIEB != LOG_RUNNING) && (Npc_KnowsInfo(other,dia_rengaru_gotyou) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rengaru_hauab_info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Nejsem si jist, jestli ti do toho nìco je. Ztra se!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Jora øíkal, e máš jeho peníze.";
};


func int dia_rengaru_hallodieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_rengaru_hallodieb_info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora øíkal, e máš jeho peníze.
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Sakra! Padám pryè!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_RENGARU_GOTYOU(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 3;
	condition = dia_rengaru_gotyou_condition;
	information = dia_rengaru_gotyou_info;
	permanent = FALSE;
	description = "Mám tì!";
};


func int dia_rengaru_gotyou_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		return TRUE;
	};
};

func void dia_rengaru_gotyou_info()
{
	b_giveplayerxp(XP_RENGARUGOTTHIEF);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Mám tì!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Co ode mì chceš?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okradl jsi Joru za denního svìtla a on si toho ani nevšiml.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Tak jsem ti pøišel øíct, e jsi zavšivenej zlodìj a e...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"Zaslouím si nìjakı podíl na koøisti.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"udìláš líp, kdy mu to hned vrátíš.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"A teï mi øekni, kdo jsi.",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//Udìláš líp, kdy mu to hned vrátíš.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Tady jsou prachy, chlape! Ale teï mì nech jít, u to nikdy neudìlám.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//Já u to zlato nemám.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Ale proè ti to vlastnì øíkám? Ty u jsi mì okradl!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//Zaslouím si nìjakı podíl na koøisti.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Vzal sis všechno, co jsem mìl u sebe, u kdy jsi mì srazil na zem! Tak mì nech jít!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Dobrá, vypadá to, e nemám navybranou. Dám ti pùlku.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"Ne - dáš mi to všechno!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"Fajn, tak mi dej pùlku.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Ne - dáš mi to všechno!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Take ty mì chceš okrást. Fajn, tak si to zlato vezmi. A teï mì nech na pokoji.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Dal bych ti to zlato, ale u ho nemám.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Fajn, tak mi dej pùlku.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Tady je tvoje polovina! A teï mì nech jít!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Chtìl bych ti dát polovinu toho zlata, ale já u ho nemám.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//A teï mi øekni, kdo jsi.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jsem jen ubohej mizera, co se snaí vyjít s penìzi, jak se dá.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Co ještì mùu udìlat? Ve mìstì o práci nezavadíš.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//Dobrá, to vím. Ušetøi mì tìch náøkù!
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "Mìl bych tì pøedhodit domobranì.";
};


func int dia_rengaru_inknast_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_inknast_info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Mìl bych tì pøedhodit domobranì.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Co ještì chceš? Nemám co ztratit! Nech mì jít, chlape!
	Info_AddChoice(dia_rengaru_inknast,"Proè bych to jako mìl dìlat?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"Postarám se, abys skonèil za møíema.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Ztra se! A u tady ten svuj ksicht víckrát neukazuj!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Ztra se! A u tady ten svùj ksicht víckrát neukazuj!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nebudeš toho litovat! Díky, chlape!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Postarám se, abys skonèil za møíema.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(unavenì) U nechci ádné potíe. Jestli máš dojem, e je to to, co bys mìl udìlat, tak si poslu.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(varovnì) Dávej si bacha - mí kamarádi nebudou odvázaní z toho, co tady vyvádíš.
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Proè bych to jako mìl dìlat?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//Ve mìstì se vdycky hodí znát ty pravé lidi - a stát na jejich stranì.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mohl bych za tebe ztratit dobré slovo. Víc ani nechci, ani nemùu udìlat. Zbytek je na tobì.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "Tak co? V poøádku?";
};


func int dia_rengaru_lastinfokap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_inknast))
	{
		return TRUE;
	};
};

func void dia_rengaru_lastinfokap1_info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Tak co? V poøádku?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Jen si poslu, ještì si ze mì utahuj. Nakonec stejnì slízneš to, co teï provádíš mnì. Slibuju!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Co ještì chceš? Nic dalšího u jsem neukradl, vánì, chlape!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(Pøedvést zlodìjskı signál.)";
};


func int dia_rengaru_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (RENGARU_INKNAST == FALSE) && Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jsi jedním z nás.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Tak teï ti nìco øeknu. Jestli chceš nìkomu odlehèit o pár zlaákù, tak si dávej zvláš pozor na kupce!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Jsou tak nepøíjemnì všímaví, co se tıèe jejich vlastních vìcí. Ale mùu ti dát tip.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Pokus se zvolenou vìc jednou rukou otoèit a tou druhou mezitím odvádìj jejich pozornost.
	b_raiseattribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

