
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
	text[0] = "Oko pulzuje tajemnou energi�.";
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
	text[0] = "Oko je ztemn�l� - v�bec nez���.";
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
	name = "Pln� moc";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "Pln� moc pro Pyrokara.";
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
	Doc_PrintLines(ndocid,0,"Nositel tohoto listu m��e vstoupit do posv�tn�ch s�n� kl�tera.");
	Doc_PrintLines(ndocid,0,"Nech� je jeho p��n�m ohledn� oka Innosova okam�it� vyhov�no.");
	Doc_PrintLines(ndocid,0,"Tyto rozkazy ud�l�m na z�klad� sv�ho postu vl�dce cel�ho ostrova a kr�lova z�stupce, stejn� jako smlouvou od Innosova chr�mu ze 2. roku ohn�.");
	Doc_PrintLines(ndocid,0,"V t�to v�ci ji� neu�in�m ��dn� dal�� prohl�en� a o�ek�v�m, �e m� rozkazy budete respektovat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Nech� Innos po�ehn� kr�li!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lord Hagen");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "S�n� Irdorathovy";
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
	name = "Xardas�v kl��";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "od bedny na Sekobov� farm�.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "Z�pisn�k";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Z�pisn�k";
	text[0] = "Corneli�v z�pisn�k.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	CORNELIUS_ISLIAR = TRUE;
	b_logentry(TOPIC_RESCUEBENNET,"Tento z�pisn�k dokazuje, �e Bennet je nevinn�.");
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jestli bude Larius takhle pokra�ovat, budu si muset naj�t jinou pozici.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"V�era ve�er se mi stala prapodivn� v�c. P�i�el ke mn� jeden z t�ch �ern�ch zakuklenc�, o kter�ch jsme toho v posledn� dob� tolik sly�eli. Nebyl jsem moc nerv�zn�, i kdy� z tajemn�ho n�v�t�vn�ka p��mo �i�elo n�jak� zlo a jeho moc byla skoro hmatateln�. Jeho hlas byl v�ak klidn� a p��jemn� - m�l jsem pocit, �e mu prost� mus�m v��it.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Nab�dl mi 20 000 zla��k�, kdy� se postar�m, aby byl jeden z t�ch �old�k� uzn�n vinn�m. Pr� v�m, co t�m mysl�.");
	Doc_PrintLines(ndocid,1,"Samoz�ejm� �e jsem souhlasil, proto�e ta ch�tra si stejn� nic jin�ho nezaslou��. Neb�t jich, m�l bych se te� mnohem l�p. A zlato, kter� za to dostanu, mi zajist� slu�n� �ivobyt� a� do smrti.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Jednoho z t�ch �old�k� u� maj� pod z�mkem, tak�e sv� slovo opravdu hrav� spln�m.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Almanach posedl�ch";
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
	name = "Pyrokar�v magick� svitek";
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
	Doc_PrintLine(ndocid,0,"Posedl�");
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
	description = "L��� �ernou hore�ku";
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
	name = "Vych�zkov� h�l";
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
	text[1] = "ozdobn� p�smeno M.";
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
	name = "M�ec nadit� zlatem!";
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
	name = "Tlust� krysokrt";
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
	Doc_PrintLine(ndocid,0,"Mil� Babo,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ur�it� se div�, jak to, �e ti p�eme. Donesli jsme toti� mistru Marlasovi v�echny �spory a po��dali ho, aby tyto ��dky napsal za n�s. P�ejeme ti do budoucna jen to nejlep�� a jako d�rek na rozlou�enou ti pos�l�me obr�zek, abys m�l na co vzpom�nat za dlouh�ch ve�er� v kl�te�e.");
	Doc_PrintLines(ndocid,0,"Mnoho �t�st� - snad se ti ta mal�vka bude l�bit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Feht a Bonka");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "Obr�zek �eny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "Obr�zek nah� �eny.";
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
	text[2] = "Srolovan�";
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
	name = "Kl�� od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl�� od Igarazovy";
	text[3] = "truhlice.";
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "Bo�sk� moc hv�zd";
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
	Doc_PrintLines(ndocid,0,"...ale kdy� se s�la vola spoj� s v�le�nick�mi ide�ly, pak se st�ezte ud�lost�, kter� mohou nastat.");
	Doc_PrintLines(ndocid,0,"Nespoutan� volsk� s�la a vytrvalost v�le�n�ka dok�e naru�it prad�vnou rovnov�hu sil. Hranice mezi dimenzemi pak za�ne sl�bnout - a� nakonec bude tak tenk�, �e k n�m ze sv�ta st�n� snadno proniknou Beliarovy nestv�ry. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"V�lky ze star�ch �as� n�m budi� p��kladem, jak n�co takov�ho dopad�. I kdy� tehdy byla vazba mezi sv�ty je�t� st�le pevn�, stoupenci zla sem p�inesli smrt a zk�zu, p�ed kterou lidstvo ochr�nil pouze Innos a jeho vyvolen�. ");
	Doc_PrintLines(ndocid,1,"Innos n�s chra�, jestli by se m�la podobn� hrozba znovu objevit, proto�e ��dn� dal�� Innos�v vyvolen� nep�i�el u� v�c jak sto let.");
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
	description = "L�k pro posedl�";
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
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_golemchest;
	description = "M�ec";
	text[0] = "";
	text[1] = "";
	text[2] = "Tento v��ek je pln� minc�.";
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
	Snd_Play("M�ec");
};


instance ITWR_SHATTEREDGOLEM_MIS(C_ITEM)
{
	name = "Velmi star� mapa";
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
	description = "Dieg�v dopis Gerbrandtovi.";
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
	Doc_PrintLines(ndocid,0,"v�, m�l jsi m� rad�i zab�t. ");
	Doc_PrintLines(ndocid,0,"Te� jsem zp�tky ve m�st� a hled�m t�. A a� t� najdu, nad�l�m z tebe sekanou. Zn� m� u� dost dlouho, abys v�d�l, �e se jen tak lehce oblbnout nenech�m.");
	Doc_PrintLines(ndocid,0,"Po��t�m, �e kdy� jsi m� h�zel p�es bari�ru, ani ve snu t� nenapadlo, �e bych se mohl vr�tit. A to byla chyba. ");
	Doc_PrintLines(ndocid,0,"Vezmu si zp�tky, co mi pat��. ");
	Doc_PrintLines(ndocid,0,"Jestli je ti �ivot mil�, tak si sbal� fidl�tka a sv�j obchod p�enech� mn�. T�m si budeme kvit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Diego");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = "Pln� m�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_diegostreasure;
	description = "Diegov�v star� m�ec.";
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
	name = "Ultharova sv�cen� voda";
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
	name = "Akcie khorinissk�ch rudn�ch dol�";
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
	Doc_PrintLine(ndocid,0,"Akcie rudn�ch dol�");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"T�mto dokumentem d�v� kr�l a vl�dce t�to ��e jeho nositeli pr�vo kutat na �zem� pod kr�lovskou spr�vou.");
	Doc_PrintLines(ndocid,0,"Svou p�sobnost v�ak mus� omezit na jedno mal� kr�lovsk� pole.");
	Doc_PrintLines(ndocid,0,"Podle listiny o velikosti dol� �in� jedno mal� kr�lovsk� pole 16 yard� na ���ku a 3 yardy na v��ku.");
	Doc_PrintLines(ndocid,0,"Kr�lovsk� prospektor nen� povinen zajistit voln� p��stup a ochranu d�ln�ch cel.");
	Doc_PrintLines(ndocid,0,"Nebude-li n�jemce moci uhradit n�jemn�, p�ejdou v�echna pr�va zp�t pod spr�vu ��e.");
	Doc_PrintLine(ndocid,0,"     Podeps�n");
	Doc_PrintLine(ndocid,0,"     Kr�lovsk� prospektor");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Salandril");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"Ten chlap�k, kter� prodal d�ln� akcie obchodn�k�m, se jmenoval Salandril. Najdu ho nejsp� v horn� �tvrti Khorinisu, jestli tedy u� p�ed spravedlnost� neutekl n�kam d�l.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Salandril je mrtev. Mus�m to ozn�mit Serpentovi.");
		};
		ITWR_MINENANTEIL_MIS_ONETIME = TRUE;
	};
};


