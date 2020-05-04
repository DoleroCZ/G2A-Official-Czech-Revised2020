
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if(DARON_SPENDE < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		b_raiseattribute(other,ATR_MANA_MAX,2);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_giveplayerxp(XP_AMBIENT);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(1));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 5;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(5));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co pro tebe mohu udìlat? Hledáš duchovní útìchu?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Chceš odeslat modlitbu našemu Pánu Innosovi, nebo darovat kostelu nìjaké peníze?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "Potøeboval bych si promluvit s paladiny...";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Potøeboval bych si promluvit s paladiny. Mùžeš mì k nim nìjak dostat?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//No, budeš potøebovat povolení ke vstupu do horní èásti mìsta. To však mají jen obèané mìsta a mìstská stráž.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//A pochopitelnì my, ohniví mágové.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak bych se mohl stát ohnivým mágem?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Musíš se pøipojit k našemu øádu jako novic. Až budeš sloužit urèitý èas, možná budeš pøijat do øad mágù.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Tahle cesta je ovšem dlouhá a plná práce a studia.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "Pøišel jsem si pro tvé požehnání!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Pøišel jsem si pro tvé požehnání!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To je dobøe, to je dobøe - v tom pøípadì bys jistì chtìl pøispìt nìjakým tím zlaákem ve prospìch svaté církve Innosovy, že?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//No, ve skuteènosti bych rád dostal tvé požehnání, abych se mohl zapsat jako uèedník v dolní èásti mìsta.
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Ale já už ti své požehnání dal, mùj synu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Nech tì Innos doprovází, mùj synu!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Ale mùj synu! Bez pøimìøeného daru církvi ti požehnání dát nemohu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Jak jinak bych si mohl být jistý tvými dobrými úmysly?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "Takže jak vysoký dar se tady vìtšinou dává?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Takže jak vysoký dar se tady vìtšinou dává?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//No, to záleží na tom, jak velký majetek máš. Nech mì se podívat, kolik u sebe máš.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(nahlíží do mìšce) Mmmmh hmmm...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Hm, jsi ubohá duše, že? Nech si to málo, co máš.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, mág ohnì, mi nechtìl požehnat. Nejspíš mu budu muset nejdøív poskytnout nìjaké zlato jako milodar.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No, nemáš mnoho, ale ani nejsi chudý. 10 zlatých pro Innose - žijeme skromnì.
			b_giveinvitems(other,self,itmi_gold,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//Máš víc než 50 zlatých. Daruj Innosovi 25 a dostaneš jeho požehnání.
			b_giveinvitems(other,self,itmi_gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//Máš víc než sto zlatých - Pán øíká, že když máš, mìl bys dát.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Církev pøijímá tvùj štìdrý dar.
			b_giveinvitems(other,self,itmi_gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//Žehnám ti ve jménu Innosovì. On je svìtlo a spravedlnost.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, mág ohnì, mi dal své požehnání.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "Odkud jsi pøišel?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Odkud jsi pøišel?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Pøicházím z kláštera mágù, který leží v horách.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//U nás je vítán každý, jehož srdce je èisté a cítí potøebu sloužit našemu všemocnému Pánu Innosovi.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "Øekni mi nìco o Innosovi.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Øekni mi nìco o Innosovi.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, náš všemocný pán, je svìtlo a oheò.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Rozhodl se, že lidé budou jeho nástrojem, a dal jim magii a zákony.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Jednáme jeho jménem. Vykonáváme spravedlnost dle jeho vùle a kážeme jeho slovo.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Povìz mi o klášteøe.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Povìz mi o klášteøe.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Uèíme naše studenty všechny formy magie. Ale umìní ohnivých mágù spoèívá i v nìèem jiném než jen v tomhle.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Jsme též zbìhlí v umìní alchymie a ve vytváøení mocných run.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Také dìláme skvìlé víno.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = FALSE;
	description = "Co dìláš ve mìstì?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co dìláš ve mìstì?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Vedu jednání s paladiny a jsem nápomocen obèanùm radou a mùžu tu tam ztratit slovo.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Obzvláštì v takovýchto tìžkých dobách je naší povinností být lidu ku pomoci a starat se o chudé.
};


instance DIA_ADDON_DARON_GUILDHELP(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_guildhelp_condition;
	information = dia_addon_daron_guildhelp_info;
	description = "Slyšel jsem nìco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.";
};


func int dia_addon_daron_guildhelp_condition()
{
	if((MIS_ADDON_VATRAS_GO2DARON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_daron_stadt))
	{
		return TRUE;
	};
};

func void dia_addon_daron_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//Slyšel jsem nìco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Taktak. Tos mohl slyšet pouze od mága Vody Vatrase.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//Jaký je problém?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//Cenná soška byla poslána do kláštera z pevniny. Nikdy jsem ji ale nedonesl do kláštera.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Byla loï vylodìna?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//(vyveden z míry) Ne. Pøistála bezpeènì v Khorinisu a bezpeènì jsem ji vyzvedl.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Nicménì skonèila v rukou nìjakých goblinù, když jsem ji nesl do kláštera.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(nevrle) Nedívej se na mì takto. My mágové také nejsme neomylní.
	MIS_ADDON_VATRAS_GO2DARON = LOG_SUCCESS;
	MIS_ADDON_DARON_GETSTATUE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Info_AddChoice(dia_addon_daron_guildhelp,"Øíkáš, že ji nyní mají goblini?",dia_addon_daron_guildhelp_gobbos);
	Info_AddChoice(dia_addon_daron_guildhelp,"Kde jsi tu sošku ztratil?",dia_addon_daron_guildhelp_wo);
	Info_AddChoice(dia_addon_daron_guildhelp,"Nezkoušels dostat tu sošku zpìt?",dia_addon_daron_guildhelp_wiederholen);
};

func void dia_addon_daron_guildhelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Nezkoušels dostat tu sošku zpátky?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Samozøejmì! Prozkoumal jsem vstup do jeskynì, ale bez úspìchu.
};

