
instance ITWR_SATURASFIRSTMESSAGE_ADDON_SEALED(C_ITEM)
{
	name = "Zape�et�n� zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Tato zpr�va byla pe�liv� zape�et�na.";
};


var int use_saturasfirstmessage_onetime;

func void use_saturasfirstmessage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"V�en� Vatrasi,");
	Doc_PrintLines(ndocid,0,"U� v�me, jak dos�hnout port�lu. M�l jsi pravdu. ");
	Doc_PrintLines(ndocid,0,"Jsou tam znaky uct�va�� Adanose. Chci t� po��dat, abys zkontroloval m� pozn�mky a to, co jsem na�el.");
	Doc_PrintLines(ndocid,0,"Nikdy jsme nevid�li takov� kameny.");
	Doc_PrintLines(ndocid,0,"Zem� se t�ese bez n�jak�ho d�vodu.");
	Doc_PrintLines(ndocid,0,"P�edpokl�d�m, �e brzy zjist�me p���inu.");
	Doc_PrintLines(ndocid,0,"Ornament, kter� jsem na�el, m� v�t�� v�znam, ne� jsem mu prvn� d�vali. Zd� se, �e je to artefakt-kl��. Ale nen� kompletn�. Mus�me to studovat d�kladn�ji.");
	Doc_PrintLines(ndocid,0,"Po�li n�m sem n�koho z 'Kruhu vody'. A pokud mo�no, nepos�lej Cavalorna. ");
	Doc_PrintLines(ndocid,0,"U� jsem ho pou�il, aby ten dopis doru�il tob�. Mysl�m, �e u� pro n�s ud�lal dost.");
	Doc_PrintLines(ndocid,0,"Douf�m, �e jsem ud�lal spr�vnou v�c.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_Show(ndocid);
	if((use_saturasfirstmessage_onetime == FALSE) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_KDW,"Dostal jsem tu zpr�vu od bandity, kter�ho asi Cavalorn poslal aby tu zpravu doru�il Vatrasovi.  Nyn� je to m� povinnost.");
		use_saturasfirstmessage_onetime = TRUE;
	};
	if(SC_KNOWSRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Je tu uskupen�, kter� si samo ��k� 'Kruh vody'. M�gov� vody vnesli ��d do tohoto 'Kruhu vody'.");
	};
	if(SC_ISRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Cavalorn pat�� do 'Kruhu vody'.");
	};
	SC_KNOWSRANGER = TRUE;
};

func void use_saturasfirstmessage_sealed()
{
	CreateInvItems(self,itwr_saturasfirstmessage_addon,1);
	SATURASFIRSTMESSAGEOPENED = TRUE;
	use_saturasfirstmessage();
};


instance ITWR_SATURASFIRSTMESSAGE_ADDON(C_ITEM)
{
	name = "Otev�en� zpr�va ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage;
	scemename = "MAP";
	description = name;
	text[2] = "Saturas�v dopis Vatrasovi";
};

instance ITMI_ORNAMENT_ADDON(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Zlomek kruhov�ho ornamentu";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITMI_ORNAMENT_ADDON_VATRAS(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Zlomek kruhov�ho ornamentu";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON(C_ITEM)
{
	name = "Nefariusova mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_ornaments;
	description = name;
	text[0] = "Tato mapa ozna�uje m�sta";
	text[1] = "kde Nefarius p�edpokl�d�, �e jsou dal�� ornamenty.";
	text[2] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_ornaments()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_ornaments_addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_DEXTER(C_ITEM)
{
	name = "Mapa Khorinisu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_dexter;
	description = name;
	text[0] = "Skip ozna�il m�sto";
	text[1] = "kde najdu v�dce bandit�,";
	text[2] = "Dextera.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_dexter()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_dexter);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


prototype RANGERRING_PROTOTYPE(C_ITEM)
{
	name = "Akvamar�nov� prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ranger_addon;
	on_unequip = unequip_itri_ranger_addon;
	description = "�lensk� znak 'Kruhu vody'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void equip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,itri_ranger_addon) == FALSE)
			{
				RANGERRINGISLARESRING = TRUE;
			};
		};
		SCISWEARINGRANGERRING = TRUE;
		Print(PRINT_ADDON_SCISWEARINGRANGERRING);
	};
};

func void unequip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_ISRANGER == FALSE)
		{
			SCISWEARINGRANGERRING = FALSE;
		};
		RANGERRINGISLARESRING = FALSE;
	};
};


instance ITRI_RANGER_LARES_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "Tento prsten pat�� Laresovi";
};

instance ITRI_RANGER_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "Toto je m�j prsten.";
};

