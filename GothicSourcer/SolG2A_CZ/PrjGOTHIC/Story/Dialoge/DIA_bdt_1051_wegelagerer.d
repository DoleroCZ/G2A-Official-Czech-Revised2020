
instance DIA_1051_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 999;
	condition = dia_1051_wegelagerer_exit_condition;
	information = dia_1051_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int bdt_1051_wegelagerer_angriff;

func int dia_1051_wegelagerer_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_question) || (BDT_1051_WEGELAGERER_ANGRIFF == TRUE))
	{
		return TRUE;
	};
};

func void dia_1051_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
	if(BDT_1051_WEGELAGERER_ANGRIFF == TRUE)
	{
		self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_1051_WEGELAGERER_HELLO(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_wegelagerer_hello_condition()
{
	if(BDT_1051_WEGELAGERER_ANGRIFF == FALSE)
	{
		return TRUE;
	};
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Hello_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Hello_07_01");	//Co je ti do toho?
};


instance DIA_1051_WEGELAGERER_NOVICE(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_novice_condition;
	information = dia_wegelagerer_novice_info;
	permanent = FALSE;
	description = "Hledám jednoho novice.";
};


func int dia_wegelagerer_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_novice_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Novice_15_00");	//Hledám jednoho novice.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Novice_07_01");	//To je zajímavé. Taky nìkoho hledáme.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_novice,"Koho hledáš?",dia_1051_wegelagerer_question_novice_who);
};


instance DIA_1051_WEGELAGERER_QUESTION(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_question_condition;
	information = dia_wegelagerer_question_info;
	permanent = FALSE;
	description = "Jenom se ptám.";
};


func int dia_wegelagerer_question_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_hello) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_question_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_15_00");	//Jenom se ptám.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_01");	//Jasný. Ale co tady dìláš?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_02");	//Mimochodem, tohle je naše cesta a nemáme rádi, když nás tu nìkdo obtìžuje.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		Info_AddChoice(dia_1051_wegelagerer_question,"Hledám jednoho novice.",dia_1051_wegelagerer_question_novice);
	};
	Info_AddChoice(dia_1051_wegelagerer_question,"Do toho ti nic není.",dia_1051_wegelagerer_question_myconcern);
	Info_AddChoice(dia_1051_wegelagerer_question,"Jen se tu kolem trochu rozhlížím.",dia_1051_wegelagerer_question_lookaround);
};

func void dia_1051_wegelagerer_question_novice()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_15_00");	//Hledám jednoho novice.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_07_01");	//To je zajímavé. Taky nìkoho hledáme.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"Koho hledáš?",dia_1051_wegelagerer_question_novice_who);
};

func void dia_1051_wegelagerer_question_novice_who()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00");	//A kdo to jako má být?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01");	//Ty!
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_myconcern()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_15_00");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01");	//Co tím myslíš? Toužíš po problémech?
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"Ne, nic takového. Žádný problémy.",dia_1051_wegelagerer_question_myconcern_no);
	Info_AddChoice(dia_1051_wegelagerer_question,"Když na tom trváš.",dia_1051_wegelagerer_question_myconcern_yes);
};

func void dia_1051_wegelagerer_question_myconcern_no()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00");	//Ne, nic takového. Žádný problémy.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01");	//Rozumím, nadìlal sis do kalhot. Teï se zdejchni.
	AI_StopProcessInfos(self);
};

func void dia_1051_wegelagerer_question_myconcern_yes()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00");	//Když na tom trváš.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01");	//Hele, hele, máš nìjak nevymáchanou hubu.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02");	//Už je naèase, abych ti ji zavøel.
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_lookaround()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_LookAround_15_00");	//Jen se tu kolem trochu rozhlížím.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01");	//Klidnì si v tom pokraèuj, ale pøestaò nás otravovat.
	AI_StopProcessInfos(self);
};


instance DIA_WEGELAGERER_ANGRIFF(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 2;
	condition = dia_wegelagerer_angriff_condition;
	information = dia_wegelagerer_angriff_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_wegelagerer_angriff_condition()
{
	var C_NPC pal;
	pal = Hlp_GetNpc(bdt_1052_wegelagerer);
	if((Npc_RefuseTalk(self) == FALSE) && ((BDT_1051_WEGELAGERER_ANGRIFF == TRUE) || c_npcisdown(pal)))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_angriff_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF_07_00");	//To je pro tebe.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

