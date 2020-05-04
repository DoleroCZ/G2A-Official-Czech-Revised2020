
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Á, zákazník - èímpak poslouím?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "Hledám pokoj.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Hledám pokoj.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//Tak to jsi na správném místì.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Jeden z paladinù mi naznaèil, e bych tu mohl pøespat i zadarmo.
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Kolik stojí noc?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Vùbec nic.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Ubytování poutníkù jde na úèet paladinùm.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//Take tu mùu zùstat zadarmo?
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Ano, ano.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Prostì vyjdi po schodech nahoru.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Ještì tam máme dvì postele volné.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "Proè paladinové za všechno platí?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Proè paladinové za všechno platí?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Nevím, ale nejspíš v tom bude víc vìcí najednou.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//Jednak chtìjí, aby se po ulici netoulala ádná pochybná sebranka a zbyteènì tu nedìlala bordel.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//A taky si moná chtìjí na svou stranu naklonit potulné kupce.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Teï, kdy se sedláci bouøí, je naše zásobování závislé hlavnì na obchodnících.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//A kromì toho bych øekla, e taky chtìjí ve mìstì trochu pozvednout morálku.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre dokonce naøídil, aby v šibenièní ulièce nalévali jedno pivo zdarma.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "Kdo tady zrovna je?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Kdo tady zrovna je?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Skoro všechno jsou potulní trhovci.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//A tì ani nenapadne, e bys jim šel "zkontrolovat" zboí! Nechci tu mít ádné nepøíjemnosti!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "Mìl bych pár otázek ohlednì mìsta...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Mìl bych pár otázek ohlednì mìsta...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"Kde bych si tu mohl nìco nakoupit?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"Povìz mi nìco o mìstì.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Kde bych si tu mohl nìco nakoupit?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Pøímo naproti dveøím je trištì, tam bys mìl najít všechno, co potøebuješ.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Na druhé stranì mìsta najdeš pár øemeslnickıch krámkù. Vìtšina z nich leí poblí druhé mìstské brány.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//V pøístavu také mùeš zajít k rybáøi. Jeho obchod se nachází pøímo v pøístavu, najdeš to snadno.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Povìz mi nìco o mìstì.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis je jedním z nejbohatších mìst v království, i kdy teï to tak nevypadá.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Ale od té doby, co zaèaly ty problémy se skøety, se obchod témìø zastavil. Král toti naverboval do armády celou kupeckou flotilu.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//To znamená, e do pøístavu teï ádné lodi neplují a zásoby zboí se rapidnì tenèí. Spousta zdejších obyvatel se proto bojí, co bude dál.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nikdo neví pøesnì, co nám budoucnost pøinese. Vlastnì nemùeme dìlat nic jiného, ne tu sedìt a èekat, co se stane. Nezdá se, e bychom mohli nìco zmìnit.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Nevypadáš, e by tì problémy druhıch lidí nìjak zvláš zajímaly.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Ano, jistì, samozøejmì.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"Pøijde na to.",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"Vlastnì ne.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Vlastnì ne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//Pøesnì jak øíkám. Nikdo tu nemyslí na nic jiného, ne jenom na sebe. Take co chceš?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//Pøijde na to.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//To jako e pøijde na to, co ti z toho kápne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Takové jako ty tu nemùu vystát.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Ano, jistì, samozøejmì.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Co ty víš, svìt je plnı pøekvapení. Nedávno jsem dìlala poøádek ve zboí a pøi té pøíleitosti jsem prodala štùsek map Brahimovi, kartografovi dole v pøístavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Bohuel jsem ale vzápìtí zjistila, e mi chybí jeden dokument.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Poèítám, e se musel nìjak pøimotat mezi ty papíry.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Nemohl bys mi ho pøinést zpátky?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"Hannì se ztratil nìjakı dokument. Nejspíš jí zmizel v pøístavu - tam, kde sídlí kartograf Brahim.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Nejsem ádnı poslíèek.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"Co z toho budu mít?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"Uvidím, co se dá dìlat.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Nejsem ádnı poslíèek.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Chápu - problémy obyèejné eny ti nestojí za námahu. No dobøe, tak se o to budu muset postarat sama.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Aha, já to vìdìla - nejsi o nic lepší ne ta lùza dole v pøístavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Take co chceš po ubohé enì?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"To nic.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"Taky bys ke mnì mohla bıt trochu vlídnìjší.",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"Zlato.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//To nic.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Aspoò e v tobì zbyla trocha slušnosti. Kdy mi ten dokument pøineseš, dostaneš ode mì 75 zlaákù.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Taky bys ke mnì mohla bıt trochu vlídnìjší.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//To je ale hnusné! Já... zmiz odsud! Ty nevychovanı hulváte!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Zlato.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Nemùu ti nabídnout víc ne mrzkı peníz. No - cením si to na 50 zlaákù.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Jestli se ti podaøí ten dokument získat zpátky, dám ti 50 zlaákù.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Uvidím, co se dá dìlat.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//To je od tebe milé! Hodnì štìstí!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Kdy mi ten dokument pøineseš zpátky, odmìním se ti.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "Myslelas tenhle dokument?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Myslelas tenhle dokument?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Ano, to je pøesnì ono. Dìkuji ti.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//A co má odmìna?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Ne tak zhurta. Tady máš peníze.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Odkud... jsi to pøišel?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//U tebe ve sklepì jsem našel cosi velmi zajímavého.
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//A co jsi dìlal u mì ve sklepì?
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//To víš zatracenì dobøe!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(chladnì) Nemám ponìtí, o èem to mluvíš.
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(nedùvìøivì) Jen se na sebe podívej! Odkud jsi to pøišel, co?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(rozpaèitì) Já...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(usmìje se) Já vím!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(spiklenecky) Nemusíš mi nic øíkat - vím všechno.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//A tì ani nenapadne nìco tady ukrást, jasné?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//U se nemùeme hotelu dále vìnovat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "Podívej, jakou knihu tu mám!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Podívej, jakou knihu tu mám!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Lehmarova úèetní kniha. Jak jsi k ní pøišel?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//No...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//Pokud u ji Lehmar nemá, je to dobrá vìc. Stejnì bych ji ale radši ukryl u sebe.
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "Tumáš - klidnì si tu knihu vezmi.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Tumáš - klidnì si tu knihu vezmi.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Díky.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Tady máš nìco za odmìnu.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Co jsi mi to dal?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//Je to klíè od brány bohatství.
};

func void hanna_blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Je v úkrytu všechno v poøádku?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//U jsem nikoho z nich nìjakou dobu nevidìla.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Mìl bych sejít tam dolù a trochu to tam prošetøit.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Ano, ale radši bys o tom nemìl mluvit.
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//U jsem zjistil, kde se skrıvají zlodìji?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(domıšlivì) Nemám potuchy, o èem to mluvíš.
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//Vtrhla sem domobrana - nìkdo vyzradil naši skrıš!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Mnì nemìli co pøišít, ale Cassia je mrtvá a její lidé taky!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Urèitì jsi to byl TY.
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Tohle jsem koupil zvláš pro tebe.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Stálo mì to sice majlant, ale ty si to fakt zaslouíš, ty svinì podrazácká.
};

