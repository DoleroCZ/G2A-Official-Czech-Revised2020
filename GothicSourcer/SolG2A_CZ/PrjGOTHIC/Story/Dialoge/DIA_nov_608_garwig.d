
instance DIA_GARWIG_EXIT(C_INFO)
{
	npc = nov_608_garwig;
	nr = 999;
	condition = dia_garwig_exit_condition;
	information = dia_garwig_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garwig_exit_condition()
{
	return TRUE;
};

func void dia_garwig_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARWIG_WURST(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_wurst_condition;
	information = dia_garwig_wurst_info;
	permanent = FALSE;
	description = "Nedal by sis klob�su?";
};


func int dia_garwig_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_garwig_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Nedal by sis klob�su?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Hmm - ta je v�born�. D�kuji ti mockr�t, brat�e.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_GARWIG_HELLO(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_hello_condition;
	information = dia_garwig_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garwig_hello_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_hello_info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Innos t� doprov�zej... Nikdy jsem t� tu nevid�l, jsi tady nov�?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Ano, pr�v� jsem sem vstoupil.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//V tom p��pad� douf�m, �e si tady brzy zvykne�. Dej mi v�d�t, kdybys pot�eboval s n���m pomoci.
};


instance DIA_GARWIG_ROOM(C_INFO)
{
	npc = nov_608_garwig;
	nr = 5;
	condition = dia_garwig_room_condition;
	information = dia_garwig_room_info;
	permanent = FALSE;
	description = "Co je tohle za m�stnost?";
};


func int dia_garwig_room_condition()
{
	return TRUE;
};

func void dia_garwig_room_info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Co je tohle za m�stnost?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Zde se uchov�vaj� svat� kl�tern� relikvie.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jak� relikvie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Je zde ulo�eno Innosovo kladivo a tak� �t�t ohn�. To jsou nejv�znamn�j�� relikvie Innosovy c�rkve nach�zej�c� se mimo hlavn� m�sto ��e.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "Pov�z mi o tom kladivu.";
};


func int dia_garwig_hammer_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_hammer_info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Pov�z mi o tom kladivu.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Je to posv�tn� Innosovo kladivo. Svat� Rhobar s n�m skolil Kamenn�ho str�ce.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//Posv�tn� spisy ��kaj�, �e Kamenn� str�ce byl nezraniteln�. V bitv� st�l jako v� a zbran� jeho nep��tel se o jeho kamennou k��i l�maly.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//S Innosov�m jm�nem na rtech se Rhobar na tuhle p��eru vrhl a zni�il ji jedin�m mocn�m m�chnut�m sv�ho kladiva.
};


instance DIA_GARWIG_SHIELD(C_INFO)
{
	npc = nov_608_garwig;
	nr = 98;
	condition = dia_garwig_shield_condition;
	information = dia_garwig_shield_info;
	permanent = FALSE;
	description = "Pov�z mi o tom �t�tu.";
};


func int dia_garwig_shield_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_shield_info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Pov�z mi o tom �t�tu.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//�t�t ohn� u sebe m�l Dominique v bitv� o Ji�n� ostrovy.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Moc tohoto �t�tu v�ak u� nikdy nikdo t��mat nebude - proto jsme jej p�itloukli ke zdi.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "Je tady tak� Innosovo oko?";
};


func int dia_garwig_auge_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room) && (KAPITEL <= 2))
	{
		return TRUE;
	};
};

func void dia_garwig_auge_info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Je tady tak� Innosovo oko?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Samoz�ejm�, �e ne. Co to je za podivn� n�pad? Nikdo nev�, kde je tenhle posv�tn� artefakt ukryt�.
};


instance DIA_GARWIG_SLEEP(C_INFO)
{
	npc = nov_608_garwig;
	nr = 23;
	condition = dia_garwig_sleep_condition;
	information = dia_garwig_sleep_info;
	permanent = TRUE;
	description = "Co tady d�l�?";
};


func int dia_garwig_sleep_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_sleep_info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jsem str�ce posv�tn�ch artefakt�.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"M��u to za tebe na chv�li vz�t?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"Pro� je zapot�eb� ty artefakty hl�dat?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"To nikdy nesp�?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//M��u to za tebe na chv�li vz�t?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//To je n�jak� zkou�ka? Poslali t� m�gov�, abys m� pokou�el, co? No jasn� - prokoukl jsem to!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale j� t�mto testem projdu. �ekni sv�m m�g�m, �e zde stoj�m pevn� jako sk�la a �e odol�m v�em poku�en�m, proto�e jsem d�v�ryhodn� str�ce.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Pro� je zapot�eb� ty artefakty hl�dat? Hroz� snad nebezpe��, �e by je mohl n�kdo ukradnout?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//V�n� podivn� p�edstava. Pro� t� to napadlo?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Do kl�tera maj� vstup jen ti, kdo slou�� Innosovi. A ��dn�ho skute�n�ho v���c�ho by n�co podobn�ho ani nenapadlo.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//To nikdy nesp�?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Pon�kud neobvykl� p�edstava. Samoz�ejm�, �e nikdy nesp�m. Samotn� Innos mi dal s�lu, s jej� pomoc� se obejdu naprosto bez sp�nku.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//V�dy� jak jinak bych mohl plnit sv� postv�tn� povinnosti str�n�ho?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"Opravdu NIKDY nesp�?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Opravdu NIKDY nesp�?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Ne. Pokud str�ce usne, zklamal.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale j� nezklamu, proto�e Innos mi dal s�lu a v�dr�, tak�e se nikdy neunav�m.
};


instance DIA_GARWIG_THIEF(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_thief_condition;
	information = dia_garwig_thief_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garwig_thief_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_HasItems(hero,holy_hammer_mis) == 1))
	{
		return TRUE;
	};
};

func void dia_garwig_thief_info()
{
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(rozzloben�) Zlod�ji! Po�lapal jsi jm�no nejen svoje a moje, ale cel�ho kl�tera!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Za tuhle svatokr�de� zaplat�. A v�bec - VRA� MI TO KLADIVO!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(zoufale) Kladivo zmizelo - jak se to jen mohlo st�t?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Selhal jsem. Innos m� potrest�!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "Vrac�m zp�tky to kladivo.";
};


func int dia_garwig_abgeben_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_garwig_abgeben_info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Vrac�m zp�tky to kladivo.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//B�dn� zlod�ji!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//Tak�e jsi to byl ty, kdo ho ukradl.
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Ale mn� nep��slu��, abych t� soudil. Innos rozhodne nad tv�m osudem, a pak na tv� bedra ulo�� sv�j trest!
	b_giveinvitems(other,self,holy_hammer_mis,1);
	HAMMER_TAKEN = FALSE;
};


instance DIA_GARWIG_PICKPOCKET(C_INFO)
{
	npc = nov_608_garwig;
	nr = 900;
	condition = dia_garwig_pickpocket_condition;
	information = dia_garwig_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_garwig_pickpocket_condition()
{
	return c_beklauen(52,80);
};

func void dia_garwig_pickpocket_info()
{
	Info_ClearChoices(dia_garwig_pickpocket);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_BACK,dia_garwig_pickpocket_back);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_PICKPOCKET,dia_garwig_pickpocket_doit);
};

func void dia_garwig_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_garwig_pickpocket);
};

func void dia_garwig_pickpocket_back()
{
	Info_ClearChoices(dia_garwig_pickpocket);
};

