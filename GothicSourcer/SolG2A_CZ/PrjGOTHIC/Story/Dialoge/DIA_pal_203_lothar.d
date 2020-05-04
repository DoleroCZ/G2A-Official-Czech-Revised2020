
var int lothar_imov;

instance DIA_LOTHAR_EXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_exit_condition;
	information = dia_lothar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lothar_exit_condition()
{
	if(LOTHAR_IMOV == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_FIRSTEXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_firstexit_condition;
	information = dia_lothar_firstexit_info;
	permanent = TRUE;
	description = "Mus�m j�t! (KONEC)";
};


func int dia_lothar_firstexit_condition()
{
	if(LOTHAR_IMOV == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_firstexit_info()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//Mus�m j�t!
	if(LOTHAR_REGELN == FALSE)
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//Po�kej! Je�t� nezn� m�stsk� z�kony!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Pozd�ji.
	}
	else
	{
		if((PLAYER_TALKEDABOUTDRAGONS == TRUE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//Je�t� JEDNOU usly��m, �e lidem vypr�v� o drac�ch, a bude� m�t velk� probl�my. Vyj�d�il jsem se jasn�?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//Dokud jsi v Khorinisu, jsi v bezpe��.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//Na m�sto te� dohl�ej� kr�lov�t� paladini!
			};
		};
		LOTHAR_IMOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	if(CANTHAR_INSTADT == FALSE)
	{
		Npc_ExchangeRoutine(canthar,"START");
		CANTHAR_INSTADT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_HALLO(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_hallo_condition;
	information = dia_lothar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_hallo_info()
{
	AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//St�j, cizin�e!
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//Nevid�l jsem t� proch�zet branou.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//A?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//A str�e u druh� br�ny maj� z�kaz vpou�t�t do m�sta nezn�m� osoby.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Noooo...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//Budu si s t�ma dv�ma muset promluvit!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//Ale mezi n�mi:
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Jsem Lothar. Kr�lovsk� paladin a skromn� slu�ebn�k Innose, tv�ho P�na.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//N� velitel, lord Hagen, m� pov��il �kolem vysv�tlit v�em p��choz�m nov� z�kony m�sta, kter� se vztahuj� na v�echny zdej�� obyvatele.
	AI_Output(self,other,"DIA_Addon_Lothar_Hallo_01_00");	//U� n�jakou dobu lid� ve m�st� miz�. D�vej si bacha, a� tak taky neskon��.
	if(Npc_KnowsInfo(other,dia_lester_send_xardas))
	{
		b_startotherroutine(lester,"XARDAS");
	};
};


instance DIA_LOTHAR_MESSAGE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_message_condition;
	information = dia_lothar_message_info;
	permanent = FALSE;
	description = "M�m d�le�it� vzkaz pro velitele paladin�!";
};


func int dia_lothar_message_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_message_info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//M�m d�le�it� vzkaz pro velitele paladin�!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//Ctihodn� lord Hagen nikoho nep�ij�m�.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//Za v�echny v�ci t�kaj�c� se b�n�ch ob�an� je zodpov�dn� lord Andre, velitel m�stsk� str�e.
};


instance DIA_LOTHAR_EYEINNOS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_eyeinnos_condition;
	information = dia_lothar_eyeinnos_info;
	permanent = FALSE;
	description = "P�i�el jsem si pro Innosovo oko!";
};


func int dia_lothar_eyeinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_eyeinnos_info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//P�i�el jsem si pro Innosovo oko!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//Oko spad� pod rozhodnut� lorda Hagena. Promluv si s n�m.
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//Posv�tn� Innosovo oko! Jak to, �e o n�m v�?! Nejsi �lenem na�eho ��du!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//�ekl mi o n�m jeden m�g.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//Netu��m, co t�m zam��lel, kdy� ti sv��il jedno z tajemstv�ch na�eho ��du.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//Ale ur�it� necht�l, abys na n�j pr�v� TY vzt�hl ruku.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Ale...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//U� o tom nechci sly�et!
		if(PLAYER_TALKEDABOUTDRAGONS == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//Nejd��v za�ne� s b�chorkami o drac�ch, a te� tohle - neuv��iteln�!
		};
	};
};


instance DIA_LOTHAR_DRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_dragons_condition;
	information = dia_lothar_dragons_info;
	permanent = FALSE;
	description = "Poslouchej - m�sto ohro�uj� draci!";
};


