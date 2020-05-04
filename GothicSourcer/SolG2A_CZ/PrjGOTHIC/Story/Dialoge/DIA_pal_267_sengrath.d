
instance DIA_SENGRATH_EXIT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 999;
	condition = dia_sengrath_exit_condition;
	information = dia_sengrath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sengrath_exit_condition()
{
	return TRUE;
};

func void dia_sengrath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENGRATH_HELLO(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_hello_condition;
	information = dia_sengrath_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sengrath_hello_condition()
{
	return TRUE;
};

func void dia_sengrath_hello_info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//V�d�l jsem to! V�d�l jsem, �e se to n�komu mus� poda�it!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//Pro�el jsi skrz pr�smyk? N� posel tedy proklouzl?
	AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//Ne, posel se p�es pr�smyk nedostal. P�i�el jsem na rozkaz lorda Hagena.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//(zavr��) Proklet� sk�eti...
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//No, velitel Garond si s tebou ur�it� bude cht�t promluvit. Najde� ho v t� velk� budov� hl�dan� dv�ma ryt��i.
};


instance DIA_SENGRATH_EQUIPMENT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_equipment_condition;
	information = dia_sengrath_equipment_info;
	permanent = FALSE;
	description = "Kde tady najdu n�jakou v�bavu?";
};


func int dia_sengrath_equipment_condition()
{
	return TRUE;
};

func void dia_sengrath_equipment_info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//Kde tady najdu n�jakou v�bavu?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//Zbran� vyd�v� Tandor. Za v�echno ostatn� zodpov�d� spr�vce Engor.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//A co magick� v�ci?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//M�me kouzeln� svitky. Pokud bys n�jak� cht�l, obra� se na m�.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Sengrath na hrad� prod�v� magick� svitky.");
};


instance DIA_SENGRATH_PERM(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_perm_condition;
	information = dia_sengrath_perm_info;
	permanent = FALSE;
	description = "Kdo m� tady m��e n�co nau�it?";
};


func int dia_sengrath_perm_condition()
{
	return TRUE;
};

func void dia_sengrath_perm_info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//Kdo m� tady m��e n�co nau�it?
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//Promluv si s Miltenem - je to n� jedin� m�g.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//Zeptej se Kerolotha. U�� chlapce bojovat s me�em. Mo�n� by mohl n�co nau�it i tebe.
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"Keroloth na hrad� tr�nuje bojovn�ky s me�em.");
	};
};


instance DIA_SENGRATH_SCROLLS(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 9;
	condition = dia_sengrath_scrolls_condition;
	information = dia_sengrath_scrolls_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi ty svitky.";
};


func int dia_sengrath_scrolls_condition()
{
	if(Npc_KnowsInfo(other,dia_sengrath_equipment))
	{
		return TRUE;
	};
};

func void dia_sengrath_scrolls_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//Uka� mi ty svitky.
};


instance DIA_SENGRATH_PICKPOCKET(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 900;
	condition = dia_sengrath_pickpocket_condition;
	information = dia_sengrath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_sengrath_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_sengrath_pickpocket_info()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_BACK,dia_sengrath_pickpocket_back);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_PICKPOCKET,dia_sengrath_pickpocket_doit);
};

func void dia_sengrath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sengrath_pickpocket);
};

func void dia_sengrath_pickpocket_back()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
};

