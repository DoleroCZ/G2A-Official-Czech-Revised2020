
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
	description = "Znova v práci?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Znova v práci?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Nyní dostanu tady z toho dolu poslední kousek zlata.
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//Co bys rád?
};


instance DIA_ADDON_FINN_HACKE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 2;
	condition = dia_addon_finn_hacke_condition;
	information = dia_addon_finn_hacke_info;
	permanent = FALSE;
	description = "Kde tady seženu krumpáè?";
};


func int dia_addon_finn_hacke_condition()
{
	return TRUE;
};

func void dia_addon_finn_hacke_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Kde tady seženu krumpáè?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//Bìž za Hunem - je to kováø. Ale to že máš krumpáè ještì neznamená, že se dostaneš do dolu.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Jestli chceš vstoupit, musíš prvnì promluvit s Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Ani nechoï za Thorusem - nepustí tì, dokud nebudeš mít èervený kámen.
};


instance DIA_ADDON_FINN_ESTEBAN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 3;
	condition = dia_addon_finn_esteban_condition;
	information = dia_addon_finn_esteban_info;
	permanent = FALSE;
	description = "Co si myslíš o Estebanovi?";
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
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(pomalu) Hmm ... je tady boss ... on ... myslím, že je v klidu.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(váhavì) Posílá vždy nejlepší muže do dolu. Myslím - jako ty, co ví nìco o dolování.
};


instance DIA_ADDON_FINN_PROFI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 4;
	condition = dia_addon_finn_profi_condition;
	information = dia_addon_finn_profi_info;
	permanent = FALSE;
	description = "A ty víš nìco o dolování?";
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
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//A ty víš nìco o dolování?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Jsem nejlepší!
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Dobrá, šéfe. Chceš vìdìt, kdo nejlépe pracuje v dole? Tak tady je ...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//A další vìc: Øeknu ti Kopáèovo tajemství.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Obèas je lepší dát do toho i poøádnou ránu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jestli už dlouho doluješ a nevypadlo ti nic, tak bouchni krumpáèem šikmo pøes skálu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//S trochou štìstí nìco tímto zpùsobem vydìláš.
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
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Je tu ještì nìkolik vìcí, které bys mìl vìdìt: zlato není magická ruda - to je obrovský rozdíl.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Myslím - která žena má øetìz z rudy na krku???
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Kopej zhora dolù. Tak ti to pùjde nejlépe.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//Nìkteøí kopáèi to dìlají jinak - ale je to mnohem tìžší.
	b_upgrade_hero_hackchance(10);
};


instance DIA_ADDON_FINN_EIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 7;
	condition = dia_addon_finn_ein_condition;
	information = dia_addon_finn_ein_info;
	permanent = TRUE;
	description = "Mùžeš ohodnotit mou techniku dolování?";
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
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Mùžeš ohodnotit mou techniku dolování?
	if(FINN_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Jistì. Dìlám to už 35 let. Není tu nic, co bych nepoznal!
		FINN_EINMAL = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//O tobì bych øekl, že jsi ...
	if(HERO_HACKCHANCE < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//tìžký zaèáteèník.
	}
	else if(HERO_HACKCHANCE < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//slušný kopáè.
	}
	else if(HERO_HACKCHANCE < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//velice dobrý kopáè.
	}
	else if(HERO_HACKCHANCE < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//rozený kopáè.
	}
	else if(HERO_HACKCHANCE < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//krutì dobrý kopáè.
	}
	else if(HERO_HACKCHANCE < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//Pán kopáè.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//Zlatokopec-guru.
		if(FINN_GRATULATION == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Nyní jsi tak dobrý jako já. Blahopøeji paráku!
			b_giveplayerxp(XP_AMBIENT * 2);
			Snd_Play("LevelUP");
			FINN_GRATULATION = TRUE;
		};
	};
	concattext = ConcatStrings("Tìžba zlata: ",IntToString(HERO_HACKCHANCE));
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
	description = "O pokusu o atentát na Estebana ...";
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
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(nedùvìøivì) Fakt?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Nic o tom nevíš?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Proè to chceš vìdìt?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chci mluvit s tím chlápkem ...",dia_addon_finn_attentat_wannatalk);
	Info_AddChoice(dia_addon_finn_attentat,"Esteban chce vidìt jeho smrt!",dia_addon_finn_attentat_fortheboss);
};

func void b_addon_finn_tellall()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(vysvìtluje) Když se mìl stát atentát, šel jsem za Hunem - kováøem.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nicménì tam nikdo nebyl.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//VŽDYCKY tam je. DOCELA podezøelé, když se mì ptáš.
	FINN_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Finn mi øekl, že Huno v dobì pokusu o atentát nebyl v práci. Zdá se mu to podezøelé.");
};

func void dia_addon_finn_attentat_fortheboss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce vidìt jeho smrt!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Oh! Ty pracuješ pro šéfa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Pak ti øeknu, co vím.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_wannatalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chci mluvit s tím chlápkem ...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(nedùvìøivì) A? Co od nìj chceš?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"To není tvá starost!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Mám pro nìj zajímavé informace.",dia_addon_finn_attentat_haveinfos);
	Info_AddChoice(dia_addon_finn_attentat,"Chci odstranit Estebana a hledám spojence!",dia_addon_finn_attentat_killesteban);
};

func void dia_addon_finn_attentat_killesteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chci odstranit Estebana a hledám spojence!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nechci s tím nic mít!
	FINN_PETZT = TRUE;
	Info_ClearChoices(dia_addon_finn_attentat);
	AI_StopProcessInfos(self);
};

func void dia_addon_finn_attentat_haveinfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//Mám pro nìj zajímavé informace.
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Ty s ním nejsi spojenec, nebo snad ano?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chci odstranit Estebana a hledám spojence!",dia_addon_finn_attentat_killesteban);
	Info_AddChoice(dia_addon_finn_attentat,"To není tvá starost!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Nikdy!",dia_addon_finn_attentat_nono);
};

func void dia_addon_finn_attentat_nono()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(uctivì) Dobøe! Øeknu ti, co vím.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_forgetit()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To není tvá starost!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//Jak? Pak o tom nic nevím.
	Info_ClearChoices(dia_addon_finn_attentat);
};


instance DIA_ADDON_FINN_AGAIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_again_condition;
	information = dia_addon_finn_again_info;
	permanent = TRUE;
	description = "Ještì k tomu atentátu ...";
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
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//Ještì k tomu atentátu ...
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//Øekl jsem ti vše, co vím.
		Info_ClearChoices(dia_addon_finn_again);
		Info_AddChoice(dia_addon_finn_again,"Vpoøádku ... (ZPÌT)",dia_addon_finn_again_exit);
		Info_AddChoice(dia_addon_finn_again,"Zopakuj mi to!",dia_addon_finn_again_nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//S tím nechci nic mít!
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_finn_again_exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(uctivì) Vpoøádku ...
	Info_ClearChoices(dia_addon_finn_again);
};

func void dia_addon_finn_again_nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Zopakuj mi to!
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_again);
};

