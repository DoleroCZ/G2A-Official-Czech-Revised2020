
instance DIA_ORIC_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_exit_condition;
	information = dia_oric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_HALLO(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_hallo_condition;
	information = dia_oric_hallo_info;
	permanent = FALSE;
	description = "Co m� za �kol?";
};


func int dia_oric_hallo_condition()
{
	return TRUE;
};

func void dia_oric_hallo_info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//Co m� za �kol?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//Jsem kr�lovsk� d�stojn�k pro strategick� z�le�itosti a moment�ln� podl�h�m velen� ctihodn�ho velitele Garonda.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//Jsme posledn� paladinov� tady na hrad�. V�ichni ostatn� ode�li nebo padli.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//Na na�ich bedrech te� spo��v� �sp�ch cel� v�pravy. A my se o to postar�me. U Innose - postar�me se o to.
};


instance DIA_ORIC_BRUDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_bruder_condition;
	information = dia_oric_bruder_info;
	permanent = FALSE;
	description = "M�m pro tebe zpr�vu.";
};


func int dia_oric_bruder_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_bruder_info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//M�m pro tebe zpr�vu.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//Co je?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Tv�j bratr zem�el. Dostal se a� do pr�smyku.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(�ept�)... m�j bratr...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Innos m� krut� zkou��. Ale zem�el jako jeho slu�ebn�k...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//Tahle zpr�va je jako ��p, kter� se mi zabod�v� do srdce. Budu hledat novou s�lu v modlitb�ch.
	ORICBRUDER = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORIC_SCOUTMINE(C_INFO)
{
	npc = pal_251_oric;
	nr = 1;
	condition = dia_oric_scoutmine_condition;
	information = dia_oric_scoutmine_info;
	permanent = FALSE;
	description = "M�m se vydat k dol�m.";
};


func int dia_oric_scoutmine_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL < 3) && Npc_KnowsInfo(other,dia_oric_hallo) && (FAJETH_ORE == FALSE) && (MARCOS_ORE == FALSE) && (SILVESTRO_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_scoutmine_info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//M�m se vydat k dol�m.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//Dej si pozor, nebude to ��dn� hra�ka. Nejd��ve ze v�eho vyhledej paladiny. Oni vedou ty t�i skupiny.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//Pokud bys o tom cht�l v�d�t v�c, promluv si s Parcivalem.
};


instance DIA_ORIC_PERM(C_INFO)
{
	npc = pal_251_oric;
	nr = 99;
	condition = dia_oric_perm_condition;
	information = dia_oric_perm_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_oric_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_oric_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_oric_perm_info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//Jak to vypad�?
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//Mus� naj�t v�echny horn�ky a nav�c i jejich rudu. Potom zkus�me p�ij�t na zp�sob, jak tohle �dol� opustit.
	}
	else if(MIS_SCOUTMINE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//Nad�je v�pravy klesly na �pln� dno. Ale nevzd�me to, proto�e Innos je s n�mi. Vyvede n�s bezpe�n� z �dol�.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//Tv�j p��chod je pro n�s znamen�m nad�je.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//Pot�ebujeme t�. B� si promluvit s Garondem - on ti v�echno vysv�tl�.
	};
};


instance DIA_ORIC_KAP3_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap3_exit_condition;
	information = dia_oric_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_oric_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP4_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap4_exit_condition;
	information = dia_oric_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_oric_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_IAMBACK(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_iamback_condition;
	information = dia_oric_iamback_info;
	description = "U� jsem zp�t.";
};


func int dia_oric_iamback_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_iamback_info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//U� jsem zp�t.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//Nikdy bych ne�ekl, �e t� tu je�t� uvid�m - ne potom, �eho jsem byl sv�dkem, kdy� jsi tu byl p�ed n�kolika dny.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//V�t�m t� jm�nem na�eho ��du.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//Vid�m, �e se z tebe stal m�g. M� m� uzn�n�.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//K� by byl tv�j p��chod dobr�m znamen�m.
};


instance DIA_ORIC_CANHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_canhelp_condition;
	information = dia_oric_canhelp_info;
	description = "Mohu n�jak pomoci?";
};


func int dia_oric_canhelp_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_canhelp_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Mohu n�jak pomoci?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//Moment�ln� se zd�, �e jsme ud�lali v�echno, co bylo v na�ich sil�ch.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//Ale p�esto je tady jedna v�c. N�co velice d�le�it�ho, co bys pro n�s mohl ud�lat vn� t�chto zd�.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//Chceme useknout hadovi jeho hlavu.
	Info_ClearChoices(dia_oric_canhelp);
	Info_AddChoice(dia_oric_canhelp,"Mysl�m, �e byste si m�li naj�t n�koho jin�ho.",dia_oric_canhelp_notyourman);
	Info_AddChoice(dia_oric_canhelp,"Co t�m mysl�?",dia_oric_canhelp_whatyoumean);
};

