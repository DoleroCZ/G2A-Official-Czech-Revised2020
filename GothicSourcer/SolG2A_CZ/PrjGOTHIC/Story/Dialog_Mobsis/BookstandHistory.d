
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
		Doc_PrintLines(ndocid,0,"Nejlep�� obrana je �tok - alespo� proti v�em nelidsk�m stv�r�m. Odvracet �toky zv��at nebo oblud toti� v�bec nem� cenu.");
		Doc_PrintLines(ndocid,0,"Takov�ho protivn�ka si je lep�� n�kolika dob�e m��en�mi ranami dr�et od t�la a pak ho v p�ekvapit n�hl�m v�padem.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Samoz�ejm� �e zku�en� bojovn�ci mohou tyto pohyby libovoln� spojovat. Pokud jsi mistrem bojov�ch um�n�, m��e� takov�ch kombinac� pou��vat i v�ce.");
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
		Doc_PrintLines(ndocid,0,"P��stavn� m�sto Khorinis le�� na ostrov� u pob�e�� kr�lovstv� Myrtana.");
		Doc_PrintLines(ndocid,0,"Tento ostrov je proslul� zejm�na t�m, �e se na n�m nach�z� slavn� Horn�ck� �dol�. Jeho pov�st je pochybn�, nebo� je po mnoho let obklopovala neprostupn� magick� bari�ra, a proto slou�ilo jako v�znice pro trestance z cel� ��e.");
		Doc_PrintLines(ndocid,0,"Ti zde dolovali magickou rudu, jej� lo�iska se ukr�vala hluboko pod povrchem zem�. ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"P�da za hranicemi Khorinisu je velmi �rodn�, proto tu najdete mnoho selsk�ch usedlost�, kde se p�stuj� zejm�na tu��ny a chovaj� ovce.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ji� po cel� generace pat�� nejv�t�� statek velkostatk��i, kter� pak okoln� p�du pronaj�m� ostatn�m sedl�k�m. ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uprost�ed ostrova stoj� starobyl� Innos�v kl�ter, kter� vedou m�gov� ohn� a kde prov�d�j� sv� magick� a alchymistick� v�zkumy a tak� lisuj� v�no.");
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
		Doc_PrintLine(ndocid,0,"Z�kony ostrova");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"V�ude, kde �ije v�ce lid� pohromad�, mus� dodr�ovat ur�it� pravidla pokojn�ho sou�it� - jak v kl�te�e, tak ve m�st� �i na statku.");
		Doc_PrintLines(ndocid,0,"V�echny zlo�iny proti komunit� budou potrest�ny.");
		Doc_PrintLines(ndocid,0,"Je zak�z�no provokovat souboje nebo se zapojovat do rva�ek. ");
		Doc_PrintLines(ndocid,0,"Ka�d� kr�de� je tak� zlo�inem a pachatel ponese pat�i�n� n�sledky. I ovce jsou chr�n�ny z�konem.  ");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Pokud n�kdo zabije druh�ho, mus� b�t za sv�j �in souzen a odsouzen.");
		Doc_PrintLines(ndocid,1,"Chce-li se vyhnout v�zen�, mus� zaplatit tu�nou pokutu. ");
		Doc_PrintLines(ndocid,1,"Na velk�ch m�stech dbaj� o po��dek mu�i z�kona. Doslechnou se o ka�d�m zlo�inu i p�estupku a jejich povinnost� je potrestat vin�ka a u�init tak spravedlnosti zadost. ");
		Doc_PrintLines(ndocid,1,"Ka�d�, kdo se stane ob�t� �i sv�dkem zlo�inu, nebude m�t samoz�ejm� o pachateli dobr� m�n�n�.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Samoz�ejm� �e existuj� tac�, kte�� si se z�konem p��li� hlavu nel�mou - nap��klad bandit� �i �oldn��i. ");
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

