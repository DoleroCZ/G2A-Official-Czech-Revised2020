
instance DIA_JOE_EXIT(C_INFO)
{
	npc = vlk_448_joe;
	nr = 999;
	condition = dia_joe_exit_condition;
	information = dia_joe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_joe_exit_condition()
{
	return TRUE;
};

func void dia_joe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JOE_PICKPOCKET(C_INFO)
{
	npc = vlk_448_joe;
	nr = 900;
	condition = dia_joe_pickpocket_condition;
	information = dia_joe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_joe_pickpocket_condition()
{
	return c_beklauen(25,25);
};

func void dia_joe_pickpocket_info()
{
	Info_ClearChoices(dia_joe_pickpocket);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_BACK,dia_joe_pickpocket_back);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_PICKPOCKET,dia_joe_pickpocket_doit);
};

func void dia_joe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_joe_pickpocket);
};

func void dia_joe_pickpocket_back()
{
	Info_ClearChoices(dia_joe_pickpocket);
};


instance DIA_JOE_HALLO(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_hallo_condition;
	information = dia_joe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_joe_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_joe_hallo_info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Hej, d�ky, chlape, v�n� d�kuju. U� jsem si myslel, �e se odsud nikdy nedostanu.
	TOPIC_END_JOE = TRUE;
	b_giveplayerxp(XP_AMBIENT * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Co TADY d�l�?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Jsem tu zam�enej. Ty dve�e byly otev�en� a j� se tu jen cht�l trochu porozhl�dnout - ale jakmile jsem vlez dovnit�, p�i�el str�ce a ty zatracen� dve�e zamknul.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Je to fakt trapas - byl bych ti vd��nej, kdyby to z�stalo jen mezi n�ma.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Rozum�m. V�n� to nen� nic p��jemn�ho.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//M�m dojem, �e pot�ebuju pan�ka.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JOE_PERM(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_perm_condition;
	information = dia_joe_perm_info;
	permanent = TRUE;
	description = "Je v�echno v po��dku?";
};


func int dia_joe_perm_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_joe_perm_info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//D�ky, �es m� z toho dostal.
	AI_StopProcessInfos(self);
};


instance DIA_JOE_SIGN(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_sign_condition;
	information = dia_joe_sign_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
};


func int dia_joe_sign_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_joe_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Hej, co ty v� - mo�n� m�me spole�n� p��tele. V tom p��pad� mi dovol vyj�d�it svou vd��nost za svoji z�chranu.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Tady, vezmi si tyhle �perh�ky - jsem si jist, �e se ti budou hodit.
	b_giveinvitems(self,other,itke_lockpick,5);
	AI_StopProcessInfos(self);
};

