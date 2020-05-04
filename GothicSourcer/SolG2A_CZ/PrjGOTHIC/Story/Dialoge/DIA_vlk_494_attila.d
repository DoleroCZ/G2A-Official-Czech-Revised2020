
instance DIA_ATTILA_EXIT(C_INFO)
{
	npc = vlk_494_attila;
	nr = 999;
	condition = dia_attila_exit_condition;
	information = dia_attila_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_attila_exit_condition()
{
	return TRUE;
};

func void dia_attila_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_PICKPOCKET(C_INFO)
{
	npc = vlk_494_attila;
	nr = 900;
	condition = dia_attila_pickpocket_condition;
	information = dia_attila_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_attila_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_attila_pickpocket_info()
{
	Info_ClearChoices(dia_attila_pickpocket);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_BACK,dia_attila_pickpocket_back);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_PICKPOCKET,dia_attila_pickpocket_doit);
};

func void dia_attila_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_attila_pickpocket);
};

func void dia_attila_pickpocket_back()
{
	Info_ClearChoices(dia_attila_pickpocket);
};


instance DIA_ATTILA_HALLO(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_hallo_condition;
	information = dia_attila_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_hallo_condition()
{
	if(MIS_THIEFGUILD_SUCKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_attila_hallo_info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//(potichu) Á - koneènì. Už jsem na tebe èekal, cizinèe.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Co ode mì chceš?",dia_attila_hallo_was);
	Info_AddChoice(dia_attila_hallo,"Kdo jsi?",dia_attila_hallo_wer);
	b_giveplayerxp(XP_ATTILA_METHIM);
};

func void dia_attila_hallo_wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Øíkají mi Attila... Ale copak je moje jméno dùležité? Naše jména jsou nepodstatná.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//To bys mìl vìdìt líp než já, cizinèe. (tichý smích)
	KNOWS_ATTILA_WER = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WAS == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Co ode mì chceš?",dia_attila_hallo_was);
	};
	Info_AddChoice(dia_attila_hallo,"Co je to za frašku?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//Co ode mì chceš?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//Jsem tu, abych ti vysvìtlil pár vìcí. A pak jsem tu proto, abych tì zabil.
	KNOWS_ATTILA_WAS = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WER == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Kdo jsi?",dia_attila_hallo_wer);
	};
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Co je to za frašku?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//Co je to za frašku?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//Nemìl bys svou cestu konèit tak neznalý. Považuj to za poslední ukázku úcty k odsouzenému.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Teï už pùjdu. (KONEC)",dia_attila_hallo_ende);
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Proè mì chceš zabít?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//Právì odcházím.
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//Je mi líto... to ti nemùžu dovolit. Smiø se s tím. Nastal èas zemøít.
	AI_DrawWeapon(self);
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Proè mì chceš zabít?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Kdo ti za to zaplatil?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//Moji zamìstnavatelé pracují v utajení, stejnì jako já.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//Souèástí naší dohody je i podmínka, že nebudu zmiòovat ani jejich jména, ani jejich adresy.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Proè mì chceš zabít?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Proè mì chceš zabít?
	if(BETRAYAL_HALVOR == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//Udal jsi Halvora. Teï sedí ve vìzení. To nebylo souèástí plánu.
	};
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//Prodal jsi Rengara. Je to jen malej zlodìjíèek, ale tos nemìl dìlat.
	};
	if(NAGUR_AUSGELIEFERT == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Nagur je kvùli tobì za møížemi. Neodpustitelná chyba, jak se zdá.
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//Mí zamìstnavatelé z toho nemají zrovna velkou radost. Aby ti zabránili udìlat nìjakou další chybu, poslali mì.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Mùžu ti dát zlato...",dia_attila_hallo_gold);
	Info_AddChoice(dia_attila_hallo,"Tak mì alespoò nech tasit zbraò.",dia_attila_hallo_attacke);
};

func void dia_attila_hallo_gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//Mùžu ti dát zlato - spoustu zlata.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Smùla. Proto tady nejsem. Jedinou cenu, kterou zaplatíš, je tvùj život. A to právì teï.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_attila_hallo_attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Tak mì alespoò nech tasit zbraò.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Dobrá, tak se pøiprav na svùj poslední boj.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//Žádná se ti u opasku nehoupe. Už ti nezbývá mnoho èasu, cizinèe. Smrt už tì oèekává.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,2);
	};
};


instance DIA_ATTILA_WILLKOMMEN(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_willkommen_condition;
	information = dia_attila_willkommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_willkommen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_THIEFGUILD_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_attila_willkommen_info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//Á - koneènì. Už jsem na tebe èekal, cizinèe.
	b_giveplayerxp(XP_ATTILA_FRIEND);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Kdo jsi a co ode mì chceš?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//To není dùležité. Co je dùležité, jsou tvé skutky. Zùstal jsi vìrný, dokonce aniž bys o tom vìdìl.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Jistí dobrodinci si všimli tvé loajality. A nabídli ti šanci. Tak ji využij.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Hele, prostì mi øekni, proè jsi tady.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//Mám pro tebe dárek. Ostatní už je na tobì, cizinèe. (tichý smích)
	b_giveinvitems(self,other,itke_thiefguildkey_mis,1);
	ATTILA_KEY = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AFTER");
};


instance DIA_ATTILA_NACHSCHLUESSEL(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_nachschluessel_condition;
	information = dia_attila_nachschluessel_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_attila_nachschluessel_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_wer) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_attila_nachschluessel_info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//Mùj úkol je splnìn, alespoò prozatím.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//Ale možná se naše cesty znovu setkají.
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_WER(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_wer_condition;
	information = dia_attila_wer_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_attila_wer_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_willkommen))
	{
		return TRUE;
	};
};

func void dia_attila_wer_info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Øíkají mi Attila... Ale copak je moje jméno dùležité? Naše jména jsou nepodstatná.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//To bys mìl vìdìt líp než já, cizinèe. (tichý smích)
	AI_StopProcessInfos(self);
};

