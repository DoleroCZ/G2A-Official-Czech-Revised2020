
instance ITWR_ADDON_HINWEIS_02(C_ITEM)
{
	name = "Dùležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_02;
	scemename = "MAP";
	description = name;
	text[0] = "z hospody v táboøe banditù";
};


func void use_hinweis_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hej lidi,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Lou zmizel kdesi v moèálu, pravdìpodobnì ho sežrali žraloci.");
	Doc_PrintLines(ndocid,0,"A co je horší - klíè od jeho dveøí zmizel s ním.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ten kdo ho najde, mùže si nechat jeho vìci.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Snaf");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HEALTH_04(C_ITEM)
{
	name = "Léèivý lektvar - recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_heilrezept_04;
	scemename = "MAP";
	description = "Lektvar života";
	text[2] = "Na namíchání tohoto mocného lektvaru ";
	text[3] = "jsou potøeba vìdomosti namíchání elixíru hojivé síly. ";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_heilrezept_04()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"na výrobu léèivého lektvaru je potøeba 3 esence života a jedna luèní pohanka.");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Výroba léèivého lektvaru:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jednu luèní pohanku a tøi esence života");
	Doc_PrintLines(ndocid,0,"smícháme podle receptu na výrobu léèivého lektvaru. ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tento lektvar mùže udìlat pouze alchymista, který umí pøipravit elixír hojivé síly. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MANA_04(C_ITEM)
{
	name = "Mana - Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept_04;
	scemename = "MAP";
	description = "Lektvar many";
	text[2] = "K namíchání tohoto mocného lektvaru";
	text[3] = "musí mít alchymista znalosti pøípravy elixíru many.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_manarezept_04()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_MANA_04] = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"Na výrobu je potøeba jedna luèní pohanka a tøi esence many.");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Namíchání lektvaru many:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jsou potøebné tyto pøísady: 1 luèní pohanka a 3 esence many.");
	Doc_PrintLines(ndocid,0,"Smícháme podle receptu na výrobu lektvaru many.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"tento lektvar mùže udìlat pouze alchymista, který umí pøipravit elixír many.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HINWEIS_01(C_ITEM)
{
	name = "Dùležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_01;
	scemename = "MAP";
	description = name;
	text[0] = "z chatrèe v bažinách ";
};


func void use_hinweis_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hej,");
	Doc_PrintLines(ndocid,0,"zboží v truhle je urèeno jen pro pøípad,");
	Doc_PrintLines(ndocid,0,"že nìkdo potøebuje naléhavì pomoc.");
	Doc_PrintLines(ndocid,0,"Každý z nás ho mùže v nouzi použít.");
	Doc_PrintLines(ndocid,0,"Ale neber si zbyteènì víc, než potøebuješ.");
	Doc_PrintLines(ndocid,0,"Když to budeme dodržovat, bude to fungovat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fletcher");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_WILLIAM_01(C_ITEM)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_william_01;
	scemename = "MAP";
	description = name;
	text[0] = "Tato zpráva byla sebrábna rybáøi Williamovi.";
};


func void use_william_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Williame,");
	Doc_PrintLines(ndocid,0,"až nebude svítit mìsíc, stráže nebudou vidìt.");
	Doc_PrintLines(ndocid,0,"Propliž se kolem - ale buï opatrný!");
	Doc_PrintLines(ndocid,0,"Bìž podél døevìné hráze a dostaneš se do tábora. ");
	Doc_PrintLines(ndocid,0,"Tábor pirátù je na opaèné stranì - daleko na západì. ");
	Doc_PrintLines(ndocid,0,"Odtud by mìlo být lehké odplout lodí. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Nìkdo, kdo to s Tebou myslí dobøe");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MCELIXIER_01(C_ITEM)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mcelixier_01;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na lektvar obnovy mysli";
	text[1] = "Tento lektvar vrací pamì";
};


func void use_mcelixier_01()
{
	var int ndocid;
	KNOWS_MCELIXIER = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"lektvar obnovy mysli");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Na tento lektvar potøebuješ jed z dvou žihadel krvavých much");
	Doc_PrintLines(ndocid,0,"Pøidej jeden extrakt many a jednu esenci života,");
	Doc_PrintLines(ndocid,0,"nakonec pøidej pálivý èervený pepø");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pouze zruèný alchymista který ví, jak získat jed ze žihadla, mùže udìlat tento lektvar. Proto buï opatrný. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATES_01(C_ITEM)
{
	name = "Neèestné uklouznutí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pirates_01;
	scemename = "MAP";
	description = name;
	text[0] = "Toto bylo podstrèené v Angusovì kapse";
};


