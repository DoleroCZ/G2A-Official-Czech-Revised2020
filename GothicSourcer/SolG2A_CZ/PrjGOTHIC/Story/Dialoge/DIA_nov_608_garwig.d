
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
	description = "Nedal by sis klobásu?";
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
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Nedal by sis klobásu?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Hmm - ta je výborná. Dìkuji ti mockrát, bratøe.
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
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Innos tì doprovázej... Nikdy jsem tì tu nevidìl, jsi tady nový?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Ano, právì jsem sem vstoupil.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//V tom pøípadì doufám, že si tady brzy zvykneš. Dej mi vìdìt, kdybys potøeboval s nìèím pomoci.
};


instance DIA_GARWIG_ROOM(C_INFO)
{
	npc = nov_608_garwig;
	nr = 5;
	condition = dia_garwig_room_condition;
	information = dia_garwig_room_info;
	permanent = FALSE;
	description = "Co je tohle za místnost?";
};


func int dia_garwig_room_condition()
{
	return TRUE;
};

func void dia_garwig_room_info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Co je tohle za místnost?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Zde se uchovávají svaté klášterní relikvie.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jaké relikvie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Je zde uloženo Innosovo kladivo a také Štít ohnì. To jsou nejvýznamnìjší relikvie Innosovy církve nacházející se mimo hlavní mìsto øíše.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "Povìz mi o tom kladivu.";
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
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Povìz mi o tom kladivu.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Je to posvátné Innosovo kladivo. Svatý Rhobar s ním skolil Kamenného strážce.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//Posvátné spisy øíkají, že Kamenný strážce byl nezranitelný. V bitvì stál jako vìž a zbranì jeho nepøátel se o jeho kamennou kùži lámaly.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//S Innosovým jménem na rtech se Rhobar na tuhle pøíšeru vrhl a znièil ji jediným mocným máchnutím svého kladiva.
};


instance DIA_GARWIG_SHIELD(C_INFO)
{
	npc = nov_608_garwig;
	nr = 98;
	condition = dia_garwig_shield_condition;
	information = dia_garwig_shield_info;
	permanent = FALSE;
	description = "Povìz mi o tom štítu.";
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
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Povìz mi o tom štítu.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Štít ohnì u sebe mìl Dominique v bitvì o Jižní ostrovy.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Moc tohoto štítu však už nikdy nikdo tøímat nebude - proto jsme jej pøitloukli ke zdi.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "Je tady také Innosovo oko?";
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
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Je tady také Innosovo oko?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Samozøejmì, že ne. Co to je za podivný nápad? Nikdo neví, kde je tenhle posvátný artefakt ukrytý.
};


instance DIA_GARWIG_SLEEP(C_INFO)
{
	npc = nov_608_garwig;
	nr = 23;
	condition = dia_garwig_sleep_condition;
	information = dia_garwig_sleep_info;
	permanent = TRUE;
	description = "Co tady dìláš?";
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
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jsem strážce posvátných artefaktù.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"Mùžu to za tebe na chvíli vzít?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"Proè je zapotøebí ty artefakty hlídat?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"To nikdy nespíš?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Mùžu to za tebe na chvíli vzít?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//To je nìjaká zkouška? Poslali tì mágové, abys mì pokoušel, co? No jasnì - prokoukl jsem to!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale já tímto testem projdu. Øekni svým mágùm, že zde stojím pevnì jako skála a že odolám všem pokušením, protože jsem dùvìryhodný strážce.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Proè je zapotøebí ty artefakty hlídat? Hrozí snad nebezpeèí, že by je mohl nìkdo ukradnout?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//Vážnì podivná pøedstava. Proè tì to napadlo?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Do kláštera mají vstup jen ti, kdo slouží Innosovi. A žádného skuteèného vìøícího by nìco podobného ani nenapadlo.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//To nikdy nespíš?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Ponìkud neobvyklá pøedstava. Samozøejmì, že nikdy nespím. Samotný Innos mi dal sílu, s jejíž pomocí se obejdu naprosto bez spánku.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Vždy jak jinak bych mohl plnit své postvátné povinnosti strážného?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"Opravdu NIKDY nespíš?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Opravdu NIKDY nespíš?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Ne. Pokud strážce usne, zklamal.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale já nezklamu, protože Innos mi dal sílu a výdrž, takže se nikdy neunavím.
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
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(rozzlobenì) Zlodìji! Pošlapal jsi jméno nejen svoje a moje, ale celého kláštera!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Za tuhle svatokrádež zaplatíš. A vùbec - VRA MI TO KLADIVO!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(zoufale) Kladivo zmizelo - jak se to jen mohlo stát?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Selhal jsem. Innos mì potrestá!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "Vracím zpátky to kladivo.";
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
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Vracím zpátky to kladivo.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Bídný zlodìji!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//Takže jsi to byl ty, kdo ho ukradl.
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Ale mnì nepøísluší, abych tì soudil. Innos rozhodne nad tvým osudem, a pak na tvá bedra uloží svùj trest!
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

