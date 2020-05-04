
instance ITWR_ADDON_HINWEIS_02(C_ITEM)
{
	name = "D�le�it� zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_02;
	scemename = "MAP";
	description = name;
	text[0] = "z hospody v t�bo�e bandit�";
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
	Doc_PrintLines(ndocid,0,"Lou zmizel kdesi v mo��lu, pravd�podobn� ho se�rali �raloci.");
	Doc_PrintLines(ndocid,0,"A co je hor�� - kl�� od jeho dve�� zmizel s n�m.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ten kdo ho najde, m��e si nechat jeho v�ci.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Snaf");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HEALTH_04(C_ITEM)
{
	name = "L��iv� lektvar - recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_heilrezept_04;
	scemename = "MAP";
	description = "Lektvar �ivota";
	text[2] = "Na nam�ch�n� tohoto mocn�ho lektvaru ";
	text[3] = "jsou pot�eba v�domosti nam�ch�n� elix�ru hojiv� s�ly. ";
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
			b_logentry(TOPIC_TALENTALCHEMY,"na v�robu l��iv�ho lektvaru je pot�eba 3 esence �ivota a jedna lu�n� pohanka.");
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
	Doc_PrintLines(ndocid,0,"V�roba l��iv�ho lektvaru:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jednu lu�n� pohanku a t�i esence �ivota");
	Doc_PrintLines(ndocid,0,"sm�ch�me podle receptu na v�robu l��iv�ho lektvaru. ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tento lektvar m��e ud�lat pouze alchymista, kter� um� p�ipravit elix�r hojiv� s�ly. ");
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
	text[2] = "K nam�ch�n� tohoto mocn�ho lektvaru";
	text[3] = "mus� m�t alchymista znalosti p��pravy elix�ru many.";
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
			b_logentry(TOPIC_TALENTALCHEMY,"Na v�robu je pot�eba jedna lu�n� pohanka a t�i esence many.");
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
	Doc_PrintLines(ndocid,0,"Nam�ch�n� lektvaru many:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jsou pot�ebn� tyto p��sady: 1 lu�n� pohanka a 3 esence many.");
	Doc_PrintLines(ndocid,0,"Sm�ch�me podle receptu na v�robu lektvaru many.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"tento lektvar m��e ud�lat pouze alchymista, kter� um� p�ipravit elix�r many.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HINWEIS_01(C_ITEM)
{
	name = "D�le�it� zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_01;
	scemename = "MAP";
	description = name;
	text[0] = "z chatr�e v ba�in�ch ";
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
	Doc_PrintLines(ndocid,0,"zbo�� v truhle je ur�eno jen pro p��pad,");
	Doc_PrintLines(ndocid,0,"�e n�kdo pot�ebuje nal�hav� pomoc.");
	Doc_PrintLines(ndocid,0,"Ka�d� z n�s ho m��e v nouzi pou��t.");
	Doc_PrintLines(ndocid,0,"Ale neber si zbyte�n� v�c, ne� pot�ebuje�.");
	Doc_PrintLines(ndocid,0,"Kdy� to budeme dodr�ovat, bude to fungovat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fletcher");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_WILLIAM_01(C_ITEM)
{
	name = "Zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_william_01;
	scemename = "MAP";
	description = name;
	text[0] = "Tato zpr�va byla sebr�bna ryb��i Williamovi.";
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
	Doc_PrintLines(ndocid,0,"a� nebude sv�tit m�s�c, str�e nebudou vid�t.");
	Doc_PrintLines(ndocid,0,"Propli� se kolem - ale bu� opatrn�!");
	Doc_PrintLines(ndocid,0,"B� pod�l d�ev�n� hr�ze a dostane� se do t�bora. ");
	Doc_PrintLines(ndocid,0,"T�bor pir�t� je na opa�n� stran� - daleko na z�pad�. ");
	Doc_PrintLines(ndocid,0,"Odtud by m�lo b�t lehk� odplout lod�. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"N�kdo, kdo to s Tebou mysl� dob�e");
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
	text[1] = "Tento lektvar vrac� pam�";
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
	Doc_PrintLines(ndocid,0,"Na tento lektvar pot�ebuje� jed z dvou �ihadel krvav�ch much");
	Doc_PrintLines(ndocid,0,"P�idej jeden extrakt many a jednu esenci �ivota,");
	Doc_PrintLines(ndocid,0,"nakonec p�idej p�liv� �erven� pep�");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pouze zru�n� alchymista kter� v�, jak z�skat jed ze �ihadla, m��e ud�lat tento lektvar. Proto bu� opatrn�. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATES_01(C_ITEM)
{
	name = "Ne�estn� uklouznut�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pirates_01;
	scemename = "MAP";
	description = name;
	text[0] = "Toto bylo podstr�en� v Angusov� kapse";
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
	Doc_PrintLine(ndocid,0,"Pir�ti,");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dodejte kone�n� objednanou z�silku.");
	Doc_PrintLine(ndocid,0,"Doneste j� do jeskyn�. Tam se setk�me.");
	Doc_PrintLines(ndocid,0,"Zaplat�m v�m ve zlat�. Dvojn�sobek ceny.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tak to ud�lejte.");
	Doc_PrintLine(ndocid,0,"Tom");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_JOINT_01(C_ITEM)
{
	name = "Zelen� novic";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_joint_rezept_01;
	scemename = "MAP";
	description = name;
	text[0] = "Byl ve Fortunov� truhle";
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
	Doc_PrintLine(ndocid,0,"Zelen� novic");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"(...) Toto m��e b�t ud�l�no velice jednodu�e, ale ne bez st�bel pot�ebn�ho kalibru, kter� se zde v t�bo�e bandit� nedaj� z�skat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kdy� zkonbinuji dv� st�bla tr�vy z ba�in s lu�n� pohankou, ud�l�m zelen�ho novice.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zelen� novic tlum� bolest a �ist� hlavu.");
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
	text[0] = "Recept na vytvo�en� Louova kladiva";
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
	Doc_PrintLine(ndocid,0,"Ingredience na um�ch�n� 'Kladiva' :");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Prvn� si vezme� l�hev vody a 2 st�bla tr�vy a tr�vu z ba�in.");
	Doc_PrintLines(ndocid,0,"Posl�ze p�id� zub mo��lov�ho �raloka.");
	Doc_PrintLines(ndocid,0,"V�e sm�ch� a nakonec p�id� l�hev rumu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Na zdrav�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"A nevdechuj v�p�ry! Jinak oslepne� jako jeden star� mu�! ");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_LOU_REZEPT2(C_ITEM)
{
	name = "Recept na Louovo dvojit� kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselourezept2;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na nam�ch�n� Louova dvojit�ho kladiva";
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
	Doc_PrintLine(ndocid,0,"Louovo dvojit� kladivo");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Vezmi star� dobr� Louovo kladivo a p�edestiluj to je�t� jednou.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tato sm�s se m��e pov�st pouze tomu, kdo je zku�en�, a  to za m�s��n�ho svitu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nezku�en� nebudou pouze oslepeni. Budou ur�it� mrtvi.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATENTOD(C_ITEM)
{
	name = "Rychl� sled�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = userezeptpiratentod;
	scemename = "MAP";
	description = name;
	text[0] = "Recept na 'Rychl� sled�'";
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
	Doc_PrintLine(ndocid,0,"Rychl� sle� (podle mne)");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Mal� �ivotabudi� pro po��dn� chlapy");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jako obvykle budeme pot�ebovat l�hev vody. Pak jeden rum a �erstvou rybu.");
	Doc_PrintLines(ndocid,0,"Jakmile n�m sm�s za�ne �loutnout, dejme rybu pry� a p�idejme");
	Doc_PrintLines(ndocid,0,"�erstvou tr�vu z ba�in.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ale bacha. Opravdu to s tebou zam�v�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance FAKESCROLL_ADDON(C_ITEM)
{
	name = "Kus pap�ru";
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
	name = "Instrukce na sekeru bandit�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useaxtanleitung;
	scemename = "MAP";
	description = name;
	text[0] = "N�vod na vytvo�en� lehk� a ostr� sekery";
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
	Doc_PrintLine(ndocid,0,"Sekera bandit�");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Jednoru�n� sekera");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ten, kdo zn� alespo� z�klady kov�n� zbran�, m��e vytvo�it speci�ln� sekeru");
	Doc_PrintLines(ndocid,0,"Budeme pot�ebovat 2 kusy ocele.");
	Doc_PrintLines(ndocid,0,"Pak jeden kus rudy a t�i sady zub� z vlka, ch�apavce nebo ne�eho podobn�ho.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ruda a zuby se skuj� do jednoho kusu na kovadlin�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Tato sekera se lehce ovl�d� a d�l� solidn� zran�n�.");
	Doc_PrintLines(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_SUMMONANCIENTGHOST(C_ITEM)
{
	name = "Quarhodronovo vyvol�n�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usesummonancientghost;
	scemename = "MAP";
	description = name;
	text[0] = "S touto formul� m��e� vyvolat Quarhodrona";
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
	name = "Zapomenut� �dol� Stavitel�";
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

