
instance DIA_XARDAS_FIRSTEXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_firstexit_condition;
	information = dia_xardas_firstexit_info;
	permanent = FALSE;
	description = "Vyrazím hned, jak budu moci!";
};


func int dia_xardas_firstexit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_firstexit_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Vyrazím hned, jak budu moci!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Dobrá! A ještì jedna vìc: neøíkej nikomu, že jsme spolu mluvili. Hlavnì to neøíkej žádnému mágovi.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//Co jsem odešel, považují mì mágové ohnì za mrtvého - a to se mùže docela hodit.
	AI_StopProcessInfos(self);
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_XARDAS_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_exit_condition;
	information = dia_xardas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_exit_info()
{
	AI_StopProcessInfos(self);
};


var int addon_zuerst;

instance DIA_XARDAS_HELLO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_hello_condition;
	information = dia_xardas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_hello_condition()
{
	return TRUE;
};

func void dia_xardas_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//Tak tì tu máme! Už jsem si nemyslel, že se ještì setkáme.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//Citím se, jako kdybych tøi týdny ležel pod hromadou kamení.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//No, taky že ano. Pouze magie v tvé zbroji tì zachránila.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//Bál jsem se, že už tì nebudu moci osvobodit z ruin chrámu.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//Ale dost toho. Teï jsi tady.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//Je tady NOVÉ nebezpeèí, o které se musíme postarat.
	Info_ClearChoices(dia_xardas_hello);
	Info_AddChoice(dia_xardas_hello,"Teï alespoò máme dost èasu. Postaral jsem se o to. Spáè...",dia_addon_xardas_hello_dragons);
	Info_AddChoice(dia_xardas_hello,"O jakém NOVÉM nebezpeèí to mluvíš?",dia_addon_xardas_hello_man);
};

func void dia_addon_xardas_hello_man()
{
	PlayVideo("Intro_ADDON");
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_10");	//Musíš se s nimi spojit! Jen tak mùžeme Beliarovi odolat!
	ADDON_ZUERST = TRUE;
};

func void dia_addon_xardas_hello_dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//Teï alespoò máme dost èasu. Postaral jsem se o to. Spáè je poražen.
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... byl zapuzen. Porazil jsi ho, to je naprostá pravda - ale není v naší moci zastavit válku, která bude teï následovat.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Svým posledním zbìsilým skøekem vyslal Spáè na cestu armády temnot.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Byl to rozkaz urèený všem zlým stvùrám. Mocné zaklínadlo, které nemohou neuposlechnout.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Jeho poslední rozkaz byl: PØIJÏTE! A pøišli. Všichni. Dokonce i draci.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(užasle)... Draci!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Jsou to pradávná stvoøení nebývalé moci. Cítím jejich pøítomnost - dokonce i zde.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//Shromáždili kolem sebe celou armádu nižších stvùr, aby jim sloužily.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//Kde je ta armáda teï?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Utáboøila se nedaleko odsud, v Hornickém údolí poblíž Khorinisu. Pomalu se pøipravuje k útoku.
	if(ADDON_ZUERST == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(zamyšlenì) Moc èasu nám nezbývá.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//Ale to není vše. Je tady JINÁ hrozba, o které jsem se právì dozvìdìl.
		Info_ClearChoices(dia_xardas_hello);
		Info_AddChoice(dia_xardas_hello,"O jakém NOVÉM nebezpeèí to mluvíš?",dia_addon_xardas_hello_man);
	};
};


instance DIA_XARDAS_AWAY(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_away_condition;
	information = dia_xardas_away_info;
	permanent = FALSE;
	description = "Tak si pospìšme, abychom byli co nejrychleji pryè!";
};


