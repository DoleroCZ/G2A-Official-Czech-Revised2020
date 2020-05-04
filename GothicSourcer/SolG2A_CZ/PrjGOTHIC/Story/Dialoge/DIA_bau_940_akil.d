
instance DIA_AKIL_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_exit_condition;
	information = dia_akil_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_akil_exit_info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//U� mus�m j�t.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nenech se zdr�ovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Tak zat�m. R�d bych pro tebe ud�lal n�co v�c.
	};
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_HALLO(C_INFO)
{
	npc = bau_940_akil;
	nr = 4;
	condition = dia_akil_hallo_condition;
	information = dia_akil_hallo_info;
	permanent = FALSE;
	description = "N�jak� probl�my?";
};


func int dia_akil_hallo_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_hallo_info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//N�jak� probl�my?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(pot� se)... Eh... ne, ne... V�echno v po��dku. (nerv�zn�) Bylo... bylo by lep��, kdybys hned ode�el.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Jsi si jist�?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Eh... jo, jo... v�echno je dobr�. Ty... eh... J�... te� s tebou nem��u mluvit.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil�v statek ohro�uj� �old�ci.");
	AKILS_SLDSTILLTHERE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NICHTJETZT(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_nichtjetzt_condition;
	information = dia_akil_nichtjetzt_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_akil_nichtjetzt_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
	{
		return TRUE;
	};
};

func void dia_akil_nichtjetzt_info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Eh... te� ne, te� s tebou nem��u mluvit.
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NACHKAMPF(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_akil_nachkampf_condition;
	information = dia_akil_nachkampf_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_akil_nachkampf_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_nachkampf_info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//D�ky Innosovi. U� jsem si myslel, �e je se mnou konec.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Jmenuju se Akil. Obd�l�v�m tenhle skromnej kousek p�dy.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kdo byli ti lid�?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Ty bys je m�l zn�t. Byli to �oldn��i z Onarovy farmy. Jako ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//To byli �old�ci z Onarovy farmy. Ti bastardi neznaj� nic ne� vra�d�n� a rabov�n�.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Ob�val jsem se nejhor��ho.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(hlubok� povzdech)... Dobr�, d�ky Innosovi, �es nep�i�el pozd�. �ekni mi, pro� jsi to pro m� ud�lal?
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"Jen tak. Prost� abys to p�e�kal ve zdrav�.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"Co takhle trochu zlata?",dia_akil_nachkampf_gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
	{
		Npc_ExchangeRoutine(kati,"Start");
		AI_ContinueRoutine(kati);
		kati.flags = 0;
	};
	if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
	{
		Npc_ExchangeRoutine(randolph,"Start");
		AI_ContinueRoutine(randolph);
		randolph.flags = 0;
	};
	TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_akil_nachkampf_ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Jen tak. Prost� abys to p�e�kal ve zdrav�.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Takov� chlapi se u� jen tak nevid�. A� t� na tv�ch cest�ch Innos prov�z�.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Co takhle trochu zlata?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Je mi l�to, ale asi t� zklamu - jsme jen chud� farm��i. Je to tak akor�t pro skromn� �ivobyt�.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//V�echno, co ti m��u nab�dnout, je n�co k j�dlu. Zajdi za Kati, a� se o tebe postar�.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
	Info_ClearChoices(dia_akil_nachkampf);
	KATI_MAHLZEIT = TRUE;
};


instance DIA_AKIL_SOELDNER(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_soeldner_condition;
	information = dia_akil_soeldner_info;
	permanent = FALSE;
	description = "Co po tob� ti �old�ci cht�li?";
};


func int dia_akil_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf))
	{
		return TRUE;
	};
};

func void dia_akil_soeldner_info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Co po tob� ti �old�ci cht�li?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Ty si ze m� utahuje�. Cht�li ode m� vybrat n�jem.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Ty to nev�? Najal je Onar, ten velkostatk��. Hl�daj� jeho farmu a vyb�raj� pro n�j renty.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znamen�, �e chod� od farmy k farm� a berou si v�e, co se jim l�b�. A jedin�, ��m plat�, je chu� jejich oceli.
	};
};


