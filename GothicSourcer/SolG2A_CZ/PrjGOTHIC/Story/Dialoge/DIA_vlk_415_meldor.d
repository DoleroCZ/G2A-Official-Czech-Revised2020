
instance DIA_MELDOR_EXIT(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 999;
	condition = dia_meldor_exit_condition;
	information = dia_meldor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_meldor_exit_condition()
{
	return TRUE;
};

func void dia_meldor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELDOR_HALLO(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_hallo_condition;
	information = dia_meldor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_hallo_info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//Co chceš?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//Chtìl jsem se tu trochu porozhlédnout.
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//A kam pøesnì máš namíøeno?
};


instance DIA_MELDOR_INTERESSANTES(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_interessantes_condition;
	information = dia_meldor_interessantes_info;
	permanent = FALSE;
	description = "Co je tu zajímavého k vidìní?";
};


func int dia_meldor_interessantes_condition()
{
	return TRUE;
};

func void dia_meldor_interessantes_info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//Co je tu zajímavého k vidìní?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//Najdeš tu nevìstinec i hospodu. Hostinskı se jmenuje Kardif a jestli hledáš nìjaké informace, pak je on ten pravı, s kım si máš promluvit.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//Mimochodem, nepotøebuješ peníze?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, hospodskı z pøístavní krèmy, prodává krom koøalky i informace.");
};


instance DIA_MELDOR_LEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 3;
	condition = dia_meldor_lehmar_condition;
	information = dia_meldor_lehmar_info;
	permanent = FALSE;
	description = "Ty se jich chceš zbavit?";
};


func int dia_meldor_lehmar_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_interessantes))
	{
		return TRUE;
	};
};

func void dia_meldor_lehmar_info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//Ty se jich chceš zbavit?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(znudìnì) Ne, ale pøímo naproti pøes ulici sídlí Lehmar - lichváø.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//Urèitì ti pár zlaákù pùjèí, jen bì dál.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MELDOR_ARBEITEST(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 4;
	condition = dia_meldor_arbeitest_condition;
	information = dia_meldor_arbeitest_info;
	permanent = FALSE;
	description = "Ty pro Lehmara pracuješ?";
};


func int dia_meldor_arbeitest_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_arbeitest_info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//Ty pro Lehmara pracuješ?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//Bystrej hoch.
};


instance DIA_MELDOR_INSOV(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_insov_condition;
	information = dia_meldor_insov_info;
	permanent = FALSE;
	description = "Vlastnì jsem mìl namíøeno do horní ètvrti.";
};


func int dia_meldor_insov_condition()
{
	return TRUE;
};

func void dia_meldor_insov_info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//Vlastnì jsem mìl namíøeno do horní ètvrti.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(sarkasticky) No jasnì. A já si zase chtìl najmout loï, aby mì zavezla pøímo na královskı dvùr k audienci.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//Od té doby, co sem pøišli paladinové, nemají takoví jako ty nebo já v horní ètvrti co pohledávat.
};


instance DIA_MELDOR_CITIZEN(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 6;
	condition = dia_meldor_citizen_condition;
	information = dia_meldor_citizen_info;
	permanent = FALSE;
	description = "Ty jsi obèanem tohoto mìsta?";
};


func int dia_meldor_citizen_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_insov))
	{
		return TRUE;
	};
};

func void dia_meldor_citizen_info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//Ty jsi obèanem tohoto mìsta?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//Pokud tím myslíš, jestli tu bydlím, pak ano. Ale stejnì mì do horní ètvrti nepustí.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//Tam se mohou dostat jenom nabubøelí hejskové nebo obchodníci a øemeslníci z dolní èásti.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//Lidé z pøístavu v Khorinisu nemají velkou moc. Dokonce tu nemáme ani stálou hlídku domobrany.
};


instance DIA_MELDOR_SMOKE(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_smoke_condition;
	information = dia_meldor_smoke_info;
	permanent = FALSE;
	description = "Nevíš, kde bych sehnal nìjaké kuøivo?";
};


func int dia_meldor_smoke_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_meldor_smoke_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Nevíš, kde bych sehnal nìjaké kuøivo?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(odhaduje) Ne, nemám ponìtí.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//Hmm, bıt tebou, zkusím štìstí u Èervené lucerny.
	};
};


var int meldor_dgnews;

instance DIA_MELDOR_PERM(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 7;
	condition = dia_meldor_perm_condition;
	information = dia_meldor_perm_info;
	permanent = TRUE;
	description = "Stalo se v poslední dobì nìco zajímavého?";
};


func int dia_meldor_perm_condition()
{
	return TRUE;
};

func void dia_meldor_perm_info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//Stalo se v poslední dobì nìco zajímavého?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//Pøed nedávnem obrátily stráe celou pøístavní ètvr vzhùru nohama.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//Hledaly nìjakou odcizenou vìc - poslední dobou se tu krádee dost rozrostly, zvláštì v lepších ètvrtích.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//Oèividnì se snaí ty chudáky z pøístavu obvinit úplnì ze všeho.
	}
	else if((ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE) && (MELDOR_DGNEWS == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//Doneslo se mi, e dole ve stokách byl rozprášen nìjakı zlodìjskı klan. Všichni kradáci byli zabiti.
		MELDOR_DGNEWS = TRUE;
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//V Hornickém údolí jsou prı draci. Zajímalo by mì, jestli odsud teï paladinové vyrazí a pustí se s nimi do boje.
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//Podle toho, co se øíká, tak u jsou všichni draci mrtví. Nìkdo je vymetl eleznım koštìtem.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Ne.
	};
};


instance DIA_MELDOR_VONLEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_vonlehmar_condition;
	information = dia_meldor_vonlehmar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_vonlehmar_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_vonlehmar_info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//Hej, poèkej...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//Nesu ti zprávu od Lehmara.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_MELDOR_PICKPOCKET(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 900;
	condition = dia_meldor_pickpocket_condition;
	information = dia_meldor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_meldor_pickpocket_condition()
{
	return c_beklauen(34,55);
};

func void dia_meldor_pickpocket_info()
{
	Info_ClearChoices(dia_meldor_pickpocket);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_BACK,dia_meldor_pickpocket_back);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_PICKPOCKET,dia_meldor_pickpocket_doit);
};

func void dia_meldor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_meldor_pickpocket);
};

func void dia_meldor_pickpocket_back()
{
	Info_ClearChoices(dia_meldor_pickpocket);
};

