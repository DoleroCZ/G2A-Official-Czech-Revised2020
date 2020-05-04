
func int b_teachplayertalentsmith(var C_NPC slf,var C_NPC oth,var int waffe)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
	b_logentry(TOPIC_TALENTSMITH,"K vykování takové zbranì potøebuji hlavnì kousek surové oceli. Tu pak doruda rozžhavím v kováøské výhni a pak ji budu kout na kovadlinì. U urèitých zbraní je také èasto zapotøebí použít jisté substance, které jim pak propùjèí jedineèné vlastnosti.");
	if(waffe == WEAPON_COMMON)
	{
		PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"K vytvoøení obyèejného meèe nepotøebuji žádné zvláštní pøísady.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 1 hrudku rudy, mohu vykovat DLOUHÝ MEÈ Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 2 hrudky rudy, mohu vykovat OBOURUÈNÍ MEÈ Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 2 hrudky rudy, mohu vykovat MEÈ BASTARD Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 3 hrudky rudy, mohu vykovat TÌŽKÝ OBOURUÈNÍ MEÈ Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 3 hrudky rudy, mohu vykovat VÁLEÈNÝ BØIT Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 4 hrudky rudy, mohu vykovat TÌŽKÝ VÁLEÈNÝ BØIT Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 4 hrudky rudy a 5 kapek draèí krve, mohu vykovat DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 5 hrudky rudy a 5 kapek draèí krve, mohu vykovat VELKÉHO DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_1H_HARAD_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyní mùžu kovat kvalitní meè.");
	};
	if(waffe == WEAPON_1H_HARAD_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyní mùžu kovat kvalitní dlouhý meè.");
	};
	if(waffe == WEAPON_1H_HARAD_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyní mùžu kovat rubínovou èepel.");
	};
	if(waffe == WEAPON_1H_HARAD_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Harad mì nauèil kovat 'El Bastardo' - nejlepší jednoruèní obyèejnou zbraò.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