func int dia_xardas_away_condition()
{
	if(!Npc_KnowsInfo(other,dia_xardas_todo) && !Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_away_info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Tak si pospìšme, abychom byli co nejrychleji pryè!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Pokud teï uteèeme, bude to znamenat jediné - budeme se muset drakùm postavit pozdìji.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//S pomocí vojákù a mágù, kteøí žijí v tìchto konèinách, bychom mohli jejich armádu zastavit døív, než se úplnì zformuje.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//Lepší šanci už nikdy mít nebudeme.
};


instance DIA_XARDAS_TODO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_todo_condition;
	information = dia_xardas_todo_info;
	permanent = FALSE;
	description = "Co budeme dìlat?";
};


func int dia_xardas_todo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_todo_info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Co budeme dìlat?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//Tentokrát to sami nezvládneme. Proti tìm drakùm nám mùže pomoci jen Innosova moc.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//Ve mìstì Khorinis sídlí skupina paladinù, je to nedaleko odsud.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Mají mocný artefakt, který by nám mohl v boji proti drakùm hodnì pomoci.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//Øíkají mu Innosovo oko. Musíš ten artefakt za každou cenu získat.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Øekni paladinùm o nebezpeèí, které hrozí. MUSÍŠ pøesvìdèit jejich vùdce, aby nám pomohl!
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_07");	//A jak s ním budeš mluvit, musíš najít Beliarùv artefakt.
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_08");	//Je to protìjšek Innosova Oka. Nesmí padnout do rukou zla.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_RUNNING);
	b_logentry(TOPIC_INNOSEYE,"V Khorinisu se usadila skupina paladinù, kteøí opatrují mocný artefakt zvaný Innosovo oko, jenž nám mùže pomoci zahnat draèí hrozbu. Musím ty svaté bojovníky nìjak pøesvìdèit, aby se k nám pøidali.");
};


instance DIA_ADDON_XARDAS_STONEPLATE(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_addon_xardas_stoneplate_condition;
	information = dia_addon_xardas_stoneplate_info;
	description = "Mùžeš mi øíct nìco o téhle kamenné desce?";
};


func int dia_addon_xardas_stoneplate_condition()
{
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//Mùžeš mi øíct nìco o téhle kamenné desce?
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//Nejprve jsem si myslel, že to je jakýsi magický artefakt, ale došel jsem k závìru, že to není moc dùležité.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//Nedokázal jsem tu desku úplnì pøeložit, ale vypadá to, že jde o pøíbìh velmi staré kultury.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//Jestli ji chceš, klidnì si ji vem. Nemám pro ni už žádné upotøebení.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_XARDAS_PORTAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_portal_condition;
	information = dia_addon_xardas_portal_info;
	description = "Mágové Vody objevili portál na neznámou èást ostrova ...";
};


func int dia_addon_xardas_portal_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_whatsornament) && !c_schasbeliarsweapon() && (SATURAS_KLAUEINSMEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_portal_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//Mágové Vody objevili portál na neznámou èást ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//Zajímavé ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//Až najdeš nìco, co nám OPRAVDU pomùže, zprav mì o tom!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//Nìkde tam mohl být skryt Beliarùv artefakt. Najdi ho!
};


instance DIA_ADDON_XARDAS_PORTALAGAIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_portalagain_condition;
	information = dia_addon_xardas_portalagain_info;
	permanent = TRUE;
	description = "O neznámé èásti ostrova ...";
};


func int dia_addon_xardas_portalagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_xardas_portal) && !c_schasbeliarsweapon() && (SATURAS_KLAUEINSMEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_portalagain_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//O neznámé èásti ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//Nezatìžuj mì detaily. Vra se, až najdeš nìco skuteènì užiteèného.
};


instance DIA_ADDON_XARDAS_ADDONSUCCESS(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_addonsuccess_condition;
	information = dia_addon_xardas_addonsuccess_info;
	description = "Probádal jsem neznámou èást ostrova ...";
};


