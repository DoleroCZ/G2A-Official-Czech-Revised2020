
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Pod�vejme, koho tady m�me. Velk� zast�nce pr�va. Fajn, hrdino, copak tu pohled�v�me?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Hled�m p�r odpov�d�.
	if(RANGER_SCKNOWSDEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Ne�ekal jsem, �e sem vleze� dobrovoln�.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to m� znamenat?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To zanemen�, �e jsem vypsal odm�nu na tvou hlavu. Je�t� jsi nevyd�l ty plak�ty?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Je na nich TV�J obli�ej. Ano ... jsi hledan� mu�. Nev� o tom?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//N�KDO dal do ob�hu pap�ry s moj� tv���. N�KDO mi �ekl, �es to byl ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//N�KDO moc mluvil.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//M� ale pravdu. St�hl jsem je. A co se nestalo? P�i�el jsi s�m.
		MIS_STECKBRIEFE = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Co ode m� chce�?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//J�? Nic. Ale m�j ��f t� chce ��len� vid�t mrtv�ho.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//To je to, pro� jsem t� m�l naj�t a p�in�st mu tvoji hlavu.
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Nev���m ti ani slovo.";
};


func int dia_dexter_glaube_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nev���m ti ani slovo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hele, je to pravda. P��sah�m na hrob sv� matky!
};


instance DIA_ADDON_DEXTER_PATRICK(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_patrick_condition;
	information = dia_addon_dexter_patrick_info;
	description = "Byl tady vid�n �old�k jm�nem Patrick.";
};


func int dia_addon_dexter_patrick_condition()
{
	if((MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_patrick_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Byl tady vid�n �old�k jm�nem Patrick.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrik? Eh? Nikdy jsem o n�m nesly�el.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//Pamatuju se na �old�ka, kter� byl zvykl� si to n�kdy rozdat s m�mi lidmi.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//(n�padn� l�e) A�koli jsem ho posledn� dobou nevid�l.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//(zlomysln�) Mo�n� ho chlapci pov�sili. T�ko ��ct.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Dexter tvrd�, �e o �old�kovi Patrickovi nic nev�.");
	DEXTER_KNOWSPATRICK = TRUE;
	b_giveplayerxp(XP_ADDON_DEXTER_KNOWSPATRICK);
};


instance DIA_ADDON_DEXTER_GREG(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_addon_dexter_greg_condition;
	information = dia_addon_dexter_greg_info;
	description = "Je tady n�jak� chlap se z�platou na oku. Hled� T�.";
};


func int dia_addon_dexter_greg_condition()
{
	if((SC_KNOWSGREGSSEARCHSDEXTER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Je tady n�jak� chlap se z�platou na oku. Hled� T�.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Vypad� to, �e m� v�ichni hledaj�. Nestar�m se o to.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jestli ten chap n�co pot�ebuje, m� p�ij�t sem.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_DEXTER_MISSINGPEOPLE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_missingpeople_condition;
	information = dia_addon_dexter_missingpeople_info;
	description = "Bylo mi �e�eno, �e un�� lidi z Khorinisu.";
};


func int dia_addon_dexter_missingpeople_condition()
{
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Bylo mi �e�eno, �e un�� lidi z Khorinisu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Tak�e jsi to nakonec zjistil. Dobr� pr�ce, gratuluji.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//Mysl�m, �e budu muset sv� stopy zahlazovat l�pe.
	Info_ClearChoices(dia_addon_dexter_missingpeople);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kdo ti dal ten p��kaz?",dia_addon_dexter_missingpeople_wer);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kde ti lid� kon��? Tady okolo dol�?",dia_addon_dexter_missingpeople_wo);
};

func void dia_addon_dexter_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Kde ti lid� kon��? Tady okolo dol�?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(sm�je se) Skon�� daleko. Za horami na severo-v�chod� a z tv�ho dosahu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Mohl bych ti uk�zat, kde p�esn�, ale nev�m pro� bych m�l.
};

func void dia_addon_dexter_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kdo ti dal ten p��kaz?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//M�j ��f. Nebezpe�n� �lov�k. Ty ho zn�. Je to Raven, jeden z trestaneck�ch rudn�ch baron�, ze Star�ho t�bora v Hornick�m �dol�.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Pot�ebuje je pro sv�j pl�n. To je v�e, co pot�ebuje� v�d�t.
	Info_AddChoice(dia_addon_dexter_missingpeople,"Raven nebezpe�n�? No ...",dia_addon_dexter_missingpeople_raven);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Rudn� baron tady v Khorinisu?",dia_addon_dexter_missingpeople_raventot);
};

func void dia_addon_dexter_missingpeople_raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Raven nebezpe�n�? No ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(popuzen�) CO si mysl�, �e v�? Nezn� ho tak jako j�.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(rozru�en�) Byl to blb, ale te� ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Od t� doby, co padla bari�ra, se zm�nil. Jeho tv�� je zata�en� �ern�m st�nem.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(vystra�en�) Jeho pohled tebou pronikne, jako dr�p dravce, kdy� mu bude� hled�t do o�� moc dlouho.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//M��u ti jen poradit, abys opustil Khorinis co nejrychleji, dokud m� je�t� �as, proto�e za chv�li u� bude p��li� pozd�.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(skl��en�) Tady t� nic ne�ek�, jenom jist� smrt.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Dexter m� ��fa. Jmenuje se Raven. Raven je trestaneck� rudn� baron. Nakonec to vypad�, �e Raven je ten, kdo stoj� za t�mi �nosy. V�echno co pot�ebuju je d�kaz.");
	Info_ClearChoices(dia_addon_dexter_missingpeople);
};

