
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
	Doc_PrintLines(ndocid,0,"Domníval jsem se, že zdrojem všeho zla jsou draci v Hornickém údolí.");
	Doc_PrintLines(ndocid,0,"Mílil jsem se.");
	Doc_PrintLines(ndocid,0,"Jestli se všechno stane tak, jak èekám, ");
	Doc_PrintLines(ndocid,0,"mìl bys teï vyhledat Irdoratské sínì. ");
	Doc_PrintLines(ndocid,0,"Potøebné informace najdeš v knize, kterou jsi donesl Pyrokarovi.");
	Doc_PrintLines(ndocid,0,"Mìl jsem vìdìt, proè se po ní Pátraèi tolik");
	Doc_PrintLines(ndocid,0,"pídili.");
	Doc_PrintLines(ndocid,0,"Musíš ji získat zpìt!");
	Doc_PrintLines(ndocid,0,"Otevøeš ji slovy 'XARAK BENDARDO'. Nikomu je neprozraï!");
	Doc_PrintLines(ndocid,0,"Teï pùjdu zaøídit ještì další dùležité vìci.");
	Doc_PrintLines(ndocid,0,"V tomto závìreèném úkolu už ti má pomoc nebude nic platná. Pouze ty mùžeš znièit zdroj všeho zla.");
	Doc_PrintLines(ndocid,0,"Ještì se ale uvidíme! ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             Xardas.");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"V tomto dopise mi Xardas sdìlil, jaká slova otevøou knihu Irdoratské sínì.");
	};
	MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "Klíè";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "z knihy 'Irdoratské sínì'.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "Irdoratské sínì";
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
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Podaøilo se mi otevøít Xardasovu knihu. Obsahovala tajnou zprávu a podivný klíè. Kdo ví, na co dalšího ještì v klášterním sklepení narazím.");
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
	name = "Irdoratské sínì";
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
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pøeèetl jsem Xardasovu knihu. Zmiòovala se o tajné knihovnì, která se musí nacházet nìkde v klášterním sklepení.");
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
	Doc_PrintLines(ndocid,0,"...a tak se do knihovny nyní dá vejít pouze tajnými dveømi. Ochráním tím své záznamy o Beliarových chrámech. ");
	Doc_PrintLines(ndocid,0,"Kdyby se o nich dozvìdìli moji bratøi, urèitì by je všechny znièili, zaslepenci!");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Ne, vìdí pouze to, že tyto chrámy kdysi existovaly.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Jen tak pro jistotu jsem povìøil nìkolik služebníkù, aby støežili knihovnu.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Tento klíè otvírá poslední dveøe.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "Zaprášená kniha";
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
	Doc_PrintLines(ndocid,0,"...nyní vím jistì, že tou stavbou jsou Irdoratské sínì. Leží na ostrovì nedaleko khorinisského pøístavu. Už je tedy jasné, proè mìl Beliar o rudné doly takový zájem...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"...èím jsou silnìjší, tím lépe mu budou sloužit jako nemrtví otroci. Takto promìnìní paladinové pak dokáží každému váleèníkovi poøádnì zatopit. Jeden z nich mi padl do rukou a já jen doufám, že si ostatní nevšimnou, že se dostal až sem dolù...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...ten paladin snad nereaguje vùbec na nic. Jeho zbroj i ostatní vìci jsem uložil v zadní komoøe, jejíž dveøe lze otevøít pouze zevnitø. Vytvoøil jsem teleportaèní runu, která mì tam v pøípadì potøeby pøenese. Instrukce pro Vyvoleného jsem ukryl v almanachu...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"...znamení hovoøí jasnì! Až pøijde Vyvolený, bude potøebovat veškerou pomoc, kterou mu budeme moci poskytnout. Beliar už je pøíliš silný. Snad se Vyvolený dostane k cenným artefaktùm, které ukryji právì tady. Domnívám se totiž, že bude pocházet pøímo z našich øad, ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"a právì proto jsem pøíslušné pokyny zapsal do almanachu.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...teï už to vím jistì - nesmíme se jen tak vzdát. Až Beliar získá potøebnou moc, povstane a bude se snažit ovládnout svìt. Musím vyhledat Vyvoleného, jinak je náš osud zpeèetìn.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"...pøijde válka, válka pro všechny vìøící na svìtì. Ale zdá se mi, že znamení dokážu rozpoznat jenom já - všichni ostatní si jich vùbec nevšímají. Já však vím, že se objeví Vyvolený a jeho pøíchod bude vìstit válku. Válku tak starou jako sám èas - konec je však už na obzoru.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"Nebudu tu jen tak stát s rukama v klínì a pozorovat, jak ostatní berou osud svìta do svých rukou!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...prostudoval jsem staré spisy a zjistil, jak vytvoøit legendární zbranì dávných draèích pánù. Zatím ale nemám ponìtí, jak získat potøebné ingredience - pro jistotu jsem ale návod také zaznamenal do almanachu. Kdo ví, jaké hrùzy nám budoucnost pøinese - možná se budeme muset postavit i lítým drakùm.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "Zmaèkaný dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[0] = "z knihy 'Irdoratské sínì'";
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
	Doc_PrintLine(ndocid,0,"     Lampa vnáší svìtlo ");
	Doc_PrintLine(ndocid,0,"     do podzemí");
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
	name = "Námoøní mapa k Irdoratskému ostrovu";
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
		b_logentry(TOPIC_SHIP,"Nejspíš se budu muset dostat na podivný ostrov našich nepøátel. K tomu budu ale potøebovat loï, posádku a kapitána.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
	MIS_SCKNOWSWAYTOIRDORATH = TRUE;
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "Lodní lístek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "Plná moc";
	text[4] = "pro paladinskou loï.";
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
	Doc_PrintLine(ndocid,0," Plná moc");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Držitel tohoto dokumentu");
	Doc_PrintLine(ndocid,0," se mùže po neomezenou dobu");
	Doc_PrintLine(ndocid,0," na královské váleèné galéøe volnì plavit,");
	Doc_PrintLine(ndocid,0," kamkoliv uzná za vhodné.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Královská peèe");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "Klíè od vìže hlavní brány";
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
	name = "Klíè od kapitánské kajuty";
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
	text[1] = "Tento lektvar propùjèí mágùm ohnì zvláštní moc.";
	text[2] = "Tomu, kdo k nim nepatøí, pøinese leda smrt.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = "Božská Innosova aura.";
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
	description = "Božská Innosova aura.";
	text[2] = "Tento amulet chrání svého nositele ";
	text[3] = "pøed veškerou újmou.";
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
	description = "Lék proti závislosti";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};

