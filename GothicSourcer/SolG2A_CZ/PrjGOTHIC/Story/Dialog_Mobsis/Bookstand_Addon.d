
func void use_bookstand_addon_bl_s1()
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
		Doc_PrintLine(ndocid,0,"Dùl");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Crimson: 79 zlatých nugetù pøedáno a pøetaveno.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Scatty: zboží zaplaceno, 250 zlatých pøedáno");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Garaz: 6 zlatých nugetù pøedáno");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Všechny stráže: 9 zlatých nugetù pøedáno");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Tábor:  ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ravenovy stráže: 25 zlatých nugetù");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Finn: 60 zlatých nugetù");
		Doc_PrintLines(ndocid,1,"Lennar: 40 zlatých nugetù");
		Doc_PrintLines(ndocid,1,"Emilio: 50 zlatých nugetù");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ostatní: 20 zlatých nugetù");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Huno, Fisk, Snaf: záleží na zboží");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Lovci: Vùdce by to mìl vyøídit! Franco 7 zlatých pøedáno");
		Doc_Show(ndocid);
	};
};


var int bookstandmayahierchary_1_permanent;
var int bookstandmayahierchary_2_permanent;
var int bookstandmayahierchary_3_permanent;
var int bookstandmayahierchary_4_permanent;
var int bookstandmayahierchary_5_permanent;
var int bookstandmayaart;

func int c_canreadbookstand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};
};

func void use_bookstandmaya()
{
	if(BOOKSTANDMAYAART == 1)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"...pouze STRÁŽCI SMRTI mohou povolat pøedky. ");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jejich absence jim velice chybìla. Beze pøedkù nemohli vést lidi.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"LÉÈITELÉ byli posláni, aby zapeèetili portál a znièili klíè. Jen Adanos ví, co se s nimi stalo a jestli se jim úkol podaøil.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"VÁLEÈNICKÁ KASTA byla znièena hnìvem Adanose. Srdce starého váleèníka bylo zlomeno. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Pouze zbylí KNÌZI dávali lidem nadìji na znovuzrození jejich mìsta. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Ale my, UÈENCI, jsme již znali hoøkou pravdu. JHARKENDAR padl a byl pohøben èasem.");
		Doc_PrintLines(STPL_NDOCID,1,"");
	}
	else if(BOOKSTANDMAYAART == 2)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES byl pohøben v Adanosovì chrámu, ale moc meèe zlomena nebyla.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jeho moc byla pøíliš velká. Zabíjení a nièení na ulicích by nikdy neskonèilo.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"A tak až samotný Adonos vše ukonèil svým hnìvem. Jedinou vlnou zatopil celé mìsto.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Jen nìkolik vyšších budov zùstalo, vše ostatní bylo znièeno.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Nìkolik lidí katastrofu pøežilo, jenže nemìli už dostatek sil, aby dokázali obnovit slávu a velikost mìsta. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"A tak byl osud JHARKENDARU zpeèetìn.");
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			SC_KNOWS_WEAPONINADANOSTEMPEL = TRUE;
		};
	}
	else if(BOOKSTANDMAYAART == 3)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Stáøí QUARHODRONA ho dìlalo již neschopného vést armádu. A tak knìží využili toho, že spadá pod jejich moc. ");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"A pøikázali mu, aby se vzdal svého titulu vùdce a odevzdal meè.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Rada pìti chtìla jednat o jeho následníkovi, ale Váleènická kasta s tím nesouhlasila. ");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"RHADEMES, syn QUARHODRON byl navrhnut a zvolen Váleènickou kastou, jakožto nový vùdce.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON dùvìøoval svému rodu, a tak souhlasil a odstoupil.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Odevzdal svùj meè svému synovi v nadìji, že mu bude vládnout stejnì pevnì, jako on.");
	}
	else if(BOOKSTANDMAYAART == 4)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES byl ale slabý. Vùle meèe ho pøemohla a on se stal jen jeho loutkou.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES v moci meèe pøinesl vlastním lidem zkázu a utrpení. Ani léèitelé nebyli schopni utrpení zastavit èi zmírnit.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Meè brzy pochopil, že jsou lidé pøíliš slabí na to, aby se mu dokázali postavit.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jen od našich pøedkù, hrozilo nebezpeèí.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Proto RHADEMES nechal všechny Strážce smrti popravit, což znamenalo konec všech nadìjí.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Mnoho Strážcù smrti zemøelo, když se pokoušeli povolat naše pøedky na pomoc JHARKENDARU.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Válka zuøila v ulicích, a tak se léèitelé rozhodli zapeèetit vstup do údolí.");
	}
	else if(BOOKSTANDMAYAART == 5)
	{
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON, nejvyšší knìz KHARDIMON a já jsme se v tìchto síních snažili pøíjít na to, jak porazit RHADEMESE a 'meè'.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON a KHARDIMON se domnívali, že nejlepší bude znièit RHADEMESE v bitvì, spoleènými silami. Ale JÁ znal sílu meèe pøíliš dobøe, abych s tímto návrhem souhlasil.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Použil jsem svého práva k zamítnutí ostatních dvou a namísto toho jsem se rozhodl oklamat RHADAMESE lstí.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON uposlechl moji radu a  nechal se uzavøít v Adanosovì chrámu. Pak poslal pro svého syna a požádal ho o pomoc.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Hnìv jeho syna nabral takové velikosti, že rozboøil chrám, aby osvobodil svého otce.  ");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Uvìdomil si pøíliš pozdì, jaké jsou naše skuteèné plány");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON zapeèetil chrám pøede všemi a RHADEMES byl v pasti. Uvìznìn na vìènost i s meèem.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"");
	};
};

func void inituse_bookstandmaya()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(c_canreadbookstand() == FALSE)
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			Doc_Show(STPL_NDOCID);
			b_say(self,self,"$CANTREADTHIS");
		}
		else if(c_canreadbookstand())
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			use_bookstandmaya();
			Doc_Show(STPL_NDOCID);
		};
	};
	BOOKSTANDMAYAART = 0;
};

func void use_bookstandmayahierchary_01_s1()
{
	BOOKSTANDMAYAART = 1;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_1_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_1_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_02_s1()
{
	BOOKSTANDMAYAART = 2;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_2_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_2_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_03_s1()
{
	BOOKSTANDMAYAART = 3;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_3_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_3_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_04_s1()
{
	BOOKSTANDMAYAART = 4;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_4_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_4_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_05_s1()
{
	BOOKSTANDMAYAART = 5;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_5_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_5_PERMANENT = TRUE;
	};
};

