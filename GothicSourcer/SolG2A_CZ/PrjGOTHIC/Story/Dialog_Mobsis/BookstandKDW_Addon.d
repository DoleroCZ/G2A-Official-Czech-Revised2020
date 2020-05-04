
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
		Doc_PrintLine(ndocid,0,"Runy m�g� vody");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy m�g� vody a ingredience na jejich vytvo�en�.  ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Torn�do");
		Doc_PrintLine(ndocid,0,"K��dla krvav� mouchy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ledov� kop�");
		Doc_PrintLine(ndocid,0,"K�emen");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Gejz�r");
		Doc_PrintLine(ndocid,0,"Akvamar�n");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Bou�ka");
		Doc_PrintLine(ndocid,0,"K�emen");
		Doc_PrintLine(ndocid,0,"K��dla krvav� mouchy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vodn� p�st");
		Doc_PrintLine(ndocid,0,"Akvamar�n");
		Doc_PrintLine(ndocid,0,"Kamenn� krystal");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Na vytvo�en� runy je pot�eba alespo� jedna ingredience. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ten, kdo chce runu p�ipravit, mus� zn�t kouzelnou formuli a m�t svotek s doty�n�m kouzlem.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Teprve pak m��ete runu vytvo�it na runov�m stole.");
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