func void use_pirates_01()
{
	var int ndocid;
	READ_JUANSTEXT = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Piráti,");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dodejte koneènì objednanou zásilku.");
	Doc_PrintLine(ndocid,0,"Doneste jí do jeskynì. Tam se setkáme.");
	Doc_PrintLines(ndocid,0,"Zaplatím vám ve zlatì. Dvojnásobek ceny.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tak to udìlejte.");
	Doc_PrintLine(ndocid,0,"Tom");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_JOINT_01(C_ITEM)
{
	name = "Zelený novic";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_joint_rezept_01;
	scemename = "MAP";
	description = name;
	text[0] = "Byl ve Fortunovì truhle";
};


func void use_joint_rezept_01()
{
	var int ndocid;
	GREEN_EXTREM = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Zelený novic");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"(...) Toto mùže být udìláno velice jednoduše, ale ne bez stébel potøebného kalibru, které se zde v táboøe banditù nedají získat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Když zkonbinuji dvì stébla trávy z bažin s luèní pohankou, udìlám zeleného novice.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zelený novic tlumí bolest a èistí hlavu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_LOU_REZEPT(C_ITEM)
{
	name = "Recept na Louovo kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselourezept;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na vytvoøení Louova kladiva";
};


func void uselourezept()
{
	var int ndocid;
	KNOWS_LOUSHAMMER = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Recept na Louovo kladivo");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ingredience na umíchání 'Kladiva' :");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Prvnì si vezmeš láhev vody a 2 stébla trávy a trávu z bažin.");
	Doc_PrintLines(ndocid,0,"Posléze pøidáš zub moèálového žraloka.");
	Doc_PrintLines(ndocid,0,"Vše smícháš a nakonec pøidáš láhev rumu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Na zdraví.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"A nevdechuj výpáry! Jinak oslepneš jako jeden starý muž! ");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_LOU_REZEPT2(C_ITEM)
{
	name = "Recept na Louovo dvojité kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselourezept2;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na namíchání Louova dvojitého kladiva";
};


func void uselourezept2()
{
	var int ndocid;
	KNOWS_SCHLAFHAMMER = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Louovo dvojité kladivo");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Vezmi staré dobré Louovo kladivo a pøedestiluj to ještì jednou.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tato smìs se mùže povést pouze tomu, kdo je zkušený, a  to za mìsíèního svitu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nezkušení nebudou pouze oslepeni. Budou urèitì mrtvi.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATENTOD(C_ITEM)
{
	name = "Rychlý sledì";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = userezeptpiratentod;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na 'Rychlý sledì'";
};


func void userezeptpiratentod()
{
	var int ndocid;
	KNOWS_SCHNELLERHERING = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Rychlý sleï (podle mne)");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Malý životabudiè pro poøádné chlapy");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jako obvykle budeme potøebovat láhev vody. Pak jeden rum a èerstvou rybu.");
	Doc_PrintLines(ndocid,0,"Jakmile nám smìs zaène žloutnout, dejme rybu pryè a pøidejme");
	Doc_PrintLines(ndocid,0,"èerstvou trávu z bažin.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ale bacha. Opravdu to s tebou zamává.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance FAKESCROLL_ADDON(C_ITEM)
{
	name = "Kus papíru";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_ADDON_AXTANLEITUNG(C_ITEM)
{
	name = "Instrukce na sekeru banditù";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useaxtanleitung;
	scemename = "MAP";
	description = name;
	text[0] = "Návod na vytvoøení lehké a ostré sekery";
};


func void useaxtanleitung()
{
	var int ndocid;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		KNOWS_BANDITENAXT = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Sekera banditù");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Jednoruèní sekera");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ten, kdo zná alespoò základy kování zbraní, mùže vytvoøit speciální sekeru");
	Doc_PrintLines(ndocid,0,"Budeme potøebovat 2 kusy ocele.");
	Doc_PrintLines(ndocid,0,"Pak jeden kus rudy a tøi sady zubù z vlka, chòapavce nebo neèeho podobného.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ruda a zuby se skují do jednoho kusu na kovadlinì.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Tato sekera se lehce ovládá a dìlá solidní zranìní.");
	Doc_PrintLines(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_SUMMONANCIENTGHOST(C_ITEM)
{
	name = "Quarhodronovo vyvolání";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usesummonancientghost;
	scemename = "MAP";
	description = name;
	text[0] = "S touto formulí mùžeš vyvolat Quarhodrona";
};


func void usesummonancientghost()
{
	if(SC_SUMMONEDANCIENTGHOST == FALSE)
	{
		b_say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(none_addon_111_quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",none_addon_111_quarhodron,none_addon_111_quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",none_addon_111_quarhodron,none_addon_111_quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SUMMONEDANCIENTGHOST = TRUE;
		}
		else
		{
			b_say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ITWR_MAP_ADDONWORLD(C_ITEM)
{
	name = "Zapomenuté údolí Stavitelù";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_addonworld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_addonworld()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_addonworld);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};

