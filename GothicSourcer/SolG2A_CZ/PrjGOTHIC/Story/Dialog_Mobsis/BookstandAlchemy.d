
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
		Doc_PrintLine(ndocid,0,"Magick� lektvary");
		Doc_PrintLine(ndocid,0,"a p��sady");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esence many");
		Doc_PrintLine(ndocid,0,"2 ohniv� kop�ivy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extrakt many");
		Doc_PrintLine(ndocid,0,"2 ohniv� b�l�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elix�r many");
		Doc_PrintLine(ndocid,0,"2 ohniv� ko�eny");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Alchymista ke sv� pr�ci v�dy pot�ebuje laboratorn� lahvi�ku, do kter� pak nalije hotov� lektvar.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K nam�ch�n� l��iv�ho lektvaru nebo elix�ru posiluj�c�ho magickou moc pot�ebuje� zvl�tn� p��sadu a rostlinu:");
		Doc_PrintLine(ndocid,1,"lu�n� pohanka");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K nam�ch�n� lektvar� trvale m�n�c�ch n�kterou z du�evn�ch �i t�lesn�ch vlastnost� pot�ebuje� ur�itou rostlinu: ");
		Doc_PrintLines(ndocid,1,"kr�lovsk� ��ov�k");
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
		Doc_PrintLine(ndocid,0,"L��iv� lektvary");
		Doc_PrintLine(ndocid,0,"a ingredience");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esence hojiv� s�ly");
		Doc_PrintLine(ndocid,0,"2 l��iv� rostliny");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extrakt hojiv� s�ly");
		Doc_PrintLine(ndocid,0,"2 l��iv� byliny");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elix�r hojiv� s�ly");
		Doc_PrintLine(ndocid,0,"2 l��iv� ko�eny");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Alchymista ke sv� pr�ci v�dy pot�ebuje laboratorn� lahvi�ku, do kter� pak nalije hotov� lektvar.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K nam�ch�n� l��iv�ho lektvaru nebo elix�ru posiluj�c�ho magickou moc pot�ebuje� zvl�tn� p��sadu a rostlinu:");
		Doc_PrintLine(ndocid,1,"lu�n� pohanka");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"K nam�ch�n� lektvar� trvale m�n�c�ch n�kterou z du�evn�ch �i t�lesn�ch vlastnost� pot�ebuje� ur�itou rostlinu: ");
		Doc_PrintLines(ndocid,1,"kr�lovsk� ��ov�k");
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
		Doc_PrintLines(ndocid,0,"Lektvary pro trval� zm�ny");
		Doc_PrintLine(ndocid,0,"a jejich p��sady");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elix�r obratnosti");
		Doc_PrintLine(ndocid,0,"1 goblin� bobule");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lektvar rychlosti");
		Doc_PrintLines(ndocid,0,"1 ch�apav�� b�l� - k v�rob� tohoto lektvaru nepot�ebuje� kr�lovsk� ��ov�k, n�br� lu�n� pohanku.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elix�r s�ly");
		Doc_PrintLine(ndocid,0,"1 dra�� ko�en");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elix�r �ivota");
		Doc_PrintLine(ndocid,0,"1 l��iv� ko�en");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elix�r ducha");
		Doc_PrintLine(ndocid,0,"1 ohniv� ko�en");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Aplikace t�chto recept� je nejvy���m alchymistick�m um�n�m, kter� vy�aduje jistou praxi. Kdy� to pojmu v�eobecn�, ne ka�d� kdo v�, jak nam�chat l��iv� lektvar z l��iv�ho ko�ene, m� dost zku�enost�, aby se pokusil i o p��pravu t�chto elix�r�, u nich� jednu z p��sad v�dy tvo�� kr�lovsk� ��ov�k.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Nam�chat lektvar rychlosti je mnohem snaz��, ��ste�n� i proto, �e k jeho p��prav� nepot�ebuje� kr�lovsk� ��ov�k. Pro p��pravu tohoto receptu ti posta�� z�kladn� znalosti alchymie. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

