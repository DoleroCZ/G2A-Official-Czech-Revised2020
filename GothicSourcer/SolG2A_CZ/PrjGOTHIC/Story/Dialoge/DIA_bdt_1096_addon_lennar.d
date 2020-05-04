
instance DIA_ADDON_LENNAR_EXIT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 999;
	condition = dia_addon_lennar_exit_condition;
	information = dia_addon_lennar_exit_info;
	permanent = TRUE;
	description = "Mus�m j�t ...";
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
	description = "�au.";
};


func int dia_addon_lennar_hi_condition()
{
	return TRUE;
};

func void dia_addon_lennar_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//�au.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Ahoj, jmenuji se Lennar. V�tej v t�bo�e kop���.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kop���? Myslel jsem, �e toto je t�bor bandit� ...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasn�, v�ak bandit� tady kopou taky. (�kubne ramenem) Tak�e ...
};


instance DIA_ADDON_LENNAR_ATTENTAT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 2;
	condition = dia_addon_lennar_attentat_condition;
	information = dia_addon_lennar_attentat_info;
	permanent = FALSE;
	description = "O tom pokusu zavra�dit Estebana ...";
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
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//(naivn�) Ano?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//M� tu�en�, kdo za t�m je?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//(nad�en�) Samoz�ejm�!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(ho�e�n�) Tutov� je za t�m Emilio!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(ho�e�n�) Ut�kal do dolu jako ��lenec a pak kopal jako krtek.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//(chyt�e) Ale od toho pokusu o vra�du jen sed� na lavi�ce a nepohne se ani o p��.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//(pochop�) To je ono! Aby mohl do dolu, musel m�t �erven� k�men od Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//Jak se tak d�v�m do jeho o��, vsad�m se, �e nebude vzdorovat dlouho.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Lennar podez��v� Emilia, proto�e se Estebanovi vyh�b�.");
};


instance DIA_ADDON_LENNAR_INSPEKTOR(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 3;
	condition = dia_addon_lennar_inspektor_condition;
	information = dia_addon_lennar_inspektor_info;
	permanent = FALSE;
	description = "Co by mohl Emilio m�t z Estebanovy smrti?";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Co by mohl Emilio m�t z Estebanovy smrti?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//Co j� v�m? Mo�n� m� kamar�da, kter� by p�evzal po Estebanovi jeho m�sto.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//(pro sebe) Ano, to by mohlo d�vat smysl ...
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
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Opravdu pro m� m� �erven� k�men.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Perfektn�. Te� kone�n� rozbiju ty zatracen� �utry na padr� - v�m p�esn�, kde za�nu!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//Jedna v�c - kdy� p�jde� kopat, d�vej pozor, abys neuhodil p��li� tvrd�. Jinak se ti krump�� zakl�n� do zlata!
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
	description = "M��e� m� nau�it jak nakopat zlato?";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//M��e� m� nau�it jak nakopat zlato?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Jasn�, ale pokud t� to nau��m, tak nakope� v�ce zlata.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//O to mi pr�v� jde.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Jo. Ale pokud nakope� v�c, tak je f�r, abych j� z toho n�co dostal.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Tak�e ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Bude lep��, kdy� mi d� ��st p�edem. Dej mi ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//50 zla��k�.
};


var int lennar_teachgold;

instance DIA_ADDON_LENNAR_TRAIN(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 6;
	condition = dia_addon_lennar_train_condition;
	information = dia_addon_lennar_train_info;
	permanent = TRUE;
	description = "Zasv� m� do kop�n� zlata!";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Zasv� m� do kop�n� zlata!
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//Tak�e. Mus� b�t v prv� �ad� trp�liv�. Nesp�chat - dokonce ani v p��pad�, �e u� bude� us�nat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//A taky nesm� kopat ani do stejn�ho m�sta - sna� se to kolem nugetu p�kn� osekat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Dr� se m�ch rad a bude� na dobr� cest� st�t se kop�� - mistr.
		b_upgrade_hero_hackchance(10);
		LENNAR_TEACHGOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Nejprve chci vid�t sv�j d�l.
	};
};


instance DIA_ADDON_LENNAR_HACKER(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 9;
	condition = dia_addon_lennar_hacker_condition;
	information = dia_addon_lennar_hacker_info;
	permanent = TRUE;
	description = "V�echno v po��dku?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//V�echno �lape - tak�e jsem nakopal dal�� p�kn� nugety!
};

