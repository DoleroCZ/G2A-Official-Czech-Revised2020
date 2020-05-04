
instance DIA_ADDON_FISK_EXIT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 999;
	condition = dia_addon_fisk_exit_condition;
	information = dia_addon_fisk_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fisk_exit_condition()
{
	return TRUE;
};

func void dia_addon_fisk_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FISK_PICKPOCKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 900;
	condition = dia_addon_fisk_pickpocket_condition;
	information = dia_addon_fisk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_fisk_pickpocket_condition()
{
	return c_beklauen(118,300);
};

func void dia_addon_fisk_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_BACK,dia_addon_fisk_pickpocket_back);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_PICKPOCKET,dia_addon_fisk_pickpocket_doit);
};

func void dia_addon_fisk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};

func void dia_addon_fisk_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};


instance DIA_ADDON_FISK_HI(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 1;
	condition = dia_addon_fisk_hi_condition;
	information = dia_addon_fisk_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_fisk_hi_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, jestli hledáš férového obchodníka, tak jsi ho právì našel.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moje chatrè stojí pøesnì za Estebanovou. Takže, pokud budeš nìco potøebovat, zastav se.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Fisk obchoduje se všemi druhy zbraní.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_FISK_TRADE(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 888;
	condition = dia_addon_fisk_trade_condition;
	information = dia_addon_fisk_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_fisk_trade_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_trade_info()
{
	b_say(other,self,"$TRADE_2");
	b_givetradeinv(self);
	if(Npc_HasItems(self,itrw_bolt) < 50)
	{
		CreateInvItems(self,itrw_bolt,50 - Npc_HasItems(self,itrw_bolt));
	};
	if(Npc_HasItems(self,itrw_arrow) < 50)
	{
		CreateInvItems(self,itrw_arrow,50 - Npc_HasItems(self,itrw_arrow));
	};
};


instance DIA_ADDON_FISK_ATTENTAT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_attentat_condition;
	information = dia_addon_fisk_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fisk_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Pozornì poslouchej, nemám s tím nic spoleèného, jasný?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//(nevinnì) Mám své vlastní problémy, jsem jen obì.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Proè?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//Za svoji poslední dodávku jsem zaplatil kopu zlata.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale ta nikdy nedorazila! Nìjaká svinì ji musela sebrat!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//(zhnusenì) Nìkdo mi ji ukradl - asi od jednoho z mojich chlapù!
};


instance DIA_ADDON_FISK_LIEFERUNG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 3;
	condition = dia_addon_fisk_lieferung_condition;
	information = dia_addon_fisk_lieferung_info;
	permanent = FALSE;
	description = "Co to bylo za dodávku?";
};


func int dia_addon_fisk_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_lieferung_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to bylo za dodávku?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Balíèek plný paklíèù. Nìkdo by je mohl støelit pirátùm.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale ten chlápek se jí zmocnil.(naštvaný) Se vším zlatem, co jsem mu dal.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten zkurvysyn se schovává nìkde v bažinì ...
	MIS_LENNAR_LOCKPICK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_FISK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FISK,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Nìjaký chlápek jménem Juan byl povìøen obchodovat s bandity. Øíká se, že se ukryl nìkde v bažinách.");
	b_logentry(TOPIC_ADDON_FISK,"Juan ukradl Fiskovu dodávku (balíèek s paklíèi). Schovává se nìkde v bažinì.");
};

func void b_addon_fisk_aboutjuan()
{
	if(Npc_IsDead(juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Je mrtvý.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobrý, už nemùže dále podvádìt!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Poøád žije ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ty jsi tu svini nechal žít?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nebyl sám ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Co už - zlikviduju i ty chlápky, co jsou s ním ...
	};
};

func void b_addon_fisk_belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Pokud jde o tebe ...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//Mám dobré styky s Hunem.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Zajistím, abys dostal zbranì velmi levnì.
	HUNO_ARMORCHEAP = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Podívej, jednou jsem dostal tenhle kámen od Corrista.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Je to moje jediná vìc, kterou jsem zachránil po úniku z bariéry. Myslím, že se ti bude hodit více než mì.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//A ještì navíc ti dám jednu z mých zbraní.
		if(other.hitchance[NPC_TALENT_2H] > other.hitchance[NPC_TALENT_1H])
		{
			b_giveinvitems(self,other,itmw_streitaxt1,1);
		}
		else
		{
			b_giveinvitems(self,other,itmw_bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//(podivínsky) Podrazíš mì a já podrazím tebe - to platí poøád.
};


instance DIA_ADDON_FISK_GIVEPAKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 4;
	condition = dia_addon_fisk_givepaket_condition;
	information = dia_addon_fisk_givepaket_info;
	permanent = FALSE;
	description = "Mám tvùj balíèek.";
};


func int dia_addon_fisk_givepaket_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_lennar_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepaket_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Mám tvùj balíèek.
	b_giveinvitems(other,self,itmi_addon_lennar_paket,1);
	MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LENNARPAKET);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//(štastnì) Fakt! (podezøívavì) A co Juan?
	b_addon_fisk_aboutjuan();
	b_addon_fisk_belohnung();
};


instance DIA_ADDON_FISK_PAKETOPEN(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 5;
	condition = dia_addon_fisk_paketopen_condition;
	information = dia_addon_fisk_paketopen_info;
	permanent = FALSE;
	description = "Otevøel jsem tvùj balíèek!";
};


func int dia_addon_fisk_paketopen_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (LENNARPAKET_OPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_paketopen_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otevøel jsem tvùj balíèek!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(smìje se) To se dalo èekat! Nemohl ses doèkat, že?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Máš aspoò ty paklíèe?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co je dùležitìjší - co se stalo s Juanem?
	b_addon_fisk_aboutjuan();
};


