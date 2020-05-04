
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
			b_logentry(TOPIC_FIRECONTEST,"Jako�to novic m�m pr�vo na Zkou�ku ohn�. To znamen�, �e mi ka�d� ze t�� m�g� z Nejvy��� rady zad� n�jak� �kol. Pokud je spln�m, budu p�ijat do Kruhu ohn�.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Zkou�ka ohn�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"I kdy� novic m��e m�t pocit, �e je p�ipraven podstoupit Zkou�ku ohn�, neznamen� to, �e bude vybr�n. Pokud ale na sv�m rozhodnut� st�le trv�, m� pr�vo zkou�ku po�adovat a ��dn� m�g mu v tom nesm� br�nit. Ale nejen�e mus� proj�t zkou�kou magie, mus� tak� naj�t osv�cen� skrze ohe�. P�ednese-li sv� rozhodnut� Nejvy��� rad�, �ek� ho ZKOU�KA OHN�.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Zkou�ka prov��� jak novicovu moudrost, tak i s�lu a obratnost. Proto se skl�d� celkem ze t�� ��st�, z nich� ka�dou mu zad� jeden m�g Nejvy��� rady je�t� p�edt�m, ne� slo�� p��sahu ohn� a bude spjat s t�mto �ivlem.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Takov� je Innosova v�le a tak se i stane. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Nejvy��� rada");
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
		Doc_PrintLines(ndocid,0,"...Douf�m, �e kupole ochr�n� rudu p�ed zlobou Beliarovou. Kr�l je ve sv� naivit� schopen v��it, �e jsme ji postavili proto, aby ��dn� z v�z�� neunikl. No, jestli tahle lest poslou�� vy���m c�l�m, a� se tak stane. Mohu jen doufat, �e n�m je�t� zb�v� dost �asu pro p��pravy na boj. Jakmile kupole obklop� Hornick� �dol�, vynalo��m v�echnu svou moc, aby se boj u� v�ce nezdr�oval. ");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"K p��prav� runy 'Bo�sk� z�sah' je t�eba: 1 sv�cen� voda, ��dn� svitek s kouzlem");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"...postupoval jsem podle instrukc� a prost� jsem na �ist� runov� k�men na runov� tabulce nalil Innosovu sv�cenou vodu. Ta jej ale zcela zni�ila - po��t�m tedy, �e tohle kouzlo m��e pou��t pouze Vyvolen�.");
			Doc_PrintLines(ndocid,1,"Kl�ter jsem sv��il pod ochranu svat� Innosovy aury. Opat se u� o n�j postar�, dokud se n�m nezjev� Vyvolen�.");
			Doc_PrintLines(ndocid,1,"Mo�n� �e v nadch�zej�c�m boji sehraj� kl��ovou roli Innosovy slzy. Nemohu je ale dr�et na m�st�, kde je ka�d� uvid� - je to p��li� nebezpe�n�. Rad�i je nech�m tady v knihovn�.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"K v�rob� ka�d� runy pot�ebuji ur�it� ingredience. Kdy� je pak pou�iji na �ist� runov� k�men, mohu zvolenou runu vytvo�it podle runov� tabulky.");
			b_logentry(TOPIC_TALENTRUNES,"P��sady pro runu 'tajn�ho teleportu' jsou: 1 Innosova slza");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Pro ka�d� z tajn�ch m�st mus� pomoc� pr�zdn�ho runov�ho kamene a lahvi�ky sv�cen� vody vytvo�it teleporta�n� runu, kter� t� pak p�enese do zvolen� m�stnosti.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Te� u� jsem si skoro jist, �e pr�v� Innosovy slzy pou��vali za d�vn�ch �as� paladinov� p�i dnes ji� zapomenut�m ritu�lu sv�cen� me�e. Tak�e tahle mal� lahvi�ka, co jsem na�el, by m�la posv�cen� zbrani p�idat je�t� dal�� s�lu.");
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
			b_logentry(TOPIC_TALENTSMITH,"K vykov�n� takov� zbran� pot�ebuji hlavn� kousek surov� oceli. Tu pak doruda roz�hav�m v kov��sk� v�hni a pak ji budu kout na kovadlin�. U ur�it�ch zbran� je tak� �asto zapot�eb� pou��t jist� substance, kter� jim pak prop�j�� jedine�n� vlastnosti.");
			b_logentry(TOPIC_TALENTSMITH,"P�id�m-li 4 kousky rudy a p�tkr�t dra�� krev, mohu vykovat DRAKOBIJCE.");
			b_logentry(TOPIC_TALENTSMITH,"Kdy� pou�iji 5 kousk� rudy a p�tkr�t dra�� krev, vykov�m VELK�HO DRAKOBIJCE.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Zdroj: Zbran� p�na drak�.");
			Doc_PrintLines(ndocid,1,"Chce�-li zbroj z dra��ch �upin co mo�n� vytvrdit, mus� je pot�hnout rudou, kter� se t�� v �dol� na ostrov� Karynis.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"M�-li b�t me� hoden p�na drak�, pak mus� jeho �epel omo�it v dra�� krvi. Pouh�ch 5 ampulek s touto vz�cnou tekutinou dod� oceli neb�valou ostrost a pr�raznost.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Pozn�mka: 'Karynis' je pravd�podobn� m�sto dnes zn�m� jako Khorinis.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};

