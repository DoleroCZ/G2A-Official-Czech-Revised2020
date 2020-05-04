
instance DIA_PARLAF_EXIT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 999;
	condition = dia_parlaf_exit_condition;
	information = dia_parlaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlaf_exit_condition()
{
	return TRUE;
};

func void dia_parlaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARLAF_HALLO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 1;
	condition = dia_parlaf_hallo_condition;
	information = dia_parlaf_hallo_info;
	description = "Hej, jak se m�?";
};


func int dia_parlaf_hallo_condition()
{
	return TRUE;
};

func void dia_parlaf_hallo_info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Hej, jak se m�?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//Jak si mysl� �e se m�m? Cel� dny tr�v�m u brousku a brous�m me�e.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//A v�era n�m Engor je�t� k tomu zase zmen�il p��d�l j�dla. Kdy� to takhle p�jde d�l, za chv�li pom�eme hlady.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//Nebo n�s zabijou sk�eti. ��dn� p��jemn� vyhl�dky se nekonaj�.
	};
};


instance DIA_PARLAF_ENGOR(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_engor_condition;
	information = dia_parlaf_engor_info;
	description = "Kdo je ten Engor?";
};


func int dia_parlaf_engor_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_engor_info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Kdo je ten Engor?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Engor se star� o z�sobov�n� a rozd�luje potraviny - p��d�ly jsou ale ka�d� t�den men�� a men��.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//No jasn�, m��e� s n�m smlouvat, ale pot�ebuje� k tomu tvrdou zlatou m�nu.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//A ty to nem��e� zat�hnout?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//Za sv�j mizern� �old si m��u koupit leda tak p�r pitom�ch tu��n�!
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_TRADER_OC,"Engor se star� o z�sobov�n� hradu a bokem taky trochu obchoduje.");
};


instance DIA_PARLAF_WO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_wo_condition;
	information = dia_parlaf_wo_info;
	permanent = FALSE;
	description = "Kde bych na�el toho Engora?";
};


func int dia_parlaf_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_parlaf_engor) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_wo_info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Kde bych na�el toho Engora?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//V ryt��sk�m s�dle. Sta�� proj�t otev�en�m pr�chodem u kov�rny.
};


instance DIA_PARLAF_HUNGRIG(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_hungrig_condition;
	information = dia_parlaf_hungrig_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_parlaf_hungrig_condition()
{
	if((MIS_ENGOR_BRINGMEAT != LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_hungrig_info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Ten zatracen� Engor by m�l vyd�vat v�c j�dla!
};


instance DIA_PARLAF_SATT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_satt_condition;
	information = dia_parlaf_satt_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_parlaf_satt_condition()
{
	if(((MIS_ENGOR_BRINGMEAT == LOG_SUCCESS) || Npc_IsDead(engor)) && Npc_KnowsInfo(hero,dia_parlaf_hallo))
	{
		return TRUE;
	};
};


var int dia_parlaf_satt_onetime;

func void dia_parlaf_satt_info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Co se stalo?
	if((DIA_PARLAF_SATT_ONETIME == FALSE) && (Npc_IsDead(engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Engor vydal nov� p��d�ly masa. U� bylo na�ase.
		DIA_PARLAF_SATT_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Tv�j p��jezd je jedinou novinkou, kter� je opravdu nov�.
	};
};


instance DIA_PARLAF_PICKPOCKET(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 900;
	condition = dia_parlaf_pickpocket_condition;
	information = dia_parlaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_parlaf_pickpocket_condition()
{
	return c_beklauen(34,12);
};

func void dia_parlaf_pickpocket_info()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_BACK,dia_parlaf_pickpocket_back);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_PICKPOCKET,dia_parlaf_pickpocket_doit);
};

func void dia_parlaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parlaf_pickpocket);
};

func void dia_parlaf_pickpocket_back()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
};

