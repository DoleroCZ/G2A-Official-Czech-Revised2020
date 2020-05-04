
instance DIA_VATRAS_DI_EXIT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 999;
	condition = dia_vatras_di_exit_condition;
	information = dia_vatras_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_di_exit_condition()
{
	return TRUE;
};

func void dia_vatras_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_HEAL(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_heal_condition;
	information = dia_vatras_di_heal_info;
	permanent = TRUE;
	description = "Vyleè mì.";
};


func int dia_vatras_di_heal_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Vyleè mì.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//(zbožnì) Adane, požehnej tomuto tìlu. Je pøedurèeno obnovit rovnováhu tohoto svìta.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Tvé tìlo je teï bez zranìní.
	};
};


instance DIA_VATRAS_DI_TRADE(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 12;
	condition = dia_vatras_di_trade_condition;
	information = dia_vatras_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Mùžeš mi nìco prodat?";
};


func int dia_vatras_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_trade_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Mùžeš mi nìco prodat?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//Tak co potøebuješ?
};


instance DIA_VATRAS_DI_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 35;
	condition = dia_vatras_di_obsession_condition;
	information = dia_vatras_di_obsession_info;
	permanent = TRUE;
	description = "Pomoz mi. Jsem prokletý!";
};


func int dia_vatras_di_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vatras_di_obsession_info_onetime;

func void dia_vatras_di_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Pomoz mi. Jsem prokletý!
	if(GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2))
	{
		if(dia_vatras_di_obsession_info_onetime <= 1)
		{
			CreateInvItems(self,itpo_healobsession_mis,1);
			dia_vatras_di_obsession_info_onetime = dia_vatras_di_obsession_info_onetime + 1;
		};
		if(Npc_HasItems(self,itpo_healobsession_mis))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//Vezmi si tenhle lektvar Vykoupení. Pyrokar mi dal nìkolik tìch léèivých lektvarù pro vlastní potøebu.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Nicménì vždycky pamatuj: moje prostøedky na zbavení tìch noèních mùr jsou velmi omezené.
			b_giveinvitems(self,other,itpo_healobsession_mis,1);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Pyrokarovy zásoby jsou vyèerpány. Je mi opravdu líto, pøíteli. Už ti nemùžu nijak pomoct.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//Nevezmu si na svìdomí, dát ti další lahvièku po tak krátké dobì. Vra se pozdìji, pøíteli.
	};
};


instance DIA_VATRAS_DI_RAT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_rat_condition;
	information = dia_vatras_di_rat_info;
	description = "Co mi mùžeš dát za radu?";
};


func int dia_vatras_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && (SC_ISOBSESSED == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_rat_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//Co mi mùžeš dát za radu?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Drž se od Pátraèù dál. Pamatuj, že ti jejich èerný pohled tady, daleko od kláštera, mùže zpùsobit vážné obtíže.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Nic se nedìje, mám amulet na vyvolávání duší.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Kdyby se ti pøesto cokoli stalo, pøijï za mnou. Uvidíme, co se dá dìlat.
};


instance DIA_VATRAS_DI_PEDROTOT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 3;
	condition = dia_vatras_di_pedrotot_condition;
	information = dia_vatras_di_pedrotot_info;
	description = "Našel jsem toho zrádce Pedra.";
};


func int dia_vatras_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};


var int dia_vatras_di_pedrotot_vatrassucked;

func void dia_vatras_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//Našel jsem toho zrádce Pedra.
	b_giveplayerxp(XP_AMBIENT);
	if((MIS_GORAX_KILLPEDRO == LOG_SUCCESS) && Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//Je mrtvý.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//Jsem opravdu zklamán. Tohle jsem si o tobì nemyslel.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//Co myslíš?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//Vím o tvé odporné dohodì s hady. Jsem hluboce otøesen tím, jak jsem nakonec pochybil.
		DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Tak ho pøiveï sem na palubu. Pøedáme ho úøadùm v Khorinisu.
		if(Npc_IsDead(pedro_di))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//Teï už je trochu pozdì. Je mrtvý.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(pøekvapenì) Ó, to je politováníhodné. Budu se modlit za jeho nebohou duši.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_VATRAS_DI_VATRASSUCKED(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_vatras_di_vatrassucked_condition;
	information = dia_vatras_di_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrassucked_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Bìž mi z oèí, ty vrahu. Nemùžeš už ode mì oèekávat absolutnì žádnou pomoc.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_TALENTE(C_INFO)
{
	npc = vlk_439_vatras_di;
	condition = dia_vatras_di_talente_condition;
	information = dia_vatras_di_talente_info;
	permanent = TRUE;
	description = "Nauè mì nìco ze svých schopností.";
};


func int dia_vatras_di_talente_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Nauè mì nìco ze svých schopností.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Udìlám, co bude v mých silách.
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_vatras_di_talente,"Kruhy magie",dia_vatras_di_talente_circles);
	};
	Info_AddChoice(dia_vatras_di_talente,"Alchymie - umìní míchat lektvary",dia_vatras_di_talente_alchimie);
};