func int dia_addon_xardas_addonsuccess_condition()
{
	if(c_schasbeliarsweapon() || (SATURAS_KLAUEINSMEER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_addonsuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//Probádal jsem neznámou èást ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//A co jsi našel?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//Vše nabralo smìr k mocnému artefaktu. Beliarovu drápu.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Beliarùv Dráp? Kde je teï ? Máš ho u sebe?
	if(c_schasbeliarsweapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Jo, mám ho tady.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(laènì) Velmi zajímavé.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//Tato zbraò mùže být pro nás velmi užiteèná. Ale také extrémnì nebezpeèná.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//Použivej ji opatrnì! A hlavnì, neztra ji!
		b_giveplayerxp(XP_AMBIENT * 3);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//Už jej nemám ...
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Dal jsem ji mágùm Vody, aby ji vrhli do moøe ...
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(rozzuøenì) Zbláznil ses? Víš vùbec, co jsi dal pryè z rukou?
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//Tato zbraò nám mohla být velmi užiteèná!
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//Vìøím, že tak je to lepší.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(vzdech) Cesty boží jsou obèas nevyzpytatelné ...
	};
};


instance DIA_XARDAS_WEAPON(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_weapon_condition;
	information = dia_xardas_weapon_info;
	permanent = FALSE;
	description = "Potøebuji zbranì.";
};


func int dia_xardas_weapon_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_weapon_info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Potøebuji zbranì.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//Mùžu ti dát jen to málo, co tady mám.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Porozhlédni se po mé vìži. Vem si cokoliv, o èem budeš pøesvìdèen, že by se ti mohlo hodit.
};


instance DIA_XARDAS_ARTEFAKT(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_artefakt_condition;
	information = dia_xardas_artefakt_info;
	permanent = FALSE;
	description = "Co pøesnì je to 'Innosovo oko'?";
};


func int dia_xardas_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_artefakt_info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//Co pøesnì je to 'Innosovo oko'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Je to amulet. Legenda vypráví, že do nìj vložil èást své síly sám Innos.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Obnoví èást tvé ztracené síly a pomùže nám porazit draky.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Má také další skryté schopnosti. O nich ti povím víc, až ho budeš mít u sebe.
};


instance DIA_XARDAS_PALADIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 3;
	condition = dia_xardas_paladin_condition;
	information = dia_xardas_paladin_info;
	permanent = FALSE;
	description = "Proè by mi mìli paladinové Innosovo oko dávat?";
};


func int dia_xardas_paladin_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_paladin_info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//Proè by mi mìli paladinové Innosovo oko dávat?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Protože ty jsi ten, komu osud urèil, aby jej nosil.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//Jak mùžeš vìdìt nìco takového?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Mám hned nìkolik dùvodù si to myslet, ale nejdùležitìjší je ten, že jsi porazil Spáèe. Kdybys nebyl oblíbenec bohù, byl bys teï mrtvý.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Øeknìme, že máš pravdu a že jsem vyvolený, abych nesl Innosovo oko. Jak ale paladinové poznají, že to je pravda?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Oko samo si zvolí toho, kdo jej mùže mít. Jakmile se k nìmu dostaneš a nasadíš si ho, nebudou paladinové moci o tvých slovech dál pochybovat.
};


instance DIA_XARDAS_KHORINIS(C_INFO)
{
	npc = none_100_xardas;
	nr = 4;
	condition = dia_xardas_khorinis_condition;
	information = dia_xardas_khorinis_info;
	permanent = FALSE;
	description = "Jak se dostanu do mìsta?";
};


func int dia_xardas_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (lothar.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_khorinis_info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//Jak se dostanu do mìsta?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Jdi po cestì vedoucí odsud skrz hory. Mìsto je velké. Nemùžeš ho minout.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Ale dávej si pozor! Cesta do mìsta není úplnì bezpeèná. A ty nejsi zdaleka tak silný, jak jsi kdysi býval.
};


instance DIA_XARDAS_WHEREEX(C_INFO)
{
	npc = none_100_xardas;
	nr = 6;
	condition = dia_xardas_whereex_condition;
	information = dia_xardas_whereex_info;
	permanent = FALSE;
	description = "A kde to vùbec jsme?";
};


