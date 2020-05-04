
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
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Co tady dìláš? Jestli nìco chceš, musíš si nejdøív sjednat schùzku.
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
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jsem Lariu, zdejší místodržící.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//I když to tak teï asi nevypadá, jsem nejmocnìjším mužem ve mìstì.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//Takže ty tady vládneš?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Já... no... teï zrovna mám svázané ruce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Velí tady tomu ten lord Hagen, alespoò po tu dobu, co je ve mìstì.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "Nechtìl jsem rušit.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Nechtìl jsem rušit.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Jenže se ti to vùbec nepovedlo. Takže vypadni!
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
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Co tady chceš? Dokud jsou paladinové ve mìstì, mají veškeré vìci kolem Khorinisu na starosti oni.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "Soudce si najal nìjaké bandity, aby tì napadli. Mùžu to prokázat.";
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
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Soudce si najal nìjaké bandity, aby tì napadli. Mùžu to prokázat.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Pøestaò plácat takové nesmysly, nebo snad chceš, abych tì nechal vsadit do želez?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//I kdybys byl bojovníkem Innose...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//I kdybys by ustanoven mágem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Mé slovo má v tomhle mìstì stále ještì svou váhu. Už se nikdy víc neopovažuj špinit jméno soudce!
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

