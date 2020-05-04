
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
		Doc_PrintLines(ndocid,0,"U je pozdì.");
		Doc_PrintLines(ndocid,0,"Zøícení starého dolu pøivedlo rudobarony na pokraj zkázy.");
		Doc_PrintLines(ndocid,0,"Gomez je jako soudek s prachem, kterı co nevidìt vybuchne.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Myslí si, e za všechno mùe ten novı chlápek. Je to fakt podivín a udìlal by nejlíp, kdyby se tu u víckrát neukázal.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Gomez je ještì naštvanìjší ne kdy pøedtím a já myslím, e vím, co má za lubem. Musíme varovat mágy vody, ne bude pøíliš pozdì. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Corristo");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Moná mùeme pohromì ještì zabránit. Radši ani nemyslet, co by se mohlo stát, kdyby byl volnı dùl... ");
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
		Doc_PrintLines(ndocid,0,"Vyuil jsem nastalé svobody a trochu si to tu zvelebil. Kdo by si pomyslel, e jednou budu jedinım mágem v táboøe?");
		Doc_PrintLines(ndocid,0,"Ale nemùu øíct, e bych se sem vracel rád. Vlastnì bych odsud nejradši co nejrychleji zase vypadl.");
		Doc_PrintLines(ndocid,0,"Tahle vıprava prostì nemùe uspìt.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Vèera odsud odešli kopáèi a vzali s sebou i Diega - vùbec mì nepøekvapilo, e se taky koukal vypaøit. ");
		Doc_PrintLines(ndocid,1,"Urèitì nikde nebude rubat krumpáèem. ");
		Doc_PrintLines(ndocid,1,"Já ale vyuiju chvíle volna a trochu se pocvièím v alchymii.");
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
		Doc_PrintLines(ndocid,0,"Našli jsme nìjaké zboí, ale nic extra. Tady je seznam:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 bedny starıch hadrù");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 beden rezavého eleza");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 bedny rozbitıch brnìní");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5  beden (zatuchlé) kùe a koišin");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 bedny krumpáèù");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 bedny dalšího náèiní");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 beden kamení (ruda veškerá ádná)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 bedna rezavıch iletek");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 bedny rozbitého nádobí ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 sudù na vodu");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 bedna nìèeho z bain (a to bylo co bylo, teï je to shnilé)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Engor");
		Doc_Show(ndocid);
	};
};

