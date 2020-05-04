
func void b_lastwarningvatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//Co jsi to udìlal mizero?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//My z øádu Vody jsme tì opakovanì varovali pøed oddáváním se zlu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//K mým uším se doneslo, že jsi opustil cestu trvalé rovnováhy.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//Vraždící a plundrující procházel jsi krajem, obtìžkán pocitem viny z mnoha zloèinù.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//Bezpoèet nevinných lidí bylo zavraždìno TVOU rukou.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//Teï jsi spojen s temnými silami.
};

func void b_vatraspissedoff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//Od teï již nemùžeš poèítat s mou podporou.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//Odejdi. Jsi pro mì vyvrhel.
	if(VATRAS_ISONBOARD == LOG_SUCCESS)
	{
		CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	};
	VATRAS_ISONBOARD = LOG_FAILED;
	self.flags = 0;
	VATRASPISSEDOFFFOREVER = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

