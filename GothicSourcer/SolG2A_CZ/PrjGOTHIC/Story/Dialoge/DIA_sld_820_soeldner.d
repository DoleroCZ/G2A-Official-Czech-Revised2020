
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//Kam si mysl�, �e jde�?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//Dovnit�, samoz�ejm�.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar n�m neplat� za to, �e sem pou�t�me takov� otrapy jako ty!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Nechci tu vid�t nikoho z domobrany! - To jsou jeho vlastn� slova.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Chci mluvit s Leem!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Co po n�m chce�?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"J� se s n�m zn�m u� hrozn� dlouho.",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"Chci se p�idat k �oldn���m!",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee je v prav�m k��dle. A� t� ani nenapadne zabloudit n�kam jinam!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Chci se p�idat k �oldn���m!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//�, dal�� voj�k, kter�ho m��eme ob�tovat! Tak poj� d�l!
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Ale hlavn� nech na pokoji Onara! Nem� r�d, kdy� na n�j n�kdo mluv� bez vyzv�n�. Zvl᚝ kdy� jde o n�koho jako ty.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//J� se s n�m zn�m u� hrozn� dlouho.
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//TY �e jsi Lee�v k�mo�? Nev���m ti ani slovo! Ale klidn� poj� d�l - jestli se na tebe nebude pamatovat, tak to pozn� hned! (sm�je se)
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//B� d�l, jestli chce�, ale sv� �v�sty si nech pro sebe.
	AI_StopProcessInfos(self);
};

