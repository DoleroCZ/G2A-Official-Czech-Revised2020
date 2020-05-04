
instance DIA_PAL_270_EXIT(C_INFO)
{
	npc = pal_270_ritter;
	nr = 999;
	condition = dia_pal_270_exit_condition;
	information = dia_pal_270_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_270_exit_condition()
{
	return TRUE;
};

func void dia_pal_270_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_OUT(C_INFO)
{
	npc = pal_270_ritter;
	condition = dia_ritter_out_condition;
	information = dia_ritter_out_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_ritter_out_noperm;

func int dia_ritter_out_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ritter_out_info()
{
	if(DIA_RITTER_OUT_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_00");	//Pøišel jsi z Khorinisu, že? Až bude po všem, vrátím se tam.
		DIA_RITTER_OUT_NOPERM = TRUE;
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_01");	//Je to obrovská úleva, sire, že tì máme po boku.
	}
	else
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_02");	//Zvládneme to. Dopravíme rudu do Khorinisu a budou nás oslavovat!
	};
};

