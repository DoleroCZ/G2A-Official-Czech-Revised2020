
instance DIA_KJORN_EXIT(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 999;
	condition = dia_kjorn_exit_condition;
	information = dia_kjorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KJORN_HELLO(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_hello_condition;
	information = dia_kjorn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kjorn_hello_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void dia_kjorn_hello_info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, pojï sem!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Tohle údolí je nebezpeèné místo a bez poøádného vybavení budeš mrtvej, ani se nenadìješ.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Pøedpokládám, e to poøádné vybavení najdu u TEBE.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//To se vsaï. Dokonce ti ho mùu prodat.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi mùeš nabídnout?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mi mùeš nabídnout?
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "Prodáváš taky informace?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Prodáváš taky informace?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//Pøijde na to. Pokud je dobrá cena, øeknu všechno, co vím.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmm... tìko øíct. Ale myslím, e 50 zlatıch za kadou poskytnutou informaci vypadá celkem slušnì.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "Potøebuju nìjaké informace.";
};


func int dia_kjorn_buyinfos_condition()
{
	if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
	{
		return TRUE;
	};
};

func void dia_kjorn_buyinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Potøebuju nìjaké informace.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 zlatıch!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"To je pro mì moc drahé.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"Ano, tady.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To je pro mì moc drahé.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Ano, tady.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A teï mi øekni...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o dracích.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...ještì nìco o dracích.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o Hornickém údolí.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...ještì nìco o Hornickém údolí.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o hradu.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o skøetech.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...ještì nìco o skøetech.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Víš, rozmyslel jsem si to. Vra mi moje peníze.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Jak je libo.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Øekni mi nìco o dracích.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Draci jsou starobylá, neuvìøitelnì mocná stvoøení. Kdysi jich ily tisíce po celém svìtì.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Ale u je pøes sto let, co nìkterého z nich nìkdo vidìl.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Jejich krev je horká jako vroucí olej. Kdy se ti podívají do oèí, promìní se tvé srdce v kámen. Tak jsem to alespoò slyšel.
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Øekni mi o tìch dracích víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Ale ne všichni draci jsou takoví.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Nìkteøí z nich mùou celou zem pokrıt vrstvou ledu nìkolik stop tlustou.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Jiní dávají pøednost ivotu v bainách nebo v sopeènıch kráterech.
	b_logentry(TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domnívá, e drakù je nìkolik druhù. Nìkteøí si potrpí na chlad a vlhko, jiní zase dávají pøednost ohni.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Øekni mi nìco o Hornickém údolí.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//Hornické údolí v Khorinisu je díky magické rudì známé po celé zemi.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Tyhle hory jsou jedinım místem na svìtì, kde se magická ruda vyskytuje.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Zbranì vyrobené z téhle rudy jsou prakticky neznièitelné a proniknou i tím nejlepším brnìním.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Ještì pøed nìkolika tıdny celé údolí obklopovala magická bariéra. Byla neproniknutelná, a tak se nikdo nemohl dostat ven.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Øekni mi o tom údolí víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//Údolí se bìhem tìch nìkolika málo dní zmìnilo k nepoznání.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Kdy pøišli skøeti, ukázaly se i další stvùry. Nic podobného tu nikdo nikdy pøedtím nevidìl.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Øíká se, e tu ještì poøád zùstalo nìkolik osamìlıch lovcù, ale nejsem si zrovna jistı, jestli taky zùstali naivu.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Vypadá to, jako by se do toho údolí stahovala všechna Beliarova stvoøení temnot.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Øekni mi nìco o hradì.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Leí témìø uprostøed Hornického údolí.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Døív, kdy to údolí ještì slouilo jako vìzení, mìli veškerou rudu odtamtud pod palcem rudní baroni.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Øekni mi nìco o skøetech.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Ti skøeti tu nejsou moc dlouho. Alespoò ti, co jsou teï pøed hradem.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Ale nejde mi na rozum, e jsou tak dobøe organizovaní. Skøeti vìtšinou útoèí hlava nehlava a je jim jedno na co.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Tihle èekají na ten správnı èas. Èekají, ale my nevíme na co.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Øekni mi o tìch skøetech víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Ti skøeti jsou pod velením elitních váleèníkù. Mají obrovskou sílu a disponují vıbornımi zbrojemi. Je témìø nemoné je porazit.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Jednou jsem vidìl, jak jeden z nich sloil vzrostlı dub jedinım máchnutím sekery.
	KJORNTOLDORKS = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};


instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_alldragonsdead_condition;
	information = dia_kjorn_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabil jsem všechny draky!";
};


func int dia_kjorn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kjorn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabil jsem všechny draky!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(smích) Jasnì, a já jsem paladin.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Moná se ti podaøilo zabít jednoho, ale všechny? Najdi si nìkoho jiného, kdo bude ochoten ti vìøit.
};


instance DIA_KJORN_PICKPOCKET(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 900;
	condition = dia_kjorn_pickpocket_condition;
	information = dia_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kjorn_pickpocket_condition()
{
	return c_beklauen(47,75);
};

func void dia_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};

func void dia_kjorn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kjorn_pickpocket);
};

func void dia_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
};

