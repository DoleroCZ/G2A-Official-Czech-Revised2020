
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Zdrav�m, jsem tu nov�.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Neber si to nijak zle, ale nen� mi do �e�i - jsem �pln� hotovej.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Jsi stra�n� zam�stnan�, co?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Tak to m� pravdu. Bennet d�l� tolik zbran�, �e je ani nesta��m le�tit.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o farm�?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Co mi m��e� ��ct o farm�?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Tohle je Onarova farma.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//To velk� staven� je jeho d�m. Jedno k��dlo p�enechal �old�k�m.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//My roln�ci m�me ka�d� sv� l��ko ve stodole.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(p�ekotn�) Ale j� jsem spokojen�, je dobr� m�t lidi na hl�d�n� farmy.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Tady za mnou je kuchy�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Kuchy� je v t� budov�, co m� zep�edu kov�rnu.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Mo�n� bude� m�t �t�st� a Thekla pro tebe najde n�co k j�dlu.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "A co ti �oldn��i?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//A co ti �oldn��i?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar je najal, aby dr�eli domobranu zp�tky.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Ale tak� hl�daj� farmu, ovce a farm��e.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Tak�e ani nepomysli na to, �e bys mohl n�co ukr�st nebo se hrabat v n��� truhle.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Jen �ekaj� na p��le�itost, jak t� vy��dit.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Mohu si od tebe koupit n�jak� zbran�?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Mohu si od tebe koupit n�jak� zbran�?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//Moc toho nem�m. Skoro v�echny me�e a sekery jsme dali do Onarova domu.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Pro� nepracuje�?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Pro� nepracuje�?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Tys to je�t� nesly�el? Paladinov� zav�eli Benneta.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Kov��e Benneta uv�znili m�st�t� paladinov�.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//No, byli jsme ve m�st� nakupovat, kdy� v�ichni najednou za�ali k�i�et. A n�kdo za�val: T�mhle jsou, chy�te je!
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//Chlape, jak j� byl vyd�enej! Vzal jsem nohy na ramena a ut�kal, jako by mi v pat�ch byl ��bel s�m.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Bennet byl hned za mnou. Nev�m, co se stalo, ale kdy� jsem se dostal z m�sta, u� jsem ho nikde nevid�l.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Musel se mi ztratit n�kde ve m�st�.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "Tak pro� Benneta zav�eli?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Tak pro� Benneta zav�eli?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Za vra�du! Bennet byl obvin�n z vra�dy paladina. Takovej nesmysl. Byl jsem celou dobu s n�m.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Tak pro� nezajde� do m�sta a celou tu v�c nevysv�tl�?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//�oupnou m� do basy jako komplice. Ne, za t�hle situace tam rozhodn� nep�jdu.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Situace?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//V�ak v�, Onar a m�sto. To by dopadlo �patn�.
	b_logentry(TOPIC_RESCUEBENNET,"Bennet pr� zavra�dil paladina. Jeho u�edn�k Hodges ale tvrd�, �e je nevinn�. Ov�em nedovolil si vstoupit do m�sta.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "Co na to �oln��i tady na farm�?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//Co na to �oldn��i tady na farm�?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Jasn�, �e nev�m, co maj za lubem, ale n�kter� z nich jsou fakt vyto�en�.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//To je pochopiteln�.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Kdyby to bylo jen na nich, rad�ji by hned napadli m�sto, aby dostali Benneta ven.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Promluv si s Leem, t�eba ti n�co najde.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

