
instance DIA_JACK_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_exit_condition;
	information = dia_jack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_jack_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_PICKPOCKET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 900;
	condition = dia_jack_pickpocket_condition;
	information = dia_jack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jack_pickpocket_condition()
{
	return c_beklauen(50,100);
};

func void dia_jack_pickpocket_info()
{
	Info_ClearChoices(dia_jack_pickpocket);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};

func void dia_jack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jack_pickpocket);
};

func void dia_jack_pickpocket_back()
{
	Info_ClearChoices(dia_jack_pickpocket);
};


instance DIA_JACK_GREET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 4;
	condition = dia_jack_greet_condition;
	information = dia_jack_greet_info;
	important = TRUE;
};


func int dia_jack_greet_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jack_greet_info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Zdrav�m, ty suchozemsk� kryso, vypad� to, �e z�st�v� tady.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//Jsi n�jakej pobledlej kolem �aber.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Nic si z toho ned�lej, k�mo. V�echno, co pot�ebuje�, je dobr� siln� mo�sk� vzduch.
};


instance DIA_JACK_JOB(C_INFO)
{
	npc = vlk_444_jack;
	nr = 5;
	condition = dia_jack_job_condition;
	information = dia_jack_job_info;
	description = "Co tady d�l�?";
};


func int dia_jack_job_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_greet))
	{
		return TRUE;
	};
};

func void dia_jack_job_info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//D��v, kdy� jsem byl je�t� mladej, jsem hodn� �asu tr�vil na mo�i a pro�il spoustu bou��.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//P�ed mnoha lety jsem se tu usadil a u� p�knou ��dku let se star�m o khorinisk� maj�k.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//��dnej velkej k�eft. V�bec ne. Ale ta star� v� mi tak p�irostla k srdci, �e u� se v n� c�t�m jako doma.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//U� jsem tam naho�e nebyl celou v��nost.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Pro� ne?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Od t� doby, co m�j maj�k obsadili n�jac� budi�kni�emov�, jsem nem�l odvahu se tam dostat bl� ne� na dvacet stop. V�n� hrozn� ch�tra.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Jsou to trestanci z Hornick�ho �dol�, v�ak v�.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//Jednou to na druh� stran� hor po��dn� bouchlo a pak zamo�ili celou zem jako kobylky. Te� se ukr�vaj� �pln� v�ude, dokonce i v mym maj�ku.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//M�m dojem, �e vyhl�ej n�jakou lo�, co by mohli okr�st.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ha! A� to ud�laj. Alespo� vypadnou z moj� v�e.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"Star� mo�sk� vlk Jack se nem��e vr�tit na sv�j maj�k, nebo� jej obsadili bandit�.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "P�ich�z� do m�sta �asto?";
};


func int dia_jack_city_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_job))
	{
		return TRUE;
	};
};

func void dia_jack_city_info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//P�ich�z� do m�sta �asto?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//V�dycky ��k�m, �e m�sto je tak dobr�, jak dobrej je jeho p��stav.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//P��stav je br�na do sv�ta. Tady se v�ichni setk�vaj� a tady v�echno za��n�.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Jakmile je p��stav v h�ji, zbytek m�sta dopadne brzo stejn�.
};


instance DIA_JACK_HARBOR(C_INFO)
{
	npc = vlk_444_jack;
	nr = 70;
	condition = dia_jack_harbor_condition;
	information = dia_jack_harbor_info;
	permanent = TRUE;
	description = "�ekni mi n�co o p��stavu.";
};


func int dia_jack_harbor_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_harbor_info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//�ekni mi n�co o p��stavu.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Khorinissk� p��stav u� nen�, co b�val.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Nen� tu nic ne� ch�tra, co se poflakuje kolem, u� sem nep�iplouvaj� ��dn� lod� a obchod je mrtvej. Tenhle p��stav je odepsanej.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"Pro� u� sem nep�iplouvaj� ��dn� lod�?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"Co mysl� tou ch�trou?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"Tak pro� neodejde�?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Pro� u� sem nep�iplouvaj� ��dn� lod�?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//V�ichni ��kaj�, �e a� v�lka skon��, vr�t� se v�echno do starejch kolej�. Jsou to jenom kecy.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//��k�m ti, n�mo�n�k pozn�, kdy� to jde s m�stem z kopce.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//N�mo�n�k to c�t� v krvi. A �eknu ti, zapome� na p��stav, ten u� to m� spo��tan�.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Co mysl� tou ch�trou?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Koukni na n�, l�n� sebranka. V�t�ina z nich v�bec netu��, co je pr�ce. V�echno, co svedou, je chlastat celej den a posledn� prachy utratit v bordelu.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//��k�m ti, dr� se od nich d�l.
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Tak pro� neodejde�?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Nikdo si v tuhle dobu nevezme na palubu takov�ho star�ho mo�sk�ho vlka, jako jsem j�.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//V�t�ina lid� si mysl�, ze starej Jack m� ve svejch prohnilejch kostech dnu.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//A? Je to pravda?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Nesmysl. Jakmile m�m palubu pod nohama, c�t�m se jako mladej Jura.
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "Ti banditi, co zabrali tv�j maj�k, jsou pry�.";
};


func int dia_jack_banditenweg_condition()
{
	if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Ti banditi, co zabrali tv�j maj�k, jsou pry�.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Je to v�n� pravda? Kone�n� se m��u vr�tit ke sv� pr�ci.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Poj� se mnou na maj�k. Naho�e je kr�snej v�hled na mo�e.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};


instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_444_jack;
	nr = 8;
	condition = dia_jack_lighthousefree_condition;
	information = dia_jack_lighthousefree_info;
	permanent = TRUE;
	description = "M� tady p�knej maj�k.";
};


func int dia_jack_lighthousefree_condition()
{
	if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//M� tady p�knej maj�k.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//D�ky. Prost� vyjdi po v�ech t�ch schodech nahoru a vychutnej si ten n�dhern� v�hled, chlap�e. Jako doma.
};


instance DIA_JACK_KAP3_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap3_exit_condition;
	information = dia_jack_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jack_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP4_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap4_exit_condition;
	information = dia_jack_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jack_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP5_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap5_exit_condition;
	information = dia_jack_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jack_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 51;
	condition = dia_jack_bemycaptain_condition;
	information = dia_jack_bemycaptain_info;
	permanent = TRUE;
	description = "Necht�l by ses vr�tit na mo�e?";
};


func int dia_jack_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Necht�l by ses vr�tit na mo�e?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Dal bych pravou ruku za to, kdyby m� je�t� jednou n�kdo najal na velkej �kuner.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Ale pro takov�ho star�ho mo�sk�ho vlka to nen� tak snadn�, hochu. A stejn�, kdo by se pak staral o maj�k?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Nevad�. Byl to jen n�pad.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Pot�ebuju tvoje n�mo�nick� zku�enosti.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Pot�ebuju tvoje n�mo�nick� zku�enosti.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//U v�ech rozvrzanejch fo�en. Co m� za lubem, chlap�e? Nehodl� si vyzkou�et palubu kr�lovsk� v�le�n� gal�ry, �e ne?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Kdo v�?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(sm�ch) To by mohlo n�co znamenat. No dobr�. Nem��u tu jen tak nechat m�j maj�k. Mmh. Co s t�m ud�l�me?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Ze star�ho n�mo�n�ka Jacka z p��stavu m��e b�t dobr� kapit�n - nejd��v ale mus�m sehnat n�koho, kdo mu ohl�d� maj�k.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Nevad�. Byl to jen n�pad.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Co kdy� ti n�koho p�ivedu...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//Co kdy� ti se�enu n�koho, kdo se zat�m o maj�k postar�?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//To nen� �patnej n�pad, hochu. A j� takov�ho �lov�ka zn�m.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Kov�� Harad m� u�edn�ka jm�nem Brian. U� jsem s n�m hodn�kr�t mluvil.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Cht�l bych sv�j maj�k sv��it pr�v� jemu. Myslim, �e je pro to ten pravej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//B� si s n�m promluvit. Mo�n� budeme m�t �t�st� a ten kluk n�m pom��e.
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Nevad�. Byl to jen n�pad.
	Info_ClearChoices(dia_jack_bemycaptain);
};


instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_444_jack;
	nr = 52;
	condition = dia_jack_bemycaptain2_condition;
	information = dia_jack_bemycaptain2_info;
	description = "Co se t��e Briana...";
};


func int dia_jack_bemycaptain2_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain2_info()
{
	if(Npc_IsDead(brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian je mrtv�.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Ach. Tohle jsou stra�n� �asy. A byli jsme tak dobr� k�mo�i.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Brian se odte� bude starat o tv�j maj�k.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Doufal jsem, �e to �ekne�.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Je�t� po��d m� pot�ebuje�?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Pod�v�me se, jestli je ten kluk k n��emu dobrej.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_444_jack;
	nr = 53;
	condition = dia_jack_bemycaptain3_condition;
	information = dia_jack_bemycaptain3_info;
	description = "Bu� m�m kapit�nem.";
};


func int dia_jack_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Bu� m�m kapit�nem.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Proplul jsem sedmero mo��, hochu, ale je�t� nikdy jsem nebyl kapit�nem lodi.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//O navigaci nev�m v�bec nic. M�l by ses toho ujmout s�m.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Ud�l�m, co bude v m�ch sil�ch.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//Tak mi uka� svou lo� i s pos�dkou. A v� ty v�bec, kam m�me nam��eno? Myslim, jestli m� n�mo�n� mapu?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Po�kej na m� v p��stavu. O zbytek se nestarej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Kdy� to ��k�.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JACKISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JACK_LOSFAHREN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_losfahren_condition;
	information = dia_jack_losfahren_info;
	permanent = TRUE;
	description = "Dobr�. Tak vyplouv�me.";
};


func int dia_jack_losfahren_condition()
{
	if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_losfahren_info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Dobr�. Tak vyplouv�me.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//V�echno je v po��dku. Tak mi uka� tu n�mo�n� mapu.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//To bude p�knej v�let. Douf�m, �e se tam dostaneme v jednom kuse.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//M� opravdu v�echno, co pot�ebuje�? Nebudeme se vracet jen proto, �e jsi n�co zapomn�l.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Jestli se� si jistej, �e m�me opravdu v�echno, b� do kapit�nsk� kajuty a dej si dvacet. Bude se ti to hodit.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Kl�dek, chlap�e. Je�t� jsem ten �kopek nevid�l. Takhle to nepude.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Nejd��v bude� pot�ebovat kompletn� pos�dku s minim�ln� p�ti chlapama, voln� p��stup na lo� a n�mo�n� mapu. Jinak na to zapome�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_perm5_notcaptain_condition;
	information = dia_jack_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Co bude pak?";
};


func int dia_jack_perm5_notcaptain_condition()
{
	if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_jack_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//Co bude pak?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//Rozmyslel jsem si to. Z�stanu tady a budu rad�j hl�dat sv�j maj�k.
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP6_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap6_exit_condition;
	information = dia_jack_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jack_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

