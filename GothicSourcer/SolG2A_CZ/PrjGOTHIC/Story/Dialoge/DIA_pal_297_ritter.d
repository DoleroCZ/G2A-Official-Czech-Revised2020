
instance DIA_PAL_297_EXIT(C_INFO)
{
	npc = pal_297_ritter;
	nr = 999;
	condition = dia_pal_297_exit_condition;
	information = dia_pal_297_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_297_exit_condition()
{
	return TRUE;
};

func void dia_pal_297_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 2;
	condition = dia_pal_297_trespas_condition;
	information = dia_pal_297_trespas_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_pal_297_trespas_condition()
{
	return TRUE;
};

func void dia_pal_297_trespas_info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak se vede?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Okol� je hodn� nebezpe�n�, tak�e by ses m�l mo�n� vr�tit - rozhodn� nechceme, aby se ti n�co stalo.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Vstoupit do �dol� chce hodn� odvahy. Alespo� �e u sebe m� dostatek l��iv�ch lektvar�.
	};
};


instance DIA_ADDON_PAL_297_RANGERBANDITS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 5;
	condition = dia_addon_pal_297_rangerbandits_condition;
	information = dia_addon_pal_297_rangerbandits_info;
	description = "Pro�li tudy v posledn� dob� n�jac� banditi?";
};


func int dia_addon_pal_297_rangerbandits_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_pal_297_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Pro�li tudy v posledn� dob� n�jac� banditi?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//Nev�m o �em to mluv�. Za tu dobu, co jsme tu na str�i tudy nikdo nepro�el. A u� v�bec ne nikdo z t�ch v�iv�ch bandit�.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Farm��i na ot�zky moc odpov�dat necht�j�. Mo�n� n�co zahl�dli.
};

