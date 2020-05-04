
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
	description = "Co d�l�?";
};


func int dia_addon_riordian_hallo_condition()
{
	return TRUE;
};

func void dia_addon_riordian_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Co d�l�?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Zkoum�m kulturu star�ho n�roda.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Z n�pis� v�me, �e �ili velmi d�vno.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Nev�m, kdy p�esne postavili tento chr�m, ale rozhodn� to byl velmi vysp�l� n�rod.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//Postavili m�sto za horami. (zamy�len�) A chr�m pro Adanose.
};


instance DIA_ADDON_RIORDIAN_ALTER(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 6;
	condition = dia_addon_riordian_alter_condition;
	information = dia_addon_riordian_alter_info;
	description = "Jak mysl�, �e je to tu star�?";
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
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Jak mysl�, �e je to tu star�?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Podle m� m� u� n�kolik stalet�.
};


instance DIA_ADDON_RIORDIAN_ATLANTIS(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 4;
	condition = dia_addon_riordian_atlantis_condition;
	information = dia_addon_riordian_atlantis_info;
	description = "Ztracen� m�sto na ostrov� Khorinis?";
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
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Ztracen� m�sto na ostrov� Khorinis?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Ano. A� dote� jsme si mysleli, �e zn�me cel� ostrov.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//P�edpokladali jsme, �e cel� severo- v�chod ostrova byl horsk� mas�v.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Ale m�lili jsme se.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//Za t�mto vrchem je �dol�. Tam bylo m�sto star�ho n�roda.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(smutn�) R�d by jsem vid�l budovy m�sta, ale pravd�podobn� je d�vno zni�eno.
	b_logentry(TOPIC_ADDON_KDW,"M�gov� Vody v�d� o prad�vn�m ztracen�m m�st� za port�lem.");
};


instance DIA_ADDON_RIORDIAN_SATURASWANTYOU(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_saturaswantyou_condition;
	information = dia_addon_riordian_saturaswantyou_info;
	description = "Saturas t� chce vid�t.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Saturas t� chce vid�t.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Pokro�il ve sv�ch v�zkumech? Jestli ano, hned p�jdu za n�m.
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Jestli se o t�chto v�cech chce� dozv�d�t v�c, jdi za Nefariusem.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Stoj� na konci t�to haly.
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
	description = "N�co nov�ho?";
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
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//N�co nov�ho?
	if(RIORDIAN_PERMNEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Je to potvrzen�. Star� kultura v��ila v Adanose.
		RIORDIAN_PERMNEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Ne, p��j� pozd�ji.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_TEACHPRE(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Vatras mi dal tento amulet p�traj�c� bludi�ky...";
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
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras mi dal tento amulet p�traj�c� bludi�ky...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ah! Velmi vz�cn� artefakt. Pomoc� n�ho m��e� tr�novat bludi�ku, v�d�l si to?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//M��e� mi s t�m pomoci?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Jist�. Zab�v�m sa t�mto typem magie u� dlouho.
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
	description = "Uk� mi jak m�m tr�novat bludi�ku.";
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

