
instance DIA_LESTER_DI_EXIT(C_INFO)
{
	npc = pc_psionic_di;
	nr = 999;
	condition = dia_lester_di_exit_condition;
	information = dia_lester_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_di_exit_condition()
{
	return TRUE;
};

func void dia_lester_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_DI_HELLO(C_INFO)
{
	npc = pc_psionic_di;
	nr = 1;
	condition = dia_lester_di_hello_condition;
	information = dia_lester_di_hello_info;
	permanent = TRUE;
	description = "Nechtìl bys mi nìco øíct?";
};


func int dia_lester_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_lester_di_scgotwarning1;
var int dia_lester_di_scgotwarning2;

func void dia_lester_di_hello_info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Nechtìl bys mi nìco øíct?
	if((Npc_IsDead(mario_di) == FALSE) && (ORKSTURMDI == TRUE) && (DIA_LESTER_DI_SCGOTWARNING1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Když skøeti zaútoèili, Mario utekl. I když tady na lodi byl zmatek, neztratil jsem ho z oèí.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//Jednoduše prošel skrz skøetí linie - a skøeti se ho ani nedotkli.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//Moc se mi ten parchant nelíbil už od samého zaèátku. Je ve spolku s nepøítelem.
		b_giveplayerxp(XP_AMBIENT);
		DIA_LESTER_DI_SCGOTWARNING1 = TRUE;
	}
	else if((Npc_IsDead(mario_di) == FALSE) && (DIA_LESTER_DI_SCGOTWARNING2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//Ten divný chlapík, co si øíká Mario, se mi nelíbí. Má zlou auru.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Dávej si pozor, pøíteli.
		DIA_LESTER_DI_SCGOTWARNING2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Teï ne. Možná pozdìji.
	};
};


instance DIA_LESTER_DI_MARIOARSCH(C_INFO)
{
	npc = pc_psionic_di;
	nr = 2;
	condition = dia_lester_di_marioarsch_condition;
	information = dia_lester_di_marioarsch_info;
	description = "Mìl jsi pravdu. Mario nás zradil.";
};


func int dia_lester_di_marioarsch_condition()
{
	if(((DIA_LESTER_DI_SCGOTWARNING2 == TRUE) || (DIA_LESTER_DI_SCGOTWARNING2 == TRUE)) && (MIS_MARIO_AMBUSH == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_di_marioarsch_info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//Mìl jsi pravdu. Mario nás zradil.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//Ano. Možná nejsem zrovna nejbystøejší, ale tohle mi bylo jasné.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Pøíštì buï pøi vybírání spoleèníkù opatrnìjší.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PC_LESTER_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_psionic_di;
	nr = 5;
	condition = dia_pc_lester_di_undeaddragondead_condition;
	information = dia_pc_lester_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Už se tady moc dlouho nezdržíme.";
};


func int dia_pc_lester_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_lester_di_undeaddragondead_onetime;

func void dia_pc_lester_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//Už se tady moc dlouho nezdržíme.
	if(DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//Zdá se, že ta moje bolest hlavy nadobro zmizela.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//Jak jsi to udìlal?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//Znièil jsem nepøítele.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//Muselo to být opravdu nìco hodnì mocného. Co to pøesnì bylo?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//Nemrtvý drak.
		};
		if(SC_KNOWSMADPSI == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Tvoji bývalí pøátelé z tábora v bažinách mi dali docela zabrat.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Ano. Víra hory pøenáší. Tak to bylo vždycky. Bohužel sloužili špatnému bohu.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//Budu potøebovat víc èasu, než se pøes to dokážu úplnì pøenést.
		};
		DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//Doufejme, že se už nikdy nic takového nestane. Na celém svìtì není dost trávy, kolik bych jí chtìl teï vykouøit.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PSIONIC_DI_PICKPOCKET(C_INFO)
{
	npc = pc_psionic_di;
	nr = 900;
	condition = dia_psionic_di_pickpocket_condition;
	information = dia_psionic_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_psionic_di_pickpocket_condition()
{
	return c_beklauen(56,25);
};

func void dia_psionic_di_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_BACK,dia_psionic_di_pickpocket_back);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_PICKPOCKET,dia_psionic_di_pickpocket_doit);
};

func void dia_psionic_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

func void dia_psionic_di_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

