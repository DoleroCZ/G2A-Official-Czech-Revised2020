
instance DIA_XARDAS_FIRSTEXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_firstexit_condition;
	information = dia_xardas_firstexit_info;
	permanent = FALSE;
	description = "Vyraz�m hned, jak budu moci!";
};


func int dia_xardas_firstexit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_firstexit_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Vyraz�m hned, jak budu moci!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Dobr�! A je�t� jedna v�c: ne��kej nikomu, �e jsme spolu mluvili. Hlavn� to ne��kej ��dn�mu m�govi.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//Co jsem ode�el, pova�uj� m� m�gov� ohn� za mrtv�ho - a to se m��e docela hodit.
	AI_StopProcessInfos(self);
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_XARDAS_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_exit_condition;
	information = dia_xardas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_exit_info()
{
	AI_StopProcessInfos(self);
};


var int addon_zuerst;

instance DIA_XARDAS_HELLO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_hello_condition;
	information = dia_xardas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_hello_condition()
{
	return TRUE;
};

func void dia_xardas_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//Tak t� tu m�me! U� jsem si nemyslel, �e se je�t� setk�me.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//Cit�m se, jako kdybych t�i t�dny le�el pod hromadou kamen�.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//No, taky �e ano. Pouze magie v tv� zbroji t� zachr�nila.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//B�l jsem se, �e u� t� nebudu moci osvobodit z ruin chr�mu.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//Ale dost toho. Te� jsi tady.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//Je tady NOV� nebezpe��, o kter� se mus�me postarat.
	Info_ClearChoices(dia_xardas_hello);
	Info_AddChoice(dia_xardas_hello,"Te� alespo� m�me dost �asu. Postaral jsem se o to. Sp��...",dia_addon_xardas_hello_dragons);
	Info_AddChoice(dia_xardas_hello,"O jak�m NOV�M nebezpe�� to mluv�?",dia_addon_xardas_hello_man);
};

func void dia_addon_xardas_hello_man()
{
	PlayVideo("Intro_ADDON");
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_10");	//Mus� se s nimi spojit! Jen tak m��eme Beliarovi odolat!
	ADDON_ZUERST = TRUE;
};

func void dia_addon_xardas_hello_dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//Te� alespo� m�me dost �asu. Postaral jsem se o to. Sp�� je pora�en.
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... byl zapuzen. Porazil jsi ho, to je naprost� pravda - ale nen� v na�� moci zastavit v�lku, kter� bude te� n�sledovat.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Sv�m posledn�m zb�sil�m sk�ekem vyslal Sp�� na cestu arm�dy temnot.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Byl to rozkaz ur�en� v�em zl�m stv�r�m. Mocn� zakl�nadlo, kter� nemohou neuposlechnout.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Jeho posledn� rozkaz byl: P�IJ�TE! A p�i�li. V�ichni. Dokonce i draci.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(u�asle)... Draci!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Jsou to prad�vn� stvo�en� neb�val� moci. C�t�m jejich p��tomnost - dokonce i zde.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//Shrom�dili kolem sebe celou arm�du ni���ch stv�r, aby jim slou�ily.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//Kde je ta arm�da te�?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Ut�bo�ila se nedaleko odsud, v Hornick�m �dol� pobl� Khorinisu. Pomalu se p�ipravuje k �toku.
	if(ADDON_ZUERST == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(zamy�len�) Moc �asu n�m nezb�v�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//Ale to nen� v�e. Je tady JIN� hrozba, o kter� jsem se pr�v� dozv�d�l.
		Info_ClearChoices(dia_xardas_hello);
		Info_AddChoice(dia_xardas_hello,"O jak�m NOV�M nebezpe�� to mluv�?",dia_addon_xardas_hello_man);
	};
};


instance DIA_XARDAS_AWAY(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_away_condition;
	information = dia_xardas_away_info;
	permanent = FALSE;
	description = "Tak si posp�me, abychom byli co nejrychleji pry�!";
};