func int dia_xardas_whereex_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_whereex_info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//A kde to vùbec jsme?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Jak jsem už øekl, poblíž mìsta Khorinis.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Postavil jsem si zde znovu svou vìž.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Ale vždy je to jen pár dní, co jsme se naposledy vidìli v Hornickém údolí...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Služebníci, které jsem k obnovení své vìže povolal, odvedli dùkladnou práci...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Taky mám ten pocit.
};


instance DIA_XARDAS_EQUIPMENT(C_INFO)
{
	npc = none_100_xardas;
	nr = 7;
	condition = dia_xardas_equipment_condition;
	information = dia_xardas_equipment_info;
	permanent = FALSE;
	description = "Kde najdu lepší výbavu?";
};


func int dia_xardas_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_weapon) && Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_equipment_info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//Kde najdu lepší výbavu?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Nejbližší místo, kde mùžeš najít lepší zbranì a brnìní, je mìsto Khorinis.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Ale dole v údolí mùžeš tu a tam najít léèivé bylinky, které ti pomohou, když budeš zranìn v boji.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Vidíš to jezero hned pøed mou vìží? Od nìj vede do údolí tajná cesta.
};


instance DIA_XARDAS_ABOUTLESTER(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_aboutlester_condition;
	information = dia_xardas_aboutlester_info;
	permanent = FALSE;
	description = "Mluvil jsi už s Lesterem?";
};


func int dia_xardas_aboutlester_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_send_xardas) && (Npc_GetDistToWP(lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_aboutlester_info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Mluvil jsi už s Lesterem?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Ano, zasypal jsem ho otázkami. Øekl mi toho hodnì, ale byl úplnì vyèerpaný.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Je vlastnì zázrak, že ten útìk vùbec pøežil. Poslal jsem jej, a si odpoèine.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Co ti øekl?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Bojím se, že nic dobrého. Nejen, že vidìl draka, ale také muže v èerných kápích.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//A?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Pokud ti muži skuteènì existují, pøedstavuje jejich pøítomnost možnou hrozbu.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//A to se mi moc nelíbí. Na, vezmi si mùj prsten. Ochrání tì pøed magií.
	b_giveinvitems(self,other,itri_prot_mage_01,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_FIRSTPAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 10;
	condition = dia_xardas_firstpal_condition;
	information = dia_xardas_firstpal_info;
	permanent = FALSE;
	description = "Byl jsem ve mìstì.";
};


func int dia_xardas_firstpal_condition()
{
	if((lothar.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_firstpal_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Byl jsem ve mìstì.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//A? Podaøilo se ti promluvit si s vùdcem paladinù?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Nepustil mì k nìmu.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Nesmysl! Musí existovat zpùsob, jak se k nìmu dostat.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Když selže všechno ostatní, vstup do kláštera a staò se mágem.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Možná to je z morálního hlediska trošku pochybené, ale úèel svìtí prostøedky.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Pokud budeš mágem, urèitì setkání s tebou neodmítne.
};


instance DIA_XARDAS_WEITER(C_INFO)
{
	npc = none_100_xardas;
	nr = 99;
	condition = dia_xardas_weiter_condition;
	information = dia_xardas_weiter_info;
	permanent = TRUE;
	description = "Tak co udìláme teï?";
};


func int dia_xardas_weiter_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weiter_info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//Tak co udìláme teï?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Budeme postupovat podle plánu. Jinak to nejde.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ty bìž získat Innosovo oko a já budu hledat odpovìdi.
};


instance DIA_XARDAS_KDFSECRET(C_INFO)
{
	npc = none_100_xardas;
	nr = 9;
	condition = dia_xardas_kdfsecret_condition;
	information = dia_xardas_kdfsecret_info;
	permanent = FALSE;
	description = "Proè o tobì nemají mágové ohnì vìdìt?";
};


func int dia_xardas_kdfsecret_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit))
	{
		return TRUE;
	};
};

