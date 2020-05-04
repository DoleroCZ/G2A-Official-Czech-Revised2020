
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hej, nem�m �as tady s tebou kl�bosit. Jestli chce� n�jak� informace, promluv si s Kardifem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Hele, chlape, prost� m� nech na pokoji, dobr�?
		AI_StopProcessInfos(self);
	};
};


var int nagurhack;

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//Nem�m dojem, �e bych t� nepoznal jen proto, �e m� jin� hadry!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(spiklenecky) Ty r�d strk� nos co v�c�, do kter�ch ti nic nen�, co?!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Ztra� se!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	NAGURHACK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Kardif ��kal, �e pro m� mo�n� bude� m�t n�jakou pr�ci.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif ��kal, �e pro m� mo�n� bude� m�t n�jakou pr�ci.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//Tady v p��stavu nen� pro kl�tern� pan�ky na pr�ci v�bec nic (sm�ch).
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Tady v p��stavu nen� pro kr�lovsk� voj�ky na pr�ci v�bec nic.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(zkoumav�) Dobr�, dobr�, tak ty se poohl�� po n�jak� speci�ln� p��ci�ce. Ale hraje se podle mejch pravidel, jasn�?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Co to znamen�?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//To znamen� to, �e ud�l�, co ti �eknu, a dostane� t�etinu zisku.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Jestli se ti to nel�b�, nic pro tebe nem�m.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"Jsme obchodn� partne�i, tak�e hezky fifty-fifty.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"Dobr�, ty jsi ��f.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//Dobr�, ty jsi ��f.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Fajn, dej mi v�d�t, a� bude� p�ipravenej na nahrab�n� hromady pen�z.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Jsme par��ci, tak�e fifty-fifty.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Jo, jasn�, stejn� jsem si myslel, �e to tak bude. Samoz�ejm�, �e se spravedliv� rozd�l�me.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "Fajn, jakej je pl�n?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job) && (MIS_NAGUR_BOTE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Fajn, jakej je pl�n?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Zn� obchodn�ka Baltrama, ne? Jestli ne, tak je na�ase si s n�m promluvit.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//Ten Baltram m� posl��ka, kterej ho z�sobuje zbo��m z Akilovy farmy.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//Teda, M�L posl��ka, dokud jsem ho nepod��z. A te� si Baltram sh�n� nov�ho. A t�m bude� ty.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Nech� se Baltramem najmout a vezme� tu dod�vku od Akila.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//P�inese� mi ji a j� ji pak prod�m jednomu zaj�mav�mu z�kazn�kovi. D� n�m za to po��dnou sumi�ku zlata.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//A nepokou�ej se to prodat s�m. Je ti v�echno jasn�?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Tak dobr�, jdeme na to. (KONEC)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Kde najdu Baltrama?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"Kdy si m�m s Baltramem promluvit?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Kde je Akilova farma?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"Kolik n�m z toho kouk�?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Kde je Akilova farma?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Opust� m�sto v�chodn� branou. Je to ta p��mo u tr�i�t�.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Kdy� p�jde� po cest� napravo, brzo naraz� na n�kolik stup�� vytesan�ch do sk�ly.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Vyjdi po nich a naraz� na Akilovu farmu.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//Kolik n�m z toho kouk�?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//P�esn� t�ko ��ct. Ale tak kolem 400 zlat�ch.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Kde najdu Baltrama?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//M� sv�j st�nek na tr�i�ti.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Kdy si m�m s Baltramem promluvit?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//M��e� j�t hned te�. U� by m�l v�d�t, �e se jeho posl��ek u� nikdy neuk�e. (sprost� sm�ch)
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Tak teda dobr�, jdu na to.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Fajn, tak jdi - ale jestli se m� pokus� podv�st, bude� �pln� stejn� mrtvej jako ten posl��ek! Nezapome� na to!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"Mus�m Baltrama p�im�t, aby m� p�ijal jako nov�ho posl��ka. Pak mus�m p�ebrat z�silku od farm��e Akila a p�edat ji Nagurovi.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "P�inesl jsem ten bal�k.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//P�inesl jsem ten bal�k.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Dobr� pr�ce. Zkus�m to prodat. Vra� se z�tra.
	b_logentry(TOPIC_NAGUR,"Nagur p�ijal z�silku. Zaplat� mi z�tra.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "Prodal jsi teda to zbo��?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Prodal jsi teda to zbo��?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Jo, ale za m��, ne� jsem myslel. Dostal jsem jen 300 zlat�ch.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Kus z toho je pro moje zam�stnance.
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//A Kardif dostane sv�j obvykl� pod�l - plus zlato na tvoji provizi.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Co� nakonec d�l� 240 zlat�ch. Rozd�l�me si to, jak jsme se dohodli. Tady je tv�j d�l.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Odvedl jsi dobrou pr�ci. Nechal jsem na to sv�ch zam�stnanc�ch.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Co se na tom vyd�l�, u� nijak neovlivn�m.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Ne, je�t� ne. Tahle v�c chce sv�j �as. Chci po tom v�em dostat dobrou cenu.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Kdo jsou tv� zam�stnanci?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Kdo jsou tv� zam�stnanci?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//V�n� si nemysl�, �e ti to �eknu, �e ne?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE) && (NAGURHACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Ten k�eft dopadnul dob�e, ale o sv�ch lidech nemluv�m. Tak�e kl�dek.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Podvedl jsi m�! To byla velk� chyba - jdi do hajzlu!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Dok�zals to. Te� v�, kdo jsou m� zam�stnanci.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Dr� se toho, co ti �ekla Cassia - nestar�me se o to, kdo jsou ti ostatn�. Jsi jedn�m z n�s, a na ni�em jin�m nesejde.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Pod�vej se po n�kom jin�m. Potlouk� se tu kolem dost lid�. U� pro tebe nic dal��ho nem�m.
	AI_StopProcessInfos(self);
};

