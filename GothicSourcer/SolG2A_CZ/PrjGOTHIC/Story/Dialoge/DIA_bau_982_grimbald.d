
instance DIA_GRIMBALD_EXIT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 999;
	condition = dia_grimbald_exit_condition;
	information = dia_grimbald_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grimbald_exit_condition()
{
	return TRUE;
};

func void dia_grimbald_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMBALD_HALLO(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_hallo_condition;
	information = dia_grimbald_hallo_info;
	description = "Èekáš na nìco?";
};


func int dia_grimbald_hallo_condition()
{
	return TRUE;
};


var int grimbald_pissoff;

func void dia_grimbald_hallo_info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Èekáš na nìco?
	if(Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Jsem na lovu. To je snad jasné.
		GRIMBALD_PISSOFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Už ne. Teï jsi tady, ne?
		Info_ClearChoices(dia_grimbald_hallo);
		Info_AddChoice(dia_grimbald_hallo,"Èeká na mì práce.",dia_grimbald_hallo_nein);
		Info_AddChoice(dia_grimbald_hallo,"Co tím myslíš?",dia_grimbald_hallo_was);
		Info_AddChoice(dia_grimbald_hallo,"Proè já?",dia_grimbald_hallo_ich);
	};
};

func void dia_grimbald_hallo_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Proè já?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Vypadáš silnì. Chlápek jako ty se mi mùže hodit.
};

func void dia_grimbald_hallo_was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Chtìl bych ulovit ty chòapavce támhle nahoøe, ale mám dojem, že je jich na mì samotného moc.
	Info_AddChoice(dia_grimbald_hallo,"Se mnou nepoèítej..",dia_grimbald_hallo_was_neinnein);
	Info_AddChoice(dia_grimbald_hallo,"Dobrá. Pomùžu ti. Jdi první.",dia_grimbald_hallo_was_ja);
};

func void dia_grimbald_hallo_was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Se mnou nepoèítej.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Tak to vypadni, babo.
	GRIMBALD_PISSOFF = TRUE;
	Info_ClearChoices(dia_grimbald_hallo);
};

func void dia_grimbald_hallo_was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Dobrá. Pomùžu ti. Jdi první.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Jasná vìc. Ale moc se nepøibližuj k tomu èernému trolovi tam nahoøe. Jinak tì rozseká na kousky, jasný?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//Èeho se bojíš, že se držíš tak zpátky.
	b_startotherroutine(self,"Lov");
	AI_StopProcessInfos(self);
};

func void dia_grimbald_hallo_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Èeká na mì práce.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Nevykládej nesmysly. Co by mohlo být tady uprostøed divoèiny tak dùležitého?
};


instance DIA_GRIMBALD_JAGD(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_jagd_condition;
	information = dia_grimbald_jagd_info;
	permanent = TRUE;
	description = "Mùžeš mì nauèit nìco o lovu?";
};


func int dia_grimbald_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_hallo) && (GRIMBALD_TEACHANIMALTROPHY == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_jagd_info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Mùžeš mì nauèit nìco o lovu?
	if((Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3)) || (GRIMBALD_PISSOFF == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Mmh. Dobrá. Nebyl jsi mi sice zrovna moc platný, ale nebudu na tebe tak tvrdý.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Jasnì. Ale bude tì to nìco stát.
		b_say_gold(self,other,200);
		Info_ClearChoices(dia_grimbald_jagd);
		Info_AddChoice(dia_grimbald_jagd,"Budu o tom pøemýšlet.",dia_grimbald_jagd_zuviel);
		Info_AddChoice(dia_grimbald_jagd,"Dobrá.",dia_grimbald_jagd_ja);
	};
};

func void dia_grimbald_jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Dobrá. Tady jsou peníze
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Fajn. Tak mi øekni, až se budeš chtít nìco nauèit.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Dej mi ty prachy a pak tì mùžu nìco nauèit.
	};
	Info_ClearChoices(dia_grimbald_jagd);
};

func void dia_grimbald_jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Budu o tom pøemýšlet.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Když to øíkáš.
	Info_ClearChoices(dia_grimbald_jagd);
};


instance DIA_GRIMBALD_TEACHHUNTING(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 12;
	condition = dia_grimbald_teachhunting_condition;
	information = dia_grimbald_teachhunting_info;
	permanent = TRUE;
	description = "Rád bych se nauèil nìjakým loveckým technikám.";
};


func int dia_grimbald_teachhunting_condition()
{
	if(GRIMBALD_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_grimbald_teachhunting_onetime;

func void dia_grimbald_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Rád bych se nauèil nìjakým loveckým technikám.
	if(DIA_GRIMBALD_TEACHHUNTING_ONETIME == FALSE)
	{
		b_startotherroutine(self,"JagdOver");
		DIA_GRIMBALD_TEACHHUNTING_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Co pøesnì bys chtìl vìdìt?
		Info_AddChoice(dia_grimbald_teachhunting,DIALOG_BACK,dia_grimbald_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Žihadlo krvavé mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_grimbald_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Køídla krvavé mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_grimbald_teachhunting_bfwing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Vyjmutí drápù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_grimbald_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Vyjmutí kusadel",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grimbald_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Oddìlení èervích krunýøù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_grimbald_teachhunting_crawlerplate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Už znáš vše, co bych tì mohl nauèit.
	};
};

func void dia_grimbald_teachhunting_back()
{
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Opravdu není problém dostat z krvavé mouchy její žihadlo. Staèí jen najít jeho koøen a vrazit tam nùž.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Buï mùžeš køídla z krvavé mouchy dostat tak, že je prostì utrhneš, nebo je oddìlíš ostrým nožem.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Je nìkolik zpùsobù, jak získat drápy. Na nìkterá zvíøata budeš potøebovat hodnì síly, u jiných ti staèí jen odøíznout je nožem.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//Dùlní èervi a polní škùdci mají silná kusadla, která mùžeš z jejich hlavy dostat silným trhnutím...
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Krunýø dùlních èervù pøiléhá k jejich tìlu velmi tìsnì, ale velkým ostrým pøedmìtem se dá snadno oddìlit.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};


instance DIA_GRIMBALD_NOVCHASE(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_novchase_condition;
	information = dia_grimbald_novchase_info;
	description = "Nevidìl jsi tudy procházet nìjakého novice?";
};


func int dia_grimbald_novchase_condition()
{
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_grimbald_novchase_info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Nevidìl jsi tudy procházet nìjakého novice?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Dneska tudy prošlo hodnì podivných osob - vèetnì tìch dvou vtipálkù od toho kamenného oblouku.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//Taky s nima byl nìjaký novic od mágù ohnì.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_TROLLTOT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_trolltot_condition;
	information = dia_grimbald_trolltot_info;
	important = TRUE;
};


func int dia_grimbald_trolltot_condition()
{
	if(Npc_IsDead(troll_black))
	{
		return TRUE;
	};
};

func void dia_grimbald_trolltot_info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Èerný trol je mrtev. Skvìlá práce. Nikdy jsem si nemyslel, že ho lze zabít. Na tohle nikdy nezapomenu.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_PICKPOCKET(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 900;
	condition = dia_grimbald_pickpocket_condition;
	information = dia_grimbald_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_grimbald_pickpocket_condition()
{
	return c_beklauen(85,250);
};

func void dia_grimbald_pickpocket_info()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_BACK,dia_grimbald_pickpocket_back);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_PICKPOCKET,dia_grimbald_pickpocket_doit);
};

func void dia_grimbald_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimbald_pickpocket);
};

func void dia_grimbald_pickpocket_back()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
};

