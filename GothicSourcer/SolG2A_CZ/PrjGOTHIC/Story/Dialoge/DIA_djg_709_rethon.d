
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
	description = "Co tady d�l�?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//P�ipravuju se na boj. Je�t� n�co?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "Proti komu se chyst� bojovat?";
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
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//Proti komu se chyst� bojovat?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//��kal jsem si, �e vl�tnu na paladiny a nakopu jim ty jejich tlust� zadky.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Idiote. Proti drak�m, samoz�ejm�. Cos myslel?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Copak o tob� paladinov� nev�d�?";
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
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Copak o tob� paladinov� nev�d�?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Nesmysl. Ty maj� �pln� jin� probl�my. V�t�ina z nich je r�da, �e �ije.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Mor�lka t�ch chlap� nen� nic moc. To bude jejich konec.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Jen se pod�vej, jak si sna�� d�t dohromady ty nal�man� me�e, se kter�mi se cht�j� vydat do boje.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Ka�dej rozumnej v�le�n�k by okam�it� dezertoval.
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
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Svoj� jednotku? Nem�l jsem ��dnou jednotku. Jsem sb�ratel trofej�.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Kdy� bych p�i�el dom� s pr�zdn�ma rukama, tak teda nev�m, pro� bych to vlastn� d�lal. Tak�e nem��u pot�ebovat nikoho dal��ho.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "U� jsi vid�l n�jak�ho draka?";
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
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//U� jsi vid�l n�jak�ho draka?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Ne. Chci si nejd��v naost�it zbra�, ne� na n�j vyraz�m.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "Neboj� se, �e t� kv�li tomu n�kdo napadne?";
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
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//Neboj� se, �e t� kv�li tomu n�kdo napadne?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Co? Kdo? Sylvio?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Tv�j ��f si asi mysl�, �e se tady m��e jen tak zab�jet, co?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Nepat��m k Sylviov�m lidem. Pracuju jen s�m pro sebe.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//No, tak dobr�. Zapome�, �e jsem n�co �ekl.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Vid�l jsi ty hastro�e, co m�l s sebou?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Sylvio bude r�d, kdy� se odsud dostane vcelku.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Ne, to asi nebude. Je mrtv�.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Taky dob�e.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"Nevypad�, �e bys ho m�l zrovna v l�sce.",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"Tak kde je Sylvio te�?",dia_rethon_angst_wosylvio);
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
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//Mysl� tady na hrad�? Jo, to byl. Ale jenom chvilku.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Promluvil si tu s n�kolika lidmi a pak znovu ode�el.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Nevypad�, �e bys ho m�l zrovna v l�sce.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Co�e, m�l bych ho m�t r�d? Nejsem py�n� ani na to, �e ho zn�m.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//Sylvio nem� ��dn� p��tele. Pot�ebuje lidi, co za n�m p�jdou, a je �pln� jedno, co za lidi to bude.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//To nen� nic pro m�. Pracuju s�m.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//Tak kde je Sylvio te�?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Ti paladinov� tady ��kali n�co o ledov�m drakovi na z�pad�. �dajn� je to ten nejmocn�j�� a nejnebezpe�n�j�� drak ze v�ech drak�.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//M�ls vid�t, jak Sylviovi zaz��ily o�i, kdy� o tom usly�el. Nen� tak t�k� uhodnout, kam �el.
	b_logentry(TOPIC_DRACHENJAGD,"Drakobijce Rethon mumlal cosi o ledov�m drakovi.");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio byl zalezl� na hrad� a pak se vydal hledat ledov�ho draka.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "M��e� mi pomoct s vylep�en�m m� zbran�?";
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
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//M��e� mi pomoct s vylep�en�m m� zbran�?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Vylep�it? Nejl�p ud�l�, kdy� si koup� n�co nov�ho a ten sv�j starej kr�m zahod�.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Mo�n� bych pro tebe n�co m�l. M� z�jem?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mi m��e� nab�dnout?";
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
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Co mi m��e� nab�dnout?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Chlape, pod�vej, jak m�m vyprodanej sklad. Te� neprod�v�m zbran� nikomu jin�mu ne� paladin�m.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//Pro m�gy toho v�n� moc nem�m, ale i tak se m��e� pod�vat.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//M�m dojem, �e m�m to, co pot�ebuje�, p��teli.
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

