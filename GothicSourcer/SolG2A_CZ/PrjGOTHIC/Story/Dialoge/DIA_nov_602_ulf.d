
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Co tady d�l�?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Sna��m se splnit �koly, kter� mi dal kl�ter ke tv� spokojenosti.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Jsem novic z kl�tera. Vykon�v�m poch�zky pro m�gy a tak� pro paladiny.
		AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//Z�sobil jsem t�i hostinsk� ve m�st� v�nem z kl�tera.
	};
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Kdo jsou ti t�i kr�m��i?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Kdo jsou ti t�i kr�m��i?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Jeden z nich je ten dobr� mu� tady za barem.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Pak je tady Caragon, kter� m� svou tavernu na chr�mov�m n�m�st�, a Kardif, majitel n�levny v p��stavn� �tvrti.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o kl�teru?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Co mi m��e� ��ct o kl�teru?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//My novicov� hled�me osv�cen� v modlitb�ch k Innosovi a od m�g� se u��me z�klad�m v�ry.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//T�m, �e jim slou��me, slou��me Innosovi a p�ipravujeme se na splynut� s Ohn�m.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Odve� m� do kl�tera.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Odve� m� do kl�tera.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Na to zapome�. V�, kolika p��er�m jsem se musel cestou sem vyh�bat?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Kdy� pomysl�m na v�echny ty vlky, sk�ety a dal�� potvory, jsem r�d, �e u� odsud nemus�m.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Krom� toho se do kl�tera stejn� nedostane�.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Pro� ne?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Vstup je povolen jen m�g�m, paladin�m a novic�m.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "Jak se m��u st�t novicem?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Jak se m��u st�t novicem?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Kdy� �lov�k c�t� hlubokou touhu...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Hele - �ekni mi jenom ty z�kladn� podm�nky.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Mus� p�in�st dar. Ovci a...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"Chci-li se st�t novicem v Innosov� svatyni, pot�ebuji ovci a 1000 zla��k�.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "Jak m�m asi sehnat tolik pen�z?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Jak m�m asi sehnat tolik pen�z?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Proto�e evidentn� nezn� nikoho, kdo by tu ��stku slo�il za tebe, nezb�v� ti, ne� za��t pracovat.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Kde najdu ovci?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Kde najdu ovci?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//U farm���, pochopiteln�. Ale nedostane� ji jen tak.
	b_logentry(TOPIC_KLOSTER,"Ovci mohu z�skat od n�kter�ho sedl�ka.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hele, v�, co se stalo?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Byl jsi vybr�n.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//No bezva. P�esn� ve chv�li, kdy si chci loknout p�kn� vyhlazen�ho piva, vyno�� se zpoza rohu Daron a �ekne mi, �e jsem byl vyvolen�.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Kdo by to kdy �ekl? V�le Innosova je nevyzpytateln�. A co t� sem p�iv�d�?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Po��dal jsem o Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//To p�ece nen� mo�n�?! Chlap�e, jsi zatracen� odv�n�. Znamen� to tak�, �e bude� hledat "to, co v���c� najde za cestou"?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Vypad� to tak.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "U� jsi n�co na�el?";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//U� jsi n�co na�el?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//No, jenom jsem sledoval Agona - ale ztratil jsem ho.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//A te�... co to ��kaj�? Sleduj Innosova znamen�. Nerozum�m tak �pln� tomu kousku o cest�.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//No co, budu hledat d�l.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Hej, ty m� sleduje�?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hej, ty m� sleduje�?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Nesmysl. Prost� jen n�hodou jdu stejn�m sm�rem.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "P�esta� za mnou b�hat!";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//P�esta� za mnou b�hat!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//J� t� nesleduji. Ale pros�m, pokud si to mysl�, p�jdu tedy jinudy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Tak�e se op�t setk�v�me. V�, p�em��lel jsem. V���m, �e touha st�t se m�gem je ve mn� hluboko zako�en�n�.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Ale no tak - ned�lej to.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//Nem�m na v�b�r. �ivot novice nen� pro m�.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Prost� se mus�m st�t m�gem. Potom bude v�echno v po��dku. A te� si vezmu to, k �emu jsem opr�vn�n.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//M� n�jak� posledn� slova?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"P�esta�, nechci t� zab�t.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Poj�me p��mo k j�dru v�ci - pot�ebuji se dostat zp�tky do kl�tera.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"Nem� n�co ke kou�en�?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//P�esta�, nechci t� zab�t.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Velk� huba. Ale v�, �e proti mn� nem� �anci! Tak jedem!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Poj�me p��mo k j�dru v�ci - pot�ebuji se dostat zp�tky do kl�tera.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//U� nikam nep�jde�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Nem� n�co ke kou�en�?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//M� �t�st�. N�co bych tu m�l.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Poj�me na to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Hele, v�n� si mysl�, �e jdeme dob�e? N�kde tady �ije trol.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Mysl�m, �e bychom se rad�i m�li vydat jin�m sm�rem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};

