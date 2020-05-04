
instance DIA_ADDON_ESTEBAN_EXIT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 999;
	condition = dia_addon_esteban_exit_condition;
	information = dia_addon_esteban_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_esteban_exit_condition()
{
	if(BODYGUARD_KILLER == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ESTEBAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 900;
	condition = dia_addon_esteban_pickpocket_condition;
	information = dia_addon_esteban_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_esteban_pickpocket_condition()
{
	return c_beklauen(105,500);
};

func void dia_addon_esteban_pickpocket_info()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_BACK,dia_addon_esteban_pickpocket_back);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_PICKPOCKET,dia_addon_esteban_pickpocket_doit);
};

func void dia_addon_esteban_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};

func void dia_addon_esteban_pickpocket_back()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};


instance DIA_ADDON_ESTEBAN_HI(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 2;
	condition = dia_addon_esteban_hi_condition;
	information = dia_addon_esteban_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_esteban_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Tak�e, ty jsi ten chl�pek co si vybojoval p��stup do t�bora.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//No, tady se novinky ���� rychle ...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franco byl tuh� chl�pek. Nikdo se mu neodv�il odporovat. Nikdo krom� tebe.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Ale ch�pej, zabil bych t�, kdyby jsi zkusil stejnou v�c se mnou.
};


instance DIA_ADDON_ESTEBAN_MINE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_mine_condition;
	information = dia_addon_esteban_mine_info;
	permanent = FALSE;
	description = "Chci se dostat do dolu!";
};


func int dia_addon_esteban_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_hi))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chci se dostat do dolu!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(�kleb� se) Jak jinak. A mluv� se spr�vnou osobou.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Ka�d�, kdo kope v dole, si m��e ponechat slu�nou porci zlata.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A j� m�m na starosti �erven� kameny, kter� pot�ebuje�, aby t� Thorus pustil.
};


instance DIA_ADDON_ESTEBAN_ROT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_rot_condition;
	information = dia_addon_esteban_rot_info;
	permanent = FALSE;
	description = "Dej mi jeden z t�ch �erven�ch kamen�.";
};


func int dia_addon_esteban_rot_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_mine))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_rot_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Dej mi jeden z t�ch �erven�ch kamen�.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Jist�, ale nebude to zadarmo.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Obvykle sice beru slu�nou sumu zlata abych se nechal p�esv�d�it.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//A co tvoje kop��sk� schopnosti?
	if(HERO_HACKCHANCE > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//U� zn� p�r trik�, �e?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Je�t� po��d nejsi expert ...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(arogantn�) Ned�m ti �erven� k�men, jen proto�e jsi celkem zku�en� kop��.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Ne, m�m pro tebe jin� �kol ...
};


instance DIA_ADDON_ESTEBAN_MIS(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 4;
	condition = dia_addon_esteban_mis_condition;
	information = dia_addon_esteban_mis_info;
	permanent = FALSE;
	description = "A jak� �kol by to m�l b�t?";
};


func int dia_addon_esteban_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//A jak� �kol by to m�l b�t?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden ze zdej��ch bandit� se m� pokusil zab�t. Nicm�n�, ON byl zabit m�mi str�emi.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Asi cht�l na tv� m�sto, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//Byl to idiot! Vygumovan� krimin�ln�k. Pochybuju, �e to byl jeho n�pad m� zavra�dit.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Ne, d�lal pro n�koho jin�ho ...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A te� je na m�, abych na�el lidi, co jsou za to odpov�dn�.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//A� to byl kdokoliv, zaplat� za to. Najdi ho a j� t� pust�m do dolu.
	if(!Npc_IsDead(senyan) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Senyan m� za tebou kv�li tomu poslal.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? Ten pro m� d�l� taky. �ekl jsem mu, aby m�l o�i otev�en�.
	};
	MIS_JUDAS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ESTEBAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ESTEBAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Byl tady pokus o zavra�d�n� Estebana. M�m zjistit, kdo za t�m stoj�.");
};


instance DIA_ADDON_ESTEBAN_KERL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_kerl_condition;
	information = dia_addon_esteban_kerl_info;
	permanent = FALSE;
	description = "Kde m�m za��t s p�tr�n�m?";
};


func int dia_addon_esteban_kerl_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_kerl_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Kde m�m za��t s p�tr�n�m?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Ka�d� v t�bo�e o tom v�. Nen� to ��dn� tajemstv�.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Zkus zjistit, kdo je na m� stran� a kdo ne. A nenech ty chl�pky, aby t� dostali.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Promluv si se Snafem. Ten tlust� kucha� toho v� hodn�.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Abych tomu p�i�el na kloub, m�l bych si promluvit s lidmi v t�bo�e a zjistit, na �� stran� jsou. Snaf je dobr� pro za��tek. Zaslechne hodn� klep�.");
};


