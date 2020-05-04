
instance DIA_RETHON_EXIT(C_INFO)
{
	npc = djg_709_rethon;
	nr = 999;
	condition = dia_rethon_exit_condition;
	information = dia_rethon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rethon_exit_condition()
{
	return TRUE;
};

func void dia_rethon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RETHON_HALLO(C_INFO)
{
	npc = djg_709_rethon;
	nr = 5;
	condition = dia_rethon_hallo_condition;
	information = dia_rethon_hallo_info;
	description = "Co tady dìláš?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//Pøipravuju se na boj. Ještì nìco?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "Proti komu se chystáš bojovat?";
};


func int dia_rethon_kampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_kampf_info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//Proti komu se chystáš bojovat?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//Øíkal jsem si, že vlítnu na paladiny a nakopu jim ty jejich tlustý zadky.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Idiote. Proti drakùm, samozøejmì. Cos myslel?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Copak o tobì paladinové nevìdí?";
};


func int dia_rethon_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_paladine_info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Copak o tobì paladinové nevìdí?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Nesmysl. Ty mají úplnì jiný problémy. Vìtšina z nich je ráda, že žije.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Morálka tìch chlapù není nic moc. To bude jejich konec.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Jen se podívej, jak si snaží dát dohromady ty nalámaný meèe, se kterými se chtìjí vydat do boje.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Každej rozumnej váleèník by okamžitì dezertoval.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "Opustil jsi svou jednotku?";
};


func int dia_rethon_wogruppe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_wogruppe_info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Opustil jsi svou jednotku?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Svojí jednotku? Nemìl jsem žádnou jednotku. Jsem sbìratel trofejí.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Když bych pøišel domù s prázdnýma rukama, tak teda nevím, proè bych to vlastnì dìlal. Takže nemùžu potøebovat nikoho dalšího.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "Už jsi vidìl nìjakého draka?";
};


func int dia_rethon_drachengesehen_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_kampf))
	{
		return TRUE;
	};
};

func void dia_rethon_drachengesehen_info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Už jsi vidìl nìjakého draka?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Ne. Chci si nejdøív naostøit zbraò, než na nìj vyrazím.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "Nebojíš se, že tì kvùli tomu nìkdo napadne?";
};


func int dia_rethon_angst_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_wogruppe))
	{
		return TRUE;
	};
};

func void dia_rethon_angst_info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//Nebojíš se, že tì kvùli tomu nìkdo napadne?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Co? Kdo? Sylvio?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Tvùj šéf si asi myslí, že se tady mùže jen tak zabíjet, co?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Nepatøím k Sylviovým lidem. Pracuju jen sám pro sebe.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//No, tak dobrá. Zapomeò, že jsem nìco øekl.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Vidìl jsi ty hastroše, co mìl s sebou?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Sylvio bude rád, když se odsud dostane vcelku.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Ne, to asi nebude. Je mrtvý.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Taky dobøe.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"Nevypadáš, že bys ho mìl zrovna v lásce.",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"Tak kde je Sylvio teï?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"Sylvio byl tady?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Sylvio byl tady?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//Myslíš tady na hradì? Jo, to byl. Ale jenom chvilku.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Promluvil si tu s nìkolika lidmi a pak znovu odešel.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Nevypadáš, že bys ho mìl zrovna v lásce.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Cože, mìl bych ho mít rád? Nejsem pyšný ani na to, že ho znám.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//Sylvio nemá žádné pøátele. Potøebuje lidi, co za ním pùjdou, a je úplnì jedno, co za lidi to bude.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//To není nic pro mì. Pracuju sám.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//Tak kde je Sylvio teï?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Ti paladinové tady øíkali nìco o ledovém drakovi na západì. Údajnì je to ten nejmocnìjší a nejnebezpeènìjší drak ze všech drakù.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//Mìls vidìt, jak Sylviovi zazáøily oèi, když o tom uslyšel. Není tak tìžký uhodnout, kam šel.
	b_logentry(TOPIC_DRACHENJAGD,"Drakobijce Rethon mumlal cosi o ledovém drakovi.");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio byl zalezlý na hradì a pak se vydal hledat ledového draka.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "Mùžeš mi pomoct s vylepšením mé zbranì?";
};


func int dia_rethon_meinewaffe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_paladine))
	{
		return TRUE;
	};
};

func void dia_rethon_meinewaffe_info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Mùžeš mi pomoct s vylepšením mé zbranì?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Vylepšit? Nejlíp udìláš, když si koupíš nìco nového a ten svùj starej krám zahodíš.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Možná bych pro tebe nìco mìl. Máš zájem?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mi mùžeš nabídnout?";
};


func int dia_rethon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_meinewaffe))
	{
		return TRUE;
	};
};

func void dia_rethon_trade_info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Co mi mùžeš nabídnout?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Chlape, podívej, jak mám vyprodanej sklad. Teï neprodávám zbranì nikomu jinýmu než paladinùm.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//Pro mágy toho vážnì moc nemám, ale i tak se mùžeš podívat.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//Mám dojem, že mám to, co potøebuješ, pøíteli.
	};
};


instance DIA_RETHON_PICKPOCKET(C_INFO)
{
	npc = djg_709_rethon;
	nr = 900;
	condition = dia_rethon_pickpocket_condition;
	information = dia_rethon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_rethon_pickpocket_condition()
{
	return c_beklauen(78,230);
};

func void dia_rethon_pickpocket_info()
{
	Info_ClearChoices(dia_rethon_pickpocket);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_BACK,dia_rethon_pickpocket_back);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_PICKPOCKET,dia_rethon_pickpocket_doit);
};

func void dia_rethon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rethon_pickpocket);
};

func void dia_rethon_pickpocket_back()
{
	Info_ClearChoices(dia_rethon_pickpocket);
};