func void dia_oric_canhelp_notyourman()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//Mysl�m, �e byste si m�li naj�t n�koho jin�ho.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//Nem��u postr�dat jedin�ho ze sv�ch lid� - jsi na�e jedin� nad�je.
};

func void dia_oric_canhelp_whatyoumean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//Co t�m mysl�?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//V�me o jednom z jejich v�dc�. Jmenuje se Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//Je to jeden z nejvlivn�j��ch �aman� mezi sk�ety.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//A co m�m ud�lat?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Zabij ho.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//�ertuje�!?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//Jsi jedin�, koho m��eme postr�dat. V�echny ostatn� ryt��e pot�ebujeme tady.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//Nen� pro m� snadn� cht�t po tob� n�co takov�ho, mist�e. Ale jsi pro tenhle �kol nejvhodn�j�� ze v�ech.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//Chce� n�m p�ece pomoci, ne? V tom p��pad�...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Hosh-Pak�v stan je za nep��telskou lini�, na ostrohu na jih odsud.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//Skoro ho m��e� vid�t z okna.
	Info_ClearChoices(dia_oric_canhelp);
	ORIKTOLDMISSIONCHAPTER4 = TRUE;
};


instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
	npc = pal_251_oric;
	nr = 6;
	condition = dia_oric_needstuff_condition;
	information = dia_oric_needstuff_info;
	description = "Budu pot�ebovat p�r v�c�.";
};


func int dia_oric_needstuff_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_needstuff_info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//Budu pot�ebovat p�r v�c�.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//U� toho nem�me moc, co bychom ti mohli d�t.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//No, ale mohu ti nab�dnout toto.
	Info_ClearChoices(dia_oric_needstuff);
	Info_AddChoice(dia_oric_needstuff,"1 elix�r obratnosti",dia_oric_needstuff_dexterity);
	Info_AddChoice(dia_oric_needstuff,"1 elix�r s�ly",dia_oric_needstuff_strength);
	Info_AddChoice(dia_oric_needstuff,"3 elix�ry many",dia_oric_needstuff_mana);
	Info_AddChoice(dia_oric_needstuff,"3 elix�ry hojiv� s�ly",dia_oric_needstuff_health);
};

func void dia_oric_needstuff_health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//Vezmu si ty l��iv� lektvary.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//Dobr� volba. A� ti jsou k u�itku.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//Vezmu si ty lektvary s manou.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//Douf�m, �e ti pomohou. Nech� t� Innos ochra�uje.
	CreateInvItems(self,itpo_mana_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//Vezmu si elix�r s�ly.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Tady je, ur�it� se ti bude hodit. P�eji ti hodn� �t�st�.
	CreateInvItems(self,itpo_perm_str,1);
	b_giveinvitems(self,other,itpo_perm_str,1);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//Vezmu si elix�r obratnosti.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//Nech� tvoje ��py nikdy neminou c�l. Tady ho m�.
	CreateInvItems(self,itpo_perm_dex,1);
	b_giveinvitems(self,other,itpo_perm_dex,1);
	Info_ClearChoices(dia_oric_needstuff);
};


instance DIA_ORIC_NOMURDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 7;
	condition = dia_oric_nomurder_condition;
	information = dia_oric_nomurder_info;
	description = "Nezavra�d�m Hosh-Paka tak zbab�l�m zp�sobem.";
};


func int dia_oric_nomurder_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_nomurder_info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//Nezavra�d�m Hosh-Paka tak zbab�l�m zp�sobem.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Dok�e� si v�bec p�edstavit, v jak stra�n� pozici se nach�z�me?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//Obl�h� n�s obrovsk� arm�da sk�et�. Doch�zej� n�m z�soby.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//Pokud se n�m nepoda�� dostat rudu na lo�, zpusto�� sk�eti cel� kr�lovstv�.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//V�echno bude zni�eno.
};


instance DIA_ORIC_WILLHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 5;
	condition = dia_oric_willhelp_condition;
	information = dia_oric_willhelp_info;
	permanent = FALSE;
	description = "Dobr�. Zabiju Hosh-Paka.";
};


func int dia_oric_willhelp_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_willhelp_info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//Dobr�. Zabiju Hosh-Paka.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//To r�d sly��m.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Hosh-Pak�v stan je na mal�m ostrohu. U� jsi ho musel vid�t.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//Nen� daleko od cesty vedouc� k na�emu dolu. P��mo ve st�nu t� velk� hory.
	Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
	b_logentry(TOPIC_KILLHOSHPAK,"Oric chce, abych odstranil sk�et�ho �amana Hosh-Paka. Jeho stan najdu na mal�m �tesu kousek za hradem.");
	MIS_KILLHOSHPAK = LOG_RUNNING;
};


instance DIA_ORIC_HOSHDEAD(C_INFO)
{
	npc = pal_251_oric;
	nr = 8;
	condition = dia_oric_hoshdead_condition;
	information = dia_oric_hoshdead_info;
	permanent = FALSE;
	description = "Hosh-Pak je mrtv�!";
};


