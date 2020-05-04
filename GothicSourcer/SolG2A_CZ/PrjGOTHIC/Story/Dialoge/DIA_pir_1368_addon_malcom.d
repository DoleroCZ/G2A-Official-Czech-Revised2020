
instance DIA_ADDON_MALCOM_EXIT(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 999;
	condition = dia_addon_malcom_exit_condition;
	information = dia_addon_malcom_exit_info;
	permanent = TRUE;
	description = "Mus�m j�t.";
};


func int dia_addon_malcom_exit_condition()
{
	return TRUE;
};

func void dia_addon_malcom_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Mus�m j�t.
	if(MALCOMBOTSCHAFT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Nenech se n���m se�rat. Je velmi nebezpe�n�, se kolem jen tak potulovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hej, jestli p�jde� do t�bora, vy�i� Henrymu ode m� n�co.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Stromy tady kolem jsou velmi nezdoln�.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Nem�l by o�ek�vat d�evo v bl�zk� dob�. �ekni mu to.
		MALCOMBOTSCHAFT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MALCOM_PICKPOCKET(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 900;
	condition = dia_addon_malcom_pickpocket_condition;
	information = dia_addon_malcom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_malcom_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_malcom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_BACK,dia_addon_malcom_pickpocket_back);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_PICKPOCKET,dia_addon_malcom_pickpocket_doit);
};

func void dia_addon_malcom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};

func void dia_addon_malcom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};


instance DIA_ADDON_MALCOM_HELLO(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 1;
	condition = dia_addon_malcom_hello_condition;
	information = dia_addon_malcom_hello_info;
	important = TRUE;
};


func int dia_addon_malcom_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Ty nejsi odtud, �e ne?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Zd� se, �e jsi cestoval pom�rn� dlouho, aby ses sem dostal.
};


instance DIA_ADDON_MALCOM_WASMACHEN(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 2;
	condition = dia_addon_malcom_wasmachen_condition;
	information = dia_addon_malcom_wasmachen_info;
	description = "Zanepr�zdn�n?";
};


func int dia_addon_malcom_wasmachen_condition()
{
	return TRUE;
};

func void dia_addon_malcom_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Zanepr�zdn�n?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//Neru� m�. Henry chce, abych zde pok�cel co nejv�c strom�.
	if(henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Vede na�i skupinu.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Stoj� p�ed vstupem do t�bora a m�rn� kontroluje p��choz�.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Star� se o bezpe�nost n�eho t�bora.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Pochopiteln� ale nem��e ovlivnit ka�d�ho.
};


instance DIA_ADDON_MALCOM_ENTERTRUPP(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 5;
	condition = dia_addon_malcom_entertrupp_condition;
	information = dia_addon_malcom_entertrupp_info;
	description = "Henry je tv�j v�dce?";
};


func int dia_addon_malcom_entertrupp_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_entertrupp_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry je tv�j v�dce?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Ano, v�dce na�� skupiny.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//N� KAPIT�N je ale Greg.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Ale nyn� je zrovna pry�.
	};
};


instance DIA_ADDON_MALCOM_LAGER(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 3;
	condition = dia_addon_malcom_lager_condition;
	information = dia_addon_malcom_lager_info;
	description = "Kde je tv�j t�bor?";
};


func int dia_addon_malcom_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Kde je tv�j t�bor?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Jen b� touto cestou na z�pad.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Tam uvid� Henryho, jak post�v� kolem.
};

