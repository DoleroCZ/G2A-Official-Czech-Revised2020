
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
	description = "Co tady d�l�?";
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
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Nejsem si jist, jestli ti do toho n�co je. Ztra� se!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Jora ��kal, �e m� jeho pen�ze.";
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
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora ��kal, �e m� jeho pen�ze.
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Sakra! Pad�m pry�!
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
	description = "M�m t�!";
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
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//M�m t�!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Co ode m� chce�?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okradl jsi Joru za denn�ho sv�tla a on si toho ani nev�iml.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Tak jsem ti p�i�el ��ct, �e jsi zav�ivenej zlod�j a �e...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"Zaslou��m si n�jak� pod�l na ko�isti.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"ud�l� l�p, kdy� mu to hned vr�t�.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"A te� mi �ekni, kdo jsi.",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//Ud�l� l�p, kdy� mu to hned vr�t�.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Tady jsou prachy, chlape! Ale te� m� nech j�t, u� to nikdy neud�l�m.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//J� u� to zlato nem�m.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Ale pro� ti to vlastn� ��k�m? Ty u� jsi m� okradl!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//Zaslou��m si n�jak� pod�l na ko�isti.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Vzal sis v�echno, co jsem m�l u sebe, u� kdy� jsi m� srazil na zem! Tak m� nech j�t!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Dobr�, vypad� to, �e nem�m navybranou. D�m ti p�lku.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"Ne - d� mi to v�echno!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"Fajn, tak mi dej p�lku.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Ne - d� mi to v�echno!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Tak�e ty m� chce� okr�st. Fajn, tak si to zlato vezmi. A te� m� nech na pokoji.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Dal bych ti to zlato, ale u� ho nem�m.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Fajn, tak mi dej p�lku.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Tady je tvoje polovina! A te� m� nech j�t!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Cht�l bych ti d�t polovinu toho zlata, ale j� u� ho nem�m.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//A te� mi �ekni, kdo jsi.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jsem jen ubohej mizera, co se sna�� vyj�t s pen�zi, jak se d�.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Co je�t� m��u ud�lat? Ve m�st� o pr�ci nezavad�.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//Dobr�, to v�m. U�et�i m� t�ch n��k�!
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "M�l bych t� p�edhodit domobran�.";
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
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//M�l bych t� p�edhodit domobran�.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Co je�t� chce�? Nem�m co ztratit! Nech m� j�t, chlape!
	Info_AddChoice(dia_rengaru_inknast,"Pro� bych to jako m�l d�lat?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"Postar�m se, abys skon�il za m��ema.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Ztra� se! A u� tady ten svuj ksicht v�ckr�t neukazuj!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Ztra� se! A u� tady ten sv�j ksicht v�ckr�t neukazuj!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nebude� toho litovat! D�ky, chlape!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Postar�m se, abys skon�il za m��ema.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(unaven�) U� nechci ��dn� pot�e. Jestli m� dojem, �e je to to, co bys m�l ud�lat, tak si poslu�.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(varovn�) D�vej si bacha - m� kamar�di nebudou odv�zan� z toho, co tady vyv�d�.
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Pro� bych to jako m�l d�lat?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//Ve m�st� se v�dycky hod� zn�t ty prav� lidi - a st�t na jejich stran�.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mohl bych za tebe ztratit dobr� slovo. V�c ani nechci, ani nem��u ud�lat. Zbytek je na tob�.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "Tak co? V po��dku?";
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
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Tak co? V po��dku?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Jen si poslu�, je�t� si ze m� utahuj. Nakonec stejn� sl�zne� to, co te� prov�d� mn�. Slibuju!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Co je�t� chce�? Nic dal��ho u� jsem neukradl, v�n�, chlape!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
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
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jsi jedn�m z n�s.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Tak te� ti n�co �eknu. Jestli chce� n�komu odleh�it o p�r zla��k�, tak si d�vej zvl᚝ pozor na kupce!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Jsou tak nep��jemn� v��mav�, co se t��e jejich vlastn�ch v�c�. Ale m��u ti d�t tip.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Pokus se zvolenou v�c jednou rukou oto�it a tou druhou mezit�m odv�d�j jejich pozornost.
	b_raiseattribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

