
var int lothar_imov;

instance DIA_LOTHAR_EXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_exit_condition;
	information = dia_lothar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lothar_exit_condition()
{
	if(LOTHAR_IMOV == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_FIRSTEXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_firstexit_condition;
	information = dia_lothar_firstexit_info;
	permanent = TRUE;
	description = "Musím jít! (KONEC)";
};


func int dia_lothar_firstexit_condition()
{
	if(LOTHAR_IMOV == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_firstexit_info()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//Musím jít!
	if(LOTHAR_REGELN == FALSE)
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//Poèkej! Ještì neznáš mìstské zákony!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Pozdìji.
	}
	else
	{
		if((PLAYER_TALKEDABOUTDRAGONS == TRUE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//Ještì JEDNOU uslyším, že lidem vyprávíš o dracích, a budeš mít velké problémy. Vyjádøil jsem se jasnì?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//Dokud jsi v Khorinisu, jsi v bezpeèí.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//Na mìsto teï dohlížejí královští paladini!
			};
		};
		LOTHAR_IMOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	if(CANTHAR_INSTADT == FALSE)
	{
		Npc_ExchangeRoutine(canthar,"START");
		CANTHAR_INSTADT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_HALLO(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_hallo_condition;
	information = dia_lothar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_hallo_info()
{
	AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//Stùj, cizinèe!
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//Nevidìl jsem tì procházet branou.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//A?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//A stráže u druhé brány mají zákaz vpouštìt do mìsta neznámé osoby.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Noooo...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//Budu si s tìma dvìma muset promluvit!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//Ale mezi námi:
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Jsem Lothar. Královský paladin a skromný služebník Innose, tvého Pána.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//Náš velitel, lord Hagen, mì povìøil úkolem vysvìtlit všem pøíchozím nové zákony mìsta, které se vztahují na všechny zdejší obyvatele.
	AI_Output(self,other,"DIA_Addon_Lothar_Hallo_01_00");	//Už nìjakou dobu lidì ve mìstì mizí. Dávej si bacha, a tak taky neskonèíš.
	if(Npc_KnowsInfo(other,dia_lester_send_xardas))
	{
		b_startotherroutine(lester,"XARDAS");
	};
};


instance DIA_LOTHAR_MESSAGE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_message_condition;
	information = dia_lothar_message_info;
	permanent = FALSE;
	description = "Mám dùležitý vzkaz pro velitele paladinù!";
};


func int dia_lothar_message_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_message_info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//Mám dùležitý vzkaz pro velitele paladinù!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//Ctihodný lord Hagen nikoho nepøijímá.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//Za všechny vìci týkající se bìžných obèanù je zodpovìdný lord Andre, velitel mìstské stráže.
};


instance DIA_LOTHAR_EYEINNOS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_eyeinnos_condition;
	information = dia_lothar_eyeinnos_info;
	permanent = FALSE;
	description = "Pøišel jsem si pro Innosovo oko!";
};


func int dia_lothar_eyeinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_eyeinnos_info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//Pøišel jsem si pro Innosovo oko!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//Oko spadá pod rozhodnutí lorda Hagena. Promluv si s ním.
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//Posvátné Innosovo oko! Jak to, že o nìm víš?! Nejsi èlenem našeho øádu!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//Øekl mi o nìm jeden mág.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//Netuším, co tím zamýšlel, když ti svìøil jedno z tajemstvích našeho øádu.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//Ale urèitì nechtìl, abys na nìj právì TY vztáhl ruku.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Ale...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//Už o tom nechci slyšet!
		if(PLAYER_TALKEDABOUTDRAGONS == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//Nejdøív zaèneš s báchorkami o dracích, a teï tohle - neuvìøitelné!
		};
	};
};


instance DIA_LOTHAR_DRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_dragons_condition;
	information = dia_lothar_dragons_info;
	permanent = FALSE;
	description = "Poslouchej - mìsto ohrožují draci!";
};


