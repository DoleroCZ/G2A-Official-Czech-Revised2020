
instance DIA_TALBIN_NW_EXIT(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_nw_exit_condition()
{
	return TRUE;
};

func void dia_talbin_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_NW(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_condition;
	information = dia_talbin_nw_info;
	description = "V tom pr�smyku to nebylo tak hrozn�, co?";
};


func int dia_talbin_nw_condition()
{
	return TRUE;
};

func void dia_talbin_nw_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//V tom pr�smyku to nebylo tak hrozn�, co?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//D�ky za z�chranu.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Na, tenhle �utr�k sem na�el v pr�smyku. Mysl�m, �e se ti bude hodit.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//Po��t�m, �e je to runovej k�men.
		CreateInvItems(self,itmi_runeblank,1);
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//Nejsp� to bude kousek rudy.
		CreateInvItems(self,itmi_nugget,1);
		b_giveinvitems(self,other,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Nech� t� Innos ochra�uje.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_TALBIN_RUNS = TRUE;
	b_giveplayerxp(XP_SAVEDTALBIN);
};


instance DIA_TALBIN_NW_PERM(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_perm_condition;
	information = dia_talbin_nw_perm_info;
	permanent = TRUE;
	description = "Je v�echno v po��dku?";
};


func int dia_talbin_nw_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_nw))
	{
		return TRUE;
	};
};

func void dia_talbin_nw_perm_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Jo, d�ky tob�. A te� u� b�, budu v pohod�.
	AI_StopProcessInfos(self);
};

