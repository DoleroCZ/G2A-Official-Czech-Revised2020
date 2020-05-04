
func void use_bookstand_rune_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Strana 1");
		Doc_PrintLine(ndocid,0,"Runové kameny");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strana 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Strana 1");
		Doc_PrintLine(ndocid,0,"Runy a jejich ingredience");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strana 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Strana 1");
		Doc_PrintLine(ndocid,0,"Innosovo uèení");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strana 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Strana 1");
		Doc_PrintLine(ndocid,0,"Innosova pøikázání");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strana 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"PRVNÍ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy prvního kruhu a pøísady, které jsou zapotøebí k jeho vytvoøení. ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Svìtlo");
		Doc_PrintLine(ndocid,0,"Zlatá mince");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohnivı šíp");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Malı blesk");
		Doc_PrintLine(ndocid,0,"Kamennı krystal");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvolání gobliního kostlivce");
		Doc_PrintLine(ndocid,0,"Gobliní kost");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Léèba lehkıch zranìní");
		Doc_PrintLine(ndocid,0,"Léèivá rostlina");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"DRUHİ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 2. kruhu a pøísady potøebné k jejich vytvoøení.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohnivá koule");
		Doc_PrintLine(ndocid,0,"Pryskyøice");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledovı šíp");
		Doc_PrintLine(ndocid,0,"Ledovı køemen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvolání vlka");
		Doc_PrintLine(ndocid,0,"Vlèí kùe");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vìtrná pìst");
		Doc_PrintLine(ndocid,0,"Uhlí");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Spánek");
		Doc_PrintLine(ndocid,0,"Tráva z bain");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"TØETÍ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 3. kruhu a pøísady potøebné k jejich vytvoøení. ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Léèba støednì tìkıch zranìní");
		Doc_PrintLine(ndocid,0,"Léèivá bylina");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Malá ohnivá bouøe");
		Doc_PrintLine(ndocid,0,"Pryskyøice");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vytvoøení kostlivce");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Strach");
		Doc_PrintLine(ndocid,0,"Èerná perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledovı blok");
		Doc_PrintLine(ndocid,0,"Ledovı køemen");
		Doc_PrintLine(ndocid,0,"Akvamarín");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kulovı blesk");
		Doc_PrintLine(ndocid,0,"Kamennı krystal");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Malá ohnivá bouøe");
		Doc_PrintLine(ndocid,0,"Pryskyøice");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"ÈTVRTİ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 4. kruhu a pøísady potøebné k jejich vytvoøení.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Velká ohnivá koule");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"Pryskyøice");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Blesk");
		Doc_PrintLine(ndocid,0,"Kamennı krystal");
		Doc_PrintLine(ndocid,0,"Ledovı køemen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Probuzení golema");
		Doc_PrintLine(ndocid,0,"Srdce kamenného golema");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Znièení nemrtvého");
		Doc_PrintLine(ndocid,0,"Svìcená voda");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"PÁTİ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 5. kruhu a pøísady potøebné k jejich vytvoøení.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledová vlna");
		Doc_PrintLine(ndocid,0,"Ledovı køemen");
		Doc_PrintLine(ndocid,0,"Akvamarín");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Velká ohnivá bouøe");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"Jazyk ohnivého ještìra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvolání démona");
		Doc_PrintLine(ndocid,0,"Srdce démona");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Léèba tìkıch zranìní");
		Doc_PrintLine(ndocid,0,"Léèivı koøen");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"ŠESTİ KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 6. kruhu a pøísady potøebné k jejich vytvoøení.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohnivı déš");
		Doc_PrintLine(ndocid,0,"Pryskyøice");
		Doc_PrintLine(ndocid,0,"Síra");
		Doc_PrintLine(ndocid,0,"Jazyk ohnivého ještìra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Dech smrti");
		Doc_PrintLine(ndocid,0,"Uhlí");
		Doc_PrintLine(ndocid,0,"Èerná perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vlna smrti");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"Èerná perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Armáda temnot");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"Èerná perla");
		Doc_PrintLine(ndocid,0,"Srdce kamenného golema");
		Doc_PrintLine(ndocid,0,"Srdce démona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Zmenšení nestvùry");
		Doc_PrintLine(ndocid,1,"Kost z goblina");
		Doc_PrintLine(ndocid,1,"Trolí tesák");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvoøení runy vdy potøebuješ JEDNU z uvedenıch pøísad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uivatel musí znát patøièné zaklínadlo a musí mít u sebe èistı runovı kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokonèení tìchto pøíprav mùe pøistoupit k práci s runovou tabulkou.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Strana 1");
		Doc_PrintLine(ndocid,0,"Regeln");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strana 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