func int dia_lothar_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_dragons_info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//Poslouchej - mìsto ohrožují draci!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//To není možné!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//Další šílenec!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//Už takhle máme ve mìstì dost nepokojù. Nepotøebujeme žádného troubu, který bude dìsit lid povídaèkami o dracích!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//Posledního èlovìka, který si takovéhle vìci vymýšlel, jsem dal okamžitì zavøít a poslat do Hornického údolí s vìzeòským transportem. Takže pozor na jazyk!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//Nepotøebujeme nikoho, kdo by nám mezi lidmi šíøil paniku!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//Hodnì jsem o tom slyšel. Ale tìžko tomu uvìøit.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//Bude lepší, když si to necháš pro sebe. Musíme pøedejít tomu, aby se mezi lidem šíøil strach a panika.
	};
	PLAYER_TALKEDABOUTDRAGONS = TRUE;
};


instance DIA_ADDON_LOTHAR_ORNAMENT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_addon_lothar_ornament_condition;
	information = dia_addon_lothar_ornament_info;
	description = "Víš nìco o kamenech, které jsou v kamenném kruhu za Lobartovou farmou?";
};


func int dia_addon_lothar_ornament_condition()
{
	if((lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_lothar_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_15_00");	//Víš nìco o kamenech, které jsou v kamenném kruhu za Lobartovou farmou?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_01");	//Jistì, že ano. Znièili jsme je. Znepokojovaly blízké farmáøe.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_02");	//Proè se ptáš?
	Info_ClearChoices(dia_addon_lothar_ornament);
	Info_AddChoice(dia_addon_lothar_ornament,"Hledám kovový zlomek z kruhového ornamentu.",dia_addon_lothar_ornament_suche);
	Info_AddChoice(dia_addon_lothar_ornament,"Shledáváš to normální?",dia_addon_lothar_ornament_normal);
};

func void dia_addon_lothar_ornament_normal()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_00");	//Shledáváš to normální?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_01");	//Myslíš to kamenné monstrum?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_02");	//Pokud vím, tak tím se zabývají mágové Vody.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_03");	//Nechci o tom vìdìt víc. My se zajímáme zde o mìsto a o Hornické údolí.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//Dobrá.
};

func void dia_addon_lothar_ornament_suche()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_00");	//Hledám kovový zlomek z kruhového ornamentu.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_01");	//Mìlo by to být nìkde u kamenného kruhu blízko Lobartovy farmy.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_02");	//Ano, nìco tam bylo. Kámen blízko nìj. Vzal jsem ho na magické runy.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_03");	//Dal jsem ho lordu Hagenovi. A nevím, co s ním udìlal on.
};


instance DIA_LOTHAR_WHODRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_whodragons_condition;
	information = dia_lothar_whodragons_info;
	permanent = FALSE;
	description = "Nìkdo už o pøítomnosti drakù mluvil?";
};


func int dia_lothar_whodragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_dragons) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_whodragons_info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//Nìkdo už o pøítomnosti drakù mluvil?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Ano. Ten chlapík se jmenoval Diego. Alespoò mám ten pocit.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(výhrùžnì) Varoval jsem ho - zrovna jako tebe! Ale ten blázen si nedal pokoj a poøád otravoval!
	};
};


instance DIA_LOTHAR_REGELN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_regeln_condition;
	information = dia_lothar_regeln_info;
	permanent = FALSE;
	description = "Dobrá - vysvìtli mi zákony mìsta!";
};


func int dia_lothar_regeln_condition()
{
	return TRUE;
};

func void dia_lothar_regeln_info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(s mírným povzdechem) Dobrá - vysvìtli mi zákony mìsta!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//Za prvé: Ctihodný paladin lord Hagen bydlí se svými jednotkami v horní èásti mìsta.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//Proto tam mají pøístup pouze ctihodní obèané.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//Za druhé: V radnici v horní èásti mìsta je teï velitelství paladinù. Mají do ní pøístup pouze samotní paladinové a èlenové domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//A za tøetí: Každý, kdo je obvinìný z nìjakého zloèinu, se musí ospravedlnit pøed velitelem domobrany.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//Nìjaké otázky?
	LOTHAR_REGELN = TRUE;
};


instance DIA_ADDON_LOTHAR_MISSINGPEOPLE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_addon_lothar_missingpeople_condition;
	information = dia_addon_lothar_missingpeople_info;
	description = "Obyvatelé mìsta mizí?";
};


