
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
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//(potichu) � - kone�n�. U� jsem na tebe �ekal, cizin�e.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Co ode m� chce�?",dia_attila_hallo_was);
	Info_AddChoice(dia_attila_hallo,"Kdo jsi?",dia_attila_hallo_wer);
	b_giveplayerxp(XP_ATTILA_METHIM);
};

func void dia_attila_hallo_wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//��kaj� mi Attila... Ale copak je moje jm�no d�le�it�? Na�e jm�na jsou nepodstatn�.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//To bys m�l v�d�t l�p ne� j�, cizin�e. (tich� sm�ch)
	KNOWS_ATTILA_WER = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WAS == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Co ode m� chce�?",dia_attila_hallo_was);
	};
	Info_AddChoice(dia_attila_hallo,"Co je to za fra�ku?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//Co ode m� chce�?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//Jsem tu, abych ti vysv�tlil p�r v�c�. A pak jsem tu proto, abych t� zabil.
	KNOWS_ATTILA_WAS = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WER == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Kdo jsi?",dia_attila_hallo_wer);
	};
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Co je to za fra�ku?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//Co je to za fra�ku?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//Nem�l bys svou cestu kon�it tak neznal�. Pova�uj to za posledn� uk�zku �cty k odsouzen�mu.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Te� u� p�jdu. (KONEC)",dia_attila_hallo_ende);
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Pro� m� chce� zab�t?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//Pr�v� odch�z�m.
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//Je mi l�to... to ti nem��u dovolit. Smi� se s t�m. Nastal �as zem��t.
	AI_DrawWeapon(self);
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Kdo ti za to zaplatil?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Pro� m� chce� zab�t?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Kdo ti za to zaplatil?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//Moji zam�stnavatel� pracuj� v utajen�, stejn� jako j�.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//Sou��st� na�� dohody je i podm�nka, �e nebudu zmi�ovat ani jejich jm�na, ani jejich adresy.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Pro� m� chce� zab�t?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Pro� m� chce� zab�t?
	if(BETRAYAL_HALVOR == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//Udal jsi Halvora. Te� sed� ve v�zen�. To nebylo sou��st� pl�nu.
	};
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//Prodal jsi Rengara. Je to jen malej zlod�j��ek, ale tos nem�l d�lat.
	};
	if(NAGUR_AUSGELIEFERT == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Nagur je kv�li tob� za m��emi. Neodpustiteln� chyba, jak se zd�.
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//M� zam�stnavatel� z toho nemaj� zrovna velkou radost. Aby ti zabr�nili ud�lat n�jakou dal�� chybu, poslali m�.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"M��u ti d�t zlato...",dia_attila_hallo_gold);
	Info_AddChoice(dia_attila_hallo,"Tak m� alespo� nech tasit zbra�.",dia_attila_hallo_attacke);
};

func void dia_attila_hallo_gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//M��u ti d�t zlato - spoustu zlata.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Sm�la. Proto tady nejsem. Jedinou cenu, kterou zaplat�, je tv�j �ivot. A to pr�v� te�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_attila_hallo_attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Tak m� alespo� nech tasit zbra�.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Dobr�, tak se p�iprav na sv�j posledn� boj.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//��dn� se ti u opasku nehoupe. U� ti nezb�v� mnoho �asu, cizin�e. Smrt u� t� o�ek�v�.
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
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//� - kone�n�. U� jsem na tebe �ekal, cizin�e.
	b_giveplayerxp(XP_ATTILA_FRIEND);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Kdo jsi a co ode m� chce�?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//To nen� d�le�it�. Co je d�le�it�, jsou tv� skutky. Z�stal jsi v�rn�, dokonce ani� bys o tom v�d�l.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Jist� dobrodinci si v�imli tv� loajality. A nab�dli ti �anci. Tak ji vyu�ij.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Hele, prost� mi �ekni, pro� jsi tady.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//M�m pro tebe d�rek. Ostatn� u� je na tob�, cizin�e. (tich� sm�ch)
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
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//M�j �kol je spln�n, alespo� prozat�m.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//Ale mo�n� se na�e cesty znovu setkaj�.
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
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//��kaj� mi Attila... Ale copak je moje jm�no d�le�it�? Na�e jm�na jsou nepodstatn�.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//To bys m�l v�d�t l�p ne� j�, cizin�e. (tich� sm�ch)
	AI_StopProcessInfos(self);
};

