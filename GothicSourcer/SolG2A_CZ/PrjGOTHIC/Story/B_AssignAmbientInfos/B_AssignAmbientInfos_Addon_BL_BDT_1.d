
instance DIA_ADDON_BL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_1_exit_condition;
	information = dia_addon_bl_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_1_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_1_chef_condition;
	information = dia_addon_bl_bdt_1_chef_info;
	permanent = TRUE;
	description = "Kdo tomu tady vel�?";
};


func int dia_addon_bl_bdt_1_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Kdo je tady ��f?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Hodn� se jich tu u� vyst��dalo ... nem��e� je v�echny zaregistrovat.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//V���m, �e Thorus je te� n� v�dce ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Raven je n� v�dce. Dovedl n�s sem a zalo�il t�bor.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Kontroluje d�l, jinak by se ti psi tady mezi sebou pozab�jeli u� d�vno kv�li zlatu.
	};
};


instance DIA_ADDON_BL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager_condition;
	information = dia_addon_bl_bdt_1_lager_info;
	permanent = FALSE;
	description = "Co v� o dolu?";
};


func int dia_addon_bl_bdt_1_lager_condition()
{
	if((SKLAVEN_FLUCHT == FALSE) || !Npc_IsDead(raven))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//Co v� o dolu?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Jak se uk�zalo, �e je tady zlat� d�l, tak se tady v�ichni navz�jem celkem sjednotili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Raven pak pozab�jel ty nejhor�� vzbou�ence a jejich kosti vyhodil z dolu.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od t� doby nikdo nem��e do vy��� �tvrti. Jinak by byl vzat jako v�ze� a posl�n kopat do dolu.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BL_BDT_1_LAGER2(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager2_condition;
	information = dia_addon_bl_bdt_1_lager2_info;
	permanent = TRUE;
	description = "Co v� o t�bo�e?";
};


func int dia_addon_bl_bdt_1_lager2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager2_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//Co v� o t�bo�e?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Kdy� na n�koho za�to��, V�ICHNI po tob� p�jdou.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//Pokud nem� dobr� d�vod. To t� pak nebude nikdo trestat.
};


instance DIA_ADDON_BL_BDT_1_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_1_news_condition;
	information = dia_addon_bl_bdt_1_news_info;
	permanent = TRUE;
	description = "N�co nov�ho? ";
};


func int dia_addon_bl_bdt_1_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//N�co nov�ho?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Raven je mrtv�. Co te� budeme d�lat?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Pir�ti n�s u� necht�j� p�ev�et, proto�e jsme jim za to neplatili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//M�li bychom jednoho nebo dva znich prop�chnout, to by jsme pak m�li zaji�t�n� odvoz.
};


instance DIA_ADDON_BL_BDT_1_SKLAVEN(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_1_sklaven_condition;
	information = dia_addon_bl_bdt_1_sklaven_info;
	permanent = TRUE;
	description = "Co v� o v�zn�ch?";
};


func int dia_addon_bl_bdt_1_sklaven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager) && ((SKLAVEN_FLUCHT == FALSE) || (RAVENISDEAD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_sklaven_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co v� o v�zn�ch?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Raven cht�l n�co vykopat. Nejprve to m�li d�lat banditi, ale mnoh�m se to nel�bilo.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//To byl ten d�vod, pro� pot�eboval v�zn� - kdy� zem�eli oni, nikomu to nevadilo.
	if(BDT_1_AUSBUDDELN == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co cht�l Raven vykopat?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nem�m tu�en�, ale �ekl bych, �e n�co v�c ne� zlato.
		BDT_1_AUSBUDDELN = TRUE;
	};
};

func void b_assignambientinfos_addon_bl_bdt_1(var C_NPC slf)
{
	dia_addon_bl_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_sklaven.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager2.npc = Hlp_GetInstanceID(slf);
};

