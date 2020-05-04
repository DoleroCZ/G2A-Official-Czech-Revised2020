
instance DIA_TENGRON_EXIT(C_INFO)
{
	npc = pal_280_tengron;
	nr = 999;
	condition = dia_tengron_exit_condition;
	information = dia_tengron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tengron_exit_condition()
{
	return TRUE;
};

func void dia_tengron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TENGRON_FIRST(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_first_condition;
	information = dia_tengron_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE != LOG_RUNNING) && (MIS_SCOUTMINE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_first_info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//Co tady dÏl·ö?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//Vydal jsem se na cestu na rozkaz lorda Hagena.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//MusÌö se za vöech okolnostÌ dostat na hrad a promluvit si s velitelem Garondem.
};


instance DIA_TENGRON_HALLO(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_hallo_condition;
	information = dia_tengron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_hallo_condition()
{
	if((Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE == LOG_RUNNING)) || (MIS_SCOUTMINE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_hallo_info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//Nechù tÏ Innos doprov·zÌ! P¯in·öÌö zpr·vy z hradu? Uû se blÌûÌ posily?
	if(Npc_IsDead(fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//Nep¯iöel jsem se zpr·vami, ale pro nÏ.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//V tom p¯ÌpadÏ si promluv s Fajethem. M· to tady na povel. Ale kdybys mÏl nÏjakÈ zpr·vy z hradu, dej mi vÏdÏt.
	};
};


instance DIA_TENGRON_NEWS(C_INFO)
{
	npc = pal_280_tengron;
	nr = 7;
	condition = dia_tengron_news_condition;
	information = dia_tengron_news_info;
	permanent = FALSE;
	description = "Co se tÏch zpr·v t˝Ëe...";
};


func int dia_tengron_news_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_news_info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//Co se tÏch zpr·v t˝Ëe...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Ano - jak to vypad· na hradÏ?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//JeötÏ po¯·d ho oblÈhajÌ sk¯eti a po¯·d na nÏj mohou za˙toËit draci.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//ZatracenÏ, douf·m, ûe se chlapci udrûÌ.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Poslouchej, m·m na hradÏ p¯Ìtele. Jmenuje se Udar. Zn·me se uû dlouhou dobu a bojovali jsme pospolu v nejednÈ bitvÏ.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//Chci, abys mu dal tenhle prsten. Aù mi ho pohlÌd·. Vy¯iÔ mu, ûe aû se vr·tÌm, vezmu si ho zpÏt.
	Info_ClearChoices(dia_tengron_news);
	Info_AddChoice(dia_tengron_news,"Na to nem·m Ëas.",dia_tengron_news_no);
	Info_AddChoice(dia_tengron_news,"é·dn˝ problÈm...",dia_tengron_news_yes);
};

func void dia_tengron_news_no()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//Na to nem·m Ëas.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//RozumÌm.
	Info_ClearChoices(dia_tengron_news);
};

func void dia_tengron_news_yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//é·dn˝ problÈm. Aû se dostanu do hradu, d·m Udarovi ten prsten.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Dobr·. Magie toho prstenu d· Udarovi novou sÌlu. A ¯ekni mu, ûe aû se vr·tÌm, zase si ho vezmu.
	b_giveinvitems(self,other,itri_tengron,1);
	Info_ClearChoices(dia_tengron_news);
	Log_CreateTopic(TOPIC_TENGRONRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TENGRONRING,LOG_RUNNING);
	b_logentry(TOPIC_TENGRONRING,"Tengron mi svÏ¯il prsten, kter˝ m·m na hradÏ p¯edat Udarovi.");
};


instance DIA_TENGRON_SITUATION(C_INFO)
{
	npc = pal_280_tengron;
	nr = 70;
	condition = dia_tengron_situation_condition;
	information = dia_tengron_situation_info;
	permanent = TRUE;
	description = "Jak to tu u v·s vypad·?";
};


func int dia_tengron_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_situation_info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//Jak to tu u v·s vypad·?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//Vöude kolem jsou samÈ p¯Ìöery a nevydolovali jsme skoro û·dnou rudu. NavÌc jsme ztratili spoustu dobr˝ch chlap˘.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//NevÌm, jak dlouho vydrûÌme, ale nevzd·me se!
};


instance DIA_TENGRON_HELP(C_INFO)
{
	npc = pal_280_tengron;
	nr = 9;
	condition = dia_tengron_help_condition;
	information = dia_tengron_help_info;
	permanent = FALSE;
	description = "Mohl bys mi pomoci...";
};


func int dia_tengron_help_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_help_info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//Mohl bys mi pomoci. Fajeth chce, abych lovil jeötÏry, a...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//P¯ijÌm·m rozkazy JEN od Fajetha. A moje rozkazy ¯ÌkajÌ, ûe m·m hlÌdat d˘l. A p¯esnÏ to dÏl·m.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Moûn· by ti mohl pomoci nÏkdo jin˝.
};


instance DIA_TENGRON_PICKPOCKET(C_INFO)
{
	npc = pal_280_tengron;
	nr = 900;
	condition = dia_tengron_pickpocket_condition;
	information = dia_tengron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_tengron_pickpocket_condition()
{
	return c_beklauen(32,50);
};

func void dia_tengron_pickpocket_info()
{
	Info_ClearChoices(dia_tengron_pickpocket);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_BACK,dia_tengron_pickpocket_back);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_PICKPOCKET,dia_tengron_pickpocket_doit);
};

func void dia_tengron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tengron_pickpocket);
};

func void dia_tengron_pickpocket_back()
{
	Info_ClearChoices(dia_tengron_pickpocket);
};