func int dia_lothar_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_dragons_info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//Poslouchej - m�sto ohro�uj� draci!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//To nen� mo�n�!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//Dal�� ��lenec!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//U� takhle m�me ve m�st� dost nepokoj�. Nepot�ebujeme ��dn�ho troubu, kter� bude d�sit lid pov�da�kami o drac�ch!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//Posledn�ho �lov�ka, kter� si takov�hle v�ci vym��lel, jsem dal okam�it� zav��t a poslat do Hornick�ho �dol� s v�ze�sk�m transportem. Tak�e pozor na jazyk!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//Nepot�ebujeme nikoho, kdo by n�m mezi lidmi ���il paniku!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//Hodn� jsem o tom sly�el. Ale t�ko tomu uv��it.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//Bude lep��, kdy� si to nech� pro sebe. Mus�me p�edej�t tomu, aby se mezi lidem ���il strach a panika.
	};
	PLAYER_TALKEDABOUTDRAGONS = TRUE;
};


instance DIA_ADDON_LOTHAR_ORNAMENT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_addon_lothar_ornament_condition;
	information = dia_addon_lothar_ornament_info;
	description = "V� n�co o kamenech, kter� jsou v kamenn�m kruhu za Lobartovou farmou?";
};


func int dia_addon_lothar_ornament_condition()
{
	if((lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_lothar_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_15_00");	//V� n�co o kamenech, kter� jsou v kamenn�m kruhu za Lobartovou farmou?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_01");	//Jist�, �e ano. Zni�ili jsme je. Znepokojovaly bl�zk� farm��e.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_02");	//Pro� se pt�?
	Info_ClearChoices(dia_addon_lothar_ornament);
	Info_AddChoice(dia_addon_lothar_ornament,"Hled�m kovov� zlomek z kruhov�ho ornamentu.",dia_addon_lothar_ornament_suche);
	Info_AddChoice(dia_addon_lothar_ornament,"Shled�v� to norm�ln�?",dia_addon_lothar_ornament_normal);
};

func void dia_addon_lothar_ornament_normal()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_00");	//Shled�v� to norm�ln�?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_01");	//Mysl� to kamenn� monstrum?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_02");	//Pokud v�m, tak t�m se zab�vaj� m�gov� Vody.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_03");	//Nechci o tom v�d�t v�c. My se zaj�m�me zde o m�sto a o Hornick� �dol�.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//Dobr�.
};

func void dia_addon_lothar_ornament_suche()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_00");	//Hled�m kovov� zlomek z kruhov�ho ornamentu.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_01");	//M�lo by to b�t n�kde u kamenn�ho kruhu bl�zko Lobartovy farmy.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_02");	//Ano, n�co tam bylo. K�men bl�zko n�j. Vzal jsem ho na magick� runy.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_03");	//Dal jsem ho lordu Hagenovi. A nev�m, co s n�m ud�lal on.
};


instance DIA_LOTHAR_WHODRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_whodragons_condition;
	information = dia_lothar_whodragons_info;
	permanent = FALSE;
	description = "N�kdo u� o p��tomnosti drak� mluvil?";
};


func int dia_lothar_whodragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_dragons) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_whodragons_info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//N�kdo u� o p��tomnosti drak� mluvil?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Ano. Ten chlap�k se jmenoval Diego. Alespo� m�m ten pocit.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(v�hr��n�) Varoval jsem ho - zrovna jako tebe! Ale ten bl�zen si nedal pokoj a po��d otravoval!
	};
};


instance DIA_LOTHAR_REGELN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_regeln_condition;
	information = dia_lothar_regeln_info;
	permanent = FALSE;
	description = "Dobr� - vysv�tli mi z�kony m�sta!";
};


func int dia_lothar_regeln_condition()
{
	return TRUE;
};

func void dia_lothar_regeln_info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(s m�rn�m povzdechem) Dobr� - vysv�tli mi z�kony m�sta!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//Za prv�: Ctihodn� paladin lord Hagen bydl� se sv�mi jednotkami v horn� ��sti m�sta.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//Proto tam maj� p��stup pouze ctihodn� ob�an�.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//Za druh�: V radnici v horn� ��sti m�sta je te� velitelstv� paladin�. Maj� do n� p��stup pouze samotn� paladinov� a �lenov� domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//A za t�et�: Ka�d�, kdo je obvin�n� z n�jak�ho zlo�inu, se mus� ospravedlnit p�ed velitelem domobrany.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//N�jak� ot�zky?
	LOTHAR_REGELN = TRUE;
};


