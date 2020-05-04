
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
	b_logentry(TOPIC_TALENTSMITH,"K vykov�n� takov� zbran� pot�ebuji hlavn� kousek surov� oceli. Tu pak doruda roz�hav�m v kov��sk� v�hni a pak ji budu kout na kovadlin�. U ur�it�ch zbran� je tak� �asto zapot�eb� pou��t jist� substance, kter� jim pak prop�j�� jedine�n� vlastnosti.");
	if(waffe == WEAPON_COMMON)
	{
		PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"K vytvo�en� oby�ejn�ho me�e nepot�ebuji ��dn� zvl�tn� p��sady.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 1 hrudku rudy, mohu vykovat DLOUH� ME� Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 2 hrudky rudy, mohu vykovat OBOURU�N� ME� Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 2 hrudky rudy, mohu vykovat ME� BASTARD Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 3 hrudky rudy, mohu vykovat T̎K� OBOURU�N� ME� Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 3 hrudky rudy, mohu vykovat V�LE�N� B�IT Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 4 hrudky rudy, mohu vykovat T̎K� V�LE�N� B�IT Z RUDY.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 4 hrudky rudy a 5 kapek dra�� krve, mohu vykovat DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 5 hrudky rudy a 5 kapek dra�� krve, mohu vykovat VELK�HO DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_1H_HARAD_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyn� m��u kovat kvalitn� me�.");
	};
	if(waffe == WEAPON_1H_HARAD_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyn� m��u kovat kvalitn� dlouh� me�.");
	};
	if(waffe == WEAPON_1H_HARAD_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Nyn� m��u kovat rub�novou �epel.");
	};
	if(waffe == WEAPON_1H_HARAD_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Harad m� nau�il kovat 'El Bastardo' - nejlep�� jednoru�n� oby�ejnou zbra�.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

