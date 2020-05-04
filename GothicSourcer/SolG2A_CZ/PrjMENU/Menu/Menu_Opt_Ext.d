
instance MENU_OPT_EXT(C_MENU_DEF)
{
	backPic = MENU_BACK_PIC;
	items[0] = "MENUITEM_EXT_HEADLINE";
	items[1] = "MENUITEM_EXT_FFT";
	items[2] = "MENUITEM_EXT_FFT_CHOICE";
	items[3] = "MENUITEM_EXT_WATERFADE";
	items[4] = "MENUITEM_EXT_WATERFADE_CHOICE";
	items[5] = "MENUITEM_EXT_OBJWIND";
	items[6] = "MENUITEM_EXT_OBJWIND_CHOICE";
	items[7] = "MENUITEM_EXT_CLOUDSHADOW";
	items[8] = "MENUITEM_EXT_CLOUDSHADOW_CHOICE";
	items[9] = "MENUITEM_EXT_AMBIENTPFX";
	items[10] = "MENUITEM_EXT_AMBIENTPFX_CHOICE";
	items[11] = "MENUITEM_EXT_ENVMAP";
	items[12] = "MENUITEM_EXT_ENVMAP_CHOICE";
	items[13] = "MENUITEM_EXT_RADIALFOG";
	items[14] = "MENUITEM_EXT_RADIALFOG_CHOICE";
	items[15] = "MENUITEM_GRA_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_EXT_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "DALŠÍ NASTAVENÍ";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_FFT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Vlny na vodì";
	text[1] = "Zapnout èi vypnout vlnìní vody";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 0);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_FFT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 0) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWaterAniEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_WATERFADE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Mizení vody";
	text[1] = "Zapnout èi vypnout mizení vody";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 1);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_WATERFADE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zFarClipAlphaFade";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_OBJWIND(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Vítr";
	text[1] = "Zapíná pohyb pøedmìtù ve vìtru";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 2);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_OBJWIND_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWindEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_CLOUDSHADOW(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Stíny mrakù";
	text[1] = "Zapnout èi vypnout stíny mrakù";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 3500;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_CLOUDSHADOW_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zCloudShadowScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_AMBIENTPFX(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zvuky prostøedí";
	text[1] = "Zapnout èi vypnout zvuky prostøedí";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 4);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_AMBIENTPFX_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zAmbientPFXEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_ENVMAP(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zrcadlení";
	text[1] = "Zapnout èi vypnout zrcadlení a odrazy";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 5);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_ENVMAP_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zEnvMappingEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_RADIALFOG(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Radiální mlha";
	text[1] = "Zapnout èi vypnout radiální mlhu";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 6);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_RADIALFOG_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zFogRadial";
	onchgsetoptionsection = "RENDERER_D3D";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpìt";
	posx = 1000;
	posy = MENU_BACK_Y;
	dimx = 6192;
	dimy = MENU_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

