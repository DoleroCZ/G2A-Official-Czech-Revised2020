
instance DIA_ADDON_SENYAN_EXIT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 999;
	condition = dia_addon_senyan_exit_condition;
	information = dia_addon_senyan_exit_info;
	permanent = TRUE;
	description = "Uvid�me se ...";
};


func int dia_addon_senyan_exit_condition()
{
	return TRUE;
};

func void dia_addon_senyan_exit_info()
{
	if(SENYAN_ERPRESSUNG == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//V� co d�lat ...
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SENYAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 900;
	condition = dia_addon_senyan_pickpocket_condition;
	information = dia_addon_senyan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_senyan_pickpocket_condition()
{
	return c_beklauen(45,88);
};

func void dia_addon_senyan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_BACK,dia_addon_senyan_pickpocket_back);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_PICKPOCKET,dia_addon_senyan_pickpocket_doit);
};

func void dia_addon_senyan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void dia_addon_senyan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void b_senyan_attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(podce�uje) Jak mi m��e� b�t n�pomocen, pane k ni�emu?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(vol�) Hej lidi, pod�vejte, kdo to je!
	SENYAN_CALLED = TRUE;
	SENYAN_ERPRESSUNG = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_senyan_erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Kolik chce�?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(hraje provinil�ho) Ale ne, pros�m. Nikdy by m� nenapadlo t� vyd�rat. Nikdy.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Ned�vno se n�kdo pokusil zab�t Estebana. Nicm�n� byl zabit jeho str�ci.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Jdi k Estebanovi a promluv s n�m. Popov�d�me si po tom.
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_ADDON_SENYAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SENYAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SENYAN,"Seynan m� poznal. V� kdo jsem. Chce to pou��t pro sv� vlastn� pl�ny. Pl�nuje n�co a te� chce abych si promluvil s Estebanem.");
};


instance DIA_ADDON_BDT_1084_SENYAN_HI(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_hi_condition;
	information = dia_addon_senyan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_hi_condition()
{
	return TRUE;
};


var int senyan_msg;
var int senyan_bad;
var int senyan_good;

func void dia_addon_senyan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Ah! Pod�vejme, kdo to je.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Dobr�, dobr�, jestlipak to nejsi ty. M�m pro tebe p�r dobr�ch a �patn�ch zpr�v.
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chci nejd��v sly�et dobr� zpr�vy.",dia_addon_bdt_1084_senyan_hi_good);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chci nejd��v sly�et �patn� zpr�vy.",dia_addon_bdt_1084_senyan_hi_bad);
};

func void dia_addon_bdt_1084_senyan_hi_good()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Chci nejd��v sly�et dobr� zpr�vy.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A co dobr� zpr�vy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nev�m jist� pro�, ale bu� si jist�, �e tu m� vlivn� nep��tele.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Pova� s�m, �e jsi m�l �t�st�, �e jsem t� poznal jako prvn�, a ne n�kdo jin�.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jsem velmi rozumn�, ch�pav� a spole�ensk� osoba.
	SENYAN_GOOD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_BAD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A co �patn� zpr�vy?",dia_addon_bdt_1084_senyan_hi_bad);
	};
};

func void dia_addon_bdt_1084_senyan_hi_bad()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chci nejd��v sly�et �patn� zpr�vy.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A co �patn� zpr�vy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Raven t� hled�. Jeho str�e t� hledaj�. Vlastn�, v�ichni bandit� ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Zabij� t�, pokud na n� naraz�.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Nebudou prvn�, kdo to zkou��.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Tvoje bojov� schopnosti jsou pozoruhodn� jako tvoje chytrost. Nasadit si jedno z na�ich brn�n� a p�ij�t k n�m do t�bora je jako ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//... kdy� ovce vejde vlkovi p��mo do tlamy. Chod� po tenk�m led�, chlape.
	SENYAN_BAD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_GOOD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A co dobr� zpr�vy?",dia_addon_bdt_1084_senyan_hi_good);
	};
};


