
instance DIA_MILTEN_DI_EXIT(C_INFO)
{
	npc = pc_mage_di;
	nr = 999;
	condition = dia_milten_di_exit_condition;
	information = dia_milten_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_milten_di_exit_condition()
{
	return TRUE;
};

func void dia_milten_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_DI_HELLO(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_hello_condition;
	information = dia_milten_di_hello_info;
	description = "Jako za star˝ch Ëas˘.";
};


func int dia_milten_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_milten_di_hello_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Jako za star˝ch Ëas˘.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//Jak ¯Ìk·ö. Jsem zvÏdav˝, jestli se ti to tentokr·t poda¯Ì.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Co?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//Zachr·nit si zadek d¯Ìv, neû zase propukne peklo.
};


instance DIA_MILTEN_DI_TRADE(C_INFO)
{
	npc = pc_mage_di;
	nr = 12;
	condition = dia_milten_di_trade_condition;
	information = dia_milten_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Nem˘ûeö postr·dat p·r lektvar˘?";
};


func int dia_milten_di_trade_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};

func void dia_milten_di_trade_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Nem˘ûeö postr·dat p·r lektvar˘?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itpo_health_02,Npc_HasItems(self,itpo_health_02));
	CreateInvItems(self,itpo_health_02,15);
	Npc_RemoveInvItems(self,itpo_mana_02,Npc_HasItems(self,itpo_mana_02));
	CreateInvItems(self,itpo_mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Ber, dokud jsou.
};


instance DIA_MILTEN_DI_RAT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_rat_condition;
	information = dia_milten_di_rat_info;
	description = "Co mi m˘ûeö d·t za radu?";
};


func int dia_milten_di_rat_condition()
{
	if(Npc_KnowsInfo(other,dia_milten_di_hello) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_milten_di_rat_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//Co mi m˘ûeö d·t za radu?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Hmm. Je to velk· Ëest, ûe ze vöech lidÌ se pt·ö na radu pr·vÏ mÏ. Celou dobu myslÌm na jedinou vÏc.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//P¯inesl jsi Innosovo oko?
	Info_ClearChoices(dia_milten_di_rat);
	if(SC_INNOSEYEVERGESSEN_DI == TRUE)
	{
		Info_AddChoice(dia_milten_di_rat,"Ne.",dia_milten_di_rat_nein);
	}
	else
	{
		Info_AddChoice(dia_milten_di_rat,"Samoz¯ejmÏ.",dia_milten_di_rat_ja);
	};
};

func void dia_milten_di_rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Ne.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(pobou¯enÏ) Ty jsi tak... Co udÏl·ö, kdyû tady na ostrovÏ narazÌö na draky?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Copak jsi jeötÏ nedostal rozum? M·me tady dokonce alchymistickou kolonu, abychom tu pitomou vÏc mohli zase nabÌt.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//Co to ksakru dÏl·ö? Douf·m, ûe n·s tvoje nedbalost nebude st·t krk.
	Info_ClearChoices(dia_milten_di_rat);
};

func void dia_milten_di_rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Samoz¯ejmÏ.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//PromiÚ, ûe se tak hloupÏ pt·m. Jsem trochu nervÛznÌ.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_milten_di_rat);
};


instance DIA_MILTEN_DI_PEDROTOT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_pedrotot_condition;
	information = dia_milten_di_pedrotot_info;
	description = "Naöel jsem Pedra.";
};


func int dia_milten_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};

func void dia_milten_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//Naöel jsem Pedra.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(p¯ekvapenÏ) Coûe? Kde? Tady na ostrovÏ? Sakra, to je naprosto k neuvÏ¯enÌ.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//V·ûnÏ jsem netuöil, ûe to je tak tvrd˝ parchant.
	b_giveplayerxp(XP_AMBIENT);
	if(Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//Je mrtv˝.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//V·ûnÏ? Dobr·. Pokoj jeho duöi. Nem˘ûu sice ¯Ìct, ûe by mi ho bylo nÏjak lÌto, ale stejnÏ bych s nÌm r·d prohodil slovo.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//P¯ed ned·vnem jsme se trochu chytili.
	};
};


instance DIA_MILTEN_DI_TEACHMAGIC(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_teachmagic_condition;
	information = dia_milten_di_teachmagic_info;
	permanent = TRUE;
	description = "R·d bych si vylepöil svÈ magickÈ schopnosti.";
};


func int dia_milten_di_teachmagic_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};


var int dia_milten_di_teachmagic_onetime;