func int dia_addon_lothar_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == FALSE) && Npc_KnowsInfo(other,dia_lothar_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_lothar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_MissingPeople_15_00");	//Obyvatelé mìsta mizí?
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_01");	//Ano a zdá se, že èím dál èastìji.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_02");	//Je mrzuté, že domobrana nebyla schopna tuto záhadu vyøešit.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_03");	//Je pochopitelné, že obyvatelé mìsta jsou velmi nedùvìøiví k cizincùm.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_04");	//Tak ve mìstì zbyteènì neupoutávej pozornost sám na sebe, dobrá?
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
};


instance DIA_LOTHAR_HOWCITIZEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 4;
	condition = dia_lothar_howcitizen_condition;
	information = dia_lothar_howcitizen_info;
	permanent = FALSE;
	description = "Jak se mohu JÁ stát obèanem mìsta?";
};


func int dia_lothar_howcitizen_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_howcitizen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//Jak se mohu JÁ stát obèanem mìsta?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//Za obèany mìsta jsou považováni jen ti, kdo mají stálé zamìstnání!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//Ale neøekl bych, že by k setkání s lordem Hagenem staèilo být obèanem mìsta!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//Jako obèan máš pøístup do horní èásti mìsta, nic víc!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//Na radnici mùžeš být vpuštìn jen v pøípadì, že se staneš èlenem domobrany!
};


instance DIA_LOTHAR_WOARBEIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_lothar_woarbeit_condition;
	information = dia_lothar_woarbeit_info;
	permanent = FALSE;
	description = "Kde bych mohl najít práci?";
};


func int dia_lothar_woarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_howcitizen) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_woarbeit_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//Kde bych mohl najít práci?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Musíš se pøihlásit jako uèedník k jednomu z mistrù tady v dolní èásti mìsta.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//Jakmile tì mistr pøijme, stane se z tebe obèan.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//Musí s tím ale souhlasit i ostatní mistøi, tak velí zvyk tady v Khorinisu.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//Pokud sis pohrával s myšlenkou, že najdeš nìjakou práci v pøístavu, tak na to zase rychle zapomeò!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//Žije tam spodina. Ani tam nechoï, nebo toho budeš litovat!
};


instance DIA_LOTHAR_TOOV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 6;
	condition = dia_lothar_toov_condition;
	information = dia_lothar_toov_info;
	permanent = FALSE;
	description = "Jak se dostanu do horní èásti mìsta?";
};


func int dia_lothar_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_toov_info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//Jak se dostanu do horní èásti mìsta?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//No tak, posloucháš mì vùbec?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//Nejsi obèanem tohoto mìsta. Mùžeš si tu zacházku ušetøit - stráže tì dovnitø nepustí.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//Do celé té oblasti za vnitøní branou máš vstup zakázán!
};


instance DIA_LOTHAR_TOMILIZ(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_tomiliz_condition;
	information = dia_lothar_tomiliz_info;
	permanent = FALSE;
	description = "Jak se mohu pøidat k domobranì?";
};


func int dia_lothar_tomiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_tomiliz_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//Jak se mohu pøidat k domobranì?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//Na pøíkaz lorda Hagena mohou do domobrany vstoupit jen obèané mìsta.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Aha.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//Pokud by ses chtìl dozvìdìt nìco víc, promluv si v kasárnách s lordem Andrem.
};


instance DIA_LOTHAR_TOPALADINS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_topaladins_condition;
	information = dia_lothar_topaladins_info;
	permanent = FALSE;
	description = "Co musím udìlat, abych mìl takové brnìní jako ty?";
};


func int dia_lothar_topaladins_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_tomiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lothar_topaladins_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//Co musím udìlat, abych mìl takové brnìní jako ty?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(køièí) Cože? Vždy ani nejsi èlenem domobrany!
	};
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//Nejsi dokonce ani OBÈAN!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//Jak tì mùže vùbec napadnout, že bys mohl nosit brnìní PALADINA?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//Tuhle èest si vysloužilo jen nìkolik málo èlenù domobrany, a to za své neobyèejnì odvážné skutky.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(stroze) Pokud by ses chtìl stát paladinem, máš pøed sebou hodnì dlouhou cestu, chlapèe!
};


