
instance DIA_ADDON_SKIP_NW_EXIT(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 999;
	condition = dia_addon_skip_nw_exit_condition;
	information = dia_addon_skip_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOSKIPNW = TRUE;
};


instance DIA_ADDON_SKIP_NW_HALLO(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 1;
	condition = dia_addon_skip_nw_hallo_condition;
	information = dia_addon_skip_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_skip_nw_hallo_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//(podr�d�n�) Tady jsi, kone�n�. �ekal jsem tu hodiny.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(zmaten�) Po�kat. Ty nakonec nejsi obchodn�k z m�sta, �e?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//(kysele) Kde je Baltram?
};


instance DIA_ADDON_SKIP_NW_WERBISTDU(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_werbistdu_condition;
	information = dia_addon_skip_nw_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_addon_skip_nw_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nev�m, co ti je do toho. Ale ... pokud to chce� opravdu v�d�t, moje jm�no je Skip. Zazvonil n�jak� zvonec?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//(jako kdyby nepochopil) Kdo?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Ne��kej mi, �e jsi nesly�el jm�no Skip. Bo�e, odkud vlastn� jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jsem jeden z nejhledan�j��ch krimin�ln�k� v Khorinisu. J� a m� ho�i jsme se plavili t�mito vodami okolo tohoto ostr�vku po mnoho let.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//(pobou�en�) U� jsi o tom musel sly�et.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Ty jsi pir�t.",dia_addon_skip_nw_werbistdu_pirat);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"M�l bych t� zn�t?",dia_addon_skip_nw_werbistdu_keineahnung);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Ano, jasn�. U� si vzpom�n�m.",dia_addon_skip_nw_werbistdu_ja);
};

func void dia_addon_skip_nw_werbistdu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ano, jasn�. U� si vzpom�n�m.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//(u�asle) �estn�? Ty u� jsi o m� sly�el?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Oh do prdele! Uva�oval jsem, jestli se nem�m potloukat okolo m�sta.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Pak je �t�st�, �e jsem to neud�lal.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Domobrana by m� rychle n�kam zamkla.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Ty jsi m� nep�i�el uv�znit, �e?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Nooooo ...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//V�� mi, to nen� moudr�. Kdokoli, kdo si za�ne se star�m Skipem skon�� jako krmivo pro ryby.
	};
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_keineahnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//M�l bych t� zn�t?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Dej bacha na to, co ��k� chlap�e, nebo pozn� nep��telskou stranu star�ho Skipa.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ty jsi pir�t.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//(rozloben�) Ano, zatracen�. Nem��e� to ��ct? A rozlobenn� z toho.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//M��u kousat do fo�en jenom z nudy.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};


instance DIA_ADDON_SKIP_NW_BALTRAM(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_baltram_condition;
	information = dia_addon_skip_nw_baltram_info;
	description = "Baltram? �ek� na obchodn�ka?";
};


func int dia_addon_skip_nw_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_baltram_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? �ek� na obchodn�ka?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Ty jsi mi ale chytr�, �e?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//To jsem �ekl, nebo ne?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Vypad� to, �e tenhle �patn� podomn� obchodn�k na m� zapomn�l.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//R�d bych na n�j polo�il sv� ruce, to ti �eknu.
	Log_CreateTopic(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Pir�t Skip mi �ekl, �e m�stsk� obchodn�k Baltram d�l� obchody s pir�ty.");
	SCKNOWSBALTRAMASPIRATETRADER = TRUE;
};


instance DIA_ADDON_SKIP_BALTRAMPAKET(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_baltrampaket_condition;
	information = dia_addon_skip_baltrampaket_info;
	description = "M�m pro tebe bal�k od Baltrama.";
};


