
instance DIA_GUNNAR_EXIT(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 999;
	condition = dia_gunnar_exit_condition;
	information = dia_gunnar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gunnar_exit_condition()
{
	return TRUE;
};

func void dia_gunnar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int gunnar_hallogesagt;

instance DIA_GUNNAR_HALLO(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 1;
	condition = dia_gunnar_hallo_condition;
	information = dia_gunnar_hallo_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_gunnar_hallo_condition()
{
	return TRUE;
};

func void dia_gunnar_hallo_info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Co se stalo?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Od t� doby, co Onar vyhl�sil, �e si najal �oldn��e, poflakuje se na dvo�e akor�t tak banda ni�emn�ch dareb�k�.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//V�echna ta ch�tra, co nem�la co do huby, se vyrojila z lesa je�t� p�ed t�m, ne� jsme sem p�i�li my.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Ty bastardi v�n� vylejzaj snad odev�ad.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//Tak ty se� te� taky �old�k, hm?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Innos s tebou!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Tady nejsou lidi z m�sta v�t�ni.
	};
	GUNNAR_HALLOGESAGT = TRUE;
};


instance DIA_GUNNAR_EVERYWHERE(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 2;
	condition = dia_gunnar_everywhere_condition;
	information = dia_gunnar_everywhere_info;
	permanent = TRUE;
	description = "Kde se tu vzalo tolik �oldn���?";
};


func int dia_gunnar_everywhere_condition()
{
	if(GUNNAR_HALLOGESAGT == TRUE)
	{
		return TRUE;
	};
};

func void dia_gunnar_everywhere_info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Kde se tu vzalo tolik �oldn���?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//V�t�ina z nich je z trestaneck� kolonie.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Dal�� skupina �oldn��� poch�z� odn�kud z jihu, kde nejsp� lovili sk�ety.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//A vsad�m se, �e se tu te� taky objevilo n�kolik bandit� z hor, aby se mohli zadarmo naj�st!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "Co v� o �oldn���ch z jihu?";
};


func int dia_gunnar_south_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_south_info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co v� o �oldn���ch z jihu?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Nic moc. Co v�m, tak tam lovili sk�ety.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Sylvio je jejich ��f. Bullco, Sentenza, Raoul a n�kolik dal��ch pro n�j pracuje.
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "Kdo v�echno p�i�el z kolonie?";
};


func int dia_gunnar_colony_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_colony_info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Kdo v�echno p�i�el z kolonie?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee a jeho lid�. Torlof, Cord, Jarvis, Wolf a buhv�kdo je�t�.
};


instance DIA_GUNNAR_BANDITS(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 5;
	condition = dia_gunnar_bandits_condition;
	information = dia_gunnar_bandits_info;
	permanent = TRUE;
	description = "Co ti banditi, co jsi o nich mluvil?";
};


func int dia_gunnar_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_bandits_info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//Co ti banditi, co jsi o nich mluvil?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Ale, jen jsem �vanil. Nejsem si t�m v�bec jist�.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na jihu �dol� jsou hory s opu�t�n�mi doly. Ukr�v� se tam n�kolik bandit�.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Jsou tam taky trestanci z kolonie, stejn� jako tihle �old�ci na na�em statku.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedinej rozd�l mezi nima je, �e jsou je�t� hor�� bahno. Zabijou ka�d�ho, kdo se k nim p�ibl��.
};


instance DIA_GUNNAR_PICKPOCKET(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 900;
	condition = dia_gunnar_pickpocket_condition;
	information = dia_gunnar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gunnar_pickpocket_condition()
{
	return c_beklauen(45,70);
};

func void dia_gunnar_pickpocket_info()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_BACK,dia_gunnar_pickpocket_back);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_PICKPOCKET,dia_gunnar_pickpocket_doit);
};

func void dia_gunnar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gunnar_pickpocket);
};

func void dia_gunnar_pickpocket_back()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
};

