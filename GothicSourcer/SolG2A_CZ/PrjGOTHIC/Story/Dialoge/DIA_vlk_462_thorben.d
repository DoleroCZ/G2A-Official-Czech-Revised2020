
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Zavraždil jsi moji Grittu. To ti nikdy neodpustím. Bìž mi z oèí, vrahu!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Á! Nová tváø. Ty nejsi z Khorinisu, co?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Tohle není ta správná doba pro poutníky. Všude samí banditi, žádná práce a teï si ještì zaèali vyskakovat rolníci.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Co tì sem pøivádí?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "Hledám práci.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Hledám práci.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Víš nìco o truhlaøinì?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Jediný, co dokážu ze døeva udìlat, je oheò.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//A co zámky?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Noooo...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Je mi líto, ale pokud o mém øemesle nic nevíš, nemùžu tì potøebovat.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//A nemám peníze na to, abych si platil uèedníka.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Thorben mne nepøijme do uèení.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "Co kdybych chtìl zaèít jako uèedník u jednoho z ostatních mistrù?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//Co kdybych chtìl zaèít jako uèedník u jednoho z ostatních mistrù?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Dobrá, dám ti své doporuèení.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Ale nejdøív bys mìl radìji získat požehnání od bohù.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Øekni, jsi zbožný muž?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"No, když myslíš, že bych se mìl modlit pravidelnì ...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Ano. Nejpokornìjší služebník, mistøe Thorbne.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Tak to jdi za Vatrasem, Adanovým knìzem, a nech se od nìj požehnat.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//On už ti øekne, kde najít Innosovy knìze. Taky od nìj mùžeš dostat požehnání.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Jakmile získáš požehnání, máš mùj souhlas.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Thorben se za mì pøimluví teprve tehdy, až si vyprosím požehnání od Adanova a Innosova knìze.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Ano. Nejpokornìjší služebník, mistøe Thorbene.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//No, když myslíš, že bych se mìl modlit pravidelnì...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Já si to nemyslím. Vím to!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Èlovìk, co svùj obchod nezasypává modlitbami, nikdy nezíská mùj souhlas.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Pros bohy za shovívavost nad tvými høíchy.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "Tak jak s tím doporuèením, mistøe?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Tak jak s tím doporuèením, mistøe?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Požehnal ti Vatras?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Ano.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//A získal jsi také požehnání Innose?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Ano, získal.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//V tom pøípadì máš i mé požehnání. Nezáleží na tom, jakou cestu sis vybral - buï hrdý na svou práci, chlapèe!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Budu-li k nìkomu chtít vstoupit do uèení, Thorben se za mì pøimluví.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Ne. Ještì ne.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Znáš moje podmínky. Svým záležitostem se mùžeš vìnovat jen s požehnáním bohù.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Ještì ne...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//V tom pøípadì nevím, proè se mì znovu ptáš. Znáš moje podmínky.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "Tak ty se vyznáš v zámcích?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Tak ty se vyznáš v zámcích?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Co by to bylo za poøádnou truhlu bez dobrého zámku?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Vyrábím si své vlastní zámky. Takhle si mùžu být pøinejmenším jistý, že jsem neudìlal bytelnou truhlu jen tak pro nic za nic.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Odbytý zámek se dá snadno zlomit. A tady v Khorinisu se všude kolem potuluje spousta zlodìjù. Zvláštì poslední dobou!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "Mám tady Lehmarovu úèetní knihu.";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//Mám tady Lehmarovu úèetní knihu.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(podezíravì) Jak ses k tomu dostal?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Spíš by tì mìlo zajímat, že je v ní tvé jméno.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Dej to sem!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//A co mi za to dáš?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//Nemám peníze nazbyt a nemùžu ti dát nic jiného než mé srdeèné podìkování.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "Mùžeš mì nauèit, jak páèit zámky?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Mùžeš mì nauèit, jak páèit zámky?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Kdyby nebylo tebe, budu Lehmarovi platit po celý zbytek svého života.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Nauèím tì, co budeš chtít.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//Pøinesl jsi mi 100 zlatých. To od tebe bylo velmi milé.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//Pøivádí mì to do rozpakù, ale musím tì požádat ještì o jednu laskavost.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Jelikož v dohledné dobì nemùžu Lehmarovi svùj dluh splatit, chystá se na mì poslat ty své gorily.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Dej mi ještì dalších 100 zlatých a já tì zaènu uèit.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Možná pozdìji...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrá. Tady je 100 zlatých.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Zaplatil jsi Grittin dluh u Mattea. Vypadáš jako správný chlap. Nauèím tì, co budeš chtít.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Nicménì, nemùžu to dìlat zadarmo. Ještì poøád mám fùru dluhù a potøebuju peníze.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Kolik?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 zlatých.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Možná pozdìji ...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrá. Tady je 200 zlatých.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmm... nevím, jestli se ti dá vìøit, nebo ne.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Podle toho, co vím, mùžeš klidnì být jedním z tìch darmošlapù, co pøišli do mìsta jen proto, aby vyprázdnili truhlice bohatých lidí.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Nebudu tì uèit nic, dokud se nepøesvìdèím, že jsi dobrý èlovìk.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Dobrá. Tady je 200 zlatých.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Tyhle peníze by mi mìly pomoct. Mùžeme zaèít hned, jak budeš pøipraven.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//Ještì poøád ti do 200 zlatých pár mincí chybí. Ty peníze potøebuju.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Dobrá. Tady je 100 zlatých.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//V tom pøípadì mùžeme zaèít hned, jak budeš pøipraven.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Hej, ještì poøád ti do 100 zlatých chybí pár mincí.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Možná pozdìji.
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nauè mì páèit zámky!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Nauè mì páèit zámky!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Potøebuješ akorát nìjaký šperhák. Pokud jím budeš v zámku opatrnì otáèet doprava a doleva, mùžeš mechanismus otevøít.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Ale pokud otoèíš pøíliš rychle nebo moc silnì ve špatném smìru, šperhák se zlomí.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Èím budeš obratnìjší, tím ménì budeš potøebovat šperhákù. To je všechno, opravdu.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "Mùžeš mi prodat nìjaké šperháky?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Mùžeš mi prodat nìjaké šperháky?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Pokud mi ještì nìjaké zbyly...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//No tak dobrá. Ale dokud nevíš, jak s nimi zacházet, tak ti nebudou k nièemu.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Tesaø Thorben prodává šperháky.");
};


