
instance DIA_BABERA_EXIT(C_INFO)
{
	npc = bau_934_babera;
	nr = 999;
	condition = dia_babera_exit_condition;
	information = dia_babera_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babera_exit_condition()
{
	return TRUE;
};

func void dia_babera_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_HALLO(C_INFO)
{
	npc = bau_934_babera;
	nr = 1;
	condition = dia_babera_hallo_condition;
	information = dia_babera_hallo_info;
	description = "Hal�, kr�sn� pan� slu�ebn�.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Hal�, kr�sn� pan� slu�ebn�.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//P�esta� s t�mi sladk�mi �e�i�kami, hochu. �ekni, co chce�. M�m pr�ci.
};


instance DIA_BABERA_WIESIEHTSAUS(C_INFO)
{
	npc = bau_934_babera;
	nr = 2;
	condition = dia_babera_wiesiehtsaus_condition;
	information = dia_babera_wiesiehtsaus_info;
	description = "Jak pokra�ujou poln� pr�ce?";
};


func int dia_babera_wiesiehtsaus_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_hallo))
	{
		return TRUE;
	};
};

func void dia_babera_wiesiehtsaus_info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//Jak pokra�ujou poln� pr�ce?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Pod�vej se na ty obrovsk� l�ny, co mus�me obd�l�vat, a bude ti to jasn�.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Hled� snad rolnickou pr�ci?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"Ne. Vlastn� se chci st�t �old�kem.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"Mo�n�.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Mo�n�.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//V tom p��pad� bys m�l zaj�t za Sekobem, t�m star�m otrok��em. Mo�n� pro tebe n�co bude m�t.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Taky m��e� samoz�ejm� zkusit Onarovu farmu na konci t�hle dlouh� cesty.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Ale dej si pozor na �old�ky. Nemaj r�di cizince.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//Ne. Vlastn� se chci st�t �old�kem.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//Tak to tady jsi �patn�. �old�ky najde� na farm� velkostatk��e.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};


instance DIA_BABERA_BRONKO(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_bronko_condition;
	information = dia_babera_bronko_info;
	description = "(Zeptat se na Bronca.)";
};


func int dia_babera_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && Npc_KnowsInfo(other,dia_babera_wiesiehtsaus))
	{
		return TRUE;
	};
};

func void dia_babera_bronko_info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//�ekni, ten hnusnej chl�pek tamhle...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//To je Bronco. Co s n�m?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//To je v� farm��?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(sm�ch) Tak tohle ti �ekl? N� farm�� je Sekob. Bronco nen� nic ne� povale� a budi�kni�emu. Ale je silnej jako bejk.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//Proto mu taky nikdo nic ne�ekne, kdy� nic ned�l�.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Neboj� se nikoho jin�ho ne� v�s, �oldn���.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Jedinej, kdo ho m��e p�im�t k pr�ci, je n�kdo od �old�k�. Boj� se jich.
	};
	BABERA_BRONKOKEINBAUER = TRUE;
};


instance DIA_BABERA_ROSI(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_rosi_condition;
	information = dia_babera_rosi_info;
	description = "Kde je Rosi?";
};


func int dia_babera_rosi_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING) && (KAPITEL >= 5) && (ROSIFOUNDKAP5 == FALSE))
	{
		return TRUE;
	};
};

func void dia_babera_rosi_info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//Kde je Rosi?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//U� to tu nemohla d�l vydr�et, tak ode�la na sever, do lesa.
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi uprchla ze Sekobova statku. Podle Babery m��ila na sever, do les�.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Rosi uprchla ze Sekobova statku. Podle Babery m��ila na sever, do les�.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "A krom� toho?";
};


func int dia_babera_dustoerst_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_bronko))
	{
		return TRUE;
	};
};

func void dia_babera_dustoerst_info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//A krom� toho?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//M�m pr�ci.
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_PICKPOCKET(C_INFO)
{
	npc = bau_934_babera;
	nr = 900;
	condition = dia_babera_pickpocket_condition;
	information = dia_babera_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_babera_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_babera_pickpocket_info()
{
	Info_ClearChoices(dia_babera_pickpocket);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_BACK,dia_babera_pickpocket_back);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_PICKPOCKET,dia_babera_pickpocket_doit);
};

func void dia_babera_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babera_pickpocket);
};

func void dia_babera_pickpocket_back()
{
	Info_ClearChoices(dia_babera_pickpocket);
};

