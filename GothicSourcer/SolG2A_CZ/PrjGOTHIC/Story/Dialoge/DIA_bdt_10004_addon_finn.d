
instance DIA_ADDON_FINN_EXIT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 999;
	condition = dia_addon_finn_exit_condition;
	information = dia_addon_finn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_finn_exit_condition()
{
	return TRUE;
};

func void dia_addon_finn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FINN_PICKPOCKET(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 900;
	condition = dia_addon_finn_pickpocket_condition;
	information = dia_addon_finn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_finn_pickpocket_condition()
{
	return c_beklauen(35,50);
};

func void dia_addon_finn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_BACK,dia_addon_finn_pickpocket_back);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_PICKPOCKET,dia_addon_finn_pickpocket_doit);
};

func void dia_addon_finn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_finn_pickpocket);
};

func void dia_addon_finn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
};


instance DIA_ADDON_FINN_HACKER(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_hacker_condition;
	information = dia_addon_finn_hacker_info;
	permanent = TRUE;
	description = "Znova v pr�ci?";
};


func int dia_addon_finn_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_finn_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Znova v pr�ci?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Nyn� dostanu tady z toho dolu posledn� kousek zlata.
};


instance DIA_ADDON_FINN_HI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 1;
	condition = dia_addon_finn_hi_condition;
	information = dia_addon_finn_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_finn_hi_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_finn_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Zdar!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//Co bys r�d?
};


instance DIA_ADDON_FINN_HACKE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 2;
	condition = dia_addon_finn_hacke_condition;
	information = dia_addon_finn_hacke_info;
	permanent = FALSE;
	description = "Kde tady se�enu krump��?";
};


func int dia_addon_finn_hacke_condition()
{
	return TRUE;
};

func void dia_addon_finn_hacke_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Kde tady se�enu krump��?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//B� za Hunem - je to kov��. Ale to �e m� krump�� je�t� neznamen�, �e se dostane� do dolu.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Jestli chce� vstoupit, mus� prvn� promluvit s Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Ani necho� za Thorusem - nepust� t�, dokud nebude� m�t �erven� k�men.
};


instance DIA_ADDON_FINN_ESTEBAN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 3;
	condition = dia_addon_finn_esteban_condition;
	information = dia_addon_finn_esteban_info;
	permanent = FALSE;
	description = "Co si mysl� o Estebanovi?";
};


func int dia_addon_finn_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_hacke))
	{
		return TRUE;
	};
};

func void dia_addon_finn_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co si mysl� o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(pomalu) Hmm ... je tady boss ... on ... mysl�m, �e je v klidu.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(v�hav�) Pos�l� v�dy nejlep�� mu�e do dolu. Mysl�m - jako ty, co v� n�co o dolov�n�.
};


instance DIA_ADDON_FINN_PROFI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 4;
	condition = dia_addon_finn_profi_condition;
	information = dia_addon_finn_profi_info;
	permanent = FALSE;
	description = "A ty v� n�co o dolov�n�?";
};


func int dia_addon_finn_profi_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_profi_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//A ty v� n�co o dolov�n�?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Jsem nejlep��!
};


instance DIA_ADDON_BDT_10004_FINN_MINE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 5;
	condition = dia_addon_finn_mine_condition;
	information = dia_addon_finn_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_finn_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_finn_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Dobr�, ��fe. Chce� v�d�t, kdo nejl�pe pracuje v dole? Tak tady je ...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//A dal�� v�c: �eknu ti Kop��ovo tajemstv�.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Ob�as je lep�� d�t do toho i po��dnou r�nu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jestli u� dlouho doluje� a nevypadlo ti nic, tak bouchni krump��em �ikmo p�es sk�lu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//S trochou �t�st� n�co t�mto zp�sobem vyd�l�.
	b_upgrade_hero_hackchance(10);
	KNOWS_TRUEMMERSCHLAG = TRUE;
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_FINN_GOLD(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 6;
	condition = dia_addon_finn_gold_condition;
	information = dia_addon_finn_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_finn_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};

func void dia_addon_finn_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Je tu je�t� n�kolik v�c�, kter� bys m�l v�d�t: zlato nen� magick� ruda - to je obrovsk� rozd�l.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Mysl�m - kter� �ena m� �et�z z rudy na krku???
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Kopej zhora dol�. Tak ti to p�jde nejl�pe.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//N�kte�� kop��i to d�laj� jinak - ale je to mnohem t잚�.
	b_upgrade_hero_hackchance(10);
};


instance DIA_ADDON_FINN_EIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 7;
	condition = dia_addon_finn_ein_condition;
	information = dia_addon_finn_ein_info;
	permanent = TRUE;
	description = "M��e� ohodnotit mou techniku dolov�n�?";
};


func int dia_addon_finn_ein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};


var int finn_einmal;
var int finn_gratulation;

