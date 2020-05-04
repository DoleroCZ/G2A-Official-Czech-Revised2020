
instance DIA_LARIUS_EXIT(C_INFO)
{
	npc = vlk_400_larius;
	nr = 999;
	condition = dia_larius_exit_condition;
	information = dia_larius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_larius_exit_condition()
{
	return TRUE;
};

func void dia_larius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_HELLO(C_INFO)
{
	npc = vlk_400_larius;
	nr = 1;
	condition = dia_larius_hello_condition;
	information = dia_larius_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_larius_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_larius_hello_info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Co tady d�l�? Jestli n�co chce�, mus� si nejd��v sjednat sch�zku.
};


instance DIA_LARIUS_WHOAREYOU(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_whoareyou_condition;
	information = dia_larius_whoareyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_larius_whoareyou_condition()
{
	return TRUE;
};

func void dia_larius_whoareyou_info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jsem Lariu, zdej�� m�stodr��c�.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//I kdy� to tak te� asi nevypad�, jsem nejmocn�j��m mu�em ve m�st�.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//Tak�e ty tady vl�dne�?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//J�... no... te� zrovna m�m sv�zan� ruce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Vel� tady tomu ten lord Hagen, alespo� po tu dobu, co je ve m�st�.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "Necht�l jsem ru�it.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Necht�l jsem ru�it.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Jen�e se ti to v�bec nepovedlo. Tak�e vypadni!
};


instance DIA_LARIUS_DIELAGE(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_dielage_condition;
	information = dia_larius_dielage_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_larius_dielage_condition()
{
	return TRUE;
};

func void dia_larius_dielage_info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Co tady chce�? Dokud jsou paladinov� ve m�st�, maj� ve�ker� v�ci kolem Khorinisu na starosti oni.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "Soudce si najal n�jak� bandity, aby t� napadli. M��u to prok�zat.";
};


func int dia_larius_richterueberfall_condition()
{
	if(SCKNOWSRICHTERKOMPROBRIEF == TRUE)
	{
		return TRUE;
	};
};

func void dia_larius_richterueberfall_info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Soudce si najal n�jak� bandity, aby t� napadli. M��u to prok�zat.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//P�esta� pl�cat takov� nesmysly, nebo snad chce�, abych t� nechal vsadit do �elez?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//I kdybys byl bojovn�kem Innose...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//I kdybys by ustanoven m�gem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//M� slovo m� v tomhle m�st� st�le je�t� svou v�hu. U� se nikdy v�c neopova�uj �pinit jm�no soudce!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_400_larius;
	nr = 900;
	condition = dia_larius_pickpocket_condition;
	information = dia_larius_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_larius_pickpocket_condition()
{
	return c_beklauen(35,120);
};

func void dia_larius_pickpocket_info()
{
	Info_ClearChoices(dia_larius_pickpocket);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_BACK,dia_larius_pickpocket_back);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_PICKPOCKET,dia_larius_pickpocket_doit);
};

func void dia_larius_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_larius_pickpocket);
};

func void dia_larius_pickpocket_back()
{
	Info_ClearChoices(dia_larius_pickpocket);
};