func void dia_vatras_di_talente_circles()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("1. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),dia_vatras_di_talente_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("2. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),dia_vatras_di_talente_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("3. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),dia_vatras_di_talente_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("4. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),dia_vatras_di_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("5. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),dia_vatras_di_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("6. kruh magie",b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),dia_vatras_di_talente_circle_6);
	};
};

func void dia_vatras_di_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Esence hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_vatras_di_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Extrakt hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_vatras_di_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír hojivé síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_vatras_di_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Esence many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_vatras_di_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Extrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_vatras_di_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_vatras_di_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Lektvar rychlosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_vatras_di_talente_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír síly",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_vatras_di_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír obratnosti",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_vatras_di_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_vatras_di_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixír života",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_vatras_di_talente_potion_perm_health);
	};
};

func void dia_vatras_di_talente_circle_1()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,1);
};

func void dia_vatras_di_talente_circle_2()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,2);
};

func void dia_vatras_di_talente_circle_3()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,3);
};

func void dia_vatras_di_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,4);
};

func void dia_vatras_di_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Stal jsi se mágem pátého Kruhu. Používej své vìdomosti s rozvahou.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,5);
};

func void dia_vatras_di_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Právì jsi získal pøístup k nejvyšším magickým vìdomostem.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Nech se vést rozumem a ovládej své lidské slabosti. Jinak ti mohou zastøít zrak.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,6);
};

func void dia_vatras_di_talente_potion_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_vatras_di_talente_potion_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_vatras_di_talente_potion_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_vatras_di_talente_potion_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_vatras_di_talente_potion_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_vatras_di_talente_potion_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_vatras_di_talente_potion_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void dia_vatras_di_talente_potion_perm_str()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void dia_vatras_di_talente_potion_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void dia_vatras_di_talente_potion_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};

func void dia_vatras_di_talente_potion_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_vatras_di_talente_back()
{
	Info_ClearChoices(dia_vatras_di_talente);
};


instance DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_dementorobsessionbook_condition;
	information = dia_vatras_di_dementorobsessionbook_info;
	permanent = TRUE;
	description = "Mám tady Almanach prokletých.";
};


func int dia_vatras_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};


var int dia_vatras_di_dementorobsessionbook_onetime;

func void dia_vatras_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//Mám tady Almanach prokletých.
	if(DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Hm. Mám dojem, že bude lepší, když ho vezmu Pyrokarovi do kláštera, jestli se tedy odsud ještì nìkdy dostaneme.
		DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//Máš jich víc? Pøines mi všechno, co najdeš.
	};
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_undeaddragondead_condition;
	information = dia_vatras_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Dokázal jsem to.";
};


func int dia_vatras_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_vatras_di_undeaddragondead_onetime;

func void dia_vatras_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//Dokázal jsem to.
	if(DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//Já vím, cítím to.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//Zasadil jsi Beliarovi ránu, ze které se jen tak nedostane.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Mùžu teï odejít, nebo máte vy mágové v zásobì ještì nìjaký kostlivce, co potøebujou opustit tenhle svìt?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//Ale mìj na pamìti, že to byla jen pouhá epizoda z vìèné války mezi dobrem a zlem.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Zlo si vždycky najde zpùsob, jak se dostat na tenhle svìt. Válka nikdy neskonèí.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//Jako bojovník dobra bys to mìl vìdìt.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Jedinì sám Adanos stojí mezi válèícími bohy, aby zajistil rovnováhu sil.
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//Mìl mi radši pomoct.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//(uliènicky) Ale vždy právì to udìlal - tím si mùžeš být jist.
		DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Øekni kapitánovi, že má co nejdøíve zvednout kotvy. Momentální mír mùže být dost ošidný.
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_di_condition;
	information = dia_addon_vatras_pissoffforevver_di_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_di_condition()
{
	if(((VATRASPISSEDOFFFOREVER == TRUE) || ((MADKILLERCOUNT >= 7) && (VATRASMADKILLERCOUNT != MADKILLERCOUNT))) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_addon_vatras_pissoffforevver_di_onetime;

func void dia_addon_vatras_pissoffforevver_di_info()
{
	if(DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME == FALSE)
	{
		b_lastwarningvatras();
		DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME = TRUE;
	};
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
};

