
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
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Od té doby, co Onar vyhlásil, že si najal žoldnéøe, poflakuje se na dvoøe akorát tak banda nièemných darebákù.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Všechna ta chátra, co nemìla co do huby, se vyrojila z lesa ještì pøed tím, než jsme sem pøišli my.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Ty bastardi vážnì vylejzaj snad odevšad.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//Tak ty seš teï taky žoldák, hm?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Innos s tebou!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Tady nejsou lidi z mìsta vítáni.
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
	description = "Kde se tu vzalo tolik žoldnéøù?";
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
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Kde se tu vzalo tolik žoldnéøù?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Vìtšina z nich je z trestanecké kolonie.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Další skupina žoldnéøù pochází odnìkud z jihu, kde nejspíš lovili skøety.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//A vsadím se, že se tu teï taky objevilo nìkolik banditù z hor, aby se mohli zadarmo najíst!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "Co víš o žoldnéøích z jihu?";
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
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co víš o žoldnéøích z jihu?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Nic moc. Co vím, tak tam lovili skøety.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Sylvio je jejich šéf. Bullco, Sentenza, Raoul a nìkolik dalších pro nìj pracuje.
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "Kdo všechno pøišel z kolonie?";
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
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Kdo všechno pøišel z kolonie?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee a jeho lidé. Torlof, Cord, Jarvis, Wolf a buhvíkdo ještì.
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
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Ale, jen jsem žvanil. Nejsem si tím vùbec jistý.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na jihu údolí jsou hory s opuštìnými doly. Ukrývá se tam nìkolik banditù.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Jsou tam taky trestanci z kolonie, stejní jako tihle žoldáci na našem statku.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedinej rozdíl mezi nima je, že jsou ještì horší bahno. Zabijou každýho, kdo se k nim pøiblíží.
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

