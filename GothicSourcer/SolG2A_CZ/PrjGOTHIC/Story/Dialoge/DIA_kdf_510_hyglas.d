
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "Po�aduji Zkou�ku ohn�.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Po�aduji Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Zkou�ka ohn� poch�z� ze star�ch �as� a u� velice dlouho j� nikdo nepodstoupil.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//Co po�aduje�, je velice nebezpe�n�. Rad�ji si to je�t� rozmysli.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jsem mistr Hyglas, Str�ce ohn� a Opatrovn�k v�domost�.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Tak�e mistr Parlan ti dal svolen� ke studiu svitk�.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Tud� p�esn� to bys te� m�l d�lat. Studovat, abys ve svat�ch knih�ch na�el osv�cen�.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "Co studuje� ty, mist�e?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Co studuje� ty, mist�e?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//M�j v�zkum se zam��uje na ohe� - Innosovu s�lu.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Je to jeho dar a z�rove� mocn� zbra� - a j� vytv���m runy, kter� obsahuj� jeho moc.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Velmi pou�n�. Mohl bys m� to nau�it?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Je to Innos, kdo d�v� dar magie. Jen jeho slu�ebn�k�m, ohniv�m m�g�m, je p��no vl�dnout jeho moc�.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "Po��dal jsem o Zkou�ku ohn�. Ulthar mi dal za �kol vytvo�it runu ohniv�ho ��pu.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Po��dal jsem o Zkou�ku ohn�. Ulthar mi dal za �kol vytvo�it runu ohniv�ho ��pu.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A te� po mn� chce�, abych t� nau�il p��slu�nou formuli?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Nezn�m nikoho jin�ho, kdo by to dok�zal.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobr�, nau��m t� tu formuli. Ale nejd��v bude� muset naj�t v�echny pot�ebn� ingredience.
	b_logentry(TOPIC_RUNE,"Pokud si obstar�m p��slu�n� ingredience, nau�� m� Hyglas zakl�nadlo pro runu ohniv�ho ��pu.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "Jak� ingredience pot�ebuji na vytvo�en� runy ohniv�ho ��pu?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jak� ingredience pot�ebuji na vytvo�en� runy ohniv�ho ��pu?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//P�e�ti si to - je to tam v t�ch knih�ch.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Nau� m� vytvo�it runu OHNIV�HO ��PU.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Nau� m� vytvo�it runu OHNIV�HO ��PU.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Pokud chce� sestavit runu ohniv�ho ��pu, mus� na runov�m stole spojit s�ru s runov�m kamenem.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//S�la ze svitku s kouzlem ohniv�ho ��pu vplyne do runy a ty z�sk� Innos�v n�stroj.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Tak�e jakmile bude� m�t v�echny pot�ebn� v�ci, p�istup k runov�mu stolu a vytvo� svou runu.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Kde bych mohl naj�t runov� k�men?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Kde bych mohl naj�t runov� k�men?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hele, jsi to ty, kdo po��dal o Zkou�ku ohn�, ne j�. Naj�t jej je sou��st� zkou�ky.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "Vytvo�il jsem tu runu.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Vytvo�il jsem tu runu.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Inu dobr�. Zd� se, �e v t�to ��sti zkou�ky jsi obst�l. Konec konc� to nebylo a� tak t�k�.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Jdi tedy za Utharem a uka� mu sv� d�lo.
	b_logentry(TOPIC_RUNE,"Vytvo�il jsem runu ohniv�ho ��pu.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "U� m�.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//U� m�.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "Co je nov�ho?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, ano. Asi sis u� v�iml t�ch postav s �ern�mi rouchy.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Setkal jsem se s nimi.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//To n�s p�iv�d� k j�dru v�ci. V tuhle chv�li jsme sv�dky velice vz�cn� hv�zdn� konstelace.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Abych byl p�esn�j��, znamen� Vola je v p�esn� korelaci se znamen�m V�le�n�ka. P�edpokl�d�m, �e v�, co to znamen�.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmm. No, abych byl up��mn�...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Ano, dobr�, ch�pu. No, nem��u ti te� vysv�tlovat v�echno, ale ka�dop�dn� to p�edznamen�v� velk� zm�ny. A j� nem�m zm�ny r�d.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Proto chci, abys mi z m�sta p�inesl jednu knihu. Jmenuje se "Posv�tn� moc hv�zd". Mo�n� ji bude� muset chvilku hledat, ale jsem si jist, �e ji nakonec objev�.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Najdi si tu knihu s�m.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"Co z toho budu m�t?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"Uvid�m, jestli se mi ji poda�� naj�t.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Najdi si tu knihu s�m.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak se opova�uje� se mnou mluvit t�mto t�nem? Tvoje chov�n� postr�d� �ctu, kterou mi jsi povinov�n.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//B� mi z o�� a p�em��lej o sv�m chov�n�.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//Co z toho budu m�t?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Co t�m mysl�?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//R�d bych v�d�l, co dostanu za to, kdy� ti tu knihu p�inesu.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. Co bys myslel, �e dostane�? Pokud m� �as d�lat mi ve m�st� posl��ka, je p��mo tvou povinnost� mi pomoci.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Uvid�m, jestli se mi ji poda�� naj�t.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//To je spr�vn� - z�sk�m tak trochu �asu nav�c, abych se mohl poohl�dnout tak� po n��em jin�m.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Ale a� ti to netrv� moc dlouhou. Ob�v�m se, �e nem�me �asu nazbyt.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Hyglas m� po��dal, zda bych mu nena�el knihu 'Bo�sk� moc hv�zd'. Zkus�m se po n� pod�vat u m�stsk�ch obchodn�k�.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "M�m pro tebe tu knihu.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//M�m pro tebe tu knihu.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//V�born�, dej mi ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Tak�e sis to nakonec p�ece jen rozmyslel. Velmi dob�e. Tak kde ji m�?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//M��e� j�t. J� p�jdu studovat.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "U� jsi na n�co p�i�el?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//U� jsi na n�co p�i�el?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//No, nemohu si b�t �pln� jist�, ale zd� se, �e sou�asn� konstelace hv�zd poukazuje na mnoh� nebezpe��.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Co za nebezpe��?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Inu, vypad� to, �e struktura mezi sv�ty je velice slab�. K vytvo�en� d�ry do t�to struktury je te� zapot�eb� jen zlomek s�ly, co obvykle.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Takov�to port�ly pak mohou pou��vat d�moni ke vstupu do na�eho sv�ta, ani� by museli �elit n�jak�mu odporu.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Ne, st�le �ek�m na tu knihu.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//�ekl jsem ti, �e st�le prov�d�m v�zkum, ale samoz�ejm� by mi to trvalo mnohem d�le, kdybych nem�l pot�ebn� materi�l.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

