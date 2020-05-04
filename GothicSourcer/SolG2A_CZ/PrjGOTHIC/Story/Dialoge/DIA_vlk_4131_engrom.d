
instance DIA_ENGROM_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_exit_condition;
	information = dia_engrom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_engrom_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_HALLO(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 5;
	condition = dia_engrom_hallo_condition;
	information = dia_engrom_hallo_info;
	description = "Jak se vede?";
};


func int dia_engrom_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_engrom_hallo_info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Mizernì!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Mmh!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co mùžu øíct. Celé dny nemùžeš koukat na nic jiného než na tuhle zatracenou øeku.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Nalevo se flákají skøeti, napravo banditi a každý den jím akorát èíhavèí maso. Víš, už mi to všecko leze krkem.
};


instance DIA_ENGROM_WHATABOUTLEAVING(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_whataboutleaving_condition;
	information = dia_engrom_whataboutleaving_info;
	description = "Pøemýšlel jsi nìkdy o tom, že odsud odejdeš?";
};


func int dia_engrom_whataboutleaving_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_whataboutleaving_info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Pøemýšlel jsi nìkdy o tom, že odsud odejdeš?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//No jasnì, to pøeci není problém!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Nejdøív se prosekám tlupami skøetù, pozdravím všecky ty ostatní pøíšery, co tu všude obcházejí, a pak prostì projdu prùsmykem!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To je pøece sranda!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Já se sem ale taky dostal.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Chceš mi nakukat, žes prostì prošel prùsmykem?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Víceménì ano!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Tak to jsi mìl teda kliku. Dokud tu bude všechno vzhùru nohama, ani se odsud nehnu.
};


instance DIA_ENGROM_JAGD(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_jagd_condition;
	information = dia_engrom_jagd_info;
	permanent = TRUE;
	description = "Jak jde lov?";
};


func int dia_engrom_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_jagd_info()
{
	b_wasmachtjagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Jedinou útìchu vidím v lovu, ale rád bych tu nìkdy vidìl i nìco jiného než poøád ty nechutný èíhavce.
};


instance DIA_ENGROM_KAP3_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap3_exit_condition;
	information = dia_engrom_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_engrom_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP4_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap4_exit_condition;
	information = dia_engrom_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_engrom_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_B_NPCOBSESSEDBYDMT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 32;
	condition = dia_engrom_b_npcobsessedbydmt_condition;
	information = dia_engrom_b_npcobsessedbydmt_info;
	description = "Tak co, jde to dobøe?";
};


func int dia_engrom_b_npcobsessedbydmt_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_b_npcobsessedbydmt_info()
{
	MIS_TABIN_LOOKFORENGROM = LOG_SUCCESS;
	b_npcobsessedbydmt(self);
};


instance DIA_ENGROM_BESSEN(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 55;
	condition = dia_engrom_bessen_condition;
	information = dia_engrom_bessen_info;
	permanent = TRUE;
	description = "Posedlo tì zlo.";
};


func int dia_engrom_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_bessen_info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Posedlo tì zlo.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Dovol mi, abych ti pomohl.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(køièí) Nesahej na mì!
	b_npcclearobsessionbydmt(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,zs_flee,0,"");
};


instance DIA_ENGROM_KAP5_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap5_exit_condition;
	information = dia_engrom_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_engrom_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP6_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap6_exit_condition;
	information = dia_engrom_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_engrom_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_PICKPOCKET(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 900;
	condition = dia_engrom_pickpocket_condition;
	information = dia_engrom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_engrom_pickpocket_condition()
{
	return c_beklauen(10,5);
};

func void dia_engrom_pickpocket_info()
{
	Info_ClearChoices(dia_engrom_pickpocket);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_BACK,dia_engrom_pickpocket_back);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_PICKPOCKET,dia_engrom_pickpocket_doit);
};

func void dia_engrom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_engrom_pickpocket);
};

func void dia_engrom_pickpocket_back()
{
	Info_ClearChoices(dia_engrom_pickpocket);
};

