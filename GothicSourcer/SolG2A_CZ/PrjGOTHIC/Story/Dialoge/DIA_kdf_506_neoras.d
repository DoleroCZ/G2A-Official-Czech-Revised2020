
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
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Co... co je? Proè mì obtìžuješ? Nevidíš, že jsem uprostøed extrémnì komplikovaného experimentu?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Nechtìl jsem tì vyrušovat.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Už se stalo. -vzdych- No, co potøebuješ?
};


instance DIA_NEORAS_ARBEIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 5;
	condition = dia_neoras_arbeit_condition;
	information = dia_neoras_arbeit_info;
	permanent = FALSE;
	description = "Nemáš pro mì nìjakou práci?";
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
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//Nemáš pro mì nìjakou práci?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Ano, potøebuji byliny pro své pokusy. Byliny si pìstujeme sami, ale došly nám ohnivé kopøivy.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Sedm kvìtù by mìlo staèit. Pøines mi je - ach, ještì nìco - chybí mi recept na magické lektvary.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Pokud bys jej našel, byl bych ti velice vdìèný.
	MIS_NEORASPFLANZEN = LOG_RUNNING;
	MIS_NEORASREZEPT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NEORASPFLANZEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASPFLANZEN,LOG_RUNNING);
	b_logentry(TOPIC_NEORASPFLANZEN,"Musím alchymistovi, mistru Neorasovi, pøinést sedm ohnivých kopøiv.");
	Log_CreateTopic(TOPIC_NEORASREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_NEORASREZEPT,"Mistr Neoras postrádá recept na lektvary na doplnìní many.");
	if(Npc_KnowsInfo(other,dia_opolos_beibringen))
	{
		b_logentry(TOPIC_NEORASREZEPT,"Tohle musí být recept, který po mnì chtìl Opolos.");
	};
};


instance DIA_NEORAS_REZEPT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 6;
	condition = dia_neoras_rezept_condition;
	information = dia_neoras_rezept_info;
	permanent = TRUE;
	description = "Co se toho receptu týèe...";
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
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Co se toho receptu týèe...
	if(b_giveinvitems(other,self,itwr_manarezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Našel jsem ho.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Výbornì. Už jsem se bál, že jsem ho nadobro ztratil.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Na dùkaz mé vdìènosti si vezmi tenhle magický lektvar.
		MIS_NEORASREZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASREZEPT);
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Ještì jsem ho nenašel.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//No, v tom pøípadì doufám, že se ti to podaøí.
	};
};


instance DIA_NEORAS_FLIEDER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 7;
	condition = dia_neoras_flieder_condition;
	information = dia_neoras_flieder_info;
	permanent = TRUE;
	description = "Mám pro tebe nìjaké ohnivé kopøivy.";
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
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Mám pro tebe nìjaké ohnivé kopøivy.
	if(b_giveinvitems(other,self,itpl_mana_herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Výbornì, mohu se pustit do práce. Vezmi si tenhle svitek s kouzlem 'Vìtrná pìst', snad se ti bude hodit.
		MIS_NEORASPFLANZEN = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASPFLANZEN);
		b_giveinvitems(self,other,itsc_windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Vážnì? Ale nepøinesl jsi jich dost. Potøebuji jich SEDM.
	};
};


instance DIA_NEORAS_TEACH(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 10;
	condition = dia_neoras_teach_condition;
	information = dia_neoras_teach_info;
	permanent = TRUE;
	description = "Mohu se u tebe uèit?";
};


func int dia_neoras_teach_condition()
{
	return TRUE;
};

