
instance DIA_PAL_212_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_212_schiffswache;
	nr = 999;
	condition = dia_pal_212_schiffswache_exit_condition;
	information = dia_pal_212_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_212_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_212_SCHIFFSWACHE_WERSEIDIHR(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_werseidihr_condition;
	information = dia_pal_212_schiffswache_werseidihr_info;
	description = "Kdo jste?";
};


func int dia_pal_212_schiffswache_werseidihr_condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pal_212_schiffswache_werseidihr_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Kdo jste?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Jsme vyslanci krále Rhobara, služebníci Innosovi, jinak také øeèení paladini.
};


instance DIA_PAL_212_SCHIFFSWACHE_WASMACHSTDU2(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_wasmachstdu2_condition;
	information = dia_pal_212_schiffswache_wasmachstdu2_info;
	description = "Co tady dìláš?";
};


func int dia_pal_212_schiffswache_wasmachstdu2_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_wasmachstdu2_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Co tady dìláš?
	if(MIS_SHIPISFREE == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Na tu loï nevstoupíš. To je jediné, co potøebuješ vìdìt.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Byli jsme sem postaveni jako stráže. Nikdo nesmí na loï vstoupit. Je nám líto, ale ani ty.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Mrháte mým èasem. Mnohem radìji bych byl s vašimi bratry v Hornickém údolí.
	};
	AI_StopProcessInfos(self);
};

