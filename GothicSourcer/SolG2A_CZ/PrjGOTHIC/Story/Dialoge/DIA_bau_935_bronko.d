
instance DIA_BRONKO_EXIT(C_INFO)
{
	npc = bau_935_bronko;
	nr = 999;
	condition = dia_bronko_exit_condition;
	information = dia_bronko_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bronko_exit_condition()
{
	return TRUE;
};

func void dia_bronko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRONKO_HALLO(C_INFO)
{
	npc = bau_935_bronko;
	nr = 1;
	condition = dia_bronko_hallo_condition;
	information = dia_bronko_hallo_info;
	important = TRUE;
};


func int dia_bronko_hallo_condition()
{
	return TRUE;
};

func void dia_bronko_hallo_info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(otcovsky) Tak kampak, co?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//Ty jsi tady ��f?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//N�jakou ti vraz�m, ty lot�e.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//Jestli se chce� poflakovat po m�m pozemku, zapla� mi 5 zlat�ch, jinak si koleduje� o p�kn� n��ez!
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Zapome� na to. Nic ode m� nedostane�.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"Kdy� jinak ned� - tady jsou pen�ze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Tv�j pozemek? Ty jsi tady farm��em?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Tv�j pozemek? Ty jsi tady farm��em?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//To se m��e� vsadit. Pro� bych po tob� jinak cht�l m�tn�?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//Je mi jedno, jestli se na m� bude� vypt�vat ostatn�ch. He he!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//Kdy� jinak ned� - tady jsou pen�ze.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(�kodolib�) D�ky. A hezk� den.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//Nem� ani 5 zlat�ch. Sna�� se m� oblafnout, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//Zapome� na to. Nic ode m� nedostane�.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//Tak to je mi l�to. Trochu ti p�ismahnu k��i.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//Vy ho�i od m�stsk� str�e nem�te dost pen�z, co?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//Je mi jedno, jestli jsi m�g. Mus� zaplatit, jasn�?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Kdy� jinak ned� - tady jsou pen�ze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Tak to teda zkus.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//Tak to teda zkus.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//Fajn, v tom p��pad�...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BRONKO_KEINBAUER(C_INFO)
{
	npc = bau_935_bronko;
	nr = 2;
	condition = dia_bronko_keinbauer_condition;
	information = dia_bronko_keinbauer_info;
	permanent = TRUE;
	description = "Ty, farm��? Nenech se vysm�t. Ve skute�nosti nejsi nikdo.";
};


var int dia_bronko_keinbauer_noperm;

func int dia_bronko_keinbauer_condition()
{
	if(((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING) || (BABERA_BRONKOKEINBAUER == TRUE)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && (DIA_BRONKO_KEINBAUER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bronko_keinbauer_info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//Ty, farm��? Nenech se vysm�t. Ve skute�nosti nejsi nikdo.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Cooo? Chce�, abych ti zmaloval ksicht?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(Vyhro�ovat Broncovi, �e p�ivede� �oldn��e.)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"Sekob je zdej�� sedl�k a ty nejsi nic jin�ho ne� druho�ad� podvodn��ek.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"Dobr�, tak se teda pod�v�me, co m�. ",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"Nevad�!",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//Dobr�, tak se teda pod�v�me, co m�.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//Doufal jsem, �e to �ekne�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//Zdej�� farm�� je Sekob a ty nejsi nic ne� mizern� podvodn�k, co se sna�� lidem tahat pen�ze z kapes.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//To ��k� kdo?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//To ��k�m j�. Sekob chce, aby ses vr�til k pr�ci m�sto toho, aby ses tady fl�kal.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//Tak co? Co ud�l� te�?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//Nevad�!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Zmiz!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//Fajn, tak to bych m�l Onarovi ��ct, �e je tady n�jakej u�van�nej farm��, co odm�t� platit n�jem.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Ehm. Po�kej chvilku. Onar na m� po�le v�echny svoje �old�ky.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//A co?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//Dobr�, dobr�. D�m ti, co chce�, ale netahej do toho �old�ky, fajn?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Tady, d�m ti v�echno svoje zlato.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//A vr�t�m se na pole. V�echno, jen ne �old�ky.
	AI_StopProcessInfos(self);
	DIA_BRONKO_KEINBAUER_NOPERM = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BRONKO_FLEISSIG(C_INFO)
{
	npc = bau_935_bronko;
	nr = 3;
	condition = dia_bronko_fleissig_condition;
	information = dia_bronko_fleissig_info;
	permanent = TRUE;
	description = "(Vysm�vat se Broncovi)";
};


func int dia_bronko_fleissig_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_bronko_fleissig_info()
{
	if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//Tak? Piln� jako v�eli�ka, co?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//Tak? Po��d je�t� m� tak nevym�chanou hubu?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//Ty jsi �old�k, �e jo? M�l jsem to v�d�t.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(vystra�en�) Nevykec� to �old�k�m, �e ne?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Nemla� m�, pros�m.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//Vr�t�m se ke sv� pr�ci, fajn?
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRONKO_PICKPOCKET(C_INFO)
{
	npc = bau_935_bronko;
	nr = 900;
	condition = dia_bronko_pickpocket_condition;
	information = dia_bronko_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bronko_pickpocket_condition()
{
	return c_beklauen(54,80);
};

func void dia_bronko_pickpocket_info()
{
	Info_ClearChoices(dia_bronko_pickpocket);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_BACK,dia_bronko_pickpocket_back);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_PICKPOCKET,dia_bronko_pickpocket_doit);
};

func void dia_bronko_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bronko_pickpocket);
};

func void dia_bronko_pickpocket_back()
{
	Info_ClearChoices(dia_bronko_pickpocket);
};

