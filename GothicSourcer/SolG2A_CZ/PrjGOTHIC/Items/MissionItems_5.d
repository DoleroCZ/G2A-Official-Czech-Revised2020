
instance ITWR_XARDASLETTERTOOPENBOOK_MIS(C_ITEM)
{
	name = "Dopis od Xardase";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardaslettertoopenbook;
	scemename = "MAP";
	description = name;
};


func void use_xardaslettertoopenbook()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Domn�val jsem se, �e zdrojem v�eho zla jsou draci v Hornick�m �dol�.");
	Doc_PrintLines(ndocid,0,"M�lil jsem se.");
	Doc_PrintLines(ndocid,0,"Jestli se v�echno stane tak, jak �ek�m, ");
	Doc_PrintLines(ndocid,0,"m�l bys te� vyhledat Irdoratsk� s�n�. ");
	Doc_PrintLines(ndocid,0,"Pot�ebn� informace najde� v knize, kterou jsi donesl Pyrokarovi.");
	Doc_PrintLines(ndocid,0,"M�l jsem v�d�t, pro� se po n� P�tra�i tolik");
	Doc_PrintLines(ndocid,0,"p�dili.");
	Doc_PrintLines(ndocid,0,"Mus� ji z�skat zp�t!");
	Doc_PrintLines(ndocid,0,"Otev�e� ji slovy 'XARAK BENDARDO'. Nikomu je neprozra�!");
	Doc_PrintLines(ndocid,0,"Te� p�jdu za��dit je�t� dal�� d�le�it� v�ci.");
	Doc_PrintLines(ndocid,0,"V tomto z�v�re�n�m �kolu u� ti m� pomoc nebude nic platn�. Pouze ty m��e� zni�it zdroj v�eho zla.");
	Doc_PrintLines(ndocid,0,"Je�t� se ale uvid�me! ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             Xardas.");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"V tomto dopise mi Xardas sd�lil, jak� slova otev�ou knihu Irdoratsk� s�n�.");
	};
	MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "Kl��";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "z knihy 'Irdoratsk� s�n�'.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "Irdoratsk� s�n�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_hallsofirdorath;
};


func void use_hallsofirdorath()
{
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == TRUE)
	{
		b_say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,itwr_hallsofirdorath_open_mis,1);
		CreateInvItems(hero,itke_monastarysecretlibrary_mis,1);
		CreateInvItems(hero,itwr_uselampidiot_mis,1);
		Print(PRINT_IRDORATHBOOKHIDDENKEY);
		b_giveplayerxp(XP_HALLSOFIRDORATHISOPEN);
		ITWR_HALLSOFIRDORATHISOPEN = TRUE;
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Poda�ilo se mi otev��t Xardasovu knihu. Obsahovala tajnou zpr�vu a podivn� kl��. Kdo v�, na co dal��ho je�t� v kl�tern�m sklepen� naraz�m.");
	}
	else
	{
		CreateInvItems(hero,itwr_hallsofirdorath_mis,1);
		Print(PRINT_IRDORATHBOOKDOESNTOPEN);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ITWR_HALLSOFIRDORATH_OPEN_MIS(C_ITEM)
{
	name = "Irdoratsk� s�n�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_hallsofirdorath_open;
};


func void use_hallsofirdorath_open()
{
	var int ndocid;
	if(ITWR_SCREADSHALLSOFIRDORATH == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"P�e�etl jsem Xardasovu knihu. Zmi�ovala se o tajn� knihovn�, kter� se mus� nach�zet n�kde v kl�tern�m sklepen�.");
	};
	ITWR_SCREADSHALLSOFIRDORATH = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...a tak se do knihovny nyn� d� vej�t pouze tajn�mi dve�mi. Ochr�n�m t�m sv� z�znamy o Beliarov�ch chr�mech. ");
	Doc_PrintLines(ndocid,0,"Kdyby se o nich dozv�d�li moji brat�i, ur�it� by je v�echny zni�ili, zaslepenci!");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Ne, v�d� pouze to, �e tyto chr�my kdysi existovaly.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Jen tak pro jistotu jsem pov��il n�kolik slu�ebn�k�, aby st�e�ili knihovnu.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Tento kl�� otv�r� posledn� dve�e.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "Zapr�en� kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_xardasseamapbook_mis;
};


