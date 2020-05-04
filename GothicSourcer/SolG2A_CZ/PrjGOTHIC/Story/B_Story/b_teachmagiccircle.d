
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** CHYBA: nesprávný parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TALENTMAGICCIRCLE,LOG_NOTE);
	b_logentry(TOPIC_TALENTMAGICCIRCLE,"Magické runy, ke kterým mám nyní pøístup, jsou rozdìleny do jednotlivých kruhù. Nemohu použít kouzlo, jež vyžaduje vyšší kruh, než jaký již ovládám.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LEARNCIRCLE_1,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Kouzla prvního kruhu jsou: svìtlo, ohnivý šíp, malý blesk, léèba lehkých zranìní a vyvolání gobliního kostlivce.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LEARNCIRCLE_2,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Ke kouzlùm druhého kruhu patøí: ohnivá koule, ledový šíp, vyvolání vlka, vìtrná pìst a spánek.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LEARNCIRCLE_3,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Kouzla 3. kruhu zahrnují: léèbu støednì tìžkých zranìní, kulový blesk, malou ohnivou bouøi, vyvolání kostlivce, strach a ledový blok.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LEARNCIRCLE_4,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Ke kouzlùm 4. kruhu náleží: blesk, vytvoøení kamenného golema, nièení nemrtvých a velká ohnivá koule.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LEARNCIRCLE_5,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Kouzla 5. kruhu obsahují: velkou ohnivou bouøi, ledovou vlnu, vyvolání démona a léèbu tìžkých zranìní.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LEARNCIRCLE_6,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Kouzla 6. kruhu èítají: ohnivý déš, dech smrti, vlnu smrti, armádu temnot a zmenšení nestvùry.");
		return TRUE;
	};
};

