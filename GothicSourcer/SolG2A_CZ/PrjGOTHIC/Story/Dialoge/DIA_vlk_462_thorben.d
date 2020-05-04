
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Zavra�dil jsi moji Grittu. To ti nikdy neodpust�m. B� mi z o��, vrahu!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//�! Nov� tv��. Ty nejsi z Khorinisu, co?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Tohle nen� ta spr�vn� doba pro poutn�ky. V�ude sam� banditi, ��dn� pr�ce a te� si je�t� za�ali vyskakovat roln�ci.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Co t� sem p�iv�d�?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "Hled�m pr�ci.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Hled�m pr�ci.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//V� n�co o truhla�in�?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Jedin�, co dok�u ze d�eva ud�lat, je ohe�.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//A co z�mky?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Noooo...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Je mi l�to, ale pokud o m�m �emesle nic nev�, nem��u t� pot�ebovat.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//A nem�m pen�ze na to, abych si platil u�edn�ka.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Thorben mne nep�ijme do u�en�.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "Co kdybych cht�l za��t jako u�edn�k u jednoho z ostatn�ch mistr�?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//Co kdybych cht�l za��t jako u�edn�k u jednoho z ostatn�ch mistr�?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Dobr�, d�m ti sv� doporu�en�.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Ale nejd��v bys m�l rad�ji z�skat po�ehn�n� od boh�.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//�ekni, jsi zbo�n� mu�?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"No, kdy� mysl�, �e bych se m�l modlit pravideln� ...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Ano. Nejpokorn�j�� slu�ebn�k, mist�e Thorbne.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Tak to jdi za Vatrasem, Adanov�m kn�zem, a nech se od n�j po�ehnat.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//On u� ti �ekne, kde naj�t Innosovy kn�ze. Taky od n�j m��e� dostat po�ehn�n�.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Jakmile z�sk� po�ehn�n�, m� m�j souhlas.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Thorben se za m� p�imluv� teprve tehdy, a� si vypros�m po�ehn�n� od Adanova a Innosova kn�ze.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Ano. Nejpokorn�j�� slu�ebn�k, mist�e Thorbene.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//No, kdy� mysl�, �e bych se m�l modlit pravideln�...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//J� si to nemysl�m. V�m to!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//�lov�k, co sv�j obchod nezasyp�v� modlitbami, nikdy nez�sk� m�j souhlas.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Pros bohy za shov�vavost nad tv�mi h��chy.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "Tak jak s t�m doporu�en�m, mist�e?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Tak jak s t�m doporu�en�m, mist�e?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Po�ehnal ti Vatras?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Ano.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//A z�skal jsi tak� po�ehn�n� Innose?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Ano, z�skal.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//V tom p��pad� m� i m� po�ehn�n�. Nez�le�� na tom, jakou cestu sis vybral - bu� hrd� na svou pr�ci, chlap�e!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Budu-li k n�komu cht�t vstoupit do u�en�, Thorben se za m� p�imluv�.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Ne. Je�t� ne.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Zn� moje podm�nky. Sv�m z�le�itostem se m��e� v�novat jen s po�ehn�n�m boh�.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Je�t� ne...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//V tom p��pad� nev�m, pro� se m� znovu pt�. Zn� moje podm�nky.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "Tak ty se vyzn� v z�mc�ch?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Tak ty se vyzn� v z�mc�ch?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Co by to bylo za po��dnou truhlu bez dobr�ho z�mku?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Vyr�b�m si sv� vlastn� z�mky. Takhle si m��u b�t p�inejmen��m jist�, �e jsem neud�lal bytelnou truhlu jen tak pro nic za nic.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Odbyt� z�mek se d� snadno zlomit. A tady v Khorinisu se v�ude kolem potuluje spousta zlod�j�. Zvl�t� posledn� dobou!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "M�m tady Lehmarovu ��etn� knihu.";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//M�m tady Lehmarovu ��etn� knihu.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(podez�rav�) Jak ses k tomu dostal?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Sp� by t� m�lo zaj�mat, �e je v n� tv� jm�no.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Dej to sem!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//A co mi za to d�?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//Nem�m pen�ze nazbyt a nem��u ti d�t nic jin�ho ne� m� srde�n� pod�kov�n�.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "M��e� m� nau�it, jak p��it z�mky?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//M��e� m� nau�it, jak p��it z�mky?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Kdyby nebylo tebe, budu Lehmarovi platit po cel� zbytek sv�ho �ivota.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Nau��m t�, co bude� cht�t.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//P�inesl jsi mi 100 zlat�ch. To od tebe bylo velmi mil�.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//P�iv�d� m� to do rozpak�, ale mus�m t� po��dat je�t� o jednu laskavost.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Jeliko� v dohledn� dob� nem��u Lehmarovi sv�j dluh splatit, chyst� se na m� poslat ty sv� gorily.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Dej mi je�t� dal��ch 100 zlat�ch a j� t� za�nu u�it.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Mo�n� pozd�ji...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobr�. Tady je 100 zlat�ch.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Zaplatil jsi Grittin dluh u Mattea. Vypad� jako spr�vn� chlap. Nau��m t�, co bude� cht�t.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Nicm�n�, nem��u to d�lat zadarmo. Je�t� po��d m�m f�ru dluh� a pot�ebuju pen�ze.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Kolik?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 zlat�ch.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Mo�n� pozd�ji ...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobr�. Tady je 200 zlat�ch.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmm... nev�m, jestli se ti d� v��it, nebo ne.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Podle toho, co v�m, m��e� klidn� b�t jedn�m z t�ch darmo�lap�, co p�i�li do m�sta jen proto, aby vypr�zdnili truhlice bohat�ch lid�.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Nebudu t� u�it nic, dokud se nep�esv�d��m, �e jsi dobr� �lov�k.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Dobr�. Tady je 200 zlat�ch.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Tyhle pen�ze by mi m�ly pomoct. M��eme za��t hned, jak bude� p�ipraven.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//Je�t� po��d ti do 200 zlat�ch p�r minc� chyb�. Ty pen�ze pot�ebuju.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Dobr�. Tady je 100 zlat�ch.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//V tom p��pad� m��eme za��t hned, jak bude� p�ipraven.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Hej, je�t� po��d ti do 100 zlat�ch chyb� p�r minc�.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Mo�n� pozd�ji.
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nau� m� p��it z�mky!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Nau� m� p��it z�mky!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Pot�ebuje� akor�t n�jak� �perh�k. Pokud j�m bude� v z�mku opatrn� ot��et doprava a doleva, m��e� mechanismus otev��t.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Ale pokud oto�� p��li� rychle nebo moc siln� ve �patn�m sm�ru, �perh�k se zlom�.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//��m bude� obratn�j��, t�m m�n� bude� pot�ebovat �perh�k�. To je v�echno, opravdu.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "M��e� mi prodat n�jak� �perh�ky?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//M��e� mi prodat n�jak� �perh�ky?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Pokud mi je�t� n�jak� zbyly...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//No tak dobr�. Ale dokud nev�, jak s nimi zach�zet, tak ti nebudou k ni�emu.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Tesa� Thorben prod�v� �perh�ky.");
};


