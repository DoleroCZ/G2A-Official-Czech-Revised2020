
instance DIA_NICLAS_EXIT(C_INFO)
{
	npc = bau_984_niclas;
	nr = 999;
	condition = dia_niclas_exit_condition;
	information = dia_niclas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_niclas_exit_condition()
{
	return TRUE;
};

func void dia_niclas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NICLAS_HELLO(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_hello_condition;
	information = dia_niclas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_niclas_hello_condition()
{
	return TRUE;
};

func void dia_niclas_hello_info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Taky jsi na útìku?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Proè si to myslíš?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Proè bys sem jinak chodil tak sám? Tady není vùbec NIC.
};


instance DIA_NICLAS_HAVEALOOK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_havealook_condition;
	information = dia_niclas_havealook_info;
	permanent = FALSE;
	description = "Jen jsem se tu chtìl trochu porozhlédnout po okolí.";
};


func int dia_niclas_havealook_condition()
{
	return TRUE;
};

func void dia_niclas_havealook_info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Jen jsem se tu chtìl trochu porozhlédnout po okolí.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Dobrá, považuj se za mého hosta. Dal by sis kousek masa?
	CreateInvItems(self,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
	Info_AddChoice(dia_niclas_havealook,"Ne, díky.",dia_niclas_havealook_no);
	Info_AddChoice(dia_niclas_havealook,"S potìšením.",dia_niclas_havealook_yes);
};

func void dia_niclas_havealook_no()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Ne, díky.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Jak je libo. Doufám, že ti nebude vadit, když si sám nìco zakousnu.
	b_useitem(self,itfomutton);
	Info_ClearChoices(dia_niclas_havealook);
};

func void dia_niclas_havealook_yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//S potìšením.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Tady, ta nejlepší krysokrtí kejtièka. Podle mého vlastního receptu.
	b_giveinvitems(self,other,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
};


instance DIA_NICLAS_WHYHERE(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_whyhere_condition;
	information = dia_niclas_whyhere_info;
	permanent = FALSE;
	description = "Tak proè jsi tady?";
};


func int dia_niclas_whyhere_condition()
{
	return TRUE;
};

func void dia_niclas_whyhere_info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Tak proè jsi tady?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Nalezl jsem tu klid. Ve mìstì jsem se vždycky cítil tak stísnìný.
};


instance DIA_NICLAS_SHOULDNTWORK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_shouldntwork_condition;
	information = dia_niclas_shouldntwork_info;
	permanent = FALSE;
	description = "Nemìl bys pracovat?";
};


func int dia_niclas_shouldntwork_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_whyhere))
	{
		return TRUE;
	};
};

func void dia_niclas_shouldntwork_info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Nemìl bys pracovat?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//Všechno, co potøebuju, si mùžu udìlat sám. Vyrábím si šípy a pøíroda mi poskytuje maso.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//Takže jsi lovec.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Ano, pokud tomu tak chceš øíkat. Ale lovím jen pro vlastní potøebu. Nelovím pro peníze.
};


instance DIA_NICLAS_CANTEACHME(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_canteachme_condition;
	information = dia_niclas_canteachme_info;
	permanent = FALSE;
	description = "V tom pøípadì bys mì mohl nìco nauèit.";
};


func int dia_niclas_canteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_shouldntwork))
	{
		return TRUE;
	};
};

func void dia_niclas_canteachme_info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//V tom pøípadì bys mì mohl nìco nauèit.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Proè ne. Mùžu ti ukázat, jak se zachází s lukem.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Niclas mi mùže pøedvést, jak se zdokonalit v lukostøelbì.");
};


instance DIA_NICLAS_TEACH(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_teach_condition;
	information = dia_niclas_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak se zachází s lukem.";
};


func int dia_niclas_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_canteachme))
	{
		return TRUE;
	};
};

func void dia_niclas_teach_info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Ukaž mi, jak se zachází s lukem.
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Už jsem tì nauèil všemu, co znám. Mìl by sis najít jiného uèitele.
	}
	else
	{
		Info_ClearChoices(dia_niclas_teach);
		Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
	};
};

func void dia_niclas_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Už tì nemùžu nauèit nièemu dalšímu.
	};
	Info_ClearChoices(dia_niclas_teach);
};

func void dia_niclas_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
};

func void dia_niclas_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
};


instance DIA_NICLAS_PICKPOCKET(C_INFO)
{
	npc = bau_984_niclas;
	nr = 900;
	condition = dia_niclas_pickpocket_condition;
	information = dia_niclas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_niclas_pickpocket_condition()
{
	return c_beklauen(27,20);
};

func void dia_niclas_pickpocket_info()
{
	Info_ClearChoices(dia_niclas_pickpocket);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_BACK,dia_niclas_pickpocket_back);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_PICKPOCKET,dia_niclas_pickpocket_doit);
};

func void dia_niclas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_niclas_pickpocket);
};

func void dia_niclas_pickpocket_back()
{
	Info_ClearChoices(dia_niclas_pickpocket);
};

