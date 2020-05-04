
instance DIA_ADDON_GARETT_EXIT(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 999;
	condition = dia_addon_garett_exit_condition;
	information = dia_addon_garett_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garett_exit_condition()
{
	return TRUE;
};

func void dia_addon_garett_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARETT_PICKPOCKET(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 900;
	condition = dia_addon_garett_pickpocket_condition;
	information = dia_addon_garett_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_garett_pickpocket_condition()
{
	return c_beklauen(36,55);
};

func void dia_addon_garett_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_BACK,dia_addon_garett_pickpocket_back);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_PICKPOCKET,dia_addon_garett_pickpocket_doit);
};

func void dia_addon_garett_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garett_pickpocket);
};

func void dia_addon_garett_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
};


instance DIA_ADDON_GARETT_ANHEUERN(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_anheuern_condition;
	information = dia_addon_garett_anheuern_info;
	important = TRUE;
};


func int dia_addon_garett_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Ani se mì neptej, jestli s tebou pùjdu na lov.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Co si myslíš, že by si tu beze mì poèali, co?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Než bych se vrátil, nezbyla by mi tu ani JEDNA plná krabice!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Zùstávám tady a budu se starat o zásoby!
};


instance DIA_ADDON_GARETT_HELLO(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_hello_condition;
	information = dia_addon_garett_hello_info;
	important = TRUE;
};


func int dia_addon_garett_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Copak to tu máme, nová tváø? Doufám, že nejsi žádný z tìch všivých banditù!
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//Já jsem Garett. Když budeš nìco potøebovat, pøijï nejprve za mnou.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//Mám témìø všechno. Víno, zbranì a ještì mnoho dalšího, co lidé potøebují.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Kromì koøalky - jestli hledáš kvalitní koøalku, jdi za Samuelem.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_GARETT_SAMUEL(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 2;
	condition = dia_addon_garett_samuel_condition;
	information = dia_addon_garett_samuel_info;
	permanent = FALSE;
	description = "Kdo je Samuel?";
};


func int dia_addon_garett_samuel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) && (samuel.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garett_samuel_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Kdo je Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//Náš paliè. Jeho jeskynì je támhle o kousek dál, napravo od pláže.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Není tìžké to najít, jdi prostì na sever.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Ale nìco ti poradím - zásob se grogem.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Nìkteøí mladíci tady nemají moc rádi nové chlapy, jestli chápeš ...
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//V tom pøípadì mùže troška kvalitního grogu urovnat situaci!
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_GARETT_WAREZ(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_warez_condition;
	information = dia_addon_garett_warez_info;
	description = "Od koho bereš své zboží?";
};


func int dia_addon_garett_warez_condition()
{
	return TRUE;
};

func void dia_addon_garett_warez_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Od koho bereš své zboží?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip vždycky doveze hodnì z Khorinisu, kam chodívá.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//Až do teï prodával hodnì vìcí banditùm.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale jak teï s bandity válèíme, všechno to zboží konèí u mì.
};


instance DIA_ADDON_GARETT_BANDITS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_bandits_condition;
	information = dia_addon_garett_bandits_info;
	description = "Co víš o banditech?";
};


func int dia_addon_garett_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_warez))
	{
		return TRUE;
	};
};

func void dia_addon_garett_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Na to je odborník Skip.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//Øeknu ti, on mìl s tìmi idioty hodnì schùzek.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozkázal zlikvidovat každého banditu, co se pøiblíží k táboru.
};


instance DIA_ADDON_GARETT_GREG(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 4;
	condition = dia_addon_garett_greg_condition;
	information = dia_addon_garett_greg_info;
	permanent = FALSE;
	description = "Tvùj kapitán Greg. Jaký je?";
};


func int dia_addon_garett_greg_condition()
{
	return TRUE;
};

func void dia_addon_garett_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Tvùj kapitán Greg. Jaký je?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Je to tuhý chlápek, to urèitì.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//A chamtivý jako nikdo jiný.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Nechal našeho pokladníka Francise, aby nám platil akorát tolik, abychom se nevzbouøili.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A když jeden z nás nìco opravdu zamýšlel, postaral se o nìho osobnì.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Jednou jsem ukradl kompas z jedné královké fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//Greg, ten bastard, mi ho samozøejmì zabavil.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Pf! Asi ho nìkam schoval, jako všechny jeho poklady.
};