instance DIA_LOTHAR_WOANDRE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 8;
	condition = dia_lothar_woandre_condition;
	information = dia_lothar_woandre_info;
	permanent = FALSE;
	description = "Kde najdu velitele mìstské stráže?";
};


func int dia_lothar_woandre_condition()
{
	if((Npc_KnowsInfo(other,dia_lothar_regeln) || Npc_KnowsInfo(other,dia_lothar_message)) && (andre.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_woandre_info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//Kde najdu velitele mìstské stráže?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//Lord Andre je v kasárnách na druhém konci mìsta.
};


instance DIA_LOTHAR_SCHLAFEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 9;
	condition = dia_lothar_schlafen_condition;
	information = dia_lothar_schlafen_info;
	permanent = FALSE;
	description = "Kde bych tu mohl strávit noc?";
};


func int dia_lothar_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lothar_schlafen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//Kde bych tu mohl strávit noc?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//Pokud hledáš nocleh, jdi do hotelu pøímo naproti kasárnám.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//Paladinové platí za ubytování všech poutníkù, kteøí do mìsta pøijdou.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//Najdeš zde také všechny potulné kupce z tržištì.
};


instance DIA_LOTHAR_PERMB4OV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_permb4ov_condition;
	information = dia_lothar_permb4ov_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lothar_permb4ov_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (LOTHAR_REGELN == TRUE))
	{
		return TRUE;
	};
};

func void dia_lothar_permb4ov_info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//O všem ostatním si už mùžeš promluvit s lordem Andrem!
	AI_StopProcessInfos(self);
};

func void b_lothar_blubb()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_00");	//Ale já se MUSÍM setkat s lordem Hagenem!
	AI_Output(self,other,"DIA_Lothar_Add_01_45");	//A jak vidím, tak tì pøijal do domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_46");	//Hm - urèitì ví, co dìlá.
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//Kolik je tady mistrù?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//Myslím, že jich je dohromady pìt.
	AI_Output(self,other,"DIA_Lothar_Add_01_62");	//Hele, neøekl jsem to snad dost jasnì? Už žádné povídaèky o dracích!
	AI_Output(other,self,"DIA_Lothar_Add_15_63");	//Jak víš...?
	AI_Output(self,other,"DIA_Lothar_Add_01_64");	//To TOHO ti nic není!
	AI_Output(self,other,"DIA_Lothar_Add_01_65");	//To bylo naposledy, rozumíme si?!
	AI_Output(other,self,"DIA_Lothar_Add_15_66");	//Kde najdu velitele domobrany?
	AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Jsem teï uèedník jednoho ze zdejších mistrù!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//Už zase ty.
	AI_Output(self,other,"DIA_Lothar_Add_01_43");	//Slyšel jsem, že ses setkal s lordem Andrem?
	AI_Output(self,other,"DIA_Lothar_Add_01_44");	//Øíkal jsem ti snad, že k domobranì se mùžeš pøidat jen v pøípadì, že jsi obèanem mìsta.
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//Oznámil jsem lordu Hagenovi, že s ním chceš mluvit.
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//A? Co øíkal?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//Nikdy o tobì neslyšel.
	AI_Output(other,self,"DIA_Lothar_Add_15_51");	//Samozøejmì, že ne. Øekl jsi mu o tìch dracích?
	AI_Output(self,other,"DIA_Lothar_Add_01_52");	//Copak jsem ti neøekl, abys s tìmi povídaèkami PØESTAL?!
	AI_Output(self,other,"DIA_Lothar_Add_01_12");	//Slyšel jsem, že už máš souhlas nìkolika mistrù.
	AI_Output(self,other,"DIA_Lothar_Add_01_13");	//Bereš to docela vážnì, co?
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//Musíš dodržovat pravidla, stejnì jako kdokoliv jiný!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//Lord Hagen nemá èas.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//Pokud máš na srdci nìco PODSTATNÉHO, jdi za lordem Andrem. On ti pomùže!
};


