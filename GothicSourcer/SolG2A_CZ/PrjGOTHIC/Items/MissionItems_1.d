
instance ITKE_XARDAS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od truhlice,";
	text[3] = "kter· pat¯Ì Xardasovi.";
};

instance ITWR_CANTHARS_KOMPROBRIEF_MIS(C_ITEM)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_canthars_komprobrief;
	scemename = "MAP";
	description = "Canthar˘v dopis obchodnici Sarah.";
};


func void use_canthars_komprobrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  PoslednÌ varov·nÌ");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Uû jsem ti nÏkolikr·t p¯·telsky");
	Doc_PrintLine(ndocid,0," p¯ipomÌnal, ûe nutnÏ pot¯ebuji");
	Doc_PrintLine(ndocid,0," ty zbranÏ, kterÈ jsem si");
	Doc_PrintLine(ndocid,0," u tebe p¯ed t˝dnem");
	Doc_PrintLine(ndocid,0," objednal.");
	Doc_PrintLine(ndocid,0," Jestli mi ve velmi brzkÈ dobÏ");
	Doc_PrintLine(ndocid,0," nepod·ö û·dnou zprvu, budu se k tobÏ");
	Doc_PrintLine(ndocid,0," muset zaËÌt chovat trochu jinak. Douf·m,");
	Doc_PrintLine(ndocid,0," ûe si rozumÌme!!!!!!!!!!!!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Onar");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMW_2H_ROD(C_ITEM)
{
	name = "Rod˘v obouruËnÌ meË";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = DAMAGE_ROD;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ROD;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_CORAGONSSILBER(C_ITEM)
{
	name = "Coragonovo st¯Ìbro";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_THEKLASPAKET(C_ITEM)
{
	name = "Theklin balÌk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_theklaspacket;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_theklaspacket()
{
	CreateInvItems(hero,itpl_mana_herb_01,3);
	CreateInvItems(hero,itpl_health_herb_02,1);
	CreateInvItems(hero,itpl_speed_herb_01,1);
	CreateInvItems(hero,itpl_blueplant,2);
	Print(PRINT_GOTPLANTS);
};


instance ITMI_MARIASGOLDPLATE(C_ITEM)
{
	name = "TÏûk˝ zlat˝ talÌ¯";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Na talÌ¯i jsou vyvedena";
	text[3] = "jmÈna Onar a Maria.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_VALENTINOSRING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_valentinosring;
	on_unequip = unequip_valentinosring;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Valentin˘v prsten";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_valentinosring()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE;
	self.protection[PROT_BLUNT] += RI_PROTEDGE;
};

func void unequip_valentinosring()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE;
};


instance ITKE_DEXTER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od truhlice,";
	text[3] = "kter· pat¯Ì Dexterovi.";
};

instance ITWR_KRAEUTERLISTE(C_ITEM)
{
	name = "Seznam";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_kraeuterliste;
	scemename = "MAP";
	description = "Constantin˘v seznam bylin.";
};


func void use_kraeuterliste()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"AlchymistickÈ byliny");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"LÈËiv· rostlina");
	Doc_PrintLine(ndocid,0,"LÈËiv· bylina");
	Doc_PrintLine(ndocid,0,"LÈËiv˝ ko¯en");
	Doc_PrintLine(ndocid,0,"Ohniv· kop¯iva");
	Doc_PrintLine(ndocid,0,"OhnivÈ b˝lÌ");
	Doc_PrintLine(ndocid,0,"Ohniv˝ ko¯en");
	Doc_PrintLine(ndocid,0,"GoblinÌ bobule");
	Doc_PrintLine(ndocid,0,"DraËÌ ko¯en");
	Doc_PrintLine(ndocid,0,"ChÚapavËÌ b˝lÌ");
	Doc_PrintLine(ndocid,0,"LuËnÌ pohanka");
	Doc_PrintLine(ndocid,0,"Kr·lovsk˝ öùovÌk");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pozn·mka: Aù ti ty byliny obstar· nÏjak˝ schopn˝ uËeÚ, aspoÚ pozn·ö, jestli opravdu za nÏco stojÌ. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"ZdravÌ Zuris.");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_MANAREZEPT(C_ITEM)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept;
	scemename = "MAP";
	description = "Recept na esenci magie.";
};


func void use_manarezept()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"MagickÈ lektvary");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"K p¯ÌpravÏ magick˝ch lektvar˘ pot¯ebuje alchymista:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"ohnivou kop¯ivu");
	Doc_PrintLine(ndocid,0,"ohnivÈ b˝lÌ");
	Doc_PrintLine(ndocid,0,"ohniv˝ ko¯en.");
	Doc_PrintLines(ndocid,0,"D·le si musÌ opat¯it jeötÏ ");
	Doc_PrintLine(ndocid,0,"luËnÌ pohanku");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Mistr Neoras ");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_PASSIERSCHEIN(C_ITEM)
{
	name = "Propustka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassierschein;
	scemename = "MAP";
	description = name;
	text[3] = "S tÏmito dokumenty mne";
	text[4] = "str·ûe pustÌ do mÏsta.";
};


