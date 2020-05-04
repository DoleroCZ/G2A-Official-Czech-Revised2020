
instance DIA_ADDON_RIORDIAN_ADW_EXIT(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 999;
	condition = dia_addon_riordian_adw_exit_condition;
	information = dia_addon_riordian_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HELLOADW(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_helloadw_condition;
	information = dia_addon_riordian_helloadw_info;
	description = "�ekal jsi n�co takov�ho?";
};


func int dia_addon_riordian_helloadw_condition()
{
	return TRUE;
};

func void dia_addon_riordian_helloadw_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//�ekal si n�co takov�ho?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Ne. Jsem ohromen�, jak velk� muselo b�t to m�sto.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//V�t�ina budov je pochovan� pod kame��m a hl�nou, ale ruiny, kter� p�e�ily dlouh� v�ky, jsou roztrou�en� po cel� krajin�.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//�ilo jich tu tis�ce.
};


instance DIA_ADDON_RIORDIAN_WHATTOFIND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_whattofind_condition;
	information = dia_addon_riordian_whattofind_info;
	description = "S ��m v��m se m��u potkat zde v �dol�?";
};


func int dia_addon_riordian_whattofind_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_helloadw))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_whattofind_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//S ��m v��m se m��u potkat zde v �dol�?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na v�chod� le�� velk� pevnost v ba�in�.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Domn�v�me se, �e se zde ut�bo�ili banditi.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Kdyby jsem byl na tvojem m�st�, ne�el bych tam dol�. Postavili tam mnoho str��.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Vyh�bej se mo��lu, pokud nem� v�c zku�enost�, nebo si n�jdi cestu, jak se dostat okolo bandit�.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Objevili jsme pir�ty na z�pad�.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nejsem si jist�, ale mysl�m, �e n�s spozorovali.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Vypad� to tak, �e je na�e p��tomnost ru��.
};


instance DIA_ADDON_RIORDIAN_GEGEND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_gegend_condition;
	information = dia_addon_riordian_gegend_info;
	permanent = TRUE;
	description = "Pov�z mi v�c o t�to oblasti.";
};


func int dia_addon_riordian_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_whattofind) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};


var int dia_addon_riordian_gegend_info_onetime;

func void dia_addon_riordian_gegend_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Pov�z mi v�c o t�to oblasti.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co by si cht�l v�d�t?
	Info_ClearChoices(dia_addon_riordian_gegend);
	Info_AddChoice(dia_addon_riordian_gegend,DIALOG_BACK,dia_addon_riordian_gegend_back);
	if((dia_addon_riordian_gegend_info_onetime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld) == FALSE))
	{
		Info_AddChoice(dia_addon_riordian_gegend,"Je n�jak� mapa oblasti?",dia_addon_riordian_gegend_map);
		dia_addon_riordian_gegend_info_onetime = TRUE;
	};
	Info_AddChoice(dia_addon_riordian_gegend,"Kde si vid�l pir�ty?",dia_addon_riordian_gegend_piraten);
	Info_AddChoice(dia_addon_riordian_gegend,"Je�t� jednou, kde�e jsou ti banditi?",dia_addon_riordian_gegend_bandits);
	Info_AddChoice(dia_addon_riordian_gegend,"Byl si u� na z�pad�?",dia_addon_riordian_gegend_west);
	Info_AddChoice(dia_addon_riordian_gegend,"Co le�� na v�chod�?",dia_addon_riordian_gegend_ost);
	Info_AddChoice(dia_addon_riordian_gegend,"Kam se dostanu, kdy� p�jdu na jih?",dia_addon_riordian_gegend_sued);
	Info_AddChoice(dia_addon_riordian_gegend,"Co je na severu?",dia_addon_riordian_gegend_nord);
};

func void dia_addon_riordian_gegend_back()
{
	Info_ClearChoices(dia_addon_riordian_gegend);
};

func void dia_addon_riordian_gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Je n�jak� mapa oblasti?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos jednu ud�lal. Ur�ite ti ji p�enech�.
};

