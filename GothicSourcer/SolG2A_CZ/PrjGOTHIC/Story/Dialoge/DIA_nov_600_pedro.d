
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Vítej v Innosovu klášteøe, cizinèe.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jsem bratr Pedro, poníenı sluebník Innose a stráce brány do svatého kláštera.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co potøebuješ?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Tady máš klobásu, bratøe.";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Tady máš klobásu, bratøe.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Je od tebe hezké, es na mì myslel. Kadı na mì vìtšinou zapomene.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Moná bys mi mohl dát ještì jednu.
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Na to zapomeò, pak bych jich nemìl dost.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No co, jedna klobáska - toho si nikdo nevšimne. Nìco za to dostaneš - vím o místì, kde rostou ohnivé kopøivy.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Kdy je doneseš Neorasovi, urèitì ti dá klíè od knihovny. Co na to øíkáš?
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"Fajn, tady máš další klobásu.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"Ne, na to zapomeò.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Fajn, tady máš další klobásu.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Tak. Nìkolik ohnivıch kopøiv roste nalevo a napravo od mùstku na druhém bøehu.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Ne, na to zapomeò.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chceš dobøe vycházet s Goraxem, co? S novımi novici to je vdycky stejné.
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "Chci vstoupit do kláštera.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chci vstoupit do kláštera.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Do kláštera mohou vstoupit jen sluebníci Innosovi.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Jestli se chceš pomodlit k Innosovi, mùeš si najít nìjakou svatyni u cesty. Na modlitby tam je dostateènı klid.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "Co musím udìlat, aby mì pøijali do kláštera?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co musím udìlat, aby mì pøijali do kláštera?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Pøístup do kláštera ti je zapovìzen - svou cestu sis ji zvolil.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Pokud chceš vstoupit do Bratrstva Innosova, musíš se nauèit a dodrovat pravidla kláštera.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Navíc ádame po kadém novém novici dárek Innosovi.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Ovci a 1000 zlaákù.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To je spousta zlata.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Je to na znamení toho, e zaèínáš novı ivot jako Innosùv sluebník. Kdy tì klášter pøijme, budou ti všechny tvoje pøedchozí høíchy odpuštìny.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale rozmysli si to - jakmile se jednou staneš Innosovım sluebníkem, nemùeš to vzít zpìt.
		SC_KNOWSKLOSTERTRIBUT = TRUE;
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Chci-li se stát novicem v Innosovì klášteøe, potøebuji ovci a velkou èástku penìz.");
	};
};


instance DIA_ADDON_PEDRO_STATUETTE(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_condition;
	information = dia_addon_pedro_statuette_info;
	permanent = FALSE;
	description = "Mám tady tuhle sošku...";
};


func int dia_addon_pedro_statuette_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_pedro_rules) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//Mám tady tuhle sošku. Mám dojem, e ji postrádají v klášteøe.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//Mùu teï projít?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Take, za tohoto stavu vìcí u ti nic nebrání stát se novicem.
		Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Novic Pedro mì pustil do kláštera, protoe jsem mìl tu chybìjící sošku. Mìl bych ji doruèit nìkomu v klášteøe.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Bojím se ale, e dokonce i s tímto vzácnım skvostem tì nemùu pøijmout.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//U jsi se rozhodl pro jinou cestu. Cesta do kláštera pro tebe zùstává uzavøena.
	};
};


instance DIA_ADDON_PEDRO_STATUETTE_ABGEBEN(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_abgeben_condition;
	information = dia_addon_pedro_statuette_abgeben_info;
	permanent = FALSE;
	description = "Mùu ti tu sošku tady nechat?";
};


func int dia_addon_pedro_statuette_abgeben_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && Npc_KnowsInfo(other,dia_addon_pedro_statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_abgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//Mùu ti tu sošku tady nechat?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Samozøejmì, okamitì se o ni postarám. Díky za tvùj nesobeckı skutek.
	MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "Podle jakıch pravidel ijete?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Podle jakıch pravidel ijete?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos je bùh pravdy a øádu, take NIKDY nesmíš zalhat nebo spáchat nìjakı zloèin.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Pokud se prohøešíš proti svému bratru nebo ukradneš nìco z našich vìcí, zaplatíš za to.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos je také bùh vlády a ohnì.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jakoto novic musíš prokazovat POSLUŠNOST a ÚCTU všem ohnivım mágùm.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Aha.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Dále je POVINNOSTÍ novice vykonávat v klášteøe všechny práce pro dobro našeho spoleèenství.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Pokud jsi pøipraven se tìmito pravidly øídit a máš dar pro Innose, rádi tì pøijmeme do kláštera jako novice.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "Chci se stát novicem.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_dia_pedro_aufnahme_choice()
{
	Info_ClearChoices(dia_pedro_aufnahme);
	Info_AddChoice(dia_pedro_aufnahme,"Ještì si to nechám projít hlavou.",dia_pedro_aufnahme_no);
	Info_AddChoice(dia_pedro_aufnahme,"Ano, chci zasvìtit svùj ivot slubì Innosovi.",dia_pedro_aufnahme_yes);
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chci se stát novicem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Svou cestu sis ji zvolil. Cesta magie ti je uzavøena.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Je to opravdu tvoje pøání? Uvìdom si ale jednu vìc. Všechny ostatní cesty pro tebe zùstanou navdy uzavøeny.
		b_dia_pedro_aufnahme_choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Vidím, es pøinesl poadovanı dar. Pokud opravdu chceš, mùeš se stát novicem.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Ale pokud se tak rozhodneš, u není cesty zpìt - zva dobøe, zda je toto cesta, po ní touíš!
		b_dia_pedro_aufnahme_choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nepøinesl jsi poadovanı dar.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Ano, chci zasvìtit svùj ivot slubì Innosovi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//V tom pøípadì vítej, bratøe. Dám ti klíè ke klášterní bránì.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Na dùkaz své svobodné vùle sám otevøi bránu a projdi dovnitø.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Nyní jsi novic. Nos tento šat na znamení, e jsi teï èlenem bratrstva.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//A budeš v klášteøe, jdi za Parlanem. Od nynìjška se bude starat o to, abys mìl, co potøebuješ.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Budou teï mé prohøešky odpuštìny?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Ještì ne. Promluv si s mistrem Parlanem. Poehná ti a oèistí tì od høíchù.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,itke_innos_mis,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = TRUE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON = TRUE;
		LIESEL_GIVEAWAY = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Ještì si to nechám projít hlavou.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Vra se, a budeš pøipraven.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Povìz mi o ivotì v klášteøe.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Povìz mi o ivotì v klášteøe.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//ijeme v klášteøe, abychom slouili Innosovi. My novicové vykonáváme všechny práce a kdykoliv mùeme, studujeme posvátné knihy.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Na nás dohlíejí mágové a ti zase zkoumají umìní magie.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

