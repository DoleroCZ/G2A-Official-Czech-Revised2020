
const int AM_EYEPROTEDGE = 10;
const int AM_EYEPROTPOINT = 10;
const int AM_EYEPROTMAGE = 20;
const int AM_EYEPROTFIRE = 30;

instance ITMI_INNOSEYE_MIS(C_ITEM)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	on_equip = equip_innoseye;
	on_unequip = unequip_innoseye;
	text[0] = "Oko pulzuje tajemnou energií.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_innoseye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] += AM_EYEPROTEDGE;
	self.protection[PROT_POINT] += AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] += AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] += AM_EYEPROTMAGE;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void unequip_innoseye()
{
	self.protection[PROT_EDGE] -= AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_EYEPROTEDGE;
	self.protection[PROT_POINT] -= AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] -= AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_EYEPROTMAGE;
};


instance ITMI_INNOSEYE_DISCHARGED_MIS(C_ITEM)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_discharged_mis;
	text[0] = "Oko je ztemnìlé - vùbec nezáøí.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_discharged_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITMI_INNOSEYE_BROKEN_MIS(C_ITEM)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_broken_mis;
	text[0] = TEXT_INNOSEYE_SETTING;
	text[1] = TEXT_INNOSEYE_GEM;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_broken_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITWR_PERMISSIONTOWEARINNOSEYE_MIS(C_ITEM)
{
	name = "Plná moc";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "Plná moc pro Pyrokara.";
};


func void use_permissiontowearinnoseye()
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
	Doc_PrintLines(ndocid,0,"Nositel tohoto listu mùe vstoupit do posvátnıch síní kláštera.");
	Doc_PrintLines(ndocid,0,"Nech je jeho pøáním ohlednì oka Innosova okamitì vyhovìno.");
	Doc_PrintLines(ndocid,0,"Tyto rozkazy udílím na základì svého postu vládce celého ostrova a králova zástupce, stejnì jako smlouvou od Innosova chrámu ze 2. roku ohnì.");
	Doc_PrintLines(ndocid,0,"V této vìci ji neuèiním ádná další prohlášení a oèekávám, e mé rozkazy budete respektovat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Nech Innos poehná králi!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lord Hagen");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "Sínì Irdorathovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_xardasbookforpyrokar;
};


func void use_xardasbookforpyrokar()
{
	Print(PRINT_IRDORATHBOOKDOESNTOPEN);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITKE_CHEST_SEKOB_XARDASBOOK_MIS(C_ITEM)
{
	name = "Xardasùv klíè";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "od bedny na Sekobovì farmì.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "Zápisník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Zápisník";
	text[0] = "Corneliùv zápisník.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	CORNELIUS_ISLIAR = TRUE;
	b_logentry(TOPIC_RESCUEBENNET,"Tento zápisník dokazuje, e Bennet je nevinnı.");
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jestli bude Larius takhle pokraèovat, budu si muset najít jinou pozici.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Vèera veèer se mi stala prapodivná vìc. Pøišel ke mnì jeden z tìch èernıch zakuklencù, o kterıch jsme toho v poslední dobì tolik slyšeli. Nebyl jsem moc nervózní, i kdy z tajemného návštìvníka pøímo èišelo nìjaké zlo a jeho moc byla skoro hmatatelná. Jeho hlas byl však klidnı a pøíjemnı - mìl jsem pocit, e mu prostì musím vìøit.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Nabídl mi 20 000 zlaákù, kdy se postarám, aby byl jeden z tìch oldákù uznán vinnım. Prı vím, co tím myslí.");
	Doc_PrintLines(ndocid,1,"Samozøejmì e jsem souhlasil, protoe ta chátra si stejnì nic jiného nezaslouí. Nebıt jich, mìl bych se teï mnohem líp. A zlato, které za to dostanu, mi zajistí slušné ivobytí a do smrti.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Jednoho z tìch oldákù u mají pod zámkem, take své slovo opravdu hravì splním.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Almanach posedlıch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_dementorobsessionbook;
};


func void use_dementorobsessionbook()
{
	var int ndocid;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_OBSESSIONCOUNTER = 100;
	b_scisobsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
		Doc_PrintLine(ndocid,0,"");
		Doc_SetFont(ndocid,0,FONT_BOOK);
		Doc_PrintLines(ndocid,0,"edef Kon dirandorix");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"in Sparady bell ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"el utoy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0," Kho ray xaondron");
		Doc_PrintLines(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"em piratoram endro");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		if(KAPITEL >= 3)
		{
			Doc_PrintLine(ndocid,1,"          VINO");
			Doc_PrintLine(ndocid,1,"FERNANDO");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     MALAK");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"BROMOR");
		};
		if(KAPITEL >= 4)
		{
			Doc_PrintLine(ndocid,1,"          ENGROM");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     RANDOLPH");
			Doc_PrintLine(ndocid,1,"");
		};
		if(KAPITEL >= 5)
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"          SEKOB");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     BRUTUS");
			Doc_PrintLine(ndocid,1,"");
		};
		Doc_Show(ndocid);
	};
};