instance DIA_ADDON_FISK_GIVEPICKS(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 6;
	condition = dia_addon_fisk_givepicks_condition;
	information = dia_addon_fisk_givepicks_info;
	permanent = TRUE;
	description = "Tady máš tucet paklíèù ...";
};


func int dia_addon_fisk_givepicks_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_paketopen) && (MIS_LENNAR_LOCKPICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepicks_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Tady máš tucet paklíèù ...
	if(b_giveinvitems(other,self,itke_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Perfektní. Kdo si poèká, ten se doèká.
		b_addon_fisk_belohnung();
		MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_LENNARPAKET);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To není tucet! (chytøe) Nechceš jen zboží pøenášet, co?
	};
};


instance DIA_ADDON_FISK_INSPEKTOR(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 7;
	condition = dia_addon_fisk_inspektor_condition;
	information = dia_addon_fisk_inspektor_info;
	permanent = FALSE;
	description = "Juan pracoval pro Estebana!";
};


func int dia_addon_fisk_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_lieferung) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracoval pro Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//(ohromenì) Cože?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nehraj si se mnou! Vìdìl jsi to!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(s jistotou) Dobøe. Máš pravdu. Doufám, že ale chápeš, proè jsem ti to neøekl.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Všichni v tomhle táboøe ví, že dìláš pro Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nechci se do toho moc míchat jenom kvùli tomu, že ty chceš ten svùj èervený kámen.
	Info_ClearChoices(dia_addon_fisk_inspektor);
	Info_AddChoice(dia_addon_fisk_inspektor,"Já nedìlám pro Estebana ...",dia_addon_fisk_inspektor_antiesteban);
	Info_AddChoice(dia_addon_fisk_inspektor,"Nevìøím ti.",dia_addon_fisk_inspektor_dontbelieve);
	Info_AddChoice(dia_addon_fisk_inspektor,"Tomu rozumím!",dia_addon_fisk_inspektor_isee);
};

func void dia_addon_fisk_inspektor_isee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Tomu rozumím!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dobøe! Teï zavøi hubu! Jinak nás nìkdo uslyší.
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_dontbelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nevìøím ti.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Vìø si èemu chceš! Ale dám ti radu - pokud bys chtìl o mì Estebanovi navykládat nìjaké lži, tak tì nakopu!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_antiesteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Já nedìlám pro Estebana ...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha? Tak ty bys chtìl toho blba ošidit?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Potom ti poradím - nedìlej to.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Pokud jde o Estebana, nemùžeš nikomu vìøit - jenom sobì, chápeš?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Ale teï už dost tìch øeèí - nìkdo nás uslyší!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};


instance DIA_ADDON_FISK_MEETING(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_meeting_condition;
	information = dia_addon_fisk_meeting_info;
	permanent = FALSE;
	description = "TY jsi za tou vraždou.";
};


func int dia_addon_fisk_meeting_condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,zs_talk) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_meeting_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//TY jsi za tou vraždou.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Ano. Esteban je mi trnem v oku.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Žádného z banditù, kteøí pro mì dìlají, nepustí do dolu. Ujistíl se, že VŠICHNI dìlají pro nìho - jen pro nìho.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Takže si mùže vzít provizi z každého obchodu a tak mùže ovládat celý tábor.
	Info_ClearChoices(dia_addon_fisk_meeting);
	Info_AddChoice(dia_addon_fisk_meeting,"A co chceš dìlat?",dia_addon_fisk_meeting_now);
	Info_AddChoice(dia_addon_fisk_meeting,"Chceš na jeho místo?",dia_addon_fisk_meeting_you);
	if(!Npc_IsDead(esteban))
	{
		Info_AddChoice(dia_addon_fisk_meeting,"Mohl bych tì vydat Estebanovi ...",dia_addon_fisk_meeting_sell);
	};
};

func void dia_addon_fisk_meeting_you()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Chceš na jeho místo?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Ne, já jsem jen obchodník - jen nechci, aby se mi nìkdo míchal do øemesla.
};

func void dia_addon_fisk_meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Mohl bych tì vydat Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//A pak? A co by bylo potom? Ty fakt vìøíš, že ti dá, co chceš?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapomeò na to - mám lepší nápad.
};

func void dia_addon_fisk_meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co cheš dìlat?
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Zbavíme se Estebana. To znamená, že ho zabiješ a nastoupíš na jeho místo.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Ale jak, má kolem sebe ty stráže, nemám šanci.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Proto je musíme nìjak odlákat. A odlákáme je pravdou.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jakou pravdou?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Udìlal jsi svou práci. Víš, že já stojím za tou vraždou.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Øekni to Estebanovi a on pošle stráže, aby mì zabily. Budu je èekat.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Až budou pryè, mùžeš si to s tím zkurvysynem vyøídit a já se postarám o stráže.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban je mrtvý. Budu se dál vìnovat své práci ...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Tady, to je pro tebe ...
		b_giveinvitems(self,other,itmi_gold,500);
	};
	Info_ClearChoices(dia_addon_fisk_meeting);
	MIS_JUDAS = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	b_logentry(TOPIC_ADDON_ESTEBAN,"Fisk stojí za tou vraždou na Estebana.");
};


instance DIA_ADDON_FISK_SIEG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_sieg_condition;
	information = dia_addon_fisk_sieg_info;
	permanent = FALSE;
	description = "Esteban byl zabit.";
};


func int dia_addon_fisk_sieg_condition()
{
	if((MIS_JUDAS == LOG_SUCCESS) && Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban byl zabit.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Na to jsem èekal vìènost.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Myslím, že máš ještì udìlat dost práce a já taky.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Pokud bys nìco potøeboval, víš, kde mì najít.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};

