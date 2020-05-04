
instance DIA_PAL_298_EXIT(C_INFO)
{
	npc = pal_298_ritter;
	nr = 999;
	condition = dia_pal_298_exit_condition;
	information = dia_pal_298_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_298_exit_condition()
{
	return TRUE;
};

func void dia_pal_298_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_PASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_pass_condition;
	information = dia_pal_298_pass_info;
	permanent = FALSE;
	description = "Kam vede tahle cesta?";
};


func int dia_pal_298_pass_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_298_pass_info()
{
	AI_Output(other,self,"DIA_PAL_298_Pass_15_00");	//Kam vede tahle cesta?
	AI_Output(self,other,"DIA_PAL_298_Pass_09_01");	//Za vraty le�� pr�smyk do Hornick�ho �dol�.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_02");	//My jsme na t�hle stran� - na t� druh� se zakopalo n�kolik sk�et�.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_03");	//Bude lep��, kdy� se vr�t� - tudy neprojde�.
};


instance DIA_PAL_298_TRESPASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_trespass_condition;
	information = dia_pal_298_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_298_trespass_condition()
{
	if(MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pal_298_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_00");	//V�n� tam chce� j�t? Ob�v�m se, �e se moc daleko nedostane� - na druh� stran� jsou sk�eti.
	AI_Output(other,self,"DIA_PAL_298_TRESPASS_15_01");	//Pokud do Hornick�ho �dol� vede n�jak� cesta, tak ji najdu.
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_02");	//Dobr�, v tom p��pad� b�. Nech� t� Innos doprov�z�.
};


instance DIA_PAL_298_PERM1(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm1_condition;
	information = dia_pal_298_perm1_info;
	permanent = TRUE;
	description = "A co kdy� to p�ece jenom risknu?";
};


func int dia_pal_298_perm1_condition()
{
	if((KAPITEL == 1) && Npc_KnowsInfo(other,dia_pal_298_pass))
	{
		return TRUE;
	};
};

func void dia_pal_298_perm1_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm1_15_00");	//A co kdy� to p�ece jenom risknu?
	AI_Output(self,other,"DIA_PAL_298_Perm1_09_01");	//Pak zem�e�. Proto tady jsme. Abychom t� uchr�nili p�ed tak hloup�mi n�pady.
};


instance DIA_PAL_298_PERM2(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm2_condition;
	information = dia_pal_298_perm2_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_pal_298_perm2_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pal_298_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm2_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_PAL_298_Perm2_09_01");	//V�echno v po��dku. M�me situaci pod kontrolou.
};

