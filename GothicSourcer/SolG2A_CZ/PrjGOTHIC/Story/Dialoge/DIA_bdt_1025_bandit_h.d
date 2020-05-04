
instance DIA_NAME_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 999;
	condition = dia_name_bandit_exit_condition;
	information = dia_name_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_name_bandit_exit_condition()
{
	return TRUE;
};

func void dia_name_bandit_exit_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};


instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_schafbleibthier_condition;
	information = dia_name_bandit_schafbleibthier_info;
	important = TRUE;
};


func int dia_name_bandit_schafbleibthier_condition()
{
	return TRUE;
};

func void dia_name_bandit_schafbleibthier_info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00");	//Hej, ty vandr�ku. Jak jsi p�i�el k t� ovci?
	if(MIS_AKIL_SCHAFDIEBE == 0)
	{
		AI_Output(other,self,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01");	//Ovce? Jak� ovce?
		AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02");	//Hodnej kluk. A te� zmizni. Nem� tu co pohled�vat.
	};
};


instance DIA_NAME_BANDIT_SCHAFKLAU(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_schafklau_condition;
	information = dia_name_bandit_schafklau_info;
	important = TRUE;
};


func int dia_name_bandit_schafklau_condition()
{
	if(Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01") < (hero.aivar[AIV_LASTDISTTOWP] - 50))
	{
		return TRUE;
	};
};

func void dia_name_bandit_schafklau_info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SchafKlau_09_00");	//Hej! Mluv�m s tebou.
	Info_AddChoice(dia_name_bandit_schafklau,DIALOG_ENDE,dia_name_bandit_schafklau_weiter);
};

func void dia_name_bandit_schafklau_weiter()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	bdt_1025_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1026_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};


instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_rueckdasschafraus_condition;
	information = dia_name_bandit_rueckdasschafraus_info;
	permanent = TRUE;
	description = "Ukradl jsi tu ovci z Akilovy farmy.";
};


func int dia_name_bandit_rueckdasschafraus_condition()
{
	if((MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int dia_name_bandit_rueckdasschafraus_noperm;

func void dia_name_bandit_rueckdasschafraus_info()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00");	//Ukradl jsi tu ovci z Akilovy farmy.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01");	//A co? Co s t�m jako bude� d�lat?
	Info_ClearChoices(dia_name_bandit_rueckdasschafraus);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"Nic. Co je pro m� n�jak� hloup� ovce?",dia_name_bandit_rueckdasschafraus_nichts);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"Dej mi tu ovci, nebo ti po��dim slu�ivej monokl.",dia_name_bandit_rueckdasschafraus_schaf);
};

func void dia_name_bandit_rueckdasschafraus_schaf()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00");	//Dej mi tu ovci, nebo ti po��dim slu�ivej monokl.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01");	//Tak to si dej bacha, hochu. Aby ses z toho dostal, tak by ti muselo pom�hat peklo samo.
	AI_StopProcessInfos(self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NOPERM = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	bdt_1025_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1026_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void dia_name_bandit_rueckdasschafraus_nichts()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00");	//Nic takov�ho. Co je pro m� n�jak� hloup� ovce?
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01");	//Tak, neroz�iluj m�. Zmizni!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};