func void dia_addon_daron_guildhelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//Øíkáš, že ji nyní mají goblini?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//Vzali ji a zmizeli s ní kdesi v køoví.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//Už jsem ji znovu nevidìl. Mohli se odplazit do nìjaké díry.
};

func void dia_addon_daron_guildhelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Kde jsi tu sošku ztratil?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//Blízko Orlanovy hospody. Je to na cestì do kláštera.
	Info_AddChoice(dia_addon_daron_guildhelp,"Slyšel jsem dost. Najdu to pro tebe.",dia_addon_daron_guildhelp_auftrag);
	Info_AddChoice(dia_addon_daron_guildhelp,"Orlanova hospoda? Kde je to?",dia_addon_daron_guildhelp_wotaverne);
};

func void dia_addon_daron_guildhelp_wotaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Orlanova hospoda? Kde to je?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//Vyjdeš tady tou branou a pùjdeš dokud neuvidíš osamìlý barák.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//To je Orlanova hospoda. 'U mrtvé harpyje'.
};

func void dia_addon_daron_guildhelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//Slyšel jsem už dost. Najdu tu sošku.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//A tì Innos vede a odvrátí od tebe všechna nebezpeèí, která na tebe èíhají za tìmito vraty.
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Daron byl okraden nìjakými gobliny. Od té doby postrádá cennou sošku, která nìco pro klášter znamenala. Daron vìøí, že goblini se skrývají nedaleko hospody 'U mrtvé harpyje'.");
};


instance DIA_ADDON_DARON_FOUNDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_foundstatue_condition;
	information = dia_addon_daron_foundstatue_info;
	description = "Našel jsem tvou sošku.";
};


func int dia_addon_daron_foundstatue_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (DIA_GORAX_GOLD_PERM == FALSE) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_daron_foundstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//Našel jsem tu sošku.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//Díky Innosovi!
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//Co s tím budeš dìlat nyní?
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//Pøineslo mi to pouze neštìstí.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//Dones to do kláštera, synu.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//(Uznale) Mùžeš být vpuštìn dovnitø jestli zasvìtíš zbytek svého života klášteru.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//Ale jsem si jist; když jsi øádnì splnil MÙJ požadavek, jsi už pøipraven, neníliž pravda?
	};
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Innos s tebou, synu!
};


instance DIA_ADDON_DARON_RETURNEDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 5;
	condition = dia_addon_daron_returnedstatue_condition;
	information = dia_addon_daron_returnedstatue_info;
	description = "Donesl jsem tu sošku do kláštera, nyní mùžeš v klidu odpoèívat.";
};


func int dia_addon_daron_returnedstatue_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (MIS_ADDON_DARON_GETSTATUE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_daron_returnedstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//Donesl jsem tu sošku do kláštera, nyní mùžeš v klidu odpoèívat.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//Koneènì dobrá zpráva. A tì Innos ochraòuje.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//Pøijmi toto jako malou odmìnu, synu.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	TOPIC_END_RANGERHELPKDF = TRUE;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "Já jsem chudý!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Já jsem chudý!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Vida, jsi bez penìz. Žádný div, v takovéto dobì. Vezmi si tyhle zlaáky, snad ti budou ku prospìchu.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Ale mìl by ses pokusit najít si práci, peníze se k tobì pak jen pohrnou. A pak bys mohl obdarovat Innosovu církev, stejnì jako ona obdarovala tebe.
	b_giveinvitems(self,other,itmi_gold,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 990;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "Rád bych vìnoval nìjaký dar.";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Rád bych vìnoval nìjaký dar.
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"Ale nemám dost zlata... (ZPÌT)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50 zlatých)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 zlatých)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 zlatých)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Celkem jsi mi daroval více než 1000 zlatých.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Požehnání Pána Innose bude neustále s tebou.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Ale nepøinesl jsem dost penìz.
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nevadí, mùj synu. Mùžeš dát pozdìji, kolik jen budeš chtít.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//Žehnám ti ve jménu Innosovì. On je svìtlo a spravedlnost.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, mág ohnì, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Svùj dar mùžeš dát kdykoliv pozdìji, až u sebe budeš mít dost penìz.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosi, jsi svìtlo, jež záøí na cestu spravedlivých.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Tvým jménem žehnám tomuto muži. Nech na nìj záøí tvé svìtlo.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, mág ohnì, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Pán øíká - chceš-li se modlit, otevøi svou duši. A chceš-li vìnovat dar, pøines jej s sebou.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innos, požehnej tomuto muži. Nech na nìj záøí tvé svìtlo.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Dej mu sílu chovat se spravedlivì.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, mág ohnì, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Pokud bys chtìl darovat tolik penìz, mìl bys je s sebou také pøinést.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