func void dia_xardas_kdfsecret_info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Proè o tobì nemají mágové ohnì vìdìt?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Býval jsem vysoko postavený èlen Kruhu. Už tenkrát jsem mìl podezøení, že klíèem k magické bariéøe by mohla být magie démonù.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Nikdy se mi však nepodaøilo pøesvìdèit ostatní èleny Kruhu, aby sledovali tuhle stopu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Opustil jsem tedy Kruh, abych mohl studovat Èerná umìní.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//A to je zloèin, pro který ohniví mágové, (jízlivì) 'Innosovi služebníci', vždy 'Dobøí' a 'Ctnostní', nikdy nepøijmou žádnou omluvu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Jsou si jisti, že jsem stále naživu, ale vùbec netuší, kde mì hledat - a to je jedinì dobøe.
};


instance DIA_XARDAS_KAP3_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap3_exit_condition;
	information = dia_xardas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BACKFROMOW(C_INFO)
{
	npc = none_100_xardas;
	nr = 31;
	condition = dia_xardas_backfromow_condition;
	information = dia_xardas_backfromow_info;
	description = "Vrátil jsem se z Hornického údolí.";
};


func int dia_xardas_backfromow_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_backfromow_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Vrátil jsem se z Hornického údolí.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Už bylo naèase. Co jsi vidìl?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Mìl jsi pravdu. Celá zemì se hemží nepøátelskou armádou.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Skøeti obléhají hrad a draci zpustošili celý kraj.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Jestli se nepletu, tak nebude dlouho trvat a zaútoèí na Khorinis.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_DMTSINDDA(C_INFO)
{
	npc = none_100_xardas;
	nr = 32;
	condition = dia_xardas_dmtsindda_condition;
	information = dia_xardas_dmtsindda_info;
	description = "Co se to tu proboha stalo?";
};


func int dia_xardas_dmtsindda_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_backfromow))
	{
		return TRUE;
	};
};

func void dia_xardas_dmtsindda_info()
{
	if(Npc_KnowsInfo(other,dia_lester_backintown))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Lester øíkal, že mì chceš okamžitì vidìt.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Co se to tu proboha stalo?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Nepøítel se dozvìdìl, kdo ve skuteènosti jsi, a chce se zmocnit Innosova oka.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Zjistil, jaká hrozba se na nìj žene. Donutilo ho to opustit úkryt a pøejít do útoku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Je konec hry na schovávanou. Ještì vèera nikdo nevìdìl, jak bude nepøátelský útok vypadat. Teï je to nad slunce jasné.
	b_logentry(TOPIC_INNOSEYE,"Nepøítel se domákl, že hledám Innosovo oko. Je naèase je získat, než bude pøíliš pozdì.");
	Info_ClearChoices(dia_xardas_dmtsindda);
	Info_AddChoice(dia_xardas_dmtsindda,"Zaútoèili na mì mágové v èerných rouchách.",dia_xardas_dmtsindda_dmt);
	Info_AddChoice(dia_xardas_dmtsindda,"Koneènì jsem získal dùkaz pro lorda Hagena.",dia_xardas_dmtsindda_beweis);
};

func void dia_xardas_dmtsindda_dmt()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Zaútoèili na mì mágové v èerných rouchách.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//Nepøítel má mnoho podob. Pátraèi jsou jednou z nich. Oni jsou tìmi, kdo pøipravuje pùdu pro nepøítele.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Zaujali pozice na strategických místech a teï jen èekají na vhodnou pøíležitost, aby spustili past.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Vyhýbej se jim. Jsou to mocná magická stvoøení a pokusí se tì odstranit z cesty za každou cenu.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Xardas ty èernì odìné mágy zná. Pátraèi jsou pravdìpodobnì tím, kdo naše nepøátele ovládá. Jsou nesmírnì nebezpeèní.");
	};
};

