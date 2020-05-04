
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
	description = "Podej hl�en�, voj�ku!";
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
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Podej hl�en�, voj�ku!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Ano, pane! Dr��me pozice dle rozkaz�. ��dn� dal�� ztr�ty. Proviant doch�z�, sk�eti se dr�� zp�tky.
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Posledn� dra�� �tok kompletn� zni�il vn�j�� opevn�n�. Od t� doby se ale nic zvl�tn�ho nestalo.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//Dobr�, pokra�uj.
};


instance DIA_PAL_263_PERM_OTH(C_INFO)
{
	npc = pal_263_wache;
	nr = 2;
	condition = dia_pal_263_perm_oth_condition;
	information = dia_pal_263_perm_oth_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
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
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//M�me situaci pod kontrolou. Ned�lej si vr�sky, civile. V�echno bude v po��dku.
};

