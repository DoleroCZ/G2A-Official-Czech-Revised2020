
instance DIA_ADDON_TOM_EXIT(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 999;
	condition = dia_addon_tom_exit_condition;
	information = dia_addon_tom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_tom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TOM_PICKPOCKET(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 900;
	condition = dia_addon_tom_pickpocket_condition;
	information = dia_addon_tom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_tom_pickpocket_condition()
{
	return c_beklauen(40,52);
};

func void dia_addon_tom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_BACK,dia_addon_tom_pickpocket_back);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_PICKPOCKET,dia_addon_tom_pickpocket_doit);
};

func void dia_addon_tom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_tom_pickpocket);
};

func void dia_addon_tom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
};


instance DIA_ADDON_TOM_HI(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 1;
	condition = dia_addon_tom_hi_condition;
	information = dia_addon_tom_hi_info;
	permanent = FALSE;
	description = "Pro� tu sed�?";
};


func int dia_addon_tom_hi_condition()
{
	return TRUE;
};

func void dia_addon_tom_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Pro� tu sed�?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Dostal jsem se do probl�m�. Te� m��e b�t chozen� do t�bora �patn� n�pad.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//M�l jsem slu�n� spojen� s n�kolika pir�ty, v�?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Poka�d� jsem potkal chlapy nedaleko t�bora kv�li obchodu.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Chlape, kupoval jsem proviant pro polovinu lid� z t�bora. 'Tome, obstarej mi tohle - Tome, obstarej mi tamto'.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A potom to bylo v�e ztraceno kv�li tomu zatracen�mu Estebanovi!
};


instance DIA_ADDON_TOM_JUAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 2;
	condition = dia_addon_tom_juan_condition;
	information = dia_addon_tom_juan_info;
	permanent = FALSE;
	description = "Jak to?";
};


func int dia_addon_tom_juan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_hi))
	{
		return TRUE;
	};
};

func void dia_addon_tom_juan_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban poslal jednoho z jeho lid�, Juana. On n�s pozoroval.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A potom, zrovna kdy� jsem smlouval obchod s pir�ty, ten chlap vylezl ze sv�ho �krytu a srazil je k zemi.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Chlap�e, ten chlap byl rychl�! Ale ne dost rychl�. Mohl jsem ut�ct.
	SC_KNOWS_JUANMURDEREDANGUS = TRUE;
	b_logentry(TOPIC_ADDON_KILLJUAN,"Tak je to Juan, kdo je zodpov�dn� za vra�du Hanka a Agnuse. P�epadl je a zabil je.");
};


instance DIA_ADDON_TOM_ESTEBAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 3;
	condition = dia_addon_tom_esteban_condition;
	information = dia_addon_tom_esteban_info;
	permanent = FALSE;
	description = "A od t� doby se tu schov�v�?";
};


func int dia_addon_tom_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_juan))
	{
		return TRUE;
	};
};

func void dia_addon_tom_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//A od t� doby se tu schov�v�?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Nejd��v jsem se vr�til do t�bora, abych to �ekl Fiskovi, Hunovi a ostatn�m, kte�� �ekali na z�silku.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//A Esteban je za to zodpov�dn�.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Asi budu mrtv�, jetli Esteban zjist�, �e jsem jim �ekl, �e je za t�m on.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Proto nejdu zp�tky do t�bora.
	TOM_TELLS = TRUE;
};


instance DIA_ADDON_TOM_DEAD(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 4;
	condition = dia_addon_tom_dead_condition;
	information = dia_addon_tom_dead_info;
	permanent = FALSE;
	description = "Esteban je mrtv�.";
};


func int dia_addon_tom_dead_condition()
{
	if(Npc_IsDead(esteban) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_dead_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban je mrtv�.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Opravdu? Chlape, to je to, �emu ��k�m �t�st�!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kdo ho zabil?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(�kleb� se) Noo, �ekn�me jenom, �e to byl n�kdo, koho zn� ...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//D�kuji mnohokr�t, �e jsi sem za�el. Te� se m��u vr�tit do t�bora ...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_ADDON_TOM_PERM(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 5;
	condition = dia_addon_tom_perm_condition;
	information = dia_addon_tom_perm_info;
	permanent = TRUE;
	description = "Je�t� n�co?";
};


func int dia_addon_tom_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Je�t� n�co?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Te� si m��u u��t pit� Luciin�ho drinku bez starost�.
	}
	else if(Npc_KnowsInfo(other,dia_addon_tom_dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Kone�n� se m��u vr�tit!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Hm? Obvykle tu sed�m a po��t�m kameny ...
	};
};

