
instance ITPO_ADDON_GEIST_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_geist_01;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Lektvar obnovy mysli";
	text[2] = "Buï OPATRNÝ pøed použitím!!!";
	text[3] = "Mùže pozvednout mysl";
	text[4] = "nebo zabít uživatele";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAESSENZ;
};


func void useitpo_geist_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1000;
};


instance ITPO_ADDON_GEIST_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_geist_02;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Lektvar obnovy mysli";
	text[2] = "Buï OPATRNÝ pøed použitím!!!";
	text[3] = "Mùže pozvednout mysl";
	text[4] = "nebo zabít uživatele";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAESSENZ;
};


func void useitpo_geist_02()
{
	if(Npc_IsPlayer(self))
	{
		b_giveplayerxp(XP_AMBIENT * 5);
	};
};


instance ITPO_HEALTH_ADDON_04(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPTRUNK;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_04;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = "Lektvar života";
	text[2] = "Kompletní regenerace života";
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPTRUNK;
};


func void useitpo_health_04()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};


instance ITPO_MANA_ADDON_04(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANATRUNK;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_04;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Lektvar many";
	text[2] = "Kompletní regenerace many";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANATRUNK;
};


func void useitpo_mana_04()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};

