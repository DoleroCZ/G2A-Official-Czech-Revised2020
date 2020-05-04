
instance MENU_MOD_CREDIT(C_MENU_DEF)
{
	backPic = MENU_BACK_PIC;
	musictheme = "SYS_Menu";
	items[0] = "MENUITEM_CREDIT2_HEADLINE";
	items[1] = "MENUITEM_CREDIT2_HEADLINE2";
	items[2] = "MENUITEM_CREDIT2_NAPIS1";
	items[3] = "MENUITEM_CREDIT2_AUTORI1";
	items[4] = "MENUITEM_CREDIT2_AUTORI2";
	items[5] = "MENUITEM_CREDIT2_AUTORI3";
	items[6] = "MENUITEM_CREDIT2_AUTORI4";
	items[7] = "MENUITEM_CREDIT2_AUTORI5";
	items[8] = "MENUITEM_CREDIT2_AUTORI6";
	items[9] = "MENUITEM_CREDIT2_AUTORI7";
	items[10] = "MENUITEM_CREDIT2_napis2";
	items[11] = "MENUITEM_CREDIT2_napis3";
	items[12] = "MENUITEM_CREDIT2_napis4";
	items[13] = "MENUITEM_CREDIT2_napis5";
	items[14] = "MENUITEM_CREDIT2_napis6";
	items[15] = "MENUITEM_CREDIT2_napis7";
	items[16] = "MENUITEM_CREDIT2_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_CREDIT2_NAPIS1(C_MENU_ITEM_DEF)
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

instance MENUITEM_CREDIT2_AUTORI1(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 2500;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI2(C_MENU_ITEM_DEF)
{
	text[0] = "Historie èeského pøekladu z roku 2005:";
	type = MENU_ITEM_TEXT;
	fontname = MENU_FONT_BRIGHT;
	posx = 0;
	posy = 2700;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI3(C_MENU_ITEM_DEF)
{
	text[0] = "Ashkael, Harys, Holy.Day, JC, jojo 3696";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3000;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI4(C_MENU_ITEM_DEF)
{
	text[0] = "Levhartn, Los Mangoss, Maeglin, Mario89";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3400;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI5(C_MENU_ITEM_DEF)
{
	text[0] = "Mephisto, Milhaus, Nefertum, Ridorian";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3800;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI6(C_MENU_ITEM_DEF)
{
	text[0] = "Smaug, Thomas, Top9, Warezz.K";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 4200;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_AUTORI7(C_MENU_ITEM_DEF)
{
	text[0] = "TEXTY z G2 - Kryšpín";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 4600;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS2(C_MENU_ITEM_DEF)
{
	text[0] = "FACEBOOK:";
	type = MENU_ITEM_TEXT;
	fontname = MENU_FONT_BRIGHT;
	posx = 0;
	posy = 5200;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS3(C_MENU_ITEM_DEF)
{
	text[0] = "https://www.facebook.com/Gothicz.net";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 5400;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS4(C_MENU_ITEM_DEF)
{
	text[0] = "DISCORD:";
	type = MENU_ITEM_TEXT;
	fontname = MENU_FONT_BRIGHT;
	posx = 0;
	posy = 6100;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS5(C_MENU_ITEM_DEF)
{
	text[0] = "https://discord.gg/Nu8kYgh";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 6300;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS6(C_MENU_ITEM_DEF)
{
	text[0] = "Revize a Update CZ pøekladu & modu:";
	type = MENU_ITEM_TEXT;
	fontname = MENU_FONT_BRIGHT;
	posx = 0;
	posy = 6800;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_NAPIS7(C_MENU_ITEM_DEF)
{
	text[0] = "https://www.warezzk.cz/";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 7000;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpìt";
	posx = 1000;
	posy = 7500;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDIT2_HEADLINE2(C_MENU_ITEM_DEF)
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

instance MENUITEM_CREDIT2_HEADLINE(C_MENU_ITEM_DEF)
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

