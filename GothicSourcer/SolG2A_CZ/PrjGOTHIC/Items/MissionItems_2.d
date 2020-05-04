
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "K�men v�d�n�";
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
	Doc_PrintLines(ndocid,0,"Expedice do Hornick�ho �dol� selhala. Utrp�li jsme t�k� ztr�ty a ti, kte�� p�e�ili, jsou nyn� lapeni na hrad� a obkl��eni sk�ety. ");
	Doc_PrintLines(ndocid,0,"Tak� na n�s mnohokr�t za�to�ili draci. Zni�ili v�echny zem� v okol� hradu. S Innosovou pomoc� snad vytrv�me, dokud nedoraz� posily. Stejn� n�m nic jin�ho nezb�v�, nebo� ��dn� v�pad podniknout nem��eme. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Nech� n�s Innos ochra�uje.");
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
	description = "Miltenova zpr�va pro Gorna";
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
	Doc_PrintLines(ndocid,0,"Garond souhlasil, �e t� propust� - za 1000 zla��k�. ");
	Doc_PrintLines(ndocid,0,"Tak�e jestli m� n�kde ulit� n�jak� zlato, bylo by na�ase se s t�m vytasit. ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Milten ");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "Kl�� od sklepen�";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl�� od hradn�ho";
	text[3] = "sklepen�.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "Kl�� od skladi�t�";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl�� od hradn�ho";
	text[3] = "skladi�t�.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "Kl�� ode dve��";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "K prvn�m dve��m";
	text[2] = "Na povrchu je vyryto toto jm�no:";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "Kl�� ode dve��";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ke druh�m dve��m.";
	text[2] = "Na povrchu je vyryto toto jm�no:";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usegornstreasure;
	description = "Gorn�v m�ec.";
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
	name = "Zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Zpr�va od Silvestra";
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Od kr�lovsk�ho paladina Silvestra ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tak n�s �ek� dal�� den pln� kut�n�. Dnes se chceme probourat skrze ze� a prodolovat se hloub�ji do kamene.");
	Doc_PrintLines(ndocid,0,"Tr�p� m� ale jak�si neblah� tu�en�, tak�e si rad�i v�echnu rudu n�kam schov�m.");
	Doc_PrintLines(ndocid,0,"Diego to tady jako jedin� z n�s zn�. Mus�m mu v��it. Ur�it� ty bedny ukryje n�kam do bezpe�� - ale nedovol�m, aby to ud�lal s�m.");
	Doc_PrintLines(ndocid,0,"Rudu mus�me ochr�nit za ka�dou cenu, a tak s n�m pos�l�m je�t� dva ryt��e.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"A� �ije kr�l!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Silvestro");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Ch�apav�� dr�py";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Dr�py v�dce st�da";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = useolav;
	description = "Olav�v vak";
	text[0] = "";
	text[1] = "";
	text[2] = "Uvnit� cink� n�kolik minc�.";
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
	name = "Zlat� tal��";
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
	name = "Kl�� od pr�smyku";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Mal� kl��ek, kter�";
	text[1] = "otv�r� br�nu v pr�smyku.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "Bromor�v kl��";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Kl�� od pokoje";
	text[1] = "majitele nev�stince.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "Kl��";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Mal� kl��ek od truhlice.";
	text[1] = "Tento kl�� pat�� ke truhlici";
	text[2] = "pod mostem.";
	text[3] = "Obsahuje runov� k�men.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "Zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "Jed krvav� mouchy";
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
	Doc_PrintLines(ndocid,0,"�ihadlo krvav� mouchy obsahuje prudk� jed, a proto se ho nikdo, kdo m� v�ech p�t pohromad�, nedot�k�.");
	Doc_PrintLines(ndocid,0,"Pokud tedy nezn� tajemstv�, jak je spolehliv� vyjmout. ");
	Doc_PrintLines(ndocid,0,"�ihadlo lze �ist� otev��t, pokud je ostr�m no�em po d�lce opatrn� na��znete");
	Doc_PrintLines(ndocid,0,"a sloupnete tak svrchn� k��i. Pak u� jen sta�� odstranit tk�� kolem jedov�ch �l�z. ");
	Doc_PrintLines(ndocid,0,"Zvl�tn� tekutina z t�to tk�n� m� l��iv� ��inky,");
	Doc_PrintLines(ndocid,0,"ale lidsk� t�lo se v��i nim bohu�el �asem st�v� imunn�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Damarok");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Nyn� v�m, jak ze �ihadel krvav�ch much z�skat l��ivou tekutinu. ");
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
	Doc_PrintLine(ndocid,0,"P�i platb� nevyrovnan�ch dluh� lze  ");
	Doc_PrintLine(ndocid,0,"p�ijmout do z�stavy i n�jakou v�c, pokud");
	Doc_PrintLine(ndocid,0,"jej� hodnota dan� z�vazek vyrovn�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"V z�stav�: zdoben� zlat� kalich ");
	Doc_PrintLines(ndocid,0,"ze sb�rky krvav�ch kalich�.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"podeps�n");
	Doc_PrintLine(ndocid,0,"Lutero, kupec  ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Lehmar, majitel zastav�rny");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "Garondova mapa dol�";
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
	description = "Texty p�sn�.";
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
	Doc_PrintLines(ndocid,0,"Dominikovo vol�n�");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Sklid�me Jeho sl�vu. ");
	Doc_PrintLines(ndocid,0,"Innos stoj� p�i mn� i p�i m�ch bratrech.");
	Doc_PrintLines(ndocid,0,"Ka�d�ho, kdo se m� pokus� zastavit, pod��znu jak ovci,");
	Doc_PrintLines(ndocid,0,"nebo� On mi v srdci za�ehl ohe�.");
	Doc_PrintLines(ndocid,0,"M�j me� slou�� jen Jemu samotn�mu.  ");
	Doc_PrintLines(ndocid,0,"A dnes se bude Jeho jm�no v�ude rozl�hat.");
	Doc_PrintLines(ndocid,0,"Ka�d�ho, kdo se mi postav�,");
	Doc_PrintLines(ndocid,0,"vlastnoru�n� skol�m,");
	Doc_PrintLines(ndocid,0,"nebo� j� jsem Innosov�m v�le�n�kem.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = "Zpr�va.";
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
	Doc_PrintLines(ndocid,0,"Opustili jsme t�bor. Te�, kdy� bari�ra padla, p�tr�me po st�edu cel� zk�zy. Mo�n� tam najdeme odpov�di, po kter�ch se p�d�me u� po dlouh� l�ta. Jen Adanos v�, kam n�s cesta zavede.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Adanos n�s prov�zej.");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "Zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = "Zpr�va.";
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
	Doc_PrintLines(ndocid,0,"Za��n� m� to p�kn� �tv�t. U� jsem se tu schov�val dost dlouho a jestli jsem dob�e sly�el, bari�ra kone�n� padla.  ");
	Doc_PrintLines(ndocid,0,"Te� u� m� nikdo nebude hledat. M�m pln� zuby t�hle hnusn� jeskyn� i toho zatracen�ho �dol�. Je na�ase vr�tit se dom�.");
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