func void dia_neoras_teach_info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Mohu se u tebe uèit?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Budu ti pøednášet tajemství alchymie.
		Info_ClearChoices(dia_neoras_teach);
		Info_AddChoice(dia_neoras_teach,DIALOG_BACK,dia_neoras_teach_back);
		if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Esence hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_neoras_teach_health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Extrakt hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_neoras_teach_health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elixír hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_neoras_teach_health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elixír života",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_neoras_teach_perm_health);
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
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elixír many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_neoras_teach_mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Elixír ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_neoras_teach_perm_mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Novice neuèím. Pokud bys byl jednoho dne pøijat do Kruhu ohnì.
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//pak bych ti mohl ukázat, jak míchat mocné lektvary.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Své vìdomosti pøedávám pouze èlenùm naší církve.
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
	description = "Mohl bys mi namíchat lektvar?";
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
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Mohl bys mi namíchat lektvar?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Na novice jsi velice neomalený. Bìž si za svými povinnostmi.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Vše, co potøebuješ, si mùžeš koupit od Goraxe.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Pochybuješ o mých schopnostech? Dokážu namíchat libovolný lektvar.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Dobrá.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Ne tak rychle, pochopitelnì mi musíš pøinést potøebné ingredience a složit malý poplatek na pokrytí nákladù a materiálu.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Kolik chceš?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//Za samotné namíchání si øíkám 10 zlatých.
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
	description = "Namíchej mi...";
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
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi lektvar vysoké rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi výtažek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi léèivý elixír.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_back()
{
	Info_ClearChoices(dia_neoras_brewforme);
};