instance DIA_ADDON_ESTEBAN_ARMOR(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 9;
	condition = dia_addon_esteban_armor_condition;
	information = dia_addon_esteban_armor_info;
	permanent = FALSE;
	description = "Pot�ebuju lep�� brn�n�.";
};


func int dia_addon_esteban_armor_condition()
{
	if(HUNO_ARMORCHEAP == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Pot�ebuju lep�� brn�n�.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Na co? V�dy� u� jedno m�. To ti mus� sta�it.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Zeptej se m� znovu a� spln� sv�j �kol.
	};
};


instance DIA_ADDON_ESTEBAN_AUFTRAG(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_auftrag_condition;
	information = dia_addon_esteban_auftrag_info;
	permanent = TRUE;
	description = "O tom �kolu ...";
};


func int dia_addon_esteban_auftrag_condition()
{
	if(((MIS_JUDAS == LOG_RUNNING) || (MIS_JUDAS == LOG_SUCCESS)) && (BODYGUARD_KILLER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//O tom �kolu ...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Poslouchej, je tady je�t� hodn� v�c� o kter� se mus�m starat.
	if(MIS_JUDAS == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//No jo, ale myslel jsem si, �e t� bude zaj�mat, kdo stoj� za t�m pokusem o vra�du ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kdo? �ekni mi jeho jm�no a moje str�e ho okam�it� pod�e�ou ...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//Fisk, ten obchodn�k, je za to zodpov�dn�. Te� je zrovna v hospod� a nas�v�. Nem� o ni�em ani tu�en� ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Dobr� pr�ce, k�mo. Str�e se o n�ho postaraj� ...
		AI_TurnToNPC(self,wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Ho�i, sly�eli jste. Jd�te a dosta�te Fiska.
		AI_TurnToNPC(self,other);
		BODYGUARD_KILLER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Vra� se a� zase n�co zjist� o tom pachateli.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ESTEBAN_AWAY(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_away_condition;
	information = dia_addon_esteban_away_info;
	permanent = FALSE;
	description = "A te�?";
};


func int dia_addon_esteban_away_condition()
{
	if(BODYGUARD_KILLER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_away_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//A te�?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Te�? J� ti �eknu, co bude te�.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk zem�e bolestivou smrt� a ka�d� v t�bo�e se o tom dozv�.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To bude varov�n�.
	b_startotherroutine(wache_01,"AMBUSH");
	b_startotherroutine(wache_02,"AMBUSH");
};


instance DIA_ADDON_ESTEBAN_STONE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_stone_condition;
	information = dia_addon_esteban_stone_info;
	permanent = FALSE;
	description = "Ok, d� mi te� ten �erven� k�men?";
};


func int dia_addon_esteban_stone_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_away) && (BODYGUARD_KILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_stone_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Ok, d� mi te� ten �erven� k�men?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Pracovals dob�e. N�kdo jako ty nem� v dole co napr�ci.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Bude� u�ite�n�j�� tady v t�bo�e. Z�stane� tady a bude� d�le pracovat pro m�.
};


instance DIA_ADDON_ESTEBAN_NOT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_not_condition;
	information = dia_addon_esteban_not_info;
	permanent = FALSE;
	description = "Budu o tom p�em��let.";
};


func int dia_addon_esteban_not_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_not_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Asi jsi zapomn�l, s k�m mluv�. Jsem jeden z p�edn�ch lid� tohoto t�bora a bude� d�lat, co ti �eknu.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A j� ��k�m, �e bude� d�lat pro m� a pro nikoho jin�ho. Rozum�?
};


instance DIA_ADDON_ESTEBAN_FIGHT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 6;
	condition = dia_addon_esteban_fight_condition;
	information = dia_addon_esteban_fight_info;
	permanent = FALSE;
	description = "To si d�l� srandu!";
};


func int dia_addon_esteban_fight_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//To si d�l� srandu! O tomhle na�e dohoda nebyla.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Vid�, je tady p�r lid�, co mohou d�lat takov� nab�dky jako tahle. Samoz�ejm�, pokud se ti nel�b�, m��e� kdykoliv odej�t z t�bora ...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A co takhle dodr�et sv�j slib a d�t mi, co mi pat��?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - je�t� jedno slovo a moje str�e se o tebe postaraj�.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(�kleb� se) Jak� str�e ... ?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co ... ? Aha, ch�pu ... sna�� se m� zradit. �patn� n�pad ...
	BODYGUARD_KILLER = FALSE;
	b_killnpc(wache_01);
	b_killnpc(wache_02);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_ESTEBAN_DUELL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_duell_condition;
	information = dia_addon_esteban_duell_info;
	permanent = FALSE;
	description = "Okam�it� mi dej ten �utr nebo si ho vezmu s�m!";
};


func int dia_addon_esteban_duell_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot) && (BODYGUARD_KILLER != TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_duell_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Okam�it� mi dej ten �utr nebo si ho vezmu s�m!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//�ivot t� u� mus� nudit. Tak jo, n�co s t�m ud�l�me...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

