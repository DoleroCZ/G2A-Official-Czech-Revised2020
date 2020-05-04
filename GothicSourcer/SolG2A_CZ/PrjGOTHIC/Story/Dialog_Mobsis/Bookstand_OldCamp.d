
func void bookstand_milten_03_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"U� je pozd�.");
		Doc_PrintLines(ndocid,0,"Z��cen� star�ho dolu p�ivedlo rudobarony na pokraj zk�zy.");
		Doc_PrintLines(ndocid,0,"Gomez je jako soudek s prachem, kter� co nevid�t vybuchne.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Mysl� si, �e za v�echno m��e ten nov� chl�pek. Je to fakt podiv�n a ud�lal by nejl�p, kdyby se tu u� v�ckr�t neuk�zal.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Gomez je je�t� na�tvan�j�� ne� kdy p�edt�m a j� mysl�m, �e v�m, co m� za lubem. Mus�me varovat m�gy vody, ne� bude p��li� pozd�. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Corristo");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Mo�n� m��eme pohrom� je�t� zabr�nit. Rad�i ani nemyslet, co by se mohlo st�t, kdyby byl voln� d�l... ");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1()
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
		Doc_PrintLines(ndocid,0,"Vyu�il jsem nastal� svobody a trochu si to tu zvelebil. Kdo by si pomyslel, �e jednou budu jedin�m m�gem v t�bo�e?");
		Doc_PrintLines(ndocid,0,"Ale nem��u ��ct, �e bych se sem vracel r�d. Vlastn� bych odsud nejrad�i co nejrychleji zase vypadl.");
		Doc_PrintLines(ndocid,0,"Tahle v�prava prost� nem��e usp�t.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"V�era odsud ode�li kop��i a vzali s sebou i Diega - v�bec m� nep�ekvapilo, �e se taky koukal vypa�it. ");
		Doc_PrintLines(ndocid,1,"Ur�it� nikde nebude rubat krump��em. ");
		Doc_PrintLines(ndocid,1,"J� ale vyu�iju chv�le volna a trochu se pocvi��m v alchymii.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Milten");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Akcie");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Na�li jsme n�jak� zbo��, ale nic extra. Tady je seznam:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 bedny star�ch hadr�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 beden rezav�ho �eleza");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 bedny rozbit�ch brn�n�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5  beden (zatuchl�) k��e a ko�i�in");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 bedny krump���");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 bedny dal��ho n��in�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 beden kamen� (ruda ve�ker� ��dn�)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 bedna rezav�ch �iletek");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 bedny rozbit�ho n�dob� ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 sud� na vodu");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 bedna n��eho z ba�in (a� to bylo co bylo, te� je to shnil�)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Engor");
		Doc_Show(ndocid);
	};
};

