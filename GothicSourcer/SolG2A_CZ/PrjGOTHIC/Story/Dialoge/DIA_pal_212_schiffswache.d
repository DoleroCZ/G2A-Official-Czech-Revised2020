
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
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Jsme vyslanci kr�le Rhobara, slu�ebn�ci Innosovi, jinak tak� �e�en� paladini.
};


instance DIA_PAL_212_SCHIFFSWACHE_WASMACHSTDU2(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_wasmachstdu2_condition;
	information = dia_pal_212_schiffswache_wasmachstdu2_info;
	description = "Co tady d�l�?";
};


func int dia_pal_212_schiffswache_wasmachstdu2_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_wasmachstdu2_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Co tady d�l�?
	if(MIS_SHIPISFREE == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Na tu lo� nevstoup�. To je jedin�, co pot�ebuje� v�d�t.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Byli jsme sem postaveni jako str�e. Nikdo nesm� na lo� vstoupit. Je n�m l�to, ale ani ty.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Mrh�te m�m �asem. Mnohem rad�ji bych byl s va�imi bratry v Hornick�m �dol�.
	};
	AI_StopProcessInfos(self);
};