func void dia_neoras_brewforme_speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Namíchej mi lektvar rychlosti.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Dobrá, máš potøebné ingredience a peníze?
	if((Npc_HasItems(other,itpl_speed_herb_01) >= 1) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_speed_herb_01,1);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Dobrá, dìkuji. Dám ti ten lektvar hned, abys nemusel èekat.
		b_giveinvitems(self,other,itpo_speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//Nemáš všechny potøebné ingredience. Vra se, až je budeš mít.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi výtažek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi léèivý elixír.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Namíchej mi výtažek many.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Dobrá, máš potøebné ingredience a peníze?
	if((Npc_HasItems(other,itpl_mana_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_mana_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Dobrá, dìkuji. Dám ti ten lektvar hned, abys nemusel èekat.
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//Nemáš všechny potøebné ingredience. Vra se, až je budeš mít.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi výtažek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi léèivý elixír.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Namíchej mi léèivý elixír.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Dobrá, máš potøebné ingredience a peníze?
	if((Npc_HasItems(other,itpl_health_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Ano, tady.
		b_giveinvitems(other,self,itpl_health_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Dobrá, dìkuji. Dám ti ten lektvar hned, abys nemusel èekat.
		b_giveinvitems(self,other,itpo_health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Nemáš všechny potøebné ingredience. Vra se, až je budeš mít.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi lektvar rychlosti.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi výtažek many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Namíchej mi léèivý elixír.",dia_neoras_brewforme_health);
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
	description = "Zdá se, že tvrdì pracuješ.";
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
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Zdá se, že tvrdì pracuješ.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Ano, jsem naprosto vyèerpaný. Už nìkolik dní se snažím zjistit, jak má tahle zatracená smìs fungovat, ale vùbec mi to nejde.
	Info_ClearChoices(dia_neoras_dracheneier);
	Info_AddChoice(dia_neoras_dracheneier,"To není mùj problém.",dia_neoras_dracheneier_no);
	Info_AddChoice(dia_neoras_dracheneier,"Co to má být za lektvar?",dia_neoras_dracheneier_trank);
	Info_AddChoice(dia_neoras_dracheneier,"V èem je problém?",dia_neoras_dracheneier_ei);
};

func void dia_neoras_dracheneier_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//V èem je problém?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//V receptu stojí nìco o draèím vejci. Já ale žádné samozøejmì nemám.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Snažil jsem se tedy tu pøísadu nìèím nahradit. Zatím ovšem jen s pramalým úspìchem.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Kdybys náhodou na nìjaké to vejce pøi svých cestách narazil, vzpomeò si na mì.
	Info_AddChoice(dia_neoras_dracheneier,"A co tedy používáš místo draèího vejce?",dia_neoras_dracheneier_ei_statt);
	Info_AddChoice(dia_neoras_dracheneier,"Uvidím, co se dá dìlat.",dia_neoras_dracheneier_ei_jep);
};

func void dia_neoras_dracheneier_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Uvidím, co se dá dìlat.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Hej. To byl jenom vtip. Nevìøím, že bys nìjaké draèí vejce opravdu našel.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Jen poèkej.
	Info_ClearChoices(dia_neoras_dracheneier);
	Log_CreateTopic(TOPIC_DRACHENEIERNEORAS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNEORAS,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENEIERNEORAS,"Neoras potøebuje pro své experimenty draèí vejce. Domnívá se, že bych nìjaké mohl najít kdesi v jeskyni.");
	MIS_NEORAS_DRAGONEGG = LOG_RUNNING;
};

func void dia_neoras_dracheneier_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//A co tedy používáš místo draèího vejce?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Vìø mi, nechtìl bys to vìdìt.
};

func void dia_neoras_dracheneier_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//Co to má být za lektvar?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Koupil jsem ten recept od jednoho potulného kupce. Stojí v nìm nìkolik podivných, ale docela zajímavých vìcí.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Nevím, jestli ten lektvar bude skuteènì nìco dìlat, ale moje touha po poznání mì neustále nutí to zkoušet.
};

func void dia_neoras_dracheneier_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//To není mùj problém.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//V tom pøípadì mì už dál neobtìžuj.
	Info_ClearChoices(dia_neoras_dracheneier);
};


instance DIA_NEORAS_FOUNDDRAGONEGG(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_founddragonegg_condition;
	information = dia_neoras_founddragonegg_info;
	description = "Mám pro tebe to draèí vejce.";
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
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Mám pro tebe to draèí vejce.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Dìláš si ze mì legraci.
	b_giveinvitems(other,self,itat_dragonegg_mis,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Je pravé! Netušil jsem, že by to mohlo být možné. Kdes ho našel?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Radši bych si to nechal pro sebe.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Výbornì. Co za nìj chceš?
	MIS_NEORAS_DRAGONEGG = LOG_SUCCESS;
	b_giveplayerxp(XP_NEORAS_DRAGONEGG);
	Info_ClearChoices(dia_neoras_founddragonegg);
	Info_AddChoice(dia_neoras_founddragonegg,"Pøekvap mì.",dia_neoras_founddragonegg_irgendwas);
	Info_AddChoice(dia_neoras_founddragonegg,"Co takhle pár léèivých lektvarù?",dia_neoras_founddragonegg_heil);
	Info_AddChoice(dia_neoras_founddragonegg,"Až budeš mít ten lektvar hotový, trochu mi ho dej.",dia_neoras_founddragonegg_trank);
};


var int neoras_scwantsdragoneggdrink;

func void dia_neoras_founddragonegg_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Až budeš mít ten lektvar hotový, trochu mi ho dej.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Dobrá. Ale jak jsem øekl, nemám tušení, co z toho nakonec vyjde.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Stav se pozdìji, až ho budu mít hotový.
	NEORAS_DRAGONEGGDRINK_DAY = Wld_GetDay();
	NEORAS_SCWANTSDRAGONEGGDRINK = TRUE;
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Co takhle pár léèivých lektvarù?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Dobrá volba. Na, vezmi si je. Snad se ti budou hodit.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Pøekvap mì.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Hmm. Dobrá. Tak si vezmi tenhle magický prsten. Urèitì ti pomùže, až budeš èelit nepøátelské pøesile.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Ochrání tì pøed útoky magických stvoøení.
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
	description = "Pøišel jsem si pro ten hrozný lektvar z draèího vejce.";
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
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Pøišel jsem si pro ten hrozný lektvar z draèího vejce.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Ano. Právì jsem ho dodìlal. Ale poslouchej, ještì jsem ho nezkoušel a nepøijímám žádnou zodpovìdnost za následky.
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Tak už mi ho dej.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Dobrá. Doufám, že ti po nìm nevybouchne hlava.
	CreateInvItems(self,itpo_dragoneggdrinkneoras_mis,1);
	b_giveinvitems(self,other,itpo_dragoneggdrinkneoras_mis,1);
};


instance DIA_NEORAS_USEDDRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_useddragoneggdrink_condition;
	information = dia_neoras_useddragoneggdrink_info;
	description = "Zkoušel jsem tu smìs z draèího vejce. Vážnì výborná vìc!";
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
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Zkoušel jsem tu smìs z draèího vejce. Vážnì výborná vìc!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Hmm. Velice zajímavé. Rozhodnì musím ve svém výzkumu pokraèovat.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Mohl bys toho udìlat trochu víc?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Lepší bude, když to zkusíme zase až za pár týdnù. Jinak by ti nejspíš narostly rohy.
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

