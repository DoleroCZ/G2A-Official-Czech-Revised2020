
instance DIA_PAL_269_EXIT(C_INFO)
{
	npc = pal_269_ritter;
	nr = 999;
	condition = dia_pal_269_exit_condition;
	information = dia_pal_269_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_269_exit_condition()
{
	return TRUE;
};

func void dia_pal_269_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_HERO(C_INFO)
{
	npc = pal_269_ritter;
	condition = dia_pal_269_hero_condition;
	information = dia_pal_269_hero_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_269_hero_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_ritter_hero_noperm;

func void dia_pal_269_hero_info()
{
	AI_Output(self,other,"DIA_Ritter_HERO_04_00");	//Tv�j p��chod je znamen�m pro n�s v�echny. Dod�v� n�m to odvahu.
	if(DIA_RITTER_HERO_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_HERO_04_01");	//V�me, �e na n�s na�i spolubojovn�ci z m�sta nezapomn�li. Innosovo oko na n�s dohl��.
		AI_Output(self,other,"DIA_Ritter_HERO_04_02");	//A jestli sk�eti a draci vtrhnou na na�e br�ny, postav�me se jim hrd�, a� u� n�m bude souzeno p�e��t nebo zem��t.
		DIA_RITTER_HERO_NOPERM = TRUE;
	};
};