instance ITWR_PYROKARSOBSESSIONLIST(C_ITEM)
{
	name = "Pyrokarùv magickı svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pyrokarsobsessionlist;
	scemename = "MAP";
	description = name;
};


func void use_pyrokarsobsessionlist()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Posedlı");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	if(KAPITEL >= 3)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"FERNANDO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"VINO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"MALAK");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BROMOR");
	};
	if(KAPITEL >= 4)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ENGROM");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"RANDOLPH");
	};
	if(KAPITEL >= 5)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"SEKOB");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BRUTUS");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
	};
	Doc_Show(ndocid);
};


instance ITPO_HEALHILDA_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healhilda;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Léèí èernou horeèku";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healhilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITMW_MALETHSGEHSTOCK_MIS(C_ITEM)
{
	name = "Vycházková hùl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_VLKMACE;
	damagetotal = DAMAGE_VLKMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "Na rukojeti je vyvedeno";
	text[1] = "ozdobné písmeno M.";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_MALETHSBANDITGOLD(C_ITEM)
{
	name = "Mìšec naditı zlatem!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_malethsbanditgold;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_malethsbanditgold()
{
	b_playerfinditem(itmi_gold,300);
};


instance ITMI_MOLERATLUBRIC_MIS(C_ITEM)
{
	name = "Tlustı krysokrt";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_VALUE;
	count[4] = value;
};

instance ITWR_BABOSLETTER_MIS(C_ITEM)
{
	name = "Dopis Babovi";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosletter;
	scemename = "MAP";
	description = "Dopis pro Baba.";
};


func void use_babosletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Milı Babo,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Urèitì se divíš, jak to, e ti píšeme. Donesli jsme toti mistru Marlasovi všechny úspory a poádali ho, aby tyto øádky napsal za nás. Pøejeme ti do budoucna jen to nejlepší a jako dárek na rozlouèenou ti posíláme obrázek, abys mìl na co vzpomínat za dlouhıch veèerù v klášteøe.");
	Doc_PrintLines(ndocid,0,"Mnoho štìstí - snad se ti ta malùvka bude líbit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Feht a Bonka");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "Obrázek eny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "Obrázek nahé eny.";
};


func void use_babospinup()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Pinup.TGA",0);
	Doc_Show(ndocid);
};


instance ITWR_BABOSDOCS_MIS(C_ITEM)
{
	name = "Dokumenty";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Srolované";
	text[3] = "dokumenty.";
};


func void use_babosdocs()
{
	BABOSDOCSOPEN = TRUE;
	CreateInvItems(self,itwr_babosletter_mis,1);
	CreateInvItems(self,itwr_babospinup_mis,1);
};


instance ITKE_IGARAZCHEST_MIS(C_ITEM)
{
	name = "Klíè od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíè od Igarazovy";
	text[3] = "truhlice.";
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "Boská moc hvìzd";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_astronomy;
};


var int astronomy_once;

