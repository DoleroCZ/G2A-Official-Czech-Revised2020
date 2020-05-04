
instance DIA_GEPPERT_EXIT(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 999;
	condition = dia_geppert_exit_condition;
	information = dia_geppert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_geppert_exit_condition()
{
	return TRUE;
};

func void dia_geppert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_HALLO(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 4;
	condition = dia_geppert_hallo_condition;
	information = dia_geppert_hallo_info;
	important = TRUE;
};


func int dia_geppert_hallo_condition()
{
	return TRUE;
};


var int kervo_gotstuff;

func void dia_geppert_hallo_info()
{
	if((Npc_IsDead(kervo) == FALSE) && (KERVO_GOTSTUFF == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(kervo,itmi_runeblank,1);
		}
		else
		{
			CreateInvItems(kervo,itmi_nugget,1);
		};
		KERVO_GOTSTUFF = TRUE;
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_10_00");	//Stùj! Kdo tam?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_01");	//Nepøišel jsi kvùli tomu, abys mì poslal zpátky do dolù, e ne?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_02");	//V tom pøípadì tì musím zklamat. Není ádnej zpùsob, jak mì dostat zpátky.
	Info_ClearChoices(dia_geppert_hallo);
	Info_AddChoice(dia_geppert_hallo,"Co tady dìláš?",dia_geppert_hallo_wasmachtihr);
	Info_AddChoice(dia_geppert_hallo,"Ty jsi trestanec na útìku, co?",dia_geppert_hallo_flucht);
};

func void dia_geppert_hallo_flucht()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Flucht_15_00");	//Ty jsi trestanec na útìku, co?
	AI_Output(self,other,"DIA_Geppert_HALLO_Flucht_10_01");	//Jak bystrı úsudek. Proè bych se jinak hrabal v tıhle špinavı díøe?
	Info_ClearChoices(dia_geppert_hallo);
};

func void dia_geppert_hallo_wasmachtihr()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Wasmachtihr_15_00");	//Co tady dìláš?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_01");	//Co je to za pitomou otázku? Schovávám se tu pøed vojákama.
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_02");	//Pøestaò chodit kolem horkı kaše. Buï mì zabij, nebo se ztra.
	}
	else
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_03");	//Blbá otázka. Schovávám se, co jinıho? Ty vojenskı svinì maj svı špehy úplnì všude.
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_04");	//Nevrátím se do toho dolu a tím to vadne.
	Info_ClearChoices(dia_geppert_hallo);
};


instance DIA_GEPPERT_BRATEN(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 5;
	condition = dia_geppert_braten_condition;
	information = dia_geppert_braten_info;
	permanent = TRUE;
	description = "Ta peèenì pìknì voní.";
};


func int dia_geppert_braten_condition()
{
	if(Npc_KnowsInfo(other,dia_geppert_hallo))
	{
		return TRUE;
	};
};

func void dia_geppert_braten_info()
{
	AI_Output(other,self,"DIA_Geppert_BRATEN_15_00");	//Ta peèenì pìknì voní.
	AI_Output(self,other,"DIA_Geppert_BRATEN_10_01");	//Nedotıkat se!
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_PICKPOCKET(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 900;
	condition = dia_geppert_pickpocket_condition;
	information = dia_geppert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_geppert_pickpocket_condition()
{
	return c_beklauen(56,5);
};

func void dia_geppert_pickpocket_info()
{
	Info_ClearChoices(dia_geppert_pickpocket);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_BACK,dia_geppert_pickpocket_back);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_PICKPOCKET,dia_geppert_pickpocket_doit);
};

func void dia_geppert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_geppert_pickpocket);
};

func void dia_geppert_pickpocket_back()
{
	Info_ClearChoices(dia_geppert_pickpocket);
};