func void usepassierschein()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Propustka");
	Doc_PrintLine(ndocid,0,"         Khorinis");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Nositel tohoto dokumentu");
	Doc_PrintLine(ndocid,0," se m˘ûe po neomezenou dobu volnÏ");
	Doc_PrintLine(ndocid,0," pohybovat v dolnÌ Ë·sti Khorinisu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Larius");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     kr·lovsk˝ mÌstodrûÌcÌ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMI_HERBPAKET(C_ITEM)
{
	name = "BalÌËek tr·vy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "TÏûk˝ a mÏkk˝ balÌËek, kter˝";
	text[3] = "je cÌtit tr·vou z baûin.";
	text[5] = NAME_VALUE;
	count[5] = 200;
};

instance ITKE_STORAGE(C_ITEM)
{
	name = "KlÌË od skladiötÏ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od p¯ÌstavnÌho";
	text[3] = "skladiötÏ.";
};


const int HP_HERING = 20;

instance ITFO_SMELLYFISH(C_ITEM)
{
	name = "SleÔ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_smellyfish;
	description = "SleÔ (herynek).";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HERING;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISH;
};


func void use_smellyfish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERING);
};


instance ITFO_HALVORFISH_MIS(C_ITEM)
{
	name = "Podivn· ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_halvorfish;
	description = "Tato ryba vypad· zvl·ötnÏ.";
	text[2] = "S touto rybou nenÌ nÏco v po¯·dku.";
	text[3] = "Jako by ji nÏkdo roz¯Ìzl a pak zaöil.";
};


func void use_halvorfish()
{
	CreateInvItems(hero,itwr_halvormessage,1);
	Print(PRINT_FISHLETTER);
};


instance ITWR_HALVORMESSAGE(C_ITEM)
{
	name = "P·chnoucÌ zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehalvormessage;
	scemename = "MAP";
	description = name;
	text[2] = "Tato zpr·va byla ukryta v rybÏ.";
};


func void usehalvormessage()
{
	var int ndocid;
	KNOWS_HALVOR = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Koukejte drûet hubu a krok! ");
	Doc_PrintLine(ndocid,0," Str·ûe zaËÌnajÌ mÌt podez¯enÌ.");
	Doc_PrintLine(ndocid,0," NedÏlejte nic, dokud se v·m zase neozvu!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Halvor");
	Doc_Show(ndocid);
};


instance ITMW_ALRIKSSWORD_MIS(C_ITEM)
{
	name = "Alrik˘v meË";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ALRIK;
	damagetotal = DAMAGE_ALRIK;
	damagetype = DAM_EDGE;
	range = RANGE_ALRIK;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ALRIK;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = equip_alrikssword;
	on_unequip = unequip_alrikssword;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITWR_VATRASMESSAGE(C_ITEM)
{
	name = "ZapeËetÏn· zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessage;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Zpr·va od Vatrase";
	text[3] = "pro m·gy ohnÏ.";
};


func void usevatrasmessage()
{
	var int ndocid;
	CreateInvItems(self,itwr_vatrasmessage_open,1);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Mil˝ Isgarothu,");
	Doc_PrintLines(ndocid,0,"CÌtÌm, ûe tu s n·mi dlÌ jeötÏ jedna moc, kter· je ËÌm d·l silnÏjöÌ.");
	Doc_PrintLines(ndocid,0,"Je to nÏco naprosto nezn·mÈho. ée by se k n·m blÌûili Beliarovi vazalovÈ?");
	Doc_PrintLines(ndocid,0,"Moûn· se pletu, ale vÏ¯Ìm, ûe by bylo moudrÈ tuhle vÏc svÏ¯it otci Pyrokarovi. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nechù vyslyöÌ naöe modlitby.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITWR_VATRASMESSAGE_OPEN(C_ITEM)
{
	name = "Zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessageopen;
	scemename = "MAP";
	description = name;
	text[2] = "Zpr·va od Vatrase";
	text[3] = "pro m·gy ohnÏ.";
	text[4] = "PeËeù byla zlomena.";
};


func void usevatrasmessageopen()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Mil˝ Isgarothu,");
	Doc_PrintLines(ndocid,0,"CÌtÌm, ûe tu s n·mi dlÌ jeötÏ jedna moc, kter· je ËÌm d·l silnÏjöÌ.");
	Doc_PrintLines(ndocid,0,"Je to nÏco naprosto nezn·mÈho. ée by se k n·m blÌûili Beliarovi vazalovÈ?");
	Doc_PrintLines(ndocid,0,"Moûn· se pletu, ale vÏ¯Ìm, ûe by bylo moudrÈ tuhle vÏc svÏ¯it otci Pyrokarovi. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nechù vyslyöÌ naöe modlitby.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITKE_HOTEL(C_ITEM)
{
	name = "KlÌË od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od hotelovÈho";
	text[3] = "pokoje.";
};

instance ITKE_THIEFGUILDKEY_MIS(C_ITEM)
{
	name = "Rezav˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tento klÌË poznamenala slan· mo¯sk· voda.";
};

instance ITKE_THIEFGUILDKEY_HOTEL_MIS(C_ITEM)
{
	name = "Rezav˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od hotelovÈho sklepa.";
};

instance ITKE_INNOS_MIS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od port·lu, kter˝ vede";
	text[3] = "do Innosovy svatynÏ.";
};

instance ITKE_KLOSTERSCHATZ(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kl·öternÌ ";
	text[3] = "pokladnice.";
};

instance ITKE_KLOSTERSTORE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kl·öternÌ ";
	text[3] = "spiûÌrny.";
};

instance ITKE_KDFPLAYER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kl·öternÌ ";
	text[3] = "sÌnÏ.";
};

instance ITKE_KLOSTERBIBLIOTHEK(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kl·öternÌ ";
	text[3] = "knihovny.";
};

instance ITFO_SCHAFSWURST(C_ITEM)
{
	name = "Skopov· klob·sa";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_schafswurst;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SAUSAGE;
};


func void use_schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
};