func int dia_xardas_away_condition()
{
	if(!Npc_KnowsInfo(other,dia_xardas_todo) && !Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_away_info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Tak si posp�me, abychom byli co nejrychleji pry�!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Pokud te� ute�eme, bude to znamenat jedin� - budeme se muset drak�m postavit pozd�ji.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//S pomoc� voj�k� a m�g�, kte�� �ij� v t�chto kon�in�ch, bychom mohli jejich arm�du zastavit d��v, ne� se �pln� zformuje.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//Lep�� �anci u� nikdy m�t nebudeme.
};


instance DIA_XARDAS_TODO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_todo_condition;
	information = dia_xardas_todo_info;
	permanent = FALSE;
	description = "Co budeme d�lat?";
};


func int dia_xardas_todo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_todo_info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Co budeme d�lat?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//Tentokr�t to sami nezvl�dneme. Proti t�m drak�m n�m m��e pomoci jen Innosova moc.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//Ve m�st� Khorinis s�dl� skupina paladin�, je to nedaleko odsud.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Maj� mocn� artefakt, kter� by n�m mohl v boji proti drak�m hodn� pomoci.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//��kaj� mu Innosovo oko. Mus� ten artefakt za ka�dou cenu z�skat.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//�ekni paladin�m o nebezpe��, kter� hroz�. MUS͊ p�esv�d�it jejich v�dce, aby n�m pomohl!
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_07");	//A jak s n�m bude� mluvit, mus� naj�t Beliar�v artefakt.
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_08");	//Je to prot�j�ek Innosova Oka. Nesm� padnout do rukou zla.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_RUNNING);
	b_logentry(TOPIC_INNOSEYE,"V Khorinisu se usadila skupina paladin�, kte�� opatruj� mocn� artefakt zvan� Innosovo oko, jen� n�m m��e pomoci zahnat dra�� hrozbu. Mus�m ty svat� bojovn�ky n�jak p�esv�d�it, aby se k n�m p�idali.");
};


instance DIA_ADDON_XARDAS_STONEPLATE(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_addon_xardas_stoneplate_condition;
	information = dia_addon_xardas_stoneplate_info;
	description = "M��e� mi ��ct n�co o t�hle kamenn� desce?";
};


func int dia_addon_xardas_stoneplate_condition()
{
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//M��e� mi ��ct n�co o t�hle kamenn� desce?
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//Nejprve jsem si myslel, �e to je jak�si magick� artefakt, ale do�el jsem k z�v�ru, �e to nen� moc d�le�it�.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//Nedok�zal jsem tu desku �pln� p�elo�it, ale vypad� to, �e jde o p��b�h velmi star� kultury.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//Jestli ji chce�, klidn� si ji vem. Nem�m pro ni u� ��dn� upot�eben�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_XARDAS_PORTAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_portal_condition;
	information = dia_addon_xardas_portal_info;
	description = "M�gov� Vody objevili port�l na nezn�mou ��st ostrova ...";
};


func int dia_addon_xardas_portal_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_whatsornament) && !c_schasbeliarsweapon() && (SATURAS_KLAUEINSMEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_portal_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//M�gov� Vody objevili port�l na nezn�mou ��st ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//Zaj�mav� ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//A� najde� n�co, co n�m OPRAVDU pom��e, zprav m� o tom!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//N�kde tam mohl b�t skryt Beliar�v artefakt. Najdi ho!
};


instance DIA_ADDON_XARDAS_PORTALAGAIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_portalagain_condition;
	information = dia_addon_xardas_portalagain_info;
	permanent = TRUE;
	description = "O nezn�m� ��sti ostrova ...";
};


func int dia_addon_xardas_portalagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_xardas_portal) && !c_schasbeliarsweapon() && (SATURAS_KLAUEINSMEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_portalagain_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//O nezn�m� ��sti ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//Nezat�uj m� detaily. Vra� se, a� najde� n�co skute�n� u�ite�n�ho.
};


instance DIA_ADDON_XARDAS_ADDONSUCCESS(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_addon_xardas_addonsuccess_condition;
	information = dia_addon_xardas_addonsuccess_info;
	description = "Prob�dal jsem nezn�mou ��st ostrova ...";
};