instance ITRI_LANCERING(RANGERRING_PROTOTYPE)
{
	text[1] = "Tento prsten pat�� Lancovi";
};

instance ITMI_PORTALRING_ADDON(C_ITEM)
{
	name = "Kruhov� ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhov� ornament";
	text[2] = "Tento krou�ek otev�r� port�l";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ITWR_MARTIN_MILIZEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Martin�v doporu�uj�c� dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_martinmilizempfehlung_addon;
	scemename = "MAP";
	description = "Doporu�uj�c� dopis pro Lorda Andreho";
	text[2] = "Tento dopis by mi m�l pomoci";
	text[3] = "se dostat k domobran�.";
};


func void use_martinmilizempfehlung_addon()
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
	Doc_PrintLines(ndocid,0,"V�en� Sire Andre");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dolo�eno t�mto dopisem, pos�l�m v�m novou posilu do domobrany. ");
	Doc_PrintLines(ndocid,0,"Shledal jsem ho u�ite�n�m, pe�liv�m a d�sledn�m p�i �e�en� slo�it�ch �kol�.");
	Doc_PrintLines(ndocid,0,"Jsem si jist, �e bude dob�e chr�nit kr�le a m�r tohoto m�sta.");
	Doc_PrintLine(ndocid,0,"Innos ochra�uj kr�le");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Martin");
	Doc_Show(ndocid);
};


instance ITWR_RAVENSKIDNAPPERMISSION_ADDON(C_ITEM)
{
	name = "P��kazy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ravenskidnappermission_addon;
	scemename = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis";
	text[3] = "od bandity Dextera.";
};


var int use_ravenskidnappermission_addon_onetime;

func void use_ravenskidnappermission_addon()
{
	var int ndocid;
	if((use_ravenskidnappermission_addon_onetime == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE != 0))
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Nyn� jsem dostal dopis. Raven, star� rudobaron, zaj�m� do otroctv� ob�any Khorinisu. Raven se skr�v� n�kde severo-v�chodn� od Krorinisu p�es hory. Vatras by se m�l pod�vat na tento dokument.");
		use_ravenskidnappermission_addon_onetime = TRUE;
	};
	SCKNOWSMISSINGPEOPLEAREINADDONWORLD = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"Dexte�e, ty hajzle!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kdy� jsem byl je�t� rudobaronem, nebyls tak neschopn�. ");
	Doc_PrintLines(ndocid,0,"Jestli nedok�e� dov�st v�ce otrok� z Khorinisu, bude� m�t velk� probl�m u n�s v doup�ti. ");
	Doc_PrintLines(ndocid,0,"Pot�ebuji v�ce otrok� nebo se mi tu chlepi za�nou bou�it. A nemus�m ti ��kat, co to znamen�?");
	Doc_PrintLines(ndocid,0,"Nebude mi trvat u� dlouho a dostanu se do chr�mu. A nem��u si dovolit tedy ��dn� zav�h�n�.");
	Doc_PrintLines(ndocid,0,"Oh, a dal�� probl�m:");
	Doc_PrintLines(ndocid,0,"D��ve nebo pozd�ji budeme muset naj�t jinou cestu do Khorinisu. Pir�ti n�m u� dlouho nebudou pom�hat, kdy� jim p�estaneme platit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Raven");
	Doc_Show(ndocid);
};


instance ITWR_VATRAS_KDFEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Vatras�v doporu�uj�c� dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatraskdfempfehlung_addon;
	scemename = "MAP";
	description = "Vatras�v doporu�uj�c� dopis";
	text[2] = "Tento dopis mi pom��e";
	text[3] = "vstoupit do kl�tera m�g� ohn�";
	text[4] = "bez placen�. ";
};


