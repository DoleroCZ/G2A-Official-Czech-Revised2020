
instance DIA_ADDON_MYXIR_EXIT(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 999;
	condition = dia_addon_myxir_exit_condition;
	information = dia_addon_myxir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_HALLO(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_hallo_condition;
	information = dia_addon_myxir_hallo_info;
	description = "Vše v poøádku?";
};


func int dia_addon_myxir_hallo_condition()
{
	return TRUE;
};

func void dia_addon_myxir_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Vše v poøádku?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Jsi odvážný znovu se ukázat.
};


instance DIA_ADDON_MYXIR_WASMACHSTDU(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_wasmachstdu_condition;
	information = dia_addon_myxir_wasmachstdu_info;
	description = "Co tady dìláš?";
};


func int dia_addon_myxir_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Studuji jazyk stavitelù.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//Jazyk je klíè k vìdomostem tìchto starých kultur.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Každý z nás se ho musí nauèit, jinak tahle expedice skonèí døív, než zaèala.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Stavitelé používali kamenné desky, aby šíøili své znalosti. Bohužel mnoho z nich bylo už dávno rozbito nebo ukradeno.
};


instance DIA_ADDON_MYXIR_STEINTAFELN(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_steintafeln_condition;
	information = dia_addon_myxir_steintafeln_info;
	description = "Co je napsáno na tìchto kamenných deskách?";
};


func int dia_addon_myxir_steintafeln_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_steintafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//Co je napsáno na tìchto kamenných deskách?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//Obsahují veškeré znalosti prastarého obyvatelstva.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Nìkteré z nich magicky zvyšují znalosti o boji a magii.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Pro nìkoho, kdo je umí èíst, pøedstavují opravdový poklad.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,"Kamenné desky obsahují moudrost starých lidí stavitelù. Nìkteré z nich magicky zvýší znalosti boje a magie. Ale potøebuji je umìt rozluštit.");
};


instance DIA_ADDON_MYXIR_WILLYOUTEACHME(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 10;
	condition = dia_addon_myxir_willyouteachme_condition;
	information = dia_addon_myxir_willyouteachme_info;
	description = "Mùžeš mì nauèit èíst ten starý jazyk?";
};


func int dia_addon_myxir_willyouteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_willyouteachme_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Mùžeš mì nauèit èíst ten starý jazyk?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//Proè ne? Pøedám ti své znalosti.
	MYXIR_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_MYXIRTEACH);
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
};


instance DIA_ADDON_MYXIR_TEACH(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 90;
	condition = dia_addon_myxir_teach_condition;
	information = dia_addon_myxir_teach_info;
	permanent = TRUE;
	description = "Nauè mì cizí jazyk.";
};


var int dia_addon_myxir_teach_noperm;

func int dia_addon_myxir_teach_condition()
{
	if((MYXIR_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_teach);
		Info_AddChoice(dia_addon_myxir_teach,DIALOG_BACK,dia_addon_myxir_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

