
func int b_teachplayertalentalchemy(var C_NPC slf,var C_NPC oth,var int potion)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_ALCHEMY,potion);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTALCHEMY,LOG_NOTE);
	b_logentry(TOPIC_TALENTALCHEMY,"K namíchání lektvaru potøebuji prázdnou laboratorní lahvièku a nezbytné pøísady. S jejich pomocí pak mohu s pomocí alchymistické kolony vytvoøit potøebný elixír.");
	if(potion == POTION_HEALTH_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ESENCI HOJIVÉ SÍLY: 2 léèivé rostliny a 1 luèní pohanka");
	};
	if(potion == POTION_HEALTH_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro EXTRAKT HOJIVÉ SÍLY: 2 léèivé byliny a 1 luèní pohanka.");
	};
	if(potion == POTION_HEALTH_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR HOJIVÉ SÍLY: 2 léèivé koøeny a 1 luèní pohanka.");
	};
	if(potion == POTION_MANA_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ESENCI MANY: 2 ohnivé kopøivy a 1 luèní pohanka.");
	};
	if(potion == POTION_MANA_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro EXTRAKT MANY: 2 ohnivé býlí a 1 luèní pohanka.");
	};
	if(potion == POTION_MANA_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR MANY: 2 ohnivé koøeny a 1 luèní pohanka");
	};
	if(potion == POTION_SPEED)
	{
		PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro LEKTVAR RYCHLOSTI: 1 chòapavèí býlí a 1 luèní pohanka.");
	};
	if(potion == POTION_PERM_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR SÍLY: 1 draèí koøen a 1 královský šovík.");
	};
	if(potion == POTION_PERM_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR OBRATNOSTI: 1 gobliní bobule a 1 královský šovík.");
	};
	if(potion == POTION_PERM_MANA)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR DUCHA: 1 ohnivý koøen a 1 královský šovík.");
	};
	if(potion == POTION_PERM_HEALTH)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Pøísady pro ELIXÍR ŽIVOTA: 1 léèivý koøen a 1 královský šovík.");
	};
	PrintScreen(PRINT_LEARNALCHEMY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