instance DIA_ADDON_THORBEN_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_addon_thorben_missingpeople_condition;
	information = dia_addon_thorben_missingpeople_info;
	description = "A m�l si n�kdy u�n�?";
};


func int dia_addon_thorben_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ELVRICH_GOESBACK2THORBEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//A m�l si n�kdy u�n�?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Ano, neni to d�vno.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Jmenoval se Elvrich. Je to m�j synovec.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Ale jednoho dne prost� nep�i�el. A to jsem byl s jeho prac� docela spokojen�.
	MIS_THORBEN_BRINGELVRICHBACK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich, u�e� tesa�e Thorbena, zmizel.");
	Info_ClearChoices(dia_addon_thorben_missingpeople);
	Info_AddChoice(dia_addon_thorben_missingpeople,DIALOG_BACK,dia_addon_thorben_missingpeople_back);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Ozn�mil jsi to domobran�?",dia_addon_thorben_missingpeople_mil);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Jak je to dlouho, co jsi ho vid�l naposledy?",dia_addon_thorben_missingpeople_wann);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Kde je Elvrich te�?",dia_addon_thorben_missingpeople_where);
};

func void dia_addon_thorben_missingpeople_back()
{
	Info_ClearChoices(dia_addon_thorben_missingpeople);
};

func void dia_addon_thorben_missingpeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Jak je to dlouho, co jsi ho vid�l naposledy?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Mus� to b�t tak 2 t�dny.
};

func void dia_addon_thorben_missingpeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Kde je Elvrich te�?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//Jak to m�m v�d�t? St�le se poflakoval okolo �pinav�ho bordelu v p��stavn� �tvrti.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//V�bec by m� nep�ekvapilo, kdyby tam tr�vil cel� dny s n�jakou d�vkou.
};

