
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
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//Ty jsi tady öÈf?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//NÏjakou ti vrazÌm, ty lot¯e.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//Jestli se chceö poflakovat po mÈm pozemku, zaplaù mi 5 zlat˝ch, jinak si koledujeö o pÏkn˝ n·¯ez!
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"ZapomeÚ na to. Nic ode mÏ nedostaneö.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"Kdyû jinak ned·ö - tady jsou penÌze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Tv˘j pozemek? Ty jsi tady farm·¯em?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Tv˘j pozemek? Ty jsi tady farm·¯em?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//To se m˘ûeö vsadit. ProË bych po tobÏ jinak chtÏl m˝tn˝?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//Je mi jedno, jestli se na mÏ budeö vypt·vat ostatnÌch. He he!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//Kdyû jinak ned·ö - tady jsou penÌze.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(ökodolibÏ) DÌky. A hezk˝ den.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//Nem·ö ani 5 zlat˝ch. SnaûÌö se mÏ oblafnout, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//ZapomeÚ na to. Nic ode mÏ nedostaneö.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//Tak to je mi lÌto. Trochu ti p¯ismahnu k˘ûi.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//Vy hoöi od mÏstskÈ str·ûe nem·te dost penÏz, co?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//Je mi jedno, jestli jsi m·g. MusÌö zaplatit, jasn˝?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Kdyû jinak ned·ö - tady jsou penÌze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Tak to teda zkus.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//Tak to teda zkus.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//Fajn, v tom p¯ÌpadÏ...
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
	description = "Ty, farm·¯? Nenech se vysm·t. Ve skuteËnosti nejsi nikdo.";
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
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//Ty, farm·¯? Nenech se vysm·t. Ve skuteËnosti nejsi nikdo.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Cooo? Chceö, abych ti zmaloval ksicht?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(Vyhroûovat Broncovi, ûe p¯ivedeö ûoldnÈ¯e.)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"Sekob je zdejöÌ sedl·k a ty nejsi nic jinÈho neû druho¯ad˝ podvodnÌËek.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"Dobr·, tak se teda podÌv·me, co m·ö. ",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"NevadÌ!",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//Dobr·, tak se teda podÌv·me, co m·ö.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//Doufal jsem, ûe to ¯ekneö.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//ZdejöÌ farm·¯ je Sekob a ty nejsi nic neû mizern˝ podvodnÌk, co se snaûÌ lidem tahat penÌze z kapes.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//To ¯Ìk· kdo?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//To ¯Ìk·m j·. Sekob chce, aby ses vr·til k pr·ci mÌsto toho, aby ses tady fl·kal.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//Tak co? Co udÏl·ö teÔ?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//NevadÌ!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Zmiz!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//Fajn, tak to bych mÏl Onarovi ¯Ìct, ûe je tady nÏjakej uûvanÏnej farm·¯, co odmÌt· platit n·jem.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Ehm. PoËkej chvilku. Onar na mÏ poöle vöechny svoje ûold·ky.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//A co?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//Dobr·, dobr·. D·m ti, co chceö, ale netahej do toho ûold·ky, fajn?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Tady, d·m ti vöechno svoje zlato.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//A vr·tÌm se na pole. Vöechno, jen ne ûold·ky.
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
	description = "(VysmÌvat se Broncovi)";
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
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//Tak? Piln˝ jako vËeliËka, co?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//Tak? Po¯·d jeötÏ m·ö tak nevym·chanou hubu?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//Ty jsi ûold·k, ûe jo? MÏl jsem to vÏdÏt.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(vystraöenÏ) Nevykec·ö to ûold·k˘m, ûe ne?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Nemlaù mÏ, prosÌm.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//Vr·tÌm se ke svÈ pr·ci, fajn?
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

