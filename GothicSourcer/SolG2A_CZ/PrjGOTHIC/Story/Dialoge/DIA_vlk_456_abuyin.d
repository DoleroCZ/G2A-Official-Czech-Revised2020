
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(p�em�t�) ... Zvl�tn�. P�ipad� mi pov�dom�, cizin�e ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//No ... nesm�rn� jsou tajemstv� �asu a vesm�ru ... ah, omluv mou nezdvo�ilost, synu trp�livosti. Je�t� jsem t� ani nep�iv�tal ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//V�tej, p��teli. Sedni si na koberec a vychutnej si vodn� d�mku.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Jmenuju se Ab� D��n ibn D�ad�r ibn Omar Chal�d ben H�d�� al-�ar�d�. Jsem v�tcem a prorokem, astrologem a dodavatelem tab�ku.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "Jak� druh tab�ku nab�z�?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Jak� druh tab�ku nab�z�?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//M� d�mky jsou napln�ny pikantn�m a osv�uj�c�m jable�n�m tab�kem.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Poslu� si, kdykoli bude� cht�t, syne dobrodru�stv�.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "M� i jin� tab�k?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//M� i jin� tab�k?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Nab�z�m pouze ten nejlep�� tab�k. Tato jable�n� sm�s m� podobn� vlastnosti jako tab�k z m� domoviny, Ji�n�ch ostrov�.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Ale samoz�ejm� se nijak nebr�n�m vyzkou�et jak�koli jin� druh - pokud tedy n�kdo dok�e vyrobit opravdu dobr� tab�k.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//Jak se to d�l�?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Jako z�klad doporu�uju m�j jable�n� tab�k. A pak m��e� vyzkou�et kombinace s dal��mi ingrediencemi.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//V�roba prob�h� v alchymistick� kolon� a vy�aduje z�kladn� znalosti alchymie.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Kde se d� sehnat jable�n� tab�k?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Kde se d� sehnat jable�n� tab�k?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//D�m ti dv� d�vky. Je jen na tv� moudrosti, jak s n�m nalo��.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Pokud bude� cht�t dal��, zajdi p��mo za Zuridem, mistrem lektvar�. D�l� si sv�j vlastn� tab�k a tak� ho samoz�ejm� prod�v�.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Nech m� ten tab�k vyzkou�et.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Ne, ob�v�m se, �e mi tahle sm�s nebude vyhovovat. Ale mo�n� se ti poda�� nal�zt n�koho jin�ho, kdo ehm... ocen� takovou delikatesu.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "M�m novou sm�s tab�ku.";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//M�m novou sm�s tab�ku.
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_KRAUT,dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_PILZ,dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_DOPPEL,dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_HONIG,dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Nech m� ten tab�k vyzkou�et.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Chutn� to p��mo neuv��iteln�! Nikdy jsem v cel�m sv�m �ivot� nic lep��ho nekou�il!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Jak jsi tu sm�s p�ipravil?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Sm�chal jsem tab�k s medem.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//To se ti opravdu povedlo, ot�e um�n� m�sen�. Byl bych pot�en, kdybych sm�l sv� nuzn� d�mky naplnit tak vz�cnou sm�s�.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Tak je napl�.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//D�ky, synu velkorysosti. ��dn� jin� sm�s nem��e b�t tak dobr� jako tato. Koup�m od tebe ve�kerou sm�s tohoto druhu, co mi p�inese�.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "M�m pro tebe trochu medov�ho tab�ku.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//M�m pro tebe trochu medov�ho tab�ku.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Obchodovat s tebou je mi neskonal�m pot�en�m.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Zaj�mal by t� tenhle bal��ek drog?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Zaj�mal by t� tenhle bal��ek drog?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Bal�k bylinek - ne��kej, �e to je tr�va z ba�in. �, dej to pry�, synu lehkov�nosti.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Jestli m� s t�m chyt� m�stsk� str�e, po�lou m� rovnou za m��e - a ty nedopadne� o moc l�pe!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Pokud chce� tu z�sobu prodat, d�m ti jednu radu - opus� tohle m�sto.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Pokus se toho zbavit n�kde za hradbami. V�echno, co za to m��e� dostat tady, je spousta trabl�.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Dok�e� mi p�edpov�d�t budoucnost?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Dok�e� mi p�edpov�d�t budoucnost?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Za men�� poplatek jsem ti k slu�b�m, � ot�e velkorysosti.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Kolik chce�?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//Za pouh�ch 25 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Ale pamatuj - budoucnost je v�dycky nejist�. V�e, co mohu ud�lat, je zb�n� prol�tnout n�kolik �tr�k� �asu.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "P�edpov�z mi budoucnost (zaplatit 25 zla��k�).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//P�edpov�z mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Dobr�, hleda�i v�domost�. Te� se mus�m dostat do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"Jsem p�ipraven!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//�, ot�e minc�, ��d�m t� o 25 zlat�ch, za to, �e nahl�dnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(V transu)... Sk�eti... hl�daj� vstup... star� chodba... Hornick� �dol�...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(V transu)... Mu� v z��iv� zbroji... m�g... je s n�m tv�j p��tel... �ek� na tebe...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(V transu)... Ohe�! �tok... mocn� stvo�en�... plameny... mnoho... jich zem�e...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(v tranzu) ... co je to ... ? M�sto ... ruiny ... Quarhodron v Jharkendaru ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(v tranzu) ... naz�v� se ... Quarhodron v Jharknedru!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Je mi l�to, ale vize je u konce. U� tu nen� nic, co bych mohl spat�it.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "M��e� mi ud�lat je�t� dal�� proroctv�?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//M��e� mi ud�lat je�t� dal�� proroctv�?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//� synu z�hadn� budoucnosti, nen� v m� moci poodhalit z�voj �asu.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Pouze pokud mi �as se�le dal�� znamen�, budu schopen se do n�j pod�vat znovu.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//A kdy to bude?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//A� se budoucnost stane p��tomnost� a ty bude� pokra�ovat ve sv� cest�.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//M��e� mi p�edpov�d�t budoucnost?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Ano, �as postoupil a j� ti na opl�tku za n�kolik minc� sd�l�m proroctv�.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Kolik?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "M��e� v�tit mou budoucnost?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//Za pouh�ch 100 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "P�edpov�z mi budoucnost (zaplatit 100 zla��k�).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//P�edpov�z mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Dobr�, synu udatnosti. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"Jsem p�ipraven!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//� ot�e minc�, ��d�m t� o 100 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(V transu)... �old�k... bude t� pot�ebovat... stra�n� vra�da... Oko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(V transu)... zlov�stn� stoupenci... p�ich�zej�... hledaj� tebe... str�ce padne...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(V transu)... ale t�i se spoj�... jedin� pak z�sk�, co ti n�le��...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "M��e� v�tit mou budoucnost?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//Za pouh�ch 250 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "P�edpov�z mi budoucnost (zaplatit 250 zla��k�).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//P�edpov�z mi budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"Jsem p�ipraven!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//� ot�e minc�, ��d�m t� o 250 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(V transu)... mus� donutit... co nen� osud nikoho jin�ho, pouze tv�j...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(V transu)... p�es sn�h a ohe�... p�es led a plameny...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(V transu)... Mu�i v podivn� zbroji... ba�iny... je�t�rani... �ekaj� na tebe...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "M��e� v�tit mou budoucnost?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//Za pouh�ch 500 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "P�edpov�z mi budoucnost (zaplatit 500 zla��k�).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//P�edpov�z mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"Jsem p�ipraven!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//� ot�e minc�, ��d�m t� o 500 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(V transu)... m�sto v�domost�... jin� zem�... temn� m�sto �iroko daleko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(V transu)... udatn� spole�n�ci... mus� zvolit...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(V transu)... chr�m... le�� osamocen v Adanov� ��i... skryt� v mlze...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "M��e� v�tit mou budoucnost?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//Za pouh�ch 1000 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "P�edpov�z mi budoucnost (zaplatit 1000 zla��k�).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//P�edpov�z mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"Jsem p�ipraven!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//�, ot�e minc�, ��d�m t� o 1000 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(V transu)... Temnota pohlt� zemi... zlo zv�t�z�...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(V transu)... kr�l prohraje v�lku se sk�ety...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(V transu)... vr�t� se, ale nenalezne� klidu...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