func int dia_addon_xardas_addonsuccess_condition()
{
	if(c_schasbeliarsweapon() || (SATURAS_KLAUEINSMEER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_xardas_addonsuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//Prob�dal jsem nezn�mou ��st ostrova ...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//A co jsi na�el?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//V�e nabralo sm�r k mocn�mu artefaktu. Beliarovu dr�pu.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Beliar�v Dr�p? Kde je te� ? M� ho u sebe?
	if(c_schasbeliarsweapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Jo, m�m ho tady.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(la�n�) Velmi zaj�mav�.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//Tato zbra� m��e b�t pro n�s velmi u�ite�n�. Ale tak� extr�mn� nebezpe�n�.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//Pou�ivej ji opatrn�! A hlavn�, neztra� ji!
		b_giveplayerxp(XP_AMBIENT * 3);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//U� jej nem�m ...
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Dal jsem ji m�g�m Vody, aby ji vrhli do mo�e ...
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(rozzu�en�) Zbl�znil ses? V� v�bec, co jsi dal pry� z rukou?
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//Tato zbra� n�m mohla b�t velmi u�ite�n�!
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//V���m, �e tak je to lep��.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(vzdech) Cesty bo�� jsou ob�as nevyzpytateln� ...
	};
};


instance DIA_XARDAS_WEAPON(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_weapon_condition;
	information = dia_xardas_weapon_info;
	permanent = FALSE;
	description = "Pot�ebuji zbran�.";
};


func int dia_xardas_weapon_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_weapon_info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Pot�ebuji zbran�.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//M��u ti d�t jen to m�lo, co tady m�m.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Porozhl�dni se po m� v�i. Vem si cokoliv, o �em bude� p�esv�d�en, �e by se ti mohlo hodit.
};


instance DIA_XARDAS_ARTEFAKT(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_artefakt_condition;
	information = dia_xardas_artefakt_info;
	permanent = FALSE;
	description = "Co p�esn� je to 'Innosovo oko'?";
};


func int dia_xardas_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_artefakt_info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//Co p�esn� je to 'Innosovo oko'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Je to amulet. Legenda vypr�v�, �e do n�j vlo�il ��st sv� s�ly s�m Innos.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Obnov� ��st tv� ztracen� s�ly a pom��e n�m porazit draky.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//M� tak� dal�� skryt� schopnosti. O nich ti pov�m v�c, a� ho bude� m�t u sebe.
};


instance DIA_XARDAS_PALADIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 3;
	condition = dia_xardas_paladin_condition;
	information = dia_xardas_paladin_info;
	permanent = FALSE;
	description = "Pro� by mi m�li paladinov� Innosovo oko d�vat?";
};


func int dia_xardas_paladin_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_paladin_info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//Pro� by mi m�li paladinov� Innosovo oko d�vat?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Proto�e ty jsi ten, komu osud ur�il, aby jej nosil.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//Jak m��e� v�d�t n�co takov�ho?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//M�m hned n�kolik d�vod� si to myslet, ale nejd�le�it�j�� je ten, �e jsi porazil Sp��e. Kdybys nebyl obl�benec boh�, byl bys te� mrtv�.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//�ekn�me, �e m� pravdu a �e jsem vyvolen�, abych nesl Innosovo oko. Jak ale paladinov� poznaj�, �e to je pravda?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Oko samo si zvol� toho, kdo jej m��e m�t. Jakmile se k n�mu dostane� a nasad� si ho, nebudou paladinov� moci o tv�ch slovech d�l pochybovat.
};


instance DIA_XARDAS_KHORINIS(C_INFO)
{
	npc = none_100_xardas;
	nr = 4;
	condition = dia_xardas_khorinis_condition;
	information = dia_xardas_khorinis_info;
	permanent = FALSE;
	description = "Jak se dostanu do m�sta?";
};


func int dia_xardas_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (lothar.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_khorinis_info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//Jak se dostanu do m�sta?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Jdi po cest� vedouc� odsud skrz hory. M�sto je velk�. Nem��e� ho minout.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Ale d�vej si pozor! Cesta do m�sta nen� �pln� bezpe�n�. A ty nejsi zdaleka tak siln�, jak jsi kdysi b�val.
};


instance DIA_XARDAS_WHEREEX(C_INFO)
{
	npc = none_100_xardas;
	nr = 6;
	condition = dia_xardas_whereex_condition;
	information = dia_xardas_whereex_info;
	permanent = FALSE;
	description = "A kde to v�bec jsme?";
};


