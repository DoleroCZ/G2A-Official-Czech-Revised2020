
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
	b_logentry(TOPIC_TALENTALCHEMY,"K nam�ch�n� lektvaru pot�ebuji pr�zdnou laboratorn� lahvi�ku a nezbytn� p��sady. S jejich pomoc� pak mohu s pomoc� alchymistick� kolony vytvo�it pot�ebn� elix�r.");
	if(potion == POTION_HEALTH_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ESENCI HOJIV� S�LY: 2 l��iv� rostliny a 1 lu�n� pohanka");
	};
	if(potion == POTION_HEALTH_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro EXTRAKT HOJIV� S�LY: 2 l��iv� byliny a 1 lu�n� pohanka.");
	};
	if(potion == POTION_HEALTH_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R HOJIV� S�LY: 2 l��iv� ko�eny a 1 lu�n� pohanka.");
	};
	if(potion == POTION_MANA_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ESENCI MANY: 2 ohniv� kop�ivy a 1 lu�n� pohanka.");
	};
	if(potion == POTION_MANA_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro EXTRAKT MANY: 2 ohniv� b�l� a 1 lu�n� pohanka.");
	};
	if(potion == POTION_MANA_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R MANY: 2 ohniv� ko�eny a 1 lu�n� pohanka");
	};
	if(potion == POTION_SPEED)
	{
		PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro LEKTVAR RYCHLOSTI: 1 ch�apav�� b�l� a 1 lu�n� pohanka.");
	};
	if(potion == POTION_PERM_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R S�LY: 1 dra�� ko�en a 1 kr�lovsk� ��ov�k.");
	};
	if(potion == POTION_PERM_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R OBRATNOSTI: 1 goblin� bobule a 1 kr�lovsk� ��ov�k.");
	};
	if(potion == POTION_PERM_MANA)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R DUCHA: 1 ohniv� ko�en a 1 kr�lovsk� ��ov�k.");
	};
	if(potion == POTION_PERM_HEALTH)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"P��sady pro ELIX�R �IVOTA: 1 l��iv� ko�en a 1 kr�lovsk� ��ov�k.");
	};
	PrintScreen(PRINT_LEARNALCHEMY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