instance DIA_ADDON_LOTHAR_MISSINGPEOPLE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_addon_lothar_missingpeople_condition;
	information = dia_addon_lothar_missingpeople_info;
	description = "Obyvatel� m�sta miz�?";
};


func int dia_addon_lothar_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == FALSE) && Npc_KnowsInfo(other,dia_lothar_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_lothar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_MissingPeople_15_00");	//Obyvatel� m�sta miz�?
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_01");	//Ano a zd� se, �e ��m d�l �ast�ji.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_02");	//Je mrzut�, �e domobrana nebyla schopna tuto z�hadu vy�e�it.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_03");	//Je pochopiteln�, �e obyvatel� m�sta jsou velmi ned�v��iv� k cizinc�m.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_04");	//Tak ve m�st� zbyte�n� neupout�vej pozornost s�m na sebe, dobr�?
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
};


instance DIA_LOTHAR_HOWCITIZEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 4;
	condition = dia_lothar_howcitizen_condition;
	information = dia_lothar_howcitizen_info;
	permanent = FALSE;
	description = "Jak se mohu J� st�t ob�anem m�sta?";
};


func int dia_lothar_howcitizen_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_howcitizen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//Jak se mohu J� st�t ob�anem m�sta?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//Za ob�any m�sta jsou pova�ov�ni jen ti, kdo maj� st�l� zam�stn�n�!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//Ale ne�ekl bych, �e by k setk�n� s lordem Hagenem sta�ilo b�t ob�anem m�sta!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//Jako ob�an m� p��stup do horn� ��sti m�sta, nic v�c!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//Na radnici m��e� b�t vpu�t�n jen v p��pad�, �e se stane� �lenem domobrany!
};


instance DIA_LOTHAR_WOARBEIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_lothar_woarbeit_condition;
	information = dia_lothar_woarbeit_info;
	permanent = FALSE;
	description = "Kde bych mohl naj�t pr�ci?";
};


func int dia_lothar_woarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_howcitizen) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_woarbeit_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//Kde bych mohl naj�t pr�ci?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Mus� se p�ihl�sit jako u�edn�k k jednomu z mistr� tady v doln� ��sti m�sta.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//Jakmile t� mistr p�ijme, stane se z tebe ob�an.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//Mus� s t�m ale souhlasit i ostatn� mist�i, tak vel� zvyk tady v Khorinisu.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//Pokud sis pohr�val s my�lenkou, �e najde� n�jakou pr�ci v p��stavu, tak na to zase rychle zapome�!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//�ije tam spodina. Ani tam necho�, nebo toho bude� litovat!
};


instance DIA_LOTHAR_TOOV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 6;
	condition = dia_lothar_toov_condition;
	information = dia_lothar_toov_info;
	permanent = FALSE;
	description = "Jak se dostanu do horn� ��sti m�sta?";
};


func int dia_lothar_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_toov_info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//Jak se dostanu do horn� ��sti m�sta?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//No tak, poslouch� m� v�bec?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//Nejsi ob�anem tohoto m�sta. M��e� si tu zach�zku u�et�it - str�e t� dovnit� nepust�.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//Do cel� t� oblasti za vnit�n� branou m� vstup zak�z�n!
};


instance DIA_LOTHAR_TOMILIZ(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_tomiliz_condition;
	information = dia_lothar_tomiliz_info;
	permanent = FALSE;
	description = "Jak se mohu p�idat k domobran�?";
};


func int dia_lothar_tomiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_tomiliz_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//Jak se mohu p�idat k domobran�?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//Na p��kaz lorda Hagena mohou do domobrany vstoupit jen ob�an� m�sta.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Aha.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//Pokud by ses cht�l dozv�d�t n�co v�c, promluv si v kas�rn�ch s lordem Andrem.
};


instance DIA_LOTHAR_TOPALADINS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_topaladins_condition;
	information = dia_lothar_topaladins_info;
	permanent = FALSE;
	description = "Co mus�m ud�lat, abych m�l takov� brn�n� jako ty?";
};


func int dia_lothar_topaladins_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_tomiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lothar_topaladins_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//Co mus�m ud�lat, abych m�l takov� brn�n� jako ty?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(k�i��) Co�e? V�dy� ani nejsi �lenem domobrany!
	};
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//Nejsi dokonce ani OB�AN!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//Jak t� m��e v�bec napadnout, �e bys mohl nosit brn�n� PALADINA?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//Tuhle �est si vyslou�ilo jen n�kolik m�lo �len� domobrany, a to za sv� neoby�ejn� odv�n� skutky.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(stroze) Pokud by ses cht�l st�t paladinem, m� p�ed sebou hodn� dlouhou cestu, chlap�e!
};


