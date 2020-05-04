
instance DIA_ADDON_MYXIR_ADW_EXIT(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 999;
	condition = dia_addon_myxir_adw_exit_condition;
	information = dia_addon_myxir_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_ADWHELLO(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_adwhello_condition;
	information = dia_addon_myxir_adwhello_info;
	description = "M� n�jak� zpr�vy?";
};


func int dia_addon_myxir_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//M� n�jak� zpr�vy?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Stavitel� t�chto ruin m� fascinuj�!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Je to �koda, �e jejich jazyk je mrtv� jako oni sami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(zamy�len�) Jejich pozoruhodn� ritu�ly a tak� p�ivol�v�n� pro n� nebyli ��dnou z�chranou.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//P�ivol�v�n�?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Stavitel� m�li siln� spojen� se sv�tem duch�.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jestli jsem pochopil spr�vn� jejich my�len�, m�li spojen� se sv�mi p�edky celou dobu.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Kv�li tomu pravideln� po��dali p�ivol�v�n� a ritu�ly, aby dostali radu.
	Info_ClearChoices(dia_addon_myxir_adwhello);
	Info_AddChoice(dia_addon_myxir_adwhello,"Jak funguje to p�ivol�v�n�?",dia_addon_myxir_adwhello_wie);
	Info_AddChoice(dia_addon_myxir_adwhello,"Nemrtv�, co j� v�m, toho moc nenamluv�.",dia_addon_myxir_adwhello_watt);
};

func void dia_addon_myxir_adwhello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak funguje to p�ivol�v�n�?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Str�ci mrtv�ch m�li sv� speci�ln� kouzla, kter�mi klidnili duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Texty, kter� se zde daj� naj�t, jsou docela zmaten�. P�esn� odpov��i na m� ot�zky nenal�z�m jen velmi m�lo kdy.
};

func void dia_addon_myxir_adwhello_watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Nemrtv�, co j� v�m, toho moc nenamluv�.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Stavitel� nestvo�ili bezduch� nemrtv� jako zombie nebo jin� zl� nestv�ry.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//S duchy jsou du�e velk�ch bojovn�k�, kn�� a vl�dc�.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Dote� nem�m ��dn� pochybnosti, �e opravdu existuj�.
};


instance DIA_ADDON_MYXIR_PERMADW(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 10;
	condition = dia_addon_myxir_permadw_condition;
	information = dia_addon_myxir_permadw_info;
	permanent = TRUE;
	description = "Pokud potk�m ducha, d�m ti v�d�t.";
};


func int dia_addon_myxir_permadw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_adwhello) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Pokud potk�m ducha, d�m ti v�d�t.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(sm�je se) Ano, to ur�it� ud�lej.
};


instance DIA_ADDON_MYXIR_GEISTTAFEL(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geisttafel_condition;
	information = dia_addon_myxir_geisttafel_info;
	description = "Saturas m� poslal.";
};


func int dia_addon_myxir_geisttafel_condition()
{
	if((SATURAS_RIESENPLAN == TRUE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geisttafel_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas m� poslal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven se ukryl do chr�mu a zav�el za sebou port�l.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas se domn�v�, �e z�skal znalosti o chr�mu od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(zdrcen�) Oh Adane!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Musel p�ivolat vrchn�ho kn�ze Khardimona, aby se ho zeptal na cestu do chr�mu.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Podle zaznam� m� hrob v jeskyn�ch pod pevnost�!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Mus� ud�lat to sam�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale Khardimona se u� zeptat nem��e� ...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//Hrob v�le�n�ka Quahodrona le�� na z�pad� �dol�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Mus� ho naj�t ... a probudit Quahodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//V t�chto n�pisech je naps�no, jak v���c� Adanose m��e p�ivolat ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Mysl�, �e opravdu funguj�?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//P�e�etl jsem hodn� p�sma.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Nap��klad z�pisi Y'Beriona, v�dce Bratrstva Sp��e.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale v���m ka�d�mu slovu autora T�CHTO spisk�!
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_RUNNING;
	Info_ClearChoices(dia_addon_myxir_geisttafel);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Mysl� to v�n�?",dia_addon_myxir_geisttafel_geist);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Pro� Quarhodron? Pro� ne vrchn� kn�z Khardimon osobn�?",dia_addon_myxir_geisttafel_khardimon);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Bratrstvo Sp��e ne��kalo jenom l�i. Sp�� je vyd�val.",dia_addon_myxir_geisttafel_psi);
};

func void dia_addon_myxir_geisttafel_khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Pro� Quarhodron? Pro� ne vrchn� kn�z Khardimon osobn�?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven znesv�til hrob sv�m p�ivol�v�n�m. To je jist�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Mus�me se pod�vat po jin�m duchovi.
};

