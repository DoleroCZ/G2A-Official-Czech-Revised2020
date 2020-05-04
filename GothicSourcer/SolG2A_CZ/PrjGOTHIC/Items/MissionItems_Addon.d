
instance ITWR_SATURASFIRSTMESSAGE_ADDON_SEALED(C_ITEM)
{
	name = "ZapeËetÏn· zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Tato zpr·va byla peËlivÏ zapeËetÏna.";
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
	Doc_PrintLine(ndocid,0,"V·ûen˝ Vatrasi,");
	Doc_PrintLines(ndocid,0,"Uû vÌme, jak dos·hnout port·lu. MÏl jsi pravdu. ");
	Doc_PrintLines(ndocid,0,"Jsou tam znaky uctÌvaË˘ Adanose. Chci tÏ poû·dat, abys zkontroloval mÈ pozn·mky a to, co jsem naöel.");
	Doc_PrintLines(ndocid,0,"Nikdy jsme nevidÏli takovÈ kameny.");
	Doc_PrintLines(ndocid,0,"ZemÏ se t¯ese bez nÏjakÈho d˘vodu.");
	Doc_PrintLines(ndocid,0,"P¯edpokl·d·m, ûe brzy zjistÌme p¯ÌËinu.");
	Doc_PrintLines(ndocid,0,"Ornament, kter˝ jsem naöel, m· vÏtöÌ v˝znam, neû jsem mu prvnÏ d·vali. Zd· se, ûe je to artefakt-klÌË. Ale nenÌ kompletnÌ. MusÌme to studovat d˘kladnÏji.");
	Doc_PrintLines(ndocid,0,"Poöli n·m sem nÏkoho z 'Kruhu vody'. A pokud moûno, neposÌlej Cavalorna. ");
	Doc_PrintLines(ndocid,0,"Uû jsem ho pouËil, aby ten dopis doruËil tobÏ. MyslÌm, ûe uû pro n·s udÏlal dost.");
	Doc_PrintLines(ndocid,0,"Douf·m, ûe jsem udÏlal spr·vnou vÏc.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_Show(ndocid);
	if((use_saturasfirstmessage_onetime == FALSE) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_KDW,"Dostal jsem tu zpr·vu od bandity, kterÈho asi Cavalorn poslal aby tu zpravu doruËil Vatrasovi.  NynÌ je to m· povinnost.");
		use_saturasfirstmessage_onetime = TRUE;
	};
	if(SC_KNOWSRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Je tu uskupenÌ, kterÈ si samo ¯Ìk· 'Kruh vody'. M·govÈ vody vnesli ¯·d do tohoto 'Kruhu vody'.");
	};
	if(SC_ISRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Cavalorn pat¯Ì do 'Kruhu vody'.");
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
	name = "Otev¯en· zpr·va ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage;
	scemename = "MAP";
	description = name;
	text[2] = "Saturas˘v dopis Vatrasovi";
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
	text[0] = "Zlomek kruhovÈho ornamentu";
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
	text[0] = "Zlomek kruhovÈho ornamentu";
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
	text[0] = "Tato mapa oznaËuje mÌsta";
	text[1] = "kde Nefarius p¯edpokl·d·, ûe jsou dalöÌ ornamenty.";
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
	text[0] = "Skip oznaËil mÌsto";
	text[1] = "kde najdu v˘dce bandit˘,";
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
	name = "AkvamarÌnov˝ prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ranger_addon;
	on_unequip = unequip_itri_ranger_addon;
	description = "»lensk˝ znak 'Kruhu vody'";
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
	text[1] = "Tento prsten pat¯Ì Laresovi";
};

instance ITRI_RANGER_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "Toto je m˘j prsten.";
};

instance ITRI_LANCERING(RANGERRING_PROTOTYPE)
{
	text[1] = "Tento prsten pat¯Ì Lancovi";
};

instance ITMI_PORTALRING_ADDON(C_ITEM)
{
	name = "Kruhov˝ ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhov˝ ornament";
	text[2] = "Tento krouûek otevÌr· port·l";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ITWR_MARTIN_MILIZEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Martin˘v doporuËujÌcÌ dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_martinmilizempfehlung_addon;
	scemename = "MAP";
	description = "DoporuËujÌcÌ dopis pro Lorda Andreho";
	text[2] = "Tento dopis by mi mÏl pomoci";
	text[3] = "se dostat k domobranÏ.";
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
	Doc_PrintLines(ndocid,0,"V·ûen˝ Sire Andre");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Doloûeno tÌmto dopisem, posÌl·m v·m novou posilu do domobrany. ");
	Doc_PrintLines(ndocid,0,"Shledal jsem ho uûiteËn˝m, peËliv˝m a d˘sledn˝m p¯i ¯eöenÌ sloûit˝ch ˙kol˘.");
	Doc_PrintLines(ndocid,0,"Jsem si jist, ûe bude dob¯e chr·nit kr·le a mÌr tohoto mÏsta.");
	Doc_PrintLine(ndocid,0,"Innos ochraÚuj kr·le");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Martin");
	Doc_Show(ndocid);
};


