
instance DIA_LEE_DI_EXIT(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 999;
	condition = dia_lee_di_exit_condition;
	information = dia_lee_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_di_exit_condition()
{
	return TRUE;
};

func void dia_lee_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_HALLO(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_hallo_condition;
	information = dia_lee_di_hallo_info;
	description = "Co za pr·ci si vezmeö?";
};


func int dia_lee_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_hallo_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Hallo_15_00");	//Co za pr·ci si vezmeö?
	AI_Output(self,other,"DIA_Lee_DI_Hallo_04_01");	//NÏkdo musÌ na loÔ dohlÌûet. Z˘stanu tady a postar·m se o to, aby tady z˘stala, aû se vr·tÌö.
};


instance DIA_LEE_DI_PERM6(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_perm6_condition;
	information = dia_lee_di_perm6_info;
	permanent = TRUE;
	description = "Co moje loÔ?";
};


func int dia_lee_di_perm6_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_di_hallo) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_di_perm6_info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Co moje loÔ?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Neboj se. M·m vöechno pod kontrolou.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_02");	//Vöechno je v po¯·dku. Jen aù se ti mizernÌ sk¯eti vr·tÌ. UötÏd¯Ìm jim dalöÌ v˝prask.
	};
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_TEACH(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 10;
	condition = dia_lee_di_teach_condition;
	information = dia_lee_di_teach_info;
	permanent = TRUE;
	description = "Pot¯ebuji se vycviËit.";
};


func int dia_lee_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_teach_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Pot¯ebuji se vycviËit.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//V Ëem p¯esnÏ se chceö zlepöit?
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Tvoje obrana je straön·, ale bude to muset staËit.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//M·ö moc tuh· z·pÏstÌ. ZbraÚ musÌö drûet volnÏji.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Vûdycky mÏj na pamÏti, ûe övih vych·zÌ z bok˘, ne ze z·pÏstÌ.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//I ten nejsilnÏjöÌ v˝pad je k niËemu, kdyû nic nezas·hne. Svou sÌlu tedy pouûÌvej s rozvahou.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_back()
{
	Info_ClearChoices(dia_lee_di_teach);
};


instance DIA_LEE_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_undeaddragondead_condition;
	information = dia_lee_di_undeaddragondead_info;
	permanent = TRUE;
	description = "M˘ûeme vyrazit. Nep¯Ìtel je mrtv˝.";
};


func int dia_lee_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_lee_di_undeaddragondead_onetime;

func void dia_lee_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_00");	//M˘ûeme vyrazit. Nep¯Ìtel je mrtv˝.
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_01");	//V˝bornÏ. V tom p¯ÌpadÏ ¯ekni kapit·novi, aù zvedne kotvy.
	if((DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_02");	//Vezmeö mÏ na pevninu, ûe?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_03");	//Ano. Khorinis to bez tebe zvl·dne.
		AI_Output(self,other,"DIA_Lee_Add_04_26");	//A pak se koneËnÏ p˘jdu podÌvat na Kr·le.
		AI_Output(self,other,"DIA_Lee_Add_04_27");	//Na tuhle chvÌli jsem Ëekal straönÏ dlouho.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_05");	//Co myslÌö? NemÏla by b˝t trpÏlivost nakonec odmÏnÏna?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_06");	//TrpÏlivost a p·r p·dn˝ch argument˘.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_07");	//(zasmÏje se) Jo. Bez trochy hrubÈ sÌly by to neölo. Byla Ëest jÌt do bitvy po tvÈm boku.
		DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_08");	//Snad se po tomhle dobrodruûstvÌ naöe cesty zase nÏkdy zk¯ÌûÌ.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_LEE_DI_PICKPOCKET(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 900;
	condition = dia_lee_di_pickpocket_condition;
	information = dia_lee_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_lee_di_pickpocket_condition()
{
	return c_beklauen(110,570);
};

func void dia_lee_di_pickpocket_info()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_BACK,dia_lee_di_pickpocket_back);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_PICKPOCKET,dia_lee_di_pickpocket_doit);
};

func void dia_lee_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lee_di_pickpocket);
};

func void dia_lee_di_pickpocket_back()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
};

