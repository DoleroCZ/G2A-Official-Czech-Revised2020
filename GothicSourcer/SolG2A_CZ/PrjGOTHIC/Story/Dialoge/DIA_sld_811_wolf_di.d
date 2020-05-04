
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
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Tos MUSEL br�t s sebou Benneta, chlape?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//V �em je probl�m?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//�le, vlastn� nic. Jen si ud�lej, co mus�, a pak odsud zmizni, jo?
	}
	else if(DIA_WOLF_DI_HALLO_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Tahle kov�rna nen� zrovna nejlep��, ale mysl�m, �e ji trochu vyzkou��m.
		b_giveplayerxp(XP_AMBIENT);
		DIA_WOLF_DI_HALLO_ONETIME = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//Mohl bys mi ukout n�jakou zbroj?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Je mi l�to, chlape, ale s t�mhle n��ad�m nic nepo��d�m. To bude muset po�kat, a� doraz�me na pevninu.
	};
};


instance DIA_WOLF_DI_TRAINING(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 10;
	condition = dia_wolf_di_training_condition;
	information = dia_wolf_di_training_info;
	permanent = TRUE;
	description = "Vycvi� m� pros�m v boji na d�lku.";
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
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Vycvi� m� pros�m v boji na d�lku.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//V jak�m konkr�tn�?
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
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//Luk je na rozd�l od ku�e dost neskladn�, a proto vy�aduje spoustu m�sta. V�dycky si proto d�vej pozor, abys m�l p�i boji okolo sebe dostatek voln�ho prostoru.
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
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//P�i v�st�elu ti mus� t�tiva v prstech klouzat - kdy� ji bude� dr�et k�e�ovit�, m��e� t�m ��p �pln� vych�lit z dr�hy.
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
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//P�i st�elb� z ku�e mus� st�t absolutn� v klidu. Kohoutek je proto t�eba ma�kat velmi pomalu a opatrn�.
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
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Chytr� ku�in�k si tak� v��m�, kudy zrovna vane v�tr, a nesna�� se st��let p��mo proti n�mu.
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
	description = "Je v�echno v po��dku?";
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
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//Jasn�. A co ty? Bylo to drsn�, co?
	if(DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Kam te� p�jde�?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Kamkoliv, jen ne zp�tky. Khorinisu u� m�m pln� zuby.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Mn� je taky jedno, kam poplujeme, jenom kdy� odsud kone�n� vypadneme.
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

