
var int animals_1_permanent;
var int animals_2_permanent;
var int animals_3_permanent;

func void use_bookstandanimals1_s1()
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
		Doc_PrintLine(ndocid,0,"Lov a koøist");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Z kadého zvíøete èi nestvùry mùe schopnı lovec získat nìjakou trofej.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ten, kdo je v tomto umìní zbìhlı, by mìl tyto trofeje nejen znát, ale mìl by je i umìt získat.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Vyjmutí zubù");
		Doc_PrintLines(ndocid,0,"Spousta šelem i ostatních tvorù pouívá jako zbraò zuby. Tıká se to pøedevším vlkù, chòapavcù, stínovıch šelem, moèálovıch ralokù a trolù - ode všech dokáe zdatnı lovec získat zuby.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Stahování kùí");
		Doc_PrintLines(ndocid,1,"Zkušení lovci si také velmi cení kùí a koešin spousty zvíøat, napøíklad ovcí, vlkù a stínovıch šelem.");
		Doc_PrintLines(ndocid,1,"Ten, kdo se v tìchto vìcech vyzná, dokáe stáhnout kùi i z moèálovıch ralokù a èíhavcù.  ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Vyjmutí drápù");
		Doc_PrintLines(ndocid,1,"Toto umìní lze uplatnit na urèitıch ještìrech, chòapavcích, èíhavcích a stínovıch šelmách.  ");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1()
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
		Doc_PrintLine(ndocid,0,"Lov a koøist");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Z kadého zvíøete èi nestvùry mùe schopnı lovec získat nìjakou trofej, která mu pøinese slávu i bohatství.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Krvavé mouchy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"K vyvrení tìchto létajících ïáblù je zapotøebí hned dvou dovedností");
		Doc_PrintLines(ndocid,0,"vyjmutí køídel a extrakce ihadla.");
		Doc_PrintLines(ndocid,0,"Obì tyto dovednosti by mìli pouívat pouze zkušení lovci.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Polní škùdci a dùlní èervi útoèí svımi mocnımi kusadly. Zvláštì kusadla dùlních");
		Doc_PrintLines(ndocid,1,"èervù jsou cenné, nebo obsahují vımìšek zvyšující magickou moc. Lze jej však");
		Doc_PrintLines(ndocid,1,"pouívat pouze v omezeném mnoství, nebo lidské tìlo si na nìj po èase zvykne a pøestane jeho úèinky pøijímat.");
		Doc_PrintLines(ndocid,1,"Velké oblibì se tìší i krunıøe dùlních èervù, ze kterıch se vyrábí kvalitní zbroj. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1()
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
		Doc_PrintLine(ndocid,0,"Lov a koøist");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Z kadého zvíøete èi nestvùry mùe schopnı lovec získat nìjakou trofej, která mu pøinese slávu i bohatství.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ohnivı ještìr");
		Doc_PrintLines(ndocid,0,"Tato šelma sice patøí k ještìrùm, ale dokáe kadého, kdo se jí pøiplete do cesty, seehnout palèivım ohnìm.");
		Doc_PrintLines(ndocid,0,"Proto s tìmito zrùdami mohou bojovat pouze ti, kteøí se chrání pøed ohnìm - a pak jim mohou vyøíznout jazyky, které jsou velmi cenné.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Stínová šelma");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Stínová šelma je samotáøskı tvor ze starıch èasù, kterı se skrıvá v lesích.");
		Doc_PrintLines(ndocid,1,"U jich na svìtì moc nezùstalo, proto pro lidi nepøedstavují ádnou vìtší hrozbu, pokud se nevetøou pøímo do jejich teritoria.");
		Doc_PrintLines(ndocid,1,"Roh stínové šelmy pøedstavuje velmi cennou trofej. Lovec však musí vìdìt, jak jej správnì vyjmout, aby ho nepoškodil");
		Doc_PrintLines(ndocid,1,"a nesníil jeho cenu.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};