func void use_vatraskdfempfehlung_addon()
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
	Doc_PrintLines(ndocid,0,"Brat�i ohn�,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"pr�v� jsem byl informov�n o tom, jak� poplatek ��d�te za vstup do va�� komunity");
	Doc_PrintLines(ndocid,0,"Tento dopis m� v rukou mu�,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};


instance ITMI_LOSTINNOSSTATUE_DARON(C_ITEM)
{
	name = "Innosova cenn� so�ka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LUCIASLOVELETTER_ADDON(C_ITEM)
{
	name = "Dopis na rozlou�enou od Lucie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luciasloveletter_addon;
	scemename = "MAP";
	description = name;
};


func void use_luciasloveletter_addon()
{
	var int ndocid;
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia napsala Elvrichovi dopis na rozlou�enou. On ji ale chce vid�t.");
	MIS_LUCIASLETTER = LOG_RUNNING;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mil� Elvrichu,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nem�m slova, kter�mi bych se ti mohla omluvit. V�m, �e bude t�k� to pochopit, ale dosp�la jsem k z�v�ru,");
	Doc_PrintLines(ndocid,0,"�e to tak bude pro n�s oba lep��. Najde� si m�sto m� jinou, lep�� holku.");
	Doc_PrintLines(ndocid,0,"Nikdy se nevr�t�m zp�t, odkud jsem p�i�la. Zapom�� na m�. Holky jako j� je pro tebe �koda. Sbohem.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lucia");
	Doc_Show(ndocid);
};


prototype EFFECTITEMPROTOTYPE_ADDON(C_ITEM)
{
	name = "K�men";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_AMBOSSEFFEKT_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FOREST_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_BIGFARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_RAKE(C_ITEM)
{
	name = "Hr�b�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "Hr�b�";
	on_state[1] = use_rake;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void use_rake()
{
};


instance ITRI_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Prsten ��du";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Ryt� prsten";
	text[2] = "z�mo�sk�ho cechu Araxos";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITWR_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Dod�vka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_addon_bandittrader;
	scemename = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis od bandit�";
	text[3] = "za Sekobovou farmou.";
};


var int use_itwr_addon_bandittrader_onetime;

func void use_itwr_addon_bandittrader()
{
	var int ndocid;
	BANDITTRADER_LIEFERUNG_GELESEN = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"15 kr�tk�ch me��");
	Doc_PrintLines(ndocid,0,"20 me��");
	Doc_PrintLines(ndocid,0,"25 bochn�k� chleba ");
	Doc_PrintLines(ndocid,0,"15 lahv� v�na");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Toto je posledn� mo�nost. ");
	Doc_PrintLines(ndocid,0,"V�e je st�le v�ce a v�ce nebezpe�n�.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Fernando");
	Doc_Show(ndocid);
	if((MIS_VATRAS_FINDTHEBANDITTRADER != 0) && (use_itwr_addon_bandittrader_onetime == FALSE))
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Na�el jsem dokument, kter� ukazuje, �e Fernando je ten, kdo doru�uje zbran� bandit�m.");
		use_itwr_addon_bandittrader_onetime = TRUE;
	};
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN(C_ITEM)
{
	name = "Zape�et�n� zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Vatrasova zpr�va Saturasovi";
};


func void use_vatras2saturas_findraven()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"V�en� Saturasi");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Douf�m, �e u� to bude� m�t. Situace tady ve m�st� je ��m d�l t�m hor��. Je to jako klid p�ed bou��. Pros�m posp�. Pot�ebuji t� zde.");
	Doc_PrintLines(ndocid,0,"Prostudoval jsem tv� pozn�mky a m�l jsi pravdu. Symboly ud�lala n�jak� kultura, kter� uct�vala Adanose. Proto mus� b�t opatrn� a nezaslepit se fale�n�mi podez�en�mi.");
	Doc_PrintLines(ndocid,0,"Mizej�c� ob�any m� na sv�dom� b�val� rudobaron Raven. Port�l n�s zavede do zem�, kde se n�kde skr�v�.");
	Doc_PrintLines(ndocid,0,"A je�t� n�co: Pos�l�m ti pomoc. Nositel tohoto dokumentu je v�jime�n�. M� podivn� t�pyt v o��ch kdykoliv se na v�s pod�v�. Nejsem je�t� �pln� p�esv�d�en, ale mohl by to b�t ON, i kdy� jsme si ho p�edstavovali jinak.");
	Doc_PrintLines(ndocid,0,"Otestuj ho. Mysl�m, �e je dobr�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};

func void use_vatras2saturas_findraven_sealed()
{
	CreateInvItems(self,itwr_vatras2saturas_findraven_opened,1);
	VATRAS2SATURAS_FINDRAVEN_OPEN = TRUE;
	use_vatras2saturas_findraven();
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN_OPENED(C_ITEM)
{
	name = "Otev�en� zpr�va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven;
	scemename = "MAP";
	description = name;
	text[2] = "Vatrasova zpr�va Saturasovi";
};

instance ITAM_ADDON_WISPDETECTOR(C_ITEM)
{
	name = "Amulet z rudy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEXSTRG;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_wispdetector;
	on_unequip = unequip_wispdetector;
	description = "Amulet z rudy";
	text[2] = "Obsahuje bludi�ku";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int equip_wispdetector_onetime;

func void equip_wispdetector()
{
	var C_NPC detwsp;
	if(equip_wispdetector_onetime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WISPSEARCHING = WISPSEARCH_NF;
		equip_wispdetector_onetime = TRUE;
	};
	detwsp = Hlp_GetNpc(wisp_detector);
	AI_Teleport(detwsp,"TOT");
	Wld_SpawnNpcRange(self,wisp_detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",wisp_detector,wisp_detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void unequip_wispdetector()
{
	var C_NPC detwsp;
	detwsp = Hlp_GetNpc(wisp_detector);
	if(Npc_IsDead(detwsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(detwsp,"TOT");
	b_removenpc(detwsp);
	AI_Teleport(detwsp,"TOT");
};


instance ITFO_ADDON_KROKOFLEISCH_MISSION(C_ITEM)
{
	name = "Maso z mo��lov� krysy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	description = name;
	text[1] = "Smrd� rybinou";
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};

instance ITRI_ADDON_MORGANSRING_MISSION(C_ITEM)
{
	name = "Morgan�v prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_morgansring;
	on_unequip = unequip_morgansring;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[1] = "Prsten je zdoben velk�m mno�stv�m run.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITMI_FOCUS(C_ITEM)
{
	name = "Ohniskov� k�men";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ITMI_ADDON_STEEL_PAKET(C_ITEM)
{
	name = "Bal�k s ocel�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento bal�k je opravdu t�k�.";
	text[3] = "Obsahuje dost oceli.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_STONEPLATECOMMON_ADDON(C_ITEM)
{
	name = "Star� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATECOMMON;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_stoneplatecommon;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "�ed� kamenn� deska";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STONEPLATECOMMON;
};


func void use_stoneplatecommon()
{
	var int ndocid;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,-1,70,50,90,50,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Kasta v�le�n�k� vyvolala hn�v na�ich boh�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"RHADEMES, n�sledn�k QUAHODRONA byl pora�en. Ale jeho zlo n�s odsud vyk�zalo do exilu.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jsme proti tomu bezmocn�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"ADANOS�V hn�v ni�� JHARKENDAR!");
	}
	else
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_02.TGA",0);
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_01(C_ITEM)
{
	name = "�erven� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_01;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "�erven� kamenn� deska";
	text[3] = "";
};


func void use_addon_stone_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"My, zbyl� v�dci koncilu p�ti, jsme zape�etili vstup do chr�mu. Aby ME� nevid�l ji� nikdy sv�tlo denn�.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_05(C_ITEM)
{
	name = "�lut� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_05;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "�lut� kamenn� deska";
	text[3] = "";
};


func void use_addon_stone_05()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"J�, ten, kdo svolal koncil, jsem vybudoval prvn� past. A pouze j� zn�m spr�vn� dve�e.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_03(C_ITEM)
{
	name = "Modr� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_03;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Modr� kamenn� deska";
	text[3] = "";
};


func void use_addon_stone_03()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON vymyslel druhou past. Pouze on, ten, kdo nikdy nesklouzl z cesty sv�tla, dos�hl t�et� komnaty.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_04(C_ITEM)
{
	name = "Zelen� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_04;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Zelen� kamenn� deska";
	text[3] = "";
};


func void use_addon_stone_04()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"T�et� past byla vybudov�na QUARHODRONEM, a pouze on v�, jak otev��t dve�e.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_02(C_ITEM)
{
	name = "Fialov� kamenn� deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_02;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Fialov� kamenn� deska";
	text[3] = "";
};


func void use_addon_stone_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON byl jedinn�, kdo s pomoc� KHARDIMONA zape�etil vstupn� dve�e chr�mu. Nikdo ritu�l nep�e�il.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jen j� jsem z�stal a vydal sv�tu sv�dectv�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"A� RHADEMES hnije v chr�mu nav�ky!");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_KOMPASS_MIS(C_ITEM)
{
	name = "Zlat� kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITSE_ADDON_FRANCISCHEST(C_ITEM)
{
	name = "Pokladnice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = francischest;
	description = "Pokladnice";
	text[0] = "Pokladnice je docela te�k�";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void francischest()
{
	CreateInvItems(hero,itmi_goldchest,1);
	CreateInvItems(hero,itmw_francisdagger_mis,1);
	CreateInvItems(hero,itmi_gold,153);
	CreateInvItems(hero,itmi_goldcup,1);
	CreateInvItems(hero,itmi_silvernecklace,1);
	CreateInvItems(hero,itwr_addon_francisabrechnung_mis,1);
	Snd_Play("M�ec");
	Print("Velice pln�!");
};


instance ITWR_ADDON_FRANCISABRECHNUNG_MIS(C_ITEM)
{
	name = "V�platn� listina";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usefrancisabrechnung_mis;
};


func void usefrancisabrechnung_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Obchodn� lo� 'Mo�sk� panna'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hotovost celkem: 15560 zlata");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Pos�dka        : 9840");
	Doc_PrintLine(ndocid,0,"��edn�ci       : 2500");
	Doc_PrintLine(ndocid,0,"Kapit�n        : 1000");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"m�j pod�l      : 2220");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Z�mo�sk� lo� 'Miriam'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hotovost celkem: 4390 zlata");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Pos�dka        : 2390");
	Doc_PrintLine(ndocid,0,"��edn�ci       :  500");
	Doc_PrintLine(ndocid,0,"Kapit�n        :  500");
	Doc_PrintLine(ndocid,0,"----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"m�j pod�l      : 1000");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Obchodn� lo� 'Nico'");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Hotovost celkem: 9970 zlata");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Pos�dka        : 5610");
	Doc_PrintLine(ndocid,1,"��edn�ci       : 1500");
	Doc_PrintLine(ndocid,1,"Kapit�n        : 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"m�j pod�l      : 1860");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Obchodn� lo� 'Maria'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Hotovost celkem: 7221 zlata");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Pos�dka        : 4400");
	Doc_PrintLine(ndocid,1,"��edn�ci       :  750");
	Doc_PrintLine(ndocid,1,"Kapit�n        : 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"m�j pod�l      : 1071");
	Doc_PrintLine(ndocid,1,"");
	FRANCIS_HASPROOF = TRUE;
	Doc_Show(ndocid);
	b_say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_ADDON_GREGSLOGBUCH_MIS(C_ITEM)
{
	name = "Z�pisn�k";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Greg�v z�pisn�k";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegregslogbuch;
};


func void usegregslogbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLines(ndocid,0,"U� tuto pl� nem��u vyst�t. P�sek je v�ude. Nem��u dokonce sp�t, proto�e m� v�ude sv�d�. �as p�eje Ravenovi a jeho zlatu a n�s zni��. Mysl�m, �e budu muset tomu samozvanci domluvit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kdo si mysl�, �e je?  Mysl� si, �e m� odrad� ti jeho kamar�d��ci? Brzy pozn�, s k�m si to za�al. A jeho p��tel��ek Bloodwyn bude prvn�m, kdo padne mou rukou.");
	Doc_PrintLines(ndocid,0,"Jestli brzy nezaplat�, budu muset b�t opravdu hodn�  nep��jemn�. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLines(ndocid,1,"Bandit� se st�vaj� st�le drzej��. St�le je�t� nemaj� zaplacenou posledn� dod�vku. Ale nem�me dost informac�. Mus�m zjistit, co m� Raven za lubem.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Vezmu vet�inu sv� pos�dky a zabezpe��m rudu. Francis z�stane zde a opevn� t�bor. ");
	Doc_PrintLines(ndocid,1,"Abych zjistil, co maj� za lubem, dal jsem Bonesovi bandit� brn�n�. Propl�� se s n�m do t�bora bandit� a zjist�, co se tam d�je.");
	GREG_GAVEARMORTOBONES = TRUE;
	Doc_Show(ndocid);
};


instance ITKE_ADDON_BLOODWYN_01(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Bloodwyn�v kl�� ";
	text[2] = "Pasuje k truhle";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ADDON_HEILER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Kl�� kamenn�ho str�ce";
	text[2] = "Pasuje k truhle";
	text[3] = "v podivn� budov� v ba�in�ch";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEMPELTORKEY(C_ITEM)
{
	name = "Kamenn� deska Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemename = "MAP";
	on_state[0] = use_tempeltorkey;
	text[2] = "Kl�� k chr�mu Adanose";
};


func void use_tempeltorkey()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  Jhehedra Akhantar");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_BLOODWYN_KOPF(C_ITEM)
{
	name = "Bloodwynova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_ADDON_TREASUREMAP(C_ITEM)
{
	name = "Mapa poklad�";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_treasuremap;
	description = name;
	text[0] = "";
	text[1] = "Jsou tu n�jak� zazna�en� m�sta.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_treasuremap()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_addon_treasuremap);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};


instance ITMI_ADDON_GREGSTREASUREBOTTLE_MIS(C_ITEM)
{
	name = "Zpr�va v lahvi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_gregsbottle;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Uvnit� je kus pap�ru.";
};


func void use_gregsbottle()
{
	b_playerfinditem(itwr_addon_treasuremap,1);
};


instance ITMI_EROLSKELCH(C_ITEM)
{
	name = "Po�kr�ban� st��brn� kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

