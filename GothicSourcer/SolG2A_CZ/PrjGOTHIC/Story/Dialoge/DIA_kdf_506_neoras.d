
instance DIA_NEORAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap1_exit_condition;
	information = dia_neoras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_neoras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_HALLO(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 2;
	condition = dia_neoras_hallo_condition;
	information = dia_neoras_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_neoras_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_neoras_hallo_info()
{
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Co... co je? Pro� m� obt�uje�? Nevid�, �e jsem uprost�ed extr�mn� komplikovan�ho experimentu?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Necht�l jsem t� vyru�ovat.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//U� se stalo. -vzdych- No, co pot�ebuje�?
};


instance DIA_NEORAS_ARBEIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 5;
	condition = dia_neoras_arbeit_condition;
	information = dia_neoras_arbeit_info;
	permanent = FALSE;
	description = "Nem� pro m� n�jakou pr�ci?";
};


func int dia_neoras_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_arbeit_info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//Nem� pro m� n�jakou pr�ci?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Ano, pot�ebuji byliny pro sv� pokusy. Byliny si p�stujeme sami, ale do�ly n�m ohniv� kop�ivy.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Sedm kv�t� by m�lo sta�it. P�ines mi je - ach, je�t� n�co - chyb� mi recept na magick� lektvary.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Pokud bys jej na�el, byl bych ti velice vd��n�.
	MIS_NEORASPFLANZEN = LOG_RUNNING;
	MIS_NEORASREZEPT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NEORASPFLANZEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASPFLANZEN,LOG_RUNNING);
	b_logentry(TOPIC_NEORASPFLANZEN,"Mus�m alchymistovi, mistru Neorasovi, p�in�st sedm ohniv�ch kop�iv.");
	Log_CreateTopic(TOPIC_NEORASREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_NEORASREZEPT,"Mistr Neoras postr�d� recept na lektvary na dopln�n� many.");
	if(Npc_KnowsInfo(other,dia_opolos_beibringen))
	{
		b_logentry(TOPIC_NEORASREZEPT,"Tohle mus� b�t recept, kter� po mn� cht�l Opolos.");
	};
};


instance DIA_NEORAS_REZEPT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 6;
	condition = dia_neoras_rezept_condition;
	information = dia_neoras_rezept_info;
	permanent = TRUE;
	description = "Co se toho receptu t��e...";
};


func int dia_neoras_rezept_condition()
{
	if(MIS_NEORASREZEPT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_rezept_info()
{
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Co se toho receptu t��e...
	if(b_giveinvitems(other,self,itwr_manarezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Na�el jsem ho.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//V�born�. U� jsem se b�l, �e jsem ho nadobro ztratil.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Na d�kaz m� vd��nosti si vezmi tenhle magick� lektvar.
		MIS_NEORASREZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASREZEPT);
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Je�t� jsem ho nena�el.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//No, v tom p��pad� douf�m, �e se ti to poda��.
	};
};


instance DIA_NEORAS_FLIEDER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 7;
	condition = dia_neoras_flieder_condition;
	information = dia_neoras_flieder_info;
	permanent = TRUE;
	description = "M�m pro tebe n�jak� ohniv� kop�ivy.";
};


func int dia_neoras_flieder_condition()
{
	if(MIS_NEORASPFLANZEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_flieder_info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//M�m pro tebe n�jak� ohniv� kop�ivy.
	if(b_giveinvitems(other,self,itpl_mana_herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//V�born�, mohu se pustit do pr�ce. Vezmi si tenhle svitek s kouzlem 'V�trn� p�st', snad se ti bude hodit.
		MIS_NEORASPFLANZEN = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASPFLANZEN);
		b_giveinvitems(self,other,itsc_windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//V�n�? Ale nep�inesl jsi jich dost. Pot�ebuji jich SEDM.
	};
};


instance DIA_NEORAS_TEACH(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 10;
	condition = dia_neoras_teach_condition;
	information = dia_neoras_teach_info;
	permanent = TRUE;
	description = "Mohu se u tebe u�it?";
};


func int dia_neoras_teach_condition()
{
	return TRUE;
};

func void dia_neoras_teach_info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Mohu se u tebe u�it?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Budu ti p�edn�et tajemstv� alchymie.
		Info_ClearChoices(dia_neoras_teach);
		Info_AddChoice(dia_neoras_teach,DIALOG_BACK,dia_neoras_teach_back);
		if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Esence hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_neoras_teach_health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Extrakt hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_neoras_teach_health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elix�r hojiv� s�ly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_neoras_teach_health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elix�r �ivota",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_neoras_teach_perm_health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_neoras_teach_mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_neoras_teach_mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elix�r many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_neoras_teach_mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elix�r ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_neoras_teach_perm_mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Novice neu��m. Pokud bys byl jednoho dne p�ijat do Kruhu ohn�.
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//pak bych ti mohl uk�zat, jak m�chat mocn� lektvary.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Sv� v�domosti p�ed�v�m pouze �len�m na�� c�rkve.
	};
};

func void dia_neoras_teach_back()
{
	Info_ClearChoices(dia_neoras_teach);
};

func void dia_neoras_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_neoras_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_neoras_teach_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_neoras_teach_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_neoras_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_neoras_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_neoras_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_neoras_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};


