
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
	description = "Haló, krásná paní služebná.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Haló, krásná paní služebná.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Pøestaò s tìmi sladkými øeèièkami, hochu. Øekni, co chceš. Mám práci.
};


instance DIA_BABERA_WIESIEHTSAUS(C_INFO)
{
	npc = bau_934_babera;
	nr = 2;
	condition = dia_babera_wiesiehtsaus_condition;
	information = dia_babera_wiesiehtsaus_info;
	description = "Jak pokraèujou polní práce?";
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
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//Jak pokraèujou polní práce?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Podívej se na ty obrovský lány, co musíme obdìlávat, a bude ti to jasné.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Hledáš snad rolnickou práci?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"Ne. Vlastnì se chci stát žoldákem.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"Možná.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Možná.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//V tom pøípadì bys mìl zajít za Sekobem, tím starým otrokáøem. Možná pro tebe nìco bude mít.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Taky mùžeš samozøejmì zkusit Onarovu farmu na konci téhle dlouhé cesty.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Ale dej si pozor na žoldáky. Nemaj rádi cizince.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//Ne. Vlastnì se chci stát žoldákem.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//Tak to tady jsi špatnì. Žoldáky najdeš na farmì velkostatkáøe.
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
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//Øekni, ten hnusnej chlápek tamhle...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//To je Bronco. Co s ním?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//To je váš farmáø?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(smích) Tak tohle ti øekl? Náš farmáø je Sekob. Bronco není nic než povaleè a budižknièemu. Ale je silnej jako bejk.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//Proto mu taky nikdo nic neøekne, když nic nedìlá.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Nebojí se nikoho jiného než vás, žoldnéøù.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Jedinej, kdo ho mùže pøimìt k práci, je nìkdo od žoldákù. Bojí se jich.
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
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//Už to tu nemohla dýl vydržet, tak odešla na sever, do lesa.
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi uprchla ze Sekobova statku. Podle Babery míøila na sever, do lesù.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Rosi uprchla ze Sekobova statku. Podle Babery míøila na sever, do lesù.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "A kromì toho?";
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
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//A kromì toho?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Mám práci.
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