func void dia_xardas_dmtsindda_beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Koneènì mám dùkaz, který po mnì lord Hagen chtìl.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Co je to za dùkaz?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Dostal jsem dopis od Garonda, velitele paladinù z Hornického údolí. Žádá v nìm o posily.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//To by snad mìlo toho militantního politika pøesvìdèit. Dobrá práce.
	Info_AddChoice(dia_xardas_dmtsindda,"Co udìláme teï?",dia_xardas_dmtsindda_dmt_whattodo);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_xardas_dmtsindda_dmt_whattodo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//Co udìláme teï?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Jdi a dones lordu Hagenovi dopis od Garonda, mìl by ti zaøídit pøístup k Innosovu oku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Pak bìž do kláštera a promluv si s Pyrokarem. Bude ti muset Oko dát.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Nic není dùležitìjšího, než dostat ten artefakt do bezpeèí.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Teï bìž, dokud není pozdì. I nepøítel se ho urèitì pokusí získat.
	b_logentry(TOPIC_INNOSEYE,"Oko se nachází v kláštere mágù ohnì. Doufejme, že mi tam lord Hagen nyní dovolí vejít, když jsem mu pøedal zprávu od lorda Garonda. Hlavní mág Pyrokar mì totiž bez Hagenova svolení k amuletu vùbec nepustí.");
};


instance DIA_XARDAS_INNOSEYEBROKEN(C_INFO)
{
	npc = none_100_xardas;
	nr = 33;
	condition = dia_xardas_innoseyebroken_condition;
	information = dia_xardas_innoseyebroken_info;
	description = "Innosovo oko bylo znièeno.";
};


func int dia_xardas_innoseyebroken_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_dmtsindda) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_innoseyebroken_info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Innosovo oko bylo znièeno.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Co to øíkáš? Znièeno!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Tohle jsem našel nahoøe v severních lesích - bohužel se mi podaøilo získat už jen jeho úlomky.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Byla to naše jediná nadìje, jak obstát v boji s draky. Teï je v nenávratnu. Selhali jsme.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_xardas_innoseyebroken);
	Info_AddChoice(dia_xardas_innoseyebroken,"Co teï?",dia_xardas_innoseyebroken_wasnun);
};

func void dia_xardas_innoseyebroken_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//Co teï?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//To je bolestná zpráva. Musíme se sami v téhle situaci zorientovat. Stáhnu se a zkusím najít øešení.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//Mezitím bys mìl jít do mìsta a promluvit si s vodním mágem Vatrasem. Je možné, že bude vìdìt, co by mìlo být udìláno.
	b_logentry(TOPIC_INNOSEYE,"Zpráva o znièení Oka Innosova Xardase rozhodnì nepotìšila. Naší jedinou nadìjí je nyní mág vody jménem Vatras, který sídlí ve mìstì Khorinisu.");
	MIS_XARDAS_GOTOVATRASINNOSEYE = LOG_RUNNING;
};


instance DIA_XARDAS_RITUALREQUEST(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_ritualrequest_condition;
	information = dia_xardas_ritualrequest_info;
	description = "Posílá mì za tebou Vatras.";
};


func int dia_xardas_ritualrequest_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_xardas_innoseyebroken) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualrequest_info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Posílá mì za tebou Vatras.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//To je dobøe. Co øekl?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Povídal nìco o obráceném rituálu ve sluneèním kruhu.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(zasmìje se) Ten starý pekelník. Myslím, že vím, co má za lubem. Pøišel jsi, abys mì dostal k nìmu.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Vypadá to tak. Kdy vyrazíš na cestu?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Nesmím nechat Vatrase èekat. Okamžitì se vydám na cestu. Splò, co musíš, a pak se ke mnì znovu pøidej.
		AI_StopProcessInfos(self);
		b_logentry(TOPIC_INNOSEYE,"Xardas souhlasil, že se zúèastní rituálu kruhu Slunce.");
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		XARDAS_GOESTORITUALINNOSEYE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Zúèastním se rituálu až ve chvíli, kdy si budu jist, že jsi plnì pøipraven utkat se s draky.
	};
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_WARUMNICHTJETZT(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_warumnichtjetzt_condition;
	information = dia_xardas_warumnichtjetzt_info;
	description = "Proè nejdeš za Vatrasem HNED?";
};


