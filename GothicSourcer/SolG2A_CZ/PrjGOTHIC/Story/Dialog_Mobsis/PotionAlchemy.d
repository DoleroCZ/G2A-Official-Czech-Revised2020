
func void potionalchemy_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(her);
	};
};


instance PC_POTIONALCHEMY_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_potionalchemy_end_condition;
	information = pc_potionalchemy_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_potionalchemy_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_potionalchemy_end_info()
{
	CreateInvItems(self,itmi_flask,1);
	b_endproductiondialog();
};


var int boozestart;

instance PC_BOOZE_START(C_INFO)
{
	npc = pc_hero;
	nr = 10;
	condition = pc_booze_start_condition;
	information = pc_booze_start_info;
	permanent = TRUE;
	description = "Destil�ty";
};


func int pc_booze_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_booze_start_info()
{
	BOOZESTART = TRUE;
};


instance PC_BOOZE_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_booze_stop_condition;
	information = pc_booze_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_booze_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_stop_info()
{
	BOOZESTART = FALSE;
};


instance PC_BOOZE_LOU(C_INFO)
{
	npc = pc_hero;
	nr = 5;
	condition = pc_booze_lou_condition;
	information = pc_booze_lou_info;
	permanent = TRUE;
	description = "Zkus Louovo 'Kladivo' ... ";
};


func int pc_booze_lou_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_LOUSHAMMER == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_lou_info()
{
	if((Npc_HasItems(self,itpl_swampherb) >= 1) && (Npc_HasItems(self,itpl_beet) >= 2) && (Npc_HasItems(self,itat_sharkteeth) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,1);
		Npc_RemoveInvItems(self,itpl_beet,2);
		Npc_RemoveInvItems(self,itat_sharkteeth,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,1);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_loushammer,1);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_BOOZE_SCHLAF(C_INFO)
{
	npc = pc_hero;
	nr = 6;
	condition = pc_booze_schlaf_condition;
	information = pc_booze_schlaf_info;
	permanent = TRUE;
	description = "Louovo 'Kladivo' s dvojit�m mno�stv�m rumu ";
};


func int pc_booze_schlaf_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_SCHLAFHAMMER == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_schlaf_info()
{
	if((Npc_HasItems(self,itpl_swampherb) >= 1) && (Npc_HasItems(self,itpl_beet) >= 2) && (Npc_HasItems(self,itat_sharkteeth) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 2))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,1);
		Npc_RemoveInvItems(self,itpl_beet,2);
		Npc_RemoveInvItems(self,itat_sharkteeth,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,2);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_schlafhammer,1);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_BOOZE_SCHNELLERHERING(C_INFO)
{
	npc = pc_hero;
	nr = 5;
	condition = pc_booze_schnellerhering_condition;
	information = pc_booze_schnellerhering_info;
	permanent = TRUE;
	description = "Namixuj 'Rychl�ho slane�ka'";
};


func int pc_booze_schnellerhering_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_SCHNELLERHERING == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_schnellerhering_info()
{
	if((Npc_HasItems(self,itpl_speed_herb_01) >= 1) && (Npc_HasItems(self,itfo_fish) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 1))
	{
		Npc_RemoveInvItems(self,itpl_speed_herb_01,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,1);
		Npc_RemoveInvItems(self,itfo_fish,1);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_schnellerhering,1);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_CHARGE_INNOSEYE(C_INFO)
{
	nr = 1;
	npc = pc_hero;
	condition = pc_charge_innoseye_condition;
	information = pc_charge_innoseye_info;
	permanent = TRUE;
	description = "Dob�t Innosovo oko";
};


func int pc_charge_innoseye_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == TRUE) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_charge_innoseye_info()
{
	if(((Npc_HasItems(hero,itat_icedragonheart) >= 1) || (Npc_HasItems(hero,itat_rockdragonheart) >= 1) || (Npc_HasItems(hero,itat_firedragonheart) >= 1) || (Npc_HasItems(hero,itat_swampdragonheart) >= 1)) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1))
	{
		if(Npc_HasItems(hero,itat_swampdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_swampdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_rockdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_rockdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_firedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_firedragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_icedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_icedragonheart,1);
		};
		Npc_RemoveInvItems(hero,itmi_innoseye_discharged_mis,1);
		CreateInvItems(hero,itmi_innoseye_mis,1);
		Print(PRINT_ALCHEMYSUCCESSINNOSEYE);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int manastart;

instance PC_MANA_START(C_INFO)
{
	npc = pc_hero;
	nr = 6;
	condition = pc_mana_start_condition;
	information = pc_mana_start_info;
	permanent = TRUE;
	description = "Nam�chat lektvary many";
};


func int pc_mana_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_mana_start_info()
{
	MANASTART = TRUE;
};


instance PC_MANA_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_mana_stop_condition;
	information = pc_mana_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_mana_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana_stop_info()
{
	MANASTART = FALSE;
};


instance PC_ITPO_MANA_01(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_mana_01_condition;
	information = pc_itpo_mana_01_info;
	permanent = TRUE;
	description = "Esence many (2 ohniv� kop�ivy, 1 lu�n� pohanka)";
};


func int pc_itpo_mana_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_01_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_01) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_01,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_01,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_mana_02_condition;
	information = pc_itpo_mana_02_info;
	permanent = TRUE;
	description = "Extrakt many (2 ohniv� b�l�, 1 lu�n� pohanka) ";
};


