
func void use_bookstand_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_logentry(TOPIC_FIRECONTEST,"Jakoto novic mám právo na Zkoušku ohnì. To znamená, e mi kadı ze tøí mágù z Nejvyšší rady zadá nìjakı úkol. Pokud je splním, budu pøijat do Kruhu ohnì.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Zkouška ohnì");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"I kdy novic mùe mít pocit, e je pøipraven podstoupit Zkoušku ohnì, neznamená to, e bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku poadovat a ádnı mág mu v tom nesmí bránit. Ale nejene musí projít zkouškou magie, musí také najít osvícení skrze oheò. Pøednese-li své rozhodnutí Nejvyšší radì, èeká ho ZKOUŠKA OHNÌ.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Zkouška provìøí jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tøí èástí, z nich kadou mu zadá jeden mág Nejvyšší rady ještì pøedtím, ne sloí pøísahu ohnì a bude spjat s tímto ivlem.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Taková je Innosova vùle a tak se i stane. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Nejvyšší rada");
		Doc_Show(ndocid);
	};
};


var int finaldragonequipment_once;

func void use_finaldragonequipment_s1()
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
		Doc_PrintLines(ndocid,0,"...Doufám, e kupole ochrání rudu pøed zlobou Beliarovou. Král je ve své naivitì schopen vìøit, e jsme ji postavili proto, aby ádnı z vìzòù neunikl. No, jestli tahle lest poslouí vyšším cílùm, a se tak stane. Mohu jen doufat, e nám ještì zbıvá dost èasu pro pøípravy na boj. Jakmile kupole obklopí Hornické údolí, vynaloím všechnu svou moc, aby se boj u více nezdroval. ");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"K pøípravì runy 'Boskı zásah' je tøeba: 1 svìcená voda, ádnı svitek s kouzlem");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"...postupoval jsem podle instrukcí a prostì jsem na èistı runovı kámen na runové tabulce nalil Innosovu svìcenou vodu. Ta jej ale zcela znièila - poèítám tedy, e tohle kouzlo mùe pouít pouze Vyvolenı.");
			Doc_PrintLines(ndocid,1,"Klášter jsem svìøil pod ochranu svaté Innosovy aury. Opat se u o nìj postará, dokud se nám nezjeví Vyvolenı.");
			Doc_PrintLines(ndocid,1,"Moná e v nadcházejícím boji sehrají klíèovou roli Innosovy slzy. Nemohu je ale dret na místì, kde je kadı uvidí - je to pøíliš nebezpeèné. Radši je nechám tady v knihovnì.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"K vırobì kadé runy potøebuji urèité ingredience. Kdy je pak pouiji na èistı runovı kámen, mohu zvolenou runu vytvoøit podle runové tabulky.");
			b_logentry(TOPIC_TALENTRUNES,"Pøísady pro runu 'tajného teleportu' jsou: 1 Innosova slza");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Pro kadé z tajnıch míst musíš pomocí prázdného runového kamene a lahvièky svìcené vody vytvoøit teleportaèní runu, která tì pak pøenese do zvolené místnosti.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Teï u jsem si skoro jist, e právì Innosovy slzy pouívali za dávnıch èasù paladinové pøi dnes ji zapomenutím rituálu svìcení meèe. Take tahle malá lahvièka, co jsem našel, by mìla posvìcené zbrani pøidat ještì další sílu.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"K vykování takové zbranì potøebuji hlavnì kousek surové oceli. Tu pak doruda rozhavím v kováøské vıhni a pak ji budu kout na kovadlinì. U urèitıch zbraní je také èasto zapotøebí pouít jisté substance, které jim pak propùjèí jedineèné vlastnosti.");
			b_logentry(TOPIC_TALENTSMITH,"Pøidám-li 4 kousky rudy a pìtkrát draèí krev, mohu vykovat DRAKOBIJCE.");
			b_logentry(TOPIC_TALENTSMITH,"Kdy pouiji 5 kouskù rudy a pìtkrát draèí krev, vykovám VELKÉHO DRAKOBIJCE.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Zdroj: Zbranì pána drakù.");
			Doc_PrintLines(ndocid,1,"Chceš-li zbroj z draèích šupin co moná vytvrdit, musíš je potáhnout rudou, která se tìí v údolí na ostrovì Karynis.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Má-li bıt meè hoden pána drakù, pak musíš jeho èepel omoèit v draèí krvi. Pouhıch 5 ampulek s touto vzácnou tekutinou dodá oceli nebıvalou ostrost a prùraznost.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Poznámka: 'Karynis' je pravdìpodobnì místo dnes známé jako Khorinis.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};

