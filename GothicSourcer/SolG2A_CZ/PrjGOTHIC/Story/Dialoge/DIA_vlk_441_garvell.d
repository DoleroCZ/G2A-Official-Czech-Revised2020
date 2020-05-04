
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(Jeho portmonku by dok�zalo �t�pnout i nemluvn�.)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,itse_goldpocket25,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "Co tady d�l�?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Stav�m lo�, proto�e se chci odsud dostat - co nejrychleji to p�jde.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Ale jak to tak vypad�, tu lo� nikdy nedokon��m.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Pro� tolik posp�ch�?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Pro� tolik posp�ch�?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Co nevid�t doraz� sk�eti a srovnaj� m�sto se zem�.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Pro� si to mysl�?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Hochu, copak jsi nevid�l ty paladiny, co pob�haj v�ude kolem? Pro� si mysl�, ze jsou tady?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//��k�m ti, jsou tady, proto�e sk�eti brzy za�to��. A nebude to nic hezk�ho.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Pro� nem��e� dokon�it lo�?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Pro� nem��e� dokon�it lo�?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(pohrdav�) M�me mili�n probl�m�. Trup je�t� nen� dostate�n� pevn� a po��d n�m je�t� chyb� spousta fo�en.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Ale na nov� materi�l u� nem�m moc zlata, a posledn� dod�vka byla prolezl� �ervoto�em.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moji chlapci nepracujou po��dn�. Jeden chce jen rychlou lo�, a druh� se zaj�m� jen o jej� v�zdobu!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jako kdybychom nem�li d�le�it�j�� v�ci na pr�ci!
	AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//No, jeden z m�ch d�ln�k� ned�vno zmizel. Ob�v�mse,  �e to m��e znamenat zpo�d�n�.
};


instance DIA_ADDON_GARVELL_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 5;
	condition = dia_addon_garvell_missingpeople_condition;
	information = dia_addon_garvell_missingpeople_info;
	description = "Jeden z tv�ch zam�stnanc� zmizel?";
};


func int dia_addon_garvell_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_schiff) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garvell_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//Jeden z tv�ch zam�stnanc� zmizel?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Spr�vn�. Jmenuje se Monty. Slehla se po n�m zem.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//Vsadil bych se, �e ta lin� svin� sed� na n�jak� farm� a u��v� si �ivota. Nem�l jsem mu platit p�edem.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Garvell je znepokojen sv�m d�ln�kem Montym. Ten se od jednoho dne neobjevil v pr�ci. Pr� si dob�e �ije na jedn� z farem.");
	Info_ClearChoices(dia_addon_garvell_missingpeople);
	Info_AddChoice(dia_addon_garvell_missingpeople,"Sly�el jsem, �e zmizelo v�c lid�.",dia_addon_garvell_missingpeople_more);
	if(SCKNOWSFARIMASWILLIAMSFRIEND == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"Kdy tu byl Monty naposled.",dia_addon_garvell_missingpeople_wo);
	};
};

func void dia_addon_garvell_missingpeople_more()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//Sly�el jsem, �e u� zmizelo v�c lid�.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//Vi�? T�m tenhle v�echen zmatek za�al.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Ryb�� Farim se zmi�oval o n��em takov�m. Jeho k�mo� William zjevn� zmizel.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//Vsadil bych se, �e zat�m v��m jsou sk�eti.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Vypad� to, �e ryb�� Farim v� n�co o u�ite�n�ho o sv�m p��teli Williamovi.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_AddChoice(dia_addon_garvell_missingpeople,DIALOG_BACK,dia_addon_garvell_missingpeople_back);
	if(farim.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"Kde m��u naj�t Farima?",dia_addon_garvell_missingpeople_farim);
	};
};

func void dia_addon_garvell_missingpeople_back()
{
	Info_ClearChoices(dia_addon_garvell_missingpeople);
};

func void dia_addon_garvell_missingpeople_farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Kde m��u naj�t Farima?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//Je to ryb��. Mysl�m, �e jeho chatr� je n�kde pobl� skladi�t� paladin�. Nejsem si jist.
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Farim's cottage is near the paladins' store yard.");
};

func void dia_addon_garvell_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//Kdy tu byl Monty naposled?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(na�tvan�) Nep�i�el do pr�ce u� dva dny.
};


instance DIA_GARVELL_RETURNMONTY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_returnmonty_condition;
	information = dia_garvell_returnmonty_info;
	description = "A jak to jde te�?";
};


func int dia_garvell_returnmonty_condition()
{
	if((Npc_GetDistToWP(monty_nw,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_returnmonty_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//A jak to jde te�?
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Monty je zp�tky! Zrovna se d�v� na pl�ny.
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Mo�n� nakonec tu lo� p�ece jen dokon��me.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "M��u ti n�jak pomoct?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//M��u ti n�jak pomoct?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//To m��e�. Zjisti, co maj� paladinov� za lubem. Zaj�malo by m�, pro� jsou tady.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//A taky bych m�l v�d�t, jestli se sk�eti chystaj� za�to�it - a jak daleko od m�sta jsou.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jednoho z t�ch bastard� vid�li hned za m�stem.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Prost� mi dones tolik informac�, kolik se ti poda�� z�skat.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Pot�ebuju v�d�t, kolik �asu m�m na dokon�en� lodi.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Garvell by r�d z�skal n�jak� informace o sk�etech a tak� by ho zaj�malo, pro� se ve m�st� usadili paladinov�.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dob�e. Jestli zjist� n�co dal��ho, dej mi v�d�t.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//D�ky za informace. Takhle to vypad�, �e na postaven� lodi m�me celou v��nost.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "M�m n�jak� informace o sk�etech.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//M�m n�jak� informace o sk�etech.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Tak pov�dej.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Zasekli se v Hornick�m �dol� a vypad� to, �e tam cht�j� z�stat.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Aby n�s udr�eli v bezpe��, hl�daj� paladinov� pr�smyk do �dol�.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "V�m, pro� tu paladinov� jsou.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//V�m, pro� tu paladinov� jsou.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//V�n�? �ekni mi to!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladinov� jsou tu, aby z�skali magickou rudu z Hornick�ho �dol�, ne proto, �e by o�ek�vali sk�et� �tok na m�sto.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Jakmile dostanou rudu, vr�t� se na pevninu.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "A ten sk�et za m�stem...";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//A ten sk�et za m�stem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Anooo...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Ned�lej si s n�m starosti. M�stsk� str� to s n�m vy��d�.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "Jak to jde v p��stavu?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Jak to jde v p��stavu?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Sk�eti n�m jdou po krku a ty se pt� na p��stav?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Jen jsem cht�l...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//N� nejv�t�� probl�m je v tom, �e nem�me dost lod�, abychom se odsud mohli dostat.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Vlastn� je tu jen jedna lo�, a ta pat�� paladin�m. Ur�it� ji tu nemaj� proto, aby n�s na n� odsud dostali.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Jen se pod�vej s�m, nic se tu ned�je.
	};
};

