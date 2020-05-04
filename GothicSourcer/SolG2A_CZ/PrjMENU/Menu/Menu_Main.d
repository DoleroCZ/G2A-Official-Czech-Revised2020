
instance MENU_MAIN(C_MENU_DEF)
{
	backPic = MENU_BACK_PIC;
	musictheme = "SYS_Menu";
	items[0] = "MENUITEM_MAIN_HEADLINE";
	items[1] = "MENUITEM_MAIN_HEADLINE2";
	items[2] = "MENUITEM_MAIN_INFO";
	items[3] = "MENUITEM_MAIN_NEWGAME";
	items[4] = "MENUITEM_MAIN_SAVEGAME_LOAD";
	items[5] = "MENUITEM_MAIN_SAVEGAME_SAVE";
	items[6] = "MENUITEM_MAIN_RESUME";
	items[7] = "MENUITEM_MAIN_OPTIONS";
	items[8] = "MENUITEM_MAIN_INTRO";
	items[9] = "MENUITEM_MAIN_CREDITS";
	items[10] = "MENUITEM_MAIN_CREDITSMOD";
	items[11] = "MENUITEM_MAIN_EXIT";
	defaultOutGame = 2;
	defaultInGame = 4;
	flags = flags | MENU_SHOW_INFO;
};


const int MENU_MAIN_DY = 550;
const int MENU_MAIN_Y = 2500;

instance MENUITEM_MAIN_INFO(C_MENU_ITEM_DEF)
{
	text[0] = "G2A 2020 - 2.01cz";
	type = MENU_ITEM_TEXT;
	fontname = MENU_FONT_NAPIS;
	posx = 0;
	posy = 2050;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nov� hra";
	text[1] = "Zah�jit nov� dobrodru�stv�";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 0);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_SAVEGAME_LOAD(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Na��st hru";
	text[1] = "Pokra�ovat v ulo�en� h�e";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 1);
	dimx = 8100;
	dimy = 750;
	onselaction_s[0] = "MENU_SAVEGAME_LOAD";
	onselaction[0] = SEL_ACTION_STARTMENU;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_SAVEGAME_SAVE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ulo�it hru";
	text[1] = "Ulo�it st�vaj�c� hru";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 2);
	dimx = 8100;
	dimy = 750;
	onselaction_s[0] = "MENU_SAVEGAME_SAVE";
	onselaction[0] = SEL_ACTION_STARTMENU;
	flags = flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};

instance MENUITEM_MAIN_RESUME(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "N�vrat do hry";
	text[1] = "N�vrat do st�vaj�c� hry";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 3);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};

instance MENUITEM_MAIN_OPTIONS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastaven�";
	text[1] = "Nastaven� hry, grafiky a zvuku";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 4);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPTIONS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_INTRO(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "P�ehr�t intro";
	text[1] = "P�ehr�t �vodn� animaci";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 5);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = showintro;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_CREDITS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Tv�rci hry";
	text[1] = "Tv�rci hry Piranha Bytes";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 6);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = showcredits;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_CREDITSMOD(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Auto�i CZ";
	text[1] = "Auto�i �esk�ho p�ekladu & modu, historie �e�tiny";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 7);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_MOD_CREDIT";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ukon�it hru";
	text[1] = "Opustit sv�t Gothic II";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 8);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_LEAVE_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF)
{
	backPic = "menu_gothic.tga";
	posx = 250;
	posy = 500;
	dimx = 7900;
	dimy = 2300;
	alphamode = "BLEND";
	alpha = 255;
	flags = flags | IT_TXT_CENTER;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF)
{
	backPic = "menu_gothicshadow.tga";
	posx = 250;
	posy = 500;
	dimx = 7900;
	dimy = 2300;
	alphamode = "BLEND";
	alpha = 220;
	flags = flags | IT_TXT_CENTER;
	flags = flags & ~IT_SELECTABLE;
};


func int showintro()
{
	PlayVideo("intro.bik");
	return 1;
};

func int showcredits()
{
	PlayVideo("credits.bik");
	PlayVideo("credits2.bik");
	return 1;
};