instance ITWR_RAVENSKIDNAPPERMISSION_ADDON(C_ITEM)
{
	name = "P¯Ìkazy";
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
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"NynÌ jsem dostal dopis. Raven, star˝ rudobaron, zajÌm· do otroctvÌ obËany Khorinisu. Raven se skr˝v· nÏkde severo-v˝chodnÏ od Krorinisu p¯es hory. Vatras by se mÏl podÌvat na tento dokument.");
		use_ravenskidnappermission_addon_onetime = TRUE;
	};
	SCKNOWSMISSINGPEOPLEAREINADDONWORLD = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"Dexte¯e, ty hajzle!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kdyû jsem byl jeötÏ rudobaronem, nebyls tak neschopn˝. ");
	Doc_PrintLines(ndocid,0,"Jestli nedok·ûeö dovÈst vÌce otrok˘ z Khorinisu, budeö mÌt velk˝ problÈm u n·s v doupÏti. ");
	Doc_PrintLines(ndocid,0,"Pot¯ebuji vÌce otrok˘ nebo se mi tu chlepi zaËnou bou¯it. A nemusÌm ti ¯Ìkat, co to znamen·?");
	Doc_PrintLines(ndocid,0,"Nebude mi trvat uû dlouho a dostanu se do chr·mu. A nem˘ûu si dovolit tedy û·dnÈ zav·h·nÌ.");
	Doc_PrintLines(ndocid,0,"Oh, a dalöÌ problÈm:");
	Doc_PrintLines(ndocid,0,"D¯Ìve nebo pozdÏji budeme muset najÌt jinou cestu do Khorinisu. Pir·ti n·m uû dlouho nebudou pom·hat, kdyû jim p¯estaneme platit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Raven");
	Doc_Show(ndocid);
};


instance ITWR_VATRAS_KDFEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Vatras˘v doporuËujÌcÌ dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatraskdfempfehlung_addon;
	scemename = "MAP";
	description = "Vatras˘v doporuËujÌcÌ dopis";
	text[2] = "Tento dopis mi pom˘ûe";
	text[3] = "vstoupit do kl·ötera m·g˘ ohnÏ";
	text[4] = "bez placenÌ. ";
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
	Doc_PrintLines(ndocid,0,"Brat¯i ohnÏ,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"pr·vÏ jsem byl informov·n o tom, jak˝ poplatek û·d·te za vstup do vaöÌ komunity");
	Doc_PrintLines(ndocid,0,"Tento dopis m· v rukou muû,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};


instance ITMI_LOSTINNOSSTATUE_DARON(C_ITEM)
{
	name = "Innosova cenn· soöka";
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
	name = "Dopis na rozlouËenou od Lucie";
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
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia napsala Elvrichovi dopis na rozlouËenou. On ji ale chce vidÏt.");
	MIS_LUCIASLETTER = LOG_RUNNING;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mil˝ Elvrichu,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nem·m slova, kter˝mi bych se ti mohla omluvit. VÌm, ûe bude tÏûkÈ to pochopit, ale dospÏla jsem k z·vÏru,");
	Doc_PrintLines(ndocid,0,"ûe to tak bude pro n·s oba lepöÌ. Najdeö si mÌsto mÏ jinou, lepöÌ holku.");
	Doc_PrintLines(ndocid,0,"Nikdy se nevr·tÌm zpÏt, odkud jsem p¯iöla. ZapomÏÚ na mÏ. Holky jako j· je pro tebe ökoda. Sbohem.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lucia");
	Doc_Show(ndocid);
};


prototype EFFECTITEMPROTOTYPE_ADDON(C_ITEM)
{
	name = "K·men";
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
	name = "Hr·bÏ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "Hr·bÏ";
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
	name = "Prsten ¯·du";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Ryt˝ prsten";
	text[2] = "z·mo¯skÈho cechu Araxos";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITWR_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Dod·vka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_addon_bandittrader;
	scemename = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis od bandit˘";
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
	Doc_PrintLines(ndocid,0,"15 kr·tk˝ch meË˘");
	Doc_PrintLines(ndocid,0,"20 meË˘");
	Doc_PrintLines(ndocid,0,"25 bochnÌk˘ chleba ");
	Doc_PrintLines(ndocid,0,"15 lahvÌ vÌna");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Toto je poslednÌ moûnost. ");
	Doc_PrintLines(ndocid,0,"Vöe je st·le vÌce a vÌce nebezpeËnÈ.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Fernando");
	Doc_Show(ndocid);
	if((MIS_VATRAS_FINDTHEBANDITTRADER != 0) && (use_itwr_addon_bandittrader_onetime == FALSE))
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Naöel jsem dokument, kter˝ ukazuje, ûe Fernando je ten, kdo doruËuje zbranÏ bandit˘m.");
		use_itwr_addon_bandittrader_onetime = TRUE;
	};
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN(C_ITEM)
{
	name = "ZapeËetÏn· zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Vatrasova zpr·va Saturasovi";
};


func void use_vatras2saturas_findraven()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"V·ûen˝ Saturasi");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Douf·m, ûe uû to budeö mÌt. Situace tady ve mÏstÏ je ËÌm d·l tÌm horöÌ. Je to jako klid p¯ed bou¯Ì. ProsÌm pospÏö. Pot¯ebuji tÏ zde.");
	Doc_PrintLines(ndocid,0,"Prostudoval jsem tvÈ pozn·mky a mÏl jsi pravdu. Symboly udÏlala nÏjak· kultura, kter· uctÌvala Adanose. Proto musÌö b˝t opatrn˝ a nezaslepit se faleön˝mi podez¯enÌmi.");
	Doc_PrintLines(ndocid,0,"MizejÌcÌ obËany m· na svÏdomÌ b˝val˝ rudobaron Raven. Port·l n·s zavede do zemÏ, kde se nÏkde skr˝v·.");
	Doc_PrintLines(ndocid,0,"A jeötÏ nÏco: PosÌl·m ti pomoc. Nositel tohoto dokumentu je v˝jimeËn˝. M· podivn˝ t¯pyt v oËÌch kdykoliv se na v·s podÌv·. Nejsem jeötÏ ˙plnÏ p¯esvÏdËen, ale mohl by to b˝t ON, i kdyû jsme si ho p¯edstavovali jinak.");
	Doc_PrintLines(ndocid,0,"Otestuj ho. MyslÌm, ûe je dobr˝.");
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
	name = "Otev¯en· zpr·va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven;
	scemename = "MAP";
	description = name;
	text[2] = "Vatrasova zpr·va Saturasovi";
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
	text[2] = "Obsahuje bludiËku";
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
	name = "Maso z moË·lovÈ krysy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	description = name;
	text[1] = "SmrdÌ rybinou";
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};