func int dia_xardas_warumnichtjetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (XARDAS_GOESTORITUALINNOSEYE == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_xardas_warumnichtjetzt_info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Proè nejdeš za Vatrasem HNED?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//Nìkdy ti prostì nerozumím.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(rozzlobenì) Nemluv se mnou tímto tónem. Nebýt MÌ, tvoje bídné tìlo by ještì hnilo v tom chrámu.
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Co se dá dìlat. Alespoò mi øekni, co bych mìl udìlat.",dia_xardas_warumnichtjetzt_wastun);
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Tak mi alespoò vysvìtli, proè váháš.",dia_xardas_warumnichtjetzt_grund);
};

func void dia_xardas_warumnichtjetzt_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Tak mi alespoò vysvìtli, proè váháš.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//Od chvíle, kdy jsem opustil ohnivé mágy, jsem se jim držel co možná z cesty.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//A na tom nehodlám nic mìnit, leda že bych nemìl na vybranou.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Ale než se vystavím vyèítavým pohledùm ostatních mágù, chci mít jistotu, že máš proti drakùm alespoò nìjakou šanci.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//S tím svým ošuntìlým vybavením se ale moc daleko nedostaneš. Vra se, až budeš dostateènì silný.
	AI_StopProcessInfos(self);
};

func void dia_xardas_warumnichtjetzt_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Co se dá dìlat. Alespoò mi øekni, co bych mìl udìlat.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Na boj s draky jsi poøád pøíliš slabý. S touhle výbavou nemáš vùbec žádnou šanci.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Nevracej se, dokud nebudeš lépe pøipraven. Pak se vydám za Vatrasem.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BEREIT(C_INFO)
{
	npc = none_100_xardas;
	condition = dia_xardas_bereit_condition;
	information = dia_xardas_bereit_info;
	description = "Jsem pøipraven bojovat s draky.";
};