func int dia_addon_skip_baltrampaket_condition()
{
	if((MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skip_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//M�m pro tebe bal�k od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co? Te� pos�l� posl��ka?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Zd�sil se, �e? Hehe, jo, co jin�ho jsem taky mohl �ekat od v�iv�ho obchodn�ka?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//��kal, �e za to chce 3 l�hve rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(sm�je se) To by se mu l�bilo, huh? Nechal m� tu �ekat nav�dy, nep�i�el k �lov�ku, kter�mu na tom z�le�elo.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Tady, dej mu 2 l�hve. Ta nula te� bude ��astn�.
	CreateInvItems(self,itfo_addon_rum,2);
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_NW_WOHER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_woher_condition;
	information = dia_addon_skip_nw_woher_info;
	description = "Odkud jsi p�i�el?";
};


func int dia_addon_skip_nw_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_woher_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Odkud jsi p�i�el?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chce� v�d�t, kde m�me skr��?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Pro� bych to m�l ��kat chlapovi z domobrany jen tak?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Kdy� ti to �eknu, bude to jako, kdybych se �el do Khorinisu dobrovoln� vzd�t.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//To ti nepom��e, pokud jsi pom��lel o na�em naru�en�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Ostrov Khorinis je velk� a to, kde jsme my, je pro ostatn� nep��stupn� tak jako tak. Jestli�e nem� lo�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Ani pak, mus� zn�t cestu skrz �tesy. Nikdo se p�es n� nedostal, pokud neznali tajnou cestu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Jsou jen dva lid�, kte�� znaj� cestu a ty nejsi jeden z nich.
};


instance DIA_ADDON_SKIP_SCSAWGREG(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_scsawgreg_condition;
	information = dia_addon_skip_scsawgreg_info;
	description = "Zn� n�koho se z�platou na oku?";
};


func int dia_addon_skip_scsawgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (SC_KNOWSCONNECTIONSKIPGREG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_scsawgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Zn� n�koho se z�platou na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Zn�m mnoho mu�� se z�platou na oku.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Tady je n�kdo, kdo se potuluje po Khorinisu, a vypad� to, �e t� dob�e zn�.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Nedovedu si to p�edstavit. Lid�, kter� zn�m nejsou farm��i.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale ...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Nech to bejt, opravdu m� to nezaj�m�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SKIP_NW_MISSINGPEOPLE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_missingpeople_condition;
	information = dia_addon_skip_nw_missingpeople_info;
	description = "Spousta lid� z m�sta zmizela. A spouta lid� ��k�, �e ty v tom m� taky prsty.";
};


func int dia_addon_skip_nw_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Spousta lid� z m�sta zmizela. A spouta lid� ��k�, �e ty v tom m� taky prsty.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//(c�t� se bezradn�) Er ... zatracen�. Ale nen� to tak, jak si mysl�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Vypad�m jako otrok��? Ne, j� p�ev��m v�ci. Co je to za v�ci, nebo odkud jsou, nen� moje v�c.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//P�ev��me v�echny mo�n� v�ci pro ty prasata.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na za��tku to bylo jenom oby�ejn� zbo��. Jasn�, bylo to pa�ovan� zbo��.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Pot� ale za�ali un�et lidi z m�sta. Nev�m, co od nich cht�li.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Prost� jsme je p�eplavili.
};


instance DIA_ADDON_SKIP_NW_DEXTER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_dexter_condition;
	information = dia_addon_skip_nw_dexter_info;
	description = "O kom mluv�?";
};


func int dia_addon_skip_nw_dexter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_dexter_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//O kom mluv�?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//O banditech chlape. Kdo jin�? Ta spodina, kter� se te� rozl�z� po cel� zemi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//A nen� to jen okolo Khorinisu.
};

func void b_skip_saysdextersname()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Vzpomn�l jsem si na jeho jm�no. Dexter. Ano, mysl�m, �e jeho jm�no je Dexter.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Zmizel� lid� byli uneseni bandity na p��kaz v�dce bandit� Dextera. ��k� se, �e se skr�v� n�kde na z�pad� od Onarovy farmy.");
	SC_KNOWSDEXTERASKIDNAPPER = TRUE;
	RANGER_SCKNOWSDEXTER = TRUE;
};


instance DIA_ADDON_SKIP_NW_NAME(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_name_condition;
	information = dia_addon_skip_nw_name_info;
	description = "Bandit�! To nesta��. Chci jm�na ...";
};


func int dia_addon_skip_nw_name_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_dexter) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_name_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Bandit�! To nesta��. Chci jm�na ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Jm�na? Chce� v�d�t, kdo je hlava bandit�? Zatracen�, jak se to psisko vlastn� jmenovalo ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Hhm. Nem��u si vzpomenout na jm�no toho chlapa. I kdy� mysl�m, �e to bylo lehk� na zapamatov�n�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale m��u ti uk�zat, kde naj�t velitele bandit� v t�to ��sti ostrova.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//M� s sebou dobrou mapu?
	if(Npc_HasItems(other,itwr_map_newworld) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Tady, m�m mapu.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//U� to bylo ozna�eno. Je to sranda ti ni�it mapu.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Ne.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//Tak ti to m�m tedy popsat?
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Daleko na v�chod� je rozlehl� farma. Mysl�m, �e farm�� se jmenuje Onar.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//M� tam p�kn� velk� pole. Na z�pad� od t�ch pol� je mal� pevnost na vr�ku vysok�ho �tesu.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//A tam je tv�j mu�.
		b_skip_saysdextersname();
	};
};


instance DIA_ADDON_SKIP_NW_LANDKARTE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_landkarte_condition;
	information = dia_addon_skip_nw_landkarte_info;
	description = "Tady, m�m mapu.";
};


func int dia_addon_skip_nw_landkarte_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_name) && Npc_HasItems(other,itwr_map_newworld) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_landkarte_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Tady, m�m mapu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//To je dob�e. Vyzna��m ti, kde asi ten chlap pob�v�.
	b_giveinvitems(other,self,itwr_map_newworld,1);
	b_skip_saysdextersname();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Tady. Tvoje mapa.
	Npc_RemoveInvItems(self,itwr_map_newworld,1);
	CreateInvItems(self,itwr_map_newworld_dexter,1);
	b_giveinvitems(self,other,itwr_map_newworld_dexter,1);
};


instance DIA_ADDON_SKIP_NW_WOHIN(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 99;
	condition = dia_addon_skip_nw_wohin_condition;
	information = dia_addon_skip_nw_wohin_info;
	permanent = TRUE;
	description = "Kam jsi odvezl lidi?";
};


func int dia_addon_skip_nw_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_wohin_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Kam jsi odvezl lidi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//U� jsem ti �ekl, �e ti ne�eknu, kde m�me p��stav.
};