instance DIA_ADDON_SENYAN_UNTERWEGS(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 99;
	condition = dia_addon_senyan_unterwegs_condition;
	information = dia_addon_senyan_unterwegs_info;
	permanent = TRUE;
	description = "O Estebanovi ...";
};


func int dia_addon_senyan_unterwegs_condition()
{
	if((MIS_JUDAS != LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_unterwegs_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//O Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//U� jsi s n�m promluvil?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Je�t� ne.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Dobr�, ne�ekej p��li� dlouho.
};


instance DIA_ADDON_SENYAN_ATTENTAT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 2;
	condition = dia_addon_senyan_attentat_condition;
	information = dia_addon_senyan_attentat_info;
	permanent = FALSE;
	description = "U� jsem s n�m promluvil.";
};


func int dia_addon_senyan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//U� jsem s n�m promluvil.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Zm�nil se o pokuse o vra�du?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Je m�m �kolem naj�t osobu, kter� je za to zodpov�dn�. Nev� o tom n�co?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Ne v�c ne� ty. Osobn� hled�m pachatele. A zaj�mav� ��st je ...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//ANO?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chci, aby si tu pr�ci ud�lal ty a po��dn�. Chci, abys na�el toho zr�dce.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(chladn�) A jen, co ho najde�, zabij ho - pro m�.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//'J�' budu odm�n�n.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//M�j st�le na pam�ti, �e m�m tv�j plak�t. Ud�lej svoji pr�ci a ud�lej ji dob�e. M��e� h�dat, co by se jinak stalo.
	Info_ClearChoices(dia_addon_senyan_attentat);
	Info_AddChoice(dia_addon_senyan_attentat,"Pak nem�m jinou volbu ...",dia_addon_senyan_attentat_ja);
	Info_AddChoice(dia_addon_senyan_attentat,"Nen� cesty!",dia_addon_senyan_attentat_no);
};

func void dia_addon_senyan_attentat_no()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Nen� cesty!
	b_senyan_attack();
	Info_ClearChoices(dia_addon_senyan_attentat);
};

func void dia_addon_senyan_attentat_ja()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Pak nem�m jinou volbu ...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//V�d�l jsem, �e bude� souhlasit.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(nevrle) Jestli n�co zjist� o jeho identit�, p�jdem zab�t toho bastarda spole�n�. A te� se ztra�!
	SENYAN_ERPRESSUNG = LOG_RUNNING;
	Info_ClearChoices(dia_addon_senyan_attentat);
	b_logentry(TOPIC_ADDON_SENYAN,"Seynan chce abych na�el a zabil spiklence. Jenom pro n�j z�skat odm�nu.");
};


instance DIA_ADDON_SENYAN_CHANGEPLAN(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_changeplan_condition;
	information = dia_addon_senyan_changeplan_info;
	permanent = FALSE;
	description = "Je�t� jsem si to promyslel. Nechci s tebou d�le pracovat!";
};


func int dia_addon_senyan_changeplan_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (SNAF_TIP_SENYAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_changeplan_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Je�t� jsem si to promyslel. Nechci s tebou d�le pracovat!
	b_senyan_attack();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_1084_SENYAN_FOUND(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_found_condition;
	information = dia_addon_senyan_found_info;
	permanent = FALSE;
	description = "Na�el jsem zr�dce. Je to Fisk.";
};


func int dia_addon_senyan_found_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_found_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Na�el jsem zr�dce. Je to Fisk.
	b_senyan_attack();
};


instance DIA_ADDON_BDT_1084_SENYAN_DERBE(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_derbe_condition;
	information = dia_addon_senyan_derbe_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_derbe_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS) && (Npc_IsDead(fisk) || Npc_IsDead(esteban)))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_derbe_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(na�tvan�) Zni�il jsi na�i dohodu.
	b_senyan_attack();
};