instance DIA_LOTHAR_WOANDRE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 8;
	condition = dia_lothar_woandre_condition;
	information = dia_lothar_woandre_info;
	permanent = FALSE;
	description = "Kde najdu velitele m�stsk� str�e?";
};


func int dia_lothar_woandre_condition()
{
	if((Npc_KnowsInfo(other,dia_lothar_regeln) || Npc_KnowsInfo(other,dia_lothar_message)) && (andre.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_woandre_info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//Kde najdu velitele m�stsk� str�e?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//Lord Andre je v kas�rn�ch na druh�m konci m�sta.
};


instance DIA_LOTHAR_SCHLAFEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 9;
	condition = dia_lothar_schlafen_condition;
	information = dia_lothar_schlafen_info;
	permanent = FALSE;
	description = "Kde bych tu mohl str�vit noc?";
};


func int dia_lothar_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lothar_schlafen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//Kde bych tu mohl str�vit noc?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//Pokud hled� nocleh, jdi do hotelu p��mo naproti kas�rn�m.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//Paladinov� plat� za ubytov�n� v�ech poutn�k�, kte�� do m�sta p�ijdou.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//Najde� zde tak� v�echny potuln� kupce z tr�i�t�.
};


instance DIA_LOTHAR_PERMB4OV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_permb4ov_condition;
	information = dia_lothar_permb4ov_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lothar_permb4ov_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (LOTHAR_REGELN == TRUE))
	{
		return TRUE;
	};
};

func void dia_lothar_permb4ov_info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//O v�em ostatn�m si u� m��e� promluvit s lordem Andrem!
	AI_StopProcessInfos(self);
};

func void b_lothar_blubb()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_00");	//Ale j� se MUS�M setkat s lordem Hagenem!
	AI_Output(self,other,"DIA_Lothar_Add_01_45");	//A jak vid�m, tak t� p�ijal do domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_46");	//Hm - ur�it� v�, co d�l�.
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//Kolik je tady mistr�?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//Mysl�m, �e jich je dohromady p�t.
	AI_Output(self,other,"DIA_Lothar_Add_01_62");	//Hele, ne�ekl jsem to snad dost jasn�? U� ��dn� pov�da�ky o drac�ch!
	AI_Output(other,self,"DIA_Lothar_Add_15_63");	//Jak v�...?
	AI_Output(self,other,"DIA_Lothar_Add_01_64");	//To TOHO ti nic nen�!
	AI_Output(self,other,"DIA_Lothar_Add_01_65");	//To bylo naposledy, rozum�me si?!
	AI_Output(other,self,"DIA_Lothar_Add_15_66");	//Kde najdu velitele domobrany?
	AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Jsem te� u�edn�k jednoho ze zdej��ch mistr�!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//U� zase ty.
	AI_Output(self,other,"DIA_Lothar_Add_01_43");	//Sly�el jsem, �e ses setkal s lordem Andrem?
	AI_Output(self,other,"DIA_Lothar_Add_01_44");	//��kal jsem ti snad, �e k domobran� se m��e� p�idat jen v p��pad�, �e jsi ob�anem m�sta.
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//Ozn�mil jsem lordu Hagenovi, �e s n�m chce� mluvit.
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//A? Co ��kal?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//Nikdy o tob� nesly�el.
	AI_Output(other,self,"DIA_Lothar_Add_15_51");	//Samoz�ejm�, �e ne. �ekl jsi mu o t�ch drac�ch?
	AI_Output(self,other,"DIA_Lothar_Add_01_52");	//Copak jsem ti ne�ekl, abys s t�mi pov�da�kami P�ESTAL?!
	AI_Output(self,other,"DIA_Lothar_Add_01_12");	//Sly�el jsem, �e u� m� souhlas n�kolika mistr�.
	AI_Output(self,other,"DIA_Lothar_Add_01_13");	//Bere� to docela v�n�, co?
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//Mus� dodr�ovat pravidla, stejn� jako kdokoliv jin�!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//Lord Hagen nem� �as.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//Pokud m� na srdci n�co PODSTATN�HO, jdi za lordem Andrem. On ti pom��e!
};