instance DIA_ADDON_THORBEN_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_addon_thorben_missingpeople_condition;
	information = dia_addon_thorben_missingpeople_info;
	description = "A mìl si nìkdy uènì?";
};


func int dia_addon_thorben_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ELVRICH_GOESBACK2THORBEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//A mìl si nìkdy uènì?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Ano, neni to dávno.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Jmenoval se Elvrich. Je to mùj synovec.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Ale jednoho dne prostì nepøišel. A to jsem byl s jeho prací docela spokojený.
	MIS_THORBEN_BRINGELVRICHBACK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich, uèeò tesaøe Thorbena, zmizel.");
	Info_ClearChoices(dia_addon_thorben_missingpeople);
	Info_AddChoice(dia_addon_thorben_missingpeople,DIALOG_BACK,dia_addon_thorben_missingpeople_back);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Oznámil jsi to domobranì?",dia_addon_thorben_missingpeople_mil);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Jak je to dlouho, co jsi ho vidìl naposledy?",dia_addon_thorben_missingpeople_wann);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Kde je Elvrich teï?",dia_addon_thorben_missingpeople_where);
};

func void dia_addon_thorben_missingpeople_back()
{
	Info_ClearChoices(dia_addon_thorben_missingpeople);
};

func void dia_addon_thorben_missingpeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Jak je to dlouho, co jsi ho vidìl naposledy?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Musí to být tak 2 týdny.
};

func void dia_addon_thorben_missingpeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Kde je Elvrich teï?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//Jak to mám vìdìt? Stále se poflakoval okolo špinavého bordelu v pøístavní ètvrti.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Vùbec by mì nepøekvapilo, kdyby tam trávil celé dny s nìjakou dìvkou.
};