func void dia_addon_dexter_missingpeople_raventot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Rudn� baron tady v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//U� nen� rudn� baron. Te� m� sv� vlastn� pl�ny, a Khorinis brzy zjist� dost.
};


instance DIA_ADDON_DEXTER_BOSS(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_addon_dexter_boss_condition;
	information = dia_addon_dexter_boss_info;
	description = "Tv�j ��f? Kdo to m��e b�t?";
};


func int dia_addon_dexter_boss_condition()
{
	if((KNOWS_DEXTER == TRUE) && (SC_KNOWSDEXTERASKIDNAPPER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_boss_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Tv�j ��f? Kdo to m��e b�t?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(sm�je se) R�d bys to v�d�l, co? Ano, um�m si to p�edstavit.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(v�n�) Nem��u uva�ovat o dvoj�m �e�en�, tak pro� bych ti to m�l ��kat.
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "A co m� te� v �myslu? Zab�t m�?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_dexter_missingpeople))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//A co m� te� v �myslu? Zab�t m�?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Jo. Ale tys n�s odtamtud v�echny dostal. Proto ti taky d�m je�t� jednu �anci. Zmizni, vypa� se, ud�lej se neviditeln�m. Jdi a u� se mi nikdy nep�iple� do cesty.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Mus�m zjistit, kde jsou zajat� lid�.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(sm�je se) Jo. M��e� to zkusit ze m� vyt��skat.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(v�hru�n�) Bude lep��, kdy� odejde�.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Kdy� t� tu je�t� n�kdy uvid�m, bez rozpak� t� zabiju.
	DEXTER_NOMORESMALLTALK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((DEXTER_NOMORESMALLTALK == TRUE) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//(�to�n�) Kdy� je to tak, jak si p�eje� ...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ach jo, chlape. Ud�lal bys l�p, kdyby ses tu neukazoval. Jsi ve �patnou chv�li na �patnym m�st�.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	b_greg_comestodexter();
	Info_ClearChoices(dia_dexter_kill);
	Info_AddChoice(dia_dexter_kill,DIALOG_ENDE,dia_dexter_kill_ende);
};

func void dia_dexter_kill_ende()
{
	var C_ITEM itm;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	itm = Npc_GetEquippedArmor(greg_nw);
	if(Hlp_IsItem(itm,itar_pir_h_addon) == FALSE)
	{
		AI_EquipArmor(greg_nw,itar_pir_h_addon);
	};
};


instance DIA_DEXTER_KOPF(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_kopf_condition;
	information = dia_dexter_kopf_info;
	permanent = FALSE;
	description = "Chce� moji hlavu? Poj� si pro ni!";
};


func int dia_dexter_kopf_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_hallo))
	{
		return TRUE;
	};
};

func void dia_dexter_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chce� moji hlavu? Poj� si pro ni!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//(�to�n�) Jak si p�eje�.
	dia_dexter_kill_ende();
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