instance DIA_LOTHAR_HELLOAGAIN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_helloagain_condition;
	information = dia_lothar_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_helloagain_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_helloagain_info()
{
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//Aaa! Zase ty!
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//Tak�e se ti nakonec poda�ilo dostat se do horn� ��sti m�sta!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//Kde jsi vzal tu r�bu?
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//Pro�el jsem Zkou�kou ohn�.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//Neuv��iteln�. V tom p��pad� to, co se tu d�je, mus� b�t Innosova v�le.
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_39");	//Nep�idal ses k Onarov�m �old�k�m, �e ne?
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//Jak ses sem dostal?
		AI_Output(other,self,"DIA_Lothar_Add_15_41");	//P�in��m nab�dku p��m��� od Leeho.
		AI_Output(self,other,"DIA_Lothar_Add_01_42");	//Pche! Lord Hagen s t�m nikdy nebude souhlasit.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//Mus� tady db�t na n�kter� v�ci, jinak odsud polet� stejn� rychle, jako ses sem dostal.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//Vstup m� povolen jen do budov obchodn�k�. Pozn� je podle znamen� nade dve�mi - to jen aby nedo�lo k n�jak�m nedorozum�n�m.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//Ostatn� budovy pat�� v�znamn�m ob�an�m - tam nem� co pohled�vat!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//Nic na tom nem�n�, �e te� jsi �lenem Innosova ��du.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//Jako�to �len domobrany m� tak� povolen p��stup do prostor paladin�.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//Svoje ubikace m� ale po��d v kas�rn�ch.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//V t�hle �tvrti �ij� v�znamn� ob�an� m�sta. Chovej se k nim tedy s n�le�itou �ctou.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//Rozum�me si?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Jasn�.
};


instance DIA_LOTHAR_HAGEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_hagen_condition;
	information = dia_lothar_hagen_info;
	permanent = TRUE;
	description = "Kde najdu lorda Hagena?";
};


func int dia_lothar_hagen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_hagen_info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//Kde najdu lorda Hagena?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//Je v radnici, na konci horn� �tvrti.
	AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//Pokud ale nem� dobr� d�vod, tak t� tam stejn� nikdo nepust�.
};


instance DIA_LOTHAR_OWRUNNING(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunning_condition;
	information = dia_lothar_owrunning_info;
	permanent = FALSE;
	description = "Byl jsem si promluvit s lordem Hagenem.";
};


func int dia_lothar_owrunning_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) == 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunning_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//Byl jsem si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//A? Nesna�il ses ho obt�ovat s t�mi b�chorkami o drac�ch, �e ne?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//P�esn� to jsem ud�lal.
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//To snad nem��e b�t pravda...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//Poslal m� sehnat n�jak� d�kazy.
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//V tom p��pad� hodn� �t�st�. (pro sebe) Bl�zne...
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_OWRUNNINGBRIEF(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunningbrief_condition;
	information = dia_lothar_owrunningbrief_info;
	permanent = FALSE;
	description = "M�m d�kaz! Tady je dopis od velitele Garonda!";
};


func int dia_lothar_owrunningbrief_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunningbrief_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//M�m d�kaz! Tady je dopis od velitele Garonda!
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//Tak�e ti draci nejsou v�mysl?
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//K�ivdil jsem ti. Budu se modlit k Innosovi, aby mi odpustil m� chov�n�.
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_PERM(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_perm_condition;
	information = dia_lothar_perm_info;
	permanent = TRUE;
	description = "Stalo se v posledn� dob� n�co zaj�mav�ho?";
};


func int dia_lothar_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_perm_info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//Stalo se v posledn� dob� n�co zaj�mav�ho?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//Ano - �e sem vpustili n�koho jako jsi ty. N�co takov�ho se nestalo u� cel� v�ky.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//Ty bys to m�l v�d�t nejl�p. Jako �len m�stsk� str�e mus� dohl�et na po��dek a dodr�ov�n� z�kona!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Ne.
	};
};


instance DIA_LOTHAR_PICKPOCKET(C_INFO)
{
	npc = pal_203_lothar;
	nr = 900;
	condition = dia_lothar_pickpocket_condition;
	information = dia_lothar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lothar_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_lothar_pickpocket_info()
{
	Info_ClearChoices(dia_lothar_pickpocket);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_BACK,dia_lothar_pickpocket_back);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_PICKPOCKET,dia_lothar_pickpocket_doit);
};

func void dia_lothar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lothar_pickpocket);
};

func void dia_lothar_pickpocket_back()
{
	Info_ClearChoices(dia_lothar_pickpocket);
};