instance DIA_ADDON_GARETT_TIPS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 5;
	condition = dia_addon_garett_tips_condition;
	information = dia_addon_garett_tips_info;
	description = "Kde mohl Greg ukrýt ten kompas?";
};


func int dia_addon_garett_tips_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_tips_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Kde mohl Greg ukrýt ten kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg mi jednou øekl, že o mùj kompas se stará smrt a pak se zaèal smát.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Nìco dalšího?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Na jižním pobøeží je pláž. Dá se tam dostat jen po moøi.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Øíká se, že Greg tam obèas chodí. Možná bys tam nìco našel.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Jednou jsem tam byl, ale je tam plno potvor.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Jestli to chceš opravdu risknout, nezapomeò si krumpáè.
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KOMPASS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KOMPASS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KOMPASS,"Greg sebral Garretovi vzácný kompas. Garett si myslí, že ho schoval nìkde na jižní pláži.");
};


instance DIA_ADDON_GARETT_GIVEKOMPASS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 6;
	condition = dia_addon_garett_givekompass_condition;
	information = dia_addon_garett_givekompass_info;
	permanent = FALSE;
	description = "Tady je tvùj kompas.";
};


func int dia_addon_garett_givekompass_condition()
{
	if((Npc_HasItems(other,itmi_addon_kompass_mis) >= 1) && (MIS_ADDON_GARETT_BRINGKOMPASS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_givekompass_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Tady je tvùj kompas.
	if(b_giveinvitems(other,self,itmi_addon_kompass_mis,1))
	{
		Npc_RemoveInvItems(self,itmi_addon_kompass_mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(raduje se) Jo, to je on. Neèekal jsem, že ho ještì nìkdy uvidím.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Díky, chlape!
	if(Npc_HasItems(self,itbe_addon_prot_edgpoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tentokrát už ho Greg NEDOSTANE ...
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Tady, vezmi si za to tenhle opasek. Je celkem cenný.
		b_giveinvitems(self,other,itbe_addon_prot_edgpoi,1);
	}
	else if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Tento pásek si ode mì koupil, pamatuješ?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zaplatil jsi za nìj hodnì - (rychle) a je opravdu cenný. Tady - vezmi si ty peníze zpìt.
		b_giveinvitems(self,other,itmi_gold,VALUE_ITBE_ADDON_PROT_EDGPOI);
	};
	b_logentry(TOPIC_ADDON_KOMPASS,"Garret byl velmi potìšen, když jsem mu vrátil jeho kompas.");
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GARETT_BRING_KOMPASS);
};


instance DIA_ADDON_GARETT_FRANCIS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 7;
	condition = dia_addon_garett_francis_condition;
	information = dia_addon_garett_francis_info;
	permanent = FALSE;
	description = "Co mi mùžeš øíct o Francisovi?";
};


func int dia_addon_garett_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mi mùžeš øíct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mu pøedal velení, dokud tu není.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Ale jako kapitán je Francis absolutnì nemožný!
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Ani nedokázal vytáhnout Morgana z postele.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Henry a jeho chlapci jsou jediní, kdo tu nìco dìlá.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Ti ostatní se jen flákají.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Doufám, že se Greg vrátí brzy.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//Pak je pìknì nakope do zadku.
	};
};


instance DIA_ADDON_GARETT_PERM(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 99;
	condition = dia_addon_garett_perm_condition;
	information = dia_addon_garett_perm_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_addon_garett_perm_condition()
{
	return TRUE;
};

func void dia_addon_garett_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Nìco nového?
	if((GREGISBACK == FALSE) || Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Dokud bude Greg pryè, nic se tu dít nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Teï, když je Greg zpìt, vìci se vrací do normálu.
	};
};


instance DIA_ADDON_GARETT_TRADE(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 888;
	condition = dia_addon_garett_trade_condition;
	information = dia_addon_garett_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};


func int dia_addon_garett_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_garett_trade_info()
{
	var int garett_random;
	var int mcbolzenamount;
	var int mcarrowamount;
	garett_random = Hlp_Random(3);
	if(garett_random == 0)
	{
		b_say(other,self,"$TRADE_1");
	}
	else if(garett_random == 1)
	{
		b_say(other,self,"$TRADE_2");
	}
	else
	{
		b_say(other,self,"$TRADE_3");
	};
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 25;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 25;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
};

