
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
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, poj� sem!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Co chce�?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Tohle �dol� je nebezpe�n� m�sto a bez po��dn�ho vybaven� bude� mrtvej, ani se nenad�je�.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//P�edpokl�d�m, �e to po��dn� vybaven� najdu u TEBE.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//To se vsa�. Dokonce ti ho m��u prodat.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi m��e� nab�dnout?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mi m��e� nab�dnout?
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "Prod�v� taky informace?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Prod�v� taky informace?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//P�ijde na to. Pokud je dobr� cena, �eknu v�echno, co v�m.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmm... t�ko ��ct. Ale mysl�m, �e 50 zlat�ch za ka�dou poskytnutou informaci vypad� celkem slu�n�.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "Pot�ebuju n�jak� informace.";
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
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Pot�ebuju n�jak� informace.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 zlat�ch!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"To je pro m� moc drah�.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"Ano, tady.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To je pro m� moc drah�.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Ano, tady.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A te� mi �ekni...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o drac�ch.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...je�t� n�co o drac�ch.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o Hornick�m �dol�.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...je�t� n�co o Hornick�m �dol�.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o hradu.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o sk�etech.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...je�t� n�co o sk�etech.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//V�, rozmyslel jsem si to. Vra� mi moje pen�ze.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Jak je libo.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//�ekni mi n�co o drac�ch.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Draci jsou starobyl�, neuv��iteln� mocn� stvo�en�. Kdysi jich �ily tis�ce po cel�m sv�t�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Ale u� je p�es sto let, co n�kter�ho z nich n�kdo vid�l.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Jejich krev je hork� jako vrouc� olej. Kdy� se ti pod�vaj� do o��, prom�n� se tv� srdce v k�men. Tak jsem to alespo� sly�el.
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//�ekni mi o t�ch drac�ch v�c.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Ale ne v�ichni draci jsou takov�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//N�kte�� z nich m��ou celou zem pokr�t vrstvou ledu n�kolik stop tlustou.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Jin� d�vaj� p�ednost �ivotu v ba�in�ch nebo v sope�n�ch kr�terech.
	b_logentry(TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domn�v�, �e drak� je n�kolik druh�. N�kte�� si potrp� na chlad a vlhko, jin� zase d�vaj� p�ednost ohni.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//�ekni mi n�co o Hornick�m �dol�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//Hornick� �dol� v Khorinisu je d�ky magick� rud� zn�m� po cel� zemi.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Tyhle hory jsou jedin�m m�stem na sv�t�, kde se magick� ruda vyskytuje.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Zbran� vyroben� z t�hle rudy jsou prakticky nezni�iteln� a proniknou i t�m nejlep��m brn�n�m.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Je�t� p�ed n�kolika t�dny cel� �dol� obklopovala magick� bari�ra. Byla neproniknuteln�, a tak se nikdo nemohl dostat ven.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//�ekni mi o tom �dol� v�c.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//�dol� se b�hem t�ch n�kolika m�lo dn� zm�nilo k nepozn�n�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Kdy� p�i�li sk�eti, uk�zaly se i dal�� stv�ry. Nic podobn�ho tu nikdo nikdy p�edt�m nevid�l.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//��k� se, �e tu je�t� po��d z�stalo n�kolik osam�l�ch lovc�, ale nejsem si zrovna jist�, jestli taky z�stali na�ivu.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Vypad� to, jako by se do toho �dol� stahovala v�echna Beliarova stvo�en� temnot.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//�ekni mi n�co o hrad�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Le�� t�m�� uprost�ed Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//D��v, kdy� to �dol� je�t� slou�ilo jako v�zen�, m�li ve�kerou rudu odtamtud pod palcem rudn� baroni.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//�ekni mi n�co o sk�etech.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Ti sk�eti tu nejsou moc dlouho. Alespo� ti, co jsou te� p�ed hradem.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Ale nejde mi na rozum, �e jsou tak dob�e organizovan�. Sk�eti v�t�inou �to�� hlava nehlava a je jim jedno na co.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Tihle �ekaj� na ten spr�vn� �as. �ekaj�, ale my nev�me na co.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//�ekni mi o t�ch sk�etech v�c.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Ti sk�eti jsou pod velen�m elitn�ch v�le�n�k�. Maj� obrovskou s�lu a disponuj� v�born�mi zbrojemi. Je t�m�� nemo�n� je porazit.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Jednou jsem vid�l, jak jeden z nich slo�il vzrostl� dub jedin�m m�chnut�m sekery.
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
	description = "Zabil jsem v�echny draky!";
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
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabil jsem v�echny draky!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(sm�ch) Jasn�, a j� jsem paladin.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Mo�n� se ti poda�ilo zab�t jednoho, ale v�echny? Najdi si n�koho jin�ho, kdo bude ochoten ti v��it.
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

