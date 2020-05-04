
instance DIA_ADDON_OWEN_EXIT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 999;
	condition = dia_addon_owen_exit_condition;
	information = dia_addon_owen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_owen_exit_condition()
{
	return TRUE;
};

func void dia_addon_owen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_OWEN_PICKPOCKET(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 900;
	condition = dia_addon_owen_pickpocket_condition;
	information = dia_addon_owen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_owen_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_owen_pickpocket_info()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_BACK,dia_addon_owen_pickpocket_back);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_PICKPOCKET,dia_addon_owen_pickpocket_doit);
};

func void dia_addon_owen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_owen_pickpocket);
};

func void dia_addon_owen_pickpocket_back()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
};


instance DIA_ADDON_OWEN_HELLO(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_hello_condition;
	information = dia_addon_owen_hello_info;
	important = TRUE;
};


func int dia_addon_owen_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_hello_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Všechno v poøádku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//A ty jsi KDO? Jsi jedním z banditù?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//Vypadám tak?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nosíš naše obleèení, ale neznám tì.
	}
	else if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Kdybych mìl být upøímný, øekl bych ti, abys to udìlal.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Ne. Jak se tak dívám na tvoje šaty, tak bych øekl, že jsi zdaleka.
	};
};


instance DIA_ADDON_OWEN_WASMACHEN(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_wasmachen_condition;
	information = dia_addon_owen_wasmachen_info;
	description = "Co tady dìláš?";
};


func int dia_addon_owen_wasmachen_condition()
{
	if(MALCOM_ACCIDENT == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jsem døevorubec a sekám døíví pro náš tábor.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//Vláèím se sem za touto vyèerpávající prací a jiní si lenoší na slunci.
};


instance DIA_ADDON_OWEN_PERM(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 99;
	condition = dia_addon_owen_perm_condition;
	information = dia_addon_owen_perm_info;
	permanent = TRUE;
	description = "Co jiného?";
};


func int dia_addon_owen_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_wasmachen) || Npc_KnowsInfo(other,dia_addon_owen_malcomstunt))
	{
		return TRUE;
	};
};

func void dia_addon_owen_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Co jiného?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Pokud bych všehno tohle vìdìl døív, nestal bych se pirátem.
};


instance DIA_ADDON_OWEN_HENRY(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_henry_condition;
	information = dia_addon_owen_henry_info;
	permanent = TRUE;
	description = "Henry èeká na doruèení døava na palisádu.";
};


func int dia_addon_owen_henry_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_RUNNING) && (OWEN_COMESTOHENRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_henry_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry èeká na doruèení døava na palisádu.
	if(MIS_OWEN_FINDMALCOM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//První chci vìdìt, co se stalo s mým kámošem Malcomem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dobøe, dobøe. Pøesvìdèím se, jestli dostane to jeho hloupé døevo.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Jdi zpátky a vyøiï mu to.
		b_logentry(TOPIC_ADDON_HOLOWEN,"Øekl jsem Henrymu, že Owen tu dodávku døeva doruèí.");
		AI_StopProcessInfos(self);
		OWEN_COMESTOHENRY = TRUE;
	};
};


instance DIA_ADDON_OWEN_MALCOMSTUNT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_malcomstunt_condition;
	information = dia_addon_owen_malcomstunt_info;
	description = "Co je?";
};


func int dia_addon_owen_malcomstunt_condition()
{
	if(MALCOM_ACCIDENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomstunt_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Co je?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//Mùj kámoš Malcom poøád chybí.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Zaútoèil na nás jeden z tìch èíhavcù.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Tak jsme se schovali do této jeskynì.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Bohužel ten èíhavec pøišel za námi.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcom s ním bojoval a pak s ním spadl tady to té díry.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Vypadá to, že je tam voda.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Malcom s èíhavcem ještì chvíli bojovali. Potom ale nastalo úplné ticho.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nemám tušení jestli je ještì na živu nebo ne.
	Log_CreateTopic(TOPIC_ADDON_MALCOMSSTUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MALCOMSSTUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Owen chce vìdìt, jestli jeho kamarád Malcom stále žije. Spadl totiž s èíhavcem do hluboké propasti vedle tábora.");
	Log_AddEntry(TOPIC_ADDON_MALCOMSSTUNT,"Owen øíkal, že je tam dole vodopád a že Malcom byl ještì chvíli na živu. Ale krátce na to bylo všude ticho.");
	MIS_OWEN_FINDMALCOM = LOG_RUNNING;
};


instance DIA_ADDON_OWEN_RUNTER(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_runter_condition;
	information = dia_addon_owen_runter_info;
	description = "Jak bych se mohl dostat do té štìrbiny?";
};


func int dia_addon_owen_runter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING) && (Npc_HasItems(malcom,itwr_twohstoneplate3_addon) > 0))
	{
		return TRUE;
	};
};

func void dia_addon_owen_runter_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak bych se mohl dostat do té štìrbiny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Kdo ví. Ale hádal bych, že jedinì šplháním nebo skákáním.
};


instance DIA_ADDON_OWEN_MALCOMDEAD(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_malcomdead_condition;
	information = dia_addon_owen_malcomdead_info;
	description = "Tvùj kámoš Malcom je mrtvý.";
};


func int dia_addon_owen_malcomdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING) && (Npc_HasItems(malcom,itwr_twohstoneplate3_addon) == 0))
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomdead_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Tvùj kámoš Malcom je mrtvý.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//Toho jsem se obával. Chudák. Mìl jsem mu pomoct.
	if(SC_MADESTUNT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//Máš opravdu odvahu, víš to?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Nikdy bych to nemohl udìlat.
	};
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Informoval jsem Owena o Malcomovì smrti. Vzal to docela dobøe.");
	MIS_OWEN_FINDMALCOM = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_OWEN_MALCOMDEAD);
};

