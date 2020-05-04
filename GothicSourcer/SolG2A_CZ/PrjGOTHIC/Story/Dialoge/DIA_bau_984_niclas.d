
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
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Taky jsi na �t�ku?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Pro� si to mysl�?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Pro� bys sem jinak chodil tak s�m? Tady nen� v�bec NIC.
};


instance DIA_NICLAS_HAVEALOOK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_havealook_condition;
	information = dia_niclas_havealook_info;
	permanent = FALSE;
	description = "Jen jsem se tu cht�l trochu porozhl�dnout po okol�.";
};


func int dia_niclas_havealook_condition()
{
	return TRUE;
};

func void dia_niclas_havealook_info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Jen jsem se tu cht�l trochu porozhl�dnout po okol�.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Dobr�, pova�uj se za m�ho hosta. Dal by sis kousek masa?
	CreateInvItems(self,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
	Info_AddChoice(dia_niclas_havealook,"Ne, d�ky.",dia_niclas_havealook_no);
	Info_AddChoice(dia_niclas_havealook,"S pot�en�m.",dia_niclas_havealook_yes);
};

func void dia_niclas_havealook_no()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Ne, d�ky.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Jak je libo. Douf�m, �e ti nebude vadit, kdy� si s�m n�co zakousnu.
	b_useitem(self,itfomutton);
	Info_ClearChoices(dia_niclas_havealook);
};

func void dia_niclas_havealook_yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//S pot�en�m.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Tady, ta nejlep�� krysokrt� kejti�ka. Podle m�ho vlastn�ho receptu.
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
	description = "Tak pro� jsi tady?";
};


func int dia_niclas_whyhere_condition()
{
	return TRUE;
};

func void dia_niclas_whyhere_info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Tak pro� jsi tady?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Nalezl jsem tu klid. Ve m�st� jsem se v�dycky c�til tak st�sn�n�.
};


instance DIA_NICLAS_SHOULDNTWORK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_shouldntwork_condition;
	information = dia_niclas_shouldntwork_info;
	permanent = FALSE;
	description = "Nem�l bys pracovat?";
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
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Nem�l bys pracovat?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//V�echno, co pot�ebuju, si m��u ud�lat s�m. Vyr�b�m si ��py a p��roda mi poskytuje maso.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//Tak�e jsi lovec.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Ano, pokud tomu tak chce� ��kat. Ale lov�m jen pro vlastn� pot�ebu. Nelov�m pro pen�ze.
};


instance DIA_NICLAS_CANTEACHME(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_canteachme_condition;
	information = dia_niclas_canteachme_info;
	permanent = FALSE;
	description = "V tom p��pad� bys m� mohl n�co nau�it.";
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
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//V tom p��pad� bys m� mohl n�co nau�it.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Pro� ne. M��u ti uk�zat, jak se zach�z� s lukem.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Niclas mi m��e p�edv�st, jak se zdokonalit v lukost�elb�.");
};


instance DIA_NICLAS_TEACH(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_teach_condition;
	information = dia_niclas_teach_info;
	permanent = TRUE;
	description = "Uka� mi, jak se zach�z� s lukem.";
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
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Uka� mi, jak se zach�z� s lukem.
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//U� jsem t� nau�il v�emu, co zn�m. M�l by sis naj�t jin�ho u�itele.
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
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//U� t� nem��u nau�it ni�emu dal��mu.
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