func int dia_xardas_whereex_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_whereex_info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//A kde to v�bec jsme?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Jak jsem u� �ekl, pobl� m�sta Khorinis.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Postavil jsem si zde znovu svou v�.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Ale v�dy� je to jen p�r dn�, co jsme se naposledy vid�li v Hornick�m �dol�...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Slu�ebn�ci, kter� jsem k obnoven� sv� v�e povolal, odvedli d�kladnou pr�ci...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Taky m�m ten pocit.
};


instance DIA_XARDAS_EQUIPMENT(C_INFO)
{
	npc = none_100_xardas;
	nr = 7;
	condition = dia_xardas_equipment_condition;
	information = dia_xardas_equipment_info;
	permanent = FALSE;
	description = "Kde najdu lep�� v�bavu?";
};


func int dia_xardas_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_weapon) && Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_equipment_info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//Kde najdu lep�� v�bavu?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Nejbli��� m�sto, kde m��e� naj�t lep�� zbran� a brn�n�, je m�sto Khorinis.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Ale dole v �dol� m��e� tu a tam naj�t l��iv� bylinky, kter� ti pomohou, kdy� bude� zran�n v boji.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Vid� to jezero hned p�ed mou v��? Od n�j vede do �dol� tajn� cesta.
};


instance DIA_XARDAS_ABOUTLESTER(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_aboutlester_condition;
	information = dia_xardas_aboutlester_info;
	permanent = FALSE;
	description = "Mluvil jsi u� s Lesterem?";
};


func int dia_xardas_aboutlester_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_send_xardas) && (Npc_GetDistToWP(lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_aboutlester_info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Mluvil jsi u� s Lesterem?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Ano, zasypal jsem ho ot�zkami. �ekl mi toho hodn�, ale byl �pln� vy�erpan�.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Je vlastn� z�zrak, �e ten �t�k v�bec p�e�il. Poslal jsem jej, a� si odpo�ine.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Co ti �ekl?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Boj�m se, �e nic dobr�ho. Nejen, �e vid�l draka, ale tak� mu�e v �ern�ch k�p�ch.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//A?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Pokud ti mu�i skute�n� existuj�, p�edstavuje jejich p��tomnost mo�nou hrozbu.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//A to se mi moc nel�b�. Na, vezmi si m�j prsten. Ochr�n� t� p�ed magi�.
	b_giveinvitems(self,other,itri_prot_mage_01,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_FIRSTPAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 10;
	condition = dia_xardas_firstpal_condition;
	information = dia_xardas_firstpal_info;
	permanent = FALSE;
	description = "Byl jsem ve m�st�.";
};


func int dia_xardas_firstpal_condition()
{
	if((lothar.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_firstpal_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Byl jsem ve m�st�.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//A? Poda�ilo se ti promluvit si s v�dcem paladin�?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Nepustil m� k n�mu.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Nesmysl! Mus� existovat zp�sob, jak se k n�mu dostat.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Kdy� sel�e v�echno ostatn�, vstup do kl�tera a sta� se m�gem.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Mo�n� to je z mor�ln�ho hlediska tro�ku pochyben�, ale ��el sv�t� prost�edky.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Pokud bude� m�gem, ur�it� setk�n� s tebou neodm�tne.
};


instance DIA_XARDAS_WEITER(C_INFO)
{
	npc = none_100_xardas;
	nr = 99;
	condition = dia_xardas_weiter_condition;
	information = dia_xardas_weiter_info;
	permanent = TRUE;
	description = "Tak co ud�l�me te�?";
};


func int dia_xardas_weiter_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weiter_info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//Tak co ud�l�me te�?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Budeme postupovat podle pl�nu. Jinak to nejde.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ty b� z�skat Innosovo oko a j� budu hledat odpov�di.
};


instance DIA_XARDAS_KDFSECRET(C_INFO)
{
	npc = none_100_xardas;
	nr = 9;
	condition = dia_xardas_kdfsecret_condition;
	information = dia_xardas_kdfsecret_info;
	permanent = FALSE;
	description = "Pro� o tob� nemaj� m�gov� ohn� v�d�t?";
};


func int dia_xardas_kdfsecret_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit))
	{
		return TRUE;
	};
};

