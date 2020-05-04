
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//V�tej v m�m obchod�, cizin�e.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jmenuji se Bosper. Vyr�b�m luky a obchoduji s ko�e�inami.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co t� p�iv�d� do Khorinisu?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Bosper vyr�b� luky a obchoduje s k��emi. Jeho obchod najdu v doln� ��sti m�sta, u ji�n� br�ny.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "Mus�m se dostat do horn� �tvrti.";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Mus�m se dostat do horn� �tvrti.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam, kde s�dl� paladinov�? Tak na to rovnou zapome�.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Nejd��v se mus� st�t ctihodn�m m욝anem, nebo si aspo� naj�t slu�n� zam�stn�n�.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Jako cizinec se tam rozhodn� dostat nem��e�.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//To jsem taky zjistil.
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Pokud se chci dostat do horn� �tvrti, mus�m se st�t bu�to v�en�m ob�anem, nebo si naj�t pr�ci.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "Hled�m pr�ci!";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Hled�m pr�ci!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Hmm - nov� u�edn�k by se mi hodil.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Ten posledn� to vzdal zrovna p�edev��rem.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//V� aspo� n�co o lovu?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Noooo...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//M��u t� nau�it, jak stahovat zv��ata.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Za ka�dou k��i, kterou mi p�inese�, ti dob�e zaplat�m.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//M��u ti d�t p�r k���, jestli o n� m� z�jem.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//V�born�! P�ines mi tolik zv��ec�ch k��i, kolik m��e� - koup�m je od tebe za dobrou cenu.
	};
	b_logentry(TOPIC_LEHRLING,"Bosper hled� nov�ho u�edn�ka - mohl bych u n�j za��t pracovat.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "Chci se st�t tv�m u�edn�kem!";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chci se st�t tv�m u�edn�kem!
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(zak�en� se) Skv�l�! �ekl bych, �e z�klady u� m�.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad si mysl�, �e jsi dobr� �lov�k.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Ale Harad nen� o tv�ch schopnostech zrovna p�esv�d�en.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad t� pr� je�t� nikdy nevid�l.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben ti dal sv� po�ehn�n�. J� sice nejsem tak pobo�n�, ale v��m si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben ti d� po�ehn�n� jen tehdy, pokud si vypros� bo�� smilov�n�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben nem� pon�t�, kdo jsi.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino prohla�uje, �e se m��e� zapsat, u koho chce�
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino prohla�uje, �es byl obvin�n� ze zlo�inu - douf�m, �e �lo jen o n�jakou banalitu.
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Sna� se to co nejd��v urovnat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino o tob� je�t� ani nesly�el.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//A Matteo prav�, �e by t� m�li vyva�ovat zlatem.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//A Matteo se zm�nil o n�jak� p�j�ce - a� u� t�m myslel cokoliv, m�l by sis s n�m rad�i promluvit.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo tvrd�, �e s tebou o t�hle v�ci zat�m nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo tvrd�, �e t� je�t� nikdy v �ivot� nevid�l.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//To znamen�, �es z�skal doporu�en� ode v�ech mistr�!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Nyn� t� doporu�uj� �ty�i mist�i - to posta��, abys mohl k n�komu vstoupit do u�en�.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//M��e� pro m� za��t pracovat, kdykoliv bude� cht�t.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Dob�e - rozmysl�m si to.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"Jdu do toho!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Chce�-li k n�komu v doln� ��sti m�sta vstoupit do u�en�, pot�ebuje� souhlas alespo� �ty� mistr�.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Tak�e by sis m�l promluvit se v�emi, kte�� ti zat�m souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Je�t� ne� t� p�ijmu, mus�m samoz�ejm� v�d�t, jestli jsi aspo� k n��emu dobr�.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Vr�til jsi mi m�j luk, ale to o tv�m loveck�m talentu moc nevypov�d�.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nebude� toho litovat! Mysl�m, �e se n�m bude dob�e spolupracovat.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	Npc_ExchangeRoutine(lothar,"START");
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Bosper m� p�ijal za u�edn�ka. Nyn� m�m p��stup do horn� �tvrti.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Dob�e - rozmysl�m si to.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Jen se nerozhodni �patn�! Byl bys pro m� �pln� ide�ln�.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "Co kdy� se budu cht�t zapsat u n�kter�ho z ostatn�ch mistr�?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//Co kdy� se budu cht�t zapsat u n�kter�ho z ostatn�ch mistr�?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(mrzut�) Nesmysl!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad a Matteo u� u�edn�ky maj�.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchymista Constantino je star� samot�� - ten ��dn�ho u�edn�ka nep�ijal u� cel� roky.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//A co se t��e Thorbena, tak o n�m ka�d� v�, �e je �pln� �vorc - nejsp� by ti nemohl zaplatit ani m���k.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Ov�em j� velmi nutn� pot�ebuji u�edn�ka - a taky dob�e plat�m.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale a� u� se chce� zapsat u kohokoliv, bude� k tomu pot�ebovat souhlas v�ech ostatn�ch mistr� z doln� ��sti m�sta.
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "Pro� to tv�j minul� u�edn�k vzdal?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Pro� to tv�j minul� u�edn�k vzdal?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Nechal se sly�et, �e je tu posledn� dobou p��li� nebezpe�no.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Jestli t� to ale opravdu zaj�m�, m��e� se ho zeptat s�m.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Jmenuje se Bartok a nejsp� se bude potloukat kolem Coragonovy kr�my.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Kdy� z kov�rny vyjde� podchodem, ocitne� se skoro p��mo p�ed hospodou.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "D� mi sv�j souhlas, abych se mohl zapsat u jin�ho mistra?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//D� mi sv�j souhlas, abych se mohl zapsat u jin�ho mistra?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(zklaman�) Doufal jsem, �e se rozhodne� pro m�.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale kdy� to chce� takhle...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//T�m mi chce� nazna�it, �e m� nedoporu��?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Kdy� ostatn� mist�i nebudou proti, pak ano.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Kdy� u� nic jin�ho, aspo� jsi mi vr�til luk.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale ur�it� by z tebe byl dobr� lovec.
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Bosper mi d� doporu�en�, kdy� se budu cht�t st�t u�edn�kem u n�koho jin�ho.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(povzdychne si) No dob�e! P�imluv�m se za tebe - ale s jednou podm�nkou.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj pro m�, alespo� chv�li.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Tak zjist�, jestli se ti moje �emeslo zamlouv�, nebo ne.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kdo v� - mo�n� se ti zal�b� natolik, �e z�stane� u m�.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//A kdy� jsi dost dobr�, abych t� p�ijal J�, ur�it� si povede� dob�e i u ostatn�ch.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "Co m�m pro tebe ud�lat?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co m�m pro tebe ud�lat?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Nau��m t�, jak stahovat k��i ze zv��at, a ty mi pak p�inese�, �ekn�me, p�l tuctu vl��ch k���.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Bosper m� nau�� stahovat zv��ec� k��e.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//P�ines mi p�l tuctu vl��ch k���.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Tak pozn�m, �e ses sv� �emeslo nau�il.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Pokud ti to nepotrv� v��nost a jestli ty k��e budou ve slu�n�m stavu, p�ijmu t�, kdy� bude� cht�t.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Nebo (povzdech) m��e� za��t u n�kter�ho z ostatn�ch mistr� - bude�-li si to opravdu p��t.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"Mus�m Bosperovi p�in�st �est vl��ch k��� - pak pro n�j budu moci pracovat, nebo m� doporu��, abych mohl vstoupit do u�en� u jin�ho mistra.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"M�l bych ho p�im�t, aby m� nau�il stahovat zv��ec� k��e.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "Co se t��e t�ch vl��ch k���...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Co se t��e t�ch vl��ch k���...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//U� jsi vstoupil do u�en� k jin�mu mistrovi. K��e od tebe proto odkoup�m u� jenom za b�nou cenu.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//M�m je - tady.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Skv�l�! J� v�d�l, �e se pro tuhle pr�ci hod�!
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Tady m� pen�ze, jak jsem ti sl�bil.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//No a? Co si mysl�? Nen� to lep�� pr�ce, ne� se cel� dny oh�n�t me�em nebo se v nev�tran�m kutlochu patlat s n�jak�mi lahvi�kami?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Bosper m� p�ijme do u�en�, pokud s t�m budou souhlasit i ostatn� z mistr�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Dohodli jsme se na p�ltuctu - je�t� m� ale �as. Pokra�uj a opat�i mi ty k��e.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Vysv�tli mi, jak stahovat zv��ata z k��e!";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Vysv�tli mi, jak stahovat zv��ata z k��e!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//No tak poslouchej, je to jednoduch�, opravdu.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Sta�� vz�t ostr� n�� a roz��znout zv��eti b�icho. Pak po stran�ch trochu na��zni k��i na nohou a m��e� celou ko�i�inu sm�le st�hnout.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//P�ines mi vl�� k��e a pak se uvid�.
			b_logentry(TOPIC_BOSPERWOLF,"Bosper m� nau�il stahovat zv��ec� k��e.");
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Uka� mi sv� zbo��.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Nejsi tady, aby sis prohl�el moje zbo�� - m� mi p�ece p�in�st ty k��e!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Tak pokra�uj!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "Sly�el jsem, �e t� pr� n�kdo okradl.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Sly�el jsem, �e t� pr� n�kdo okradl.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kdo ti to �ekl? Nejsp� Bartok, �e? To ti nemohl pov�d�t nic lep��ho? No tak jo.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//�eknu ti, a� se ten hajzl modl�, abych ho nedostal do ruky!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Jen na chvili�ku jsem ode�el z kr�mu a kdy� jsem se vr�til, spat�il jsem jenom, jak ut�k� - s m�m lukem na rameni.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Okam�it� jsem zavolal str�e, ale ten lump b�el sm�rem k p��stavu. A tam se jim ztratil.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Trochu jsem jim p�ip�lil koudel u zadku, tak�e prohledali celou p��stavn� �tvr�, ale nena�li v�bec nic.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Jsou to prost� mamlasov�!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Vsad�m se, �e m�j luk bude po��d je�t� n�kde ve m�st�. Informoval jsem str�e u obou m�stsk�ch bran, a tak by nikoho s m�m lukem ven nepustili.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Kdybych jen toho �mejda dostal do rukou...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"Bosperovi n�kdo ukradl luk. Zlod�j uprchl do p��stavu, ale pak n�kam zmizel. Domobrana prohledala celou �tvr�, ale nikdo nic nena�el, i kdy� luk mus� b�t st�le je�t� kdesi ve m�st�.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "M�m pocit, �e tenhle luk je tv�j.";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//M�m pocit, �e tenhle luk je tv�j.
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//M�j luk! Kdes ho na�el?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//V �ern� d��e pln� krys.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Douf�m, �es s t�m nem�l n�jak� trable.
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Ne - s takov�mi v�cmi u� jsem se vypo��dal d��v.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hm, a� je to, jak chce, d�kuji ti. Jsem tv�m dlu�n�kem!
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "Co nov�ho ve m�st�?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Co nov�ho ve m�st�?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Jestli n�s sk�eti opravdu obkl���, za�ne to tu b�t velmi nep��jemn�.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//Jedin� lo�, kter� tu kotv�, pat�� paladin�m a ti si ji taky po��dn� hl�daj�. A nemysl�m, �e by ji pou�ili na z�chranu m욝an�.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Ned� se odsud dostat je�t� n�jak jinak?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Ne, nikdo z n�s odsud bez lodi neunikne.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Zat�m se nic nov�ho nep�ihodilo. Stav se pozd�ji.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Tak�e ty ses p�idal k domobran�?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Ne �e by mi to n�jak vadilo. Krom� sk�et� a bandit� m��e� v�dycky ulovit i p�r vlk� (u�kl�bne se).
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Kouk�m, �e tvoje kari�ra let� rychle vzh�ru, kr�lovsk� paladine!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//A� u� odsud p�jde� kamkoliv, nezapome� na sv�ho star�ho mistra.
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Tak tys vstoupil do kl�tera, jo? Douf�m, �e t� ob�as taky pust� ven, abys m� mohl i nad�le z�sobovat k��emi.
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Kde ses tak dlouho fl�kal?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Pot�ebuji dal�� k��e, p�inesls mi je?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Tak t� tu m�me zas...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "Jak� m�m jako u�edn�k povinnosti?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Jak� m�m jako u�edn�k povinnosti?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Je to jednoduch� - p�ines mi co nejv�c ko�e�in.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Zaplat�m ti za n� daleko lep�� cenu, ne� jakou by ti mohli nab�dnout ostatn� obchodn�ci.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Krom� toho se nemus� v obchod� moc ukazovat - zvl�dnu to klidn� v�echno s�m.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//A kde m�m sp�t?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Bohu�el tu pro tebe nem�m ��dn� voln� pokoj. Ale v hotelu na tr�i�ti t� n�kam ulo�it mus�.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Bosper mi za zv��ec� k��e zaplat� velmi p��znivou cenu.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "M�m tu pro tebe p�r k���.";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//M�m tu pro tebe p�r k���.
	if((Npc_HasItems(other,itat_sheepfur) > 0) || (Npc_HasItems(other,itat_wolffur) > 0) || (Npc_HasItems(other,itat_wargfur) > 0) || (Npc_HasItems(other,itat_shadowfur) > 0) || (Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0) || (Npc_HasItems(other,itat_addon_keilerfur) > 0))
	{
		if(Npc_HasItems(other,itat_addon_keilerfur) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_addon_keilerfur) * VALUE_KEILERFUR);
			b_giveinvitems(other,self,itat_addon_keilerfur,Npc_HasItems(other,itat_addon_keilerfur));
		};
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Ov�� k��e? Douf�m, �es tu ovci nezabil n�jak�mu sedl�kovi na pastv�.
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//To by m� ani ve snu nenapadlo.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Vl�� k��e, ty jsou dobr�.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//K��e ze sk�et�ho psa? To jsou p�kn� bestie.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//P�ni, dokonce k��e st�nov� �elmy - ty jsou velmi cenn�.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co je ksakru TOHLE za k��i?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Tu jsem st�hl z trola.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//... ta m� cenu cel�ho jm�n�!
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Dal�� velk� trol� k��e - tos ty potvory v�n� zabil?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//To v� - kdy� naraz�m na n�jakou nestv�ru, prost� chyt�m p��le�itost za pa�esy.
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//A dokonce k��e z �ern�ho trola!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Dobr� pr�ce. P�ij� zase, a� se�ene� dal��.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Ale v�dy� v�, �e m� zaj�maj� pouze k��e z vlk�, st�nov�ch �elem a tak podobn�.
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "Vid�m, �e m� na prodej n�jak� d�ln� akcie.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Vid�m, �e m� na prodej n�jak� d�ln� akcie.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Ehm, o tom nic nev�m. Klidn� si je vezmi, jestli chce�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

