
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "Tak co, chlape�ku?";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Tak co, chlape�ku?
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Takhle se mnou ��dnej usoplenej roln�k nebude mluvit - kolikr�t ti to je�t� budu p�ipom�nat?
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"Nejsem roln�k.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Ty to tady vede�?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ty to tady vede�?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//(ustra�en�) Eh. Ne, jsem jen Sekob�v syn. Ale a� m�j star� otec jednou nebude mezi n�mi, bude mi to tu v�echno pat�it.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//ڞasn�!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nejsem roln�k.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//A co tady chce�? Nem�me nic. Tak�e zase m��e� j�t.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Takhle jedn� se v�emi roln�ky?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Takhle jedn� se v�emi roln�ky?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Jasn� - pot�ebujou to. A nen� pro� se pohor�ovat, takhle to prost� funguje.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "Pot�ebuju mluvit s tv�m otcem.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Pot�ebuju mluvit s tv�m otcem.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//Nem� �as. Ale j� ho zastupuju. Jak ti m��u pomoct?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//P�edstav m� sv�mu otci.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Ty jsi opravdu ne�stupn� chlap�k a z�ejm� i dobr� bojovn�k, co?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Ten nejlep��.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Tak to asi bude lep��, kdy� t� za n�m vezmu.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Ned�lej si starosti, hochu. Najdu ho s�m. Ur�it�.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Kdy� to ��k�.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "Tak co d�l�, kdy� si zrovna nehraje� na p�na farmy?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//Tak co d�l�, kdy� si zrovna nehraje� na p�na farmy?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Hl�d�m.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Ta mizern� domobrana z m�sta leze na n� pozemek ��m d�l t�m �ast�jc a krade v�echno, co se d� odn�st.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Byli tu minul� t�den a vzali si n�kolik na�ich ovc�.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Kdyby se mi n�kdo z nich dostal do rukou, ud�lal bych s n�m kr�tk� proces.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Ale jist�!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "Pro� v�m proti domobran� nepom��ou �old�ci?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Pro� v�m proti domobran� nepom��ou �old�ci?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Ne� ty se na n�co zm��ou, j� u� je d�vno za�enu s�m.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(Zeptat se na Bronca.)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Je tady chl�pek, co chce po ka�d�m kolemjdouc�m m�tn� a tvrd� o sob�, �e je farm��.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(rozpa�it�) Eh. Ano. J� v�m. To je Bronco. D�l� si, co chce.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Jako bych ho milionkr�t nedokop�val k tomu, aby se vr�til do pr�ce.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Ale?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Prost� to neud�lal.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//M�j otec je na m� p�kn� na�tvan�, �e jsem ho je�t� nedok�zal p�inutit, aby se vr�til do pr�ce.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Mo�n� bych ti mohl pomoct.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Mo�n� bych ti mohl pomoct.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Mysl� s n�m? Fajn, poslouchej, kdy� se ti poda�� Bronca dostat zp�tky do pr�ce, zaplat�m ti. �ekn�me 10 zlat�ch. Co ��k�?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"��dn� probl�m. Ale chci v�c pen�z.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"Budu o tom p�em��let.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Jak je libo.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//Dobr�. Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Ale posp� si s t�m.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Till nedok�e Bronca p�im�t k pr�ci, a proto m� po��dal, abych se o to pokusil.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Chci v�c.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//��dn� probl�m. Ale chci v�c pen�z.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//Dobr�. Tak teda 20 zlat�ch.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci v�c.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci v�c.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Mo�n�... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci v�c.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Fajn. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chci v�c.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Tak dob�e, dob�e! D�m ti 100 zlat�ch. Ale to je v�echno, co m�m.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Dobr�. Uvid�m, co se d� d�lat.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Bronco se vr�til do pr�ce.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronco se vr�til do pr�ce.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//V�n�? To je ��asn�.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Jo. A te� k moj� odm�n�.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(v�hav�) Mmh. dobr�. Obchod je obchod, co?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Bohu�el, nem�m tolik pen�z. Ale za tvou pomoc jsem ti velmi zav�z�n.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(Otravovat Tilla.)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Daleko od domova, �e ano? Tady ti tv�j tat�k nepom��e.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Nebude to dlouho trvat a zav�u tu tvoj� nevym�chanou hubu.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ty b��dile, je�t� bude� mluvit o �t�st�, kdy� t� nech�m na�ivu.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Tak m� nech na pokoji.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Mo�n� bys m�l v�c j�st, abys v�c vyrostl a stal se siln�j��m.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Jednou ti uk�u.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ty mizernej malej...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Prost� vypadni.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//M� n�koho, kdo ti dneska bude foukat na nos�nek?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Nech m� b�t, ty pitom�e.
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};

