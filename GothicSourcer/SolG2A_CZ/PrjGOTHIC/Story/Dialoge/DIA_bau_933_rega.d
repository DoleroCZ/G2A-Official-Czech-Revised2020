
instance DIA_REGA_EXIT(C_INFO)
{
	npc = bau_933_rega;
	nr = 999;
	condition = dia_rega_exit_condition;
	information = dia_rega_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rega_exit_condition()
{
	return TRUE;
};

func void dia_rega_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGA_HALLO(C_INFO)
{
	npc = bau_933_rega;
	nr = 3;
	condition = dia_rega_hallo_condition;
	information = dia_rega_hallo_info;
	description = "Jak se vede?";
};


func int dia_rega_hallo_condition()
{
	return TRUE;
};

func void dia_rega_hallo_info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//Jak se vede?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Ty jsi z mìsta, co?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Jsi jeden z tìch Onarových žoldákù, co?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Ty jsi mág, co?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Ty nejsi jeden z nás, co?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//Na tvém místì bych odsud pìknì rychle vypadla.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Proè?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//Nikdy to tady nebyl žádný med, ale alespoò jsme mìli klid po celou dobu, co dìláme pro Sekoba.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Ale poslední dobu už je to nesnesitelné.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Banditi jsou úplnì všude, polní škùdci nièí veškerou úrodu a z velkostatkáøe se stal pìknej kruas.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "Takže se bojíte velkostatkáøe?";
};


func int dia_rega_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_onar_info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Takže se bojíte velkostatkáøe?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Se vsaï. Když se mu nelíbí nìèí ksicht, pošle na nìj svý žoldáky. To je taky poslední chvíle, kdy toho nebožáka nìkdo uvidí.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Takže radìj držíme zobák.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "Copak se o ty polní škùdce nepostarají žoldáci?";
};


func int dia_rega_sld_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_sld_info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Copak se o ty polní škùdce nepostarají žoldáci?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Nevím, za co jsou placení, ale urèitì ne za pomoc nám, obyèejným lidem.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//Problém s polními škùdci je teï na malých farmáøích, co si pronajali od Onara pùdu.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "Jak se bráníte proti banditùm?";
};


func int dia_rega_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_banditen_info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Jak se bráníte proti banditùm?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Nijak. Prostì uteèeme. Ještì nìco?
};


instance DIA_REGA_BRONKO(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_bronko_condition;
	information = dia_rega_bronko_info;
	description = "(Zeptat se na Bronca.)";
};


func int dia_rega_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && (MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_rega_bronko_info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//Tak kdo je ten hnusnej chlápek támhle?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Nepøeber si to špatnì, ale nechci se dostat do potíží. Zeptej se nìkoho jinýho.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "No tak, trochu kuráže.";
};


func int dia_rega_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_permkap1_info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//No tak, trochu kuráže.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//Tobì se to mluví. Ty pøece bydlíš ve mìstì.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Kdyby ti žoldáci nebyli takoví hajzlové, všechno ostatní by se dalo pøekousnout.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//Mágù je tu poøád míò a míò. Doufám, že ty nejsi poslední. Potøebujeme vás - víc než kdykoli jindy.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//Není to tak snadné, když makáš pro toho otrokáøskýho Sekoba.
	};
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PICKPOCKET(C_INFO)
{
	npc = bau_933_rega;
	nr = 900;
	condition = dia_rega_pickpocket_condition;
	information = dia_rega_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rega_pickpocket_condition()
{
	return c_beklauen(25,40);
};

func void dia_rega_pickpocket_info()
{
	Info_ClearChoices(dia_rega_pickpocket);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_BACK,dia_rega_pickpocket_back);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_PICKPOCKET,dia_rega_pickpocket_doit);
};

func void dia_rega_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rega_pickpocket);
};

func void dia_rega_pickpocket_back()
{
	Info_ClearChoices(dia_rega_pickpocket);
};

