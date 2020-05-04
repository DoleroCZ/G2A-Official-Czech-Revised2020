
instance DIA_STRF_1107_EXIT(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 999;
	condition = dia_strf_1107_exit_condition;
	information = dia_strf_1107_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_1107_exit_condition()
{
	return TRUE;
};

func void dia_strf_1107_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_finger_condition;
	information = dia_strf_1107_finger_info;
	important = TRUE;
};


func int dia_strf_1107_finger_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_1107_finger_info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Od m�ch hrnc� ruce pry�! Nikdo se m�ch hrnc� nesm� ani dotknout, jasn�?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Jsem zodpov�dn� za j�dlo, a to znamen�, �e nikdo jin� tady nem� co d�lat! Douf�m, �e jsem se vyj�d�il jasn�!
};


instance DIA_STRF_1107_COOK(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_cook_condition;
	information = dia_strf_1107_cook_info;
	description = "Kdo z tebe ud�lal kucha�e?";
};


func int dia_strf_1107_cook_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cook_info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kdo z tebe ud�lal kucha�e?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Byl to velitel Garond. Ne� jsem stal trestancem, b�val jsem kucha�em U divo��ka.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//A za co t� zav�eli?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Bylo to takov� men�� nedorozum�n� mezi hostem, sek��kem na maso a mnou.
};


instance DIA_STRF_1107_PERM(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 900;
	condition = dia_strf_1107_perm_condition;
	information = dia_strf_1107_perm_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_strf_1107_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//N�co nov�ho?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jestli se chce� dozv�d�t n�jak� novinky, promluv si s ryt��i. J� tady jen va��m.
};