func void dia_addon_finn_ein_info()
{
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//M��e� ohodnotit mou techniku dolov�n�?
	if(FINN_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Jist�. D�l�m to u� 35 let. Nen� tu nic, co bych nepoznal!
		FINN_EINMAL = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//O tob� bych �ekl, �e jsi ...
	if(HERO_HACKCHANCE < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//t�k� za��te�n�k.
	}
	else if(HERO_HACKCHANCE < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//slu�n� kop��.
	}
	else if(HERO_HACKCHANCE < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//velice dobr� kop��.
	}
	else if(HERO_HACKCHANCE < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//rozen� kop��.
	}
	else if(HERO_HACKCHANCE < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//krut� dobr� kop��.
	}
	else if(HERO_HACKCHANCE < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//P�n kop��.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//Zlatokopec-guru.
		if(FINN_GRATULATION == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Nyn� jsi tak dobr� jako j�. Blahop�eji par��ku!
			b_giveplayerxp(XP_AMBIENT * 2);
			Snd_Play("LevelUP");
			FINN_GRATULATION = TRUE;
		};
	};
	concattext = ConcatStrings("T�ba zlata: ",IntToString(HERO_HACKCHANCE));
	concattext = ConcatStrings(concattext," procent");
	PrintScreen(concattext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_ADDON_FINN_ATTENTAT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 8;
	condition = dia_addon_finn_attentat_condition;
	information = dia_addon_finn_attentat_info;
	permanent = FALSE;
	description = "O pokusu o atent�t na Estebana ...";
};


func int dia_addon_finn_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_finn_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(ned�v��iv�) Fakt?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Nic o tom nev�?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Pro� to chce� v�d�t?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chci mluvit s t�m chl�pkem ...",dia_addon_finn_attentat_wannatalk);
	Info_AddChoice(dia_addon_finn_attentat,"Esteban chce vid�t jeho smrt!",dia_addon_finn_attentat_fortheboss);
};

func void b_addon_finn_tellall()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(vysv�tluje) Kdy� se m�l st�t atent�t, �el jsem za Hunem - kov��em.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nicm�n� tam nikdo nebyl.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//V�DYCKY tam je. DOCELA podez�el�, kdy� se m� pt�.
	FINN_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Finn mi �ekl, �e Huno v dob� pokusu o atent�t nebyl v pr�ci. Zd� se mu to podez�el�.");
};

func void dia_addon_finn_attentat_fortheboss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce vid�t jeho smrt!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Oh! Ty pracuje� pro ��fa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Pak ti �eknu, co v�m.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_wannatalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chci mluvit s t�m chl�pkem ...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(ned�v��iv�) A? Co od n�j chce�?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"To nen� tv� starost!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"M�m pro n�j zaj�mav� informace.",dia_addon_finn_attentat_haveinfos);
	Info_AddChoice(dia_addon_finn_attentat,"Chci odstranit Estebana a hled�m spojence!",dia_addon_finn_attentat_killesteban);
};

func void dia_addon_finn_attentat_killesteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chci odstranit Estebana a hled�m spojence!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nechci s t�m nic m�t!
	FINN_PETZT = TRUE;
	Info_ClearChoices(dia_addon_finn_attentat);
	AI_StopProcessInfos(self);
};

func void dia_addon_finn_attentat_haveinfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//M�m pro n�j zaj�mav� informace.
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Ty s n�m nejsi spojenec, nebo snad ano?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chci odstranit Estebana a hled�m spojence!",dia_addon_finn_attentat_killesteban);
	Info_AddChoice(dia_addon_finn_attentat,"To nen� tv� starost!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Nikdy!",dia_addon_finn_attentat_nono);
};

func void dia_addon_finn_attentat_nono()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(uctiv�) Dob�e! �eknu ti, co v�m.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_forgetit()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To nen� tv� starost!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//Jak? Pak o tom nic nev�m.
	Info_ClearChoices(dia_addon_finn_attentat);
};


instance DIA_ADDON_FINN_AGAIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_again_condition;
	information = dia_addon_finn_again_info;
	permanent = TRUE;
	description = "Je�t� k tomu atent�tu ...";
};


func int dia_addon_finn_again_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_again_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//Je�t� k tomu atent�tu ...
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//�ekl jsem ti v�e, co v�m.
		Info_ClearChoices(dia_addon_finn_again);
		Info_AddChoice(dia_addon_finn_again,"Vpo��dku ... (ZP�T)",dia_addon_finn_again_exit);
		Info_AddChoice(dia_addon_finn_again,"Zopakuj mi to!",dia_addon_finn_again_nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//S t�m nechci nic m�t!
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_finn_again_exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(uctiv�) Vpo��dku ...
	Info_ClearChoices(dia_addon_finn_again);
};

func void dia_addon_finn_again_nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Zopakuj mi to!
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_again);
};