instance ITAM_PROT_BLACKEYE_MIS(C_ITEM)
{
	name = "Amulet p�ivol�v�n� du��";
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
	text[3] = "Amulet ochrany p�ed uhranut�m";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "K�men ze svat� p�dy";
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
	Doc_PrintLines(ndocid,0,"Morgaharde, ty mizern� budi�kni�emu! Bu� vypln� moje rozkazy, nebo se na�tvu a nech�m v�s v�echny zav��t, a� z�ern�te!");
	Doc_PrintLines(ndocid,0,"Mus�te to prov�st dneska v noci, Larius za��n� n�co tu�it. ");
	Doc_PrintLines(ndocid,0,"Jestli mu kapsy nevybereme te�, pak u� m��e b�t pozd�. Postar�m se, aby ses s n�m setkal dneska ve�er na trhu. ");
	Doc_PrintLines(ndocid,0,"Ale ne abys z toho d�lal estr�du, jinak t� domobrana zatkne, ne� se sta�� rozkoukat.");
	Doc_PrintLines(ndocid,0,"Mimochodem, kdyby p�itom n�hodou nat�hl brka, docela by se mi to hodilo.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Kr�lovsk� soudce ");
	Doc_PrintLine(ndocid,0,"          a tajemn�k");
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
	Doc_PrintLines(ndocid,0,"Pokra�uji d�l. Douf�m, �e a� se to trochu uklidn�, zase se setk�me.");
	Doc_PrintLines(ndocid,0,"��dn� strachy, ho�i. Kdy� sel�e v�echno ostatn�, po��d�m Onara, aby na to dohl�dl.");
	Doc_PrintLines(ndocid,0,"To bude v po��dku.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     M.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Mapa olt���";
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
	name = "Duch v�na";
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
	Doc_PrintLines(ndocid,0,"Moc hrozn�");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...u� jsem toho v �ivot� vyzkou�el spoustu, ale tohle ovoce, kter� mi minul� t�den p�ivezli z ciziny, p�ed�ilo v�echna m� o�ek�v�n�...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...���va z t�chto hrozn� je daleko vydatn�j��, ne� to, co lze z�skat v t�chto kon�in�ch...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...tak�e zat�m to jde dob�e. Ale po��d mi ned� sp�t pomy�len�, co by se mohlo st�t, kdyby n�kdo na�el m�j tajn� destila�n� apar�t. Rad�i ani nechci v�d�t, co by mi za to dr�bov� provedli - nakonec by m� mohli hodit p�es bari�ru...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...za��naj� m�t podez�en�. Rad�i se odsud uklid�m a chv�li po�k�m, a� se v�ci trochu uklidn� a budu se moci op�t vr�tit k pr�ci. Hlavn� mus�m m�t jistotu, �e po mn� u� nejdou...");
	Doc_Show(ndocid);
};