func void dia_addon_riordian_gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Je�t� jednou, kde�e jsou ti banditi?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Maj� jakousi pevnost s velk�m mno�stv�m str�n�ch v�� na v�chod�.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby si se tam dostal, mus� p�ej�t p�es velk� mo��l.
};

func void dia_addon_riordian_gegend_piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Kde si vid�l pir�ty?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Byli na z�pad�.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Mysl�m, �e lovili.
};

func void dia_addon_riordian_gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co je na severu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Pokud m�m ve�it z�znam�m Stavitel�, n�jde� tam dlouh� �dol� obklopen� vysok�mi sk�lami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Tamn�j�� povrch je jen pou��.
};

func void dia_addon_riordian_gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Kam se dostanu, kdy�  p�jdu na jih?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Krajina na jihu je ve�mi divok�.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//N�jde� tam klikat� cesti�ky, vodop�dy a ruiny z kamen�.
};

func void dia_addon_riordian_gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co le�� na v�chod�?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Velk� mo��l, ta oblast je velmi nebezpe�n�.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Nest�etne� tam jen bandity, ale i velmi nebezpe�nou zv��.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//M�l by si si d�vat pozor.
};


var int dia_addon_riordian_gegend_west_onetime;

func void dia_addon_riordian_gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Byl si u� na z�pad�?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Ne. Podle v�eho tam mus� b�t pob�e��.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//P�edpokl�d�m, �e pir�ti tam maj� sv�j t�bor.
	if((dia_addon_riordian_gegend_west_onetime == FALSE) && Npc_HasItems(vlk_4304_addon_william,itwr_addon_william_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Na�li jsme t�lo ryb��e nedaleko odtud.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//M�l by si se na to j�t pod�vat.
		b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
		dia_addon_riordian_gegend_west_onetime = TRUE;
	};
};


instance DIA_ADDON_RIORDIAN_HOUSESOFRULERS(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_housesofrulers_condition;
	information = dia_addon_riordian_housesofrulers_info;
	description = "Pos�l� m� Saturas. Hled�m 5 u�en� Jharkendaru.";
};


func int dia_addon_riordian_housesofrulers_condition()
{
	if(MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_housesofrulers_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Pos�l� m� Saturas. Hled�m 5 u�en� Jharkendaru?
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Budu pot�ebovat mnoho �asu na najit� u�en� podle z�znam�.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale te� ti to u� m��u ��ct p�esn�.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_RUNNING;
};


instance DIA_ADDON_RIORDIAN_WHEREAREHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_wherearehouses_condition;
	information = dia_addon_riordian_wherearehouses_info;
	description = "Kde m��u naj�t 5 u�en� Jharkendaru?";
};


func int dia_addon_riordian_wherearehouses_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && (SATURAS_SCBROUGHTALLTOKEN == FALSE))
	{
		return TRUE;
	};
};


var int b_whrearehousesofrulersonetime;

func void b_whrearehousesofrulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//D�m u�enc� je velk� budova. Mus� byt n�kde na severu.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//D�m v�le�n�k� je pevnost obklopen� kamen�m na v�chode.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Kn�zi a str�cov� m�li svoje budovy bl�zko sebe. M�l by si je naj�t na jihoz�pad�.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//L��itel� m�li svoje obydl� na jihov�chod�.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Pokud budou tyto budovy st�t, pozn� je podle stylu v jak�m jsou postaven�.
		b_whrearehousesofrulersonetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Jsou vyv��en�. Schody vedou do vchodu kryt�ho vysok�m podloub�m.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Douf�m, �e ti to pom��e.
	};
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"D�m u�enc� je velk� budova. Mus� b�t n�kde na severu.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"D�m v�le�n�k� je pevnost na v�chod�, obklopen� �tesy.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Kn�� a str�cov� byli bl�zko p�i sob�, m�l by jsem je naj�t na jihoz�pad�.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"D�m le�itel� byl na jihov�chod�.");
};

func void dia_addon_riordian_wherearehouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Kde m��u naj�t 5 u�en� Jharkendaru?
	b_whrearehousesofrulers();
};