func int pc_itpo_mana_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_02_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_03(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_mana_03_condition;
	information = pc_itpo_mana_03_info;
	permanent = TRUE;
	description = "Elix�r many (2 ohniv� ko�eny, 1 lu�n� pohanka)";
};


func int pc_itpo_mana_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_03_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_03) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_04(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_mana_04_condition;
	information = pc_itpo_mana_04_info;
	permanent = TRUE;
	description = "lektvar many (3 esence many, 1 lu�n� pohanka)";
};


func int pc_itpo_mana_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_04] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_04_info()
{
	if((Npc_HasItems(hero,itpo_mana_01) >= 3) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_mana_01,3);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_addon_04,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int healthstart;

instance PC_HEALTH_START(C_INFO)
{
	npc = pc_hero;
	nr = 7;
	condition = pc_health_start_condition;
	information = pc_health_start_info;
	permanent = TRUE;
	description = "Nam�chat le��v� lektvary";
};


func int pc_health_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_health_start_info()
{
	HEALTHSTART = TRUE;
};


instance PC_HEALTH_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_health_stop_condition;
	information = pc_health_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_health_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_health_stop_info()
{
	HEALTHSTART = FALSE;
};


instance PC_ITPO_HEALTH_01(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_health_01_condition;
	information = pc_itpo_health_01_info;
	permanent = TRUE;
	description = "Esence hojiv� s�ly (2 l��iv� rostliny, 1 lu�n� pohanka)";
};


func int pc_itpo_health_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_01_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_01) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_01,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItem(hero,itpo_health_01);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_health_02_condition;
	information = pc_itpo_health_02_info;
	permanent = TRUE;
	description = "Extrakt hojiv� s�ly (2 l��iv� byliny, 1 lu�n� pohanka)";
};


func int pc_itpo_health_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_02_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_03(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_health_03_condition;
	information = pc_itpo_health_03_info;
	permanent = TRUE;
	description = "Elix�r hojiv� s�ly (2 l��iv� ko�eny, 1 lu�n� pohanka)";
};


func int pc_itpo_health_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_03_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_03) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_03,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_04(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_health_04_condition;
	information = pc_itpo_health_04_info;
	permanent = TRUE;
	description = "L��iv� lektvar (3 esence �ivota, 1 lu�n� pohanka)";
};