func void dia_xardas_kdfsecret_info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Pro� o tob� nemaj� m�gov� ohn� v�d�t?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//B�val jsem vysoko postaven� �len Kruhu. U� tenkr�t jsem m�l podez�en�, �e kl��em k magick� bari��e by mohla b�t magie d�mon�.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Nikdy se mi v�ak nepoda�ilo p�esv�d�it ostatn� �leny Kruhu, aby sledovali tuhle stopu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Opustil jsem tedy Kruh, abych mohl studovat �ern� um�n�.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//A to je zlo�in, pro kter� ohniv� m�gov�, (j�zliv�) 'Innosovi slu�ebn�ci', v�dy 'Dob��' a 'Ctnostn�', nikdy nep�ijmou ��dnou omluvu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Jsou si jisti, �e jsem st�le na�ivu, ale v�bec netu��, kde m� hledat - a to je jedin� dob�e.
};


instance DIA_XARDAS_KAP3_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap3_exit_condition;
	information = dia_xardas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BACKFROMOW(C_INFO)
{
	npc = none_100_xardas;
	nr = 31;
	condition = dia_xardas_backfromow_condition;
	information = dia_xardas_backfromow_info;
	description = "Vr�til jsem se z Hornick�ho �dol�.";
};


func int dia_xardas_backfromow_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_backfromow_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Vr�til jsem se z Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//U� bylo na�ase. Co jsi vid�l?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//M�l jsi pravdu. Cel� zem� se hem�� nep��telskou arm�dou.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Sk�eti obl�haj� hrad a draci zpusto�ili cel� kraj.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Jestli se nepletu, tak nebude dlouho trvat a za�to�� na Khorinis.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_DMTSINDDA(C_INFO)
{
	npc = none_100_xardas;
	nr = 32;
	condition = dia_xardas_dmtsindda_condition;
	information = dia_xardas_dmtsindda_info;
	description = "Co se to tu proboha stalo?";
};


func int dia_xardas_dmtsindda_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_backfromow))
	{
		return TRUE;
	};
};

func void dia_xardas_dmtsindda_info()
{
	if(Npc_KnowsInfo(other,dia_lester_backintown))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Lester ��kal, �e m� chce� okam�it� vid�t.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Co se to tu proboha stalo?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Nep��tel se dozv�d�l, kdo ve skute�nosti jsi, a chce se zmocnit Innosova oka.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Zjistil, jak� hrozba se na n�j �ene. Donutilo ho to opustit �kryt a p�ej�t do �toku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Je konec hry na schov�vanou. Je�t� v�era nikdo nev�d�l, jak bude nep��telsk� �tok vypadat. Te� je to nad slunce jasn�.
	b_logentry(TOPIC_INNOSEYE,"Nep��tel se dom�kl, �e hled�m Innosovo oko. Je na�ase je z�skat, ne� bude p��li� pozd�.");
	Info_ClearChoices(dia_xardas_dmtsindda);
	Info_AddChoice(dia_xardas_dmtsindda,"Za�to�ili na m� m�gov� v �ern�ch rouch�ch.",dia_xardas_dmtsindda_dmt);
	Info_AddChoice(dia_xardas_dmtsindda,"Kone�n� jsem z�skal d�kaz pro lorda Hagena.",dia_xardas_dmtsindda_beweis);
};

func void dia_xardas_dmtsindda_dmt()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Za�to�ili na m� m�gov� v �ern�ch rouch�ch.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//Nep��tel m� mnoho podob. P�tra�i jsou jednou z nich. Oni jsou t�mi, kdo p�ipravuje p�du pro nep��tele.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Zaujali pozice na strategick�ch m�stech a te� jen �ekaj� na vhodnou p��le�itost, aby spustili past.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Vyh�bej se jim. Jsou to mocn� magick� stvo�en� a pokus� se t� odstranit z cesty za ka�dou cenu.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Xardas ty �ern� od�n� m�gy zn�. P�tra�i jsou pravd�podobn� t�m, kdo na�e nep��tele ovl�d�. Jsou nesm�rn� nebezpe�n�.");
	};
};