func void use_astronomy()
{
	var int ndocid;
	if(ASTRONOMY_ONCE == FALSE)
	{
		b_raiseattribute(self,ATR_MANA_MAX,2);
		Print(PRINT_READASTRONOMY);
		ASTRONOMY_ONCE = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...ale kdy se síla vola spojí s váleènickımi ideály, pak se støezte událostí, které mohou nastat.");
	Doc_PrintLines(ndocid,0,"Nespoutaná volská síla a vytrvalost váleèníka dokáe narušit pradávnou rovnováhu sil. Hranice mezi dimenzemi pak zaène slábnout - a nakonec bude tak tenká, e k nám ze svìta stínù snadno proniknou Beliarovy nestvùry. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Války ze starıch èasù nám budi pøíkladem, jak nìco takového dopadá. I kdy tehdy byla vazba mezi svìty ještì stále pevná, stoupenci zla sem pøinesli smrt a zkázu, pøed kterou lidstvo ochránil pouze Innos a jeho vyvolenı. ");
	Doc_PrintLines(ndocid,1,"Innos nás chraò, jestli by se mìla podobná hrozba znovu objevit, protoe ádnı další Innosùv vyvolenı nepøišel u víc jak sto let.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


var int sc_obsessiontimes;

instance ITPO_HEALOBSESSION_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healobsession;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Lék pro posedlé";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healobsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
	SC_OBSESSIONTIMES = SC_OBSESSIONTIMES + 1;
	b_clearscobsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ITSE_GOLEMCHEST_MIS(C_ITEM)
{
	name = "Mìšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_golemchest;
	description = "Mìšec";
	text[0] = "";
	text[1] = "";
	text[2] = "Tento váèek je plnı mincí.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_golemchest()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Print(PRINT_FOUNDRING);
	CreateInvItems(hero,itri_prot_total_02,1);
	Snd_Play("Mìšec");
};


instance ITWR_SHATTEREDGOLEM_MIS(C_ITEM)
{
	name = "Velmi stará mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_shatteredgolem_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_shatteredgolem_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_shatteredgolem_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_DIEGOSLETTER_MIS(C_ITEM)
{
	name = "Dopis od Diega";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_diegosletter_mis;
	scemename = "MAP";
	description = "Diegùv dopis Gerbrandtovi.";
};


func void use_diegosletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Gerbrandte, ");
	Doc_PrintLines(ndocid,0,"víš, mìl jsi mì radši zabít. ");
	Doc_PrintLines(ndocid,0,"Teï jsem zpátky ve mìstì a hledám tì. A a tì najdu, nadìlám z tebe sekanou. Znáš mì u dost dlouho, abys vìdìl, e se jen tak lehce oblbnout nenechám.");
	Doc_PrintLines(ndocid,0,"Poèítám, e kdy jsi mì házel pøes bariéru, ani ve snu tì nenapadlo, e bych se mohl vrátit. A to byla chyba. ");
	Doc_PrintLines(ndocid,0,"Vezmu si zpátky, co mi patøí. ");
	Doc_PrintLines(ndocid,0,"Jestli je ti ivot milı, tak si sbalíš fidlátka a svùj obchod pøenecháš mnì. Tím si budeme kvit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Diego");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = "Plnı mìšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_diegostreasure;
	description = "Diegovùv starı mìšec.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_diegostreasure()
{
	OPENEDDIEGOSBAG = TRUE;
	b_playerfinditem(itmi_gold,DIEGOSTREASURE);
};


instance ITMI_ULTHARSHOLYWATER_MIS(C_ITEM)
{
	name = "Ultharova svìcená voda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int itwr_minenanteil_mis_onetime;

instance ITWR_MINENANTEIL_MIS(C_ITEM)
{
	name = "Akcie khorinisskıch rudnıch dolù";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_minenanteil_mis;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_minenanteil_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Akcie rudnıch dolù");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Tímto dokumentem dává král a vládce této øíše jeho nositeli právo kutat na území pod královskou správou.");
	Doc_PrintLines(ndocid,0,"Svou pùsobnost však musí omezit na jedno malé královské pole.");
	Doc_PrintLines(ndocid,0,"Podle listiny o velikosti dolù èiní jedno malé královské pole 16 yardù na šíøku a 3 yardy na vıšku.");
	Doc_PrintLines(ndocid,0,"Královskı prospektor není povinen zajistit volnı pøístup a ochranu dùlních cel.");
	Doc_PrintLines(ndocid,0,"Nebude-li nájemce moci uhradit nájemné, pøejdou všechna práva zpìt pod správu øíše.");
	Doc_PrintLine(ndocid,0,"     Podepsán");
	Doc_PrintLine(ndocid,0,"     Královskı prospektor");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Salandril");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"Ten chlapík, kterı prodal dùlní akcie obchodníkùm, se jmenoval Salandril. Najdu ho nejspíš v horní ètvrti Khorinisu, jestli tedy u pøed spravedlností neutekl nìkam dál.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Salandril je mrtev. Musím to oznámit Serpentovi.");
		};
		ITWR_MINENANTEIL_MIS_ONETIME = TRUE;
	};
};


instance ITAM_PROT_BLACKEYE_MIS(C_ITEM)
{
	name = "Amulet pøivolávání duší";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[2] = "";
	text[3] = "Amulet ochrany pøed uhranutím";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "Kámen ze svaté pùdy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_RICHTERKOMPROBRIEF_MIS(C_ITEM)
{
	name = "Rozkazy od soudce";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_richterkomprobrief;
	scemename = "MAP";
	description = name;
};


func void use_richterkomprobrief()
{
	var int ndocid;
	SCKNOWSRICHTERKOMPROBRIEF = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Morgaharde, ty mizernı budiknièemu! Buï vyplníš moje rozkazy, nebo se naštvu a nechám vás všechny zavøít, a zèernáte!");
	Doc_PrintLines(ndocid,0,"Musíte to provést dneska v noci, Larius zaèíná nìco tušit. ");
	Doc_PrintLines(ndocid,0,"Jestli mu kapsy nevybereme teï, pak u mùe bıt pozdì. Postarám se, aby ses s ním setkal dneska veèer na trhu. ");
	Doc_PrintLines(ndocid,0,"Ale ne abys z toho dìlal estrádu, jinak tì domobrana zatkne, ne se staèíš rozkoukat.");
	Doc_PrintLines(ndocid,0,"Mimochodem, kdyby pøitom náhodou natáhl brka, docela by se mi to hodilo.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Královskı soudce ");
	Doc_PrintLine(ndocid,0,"          a tajemník");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MORGAHARDTIP(C_ITEM)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_morgahardtip;
	scemename = "MAP";
	description = name;
};


func void use_morgahardtip()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pokraèuji dál. Doufám, e a se to trochu uklidní, zase se setkáme.");
	Doc_PrintLines(ndocid,0,"ádné strachy, hoši. Kdy sele všechno ostatní, poádám Onara, aby na to dohlédl.");
	Doc_PrintLines(ndocid,0,"To bude v poøádku.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     M.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Mapa oltáøù";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_shrine_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_shrine_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_shrine_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_VINOSKELLERGEISTER_MIS(C_ITEM)
{
	name = "Duch vína";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_vinoskellergeister_mis;
};


func void use_vinoskellergeister_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Moc hroznù");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...u jsem toho v ivotì vyzkoušel spoustu, ale tohle ovoce, které mi minulı tıden pøivezli z ciziny, pøedèilo všechna má oèekávání...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...šáva z tìchto hroznù je daleko vydatnìjší, ne to, co lze získat v tìchto konèinách...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...take zatím to jde dobøe. Ale poøád mi nedá spát pomyšlení, co by se mohlo stát, kdyby nìkdo našel mùj tajnı destilaèní aparát. Radši ani nechci vìdìt, co by mi za to drábové provedli - nakonec by mì mohli hodit pøes bariéru...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...zaèínají mít podezøení. Radši se odsud uklidím a chvíli poèkám, a se vìci trochu uklidní a budu se moci opìt vrátit k práci. Hlavnì musím mít jistotu, e po mnì u nejdou...");
	Doc_Show(ndocid);
};

