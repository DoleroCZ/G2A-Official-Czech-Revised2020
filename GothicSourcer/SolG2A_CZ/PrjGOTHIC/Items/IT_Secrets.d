
instance ITSE_ERZFISCH(C_ITEM)
{
	name = "Balonov� ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_erzfisch;
	description = name;
	text[2] = "V t�to ryb� je cosi ukryto.";
};


func void use_erzfisch()
{
	b_playerfinditem(itmi_nugget,1);
};


instance ITSE_GOLDFISCH(C_ITEM)
{
	name = "T�k� ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_goldfisch;
	description = name;
	text[2] = "V t�to ryb� je cosi ukryto.";
};


func void use_goldfisch()
{
	b_playerfinditem(itmi_gold,50);
};


instance ITSE_RINGFISCH(C_ITEM)
{
	name = "Mal� ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_ringfisch;
	description = name;
	text[2] = "V t�to ryb� je cosi ukryto.";
};


func void use_ringfisch()
{
	b_playerfinditem(itri_prot_fire_01,1);
};


instance ITSE_LOCKPICKFISCH(C_ITEM)
{
	name = "Lehk� ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_lockpickfisch;
	description = name;
	text[2] = "V t�to ryb� je cosi ukryto.";
};


func void use_lockpickfisch()
{
	b_playerfinditem(itke_lockpick,3);
};


instance ITSE_GOLDPOCKET25(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket25;
	description = "M�ec";
	text[0] = "";
	text[1] = "";
	text[2] = "V m�ci cink� n�kolik minc�.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket25()
{
	b_playerfinditem(itmi_gold,25);
};


instance ITSE_GOLDPOCKET50(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket50;
	description = "M�ec";
	text[0] = "";
	text[1] = "";
	text[2] = "Tento v��ek je pln� minc�.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket50()
{
	b_playerfinditem(itmi_gold,50);
};


instance ITSE_GOLDPOCKET100(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket100;
	description = "M�ec";
	text[0] = "";
	text[1] = "";
	text[2] = "Po��dn� t�k� v��ek,";
	text[3] = "nadit� mincemi.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket100()
{
	b_playerfinditem(itmi_gold,100);
};


instance ITSE_HANNASBEUTEL(C_ITEM)
{
	name = "M�ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = hannasbeutel;
	description = "M�ec";
	text[0] = "";
	text[1] = "";
	text[2] = "Tohle mi dala Hanna.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void hannasbeutel()
{
	CreateInvItems(hero,itke_lockpick,10);
	CreateInvItems(hero,itke_thieftreasure,1);
	Print(print_hannasbeutel);
};

