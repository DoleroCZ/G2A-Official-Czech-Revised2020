
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
		Doc_PrintLine(ndocid,0,"D�l");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Crimson: 79 zlat�ch nuget� p�ed�no a p�etaveno.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Scatty: zbo�� zaplaceno, 250 zlat�ch p�ed�no");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Garaz: 6 zlat�ch nuget� p�ed�no");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"V�echny str�e: 9 zlat�ch nuget� p�ed�no");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"T�bor:  ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ravenovy str�e: 25 zlat�ch nuget�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Finn: 60 zlat�ch nuget�");
		Doc_PrintLines(ndocid,1,"Lennar: 40 zlat�ch nuget�");
		Doc_PrintLines(ndocid,1,"Emilio: 50 zlat�ch nuget�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ostatn�: 20 zlat�ch nuget�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Huno, Fisk, Snaf: z�le�� na zbo��");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Lovci: V�dce by to m�l vy��dit! Franco 7 zlat�ch p�ed�no");
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
		Doc_PrintLines(STPL_NDOCID,0,"...pouze STR��CI SMRTI mohou povolat p�edky. ");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jejich absence jim velice chyb�la. Beze p�edk� nemohli v�st lidi.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"L��ITEL� byli posl�ni, aby zape�etili port�l a zni�ili kl��. Jen Adanos v�, co se s nimi stalo a jestli se jim �kol poda�il.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"V�LE�NICK� KASTA byla zni�ena hn�vem Adanose. Srdce star�ho v�le�n�ka bylo zlomeno. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Pouze zbyl� KN�ZI d�vali lidem nad�ji na znovuzrozen� jejich m�sta. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Ale my, U�ENCI, jsme ji� znali ho�kou pravdu. JHARKENDAR padl a byl poh�ben �asem.");
		Doc_PrintLines(STPL_NDOCID,1,"");
	}
	else if(BOOKSTANDMAYAART == 2)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES byl poh�ben v Adanosov� chr�mu, ale moc me�e zlomena nebyla.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jeho moc byla p��li� velk�. Zab�jen� a ni�en� na ulic�ch by nikdy neskon�ilo.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"A tak a� samotn� Adonos v�e ukon�il sv�m hn�vem. Jedinou vlnou zatopil cel� m�sto.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Jen n�kolik vy���ch budov z�stalo, v�e ostatn� bylo zni�eno.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"N�kolik lid� katastrofu p�e�ilo, jen�e nem�li u� dostatek sil, aby dok�zali obnovit sl�vu a velikost m�sta. ");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"A tak byl osud JHARKENDARU zpe�et�n.");
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			SC_KNOWS_WEAPONINADANOSTEMPEL = TRUE;
		};
	}
	else if(BOOKSTANDMAYAART == 3)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"St��� QUARHODRONA ho d�lalo ji� neschopn�ho v�st arm�du. A tak kn�� vyu�ili toho, �e spad� pod jejich moc. ");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"A p�ik�zali mu, aby se vzdal sv�ho titulu v�dce a odevzdal me�.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Rada p�ti cht�la jednat o jeho n�sledn�kovi, ale V�le�nick� kasta s t�m nesouhlasila. ");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"RHADEMES, syn QUARHODRON byl navrhnut a zvolen V�le�nickou kastou, jako�to nov� v�dce.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON d�v��oval sv�mu rodu, a tak souhlasil a odstoupil.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Odevzdal sv�j me� sv�mu synovi v nad�ji, �e mu bude vl�dnout stejn� pevn�, jako on.");
	}
	else if(BOOKSTANDMAYAART == 4)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES byl ale slab�. V�le me�e ho p�emohla a on se stal jen jeho loutkou.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES v moci me�e p�inesl vlastn�m lidem zk�zu a utrpen�. Ani l��itel� nebyli schopni utrpen� zastavit �i zm�rnit.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Me� brzy pochopil, �e jsou lid� p��li� slab� na to, aby se mu dok�zali postavit.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jen od na�ich p�edk�, hrozilo nebezpe��.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Proto RHADEMES nechal v�echny Str�ce smrti popravit, co� znamenalo konec v�ech nad�j�.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Mnoho Str�c� smrti zem�elo, kdy� se pokou�eli povolat na�e p�edky na pomoc JHARKENDARU.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"V�lka zu�ila v ulic�ch, a tak se l��itel� rozhodli zape�etit vstup do �dol�.");
	}
	else if(BOOKSTANDMAYAART == 5)
	{
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON, nejvy��� kn�z KHARDIMON a j� jsme se v t�chto s�n�ch sna�ili p��j�t na to, jak porazit RHADEMESE a 'me�'.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON a KHARDIMON se domn�vali, �e nejlep�� bude zni�it RHADEMESE v bitv�, spole�n�mi silami. Ale J� znal s�lu me�e p��li� dob�e, abych s t�mto n�vrhem souhlasil.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Pou�il jsem sv�ho pr�va k zam�tnut� ostatn�ch dvou a nam�sto toho jsem se rozhodl oklamat RHADAMESE lst�.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON uposlechl moji radu a  nechal se uzav��t v Adanosov� chr�mu. Pak poslal pro sv�ho syna a po��dal ho o pomoc.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Hn�v jeho syna nabral takov� velikosti, �e rozbo�il chr�m, aby osvobodil sv�ho otce.  ");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Uv�domil si p��li� pozd�, jak� jsou na�e skute�n� pl�ny");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON zape�etil chr�m p�ede v�emi a RHADEMES byl v pasti. Uv�zn�n na v��nost i s me�em.");
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