func void dia_addon_myxir_geisttafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bratrstvo Sp��e ne��kalo jenom l�i. Sp�� je vyd�val.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nebyly jenom jejich l�i, to je nepravd�podobn�, byli to jejich slova.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Slova byla v�c nevysv�tliteln� ne� p�esv�d�iv�. Bylo to ove�en� nadm�rn�m pou��v�n�m bahenn�ch rostlin, kter� kou�ili.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Je to z�va�n�j�� a rozv�n�j�� ve slovech t�to kamenn� desky, co m� p�esv�d�ilo o skute�nosti, �e TEN mu� sem napsal pravdu.
};

func void dia_addon_myxir_geisttafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Mysl� to v�n�?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Nechci nechat jedin� k�men nerozlu�t�n�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//I jestli pro n�s existuje jenom n�dech �ance potkat jednoho ze stavitel�, pak to mus�me zkusit.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Raven to tak� dok�zal.
	Info_AddChoice(dia_addon_myxir_geisttafel,"Souhlas�m, p�ivol�m ducha. Co m�m ud�lat?",dia_addon_myxir_geisttafel_wie);
};

func void dia_addon_myxir_geisttafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Souhlas�m, p�ivol�m ducha. Co m�m ud�lat?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Najdi Quahodron�v hrob na z�pad� �dol�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Se slovy Str�c� mrtv�ch, kter� jsem napsal, bude jeho duch p�ivol�n.
	CreateInvItems(self,itwr_addon_summonancientghost,1);
	b_giveinvitems(self,other,itwr_addon_summonancientghost,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//To� v�e. Te� mus�me naj�t jeho hrob.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Hodn� �t�st� synu!
	b_logentry(TOPIC_ADDON_QUARHODRON,"Myxir chce abych probudil ducha prad�vn�ho v�le�n�ka Quadrohona a zeptal se ho na radu. Dal mi dokument s magickou formul�, kterou m�m nahlas p�e��st v Quarhodronov� hrob� na z�pad�.");
	Info_ClearChoices(dia_addon_myxir_geisttafel);
};


instance DIA_ADDON_MYXIR_GEISTPERM(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geistperm_condition;
	information = dia_addon_myxir_geistperm_info;
	description = "Jak to bylo znovu o v�le�n�kovi 'Quarhodronovi'?";
};


func int dia_addon_myxir_geistperm_condition()
{
	if(MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geistperm_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Jak to bylo znovu o v�le�n�kovi 'Quarhodronovi'?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//M�l bys naj�t jeho hrob a p�ivolat ho pomoc� slov Str�c� mrtv�ch.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Napsal jsem ty slova. Mus� je jenom nahlas p�e��st.
};


instance DIA_ADDON_MYXIR_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_talkedtoghost_condition;
	information = dia_addon_myxir_talkedtoghost_info;
	description = "Promluvil jsem s Quarhodronem.";
};


func int dia_addon_myxir_talkedtoghost_condition()
{
	if((MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING) && (SC_TALKEDTOGHOST == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Promluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(nad�en�) Pak ho opravdu m��e� probudit z kr�lovstv� mrtv�ch?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To je opravdu zaj�mav�. Obdivuji tyto stavitele ��m d�l v�c.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kdo v�, �eho mohli dos�hnout, pokud by st�le existovali ...
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MYXIR_GEISTBESCHWOEREN);
	if((SATURAS_KNOWSHOW2GETINTEMPEL == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co ten duch ��kal?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Dal mi n�co, s ��m se mohu dostat do chr�mu.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Pak jdi p��mo k Saturasovi. Bude se o to zaj�mat.
		b_logentry(TOPIC_ADDON_QUARHODRON,"M�l bych ohl�sit Saturasovi, �e jsem probudil Quarhodrona.");
	};
};


instance DIA_ADDON_MYXIR_ADW_TEACH(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 90;
	condition = dia_addon_myxir_adw_teach_condition;
	information = dia_addon_myxir_adw_teach_info;
	permanent = TRUE;
	description = "Nau� m� ciz� jazyk.";
};


var int dia_addon_myxir_adw_teach_noperm;
var int dia_addon_myxir_adw_teach_onetime;

func int dia_addon_myxir_adw_teach_condition()
{
	if((DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if(DIA_ADDON_MYXIR_ADW_TEACH_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
		DIA_ADDON_MYXIR_ADW_TEACH_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_adw_teach);
		Info_AddChoice(dia_addon_myxir_adw_teach,DIALOG_BACK,dia_addon_myxir_adw_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_adw_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_adw_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_adw_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_adw_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_adw_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