instance ITPO_PERM_LITTLEMANA(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_littlemana;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Esence ducha";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_littlemana()
{
	b_raiseattribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance HOLY_HAMMER_MIS(C_ITEM)
{
	name = "Posv·tnÈ kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HOLYHAMMER;
	owner = nov_608_garwig;
	damagetotal = DAMAGE_HOLYHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_HOLYHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HOLYHAMMER;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "ZranÏnÌ:                 ??";
	text[3] = "Poûadovan· sÌla:         ??";
	text[4] = "ObouruËnÌ zbraÚ             ";
	text[5] = "Cena:  nelze urËit";
};

instance ITKE_MAGICCHEST(C_ITEM)
{
	name = "Star˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Star˝ ûelezn˝ klÌË.";
	text[3] = "Mohl by pat¯it k nÏjakÈmu";
	text[4] = "visacÌmu z·mku.";
};

instance ITWR_PASSAGE_MIS(C_ITEM)
{
	name = "N·vrh mÌrovÈ smlouvy s paladiny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassage;
	scemename = "MAP";
	description = name;
	text[3] = "S touto zpr·vou budu moci";
	text[4] = "vidÏt lorda Hagena.";
};


func void usepassage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Velev·ûen˝ lorde Hagene,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Oba vÌme, jak· je Vaöe situace, a proto navrhujÌ n·sledujÌcÌ ujedn·nÌ: ");
	Doc_PrintLines(ndocid,0,"ZajistÏte mnÏ i m˝m muû˘m bez˙honnost p¯ed Innosem i p¯ed kr·lem ");
	Doc_PrintLines(ndocid,0,"a my v·m na opl·tku pom˘ûeme ochraÚovat mÏsto i okolnÌ zemÏ. ");
	Doc_PrintLines(ndocid,0,"J· s·m krom toho osobnÏ dohlÈdnu, aby se moji muûi drûeli d·l od okolnÌch statk˘ - samoz¯ejmÏ kromÏ toho Onarova, kde budeme sÌdlit i nad·le.");
	Doc_PrintLines(ndocid,0,"VÌm, ûe na palubÏ lodi, kterou vypravujete k pevninÏ, je dost mÌsta pro mÏ i pro nÏkterÈ z m˝ch muû˘. Proto chci plout s V·mi.");
	Doc_PrintLines(ndocid,0,"ProsÌm V·s, rozhodnÏte se moud¯e. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"podepsan˝   gener·l Lee");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_BANDITLETTER_MIS(C_ITEM)
{
	name = "Zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebanditletter;
	scemename = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


func void usebanditletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Zastav kaûdÈho muûe, ");
	Doc_PrintLine(ndocid,0," kter˝ p¯ich·zÌ z hor.");
	Doc_PrintLine(ndocid,0,"Jestli na nÏj narazÌö, pak ");
	Doc_PrintLine(ndocid,0," to bude nejspÌö n·ö star˝ zn·m˝.");
	Doc_PrintLine(ndocid,0,"Dej si pozor, aù mu nenaletÌö - ");
	Doc_PrintLine(ndocid,0," je to nebezpeËn˝ ËarodÏj.   ");
	Doc_PrintLine(ndocid,0,"BuÔ st·le ve st¯ehu.");
	Doc_PrintLine(ndocid,0,"     ");
	Doc_PrintLine(ndocid,0,"Je moûnÈ, ûe se s nÌm spojÌ ten chl·pek, ");
	Doc_PrintLine(ndocid,0," co ho hled·me. ");
	Doc_PrintLine(ndocid,0,"Spolu s tÌmhle dopisem ti posÌl·m ");
	Doc_PrintLine(ndocid,0," t¯icet zlaù·k˘. ");
	Doc_PrintLine(ndocid,0,"DalöÌch t¯icet dostane ten, ");
	Doc_PrintLine(ndocid,0," kdo toho chlapa zabije. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Jeho hlavu dones do starÈho dolu u statku.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,".....D.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_POSTER_MIS(C_ITEM)
{
	name = "Zpr·va o hledanÈm";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useposter;
	scemename = "MAP";
	description = name;
	text[3] = "Ten portrÈt je m˘j!";
	text[4] = "";
};


func void useposter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Gesucht.TGA",0);
	Doc_Show(ndocid);
};


instance ITKE_BANDIT(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË, kter˝ mÏl u sebe";
	text[3] = "bandita.";
};

instance ITRW_BOW_L_03_MIS(C_ITEM)
{
	name = "Loveck˝ luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = "Bosper˘v loveck˝ luk.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_PROT_POINT_01_MIS(C_ITEM)
{
	name = "Constantin˘v prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_PROTPOINT;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_01_mis;
	on_unequip = unequip_itri_prot_point_01_mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "D¯evÏn· z·brana ";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] += RI_PROTPOINT;
};

func void unequip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT;
};


instance ITMI_EDDASSTATUE(C_ITEM)
{
	name = "Innosova socha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innosi, Pane spravedlnosti, ";
	text[3] = "poûehnej mi, veÔ mne";
	text[4] = "a chraÚ mne od vöeho zlÈho.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_CRYPT_01(C_ITEM)
{
	name = "Star˝ mosazn˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kostlivce v mÌstnosti 1";
};

instance ITKE_EVT_CRYPT_02(C_ITEM)
{
	name = "Star˝ mosazn˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kostlivce v mÌstnosti 2";
};

instance ITKE_EVT_CRYPT_03(C_ITEM)
{
	name = "Star˝ mosazn˝ klÌË";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od kostlivce v mÌstnosti 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_ITEM)
{
	name = "Star· rytÌ¯sk· zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_VALENTINO(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od Valentinovy";
	text[3] = "truhlice.";
};

instance ITKE_BUERGER(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tohle leûelo na parapetu.";
	text[3] = "";
};

instance ITKE_RICHTER(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od soudcovy";
	text[3] = "truhlice.";
};

instance ITKE_SALANDRIL(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "KlÌË od truhlice,";
	text[3] = "kter· pat¯Ì alchymistovi Salandrilovi.";
};

instance ITKE_PALADINTRUHE(C_ITEM)
{
	name = "KlÌË od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Mal˝ mosazn˝ klÌËek";
	text[3] = "od p¯Ìbytku paladin˘.";
};

instance ITKE_THIEFTREASURE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Mal˝ klÌËek";
};

instance ITKE_FINGERS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Rezav˝ klÌË ode dve¯Ì";
	text[3] = "do stok";
};

instance ITWR_SCHULDENBUCH(C_ITEM)
{
	name = "Kniha z·vazk˘";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Lehmarova ˙ËetnÌ kniha.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschuldbuch;
};


func void useschuldbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pohled·vky a z·vazky");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"J· mistr Thorben, khorinissk˝ tesa¯, dluûÌm ctihodnÈmu Lehmarovi 200 zlaù·k˘.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Thorben");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"J· Coragon, khorinissk˝ hostinsk˝, dluûÌm ctihodnÈmu Lehmarovi 150 zlaù·k˘.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Coragon");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"J· Hanna, khorinissk· hostinsk·, dluûÌm ctihodnÈmu Lehmarovi 250 zlaù·k˘.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"               Hanna");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITPL_SAGITTA_HERB_MIS(C_ITEM)
{
	name = "SluneËnÌ aloe";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRENGTH_HERB_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_ITEM)
{
	name = "KlÌË od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "v hospodÏ 'U MrtvÈ harpyje'.";
	text[3] = "";
};

instance ITRW_DRAGOMIRSARMBRUST_MIS(C_ITEM)
{
	name = "Dragomirova kuöe";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

