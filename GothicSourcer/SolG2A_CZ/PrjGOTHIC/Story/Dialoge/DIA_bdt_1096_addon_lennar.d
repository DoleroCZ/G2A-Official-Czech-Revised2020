
instance DIA_ADDON_LENNAR_EXIT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 999;
	condition = dia_addon_lennar_exit_condition;
	information = dia_addon_lennar_exit_info;
	permanent = TRUE;
	description = "Musím jít ...";
};


func int dia_addon_lennar_exit_condition()
{
	return TRUE;
};

func void dia_addon_lennar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LENNAR_PICKPOCKET(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 900;
	condition = dia_addon_lennar_pickpocket_condition;
	information = dia_addon_lennar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_lennar_pickpocket_condition()
{
	return c_beklauen(65,100);
};

func void dia_addon_lennar_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_BACK,dia_addon_lennar_pickpocket_back);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_PICKPOCKET,dia_addon_lennar_pickpocket_doit);
};

func void dia_addon_lennar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};

func void dia_addon_lennar_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};


instance DIA_ADDON_LENNAR_HI(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 1;
	condition = dia_addon_lennar_hi_condition;
	information = dia_addon_lennar_hi_info;
	permanent = FALSE;
	description = "Èau.";
};


func int dia_addon_lennar_hi_condition()
{
	return TRUE;
};

func void dia_addon_lennar_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Èau.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Ahoj, jmenuji se Lennar. Vítej v táboøe kopáèù.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kopáèù? Myslel jsem, e toto je tábor banditù ...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasnì, však bandité tady kopou taky. (škubne ramenem) Take ...
};


instance DIA_ADDON_LENNAR_ATTENTAT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 2;
	condition = dia_addon_lennar_attentat_condition;
	information = dia_addon_lennar_attentat_info;
	permanent = FALSE;
	description = "O tom pokusu zavradit Estebana ...";
};


func int dia_addon_lennar_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//(naivnì) Ano?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//Máš tušení, kdo za tím je?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//(nadšenì) Samozøejmì!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(hoøeènì) Tutovì je za tím Emilio!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(hoøeènì) Utíkal do dolu jako šílenec a pak kopal jako krtek.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//(chytøe) Ale od toho pokusu o vradu jen sedí na lavièce a nepohne se ani o píï.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//(pochopí) To je ono! Aby mohl do dolu, musel mít èervenı kámen od Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//Jak se tak dívám do jeho oèí, vsadím se, e nebude vzdorovat dlouho.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Lennar podezøívá Emilia, protoe se Estebanovi vyhıbá.");
};


instance DIA_ADDON_LENNAR_INSPEKTOR(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 3;
	condition = dia_addon_lennar_inspektor_condition;
	information = dia_addon_lennar_inspektor_info;
	permanent = FALSE;
	description = "Co by mohl Emilio mít z Estebanovy smrti?";
};


func int dia_addon_lennar_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Co by mohl Emilio mít z Estebanovy smrti?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//Co já vím? Moná má kamaráda, kterı by pøevzal po Estebanovi jeho místo.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//(pro sebe) Ano, to by mohlo dávat smysl ...
};


instance DIA_ADDON_LENNAR_MINE(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 4;
	condition = dia_addon_lennar_mine_condition;
	information = dia_addon_lennar_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_lennar_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Opravdu pro mì máš èervenı kámen.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Perfektní. Teï koneènì rozbiju ty zatracené šutry na padr - vím pøesnì, kde zaènu!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//Jedna vìc - kdy pùjdeš kopat, dávej pozor, abys neuhodil pøíliš tvrdì. Jinak se ti krumpáè zaklíní do zlata!
	b_upgrade_hero_hackchance(10);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LENNAR_GOLD(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 5;
	condition = dia_addon_lennar_gold_condition;
	information = dia_addon_lennar_gold_info;
	permanent = FALSE;
	description = "Mùeš mì nauèit jak nakopat zlato?";
};


func int dia_addon_lennar_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//Mùeš mì nauèit jak nakopat zlato?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Jasnì, ale pokud tì to nauèím, tak nakopeš více zlata.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//O to mi právì jde.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Jo. Ale pokud nakopeè víc, tak je fér, abych já z toho nìco dostal.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Take ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Bude lepší, kdy mi dáš èást pøedem. Dej mi ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//50 zlaákù.
};


var int lennar_teachgold;

instance DIA_ADDON_LENNAR_TRAIN(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 6;
	condition = dia_addon_lennar_train_condition;
	information = dia_addon_lennar_train_info;
	permanent = TRUE;
	description = "Zasvì mì do kopání zlata!";
};


func int dia_addon_lennar_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_gold) && (LENNAR_TEACHGOLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_train_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Zasvì mì do kopání zlata!
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//Take. Musíš bıt v prvé øadì trpìlivı. Nespìchat - dokonce ani v pøípadì, e u budeš usínat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//A taky nesmíš kopat ani do stejného místa - sna se to kolem nugetu pìknì osekat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Dr se mıch rad a budeš na dobré cestì stát se kopáè - mistr.
		b_upgrade_hero_hackchance(10);
		LENNAR_TEACHGOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Nejprve chci vidìt svùj díl.
	};
};


instance DIA_ADDON_LENNAR_HACKER(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 9;
	condition = dia_addon_lennar_hacker_condition;
	information = dia_addon_lennar_hacker_info;
	permanent = TRUE;
	description = "Všechno v poøádku?";
};


func int dia_addon_lennar_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Všechno v poøádku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Všechno šlape - take jsem nakopal další pìkné nugety!
};

