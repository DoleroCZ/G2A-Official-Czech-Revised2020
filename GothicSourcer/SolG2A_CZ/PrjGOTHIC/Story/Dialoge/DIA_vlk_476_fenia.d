
instance DIA_FENIA_EXIT(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 999;
	condition = dia_fenia_exit_condition;
	information = dia_fenia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fenia_exit_condition()
{
	return TRUE;
};

func void dia_fenia_exit_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//P�knej den, pane paladin.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//P�eju bezpe�nou cestu, ctihodn� m�gu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_FENIA_PICKPOCKET(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 900;
	condition = dia_fenia_pickpocket_condition;
	information = dia_fenia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_fenia_pickpocket_condition()
{
	return c_beklauen(50,75);
};

func void dia_fenia_pickpocket_info()
{
	Info_ClearChoices(dia_fenia_pickpocket);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_BACK,dia_fenia_pickpocket_back);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_PICKPOCKET,dia_fenia_pickpocket_doit);
};

func void dia_fenia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fenia_pickpocket);
};

func void dia_fenia_pickpocket_back()
{
	Info_ClearChoices(dia_fenia_pickpocket);
};


instance DIA_FENIA_HALLO(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 3;
	condition = dia_fenia_hallo_condition;
	information = dia_fenia_hallo_info;
	important = TRUE;
};


func int dia_fenia_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_fenia_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//Vypad� n�jak utrm�cen�. Dlouho jsi nespal, co?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//Moc dlouho, dalo by se ��ct.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//Poj� sem, bl�. Se mnou najde� to, co hled�!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Fenia prod�v� p�i cest� do p��stavu j�dlo.");
};


instance DIA_FENIA_HANDELN(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_handeln_condition;
	information = dia_fenia_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_fenia_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_handeln_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_FENIA_INFOS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_infos_condition;
	information = dia_fenia_infos_info;
	permanent = FALSE;
	description = "��kala jsi, �e m�, co pot�ebuju. T�k� se to i informac�?";
};


func int dia_fenia_infos_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_infos_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//��kala jsi, �e m�, co pot�ebuju. T�k� se to i informac�?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//Ale samoz�ejm�. Co bys cht�l v�d�t?
};


instance DIA_FENIA_MORETRADERS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 11;
	condition = dia_fenia_moretraders_condition;
	information = dia_fenia_moretraders_info;
	permanent = FALSE;
	description = "Jsou tady v p��stavu je�t� n�jac� dal�� kupci?";
};


func int dia_fenia_moretraders_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_moretraders_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//Jsou tady v p��stavu je�t� n�jac� dal�� kupci?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//Kdy� se pust� po molu nalevo, naraz� na Halvora, m�ho mu�e. Prod�v� ryby.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//Na opa�n�m konci je Brahim, kartograf.
};


instance DIA_FENIA_OV(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 13;
	condition = dia_fenia_ov_condition;
	information = dia_fenia_ov_info;
	permanent = FALSE;
	description = "Zn� n�koho z horn� �tvrti?";
};


func int dia_fenia_ov_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_fenia_ov_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//Zn� n�koho z horn� �tvrti?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(sm�ch) Kdybych znala n�koho z horn� �tvrti, tak bych tady nebyla, hochu.
};


instance DIA_FENIA_INTERESTING(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 14;
	condition = dia_fenia_interesting_condition;
	information = dia_fenia_interesting_info;
	permanent = FALSE;
	description = "Co je tady v p��stavu zaj�mav�ho k vid�n�?";
};


func int dia_fenia_interesting_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_interesting_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//Co je tady v p��stavu zaj�mav�ho k vid�n�?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//No, jestli hled� n�jakou z�bavu, zajdi do Kardifovy kr�my na molu. Ka�dou chv�li se tam n�co semele.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//To m��e� jen t�ko minout. Ten chl�pek, co stoj� u vchodu, ur�it� upout� tvoji pozornost.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//Krom� toho je tady je�t� ta velk� lo� paladin�. Kr�lova majest�tn� v�le�n� gal�ra. To je to jedin�, co tady stoj� za zhl�dnut�.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//Najde� ji, kdy� se od toho chl�pka d� doleva a pak kolem skalnat�ho sr�zu.
};


instance DIA_FENIA_AUFREGEND(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 15;
	condition = dia_fenia_aufregend_condition;
	information = dia_fenia_aufregend_info;
	permanent = FALSE;
	description = "Stalo se v posledn� dob� n�co zaj�mav�ho?";
};


func int dia_fenia_aufregend_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_aufregend_info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//Stalo se v posledn� dob� n�co zaj�mav�ho?
	AI_Output(self,other,"DIA_Fenia_Add_17_01");	//Dalo by se to tak ��ct. N�co takov�ho u� tu dlouho nebylo.
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//B�el tudy n�jak� zlod�j. Musel v doln� ��sti m�sta ukr�st luk.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//Samoz�ejm� �e domobrana p�i�la moc pozd�. Jako v�dycky.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//Utekl jim - sta�ilo mu jen sesko�it do p��stavu a byl pry�.
};