instance DIA_ADDON_AKIL_MISSINGPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_missingpeople_condition;
	information = dia_addon_akil_missingpeople_info;
	description = "Sly�els n�co o mizej�c�ch lidech?";
};


func int dia_addon_akil_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_akil_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Sly�els n�co o mizej�c�ch obyvatel�ch?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Ty jsi ale vtip�lek. Jestli sly�el? N�kolik m�ch vlastn�ch lid� se ztratilo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Tonak a Tabor pracovali na m�ch pol�ch je�t� p�ed 3 dny.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//A v�m jist�, �e by farmu neopustili beze slova.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Nicm�n� zmizeli a nikdo mi ne�ekel, co se stalo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Pokud najde� alespo� n�jak� znamen�, �e �ij�, tak mi to p�ij� ��ct. P�ijde�, �e?
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Farm�� Akil postr�d� sv� dva lidi : Tonaka a Telbora.");
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_RUNNING;
};


instance DIA_ADDON_AKIL_RETURNPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_returnpeople_condition;
	information = dia_addon_akil_returnpeople_info;
	permanent = FALSE;
	description = "O t�ch farm���ch ...";
};


func int dia_addon_akil_returnpeople_condition()
{
	if((MIS_AKIL_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (MISSINGPEOPLERETURNEDHOME == TRUE) && ((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_akil_returnpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//O t�ch farm���ch ...
	if((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Tys je p�ivedl zp�t - ty jsi ale bl�zen.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Aspo� jeden p�e�il p�echod.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Vezmi si toto zlato jako vyj�d�en� m�ch d�k�
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveplayerxp(XP_AMBIENT);
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_SUCCESS;
};


instance DIA_AKIL_LIEFERUNG(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_lieferung_condition;
	information = dia_akil_lieferung_info;
	permanent = FALSE;
	description = "Poslal m� Baltram...";
};


func int dia_akil_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_akil_lieferung_info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Poslal m� Baltram. M�m tu pro n�j vyzvednout n�jak� bal�k.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Tak ty jsi te� jeho nov� posl��ek. Fajn, u� jsem to p�ipravil.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"Z�skal jsem tu z�silku. Te� u� ji mohu p�in�st Baltramovi.");
	b_logentry(TOPIC_NAGUR,"Z�skal jsem tu z�silku. Te� u� ji mohu p�in�st Nagurovi.");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "Ur�it� se tady kolem vyzn�.";
};


func int dia_akil_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int knows_taverne;

func void dia_akil_gegend_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Ur�it� se tady kolem vyzn�.
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Jasn�, co pot�ebuje� v�d�t?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "Kde najdu Onarovu farmu?";
};


func int dia_akil_hof_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_hof_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Kde najdu Onarovu farmu?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Sta�� se vr�tit ke kamenn�m schod�m a j�t po cest� na v�chod.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Stejnou cestou se dostane� i do kr�my. Odsud p�jde� d�l na v�chod, dokud nedoraz� k obrovsk�m l�n�m. To je m�sto, kde se poflakuj� �old�ci.
	KNOWS_TAVERNE = TRUE;
};


instance DIA_AKIL_TAVERNE(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_taverne_condition;
	information = dia_akil_taverne_info;
	permanent = FALSE;
	description = "Co je to za kr�mu na v�chod odsud?";
};


func int dia_akil_taverne_condition()
{
	if(KNOWS_TAVERNE == TRUE)
	{
		return TRUE;
	};
};

func void dia_akil_taverne_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Co je to za kr�mu na v�chod odsud?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zeptej se Randolpha. V� o tom v�c ne� j�. N�kolikr�t se tam stavil.
};


instance DIA_AKIL_WALD(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_wald_condition;
	information = dia_akil_wald_info;
	permanent = FALSE;
	description = "Co je v t�ch les�ch za farmou?";
};


func int dia_akil_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_wald_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Co je v t�ch les�ch za farmou?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Jenom n�jak� p��ery - a vlci jsou z nich ti nejm�� nebezpe�n�.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Taky se pov�d�, �e tam m� �kryt n�kolik bandit�. No, ale u� p�kn� dlouho nechali moji farmu na pokoji.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "Stalo se je�t� n�co?";
};