func int dia_oric_hoshdead_condition()
{
	if(Npc_IsDead(hosh_pak) && (MIS_KILLHOSHPAK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_oric_hoshdead_info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Hosh-Pak je mrtv�!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//V�born�, to by m�lo zasadit sk�et�m slu�nou r�nu. Mo�n� m�me p�ece jenom n�jakou �anci.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//Mysl�m, �e bychom t�m m�li z�skat alespo� t�den �asu.
	MIS_KILLHOSHPAK = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLHOSH_PAK);
};


instance DIA_ORIC_ANYNEWS(C_INFO)
{
	npc = pal_251_oric;
	nr = 9;
	condition = dia_oric_anynews_condition;
	information = dia_oric_anynews_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_oric_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback))
	{
		return TRUE;
	};
};

func void dia_oric_anynews_info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Co je nov�ho?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//Mysl� krom� toho, �e n�s napadli sk�eti?
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Ano. Jsi n� hrdina. Zab�t v�echny draky nen� ��dn� proch�zka r��ov�m sadem, �ekl bych.
	}
	else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//Zd� se, �e sk�et� se hluboce dotkla Hosh-Pakova smrt.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//Sk�et� je ��m d�l t�m v�c. To nen� dobr�.
	};
};


instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_251_oric;
	nr = 3;
	condition = dia_oric_dragonplettbericht_condition;
	information = dia_oric_dragonplettbericht_info;
	permanent = TRUE;
	description = "Pot�ebuju v�c informac� o drac�ch.";
};


func int dia_oric_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		return TRUE;
	};
};


var int oric_swampdragoninfo_onetime;
var int oric_rockdragoninfo_onetime;
var int oric_firedragoninfo_onetime;
var int oric_icedragoninfo_onetime;
var int oric_dragoncounter;
var int oric_firstquestion;

func void dia_oric_dragonplettbericht_info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//Pot�ebuju v�c informac� o drac�ch.
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//Jednoho jsem u� zabil. M��e� mi ��ct, kde najdu ty ostatn�?
	}
	else if(MIS_KILLEDDRAGONS != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//M�m pocit, �e jsem se je�t� nedostal ke v�em drak�m. �e bych n�co p�ehl�dl?
	};
	if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
	{
		if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//Na z�pad od star�ho hradu vznikla b�hem n�kolika posledn�ch dn� velk� ba�ina. Nezd� se ti to n�jak podez�el�?
			b_logentry(TOPIC_DRACHENJAGD,"Oric mi dal aspo� n�jakou stopu: z�padn� od hradu se p�ed n�kolika dny zni�eho nic objevila hlubok� ba�ina. To je opravdu podez�el�.");
			ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//Daleko za sopkou na jihu je skaln� pevnost.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Na�i �pehov� hl�s�, �e ta pevnost je siln� st�e�en�. Mo�n� se tam ukr�v� jeden z nich.
			b_logentry(TOPIC_DRACHENJAGD,"Paladin�t� zv�dov� sd�lili Oricovi, �e kamenn� tvrz za sopkou na jihu je siln� st�e�ena. Oric se domn�v�, �e tam n�kde bude i drak.");
			ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//Kdy� draci naposledy za�to�ili, ��kalo se, �e jeden zmizel pobl� sopky na jih odsud. M�l bys to tam prozkoumat.
			b_logentry(TOPIC_DRACHENJAGD,"Posledn� drak, kter� napadl hrad v Hornick�m �dol�, byl pot� spat�en pobl� sopky.");
			ORIC_FIREDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//Na z�pad odsud je zamrzl� kraj. Nep�ekvapilo by m�, kdyby se tam ukr�val jeden z drak�.
			b_logentry(TOPIC_DRACHENJAGD,"Podle Orica by drak mohl s�dlit v zamrzl� oblasti na z�pad�.");
			ORIC_ICEDRAGONINFO_ONETIME = TRUE;
		};
		ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		ORIC_FIRSTQUESTION = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//V tuto chv�li pro tebe bohu�el nic nem�m.
	};
};


instance DIA_ORIC_KAP5_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap5_exit_condition;
	information = dia_oric_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_oric_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP6_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap6_exit_condition;
	information = dia_oric_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_oric_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_PICKPOCKET(C_INFO)
{
	npc = pal_251_oric;
	nr = 900;
	condition = dia_oric_pickpocket_condition;
	information = dia_oric_pickpocket_info;
	permanent = TRUE;
	description = "(Kr�de� tohoto svitku bude zatracen� t�k�.)";
};


func int dia_oric_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_oric_pickpocket_info()
{
	Info_ClearChoices(dia_oric_pickpocket);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_BACK,dia_oric_pickpocket_back);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_PICKPOCKET,dia_oric_pickpocket_doit);
};

func void dia_oric_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 85)
	{
		b_giveinvitems(self,other,itsc_palrepelevil,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_oric_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_oric_pickpocket_back()
{
	Info_ClearChoices(dia_oric_pickpocket);
};