func void use_xardasseamapbook_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...nyn� v�m jist�, �e tou stavbou jsou Irdoratsk� s�n�. Le�� na ostrov� nedaleko khorinissk�ho p��stavu. U� je tedy jasn�, pro� m�l Beliar o rudn� doly takov� z�jem...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"...��m jsou siln�j��, t�m l�pe mu budou slou�it jako nemrtv� otroci. Takto prom�n�n� paladinov� pak dok�� ka�d�mu v�le�n�kovi po��dn� zatopit. Jeden z nich mi padl do rukou a j� jen douf�m, �e si ostatn� nev�imnou, �e se dostal a� sem dol�...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...ten paladin snad nereaguje v�bec na nic. Jeho zbroj i ostatn� v�ci jsem ulo�il v zadn� komo�e, jej� dve�e lze otev��t pouze zevnit�. Vytvo�il jsem teleporta�n� runu, kter� m� tam v p��pad� pot�eby p�enese. Instrukce pro Vyvolen�ho jsem ukryl v almanachu...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"...znamen� hovo�� jasn�! A� p�ijde Vyvolen�, bude pot�ebovat ve�kerou pomoc, kterou mu budeme moci poskytnout. Beliar u� je p��li� siln�. Snad se Vyvolen� dostane k cenn�m artefakt�m, kter� ukryji pr�v� tady. Domn�v�m se toti�, �e bude poch�zet p��mo z na�ich �ad, ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"a pr�v� proto jsem p��slu�n� pokyny zapsal do almanachu.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...te� u� to v�m jist� - nesm�me se jen tak vzd�t. A� Beliar z�sk� pot�ebnou moc, povstane a bude se sna�it ovl�dnout sv�t. Mus�m vyhledat Vyvolen�ho, jinak je n� osud zpe�et�n.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"...p�ijde v�lka, v�lka pro v�echny v���c� na sv�t�. Ale zd� se mi, �e znamen� dok�u rozpoznat jenom j� - v�ichni ostatn� si jich v�bec nev��maj�. J� v�ak v�m, �e se objev� Vyvolen� a jeho p��chod bude v�stit v�lku. V�lku tak starou jako s�m �as - konec je v�ak u� na obzoru.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"Nebudu tu jen tak st�t s rukama v kl�n� a pozorovat, jak ostatn� berou osud sv�ta do sv�ch rukou!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...prostudoval jsem star� spisy a zjistil, jak vytvo�it legend�rn� zbran� d�vn�ch dra��ch p�n�. Zat�m ale nem�m pon�t�, jak z�skat pot�ebn� ingredience - pro jistotu jsem ale n�vod tak� zaznamenal do almanachu. Kdo v�, jak� hr�zy n�m budoucnost p�inese - mo�n� se budeme muset postavit i l�t�m drak�m.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "Zma�kan� dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[0] = "z knihy 'Irdoratsk� s�n�'";
};


func void useitwr_uselampidiot_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"     Lampa vn�� sv�tlo ");
	Doc_PrintLine(ndocid,0,"     do podzem�");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_SEAMAP_IRDORATH(C_ITEM)
{
	name = "N�mo�n� mapa k Irdoratsk�mu ostrovu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_seamap_irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_seamap_irdorath()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(ndocid);
	if((MIS_SHIPISFREE == FALSE) && (KAPITEL < 6))
	{
		b_say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKNOWSWAYTOIRDORATH == FALSE)
	{
		Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
		b_logentry(TOPIC_SHIP,"Nejsp� se budu muset dostat na podivn� ostrov na�ich nep��tel. K tomu budu ale pot�ebovat lo�, pos�dku a kapit�na.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
	MIS_SCKNOWSWAYTOIRDORATH = TRUE;
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "Lodn� l�stek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "Pln� moc";
	text[4] = "pro paladinskou lo�.";
};


func void useitwr_forgedshipletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Pln� moc");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Dr�itel tohoto dokumentu");
	Doc_PrintLine(ndocid,0," se m��e po neomezenou dobu");
	Doc_PrintLine(ndocid,0," na kr�lovsk� v�le�n� gal��e voln� plavit,");
	Doc_PrintLine(ndocid,0," kamkoliv uzn� za vhodn�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Kr�lovsk� pe�e�");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "Kl�� od v�e hlavn� br�ny";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_ITEM)
{
	name = "Kl�� od kapit�nsk� kajuty";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITPO_POTIONOFDEATH_01_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Innosovy slzy";
	text[1] = "???";
	count[1] = MANA_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_potionofdeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
		PrintScreen(PRINT_LEARNSTR5,-1,45,FONT_SCREEN,2);
		PrintScreen(PRINT_LEARNDEX5,-1,55,FONT_SCREEN,2);
		PrintScreen(PRINT_FULLYHEALED,-1,65,FONT_SCREEN,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		b_say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ITPO_POTIONOFDEATH_02_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Innosovy slzy";
	text[1] = "Tento lektvar prop�j�� m�g�m ohn� zvl�tn� moc.";
	text[2] = "Tomu, kdo k nim nepat��, p�inese leda smrt.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = "Bo�sk� Innosova aura.";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_amulettofdeath_mis;
	on_unequip = unequip_itam_amulettofdeath_mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Bo�sk� Innosova aura.";
	text[2] = "Tento amulet chr�n� sv�ho nositele ";
	text[3] = "p�ed ve�kerou �jmou.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void unequip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ITPO_HEALRANDOLPH_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healrandolph;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "L�k proti z�vislosti";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};

