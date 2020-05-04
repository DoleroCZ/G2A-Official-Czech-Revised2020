
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
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Hej, díky, chlape, vážnì dìkuju. Už jsem si myslel, že se odsud nikdy nedostanu.
	TOPIC_END_JOE = TRUE;
	b_giveplayerxp(XP_AMBIENT * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Co TADY dìláš?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Jsem tu zamèenej. Ty dveøe byly otevøený a já se tu jen chtìl trochu porozhlídnout - ale jakmile jsem vlez dovnitø, pøišel strážce a ty zatracený dveøe zamknul.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Je to fakt trapas - byl bych ti vdìènej, kdyby to zùstalo jen mezi náma.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Rozumím. Vážnì to není nic pøíjemnýho.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Mám dojem, že potøebuju panáka.
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
	description = "Je všechno v poøádku?";
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
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Je všechno v poøádku?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Díky, žes mì z toho dostal.
	AI_StopProcessInfos(self);
};


instance DIA_JOE_SIGN(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_sign_condition;
	information = dia_joe_sign_info;
	permanent = FALSE;
	description = "(Pøedvést zlodìjský signál.)";
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
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Hej, co ty víš - možná máme spoleèný pøátele. V tom pøípadì mi dovol vyjádøit svou vdìènost za svoji záchranu.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Tady, vezmi si tyhle šperháky - jsem si jist, že se ti budou hodit.
	b_giveinvitems(self,other,itke_lockpick,5);
	AI_StopProcessInfos(self);
};

