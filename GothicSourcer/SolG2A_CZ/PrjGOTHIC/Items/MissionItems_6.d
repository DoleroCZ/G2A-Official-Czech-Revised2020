
instance ITSE_XARDASNOTFALLBEUTEL_MIS(C_ITEM)
{
	name = "Velmi zvláštní mìšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_xardasnotfallbeutel;
	description = name;
	text[0] = "";
	text[1] = "Tato brašna obsahuje";
	text[2] = "nìco tvrdého ";
	text[3] = "a jakısi dokument.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_xardasnotfallbeutel()
{
	var string concattext;
	CreateInvItems(hero,itwr_xardasermahnungfueridioten_mis,1);
	CreateInvItems(hero,itmi_innoseye_discharged_mis,1);
	concattext = ConcatStrings("2",PRINT_ITEMSERHALTEN);
	Print(concattext);
};


instance ITWR_XARDASERMAHNUNGFUERIDIOTEN_MIS(C_ITEM)
{
	name = "Varovnı dopis od Xardase";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardasermahnungfueridioten;
	scemename = "MAP";
	description = name;
};


func void use_xardasermahnungfueridioten()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mùj mladı chránìnèe, hluboce jsi mì zklamal. Jak to, e jsi vystoupil z lodi a pøitom si nevzal Innosovo oko?");
	Doc_PrintLines(ndocid,0,"Mohu jen doufat, e tahle nedbalost byla jen pøechodná. Jinak svìt nikdy nezbavíš zla a já tì budu muset za tvou hloupost náleitì potrestat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Xardas");
	Doc_Show(ndocid);
};


instance ITWR_KRYPTA_GARON(C_ITEM)
{
	name = "Starı dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_krypta_garon;
	scemename = "MAP";
	description = name;
	text[3] = "psanı roztøesenou rukou.";
};


func void use_krypta_garon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Selhal jsem. Nadarmo jsem se snail vést Inubida cestou dobra. ");
	Doc_PrintLines(ndocid,0,"Nejdøív jsem myslel, e jsem mrtev, ale pak jsem se pøesvìdèil, e v Ivanovıch starıch kostech pøece jen nìjaká síla zùstala. ");
	Doc_PrintLines(ndocid,0,"Inubis vstal z mrtvıch. Nyní se chce pomstít prastarému øádu paladinù, kteøí ho kdysi pøemohli.");
	Doc_PrintLines(ndocid,0,"Provází ho spousta pøisluhovaèù. Nechápu, jak se mohl chrabrı vojevùdce jako on obrátit k takovému zlu. ");
	Doc_PrintLines(ndocid,0,"V téhle kryptì jsem objevil jeho hrobku, ale nevím jistì, zda budu moci svùj nález nìkdy ohlásit. Proto píši tyto øádky v nadìji, e je tøeba nìkdy nìkdo najde.");
	Doc_PrintLines(ndocid,0,"Dej si pozor. Z duší spravedlivıch povstal mocnı nepøítel a Inubis není poslední.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Nech Innos spasí naše duše.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                 Ivan");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_ORKKNASTDI_MIS(C_ITEM)
{
	name = "Klíè skøetího plukovníka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_UNDEAD_01(C_ITEM)
{
	name = "Archolùv klíè";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ITKE_EVT_UNDEAD_02(C_ITEM)
{
	name = "Klíè hlavního klíèníka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Klíè od komnaty èerného mága";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Svitek èerného mága";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_lastdoortoundeaddrgdi_mis;
	scemename = "MAP";
	description = name;
};


func void use_itwr_lastdoortoundeaddrgdi_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"KHADOSH ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"EMEM KADAR");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Oko moci ti osvítí cestu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Na svitku èerného mága jsou uvedena slova KHADOSH EMEM KADAR. Zní to jako nìjaké zaklínadlo, ale já nemám ani ponìtí, k èemu mohlo slouit. A co je vùbec to oko moci?");
};


instance ITKE_CHESTMASTERDEMENTOR_MIS(C_ITEM)
{
	name = "Klíè od truhlice èerného mága";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_REZEPT_MEGADRINK_MIS(C_ITEM)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_rezeptfuermegatrank;
	scemename = "MAP";
	description = name;
};


func void use_rezeptfuermegatrank()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Znovu jsem oivil pradávné umìní. Obávám se ale, e Feodaron tím nebude nijak nadšen.");
	Doc_PrintLines(ndocid,0,"Prostì to znamená, e bych v laboratoøi musel z veškerého jeho potomstva namíchat lektvar. Kdyby poøád nesedìl na vejcích jako nìjaká slepice, moná bych to i vyzkoušel. Jenome takhle ho musím pøece jenom respektovat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Embarla Firgasto:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"10 draèích vajec, jedna mletá èerná perla a špetka síry.");
	Doc_PrintLines(ndocid,0,"Tekutinu pak pøiveï do varu a za stálého míchání proeò destilaèním aparátem.");
	Doc_PrintLines(ndocid,0,"Elixír uívej opatrnì, neb má silné vedlejší úèinky a mùe narušit veškerou manu.");
	Doc_Show(ndocid);
	PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] = TRUE;
};


instance ITWR_DIARY_BLACKNOVICE_MIS(C_ITEM)
{
	name = "Deník";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_diary_blacknovice;
};


func void use_diary_blacknovice()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"U tu èekám na pøedvolání víc jak 36 dní. Zaèínám pochybovat, e se to vùbec kdy stane, ale prostì jen plním rozkazy. Tady se ke mnì ale chovají jako k nìjaké staré sluce.");
	Doc_PrintLines(ndocid,0,"Klíèník mi naøídil, abych zavøel všechny závory, ale ještì jsem se k tomu vùbec nedostal. Kdy to takhle pùjde dál, bude moci branou procházet kadı otrapa.");
	Doc_PrintLines(ndocid,0,"Je to ostuda, e si nepamatuji správné kombinace. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Pøed lety jsem se vplíil do velké sínì, ale jen tìko jsem mohl èekat, e uvidím Pána. Zajímalo by mì, jestli by mì k nìmu pustili, kdybych se stal jedním z nich.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Vèera jsem zkusil štìstí, ale opustilo mì v komnatách se dvìma pákami, ještì ne jsem mohl ve správném poøadí stisknout tøi spínaèe v západním køídle. Ten pes ty komnaty zamkl! Zítra se pokusím nìjak zmocnit jeho klíèe.");
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Deník novice èerného mága se zmiòuje o komnatách s pákami, klíèníkovi, kombinaci spínaèù a dalších vìcech. Mìl bych si to zapamatovat - jednou by se mi to mohlo hodit.");
};


instance ITWR_ZUGBRUECKE_MIS(C_ITEM)
{
	name = "Starı dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_zugbruecke;
	scemename = "MAP";
	description = name;
};


func void use_zugbruecke()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"   Poslední varování!");
	Doc_SetMargins(ndocid,-1,50,50,70,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Je mi fuk, jestli ten most pøejdete z druhé strany, nebo ne. Pro mì za mì mùete všichni shnít v pekle!");
	Doc_PrintLines(ndocid,0,"Dokud jsem tu pánem já, ten most zùstane tak, jak je. A jestli ještì nìkoho pøistihnu, jak se snaí šípem strefit do nìkterého spínaèe a dostat se na druhou stranu, vlastnoruènì ho povìsím na nejbliším stromì!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Archol");
	Doc_Show(ndocid);
};


instance ITMI_POWEREYE(C_ITEM)
{
	name = "Oko moci";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