func int pc_itpo_health_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_04_info()
{
	if((Npc_HasItems(hero,itpo_health_01) >= 3) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_health_01,3);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_addon_04,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int specialstart;

instance PC_SPECIAL_START(C_INFO)
{
	npc = pc_hero;
	nr = 9;
	condition = pc_special_start_condition;
	information = pc_special_start_info;
	permanent = TRUE;
	description = "Nam�chat speci�ln� lektvary";
};


func int pc_special_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_special_start_info()
{
	SPECIALSTART = TRUE;
};


instance PC_SPECIAL_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_special_stop_condition;
	information = pc_special_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_special_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_special_stop_info()
{
	SPECIALSTART = FALSE;
};


instance PC_ITPO_ADDON_GEIST(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_addon_geist_condition;
	information = pc_itpo_addon_geist_info;
	permanent = TRUE;
	description = "Lektvar obnovy mysli";
};


func int pc_itpo_addon_geist_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (KNOWS_MCELIXIER == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_addon_geist_info()
{
	if((Npc_HasItems(hero,itat_sting) >= 2) && (Npc_HasItems(hero,itpo_mana_02) >= 1) && (Npc_HasItems(hero,itpo_health_01) >= 1) && (Npc_HasItems(hero,itfo_addon_pfeffer_01) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_sting,2);
		Npc_RemoveInvItems(hero,itpo_mana_02,1);
		Npc_RemoveInvItems(hero,itpo_health_01,1);
		Npc_RemoveInvItems(hero,itfo_addon_pfeffer_01,1);
		if(KNOWS_BLOODFLY == TRUE)
		{
			CreateInvItems(hero,itpo_addon_geist_02,1);
		}
		else
		{
			CreateInvItems(hero,itpo_addon_geist_01,1);
		};
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_HEALTH(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_health_condition;
	information = pc_itpo_perm_health_info;
	permanent = TRUE;
	description = "Elix�r �ivota (1 l��iv� ko�en, 1 kr�lovsk� ��ov�k)";
};


func int pc_itpo_perm_health_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_health_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_03) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_03,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_health,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_MANA(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_mana_condition;
	information = pc_itpo_perm_mana_info;
	permanent = TRUE;
	description = "Elix�r ducha (1 ohniv� ko�en, 1 kr�lovsk� ��ov�k)";
};


func int pc_itpo_perm_mana_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_mana_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_03) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_mana,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_DEX(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_dex_condition;
	information = pc_itpo_dex_info;
	permanent = TRUE;
	description = "Lektvar obratnosti (1 goblin� bobule, 1 kr�lovsk� ��ov�k)";
};


func int pc_itpo_dex_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_dex_info()
{
	if((Npc_HasItems(hero,itpl_dex_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_dex_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_dex,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_STRG(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_strg_condition;
	information = pc_itpo_strg_info;
	permanent = TRUE;
	description = "Lektvar s�ly (1 dra�� ko�en, 1 kr�lovsk� ��ov�k)";
};


func int pc_itpo_strg_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_strg_info()
{
	if((Npc_HasItems(hero,itpl_strength_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_strength_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_str,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_SPEED(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_speed_condition;
	information = pc_itpo_speed_info;
	permanent = TRUE;
	description = "Lektvar rychlosti (1 ch�apav�� b�l�, 1 lu�n� pohanka)";
};


func int pc_itpo_speed_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_SPEED] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_speed_info()
{
	if((Npc_HasItems(hero,itpl_speed_herb_01) >= 1) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_speed_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_speed,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int tabakstart;

instance PC_TABAK_START(C_INFO)
{
	npc = pc_hero;
	nr = 11;
	condition = pc_tabak_start_condition;
	information = pc_tabak_start_info;
	permanent = TRUE;
	description = "Mich�n� tab�ku a zpracov�n� tr�vy z ba�in";
};


func int pc_tabak_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == FALSE) && (BOOZESTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_tabak_start_info()
{
	TABAKSTART = TRUE;
};


instance PC_TABAK_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_tabak_stop_condition;
	information = pc_tabak_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_tabak_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tabak_stop_info()
{
	TABAKSTART = FALSE;
};


instance PC_ITMI_JOINT(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_joint_condition;
	information = pc_itmi_joint_info;
	permanent = TRUE;
	description = "�prava tr�vy z ba�in (1 st�blo)";
};


func int pc_itmi_joint_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_joint_info()
{
	if(Npc_HasItems(hero,itpl_swampherb) >= 1)
	{
		Npc_RemoveInvItems(hero,itpl_swampherb,1);
		CreateInvItems(hero,itmi_joint,1);
		Print(PRINT_JOINTSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITMI_ADDON_JOINT_01(C_INFO)
{
	nr = 11;
	npc = pc_hero;
	condition = pc_itmi_addon_joint_01_condition;
	information = pc_itmi_addon_joint_01_info;
	permanent = TRUE;
	description = "Ud�lat zeln�ho novice (2 st�bla tr�vy z ba�in, 1 lu�n� pohanka)";
};


func int pc_itmi_addon_joint_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE) && (GREEN_EXTREM == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_addon_joint_01_info()
{
	if((Npc_HasItems(hero,itpl_swampherb) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_swampherb,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itmi_addon_joint_01,1);
		Print(PRINT_ADDON_JOINT_01_SUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITMI_TABAK(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_tabak_condition;
	information = pc_itmi_tabak_info;
	permanent = TRUE;
	description = "Sm�chat tab�k...";
};


func int pc_itmi_tabak_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (Npc_HasItems(hero,itmi_apfeltabak) >= 1) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_tabak_info()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Info_ClearChoices(pc_itmi_tabak);
	Info_AddChoice(pc_itmi_tabak,DIALOG_BACK,pc_itmi_tabak_back);
	if(Npc_HasItems(hero,itfo_honey) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...s medem",pc_itmi_tabak_honey);
	};
	if(Npc_HasItems(hero,itpl_swampherb) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...s tr�vou z ba�in",pc_itmi_tabak_swampherb);
	};
	if(Npc_HasItems(hero,itpl_mushroom_01) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...s tmav�mi houbami",pc_itmi_tabak_mushroom_01);
	};
};

func void pc_itmi_tabak_back()
{
	Info_ClearChoices(pc_itmi_tabak);
};

func void pc_itmi_tabak_honey()
{
	CreateInvItems(hero,itmi_honigtabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_swampherb()
{
	CreateInvItems(hero,itmi_sumpftabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_mushroom_01()
{
	CreateInvItems(hero,itmi_pilztabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};


instance PC_ITPO_MEGADRINK(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_megadrink_condition;
	information = pc_itpo_megadrink_info;
	permanent = TRUE;
	description = "Lektvar z dra��ch vajec (10 dra��ch vajec, 1 �ern� perla, 1 s�ra)";
};


func int pc_itpo_megadrink_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] == TRUE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_itpo_megadrink_info()
{
	if((Npc_HasItems(hero,itat_dragonegg_mis) >= 10) && (Npc_HasItems(hero,itmi_darkpearl) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_dragonegg_mis,10);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itpo_megadrink,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};

