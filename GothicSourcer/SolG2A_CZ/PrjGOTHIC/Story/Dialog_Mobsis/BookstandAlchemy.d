
var int alchemy_1_permanent;
var int alchemy_2_permanent;
var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Magické lektvary");
		Doc_PrintLine(ndocid,0,"a pøísady");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esence many");
		Doc_PrintLine(ndocid,0,"2 ohnivé kopøivy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extrakt many");
		Doc_PrintLine(ndocid,0,"2 ohnivé bılí");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixír many");
		Doc_PrintLine(ndocid,0,"2 ohnivé koøeny");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Alchymista ke své práci vdy potøebuje laboratorní lahvièku, do které pak nalije hotovı lektvar.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K namíchání léèivého lektvaru nebo elixíru posilujícího magickou moc potøebuješ zvláštní pøísadu a rostlinu:");
		Doc_PrintLine(ndocid,1,"luèní pohanka");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K namíchání lektvarù trvale mìnících nìkterou z duševních èi tìlesnıch vlastností potøebuješ urèitou rostlinu: ");
		Doc_PrintLines(ndocid,1,"královskı šovík");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Léèivé lektvary");
		Doc_PrintLine(ndocid,0,"a ingredience");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esence hojivé síly");
		Doc_PrintLine(ndocid,0,"2 léèivé rostliny");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extrakt hojivé síly");
		Doc_PrintLine(ndocid,0,"2 léèivé byliny");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixír hojivé síly");
		Doc_PrintLine(ndocid,0,"2 léèivé koøeny");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Alchymista ke své práci vdy potøebuje laboratorní lahvièku, do které pak nalije hotovı lektvar.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K namíchání léèivého lektvaru nebo elixíru posilujícího magickou moc potøebuješ zvláštní pøísadu a rostlinu:");
		Doc_PrintLine(ndocid,1,"luèní pohanka");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K namíchání lektvarù trvale mìnících nìkterou z duševních èi tìlesnıch vlastností potøebuješ urèitou rostlinu: ");
		Doc_PrintLines(ndocid,1,"královskı šovík");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Lektvary pro trvalé zmìny");
		Doc_PrintLine(ndocid,0,"a jejich pøísady");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixír obratnosti");
		Doc_PrintLine(ndocid,0,"1 gobliní bobule");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lektvar rychlosti");
		Doc_PrintLines(ndocid,0,"1 chòapavèí bılí - k vırobì tohoto lektvaru nepotøebuješ královskı šovík, nıbr luèní pohanku.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixír síly");
		Doc_PrintLine(ndocid,0,"1 draèí koøen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elixír ivota");
		Doc_PrintLine(ndocid,0,"1 léèivı koøen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elixír ducha");
		Doc_PrintLine(ndocid,0,"1 ohnivı koøen");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Aplikace tìchto receptù je nejvyšším alchymistickım umìním, které vyaduje jistou praxi. Kdy to pojmu všeobecnì, ne kadı kdo ví, jak namíchat léèivı lektvar z léèivého koøene, má dost zkušeností, aby se pokusil i o pøípravu tìchto elixírù, u nich jednu z pøísad vdy tvoøí královskı šovík.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Namíchat lektvar rychlosti je mnohem snazší, èásteènì i proto, e k jeho pøípravì nepotøebuješ královskı šovík. Pro pøípravu tohoto receptu ti postaèí základní znalosti alchymie. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