func void dia_xardas_dmtsindda_beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Kone�n� m�m d�kaz, kter� po mn� lord Hagen cht�l.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Co je to za d�kaz?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Dostal jsem dopis od Garonda, velitele paladin� z Hornick�ho �dol�. ��d� v n�m o posily.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//To by snad m�lo toho militantn�ho politika p�esv�d�it. Dobr� pr�ce.
	Info_AddChoice(dia_xardas_dmtsindda,"Co ud�l�me te�?",dia_xardas_dmtsindda_dmt_whattodo);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_xardas_dmtsindda_dmt_whattodo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//Co ud�l�me te�?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Jdi a dones lordu Hagenovi dopis od Garonda, m�l by ti za��dit p��stup k Innosovu oku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Pak b� do kl�tera a promluv si s Pyrokarem. Bude ti muset Oko d�t.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Nic nen� d�le�it�j��ho, ne� dostat ten artefakt do bezpe��.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Te� b�, dokud nen� pozd�. I nep��tel se ho ur�it� pokus� z�skat.
	b_logentry(TOPIC_INNOSEYE,"Oko se nach�z� v kl�tere m�g� ohn�. Doufejme, �e mi tam lord Hagen nyn� dovol� vej�t, kdy� jsem mu p�edal zpr�vu od lorda Garonda. Hlavn� m�g Pyrokar m� toti� bez Hagenova svolen� k amuletu v�bec nepust�.");
};


instance DIA_XARDAS_INNOSEYEBROKEN(C_INFO)
{
	npc = none_100_xardas;
	nr = 33;
	condition = dia_xardas_innoseyebroken_condition;
	information = dia_xardas_innoseyebroken_info;
	description = "Innosovo oko bylo zni�eno.";
};


func int dia_xardas_innoseyebroken_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_dmtsindda) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_innoseyebroken_info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Innosovo oko bylo zni�eno.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Co to ��k�? Zni�eno!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Tohle jsem na�el naho�e v severn�ch les�ch - bohu�el se mi poda�ilo z�skat u� jen jeho �lomky.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Byla to na�e jedin� nad�je, jak obst�t v boji s draky. Te� je v nen�vratnu. Selhali jsme.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_xardas_innoseyebroken);
	Info_AddChoice(dia_xardas_innoseyebroken,"Co te�?",dia_xardas_innoseyebroken_wasnun);
};

func void dia_xardas_innoseyebroken_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//Co te�?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//To je bolestn� zpr�va. Mus�me se sami v t�hle situaci zorientovat. St�hnu se a zkus�m naj�t �e�en�.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//Mezit�m bys m�l j�t do m�sta a promluvit si s vodn�m m�gem Vatrasem. Je mo�n�, �e bude v�d�t, co by m�lo b�t ud�l�no.
	b_logentry(TOPIC_INNOSEYE,"Zpr�va o zni�en� Oka Innosova Xardase rozhodn� nepot�ila. Na�� jedinou nad�j� je nyn� m�g vody jm�nem Vatras, kter� s�dl� ve m�st� Khorinisu.");
	MIS_XARDAS_GOTOVATRASINNOSEYE = LOG_RUNNING;
};


instance DIA_XARDAS_RITUALREQUEST(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_ritualrequest_condition;
	information = dia_xardas_ritualrequest_info;
	description = "Pos�l� m� za tebou Vatras.";
};


func int dia_xardas_ritualrequest_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_xardas_innoseyebroken) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualrequest_info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Pos�l� m� za tebou Vatras.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//To je dob�e. Co �ekl?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Pov�dal n�co o obr�cen�m ritu�lu ve slune�n�m kruhu.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(zasm�je se) Ten star� pekeln�k. Mysl�m, �e v�m, co m� za lubem. P�i�el jsi, abys m� dostal k n�mu.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Vypad� to tak. Kdy vyraz� na cestu?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Nesm�m nechat Vatrase �ekat. Okam�it� se vyd�m na cestu. Spl�, co mus�, a pak se ke mn� znovu p�idej.
		AI_StopProcessInfos(self);
		b_logentry(TOPIC_INNOSEYE,"Xardas souhlasil, �e se z��astn� ritu�lu kruhu Slunce.");
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		XARDAS_GOESTORITUALINNOSEYE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Z��astn�m se ritu�lu a� ve chv�li, kdy si budu jist, �e jsi pln� p�ipraven utkat se s draky.
	};
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_WARUMNICHTJETZT(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_warumnichtjetzt_condition;
	information = dia_xardas_warumnichtjetzt_info;
	description = "Pro� nejde� za Vatrasem HNED?";
};


