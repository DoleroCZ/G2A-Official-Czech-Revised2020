
const int VALUE_RUM = 30;
const int MANA_RUM = 10;
const int VALUE_GROG = 10;
const int HP_GROG = 1;
const int VALUE_SCHNELLERHERING = 30;
const int VALUE_LOUSHAMMER = 30;
const int MANA_LOUSHAMMER = 1;
const int VALUE_SCHLAFHAMMER = 60;
const int VALUE_FIRESTEW = 180;
const int STR_FIRESTEW = 1;
const int HP_FIRESTEW = 5;
const int STR_MEATSOUP = 1;
const int VALUE_SHELLFLESH = 60;
const int HP_SHELLFLESH = 20;

instance ITFO_ADDON_SHELLFLESH(C_ITEM)
{
	name = "Maso ze �keble";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SHELLFLESH;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_shellflesh;
	description = name;
	text[0] = "�tavnat� maso ze �keble";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SHELLFLESH;
	text[2] = "Neva�en� chutn� v�te�n�.";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_shellflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SHELLFLESH);
};


instance ITFO_ADDON_RUM(C_ITEM)
{
	name = "Rum";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RUM;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = userum;
	scemename = "POTIONFAST";
	description = "B�l� Rum";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_RUM;
	text[5] = NAME_VALUE;
	count[5] = VALUE_RUM;
};


func void userum()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_RUM);
};


instance ITFO_ADDON_GROG(C_ITEM)
{
	name = "Grog";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_GROG;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usegrog;
	scemename = "POTIONFAST";
	description = "Prav� n�mo�nick� grog";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_GROG;
	text[5] = NAME_VALUE;
	count[5] = VALUE_GROG;
};


func void usegrog()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_GROG);
};


var int hammer_once;

instance ITFO_ADDON_LOUSHAMMER(C_ITEM)
{
	name = "Louovo Kladivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_LOUSHAMMER;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = uselouhammer;
	scemename = "POTIONFAST";
	description = "Louovo Kladivo";
	text[1] = "Efekt           ???";
	text[5] = NAME_VALUE;
	count[5] = VALUE_LOUSHAMMER;
};


func void uselouhammer()
{
	if(HAMMER_ONCE == FALSE)
	{
		b_raiseattribute(self,ATR_MANA_MAX,MANA_LOUSHAMMER);
		HAMMER_ONCE = TRUE;
	};
};


instance ITFO_ADDON_SCHLAFHAMMER(C_ITEM)
{
	name = "Dvojit� Louovo Kladivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SCHLAFHAMMER;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useschlafhammer;
	scemename = "POTIONFAST";
	description = "Dvojit� Louovo Kladivo";
	text[1] = "D�l� i z nejv�t��ch opilc� 'unaven�' ...";
	text[5] = NAME_VALUE;
	count[5] = VALUE_SCHLAFHAMMER;
};


func void useschlafhammer()
{
	if(self.attribute[ATR_HITPOINTS] > 2)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
	};
};


instance ITFO_ADDON_SCHNELLERHERING(C_ITEM)
{
	name = "Rychl� sle�";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SCHNELLERHERING;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useschnellerhering;
	scemename = "POTIONFAST";
	description = "Rychl� sle�";
	text[1] = "Vypad� nebezpe�n�!";
	text[2] = "Efekt nezn�m�.";
	text[3] = "�ast� postran� efekty!";
	text[5] = NAME_VALUE;
	count[5] = VALUE_SCHNELLERHERING;
};


func void useschnellerhering()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",120000);
	};
	PLAYER_KNOWSSCHNELLERHERING = TRUE;
};


instance ITFO_ADDON_PFEFFER_01(C_ITEM)
{
	name = "Kus pep�e";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = "�erven� pep�";
	text[0] = "z Ji�n�ch ostrov�";
	text[1] = "";
	text[2] = "";
	text[3] = "POZOR P�LIV�!";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITFO_ADDON_FIRESTEW(C_ITEM)
{
	name = "P�liv� pol�vka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FIRESTEW;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_firestew;
	description = name;
	text[1] = NAME_BONUS_STR;
	count[1] = STR_FIRESTEW;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FIRESTEW;
};


func void use_firestew()
{
	b_raiseattribute(self,ATR_STRENGTH,STR_FIRESTEW);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_FIRESTEW);
	PrintScreen("S�la a �ivotn� energie vzrostla",-1,34,FONT_SCREENSMALL,2);
};


instance ITFO_ADDON_MEATSOUP(C_ITEM)
{
	name = "Masov� pol�vka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISHSOUP;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_meatsoup;
	description = "Hork� masov� pol�vka ";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_MEATSOUP;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISHSOUP;
};


func void use_meatsoup()
{
	var string concattext;
	concattext = ConcatStrings(NAME_BONUS_STR,IntToString(STR_MEATSOUP));
	b_raiseattribute(self,ATR_STRENGTH,STR_MEATSOUP);
	PrintScreen(concattext,-1,34,FONT_SCREENSMALL,2);
};

