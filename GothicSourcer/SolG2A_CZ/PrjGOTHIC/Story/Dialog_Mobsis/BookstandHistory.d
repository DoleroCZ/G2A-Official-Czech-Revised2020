
var int history_1_permanent;
var int history_2_permanent;
var int history_3_permanent;

func void use_bookstandhistory1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Jak bojovat");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Nejlepší obrana je útok - alespoò proti všem nelidskım stvùrám. Odvracet útoky zvíøat nebo oblud toti vùbec nemá cenu.");
		Doc_PrintLines(ndocid,0,"Takového protivníka si je lepší nìkolika dobøe míøenımi ranami dret od tìla a pak ho v pøekvapit náhlım vıpadem.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Samozøejmì e zkušení bojovníci mohou tyto pohyby libovolnì spojovat. Pokud jsi mistrem bojovıch umìní, mùeš takovıch kombinací pouívat i více.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Ostrov");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Pøístavní mìsto Khorinis leí na ostrovì u pobøeí království Myrtana.");
		Doc_PrintLines(ndocid,0,"Tento ostrov je proslulı zejména tím, e se na nìm nachází slavné Hornícké údolí. Jeho povìst je pochybná, nebo je po mnoho let obklopovala neprostupná magická bariéra, a proto slouilo jako vìznice pro trestance z celé øíše.");
		Doc_PrintLines(ndocid,0,"Ti zde dolovali magickou rudu, její loiska se ukrıvala hluboko pod povrchem zemì. ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Pùda za hranicemi Khorinisu je velmi úrodná, proto tu najdete mnoho selskıch usedlostí, kde se pìstují zejména tuøíny a chovají ovce.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ji po celé generace patøí nejvìtší statek velkostatkáøi, kterı pak okolní pùdu pronajímá ostatním sedlákùm. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uprostøed ostrova stojí starobylı Innosùv klášter, kterı vedou mágové ohnì a kde provádìjí své magické a alchymistické vızkumy a také lisují víno.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Zákony ostrova");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Všude, kde ije více lidí pohromadì, musí dodrovat urèitá pravidla pokojného souití - jak v klášteøe, tak ve mìstì èi na statku.");
		Doc_PrintLines(ndocid,0,"Všechny zloèiny proti komunitì budou potrestány.");
		Doc_PrintLines(ndocid,0,"Je zakázáno provokovat souboje nebo se zapojovat do rvaèek. ");
		Doc_PrintLines(ndocid,0,"Kadá kráde je také zloèinem a pachatel ponese patøièné následky. I ovce jsou chránìny zákonem.  ");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Pokud nìkdo zabije druhého, musí bıt za svùj èin souzen a odsouzen.");
		Doc_PrintLines(ndocid,1,"Chce-li se vyhnout vìzení, musí zaplatit tuènou pokutu. ");
		Doc_PrintLines(ndocid,1,"Na velkıch místech dbají o poøádek mui zákona. Doslechnou se o kadém zloèinu i pøestupku a jejich povinností je potrestat viníka a uèinit tak spravedlnosti zadost. ");
		Doc_PrintLines(ndocid,1,"Kadı, kdo se stane obìtí èi svìdkem zloèinu, nebude mít samozøejmì o pachateli dobré mínìní.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Samozøejmì e existují tací, kteøí si se zákonem pøíliš hlavu nelámou - napøíklad bandité èi oldnéøi. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