func void dia_milten_di_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//R·d bych si vylepöil svÈ magickÈ schopnosti.
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//UvidÌm, co bude v m˝ch sil·ch.
	}
	else if(DIA_MILTEN_DI_TEACHMAGIC_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//Pom˘ûu ti, ale jen pod podmÌnkou, ûe se postar·ö, aby sk¯eti z˘stali tam, kde jsou.
		DIA_MILTEN_DI_TEACHMAGIC_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Dobr·. Co pot¯ebujeö?
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Vytvo¯it runy",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_1()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Nechù tvÈ kroky vede ruka Innosova.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Vytvo¯it runy",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_5()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Nechù ti na cestu svÌtÌ svÏtlo Innosovo.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Vytvo¯it runy",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ale ne! To v·ûnÏ nenÌ m˘j obor, ale nÏjak to holt zvl·dneme.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"PaladinskÈ runy",dia_milten_di_teachmagic_runen_paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Ëtvrt˝ kruh",dia_milten_di_teachmagic_runen_circle_4);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"p·t˝ kruh",dia_milten_di_teachmagic_runen_circle_5);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"öest˝ kruh",dia_milten_di_teachmagic_runen_circle_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//Aha. JeötÏ po¯·d nejsi ˙plnÏ p¯ipraven. Nejd¯Ìv se nauË vyööÌ kruhy, pak ti budu moct pomoci.
	};
};

func void dia_milten_di_teachmagic_runen_paladin()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("SvÏtlo",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHT)),dia_milten_di_teachmagic_runen_paladin_spl_pallight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("SlaböÌ lÈËenÌ",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHTHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("Svat· st¯ela",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALHOLYBOLT)),dia_milten_di_teachmagic_runen_paladin_spl_palholybolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("St¯ednÌ lÈËenÌ",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALMEDIUMHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("R·na proti zlu",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALREPELEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("VyööÌ lÈËenÌ",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALFULLHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("NiËenÌ zla",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALDESTROYEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil);
	};
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallight()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallightheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHTHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palholybolt()
{
	b_teachplayertalentrunes(self,other,SPL_PALHOLYBOLT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALREPELEVIL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palfullheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALFULLHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALDESTROYEVIL);
};

func void dia_milten_di_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_milten_di_teachmagic_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball);
	};
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_milten_di_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_milten_di_teachmagic_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_milten_di_teachmagic_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_milten_di_teachmagic_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_milten_di_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_milten_di_teachmagic_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_milten_di_teachmagic_runen_circle_6_spl_shrink);
	};
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

func void dia_milten_di_teachmagic_back()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
};


instance DIA_MILTEN_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dementorobsessionbook_condition;
	information = dia_milten_di_dementorobsessionbook_info;
	description = "Tahle kniha, Almanach posedl˝ch, ne¯Ìk· ti to nic?";
};


func int dia_milten_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Tahle kniha, Almanach posedl˝ch, ne¯Ìk· ti to nic?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//Na tenhle druh knih je odbornÌk Pyrokar.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Omlouv·m se. VÌm toho p¯Ìliö m·lo na to, abych o nÏËem takovÈm ¯ekl cokoliv smysluplnÈho.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_DRAGONEGG(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dragonegg_condition;
	information = dia_milten_di_dragonegg_info;
	description = "M·ö zkuöenosti s draËÌmi vejci?";
};


func int dia_milten_di_dragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dragonegg_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//M·ö zkuöenosti s draËÌmi vejci?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//Ne, moc ne. Ale slyöel jsem, ûe jeden chytr˝ alchymista z nich pr˝ dok·zal va¯it mocnÈ lektvary.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//Recept po mnÏ vöak nechtÏj. NetuöÌm, jak to dÏlal.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_undeaddragondead_condition;
	information = dia_milten_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Tak, a je to! Chr·m je teÔ zbaven˝ svÈ sÌly.";
};


func int dia_milten_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_milten_di_undeaddragondead_onetime;

func void dia_milten_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//Tak, a je to! Chr·m je teÔ zbaven˝ svÈ sÌly.
	if(DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//Jak ty to vûdycky dÏl·ö?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Aù se propadnu, jestli to vÌm.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(se smÌchem) DoËk·me se v˘bec nÏkdy klidu? UrËitÏ bychom si to zaslouûili.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//Co m·ö v pl·nu teÔ?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//R·d bych si zaloûil vlastnÌ akademii a k·zal naöi vÌru. Ale moûn· to dopadne trochu jinak.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//Nikdy jsem nelitoval, ûe jsem se stal ohniv˝m m·gem. Jak to vidÌö ty?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//J· si nejsem tak ˙plnÏ jist.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(se smÌchem) Suchar, jako obvykle. Hej, chlape. Pr·vÏ jsi zachr·nil svÏt. Copak to nenÌ d˘vod k oslav·m?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Hmm. Moûn·.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//Ale no tak, kamar·de. MyslÌm, ûe pr·vÏ pot¯ebujeme po¯·dn˝ho pan·ka.
		DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//MÏl bys jÌt rovnou za kapit·nem a ¯Ìct mu, aù zvedne kotvy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_MAGE_DI_PICKPOCKET(C_INFO)
{
	npc = pc_mage_di;
	nr = 900;
	condition = dia_mage_di_pickpocket_condition;
	information = dia_mage_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_di_pickpocket_condition()
{
	return c_beklauen(45,120);
};

func void dia_mage_di_pickpocket_info()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_BACK,dia_mage_di_pickpocket_back);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_PICKPOCKET,dia_mage_di_pickpocket_doit);
};

func void dia_mage_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_di_pickpocket);
};

func void dia_mage_di_pickpocket_back()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
};

