
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(smutn�) Co chce�?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "Nem�m �as, mus�m rozd�lovat klob�sy.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Nem�m �as, mus�m rozd�lovat klob�sy.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//D�ky. Douf�m, �e to nen� posledn� klob�sa, kterou jsem tu dostal.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Poru�il jsem z�kony tohoto spole�enstv�.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Te� �ek�m na rozhodnut� Nejvy��� rady, jestli budu moci z�stat v kl�te�e.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "�ekni mi, co se stalo.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//�ekni mi, co se stalo.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Kdy� jsem zametal, vzal jsem knihu z komnat m�g�, abych si ji mohl pozd�ji p�e��st.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistr Hyglas si toho samoz�ejm� okam�it� v�iml a na tu knihu se m� zeptal.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Ze strachu p�ed trestem jsem zalhal - ale pozd�ji m� nachytal s tou knihou v m� cele.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Stra�n� se rozzlobil a �ekl o tom Nejvy��� rad�. Te� prob�raj�, jestli mohu z�stat.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Je n�co, jak bych ti mohl pomoci?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Je n�co, jak bych ti mohl pomoci?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Ne, odevzdal jsem se na milost Innosovi a m�g�m.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hele, v�n� jsi po�adoval Zkou�ku ohn�?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Ano. A m�m v �myslu ji slo�it.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobr� - mo�n� bych ti s t�m mohl pomoci. M��u ti d�t velice u�ite�n� kouzeln� svitek. Kouzlo SP�NKU. M� z�jem?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Ne, nepot�ebuji tvou pomoc.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Co za to chce�?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"K �emu mi bude?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//K �emu mi bude?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//S pomoc� tohohle kouzla m��e� kohokoliv na chv�li uvrhnout do magick�ho sp�nku. Ov�em jenom v p��pad�, �e je jeho v�le slab�� ne� tvoje.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To by se mohlo hodit, pokud bude� n�koho pot�ebovat odklidit z cesty.
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A jak zjist�m, jestli m� ten doty�n� slab�� v�li ne� j�?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Ani se to nenam�hej zkou�et na m�gy. Ale v�t�inu novic� bys tak m�l uspat.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Ne, nepot�ebuji tvou pomoc.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Pokud bys n�hodou zm�nil n�zor, m��e� za mnou kdykoliv p�ij�t.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chce�?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Ka�d� m�g, kter� u zkou�ky usp�je, m��e m�t jedno p��n�.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Pokud se ti opravdu poda�� proj�t Zkou�kou ohn�, mo�n� bys mohl za��dit, abych z�stal tady v kl�te�e.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Ne, nepot�ebuji tvou pomoc.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Dobr�, dej mi ten kouzeln� svitek.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobr�, dej mi ten kouzeln� svitek.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//P�eji ti hodn� �t�st� u zkou�ky. A� je ti Innos n�pomocen.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Dyrian mi v�noval svitek s usp�vac�m kouzlem. Na opl�tku se m�m - a� budu m�gem - postarat, aby ho v kl�te�e nechali i nad�le.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "Zm�nil jsem n�zor. Dej mi to usp�vac� kouzlo.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Zm�nil jsem n�zor. Dej mi to usp�vac� kouzlo.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobr�, ale kdy� zkou�kou projde�, za��d�, abych mohl z�stat v kl�te�e.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(radostn�) D�ky, zachr�nils m�!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(ustra�en�) Ach, promi�, mist�e. Necht�l jsem se vt�rat.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(zdvo�ile) D�kuji ti, �e mohu z�stat zde v kl�te�e. Od t�to chv�le se cel� m�j �ivot zm�n�.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak se vede?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dob�e. M�m zdej�� pr�ci opravdu r�d, mist�e.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//D�kuji Innosovi, �e mohu b�t zde v kl�te�e.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Na co se m� to pt�? Vkl�dal jsem do tebe ve�ker� sv� nad�je a tys m� nechal na holi�k�ch.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Te� u� nem�m nic ne� pit�. A je to tvoje chyba!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Tady m� 5 zla��k�.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"M��u v�echno vysv�tlit.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Pod�vej, co ��k�.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Na, tady m� 5 zlat�ch.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(nerv�zn�) 5 zlat�ch? D�v� mi 5 zlat�ch a chce� se tak revan�ovat za to, �es mi zni�il �ivot?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Vezmu si v�echno tvoje zlato!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//M��u v�echno vysv�tlit.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Nech si svoje lacin� v�mluvy.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//L�e� poka�d�, kdy� otev�e� �sta. Nech m� b�t.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Pod�vej, co ��k�.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Jo, jen do toho, jen m� zastra�uj. To ti nijak nepom��e.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//�eknu cel�mu sv�tu, co jsi za pokryteckou svini! Hned jak dopiju tuhle fla�ku...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//B� mi z o��, je mi z tebe nanic!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Aaa, nech m� na pokoji! U� s tebou nechci m�t nic spole�n�ho!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

