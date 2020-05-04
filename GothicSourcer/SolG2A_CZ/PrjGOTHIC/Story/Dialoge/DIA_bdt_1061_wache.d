
instance DIA_1061_WACHE_EXIT(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 999;
	condition = dia_1061_wache_exit_condition;
	information = dia_1061_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1061_wache_exit_condition()
{
	return TRUE;
};

func void dia_1061_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_WACHE_HALLO(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 1;
	condition = dia_1061_wache_hallo_condition;
	information = dia_1061_wache_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1061_wache_hallo_condition()
{
	return TRUE;
};

func void dia_1061_wache_hallo_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//St�j - tudy nem��e� proj�t.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//Cht�l bych mluvit s va��m ��fem.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//(ironicky) �, j� v�m, ty chce� mluvit s m�m ��fem. Tak to t� SAMOZ�EJM� nech�m proj�t.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//(smrteln� v�n�) Ale jen v tom p��pad�, �e zn� jeho jm�no. Proto�e jestli ne, tak t� budu muset zab�t! Jasn�?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Lee",dia_1061_wache_hallo_lee);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_1061_wache_hallo,"Dexter",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Diego",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"Nem�m tu�en�.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Fajn, co na to m�m ��ct? Pr�v� jsi propadl �ivotem, chlape!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Dexter.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//Dobr�... H�d�m, �e ��fa zn�. Fajn, dovol�m ti proj�t. Ale varuju t�.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//K�ivej pohyb a nedostane� se odsud vcelku!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//Tak�e se zhluboka nadechni a nech tady v�echny svoje zbran�. Dextera nejde� v dom�.
	KNOWS_DEXTER = TRUE;
	banditguard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Diego.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Spr�vn�!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//Ne, to byl jen �ert. Nem� ani pon�t�, kdo je m�j ��f.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//Tak�e nevid�m ��dnej d�vod, pro� bych t� m�l nechat na�ivu.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//Nem�m tu�en�.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//Tak to se� mrtvej ignorant.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_1061_WACHE_PERM(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 2;
	condition = dia_1061_wache_perm_condition;
	information = dia_1061_wache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_1061_wache_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_1061_wache_perm_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Pamatuj, bu� v pohod� a dostane� se odsud �iv�.
	AI_StopProcessInfos(self);
};

