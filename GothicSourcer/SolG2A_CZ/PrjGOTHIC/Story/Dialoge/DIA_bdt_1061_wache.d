
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
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//Stùj - tudy nemùžeš projít.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//Chtìl bych mluvit s vaším šéfem.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//(ironicky) Ó, já vím, ty chceš mluvit s mým šéfem. Tak to tì SAMOZØEJMÌ nechám projít.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//(smrtelnì vážnì) Ale jen v tom pøípadì, že znáš jeho jméno. Protože jestli ne, tak tì budu muset zabít! Jasný?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Lee",dia_1061_wache_hallo_lee);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_1061_wache_hallo,"Dexter",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Diego",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"Nemám tušení.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Fajn, co na to mám øíct? Právì jsi propadl životem, chlape!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Dexter.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//Dobrá... Hádám, že šéfa znáš. Fajn, dovolím ti projít. Ale varuju tì.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//Køivej pohyb a nedostaneš se odsud vcelku!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//Takže se zhluboka nadechni a nech tady všechny svoje zbranì. Dextera nejdeš v domì.
	KNOWS_DEXTER = TRUE;
	banditguard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Diego.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Správnì!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//Ne, to byl jen žert. Nemáš ani ponìtí, kdo je mùj šéf.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//Takže nevidím žádnej dùvod, proè bych tì mìl nechat naživu.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//Nemám tušení.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//Tak to seš mrtvej ignorant.
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
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Pamatuj, buï v pohodì a dostaneš se odsud živý.
	AI_StopProcessInfos(self);
};

