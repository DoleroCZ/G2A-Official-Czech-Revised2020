
func void use_runemaking_kdw_circ1_s1()
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
		Doc_PrintLine(ndocid,0,"Runy mágù vody");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy mágù vody a ingredience na jejich vytvoøení.  ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Tornádo");
		Doc_PrintLine(ndocid,0,"Køídla krvavé mouchy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledové kopí");
		Doc_PrintLine(ndocid,0,"Køemen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Gejzír");
		Doc_PrintLine(ndocid,0,"Akvamarín");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Bouøka");
		Doc_PrintLine(ndocid,0,"Køemen");
		Doc_PrintLine(ndocid,0,"Køídla krvavé mouchy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vodní pìst");
		Doc_PrintLine(ndocid,0,"Akvamarín");
		Doc_PrintLine(ndocid,0,"Kamenný krystal");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Na vytvoøení runy je potøeba alespoò jedna ingredience. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ten, kdo chce runu pøipravit, musí znát kouzelnou formuli a mít svotek s dotyèným kouzlem.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve pak mùžete runu vytvoøit na runovém stole.");
		Doc_Show(ndocid);
	};
};

func void use_runemaking_kdw_circ2_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ3_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ4_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ5_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ6_s1()
{
	use_runemaking_kdw_circ1_s1();
};