instance DIA_NEORAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap2_exit_condition;
	information = dia_neoras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_neoras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap3_exit_condition;
	information = dia_neoras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_neoras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_BREWPOTION(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewpotion_condition;
	information = dia_neoras_brewpotion_info;
	permanent = TRUE;
	description = "Mohl bys mi nam�chat lektvar?";
};


func int dia_neoras_brewpotion_condition()
{
	if(NEORASBREWSFORYOU == FALSE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewpotion_info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Mohl bys mi nam�chat lektvar?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Na novice jsi velice neomalen�. B� si za sv�mi povinnostmi.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//V�e, co pot�ebuje�, si m��e� koupit od Goraxe.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Pochybuje� o m�ch schopnostech? Dok�u nam�chat libovoln� lektvar.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Dobr�.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Ne tak rychle, pochopiteln� mi mus� p�in�st pot�ebn� ingredience a slo�it mal� poplatek na pokryt� n�klad� a materi�lu.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Kolik chce�?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//Za samotn� nam�ch�n� si ��k�m 10 zlat�ch.
		NEORASBREWSFORYOU = TRUE;
	};
};


instance DIA_NEORAS_BREWFORME(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewforme_condition;
	information = dia_neoras_brewforme_info;
	permanent = TRUE;
	description = "Nam�chej mi...";
};


