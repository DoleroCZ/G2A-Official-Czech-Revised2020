
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//STÁT - jménem Innose! Jsem Marcos, královský paladin. Øekni, co chceš, a mluv pravdu!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Innosùv Vyvolený mluví vždycky pravdu.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Odpus, ctihodný mágu. Neuvìdomil jsem si, s kým mluvím.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//V poøádku, nic se nestalo.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Pokud se mùžu zeptat - co tì sem pøivádí?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Uklidni se - jsem ve službách lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Jsi jeden z vojákù. Na jaký rozkaz tu jsi?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Klid, pracujeme pro stejného hlavouna - lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Odkdy lord Hagen najímá žoldáky? Mluv! Co tady pohledáváš?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "Musím pøinést lordu Hagenovi dùkaz, že draci existují.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Musím pøinést lordu Hagenovi dùkaz, že draci existují.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Pak bys nemìl ztrácet èas a zbyteènì riskovat život.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Myslíš, že tady najdeš draèí šupinu, kterou bys mu mohl pøinést?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Zkus se dostat do hradu a promluvit si s velitelem Garondem.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Musí se dozvìdìt, že tì posílá lord Hagen! Postará se o to, aby ses nevrátil s prázdnou.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "Pøicházím od Garonda...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//Pøicházím od Garonda. Potøebuje vìdìt, kolik rudy je pøipraveno k pøevozu.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Vyøiï Garondovi, že jsem musel opustit dùl, protože útoky skøetù zaèaly být pøíliš nebezpeèné.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Snažil jsem se dostat ke hradu ještì s nìkolika dalšími, ale pøežil jsem nakonec jen já.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Uložil jsem rudu do bezpeèí. Jsou to ÈTYØI truhly. Bìž za Garondem a nahlas mu to.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Øekni mu, že budu rudu støežit vlastním životem. Ale netuším, za jak dlouho mì tu skøeti vypátrají.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Vyøiï mu, aby mi poslal nìkoho na pomoc.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Vyøídím mu to.
	b_logentry(TOPIC_SCOUTMINE,"V malém údolíèku støeží paladin Marcos ÈTYØI bedny rudy.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"Marcos žádá, aby mu Garond poslal nìjakou pomoc.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Jak to vypadá?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Potøebuju poøádný lok léèivého lektvaru!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Vydržím - ale doufám, že mi Garond brzy pošle posily.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Dìkuji ti za pomoc. Innos nám dá sílu, abychom stáli pevnì jako skála.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Budu stát pevnì, protože je Innos se mnou!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