instance DIA_LOTHAR_HELLOAGAIN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_helloagain_condition;
	information = dia_lothar_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_helloagain_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_helloagain_info()
{
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//Aaa! Zase ty!
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//Takže se ti nakonec podaøilo dostat se do horní èásti mìsta!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//Kde jsi vzal tu róbu?
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//Prošel jsem Zkouškou ohnì.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//Neuvìøitelné. V tom pøípadì to, co se tu dìje, musí být Innosova vùle.
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_39");	//Nepøidal ses k Onarovým žoldákùm, že ne?
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//Jak ses sem dostal?
		AI_Output(other,self,"DIA_Lothar_Add_15_41");	//Pøináším nabídku pøímìøí od Leeho.
		AI_Output(self,other,"DIA_Lothar_Add_01_42");	//Pche! Lord Hagen s tím nikdy nebude souhlasit.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//Musíš tady dbát na nìkteré vìci, jinak odsud poletíš stejnì rychle, jako ses sem dostal.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//Vstup máš povolen jen do budov obchodníkù. Poznáš je podle znamení nade dveømi - to jen aby nedošlo k nìjakým nedorozumìním.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//Ostatní budovy patøí významným obèanùm - tam nemáš co pohledávat!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//Nic na tom nemìní, že teï jsi èlenem Innosova øádu.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//Jakožto èlen domobrany máš také povolen pøístup do prostor paladinù.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//Svoje ubikace máš ale poøád v kasárnách.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//V téhle ètvrti žijí významní obèané mìsta. Chovej se k nim tedy s náležitou úctou.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//Rozumíme si?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Jasnì.
};


instance DIA_LOTHAR_HAGEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_hagen_condition;
	information = dia_lothar_hagen_info;
	permanent = TRUE;
	description = "Kde najdu lorda Hagena?";
};


func int dia_lothar_hagen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_hagen_info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//Kde najdu lorda Hagena?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//Je v radnici, na konci horní ètvrti.
	AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//Pokud ale nemáš dobrý dùvod, tak tì tam stejnì nikdo nepustí.
};


instance DIA_LOTHAR_OWRUNNING(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunning_condition;
	information = dia_lothar_owrunning_info;
	permanent = FALSE;
	description = "Byl jsem si promluvit s lordem Hagenem.";
};


func int dia_lothar_owrunning_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) == 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunning_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//Byl jsem si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//A? Nesnažil ses ho obtìžovat s tìmi báchorkami o dracích, že ne?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//Pøesnì to jsem udìlal.
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//To snad nemùže být pravda...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//Poslal mì sehnat nìjaké dùkazy.
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//V tom pøípadì hodnì štìstí. (pro sebe) Blázne...
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_OWRUNNINGBRIEF(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunningbrief_condition;
	information = dia_lothar_owrunningbrief_info;
	permanent = FALSE;
	description = "Mám dùkaz! Tady je dopis od velitele Garonda!";
};


func int dia_lothar_owrunningbrief_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunningbrief_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//Mám dùkaz! Tady je dopis od velitele Garonda!
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//Takže ti draci nejsou výmysl?
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//Køivdil jsem ti. Budu se modlit k Innosovi, aby mi odpustil mé chování.
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_PERM(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_perm_condition;
	information = dia_lothar_perm_info;
	permanent = TRUE;
	description = "Stalo se v poslední dobì nìco zajímavého?";
};


func int dia_lothar_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_perm_info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//Stalo se v poslední dobì nìco zajímavého?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//Ano - že sem vpustili nìkoho jako jsi ty. Nìco takového se nestalo už celé vìky.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//Ty bys to mìl vìdìt nejlíp. Jako èlen mìstské stráže musíš dohlížet na poøádek a dodržování zákona!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Ne.
	};
};


instance DIA_LOTHAR_PICKPOCKET(C_INFO)
{
	npc = pal_203_lothar;
	nr = 900;
	condition = dia_lothar_pickpocket_condition;
	information = dia_lothar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lothar_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_lothar_pickpocket_info()
{
	Info_ClearChoices(dia_lothar_pickpocket);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_BACK,dia_lothar_pickpocket_back);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_PICKPOCKET,dia_lothar_pickpocket_doit);
};

func void dia_lothar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lothar_pickpocket);
};

func void dia_lothar_pickpocket_back()
{
	Info_ClearChoices(dia_lothar_pickpocket);
};