func int dia_neoras_brewforme_condition()
{
	if(NEORASBREWSFORYOU == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewforme_info()
{
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi lektvar vysok� rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi v�ta�ek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi l��iv� elix�r.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_back()
{
	Info_ClearChoices(dia_neoras_brewforme);
};

func void dia_neoras_brewforme_speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Nam�chej mi lektvar rychlosti.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Dobr�, m� pot�ebn� ingredience a pen�ze?
	if((Npc_HasItems(other,itpl_speed_herb_01) >= 1) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_speed_herb_01,1);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Dobr�, d�kuji. D�m ti ten lektvar hned, abys nemusel �ekat.
		b_giveinvitems(self,other,itpo_speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//Nem� v�echny pot�ebn� ingredience. Vra� se, a� je bude� m�t.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi v�ta�ek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi l��iv� elix�r.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Nam�chej mi v�ta�ek many.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Dobr�, m� pot�ebn� ingredience a pen�ze?
	if((Npc_HasItems(other,itpl_mana_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_mana_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Dobr�, d�kuji. D�m ti ten lektvar hned, abys nemusel �ekat.
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//Nem� v�echny pot�ebn� ingredience. Vra� se, a� je bude� m�t.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi v�ta�ek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi l��iv� elix�r.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Nam�chej mi l��iv� elix�r.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Dobr�, m� pot�ebn� ingredience a pen�ze?
	if((Npc_HasItems(other,itpl_health_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_health_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Dobr�, d�kuji. D�m ti ten lektvar hned, abys nemusel �ekat.
		b_giveinvitems(self,other,itpo_health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Nem� v�echny pot�ebn� ingredience. Vra� se, a� je bude� m�t.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi v�ta�ek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Nam�chej mi l��iv� elix�r.",dia_neoras_brewforme_health);
};


instance DIA_NEORAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap4_exit_condition;
	information = dia_neoras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_neoras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_DRACHENEIER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 40;
	condition = dia_neoras_dracheneier_condition;
	information = dia_neoras_dracheneier_info;
	permanent = TRUE;
	description = "Zd� se, �e tvrd� pracuje�.";
};


func int dia_neoras_dracheneier_condition()
{
	if((KAPITEL >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_NEORAS_DRAGONEGG == 0))
	{
		return TRUE;
	};
};

func void dia_neoras_dracheneier_info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Zd� se, �e tvrd� pracuje�.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Ano, jsem naprosto vy�erpan�. U� n�kolik dn� se sna��m zjistit, jak m� tahle zatracen� sm�s fungovat, ale v�bec mi to nejde.
	Info_ClearChoices(dia_neoras_dracheneier);
	Info_AddChoice(dia_neoras_dracheneier,"To nen� m�j probl�m.",dia_neoras_dracheneier_no);
	Info_AddChoice(dia_neoras_dracheneier,"Co to m� b�t za lektvar?",dia_neoras_dracheneier_trank);
	Info_AddChoice(dia_neoras_dracheneier,"V �em je probl�m?",dia_neoras_dracheneier_ei);
};

func void dia_neoras_dracheneier_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//V �em je probl�m?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//V receptu stoj� n�co o dra��m vejci. J� ale ��dn� samoz�ejm� nem�m.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Sna�il jsem se tedy tu p��sadu n���m nahradit. Zat�m ov�em jen s pramal�m �sp�chem.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Kdybys n�hodou na n�jak� to vejce p�i sv�ch cest�ch narazil, vzpome� si na m�.
	Info_AddChoice(dia_neoras_dracheneier,"A co tedy pou��v� m�sto dra��ho vejce?",dia_neoras_dracheneier_ei_statt);
	Info_AddChoice(dia_neoras_dracheneier,"Uvid�m, co se d� d�lat.",dia_neoras_dracheneier_ei_jep);
};

func void dia_neoras_dracheneier_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Hej. To byl jenom vtip. Nev���m, �e bys n�jak� dra�� vejce opravdu na�el.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Jen po�kej.
	Info_ClearChoices(dia_neoras_dracheneier);
	Log_CreateTopic(TOPIC_DRACHENEIERNEORAS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNEORAS,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENEIERNEORAS,"Neoras pot�ebuje pro sv� experimenty dra�� vejce. Domn�v� se, �e bych n�jak� mohl naj�t kdesi v jeskyni.");
	MIS_NEORAS_DRAGONEGG = LOG_RUNNING;
};

func void dia_neoras_dracheneier_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//A co tedy pou��v� m�sto dra��ho vejce?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//V�� mi, necht�l bys to v�d�t.
};

func void dia_neoras_dracheneier_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//Co to m� b�t za lektvar?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Koupil jsem ten recept od jednoho potuln�ho kupce. Stoj� v n�m n�kolik podivn�ch, ale docela zaj�mav�ch v�c�.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Nev�m, jestli ten lektvar bude skute�n� n�co d�lat, ale moje touha po pozn�n� m� neust�le nut� to zkou�et.
};

func void dia_neoras_dracheneier_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//To nen� m�j probl�m.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//V tom p��pad� m� u� d�l neobt�uj.
	Info_ClearChoices(dia_neoras_dracheneier);
};


instance DIA_NEORAS_FOUNDDRAGONEGG(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_founddragonegg_condition;
	information = dia_neoras_founddragonegg_info;
	description = "M�m pro tebe to dra�� vejce.";
};


func int dia_neoras_founddragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis) && (MIS_NEORAS_DRAGONEGG == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int neoras_dragoneggdrink_day;

func void dia_neoras_founddragonegg_info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//M�m pro tebe to dra�� vejce.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//D�l� si ze m� legraci.
	b_giveinvitems(other,self,itat_dragonegg_mis,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Je prav�! Netu�il jsem, �e by to mohlo b�t mo�n�. Kdes ho na�el?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Rad�i bych si to nechal pro sebe.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//V�born�. Co za n�j chce�?
	MIS_NEORAS_DRAGONEGG = LOG_SUCCESS;
	b_giveplayerxp(XP_NEORAS_DRAGONEGG);
	Info_ClearChoices(dia_neoras_founddragonegg);
	Info_AddChoice(dia_neoras_founddragonegg,"P�ekvap m�.",dia_neoras_founddragonegg_irgendwas);
	Info_AddChoice(dia_neoras_founddragonegg,"Co takhle p�r l��iv�ch lektvar�?",dia_neoras_founddragonegg_heil);
	Info_AddChoice(dia_neoras_founddragonegg,"A� bude� m�t ten lektvar hotov�, trochu mi ho dej.",dia_neoras_founddragonegg_trank);
};


var int neoras_scwantsdragoneggdrink;

func void dia_neoras_founddragonegg_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//A� bude� m�t ten lektvar hotov�, trochu mi ho dej.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Dobr�. Ale jak jsem �ekl, nem�m tu�en�, co z toho nakonec vyjde.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Stav se pozd�ji, a� ho budu m�t hotov�.
	NEORAS_DRAGONEGGDRINK_DAY = Wld_GetDay();
	NEORAS_SCWANTSDRAGONEGGDRINK = TRUE;
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Co takhle p�r l��iv�ch lektvar�?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Dobr� volba. Na, vezmi si je. Snad se ti budou hodit.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//P�ekvap m�.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Hmm. Dobr�. Tak si vezmi tenhle magick� prsten. Ur�it� ti pom��e, a� bude� �elit nep��telsk� p�esile.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Ochr�n� t� p�ed �toky magick�ch stvo�en�.
	CreateInvItems(self,itri_prot_mage_02,1);
	b_giveinvitems(self,other,itri_prot_mage_02,1);
	Info_ClearChoices(dia_neoras_founddragonegg);
};


instance DIA_NEORAS_DRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_dragoneggdrink_condition;
	information = dia_neoras_dragoneggdrink_info;
	description = "P�i�el jsem si pro ten hrozn� lektvar z dra��ho vejce.";
};


func int dia_neoras_dragoneggdrink_condition()
{
	if((NEORAS_DRAGONEGGDRINK_DAY <= (Wld_GetDay() - 2)) && (NEORAS_SCWANTSDRAGONEGGDRINK == TRUE))
	{
		return TRUE;
	};
};

func void dia_neoras_dragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//P�i�el jsem si pro ten hrozn� lektvar z dra��ho vejce.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Ano. Pr�v� jsem ho dod�lal. Ale poslouchej, je�t� jsem ho nezkou�el a nep�ij�m�m ��dnou zodpov�dnost za n�sledky.
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Tak u� mi ho dej.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Dobr�. Douf�m, �e ti po n�m nevybouchne hlava.
	CreateInvItems(self,itpo_dragoneggdrinkneoras_mis,1);
	b_giveinvitems(self,other,itpo_dragoneggdrinkneoras_mis,1);
};


