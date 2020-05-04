
instance DIA_WOLF_DI_EXIT(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 999;
	condition = dia_wolf_di_exit_condition;
	information = dia_wolf_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_di_exit_condition()
{
	return TRUE;
};

func void dia_wolf_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_HALLO(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 4;
	condition = dia_wolf_di_hallo_condition;
	information = dia_wolf_di_hallo_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_wolf_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_wolf_di_hallo_onetime;

func void dia_wolf_di_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//Jak se vede?
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (Npc_IsDead(bennet_di) == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Tos MUSEL brát s sebou Benneta, chlape?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//V èem je problém?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//Ále, vlastnì nic. Jen si udìlej, co musíš, a pak odsud zmizni, jo?
	}
	else if(DIA_WOLF_DI_HALLO_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Tahle kovárna není zrovna nejlepší, ale myslím, že ji trochu vyzkouším.
		b_giveplayerxp(XP_AMBIENT);
		DIA_WOLF_DI_HALLO_ONETIME = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//Mohl bys mi ukout nìjakou zbroj?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Je mi líto, chlape, ale s tímhle náøadím nic nepoøídím. To bude muset poèkat, až dorazíme na pevninu.
	};
};


instance DIA_WOLF_DI_TRAINING(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 10;
	condition = dia_wolf_di_training_condition;
	information = dia_wolf_di_training_info;
	permanent = TRUE;
	description = "Vycviè mì prosím v boji na dálku.";
};


func int dia_wolf_di_training_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_wolf_di_training_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Vycviè mì prosím v boji na dálku.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//V jakém konkrétnì?
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//Luk je na rozdíl od kuše dost neskladný, a proto vyžaduje spoustu místa. Vždycky si proto dávej pozor, abys mìl pøi boji okolo sebe dostatek volného prostoru.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Pøi výstøelu ti musí tìtiva v prstech klouzat - když ji budeš držet køeèovitì, mùžeš tím šíp úplnì vychýlit z dráhy.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Pøi støelbì z kuše musíš stát absolutnì v klidu. Kohoutek je proto tøeba maèkat velmi pomalu a opatrnì.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Chytrý kušiník si také všímá, kudy zrovna vane vítr, a nesnaží se støílet pøímo proti nìmu.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_back()
{
	Info_ClearChoices(dia_wolf_di_training);
};


instance DIA_WOLF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 2;
	condition = dia_wolf_di_undeaddragondead_condition;
	information = dia_wolf_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Je všechno v poøádku?";
};


func int dia_wolf_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_wolf_di_undeaddragondead_onetime;

func void dia_wolf_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Je všechno v poøádku?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//Jasnì. A co ty? Bylo to drsné, co?
	if(DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Kam teï pùjdeš?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Kamkoliv, jen ne zpátky. Khorinisu už mám plné zuby.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Mnì je taky jedno, kam poplujeme, jenom když odsud koneènì vypadneme.
		DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 900;
	condition = dia_wolf_di_pickpocket_condition;
	information = dia_wolf_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_di_pickpocket_condition()
{
	return c_beklauen(32,45);
};

func void dia_wolf_di_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_BACK,dia_wolf_di_pickpocket_back);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_PICKPOCKET,dia_wolf_di_pickpocket_doit);
};

func void dia_wolf_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

func void dia_wolf_di_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

