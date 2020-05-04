
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
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//A ty jsi KDO? Jsi jedn�m z bandit�?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//Vypad�m tak?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nos� na�e oble�en�, ale nezn�m t�.
	}
	else if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Kdybych m�l b�t up��mn�, �ekl bych ti, abys to ud�lal.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Ne. Jak se tak d�v�m na tvoje �aty, tak bych �ekl, �e jsi zdaleka.
	};
};


instance DIA_ADDON_OWEN_WASMACHEN(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_wasmachen_condition;
	information = dia_addon_owen_wasmachen_info;
	description = "Co tady d�l�?";
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
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jsem d�evorubec a sek�m d��v� pro n� t�bor.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//Vl���m se sem za touto vy�erp�vaj�c� prac� a jin� si leno�� na slunci.
};


instance DIA_ADDON_OWEN_PERM(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 99;
	condition = dia_addon_owen_perm_condition;
	information = dia_addon_owen_perm_info;
	permanent = TRUE;
	description = "Co jin�ho?";
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
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Co jin�ho?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Pokud bych v�ehno tohle v�d�l d��v, nestal bych se pir�tem.
};


instance DIA_ADDON_OWEN_HENRY(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_henry_condition;
	information = dia_addon_owen_henry_info;
	permanent = TRUE;
	description = "Henry �ek� na doru�en� d�ava na palis�du.";
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
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry �ek� na doru�en� d�ava na palis�du.
	if(MIS_OWEN_FINDMALCOM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//Prvn� chci v�d�t, co se stalo s m�m k�mo�em Malcomem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dob�e, dob�e. P�esv�d��m se, jestli dostane to jeho hloup� d�evo.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Jdi zp�tky a vy�i� mu to.
		b_logentry(TOPIC_ADDON_HOLOWEN,"�ekl jsem Henrymu, �e Owen tu dod�vku d�eva doru��.");
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
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//M�j k�mo� Malcom po��d chyb�.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Za�to�il na n�s jeden z t�ch ��havc�.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Tak jsme se schovali do t�to jeskyn�.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Bohu�el ten ��havec p�i�el za n�mi.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcom s n�m bojoval a pak s n�m spadl tady to t� d�ry.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Vypad� to, �e je tam voda.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Malcom s ��havcem je�t� chv�li bojovali. Potom ale nastalo �pln� ticho.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nem�m tu�en� jestli je je�t� na �ivu nebo ne.
	Log_CreateTopic(TOPIC_ADDON_MALCOMSSTUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MALCOMSSTUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Owen chce v�d�t, jestli jeho kamar�d Malcom st�le �ije. Spadl toti� s ��havcem do hlubok� propasti vedle t�bora.");
	Log_AddEntry(TOPIC_ADDON_MALCOMSSTUNT,"Owen ��kal, �e je tam dole vodop�d a �e Malcom byl je�t� chv�li na �ivu. Ale kr�tce na to bylo v�ude ticho.");
	MIS_OWEN_FINDMALCOM = LOG_RUNNING;
};


instance DIA_ADDON_OWEN_RUNTER(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_runter_condition;
	information = dia_addon_owen_runter_info;
	description = "Jak bych se mohl dostat do t� �t�rbiny?";
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
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak bych se mohl dostat do t� �t�rbiny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Kdo v�. Ale h�dal bych, �e jedin� �plh�n�m nebo sk�k�n�m.
};


instance DIA_ADDON_OWEN_MALCOMDEAD(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_malcomdead_condition;
	information = dia_addon_owen_malcomdead_info;
	description = "Tv�j k�mo� Malcom je mrtv�.";
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
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Tv�j k�mo� Malcom je mrtv�.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//Toho jsem se ob�val. Chud�k. M�l jsem mu pomoct.
	if(SC_MADESTUNT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//M� opravdu odvahu, v� to?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Nikdy bych to nemohl ud�lat.
	};
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Informoval jsem Owena o Malcomov� smrti. Vzal to docela dob�e.");
	MIS_OWEN_FINDMALCOM = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_OWEN_MALCOMDEAD);
};

