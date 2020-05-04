
instance DIA_ADDON_EMILIO_EXIT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 999;
	condition = dia_addon_emilio_exit_condition;
	information = dia_addon_emilio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_emilio_exit_condition()
{
	return TRUE;
};

func void dia_addon_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EMILIO_PICKPOCKET(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 900;
	condition = dia_addon_emilio_pickpocket_condition;
	information = dia_addon_emilio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_emilio_pickpocket_condition()
{
	return c_beklauen(76,112);
};

func void dia_addon_emilio_pickpocket_info()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_BACK,dia_addon_emilio_pickpocket_back);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_PICKPOCKET,dia_addon_emilio_pickpocket_doit);
};

func void dia_addon_emilio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};

func void dia_addon_emilio_pickpocket_back()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};


instance DIA_ADDON_BDT_10015_EMILIO_HI(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_hi_condition;
	information = dia_addon_emilio_hi_info;
	permanent = FALSE;
	description = "Vypadáš jako kopáè.";
};


func int dia_addon_emilio_hi_condition()
{
	return TRUE;
};

func void dia_addon_emilio_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Vypadáš jako kopáè.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//Já JSEM kopáè. Když jsem byl naposled v dole, namakal jsem se jako kùò.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BDT_10015_EMILIO_GOLD(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 2;
	condition = dia_addon_emilio_gold_condition;
	information = dia_addon_emilio_gold_info;
	permanent = FALSE;
	description = "Co se dìje se zlatem z dolu?";
};


func int dia_addon_emilio_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gold_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co se dìje se zlatem z dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus ho hlídá a posílá dál.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Každý dostává pouze èást zlata - tak aby lovci a stráže neodešli s prázdnýma rukama.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//Øekl bych, že je to v pohodì. Od té doby, co máme tohle pravidlo, je tu ménì vražd a kopáèi poøád dostávají více než ti, co se tu jen poflakují.
};


instance DIA_ADDON_BDT_10015_EMILIO_STEIN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 3;
	condition = dia_addon_emilio_stein_condition;
	information = dia_addon_emilio_stein_info;
	permanent = FALSE;
	description = "A ty èervené kameny?";
};


func int dia_addon_emilio_stein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//A ty èervené kameny?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To vymyslel Thorus s Estebanem.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus øídí rozdìlování zlata a Esteban organizuje dìlníky v dole.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Samožrejmì nechce bìhat za Thorusem pokaždé, když pošle nìkoho do dolu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Takhle mu dá jeden z tìch èervených kamenù a Thorus ho pustí. Je to jako vstupenka.
};


var int emilio_switch;

instance DIA_ADDON_EMILIO_ATTENTAT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 4;
	condition = dia_addon_emilio_attentat_condition;
	information = dia_addon_emilio_attentat_info;
	permanent = TRUE;
	description = "Co víš o tom atentátu?";
};


func int dia_addon_emilio_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return FALSE;
	}
	else if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void dia_addon_emilio_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co víš o tom atentátu?
	if(EMILIO_SWITCH == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(úzkustlivì) Hej, já s tím nic nemám!
		EMILIO_SWITCH = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(úzkostlivì) PRANIC!!
		EMILIO_SWITCH = 0;
	};
};


instance DIA_ADDON_BDT_10015_EMILIO_SENYAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_senyan_condition;
	information = dia_addon_emilio_senyan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_emilio_senyan_condition()
{
	if(Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_senyan_info()
{
	if(SENYAN_CALLED == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(tázavì) Øekni mi PROÈ Senyan volal: 'Podívejme se kohopak to tu máme'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(suše) Nevyrovnané úèty.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Tys zabil Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//A jako co?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(uspìchanì) Bez problému.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Na druhou stranu. (sarkasticky) Je to kus práce pro Estebana.
	SENYAN_CONTRA = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio není na Estebanovì stranì.");
};


instance DIA_ADDON_EMILIO_JETZT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 5;
	condition = dia_addon_emilio_jetzt_condition;
	information = dia_addon_emilio_jetzt_info;
	permanent = FALSE;
	description = "Proè nejsi v dole?";
};


func int dia_addon_emilio_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Proè teï nejsi v dole?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//Byl jsem v dole dost dlouho. Nyní si potøebuji pár dnù odpoèinout.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//Tedy dokud nedostanu další èervený kámen.
};


instance DIA_ADDON_EMILIO_VONEMILIO(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 6;
	condition = dia_addon_emilio_vonemilio_condition;
	information = dia_addon_emilio_vonemilio_info;
	permanent = FALSE;
	description = "Lennar mi neco o tobì øekl ...";
};


func int dia_addon_emilio_vonemilio_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt) && Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_vonemilio_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar mi nìco o tobì øekl ...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten chlap je idiot! To musíš uznat.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//Øekl žes nebyl v dole od toho pokusu o atentát.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(vystrašenì) Já ... nic nevím!
	if(!Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Pracuješ s Senyanem, nebo ne?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Oba jste se spojili s Estebanem. Slyšel jsem, co jste si povídali.
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Dosud jsem s Estebanem nemìl nic spoleènýho. Proè bych mìl vìøit jeho lidem?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Nech mì o samotì!
		AI_StopProcessInfos(self);
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio si myslí, že Lennar je idiot.");
};


instance DIA_ADDON_EMILIO_HILFMIR(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 7;
	condition = dia_addon_emilio_hilfmir_condition;
	information = dia_addon_emilio_hilfmir_info;
	permanent = FALSE;
	description = "Pomoz mi najít lidi, co mají nìco spoleèného s atentátem na Estebana !";
};


func int dia_addon_emilio_hilfmir_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hilfmir_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pomoz mi najít toho, kdo chtìl spáchat ten pokus o atentát!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Ne! Nechci s tím nic mít!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Jestli idiot jako Lennar zjistí nìco o tvém podivném chování, nebude to dlouho trvat a Esteban to zjistí taky.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(pøekvapenì) Já ... doprdele! Øeknu pouze jméno. Nic víc.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//Poslouchám.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno ... bìž za Hunem. Mìl by nìco vìdìt.
	EMILIO_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio nakonec øekl jedno jméno - Huno.");
};


instance DIA_ADDON_EMILIO_GEGENESTEBAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 8;
	condition = dia_addon_emilio_gegenesteban_condition;
	information = dia_addon_emilio_gegenesteban_info;
	permanent = FALSE;
	description = "Co máš proti Estebanovi?";
};


func int dia_addon_emilio_gegenesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gegenesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Co máš proti Estebanovi?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//To prase myslí jen na peníze.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Každý den je nìkdo sežrán dùlními èervy.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nechce poslat do dolu bojovníky.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A proè? Protože chlapi jsou souèástí "Ravenovy stráže" a on se bojí jim nìco pøikázat.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Namísto toho nás radìji nechá zatøepat baèkorama!
};


instance DIA_ADDON_BDT_10015_EMILIO_MINE(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_mine_condition;
	information = dia_addon_emilio_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_emilio_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Tak, nyní jsi tu šéf ty. Dobrá, pak to udìlám posvém.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_EMILIO_HACKER(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_hacker_condition;
	information = dia_addon_emilio_hacker_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_addon_emilio_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Pracuju tvrdì. Dobøe, nejdùležitìjší vìc je, že se nestanu žrádlem pro èervy.
};