func int dia_xardas_warumnichtjetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (XARDAS_GOESTORITUALINNOSEYE == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_xardas_warumnichtjetzt_info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Pro� nejde� za Vatrasem HNED?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//N�kdy ti prost� nerozum�m.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(rozzloben�) Nemluv se mnou t�mto t�nem. Neb�t M�, tvoje b�dn� t�lo by je�t� hnilo v tom chr�mu.
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Co se d� d�lat. Alespo� mi �ekni, co bych m�l ud�lat.",dia_xardas_warumnichtjetzt_wastun);
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Tak mi alespo� vysv�tli, pro� v�h�.",dia_xardas_warumnichtjetzt_grund);
};

func void dia_xardas_warumnichtjetzt_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Tak mi alespo� vysv�tli, pro� v�h�.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//Od chv�le, kdy jsem opustil ohniv� m�gy, jsem se jim dr�el co mo�n� z cesty.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//A na tom nehodl�m nic m�nit, leda �e bych nem�l na vybranou.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Ale ne� se vystav�m vy��tav�m pohled�m ostatn�ch m�g�, chci m�t jistotu, �e m� proti drak�m alespo� n�jakou �anci.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//S t�m sv�m o�unt�l�m vybaven�m se ale moc daleko nedostane�. Vra� se, a� bude� dostate�n� siln�.
	AI_StopProcessInfos(self);
};

func void dia_xardas_warumnichtjetzt_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Co se d� d�lat. Alespo� mi �ekni, co bych m�l ud�lat.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Na boj s draky jsi po��d p��li� slab�. S touhle v�bavou nem� v�bec ��dnou �anci.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Nevracej se, dokud nebude� l�pe p�ipraven. Pak se vyd�m za Vatrasem.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BEREIT(C_INFO)
{
	npc = none_100_xardas;
	condition = dia_xardas_bereit_condition;
	information = dia_xardas_bereit_info;
	description = "Jsem p�ipraven bojovat s draky.";
};