func int dia_akil_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_akil_perm_info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Stalo se je�t� n�co?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Ne. Douf�m, �e ovce z�stanou tam, co jsou te�.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Moje ovce zmizely. Za chv�li nebudu m�t co do �st.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//V�ude se objevuj� sk�eti. Kdosi n�co ��kal o jejich z�kladn�. Zeptej se na to farm��e Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Taky tu spat�ili spoustu je�t�ran�. B�t tebou, do jeskyn� bych v�bec nechodil.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Hledaj� t� zakuklenci v �ern�ch k�p�ch.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//No tak to je novinka.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Dobr�. Prost� jsem myslel, �e bych se o tom m�l zm�nit.
		};
	};
};


instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap3_exit_condition;
	information = dia_akil_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_akil_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdieb_condition;
	information = dia_akil_schafdieb_info;
	description = "Je�t� n�jak� zpr�vy?";
};


func int dia_akil_schafdieb_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_akil_schafdieb_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Je�t� n�jak� zpr�vy?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Posledn� dobou mi po��d n�kdo krade ovce. U� cel� noci jsem se po��dn� nevyspal.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"To nen� m�j probl�m.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"Kolik ovc� ti chyb�?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"Kdo by to mohl d�lat?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"Akilovi n�kdo st�le krade ovce. Domn�v� se, �e to maj� na sv�dom� banditi z jeskyn� v nedalek�m lese.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kdo by to mohl d�lat?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Tak to nem�m ani tu�en�.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//N�jak� fakt odporn� chl�pci se usadili v jeskyn�ch za t�m lesem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Nechce se mi v��it, �e by se �ivili jen bobulema. Jsem si skoro jistej, �e oni jsou ten d�vod, pro� se mi ztr�cej� ovce.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Kolik ovc� ti chyb�?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Te� se mi ztratily minim�ln� t�i.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To nen� m�j probl�m.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Rozum�m. M� na pr�ci jin� v�ci.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "Na�el jsem ty zlod�je ovc�.";
};


func int dia_akil_schafdiebeplatt_condition()
{
	if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
	{
		return TRUE;
	};
};

func void dia_akil_schafdiebeplatt_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Na�el jsem ty zlod�je ovc�.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//M�l jsi pravdu. D�lali to ti chl�pci z lesn� jeskyn�. U� ti ��dnou dal�� ovci nevezmou.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//D�ky ti, �lechetn� slu�ebn�ku Innose.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//D�ky. Tak se p�ece jen domobrana dok�e postarat o n�s, mal� farm��e.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//D�ky. V�n� jsi divnej �old�k. V�bec ne jako ti ostatn�, co zn�m.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Vezmi si tohle jako mal� vyj�d�en� m�ch d�k� za tvou nezi�tnou pomoc.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
	b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};


instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_akilsschaf_condition;
	information = dia_akil_akilsschaf_info;
	description = "(Vr�tit Akilovi ovci.)";
};


func int dia_akil_akilsschaf_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
	{
		return TRUE;
	};
};

func void dia_akil_akilsschaf_info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//V�born�. Tady m� trochu zlata. Douf�m, �e to sta��.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
	follow_sheep_akil.wp = "NW_FARM2_OUT_02";
	follow_sheep_akil.start_aistate = zs_mm_allscheduler;
	b_giveplayerxp(XP_AKILSSCHAF);
};


instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap4_exit_condition;
	information = dia_akil_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_akil_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap5_exit_condition;
	information = dia_akil_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_akil_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap6_exit_condition;
	information = dia_akil_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_akil_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_PICKPOCKET(C_INFO)
{
	npc = bau_940_akil;
	nr = 900;
	condition = dia_akil_pickpocket_condition;
	information = dia_akil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_akil_pickpocket_condition()
{
	return c_beklauen(37,30);
};

func void dia_akil_pickpocket_info()
{
	Info_ClearChoices(dia_akil_pickpocket);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};

func void dia_akil_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_akil_pickpocket);
};

func void dia_akil_pickpocket_back()
{
	Info_ClearChoices(dia_akil_pickpocket);
};

