
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "Kámen vìdìní";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITWR_PALADINLETTER_MIS(C_ITEM)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepaladinletter;
	scemename = "MAP";
	description = "Dopis lordu Hagenovi";
};


func void usepaladinletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Lorde Hagene!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Expedice do Hornického údolí selhala. Utrpìli jsme tìžké ztráty a ti, kteøí pøežili, jsou nyní lapeni na hradì a obklíèeni skøety. ");
	Doc_PrintLines(ndocid,0,"Také na nás mnohokrát zaútoèili draci. Znièili všechny zemì v okolí hradu. S Innosovou pomocí snad vytrváme, dokud nedorazí posily. Stejnì nám nic jiného nezbývá, nebo žádný výpad podniknout nemùžeme. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Nech nás Innos ochraòuje.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Garond");
	Doc_Show(ndocid);
};


instance ITWR_LETTERFORGORN_MIS(C_ITEM)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useletterforgorn;
	scemename = "MAP";
	description = "Miltenova zpráva pro Gorna";
};


func void useletterforgorn()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Gorne!");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLines(ndocid,0,"Garond souhlasil, že tì propustí - za 1000 zlaákù. ");
	Doc_PrintLines(ndocid,0,"Takže jestli máš nìkde ulitý nìjaký zlato, bylo by naèase se s tím vytasit. ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Milten ");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "Klíè od sklepení";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíè od hradního";
	text[3] = "sklepení.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "Klíè od skladištì";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíè od hradního";
	text[3] = "skladištì.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "Klíè ode dveøí";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "K prvním dveøím";
	text[2] = "Na povrchu je vyryto toto jméno:";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "Klíè ode dveøí";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ke druhým dveøím.";
	text[2] = "Na povrchu je vyryto toto jméno:";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "Mìšec";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usegornstreasure;
	description = "Gornùv mìšec.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegornstreasure()
{
	b_playerfinditem(itmi_gold,250);
	GORNS_BEUTEL = TRUE;
};


instance ITWR_SILVESTRO_MIS(C_ITEM)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Zpráva od Silvestra";
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Od královského paladina Silvestra ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tak nás èeká další den plný kutání. Dnes se chceme probourat skrze zeï a prodolovat se hloubìji do kamene.");
	Doc_PrintLines(ndocid,0,"Trápí mì ale jakési neblahé tušení, takže si radši všechnu rudu nìkam schovám.");
	Doc_PrintLines(ndocid,0,"Diego to tady jako jediný z nás zná. Musím mu vìøit. Urèitì ty bedny ukryje nìkam do bezpeèí - ale nedovolím, aby to udìlal sám.");
	Doc_PrintLines(ndocid,0,"Rudu musíme ochránit za každou cenu, a tak s ním posílám ještì dva rytíøe.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"A žije král!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Silvestro");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Chòapavèí drápy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Drápy vùdce stáda";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "Mìšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = useolav;
	description = "Olavùv vak";
	text[0] = "";
	text[1] = "";
	text[2] = "Uvnitø cinká nìkolik mincí.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useolav()
{
	b_playerfinditem(itmi_gold,25);
};


instance ITMI_GOLDPLATE_MIS(C_ITEM)
{
	name = "Zlatý talíø";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_PASS_MIS(C_ITEM)
{
	name = "Klíè od prùsmyku";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Malý klíèek, který";
	text[1] = "otvírá bránu v prùsmyku.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "Bromorùv klíè";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klíè od pokoje";
	text[1] = "majitele nevìstince.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "Klíè";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Malý klíèek od truhlice.";
	text[1] = "Tento klíè patøí ke truhlici";
	text[2] = "pod mostem.";
	text[3] = "Obsahuje runový kámen.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "Jed krvavé mouchy";
};


func void usebloodmis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Žihadlo krvavé mouchy obsahuje prudký jed, a proto se ho nikdo, kdo má všech pìt pohromadì, nedotýká.");
	Doc_PrintLines(ndocid,0,"Pokud tedy nezná tajemství, jak je spolehlivì vyjmout. ");
	Doc_PrintLines(ndocid,0,"Žihadlo lze èistì otevøít, pokud je ostrým nožem po délce opatrnì naøíznete");
	Doc_PrintLines(ndocid,0,"a sloupnete tak svrchní kùži. Pak už jen staèí odstranit tkáò kolem jedových žláz. ");
	Doc_PrintLines(ndocid,0,"Zvláštní tekutina z této tkánì má léèivé úèinky,");
	Doc_PrintLines(ndocid,0,"ale lidské tìlo se vùèi nim bohužel èasem stává imunní.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Damarok");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Nyní vím, jak ze žihadel krvavých much získat léèivou tekutinu. ");
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance ITWR_PFANDBRIEF_MIS(C_ITEM)
{
	name = "Smlouva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepfandbrief;
	scemename = "MAP";
	description = name;
};


func void usepfandbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Pøi platbì nevyrovnaných dluhù lze  ");
	Doc_PrintLine(ndocid,0,"pøijmout do zástavy i nìjakou vìc, pokud");
	Doc_PrintLine(ndocid,0,"její hodnota daný závazek vyrovná.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"V zástavì: zdobený zlatý kalich ");
	Doc_PrintLines(ndocid,0,"ze sbírky krvavých kalichù.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"podepsán");
	Doc_PrintLine(ndocid,0,"Lutero, kupec  ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Lehmar, majitel zastavárny");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "Garondova mapa dolù";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld_oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_oldworld_oremines()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_oldworld_oremines_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


instance ITWR_MANOWAR(C_ITEM)
{
	name = "Text";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemanowar;
	scemename = "MAP";
	description = "Texty písní.";
};


func void usemanowar()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dominikovo volání");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Sklidíme Jeho slávu. ");
	Doc_PrintLines(ndocid,0,"Innos stojí pøi mnì i pøi mých bratrech.");
	Doc_PrintLines(ndocid,0,"Každého, kdo se mì pokusí zastavit, podøíznu jak ovci,");
	Doc_PrintLines(ndocid,0,"nebo On mi v srdci zažehl oheò.");
	Doc_PrintLines(ndocid,0,"Mùj meè slouží jen Jemu samotnému.  ");
	Doc_PrintLines(ndocid,0,"A dnes se bude Jeho jméno všude rozléhat.");
	Doc_PrintLines(ndocid,0,"Každého, kdo se mi postaví,");
	Doc_PrintLines(ndocid,0,"vlastnoruènì skolím,");
	Doc_PrintLines(ndocid,0,"nebo já jsem Innosovým váleèníkem.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = "Zpráva.";
};


func void usekdwletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Opustili jsme tábor. Teï, když bariéra padla, pátráme po støedu celé zkázy. Možná tam najdeme odpovìdi, po kterých se pídíme už po dlouhá léta. Jen Adanos ví, kam nás cesta zavede.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Adanos nás provázej.");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = "Zpráva.";
};


func void usegilbertletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zaèíná mì to pìknì štvát. Už jsem se tu schovával dost dlouho a jestli jsem dobøe slyšel, bariéra koneènì padla.  ");
	Doc_PrintLines(ndocid,0,"Teï už mì nikdo nebude hledat. Mám plné zuby téhle hnusné jeskynì i toho zatraceného údolí. Je naèase vrátit se domù.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Gilbert");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITRI_TENGRON(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_tengron;
	on_unequip = unequip_itri_tengron;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_ADDON_TENGRONSRING;
	text[2] = NAME_BONUS_HP;
	count[2] = RI_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HP;
};

func void unequip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HP;
	if(self.attribute[ATR_HITPOINTS] > (RI_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