instance DIA_ADDON_RIORDIAN_FOUNDHOUSE(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundhouse_condition;
	information = dia_addon_riordian_foundhouse_info;
	permanent = TRUE;
	description = "Hmm, o t�ch u�en�...";
};


func int dia_addon_riordian_foundhouse_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_riordian_wherearehouses) && (RIORDIANHOUSESFOUNDCOUNT < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int LIBRARY = 1;
const int HEILER = 2;
const int WARRIOR = 3;
const int PRIEST = 4;
const int TOTENW = 5;
var int riordianhouseneuigkeit;
var int riordianhousesfoundcount;

func void dia_addon_riordian_foundhouse_info()
{
	var int riordianhousexps;
	RIORDIANHOUSENEUIGKEIT = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Hmmm, o t�ch u�en�...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Ano?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_ONETIME == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Sk�eti maj� zjevn� z�jem o knihovnu U�enc�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Mysl� si, �e um� ��st ve star�m jazyce?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nemysl�m, ale kdo v�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Tak�e by si se m�l rad�ji postarat, aby zmizli.
		FOUNDHOUSEINFO[1] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
		Log_CreateTopic(TOPIC_ADDON_CANYONORCS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_CANYONORCS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_CANYONORCS,"M�g Vody Riordian by se red�ji zbavil sk�et� v ka�onu.");
	};
	if((Npc_IsDead(stoneguardian_heiler) || Npc_HasItems(other,itmi_addon_stone_04) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Domov le�itel� je uprost�ed mo��lu a hl�d� ho mnoho kamenn�ch str�c�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//St�le stoj�?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Ano, ale do kdy?
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Bol� m�, kdy� vid�m d�kazy o minulosti v takov�m stavu.
		FOUNDHOUSEINFO[2] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//S�dlo v�le�n�k� pou�il Raven jako �kryt.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynicky) Vybral si dob�e.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Je to nejbezpe�n�j�� pevnost v t�to oblasti.
		FOUNDHOUSEINFO[3] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(minecrawler_priest) || Npc_HasItems(other,itmi_addon_stone_03) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//V dom� kn��ch je mnoho d�ln�ch �erv�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Nen� tato oblast nep�irozen� pro tato zv��ata?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Rozhodn�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Och Adanosi, stra�n� v�ci se d�j� v tomto kraji.
		FOUNDHOUSEINFO[4] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(mayazombie04_totenw) || Npc_HasItems(other,itmi_addon_stone_02) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Obydl� str�c� smrti, co byli ovl�dan� silou ��bla.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Mysl�m, �e jsem je�t� nevid�l tolik zombi� jako tady.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Toto je ne�t�st�. Str�cov� smrti se jist� stali vl�dci svojich schopnost�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Jejich solidarita k sv�tu mrtv�ch jim u�kodila. Douf�m, �e je dok�e� vyv�st z omylu.
		FOUNDHOUSEINFO[5] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if(RIORDIANHOUSENEUIGKEIT > 0)
	{
		riordianhousexps = XP_ADDON_RIORDIAN_FOUNDHOUSE * RIORDIANHOUSENEUIGKEIT;
		b_giveplayerxp(riordianhousexps);
		RIORDIANHOUSESFOUNDCOUNT = RIORDIANHOUSESFOUNDCOUNT + RIORDIANHOUSENEUIGKEIT;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Pov�z mi je�t� jednou, kde je ka�d� �ast.
		b_whrearehousesofrulers();
	};
};


instance DIA_ADDON_RIORDIAN_ORKSWEG(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_orksweg_condition;
	information = dia_addon_riordian_orksweg_info;
	description = "Sk�eti ji� brzy ztrat� z�jem o tento kraj.";
};


func int dia_addon_riordian_orksweg_condition()
{
	if(Npc_IsDead(orcshaman_sit_canyonlibrarykey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_orksweg_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Sk�eti ji� brzy ztrat� z�jem o tento kraj.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Co t�m mysl�?
	if(orcshaman_sit_canyonlibrarykey.aivar[AIV_KILLEDBYPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabil jsem jejich velitele.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Jejich v�dce je mrtv�.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Douf�m, �e m� pravdu.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Opravdu nem��eme vyvolat takov� nepokoje.
	TOPIC_END_CANYONORCS = TRUE;
	b_giveplayerxp(XP_ADDON_RIORDIAN_ORKSWEG);
};


instance DIA_ADDON_RIORDIAN_FOUNDALLHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundallhouses_condition;
	information = dia_addon_riordian_foundallhouses_info;
	description = "Na�el jsem v�echna u�en�.";
};


func int dia_addon_riordian_foundallhouses_condition()
{
	if((RIORDIANHOUSESFOUNDCOUNT >= 5) && (MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_foundallhouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Na�el jsem v�ecky u�en�.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Byla v�echna tam, kde jsem ti �ekl?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ano, v�cem�n�.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Fajn, tak moje pr�ce m�la v�znam.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//D�ky.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FOUNDALLHOUSES);
};


instance DIA_ADDON_RIORDIAN_ADW_PRETEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_adw_preteach_condition;
	information = dia_addon_riordian_adw_preteach_info;
	description = "M��e� m� nau�it n�co z tv�ch schopnosti?";
};


func int dia_addon_riordian_adw_preteach_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//M��e� m� nau�it n�co z tv�ch schopnosti?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//M��u t� nau�it alchymii.
	if(Npc_HasItems(other,itam_addon_wispdetector) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//A m��u ti uk�zat, jak m��e tvoje bludi�ka hledat v�ci.
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		Log_AddEntry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
	};
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACHALCHEMY);
	RIORDIAN_ADW_ADDON_TEACHWISP = TRUE;
	RIORDIAN_ADW_ADDON_TEACHALCHEMY = TRUE;
};


instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 90;
	condition = dia_addon_riordian_adw_teach_condition;
	information = dia_addon_riordian_adw_teach_info;
	permanent = TRUE;
	description = "Uk� mi, jak m�m tr�novat mou bludi�ku.";
};


var int dia_addon_riordian_adw_teach_noperm;

func int dia_addon_riordian_adw_teach_condition()
{
	if((DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && (RIORDIAN_ADW_ADDON_TEACHWISP == TRUE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_adw_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_adw_teach);
		Info_AddChoice(dia_addon_riordian_adw_teach,DIALOG_BACK,dia_addon_riordian_adw_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_adw_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_adw_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_adw_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_adw_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_adw_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_adw_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_adw_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_adw_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};


instance DIA_RIORDIAN_ADW_TEACHALCHEMY(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 2;
	condition = dia_riordian_adw_teachalchemy_condition;
	information = dia_riordian_adw_teachalchemy_info;
	permanent = TRUE;
	description = "Uk� mi, jak nam�chat magick� lektvary.";
};


var int dia_riordian_adw_teachalchemy_permanent;

func int dia_riordian_adw_teachalchemy_condition()
{
	if((DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT == FALSE) && (RIORDIAN_ADW_ADDON_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Uk� mi, jak nam�chat magick� lektvary.
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE))
	{
		Info_ClearChoices(dia_riordian_adw_teachalchemy);
		Info_AddChoice(dia_riordian_adw_teachalchemy,DIALOG_BACK,dia_riordian_adw_teachalchemy_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esence �ivotn� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_riordian_adw_teachalchemy_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Extrakt �ivotn� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_riordian_adw_teachalchemy_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_riordian_adw_teachalchemy_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_riordian_adw_teachalchemy_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elix�r many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_riordian_adw_teachalchemy_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elix�r ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_riordian_adw_teachalchemy_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elix�r obratnosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_riordian_adw_teachalchemy_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magick� n�poje se p�ipravuj� v alchymistick� kolon�, jedna je ve tv�m obydl� v poschod�.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Pot�ebuje� ale tak� pr�zdnou n�dobu, ingredience a v�domosti jak magick� lektvar p�ipravit.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Ode m� m��e� m�t v�domosti, ale ostatn� v�ci si mus� opat�it s�m.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chce� p�ipravit?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nem��u t� nau�it u� nic, co by si neum�l.
		DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT = TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_back()
{
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

