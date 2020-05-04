
const int VALUE_GOLDNUGGET = 18;
const int VALUE_WHITEPEARL = 120;
const int VALUE_ADDON_JOINT_01 = 60;

instance ITMI_GOLDNUGGET_ADDON(C_ITEM)
{
	name = "Zlatý nugét";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDNUGGET;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_ADDON_WHITEPEARL(C_ITEM)
{
	name = "Perla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WHITEPEARL;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_ADDON_JOINT_01(C_ITEM)
{
	name = "Zelený novic";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ADDON_JOINT_01;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemename = "JOINT";
	on_state[0] = use_addon_joint_01;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


var int firstjoint;

func void use_addon_joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FIRSTJOINT == FALSE)
		{
			FIRSTJOINT = TRUE;
			b_giveplayerxp(5);
		};
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITMI_BALTRAMPAKET(C_ITEM)
{
	name = "Beltramova zásilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tìžký balík";
	text[3] = "plný dobrých vìcí";
	text[4] = "od farmáøe Akila";
};

instance ITMI_PACKET_BALTRAM4SKIP_ADDON(C_ITEM)
{
	name = "Balík pro Skipa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento tìžký balík";
	text[3] = "plný dobrých vìcí";
	text[4] = "je urèen pro piráta Skipa";
};

instance ITMI_BROMORSGELD_ADDON(C_ITEM)
{
	name = "Bromorùv zlatý pohár";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Jméno 'Bromor' je vyryto";
	text[3] = "ostrým pøedmìtem";
	text[4] = "na podstavci kalichu";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_ADDON_CAVALORNSBEUTEL(C_ITEM)
{
	name = "Cavalornova kožená brašna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_cavalornsbeutel;
	description = name;
	text[0] = "";
	text[1] = "Na tom visí štítek";
	text[2] = "se jménem 'Cavalorn'";
	text[3] = "a kus rudy se dá nalézt uvnitø.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cavalornsbeutel()
{
	CreateInvItems(hero,itmi_nugget,1);
	Print(PRINT_FOUNDORENUGGET);
	SC_OPENEDCAVALORNSBEUTEL = TRUE;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Uvnitø Cavalornovy chatrèe v Hornickém údolí jsem našel brašnu s kusem rudy uvnitø. Cavalorn, ten straý darebák, ji tu urèitì zapomnìl.");
};


instance ITMI_SKULL(C_ITEM)
{
	name = "Lebka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ITMI_IECELLO(C_ITEM)
{
	name = "Cedr";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemename = "CELLO";
	on_state[0] = use_cello;
	description = name;
};


func void use_cello()
{
};


instance ITMI_IECELLOBOW(C_ITEM)
{
	name = "Cedrový luk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDRUM(C_ITEM)
{
	name = "Buben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemename = "PAUKE";
	on_state[0] = use_drum;
	description = name;
};


func void use_drum()
{
};


instance ITMI_IEDRUMSCHEIT(C_ITEM)
{
	name = "Døevo na buben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemename = "DRUMSCHEIT";
	on_state[0] = use_drumscheit;
	description = name;
};


func void use_drumscheit()
{
};


instance ITMI_IEDRUMSTICK(C_ITEM)
{
	name = "Palièka k bubnu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDUDELBLAU(C_ITEM)
{
	name = "Modrá dýmka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};


func void use_dudel()
{
};


instance ITMI_IEDUDELGELB(C_ITEM)
{
	name = "Žlutá dýmka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};

instance ITMI_IEHARFE(C_ITEM)
{
	name = "Harfa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemename = "HARFE";
	on_state[0] = use_harfe;
	description = name;
};


func void use_harfe()
{
};


instance ITMI_IELAUTE(C_ITEM)
{
	name = "Loutna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemename = "IELAUTE";
	on_state[0] = use_laute;
	description = name;
};


func void use_laute()
{
};


instance ITMI_ADDON_LENNAR_PAKET(C_ITEM)
{
	name = "Rachotící balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	on_state[0] = use_lennarpaket;
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uvnitø je mnoho paklíèù,";
	text[3] = "";
	text[4] = "velmi mnoho.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_lennarpaket()
{
	b_playerfinditem(itke_lockpick,LENNAR_PICKLOCK_AMOUNT);
	Snd_Play("Geldbeutel");
	LENNARPAKET_OPEN = TRUE;
};


instance ITMI_ZEITSPALT_ADDON(C_ITEM)
{
	name = "Èerná ruda";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemename = "MAPSEALED";
	on_state[0] = use_zeitspalt_addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[3] = "Úèinek neznámý";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void use_zeitspalt_addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};

