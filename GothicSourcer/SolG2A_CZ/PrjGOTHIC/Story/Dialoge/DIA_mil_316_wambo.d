
instance DIA_WAMBO_EXIT(C_INFO)
{
	npc = mil_316_wambo;
	nr = 999;
	condition = dia_wambo_exit_condition;
	information = dia_wambo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wambo_exit_condition()
{
	return TRUE;
};

func void dia_wambo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAMBO_PICKPOCKET(C_INFO)
{
	npc = mil_316_wambo;
	nr = 900;
	condition = dia_wambo_pickpocket_condition;
	information = dia_wambo_pickpocket_info;
	permanent = TRUE;
	description = "(Kráde tohoto klíèe by byla riskantní)";
};


func int dia_wambo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void dia_wambo_pickpocket_info()
{
	Info_ClearChoices(dia_wambo_pickpocket);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_BACK,dia_wambo_pickpocket_back);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_PICKPOCKET,dia_wambo_pickpocket_doit);
};

func void dia_wambo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_city_tower_04,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_wambo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_wambo_pickpocket_back()
{
	Info_ClearChoices(dia_wambo_pickpocket);
};


instance DIA_WAMBO_JOB(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_job_condition;
	information = dia_wambo_job_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_wambo_job_condition()
{
	return TRUE;
};

func void dia_wambo_job_info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Starám se o to, aby nikdo nevešel dovnitø.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Vıslovnı rozkaz od lorda Hagena. A ani nemysli na to, e by ses tomu rozkazu protivil!
};


instance DIA_WAMBO_SITUATION(C_INFO)
{
	npc = mil_316_wambo;
	nr = 10;
	condition = dia_wambo_situation_condition;
	information = dia_wambo_situation_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_wambo_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_job))
	{
		return TRUE;
	};
};

func void dia_wambo_situation_info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//V tuhle chvíli je všechno v klidu.
};


instance DIA_WAMBO_RAMIREZ(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_ramirez_condition;
	information = dia_wambo_ramirez_info;
	permanent = FALSE;
	description = "Pøicházím od našeho spoleèného pøítele Ramireze.";
};


func int dia_wambo_ramirez_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_viertel))
	{
		return TRUE;
	};
};

func void dia_wambo_ramirez_info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//Pøicházím od našeho spoleèného pøítele Ramireze.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Coe? Ten Ramirez je pìkná krysa. A není ádnı mùj pøítel. To je jedno. Pøinášíš mi nìco?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//To záleí na tom, co chceš.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(tiše) Dobrá, øeknu ti, jak to chodí. Zaplatíš 250 zlatıch. Pak tady v noci nebudu.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//Pokud bys ale byl pøíliš nápadnı a já tady pøece jenom byl, tak z obchodu sešlo.
};


instance DIA_WAMBO_DEAL(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_deal_condition;
	information = dia_wambo_deal_info;
	permanent = TRUE;
	description = "(Zaplatit 250 zlaákù)";
};


var int dia_wambo_deal_permanent;

func int dia_wambo_deal_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_ramirez) && (DIA_WAMBO_DEAL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wambo_deal_info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//Mám pro tebe ty peníze...
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//Dobrá, tak já na veèer zmizím.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//A nezapomeò - kdybys dìlal nìjaké problémy, tak tì neznám.
		DIA_WAMBO_DEAL_PERMANENT = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//... ale ne zrovna u sebe.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Nesnáším, kdy ze mì nìkdo dìlá šaška. Tak pøines to zlato.
		AI_StopProcessInfos(self);
	};
};