instance ITRI_ADDON_MORGANSRING_MISSION(C_ITEM)
{
	name = "Morgan˘v prsten";
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
	text[1] = "Prsten je zdoben velk˝m mnoûstvÌm run.";
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
	name = "Ohniskov˝ k·men";
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
	name = "BalÌk s ocelÌ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento balÌk je opravdu tÏûk˝.";
	text[3] = "Obsahuje dost oceli.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_STONEPLATECOMMON_ADDON(C_ITEM)
{
	name = "Star· kamenn· deska";
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
	text[2] = "äed· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"Kasta v·leËnÌk˘ vyvolala hnÏv naöich boh˘.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"RHADEMES, n·slednÌk QUAHODRONA byl poraûen. Ale jeho zlo n·s odsud vyk·zalo do exilu.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jsme proti tomu bezmocnÌ.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"ADANOSŸV hnÏv niËÌ JHARKENDAR!");
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
	name = "»erven· kamenn· deska";
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
	text[2] = "»erven· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"My, zbylÌ v˘dci koncilu pÏti, jsme zapeËetili vstup do chr·mu. Aby ME» nevidÏl jiû nikdy svÏtlo dennÌ.");
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
	name = "élut· kamenn· deska";
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
	text[2] = "élut· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"J·, ten, kdo svolal koncil, jsem vybudoval prvnÌ past. A pouze j· zn·m spr·vnÈ dve¯e.");
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
	name = "Modr· kamenn· deska";
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
	text[2] = "Modr· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"KHARDIMON vymyslel druhou past. Pouze on, ten, kdo nikdy nesklouzl z cesty svÏtla, dos·hl t¯etÌ komnaty.");
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
	name = "Zelen· kamenn· deska";
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
	text[2] = "Zelen· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"T¯etÌ past byla vybudov·na QUARHODRONEM, a pouze on vÌ, jak otev¯Ìt dve¯e.");
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
	name = "Fialov· kamenn· deska";
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
	text[2] = "Fialov· kamenn· deska";
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
		Doc_PrintLines(ndocid,0,"QUARHODRON byl jedinn˝, kdo s pomocÌ KHARDIMONA zapeËetil vstupnÌ dve¯e chr·mu. Nikdo ritu·l nep¯eûil.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jen j· jsem z˘stal a vydal svÏtu svÏdectvÌ.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Aù RHADEMES hnije v chr·mu navÏky!");
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
	name = "Zlat˝ kompas";
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
	text[0] = "Pokladnice je docela teûk·";
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
	Snd_Play("MÏöec");
	Print("Velice pln˝!");
};


instance ITWR_ADDON_FRANCISABRECHNUNG_MIS(C_ITEM)
{
	name = "V˝platnÌ listina";
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
	Doc_PrintLine(ndocid,0,"ObchodnÌ loÔ 'Mo¯sk· panna'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hotovost celkem: 15560 zlata");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Pos·dka        : 9840");
	Doc_PrintLine(ndocid,0,"⁄¯ednÌci       : 2500");
	Doc_PrintLine(ndocid,0,"Kapit·n        : 1000");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"m˘j podÌl      : 2220");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Z·mo¯sk· loÔ 'Miriam'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Hotovost celkem: 4390 zlata");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Pos·dka        : 2390");
	Doc_PrintLine(ndocid,0,"⁄¯ednÌci       :  500");
	Doc_PrintLine(ndocid,0,"Kapit·n        :  500");
	Doc_PrintLine(ndocid,0,"----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"m˘j podÌl      : 1000");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"ObchodnÌ loÔ 'Nico'");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Hotovost celkem: 9970 zlata");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Pos·dka        : 5610");
	Doc_PrintLine(ndocid,1,"⁄¯ednÌci       : 1500");
	Doc_PrintLine(ndocid,1,"Kapit·n        : 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"m˘j podÌl      : 1860");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"ObchodnÌ loÔ 'Maria'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Hotovost celkem: 7221 zlata");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Pos·dka        : 4400");
	Doc_PrintLine(ndocid,1,"⁄¯ednÌci       :  750");
	Doc_PrintLine(ndocid,1,"Kapit·n        : 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"m˘j podÌl      : 1071");
	Doc_PrintLine(ndocid,1,"");
	FRANCIS_HASPROOF = TRUE;
	Doc_Show(ndocid);
	b_say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_ADDON_GREGSLOGBUCH_MIS(C_ITEM)
{
	name = "Z·pisnÌk";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Greg˘v z·pisnÌk";
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
	Doc_PrintLines(ndocid,0,"Uû tuto pl·û nem˘ûu vyst·t. PÌsek je vöude. Nem˘ûu dokonce sp·t, protoûe mÏ vöude svÏdÌ. »as p¯eje Ravenovi a jeho zlatu a n·s zniËÌ. MyslÌm, ûe budu muset tomu samozvanci domluvit.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kdo si myslÌ, ûe je?  MyslÌ si, ûe mÏ odradÌ ti jeho kamar·dÌËci? Brzy pozn·, s k˝m si to zaËal. A jeho p¯ÌtelÌËek Bloodwyn bude prvnÌm, kdo padne mou rukou.");
	Doc_PrintLines(ndocid,0,"Jestli brzy nezaplatÌ, budu muset b˝t opravdu hodnÏ  nep¯Ìjemn˝. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLines(ndocid,1,"BanditÈ se st·vajÌ st·le drzejöÌ. St·le jeötÏ nemajÌ zaplacenou poslednÌ dod·vku. Ale nem·me dost informacÌ. MusÌm zjistit, co m· Raven za lubem.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Vezmu vetöinu svÈ pos·dky a zabezpeËÌm rudu. Francis z˘stane zde a opevnÌ t·bor. ");
	Doc_PrintLines(ndocid,1,"Abych zjistil, co majÌ za lubem, dal jsem Bonesovi banditÌ brnÏnÌ. ProplÌûÌ se s nÌm do t·bora bandit˘ a zjistÌ, co se tam dÏje.");
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
	description = "Bloodwyn˘v klÌË ";
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
	description = "KlÌË kamennÈho str·ûce";
	text[2] = "Pasuje k truhle";
	text[3] = "v podivnÈ budovÏ v baûin·ch";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEMPELTORKEY(C_ITEM)
{
	name = "Kamenn· deska Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemename = "MAP";
	on_state[0] = use_tempeltorkey;
	text[2] = "KlÌË k chr·mu Adanose";
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
	name = "Mapa poklad˘";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_treasuremap;
	description = name;
	text[0] = "";
	text[1] = "Jsou tu nÏjakÈ zaznaËenÈ mÌsta.";
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
	name = "Zpr·va v lahvi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_gregsbottle;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Uvnit¯ je kus papÌru.";
};


func void use_gregsbottle()
{
	b_playerfinditem(itwr_addon_treasuremap,1);
};


instance ITMI_EROLSKELCH(C_ITEM)
{
	name = "Poökr·ban˝ st¯Ìbrn˝ kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

