
func void b_lastwarningvatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//Co jsi to ud�lal mizero?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//My z ��du Vody jsme t� opakovan� varovali p�ed odd�v�n�m se zlu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//K m�m u��m se doneslo, �e jsi opustil cestu trval� rovnov�hy.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//Vra�d�c� a plundruj�c� proch�zel jsi krajem, obt�k�n pocitem viny z mnoha zlo�in�.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//Bezpo�et nevinn�ch lid� bylo zavra�d�no TVOU rukou.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//Te� jsi spojen s temn�mi silami.
};

func void b_vatraspissedoff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//Od te� ji� nem��e� po��tat s mou podporou.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//Odejdi. Jsi pro m� vyvrhel.
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