func int dia_xardas_bereit_condition()
{
	if((XARDAS_GOESTORITUALINNOSEYE == FALSE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_xardas_bereit_info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Jsem pøipraven bojovat s draky.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//V tom pøípadì už nemùžeme plýtvat èasem. Okamžitì se vydám do sluneèního kruhu. Splò, co musíš. Setkáme se tam.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_INNOSEYE,"Xardas souhlasil, že se zúèastní rituálu kruhu Slunce.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	XARDAS_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_XARDAS_BINGESPANNT(C_INFO)
{
	npc = none_100_xardas;
	nr = 35;
	condition = dia_xardas_bingespannt_condition;
	information = dia_xardas_bingespannt_info;
	permanent = TRUE;
	description = "Bude obrácený rituál fungovat?";
};


func int dia_xardas_bingespannt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3) && (XARDAS_GOESTORITUALINNOSEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_bingespannt_info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Bude obrácený rituál fungovat?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//To nemùžu vìdìt najisto. Záleží to na tom, co pøesnì chce Vatras udìlat.
};


instance DIA_XARDAS_PYROWILLNICHT(C_INFO)
{
	npc = none_100_xardas;
	nr = 37;
	condition = dia_xardas_pyrowillnicht_condition;
	information = dia_xardas_pyrowillnicht_info;
	description = "Pyrokar odmítá zúèastnit se rituálu.";
};


func int dia_xardas_pyrowillnicht_condition()
{
	if((PYROKAR_DENIESINNOSEYERITUAL == TRUE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrowillnicht_info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Pyrokar odmítá zúèastnit se rituálu.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Pøedevším chce dùkaz, že ti mùže vìøit.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//No ano. Pyrokar. Velice zajímavé.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Z toho starocha se stává docela mrzout. Ale myslím, že pro tebe mám nìco užiteèného.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Když jsem kdysi opouštìl øád ohnivých mágù, vzal jsem si z kláštera pár vìcí.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Nechtìl jsem, aby náhodou pøišla skupina paladinù nebo ohnivých mágù, prohledali vìž skrz naskrz a ty vìci našli.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Tak jsem je schoval na bezpeèná místa, kde by je mágové urèitì nikdy nehledali.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//A kde?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Nìkteré z nich jsou zamèené v truhle na Sekobovì farmì.
	SEKOB_ROOMFREE = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Tomu Sekobovi vìøíš?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Ne. Ale je možné ho koupit a neklade žádné ošidné otázky. Ta truhla je navíc zamèená. Tady máš klíè.
	CreateInvItems(self,itke_chest_sekob_xardasbook_mis,1);
	b_giveinvitems(self,other,itke_chest_sekob_xardasbook_mis,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Mezi tìmi vìcmi je jedna velice stará kniha. Až ji Pyrokar spatøí, bude vìdìt, že pochází ode mì.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Už mi není k nièemu. Ale øekl bych, že k tomuhle úkolu by se mohla docela dobøe hodit.
	b_logentry(TOPIC_INNOSEYE,"Xardas mi dal klíè od truhlice na Sekobovì statku. Knihu, kterou uvnitø najdu, mám zanést Pyrokarovi.");
};


instance DIA_XARDAS_RITUALINNOSEYEREPAIRIMPORTANT(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_ritualinnoseyerepairimportant_condition;
	information = dia_xardas_ritualinnoseyerepairimportant_info;
	important = TRUE;
};


func int dia_xardas_ritualinnoseyerepairimportant_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualinnoseyerepairimportant_info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Teï, když je Innosovo oko opraveno, se musíš postavit drakùm!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Všichni slouží Beliarovi, bohu temnot.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Musí ale existovat nìjaká pozemská síla, která je ovládá. To je mi jasné.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Zjisti, co za sílu je ovládá.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//Vra se sem, jakmile to zjistíš!
	Info_ClearChoices(dia_xardas_ritualinnoseyerepairimportant);
	Info_AddChoice(dia_xardas_ritualinnoseyerepairimportant,DIALOG_ENDE,dia_xardas_ritualinnoseyerepairimportant_weiter);
};

func void dia_xardas_ritualinnoseyerepairimportant_weiter()
{
	AI_StopProcessInfos(self);
	b_startotherroutine(xardas,"Start");
	b_startotherroutine(vatras,"Start");
};


instance DIA_XARDAS_WASNUN(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_wasnun_condition;
	information = dia_xardas_wasnun_info;
	permanent = TRUE;
	description = "Innosovo oko je opraveno. Co dál?";
};


func int dia_xardas_wasnun_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_wasnun_info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Innosovo oko je opraveno. Co dál?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Nezapomeò ho mít na sobì, až budeš stát drakùm tváøí v tváø.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Neztrácej èas. Bìž do Hornického údolí a zabij ty draky.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Jdi za Pyrokarem, a ti vysvìtlí, jak Oko používat.
	};
};


instance DIA_XARDAS_KAP4_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap4_exit_condition;
	information = dia_xardas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_PERM4(C_INFO)
{
	npc = none_100_xardas;
	nr = 40;
	condition = dia_xardas_perm4_condition;
	information = dia_xardas_perm4_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_xardas_perm4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_perm4_info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Pátraèi ještì neodešli. Nedají si pokoje, dokud tì nedostanou.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Zabij draky v Hornickém údolí a zjisti, kdo za tìmi útoky stojí. Jinak bude jejich síla neustále narùstat.
};


instance DIA_XARDAS_KAP5_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap5_exit_condition;
	information = dia_xardas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_xardas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_KAP6_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap6_exit_condition;
	information = dia_xardas_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_xardas_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