func void dia_addon_thorben_missingpeople_mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Ozn�mil jsi to domobran�?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Ano, jist�. ��klali, �e ho chyt� a postaraj� se, aby se jeho l�n� prdel vr�tila do pr�ce. Mrzelo m� to ud�lat.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//Ah dob�e, m��e m�t kter�koliv po�adavky. D��ve nebo pozd�ji uvid�, �e nem��e d�lat nic v Khorinisu bez n�jak� �estn� pr�ce.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(cynicky) Opravdu.
};


instance DIA_ADDON_THORBEN_ELVRICHISBACK(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichisback_condition;
	information = dia_addon_thorben_elvrichisback_info;
	description = "Nyn�, kdy� se Elvrich vr�t�l, pro tebe m��e znovu pracovat.";
};


func int dia_addon_thorben_elvrichisback_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (Npc_IsDead(elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichisback_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Nyn�, kdy� se Elvrich vr�t�l, pro tebe m��e znovu pracovat.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mohu jenom doufat, �e neute�e znovu s dal�� mo�nou �enou.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Tady, vem si tohle zlato jako odm�nu za p�iveden� m�ho u�n�.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	MIS_THORBEN_BRINGELVRICHBACK = LOG_SUCCESS;
	vlk_4302_addon_elvrich.flags = 0;
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "Co v� o paladinech?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Co v� o paladinech?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Nic moc. P�ed dv�ma t�dny sem na lodi p�ipluli z pevniny.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Od t� doby jsou zav�en� v horn� ��sti m�sta.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nikdo tady po��dn� nev�, pro� vlastn� p�ijeli.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Hodn� lid� se ob�v� �toku sk�et�.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//Ale j� si stejn� mysl�m, �e jsou tu kv�li rolnick� vzpou�e.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "V� n�co o t� rolnick� vzpou�e?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//V� n�co o t� rolnick� vzpou�e?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Pov�d� se, �e si velkostatk�� Onar najal �oldn��e, aby ho chr�nili p�ed kr�lovsk�mi vojsky.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Asi u� m�l dost toho, �e mu paladinov� a domobrana po��d berou �rodu a dobytek.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Jedin�, co jsme tady ve m�st� zaznamenali, je neust�l� zvy�ov�n� cen potravin.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Onarova farma odsud le�� daleko na v�chod�. Nev�me, jestli se tam k n��emu chyst�.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Pokud se chce� dozv�d�t v�c, zeptej se kupc� na tr�i�ti. Maj� o ostrov� v�t�� p�ehled ne� j�.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "P�i�el jsem kv�li Gritt�.";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//P�i�el jsem kv�li Gritt�.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//M� nete�i? O co jde? Nen� to nic s pen�zi, �e ne?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Dlu�� 100 zlat�ch kupci Matteovi.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//�ekni, �e to nen� pravda. Od t� doby, co se ke mn� ta mal� leno�ka nast�hovala, m�m jen sam� pot�e!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//M� dluh snad u ka�d�ho kupce ve m�st�.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Musel jsem si p�j�it 200 zlat�ch u lichv��e jen proto, abych vyrovnal jej� dluhy. A te� tohle!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta by m�la b�t v dom�.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Jdi d�l, jen se j� zeptej. Ale m��u ti ��ct jedno: nem� ani zlatku.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Uvid�me...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "Tv� nete� mi dala 100 zlat�ch.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 100) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Tv� nete� mi dala 100 zlat�ch.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//CO? Ta mal� nestydat� zmije - to bylo MOJE zlato! Vzala ho z m� truhly.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Vra� mi to! Mus�m nejd��v zaplatit Lehmarovi. Matteo dostane sv� pen�ze pozd�ji!
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"U� jsem dal Matteovi jeho zlato!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Ne. Ty pen�ze jsou Matteovy.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Tady je zlato.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//A co v�m o t� mal� zmyji, jsem si jist, �e b�ela p��mo za m�stskou str��, aby t� taky obvinila!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Dohl�dnu na to, aby se to n�jak vy�e�ilo.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//U� jsem dal Matteovi jeho zlato!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Sakra! Dobr� - dluh je dluh. Alespo�, �e sis ty pen�ze nenechal. Asi bych ti za to m�l pod�kovat.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Ne. Ty pen�ze jsou Matteovy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Takhle m� dostane� do po��dn�ch trabl�. Lehmar nen� zrovna p�ehnan� shov�vav�, kdy� p�ijde �e� na dluhy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Ale p�inejmen��m se chyst� splatit dluh m� nete�e. Asi bych ti za to m�l pod�kovat.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Tady je zlato.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//D�ky! Kone�n� m�m alespo� ��st pen�z, co dlu��m Lehmarovi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Nem��u uv��it tomu, �e m�la tu drzost vz�t m� zlato!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