func int dia_xardas_bereit_condition()
{
	if((XARDAS_GOESTORITUALINNOSEYE == FALSE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_xardas_bereit_info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Jsem p�ipraven bojovat s draky.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//V tom p��pad� u� nem��eme pl�tvat �asem. Okam�it� se vyd�m do slune�n�ho kruhu. Spl�, co mus�. Setk�me se tam.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_INNOSEYE,"Xardas souhlasil, �e se z��astn� ritu�lu kruhu Slunce.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	XARDAS_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_XARDAS_BINGESPANNT(C_INFO)
{
	npc = none_100_xardas;
	nr = 35;
	condition = dia_xardas_bingespannt_condition;
	information = dia_xardas_bingespannt_info;
	permanent = TRUE;
	description = "Bude obr�cen� ritu�l fungovat?";
};


func int dia_xardas_bingespannt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3) && (XARDAS_GOESTORITUALINNOSEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_bingespannt_info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Bude obr�cen� ritu�l fungovat?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//To nem��u v�d�t najisto. Z�le�� to na tom, co p�esn� chce Vatras ud�lat.
};


instance DIA_XARDAS_PYROWILLNICHT(C_INFO)
{
	npc = none_100_xardas;
	nr = 37;
	condition = dia_xardas_pyrowillnicht_condition;
	information = dia_xardas_pyrowillnicht_info;
	description = "Pyrokar odm�t� z��astnit se ritu�lu.";
};


func int dia_xardas_pyrowillnicht_condition()
{
	if((PYROKAR_DENIESINNOSEYERITUAL == TRUE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrowillnicht_info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Pyrokar odm�t� z��astnit se ritu�lu.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//P�edev��m chce d�kaz, �e ti m��e v��it.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//No ano. Pyrokar. Velice zaj�mav�.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Z toho starocha se st�v� docela mrzout. Ale mysl�m, �e pro tebe m�m n�co u�ite�n�ho.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Kdy� jsem kdysi opou�t�l ��d ohniv�ch m�g�, vzal jsem si z kl�tera p�r v�c�.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Necht�l jsem, aby n�hodou p�i�la skupina paladin� nebo ohniv�ch m�g�, prohledali v� skrz naskrz a ty v�ci na�li.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Tak jsem je schoval na bezpe�n� m�sta, kde by je m�gov� ur�it� nikdy nehledali.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//A kde?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//N�kter� z nich jsou zam�en� v truhle na Sekobov� farm�.
	SEKOB_ROOMFREE = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Tomu Sekobovi v���?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Ne. Ale je mo�n� ho koupit a neklade ��dn� o�idn� ot�zky. Ta truhla je nav�c zam�en�. Tady m� kl��.
	CreateInvItems(self,itke_chest_sekob_xardasbook_mis,1);
	b_giveinvitems(self,other,itke_chest_sekob_xardasbook_mis,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Mezi t�mi v�cmi je jedna velice star� kniha. A� ji Pyrokar spat��, bude v�d�t, �e poch�z� ode m�.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//U� mi nen� k ni�emu. Ale �ekl bych, �e k tomuhle �kolu by se mohla docela dob�e hodit.
	b_logentry(TOPIC_INNOSEYE,"Xardas mi dal kl�� od truhlice na Sekobov� statku. Knihu, kterou uvnit� najdu, m�m zan�st Pyrokarovi.");
};


instance DIA_XARDAS_RITUALINNOSEYEREPAIRIMPORTANT(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_ritualinnoseyerepairimportant_condition;
	information = dia_xardas_ritualinnoseyerepairimportant_info;
	important = TRUE;
};


func int dia_xardas_ritualinnoseyerepairimportant_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualinnoseyerepairimportant_info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Te�, kdy� je Innosovo oko opraveno, se mus� postavit drak�m!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//V�ichni slou�� Beliarovi, bohu temnot.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Mus� ale existovat n�jak� pozemsk� s�la, kter� je ovl�d�. To je mi jasn�.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Zjisti, co za s�lu je ovl�d�.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//Vra� se sem, jakmile to zjist�!
	Info_ClearChoices(dia_xardas_ritualinnoseyerepairimportant);
	Info_AddChoice(dia_xardas_ritualinnoseyerepairimportant,DIALOG_ENDE,dia_xardas_ritualinnoseyerepairimportant_weiter);
};

func void dia_xardas_ritualinnoseyerepairimportant_weiter()
{
	AI_StopProcessInfos(self);
	b_startotherroutine(xardas,"Start");
	b_startotherroutine(vatras,"Start");
};


instance DIA_XARDAS_WASNUN(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_wasnun_condition;
	information = dia_xardas_wasnun_info;
	permanent = TRUE;
	description = "Innosovo oko je opraveno. Co d�l?";
};


func int dia_xardas_wasnun_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_wasnun_info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Innosovo oko je opraveno. Co d�l?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Nezapome� ho m�t na sob�, a� bude� st�t drak�m tv��� v tv��.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Neztr�cej �as. B� do Hornick�ho �dol� a zabij ty draky.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Jdi za Pyrokarem, a� ti vysv�tl�, jak Oko pou��vat.
	};
};


instance DIA_XARDAS_KAP4_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap4_exit_condition;
	information = dia_xardas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_PERM4(C_INFO)
{
	npc = none_100_xardas;
	nr = 40;
	condition = dia_xardas_perm4_condition;
	information = dia_xardas_perm4_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_xardas_perm4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_perm4_info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//P�tra�i je�t� neode�li. Nedaj� si pokoje, dokud t� nedostanou.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Zabij draky v Hornick�m �dol� a zjisti, kdo za t�mi �toky stoj�. Jinak bude jejich s�la neust�le nar�stat.
};


instance DIA_XARDAS_KAP5_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap5_exit_condition;
	information = dia_xardas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_xardas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_KAP6_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap6_exit_condition;
	information = dia_xardas_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_xardas_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

