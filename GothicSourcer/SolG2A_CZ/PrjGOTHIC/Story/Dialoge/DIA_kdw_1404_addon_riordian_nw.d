
instance DIA_ADDON_RIORDIAN_EXIT(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 999;
	condition = dia_addon_riordian_exit_condition;
	information = dia_addon_riordian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HALLO(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_hallo_condition;
	information = dia_addon_riordian_hallo_info;
	description = "Co dìláš?";
};


func int dia_addon_riordian_hallo_condition()
{
	return TRUE;
};

func void dia_addon_riordian_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Co dìláš?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Zkoumám kulturu starého národa.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Z nápisù víme, že žili velmi dávno.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Nevím, kdy pøesne postavili tento chrám, ale rozhodnì to byl velmi vyspìlý národ.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//Postavili mìsto za horami. (zamyšlenì) A chrám pro Adanose.
};


instance DIA_ADDON_RIORDIAN_ALTER(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 6;
	condition = dia_addon_riordian_alter_condition;
	information = dia_addon_riordian_alter_info;
	description = "Jak myslíš, že je to tu staré?";
};


func int dia_addon_riordian_alter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_alter_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Jak myslíš, že je to tu staré?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Podle mì má už nìkolik staletí.
};


instance DIA_ADDON_RIORDIAN_ATLANTIS(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 4;
	condition = dia_addon_riordian_atlantis_condition;
	information = dia_addon_riordian_atlantis_info;
	description = "Ztracené mìsto na ostrovì Khorinis?";
};


func int dia_addon_riordian_atlantis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_atlantis_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Ztracené mìsto na ostrovì Khorinis?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Ano. Až doteï jsme si mysleli, že známe celý ostrov.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//Pøedpokladali jsme, že celý severo- východ ostrova byl horský masív.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Ale mýlili jsme se.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//Za tímto vrchem je údolí. Tam bylo mìsto starého národa.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(smutnì) Rád by jsem vidìl budovy mìsta, ale pravdìpodobnì je dávno znièeno.
	b_logentry(TOPIC_ADDON_KDW,"Mágové Vody vìdí o pradávném ztraceném mìstì za portálem.");
};


instance DIA_ADDON_RIORDIAN_SATURASWANTYOU(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_saturaswantyou_condition;
	information = dia_addon_riordian_saturaswantyou_info;
	description = "Saturas tì chce vidìt.";
};


func int dia_addon_riordian_saturaswantyou_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && (MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_saturaswantyou_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Saturas tì chce vidìt.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Pokroèil ve svých výzkumech? Jestli ano, hned pùjdu za ním.
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Jestli se o tìchto vìcech chceš dozvìdìt víc, jdi za Nefariusem.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Stojí na konci této haly.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int riordian_permnews;

instance DIA_ADDON_RIORDIAN_PERM(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 99;
	condition = dia_addon_riordian_perm_condition;
	information = dia_addon_riordian_perm_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_addon_riordian_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Nìco nového?
	if(RIORDIAN_PERMNEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Je to potvrzené. Stará kultura vìøila v Adanose.
		RIORDIAN_PERMNEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Ne, pøíjï pozdìji.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_TEACHPRE(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Vatras mi dal tento amulet pátrající bludièky...";
};


func int dia_addon_riordian_teachpre_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras mi dal tento amulet pátrající bludièky...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ah! Velmi vzácný artefakt. Pomocí nìho mùžeš trénovat bludièku, vìdìl si to?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Mùžeš mi s tím pomoci?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Jistì. Zabývám sa tímto typem magie už dlouho.
	RIORDIAN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
};


instance DIA_ADDON_RIORDIAN_TEACH(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = "Ukáž mi jak mám trénovat bludièku.";
};


var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((RIORDIAN_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,DIALOG_BACK,dia_addon_riordian_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

