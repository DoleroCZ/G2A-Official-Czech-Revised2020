
instance STANDARDBRIEF(C_ITEM)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usestandardbrief;
	scemename = "MAP";
	description = "Standartni dopis.";
};


func void usestandardbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Standartni dopis.");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(ndocid);
};


instance STANDARDBUCH(C_ITEM)
{
	name = "Standartni kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Standartni kniha";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usestandardbuch;
};


func void usestandardbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Standartni kniha strana 1");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Standartni kniha strana 2");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(ndocid);
};


instance ITWR_MAP_NEWWORLD(C_ITEM)
{
	name = "Mapa �zem� Khorinisu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_CITY(C_ITEM)
{
	name = "Mapa m�sta Khorinisu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_city;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_city()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_city);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-6900,11800,21600,-9400);
	Doc_Show(document);
};


instance ITWR_MAP_OLDWORLD(C_ITEM)
{
	name = "Mapa Hornick�ho �dol�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_oldworld()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_oldworld);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


var int lerne_einhand;
var int lerne_zweihand;

instance ITWR_EINHANDBUCH(C_ITEM)
{
	name = "Um�n� boje";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Ji�ansk� um�n� obrany";
	text[2] = "Kniha o um�n� boje";
	text[3] = "jednoru�n�mi zbran�mi.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useeinhandbuch;
};


func void useeinhandbuch()
{
	var int ndocid;
	if(LERNE_EINHAND == FALSE)
	{
		b_raisefighttalent(self,NPC_TALENT_1H,5);
		Print(PRINT_LEARN1H);
		LERNE_EINHAND = TRUE;
		Snd_Play("Levelup");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ji�ansk� um�n� obrany");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ji�an� na rozd�l od seve�an� spol�haj� daleko m�n� na fyzickou s�lu - krom� obratnosti. V hork�m podneb� sv� domoviny d�vaj� p�ednost lehk� zbroji, kter� jim nijak nebr�n� v pohybu. Proto se i jejich styl boje velmi li�� od toho, na kter� jsme zvykl� u n�s.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Snad nejzn�m�j�� fintou, kterou ji�an� pou��vaj�, je jednoru�n� blok a krok vzad. Krokem vzad zm�rn�te s�lu �to�n�kova �deru a z�rove� zaujmete lep�� pozici pro rychl� proti�tok.");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITWR_ZWEIHANDBUCH(C_ITEM)
{
	name = "Bojov� taktika";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Blok obouru�n� zbran�";
	text[2] = "Kniha o um�n� boje";
	text[3] = "obouru�n�mi zbran�mi.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usezweihandbuch;
};


func void usezweihandbuch()
{
	var int ndocid;
	if(LERNE_ZWEIHAND == FALSE)
	{
		b_raisefighttalent(self,NPC_TALENT_2H,5);
		Print(PRINT_LEARN2H);
		LERNE_ZWEIHAND = TRUE;
		Snd_Play("Levelup");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Blok obouru�n� zbran�");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Siln� v�le�n�ci dok�� blokov�n�m a odra�en�m soupe�ova me�e ztlumit �der a z�rove� sv�ho soka donutit, aby zcela zm�nil postoj i �to�nou taktiku. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Nep��tel se mus� st�hnout, jeho postup se zpomal� a vy z�sk�te p��le�itost p�evz�t iniciativu a dob�e m��enou ranou sv�ho soka udolat.");
	Doc_Show(ndocid);
};