instance DIA_NEORAS_USEDDRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_useddragoneggdrink_condition;
	information = dia_neoras_useddragoneggdrink_info;
	description = "Zkou�el jsem tu sm�s z dra��ho vejce. V�n� v�born� v�c!";
};


func int dia_neoras_useddragoneggdrink_condition()
{
	if(NEORAS_SCUSEDDRAGONEGGDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_useddragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Zkou�el jsem tu sm�s z dra��ho vejce. V�n� v�born� v�c!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Hmm. Velice zaj�mav�. Rozhodn� mus�m ve sv�m v�zkumu pokra�ovat.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Mohl bys toho ud�lat trochu v�c?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Lep�� bude, kdy� to zkus�me zase a� za p�r t�dn�. Jinak by ti nejsp� narostly rohy.
};


instance DIA_NEORAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap5_exit_condition;
	information = dia_neoras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_neoras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_PICKPOCKET(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 900;
	condition = dia_neoras_pickpocket_condition;
	information = dia_neoras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_neoras_pickpocket_condition()
{
	return c_beklauen(72,140);
};

func void dia_neoras_pickpocket_info()
{
	Info_ClearChoices(dia_neoras_pickpocket);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_BACK,dia_neoras_pickpocket_back);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_PICKPOCKET,dia_neoras_pickpocket_doit);
};

func void dia_neoras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_neoras_pickpocket);
};

func void dia_neoras_pickpocket_back()
{
	Info_ClearChoices(dia_neoras_pickpocket);
};

