
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
		Doc_PrintLine(ndocid,0,"Runov� kameny");
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
		Doc_PrintLine(ndocid,0,"Innosovo u�en�");
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
		Doc_PrintLine(ndocid,0,"Innosova p�ik�z�n�");
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
		Doc_PrintLine(ndocid,0,"PRVN� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy prvn�ho kruhu a p��sady, kter� jsou zapot�eb� k jeho vytvo�en�. ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Sv�tlo");
		Doc_PrintLine(ndocid,0,"Zlat� mince");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohniv� ��p");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mal� blesk");
		Doc_PrintLine(ndocid,0,"Kamenn� krystal");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvol�n� goblin�ho kostlivce");
		Doc_PrintLine(ndocid,0,"Goblin� kost");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"L��ba lehk�ch zran�n�");
		Doc_PrintLine(ndocid,0,"L��iv� rostlina");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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
		Doc_PrintLine(ndocid,0,"DRUH� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 2. kruhu a p��sady pot�ebn� k jejich vytvo�en�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohniv� koule");
		Doc_PrintLine(ndocid,0,"Prysky�ice");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledov� ��p");
		Doc_PrintLine(ndocid,0,"Ledov� k�emen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvol�n� vlka");
		Doc_PrintLine(ndocid,0,"Vl�� k��e");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"V�trn� p�st");
		Doc_PrintLine(ndocid,0,"Uhl�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Sp�nek");
		Doc_PrintLine(ndocid,0,"Tr�va z ba�in");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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
		Doc_PrintLine(ndocid,0,"T�ET� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 3. kruhu a p��sady pot�ebn� k jejich vytvo�en�. ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"L��ba st�edn� t�k�ch zran�n�");
		Doc_PrintLine(ndocid,0,"L��iv� bylina");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mal� ohniv� bou�e");
		Doc_PrintLine(ndocid,0,"Prysky�ice");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vytvo�en� kostlivce");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Strach");
		Doc_PrintLine(ndocid,0,"�ern� perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledov� blok");
		Doc_PrintLine(ndocid,0,"Ledov� k�emen");
		Doc_PrintLine(ndocid,0,"Akvamar�n");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kulov� blesk");
		Doc_PrintLine(ndocid,0,"Kamenn� krystal");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Mal� ohniv� bou�e");
		Doc_PrintLine(ndocid,0,"Prysky�ice");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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
		Doc_PrintLine(ndocid,0,"�TVRT� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 4. kruhu a p��sady pot�ebn� k jejich vytvo�en�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Velk� ohniv� koule");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"Prysky�ice");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Blesk");
		Doc_PrintLine(ndocid,0,"Kamenn� krystal");
		Doc_PrintLine(ndocid,0,"Ledov� k�emen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Probuzen� golema");
		Doc_PrintLine(ndocid,0,"Srdce kamenn�ho golema");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Zni�en� nemrtv�ho");
		Doc_PrintLine(ndocid,0,"Sv�cen� voda");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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
		Doc_PrintLine(ndocid,0,"P�T� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 5. kruhu a p��sady pot�ebn� k jejich vytvo�en�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledov� vlna");
		Doc_PrintLine(ndocid,0,"Ledov� k�emen");
		Doc_PrintLine(ndocid,0,"Akvamar�n");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Velk� ohniv� bou�e");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"Jazyk ohniv�ho je�t�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyvol�n� d�mona");
		Doc_PrintLine(ndocid,0,"Srdce d�mona");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"L��ba t�k�ch zran�n�");
		Doc_PrintLine(ndocid,0,"L��iv� ko�en");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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
		Doc_PrintLine(ndocid,0,"�EST� KRUH");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy 6. kruhu a p��sady pot�ebn� k jejich vytvo�en�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohniv� d隝");
		Doc_PrintLine(ndocid,0,"Prysky�ice");
		Doc_PrintLine(ndocid,0,"S�ra");
		Doc_PrintLine(ndocid,0,"Jazyk ohniv�ho je�t�ra");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Dech smrti");
		Doc_PrintLine(ndocid,0,"Uhl�");
		Doc_PrintLine(ndocid,0,"�ern� perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vlna smrti");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"�ern� perla");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Arm�da temnot");
		Doc_PrintLine(ndocid,0,"Kost z kostlivce");
		Doc_PrintLine(ndocid,0,"�ern� perla");
		Doc_PrintLine(ndocid,0,"Srdce kamenn�ho golema");
		Doc_PrintLine(ndocid,0,"Srdce d�mona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Zmen�en� nestv�ry");
		Doc_PrintLine(ndocid,1,"Kost z goblina");
		Doc_PrintLine(ndocid,1,"Trol� tes�k");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K vytvo�en� runy v�dy pot�ebuje� JEDNU z uveden�ch p��sad.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"U�ivatel mus� zn�t pat�i�n� zakl�nadlo a mus� m�t u sebe �ist� runov� k�men spolu se svitkem zvolen�ho kouzla.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve po dokon�en� t�chto p��prav m��e p�istoupit k pr�ci s runovou tabulkou.");
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

