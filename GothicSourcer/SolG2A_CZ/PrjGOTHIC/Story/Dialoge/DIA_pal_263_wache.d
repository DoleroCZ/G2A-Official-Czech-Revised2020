
instance DIA_PAL_263_EXIT(C_INFO)
{
	npc = pal_263_wache;
	nr = 999;
	condition = dia_pal_263_exit_condition;
	information = dia_pal_263_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_263_exit_condition()
{
	return TRUE;
};

func void dia_pal_263_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_INFO)
{
	npc = pal_263_wache;
	nr = 2;
	condition = dia_pal_263_perm_condition;
	information = dia_pal_263_perm_info;
	permanent = TRUE;
	description = "Podej hlášení, vojáku!";
};


func int dia_pal_263_perm_condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_pal_263_perm_info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Podej hlášení, vojáku!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Ano, pane! Držíme pozice dle rozkazù. Žádné další ztráty. Proviant dochází, skøeti se drží zpátky.
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Poslední draèí útok kompletnì znièil vnìjší opevnìní. Od té doby se ale nic zvláštního nestalo.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//Dobrá, pokraèuj.
};


instance DIA_PAL_263_PERM_OTH(C_INFO)
{
	npc = pal_263_wache;
	nr = 2;
	condition = dia_pal_263_perm_oth_condition;
	information = dia_pal_263_perm_oth_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_pal_263_perm_oth_condition()
{
	if((hero.guild != GIL_MIL) || (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_pal_263_perm_oth_info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//Máme situaci pod kontrolou. Nedìlej si vrásky, civile. Všechno bude v poøádku.
};