func void dia_addon_thorben_missingpeople_mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Oznámil jsi to domobranì?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Ano, jistì. Øíklali, že ho chytí a postarají se, aby se jeho líná prdel vrátila do práce. Mrzelo mì to udìlat.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//Ah dobøe, mùže mít kterékoliv požadavky. Døíve nebo pozdìji uvidí, že nemùže dìlat nic v Khorinisu bez nìjaké èestné práce.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(cynicky) Opravdu.
};


instance DIA_ADDON_THORBEN_ELVRICHISBACK(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichisback_condition;
	information = dia_addon_thorben_elvrichisback_info;
	description = "Nyní, když se Elvrich vrátíl, pro tebe mùže znovu pracovat.";
};


func int dia_addon_thorben_elvrichisback_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (Npc_IsDead(elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichisback_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Nyní, když se Elvrich vrátíl, pro tebe mùže znovu pracovat.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mohu jenom doufat, že neuteèe znovu s další možnou ženou.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Tady, vem si tohle zlato jako odmìnu za pøivedení mého uènì.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	MIS_THORBEN_BRINGELVRICHBACK = LOG_SUCCESS;
	vlk_4302_addon_elvrich.flags = 0;
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "Co víš o paladinech?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Co víš o paladinech?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Nic moc. Pøed dvìma týdny sem na lodi pøipluli z pevniny.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Od té doby jsou zavøení v horní èásti mìsta.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nikdo tady poøádnì neví, proè vlastnì pøijeli.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Hodnì lidí se obává útoku skøetù.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//Ale já si stejnì myslím, že jsou tu kvùli rolnické vzpouøe.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "Víš nìco o té rolnické vzpouøe?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Víš nìco o té rolnické vzpouøe?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Povídá se, že si velkostatkáø Onar najal žoldnéøe, aby ho chránili pøed královskými vojsky.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Asi už mìl dost toho, že mu paladinové a domobrana poøád berou úrodu a dobytek.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Jediné, co jsme tady ve mìstì zaznamenali, je neustálé zvyšování cen potravin.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Onarova farma odsud leží daleko na východì. Nevíme, jestli se tam k nìèemu chystá.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Pokud se chceš dozvìdìt víc, zeptej se kupcù na tržišti. Mají o ostrovì vìtší pøehled než já.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "Pøišel jsem kvùli Grittì.";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Pøišel jsem kvùli Grittì.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Mé neteøi? O co jde? Není to nic s penìzi, že ne?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Dluží 100 zlatých kupci Matteovi.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Øekni, že to není pravda. Od té doby, co se ke mnì ta malá lenoška nastìhovala, mám jen samé potíže!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Má dluh snad u každého kupce ve mìstì.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Musel jsem si pùjèit 200 zlatých u lichváøe jen proto, abych vyrovnal její dluhy. A teï tohle!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta by mìla být v domì.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Jdi dál, jen se jí zeptej. Ale mùžu ti øíct jedno: nemá ani zlatku.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Uvidíme...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "Tvá neteø mi dala 100 zlatých.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 100) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Tvá neteø mi dala 100 zlatých.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//CO? Ta malá nestydatá zmije - to bylo MOJE zlato! Vzala ho z mé truhly.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Vra mi to! Musím nejdøív zaplatit Lehmarovi. Matteo dostane své peníze pozdìji!
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Už jsem dal Matteovi jeho zlato!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Ne. Ty peníze jsou Matteovy.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Tady je zlato.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//A co vím o té malé zmyji, jsem si jist, že bìžela pøímo za mìstskou stráží, aby tì taky obvinila!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Dohlédnu na to, aby se to nìjak vyøešilo.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Už jsem dal Matteovi jeho zlato!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Sakra! Dobrá - dluh je dluh. Alespoò, že sis ty peníze nenechal. Asi bych ti za to mìl podìkovat.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Ne. Ty peníze jsou Matteovy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Takhle mì dostaneš do poøádných trablù. Lehmar není zrovna pøehnanì shovívavý, když pøijde øeè na dluhy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Ale pøinejmenším se chystáš splatit dluh mé neteøe. Asi bych ti za to mìl podìkovat.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Tady je zlato.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Díky! Koneènì mám alespoò èást penìz, co dlužím Lehmarovi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Nemùžu uvìøit tomu, že mìla tu drzost vzít mé zlato!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

