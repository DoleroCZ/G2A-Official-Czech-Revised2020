
instance DIA_PECK_EXIT(C_INFO)
{
	npc = mil_324_peck;
	nr = 999;
	condition = dia_peck_exit_condition;
	information = dia_peck_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_peck_exit_condition()
{
	return TRUE;
};

func void dia_peck_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PECK_PICKPOCKET(C_INFO)
{
	npc = mil_324_peck;
	nr = 900;
	condition = dia_peck_pickpocket_condition;
	information = dia_peck_pickpocket_info;
	permanent = TRUE;
	description = "(Krádež tohoto klíèe by byla dosti riskantní.)";
};


func int dia_peck_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_05) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_peck_pickpocket_info()
{
	Info_ClearChoices(dia_peck_pickpocket);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_BACK,dia_peck_pickpocket_back);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_PICKPOCKET,dia_peck_pickpocket_doit);
};

func void dia_peck_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itke_city_tower_05,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_peck_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_peck_pickpocket_back()
{
	Info_ClearChoices(dia_peck_pickpocket);
};


instance DIA_PECK_HEY(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_hey_condition;
	information = dia_peck_hey_info;
	permanent = TRUE;
	description = "Zdar, jak se vede?";
};


func int dia_peck_hey_condition()
{
	if((MIS_ANDRE_PECK != LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_hey_info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//Zdar, jak se vede?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Hele, mám dost práce. Nech mì být.
	AI_StopProcessInfos(self);
};


instance DIA_PECK_FOUND_PECK(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_found_peck_condition;
	information = dia_peck_found_peck_info;
	permanent = FALSE;
	description = "Hej, je nejvyšší èas vyrazit.";
};


func int dia_peck_found_peck_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_found_peck_info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Hej, je nejvyšší èas vyrazit.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Co chceš? Nevidíš, že mám práci?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Potøebuji zbraò, takže se vra do kasáren.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Sakra, tvoje zbraò mùže poèkat.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Pojï, Andre se už po tobì taky ptal.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Hmpf... sakra. Dobrá, vždy už jdu - ale až budeš Andremu podávat hlášení, neøíkej mu, že jsem byl tady.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(vanja,"ALONE");
};


instance DIA_PECK_WEAPON(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon_condition;
	information = dia_peck_weapon_info;
	permanent = TRUE;
	description = "Musím si pro zbraò.";
};


var int dia_peck_weapon_perm;

func int dia_peck_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_found_peck) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (KAPITEL < 3) && (DIA_PECK_WEAPON_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon_info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Musím si pro zbraò.
	if(MIS_ANDRE_PECK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Nejdøív jdi za Andrem a podej mu hlášení.
	}
	else
	{
		if(MIS_ANDRE_PECK == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//No, podívejme, kdo tady je. Náš nový kolegáèek. A chce zbraò.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Neøekl jsi Andremu, že jsem byl v Èervené lucernì. Jsi docela fajn. Na, tady máš meè.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//Je to nejlepší, jaký tady mám.
			b_giveinvitems(self,hero,itmw_schwert1,1);
		}
		else if(MIS_ANDRE_PECK == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Nezapomnìl jsem na tebe. Kdo napráskal Andremu, že jsem byl v Èervené lucernì?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//A teï ode mne ještì chceš meè... dobrá, tady jeden máš. Vezmi si ho. A teï zmiz.
			b_giveinvitems(self,hero,itmw_1h_misc_sword,1);
		};
		DIA_PECK_WEAPON_PERM = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Jestli chceš lepší zbraò, jdi na trh ke kupcùm.
	};
	AI_StopProcessInfos(self);
};

func void b_peck_leckmich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Polib mi! A s rozbìhem!
};


instance DIA_PECK_WEAPON2(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon2_condition;
	information = dia_peck_weapon2_info;
	permanent = TRUE;
	description = "Nemìl bys pro mì lepší zbraò?";
};


var int dia_peck_weapon2_perm;

func int dia_peck_weapon2_condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (ENTEROW_KAPITEL2 == TRUE) && (DIA_PECK_WEAPON_PERM == TRUE) && (DIA_PECK_WEAPON2_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon2_info()
{
	AI_Output(self,other,"DIA_Peck_Add_15_01");	//Nemìl bys pro mì lepší zbraò?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Nezapomnìl jsem, žes mì prásknul lordu Andremu.
		b_peck_leckmich();
	}
	else if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Teï zrovna ne...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Dobøe že se ptáš. Od Onarových žoldákù máme pár opravdu slušných kouskù.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Jim samotným už nebudou k nièemu. (ošklivì se zasmìje)
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Na, vem si tenhle.
		b_giveinvitems(self,other,itmw_rubinklinge,1);
		DIA_PECK_WEAPON2_PERM = TRUE;
	};
};


instance DIA_PECK_PERM(C_INFO)
{
	npc = mil_324_peck;
	nr = 998;
	condition = dia_peck_perm_condition;
	information = dia_peck_perm_info;
	permanent = TRUE;
	description = "Jsi v poøádku?";
};


func int dia_peck_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_peck_weapon) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_peck_perm_info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//Jsi v poøádku?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		b_peck_leckmich();
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//Jo, a co u tebe?
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Ne tak docela. Dìlají mi starosti ti žoldáci. Konkrétnì to, že se teï urèitì pokusí vysvobodit svého kamaráda z vìzení.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Moc by mì nepotìšilo, kdybych se musel postavit bandì zkušených rváèù.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//No samozøejmì! Všichni máme oèi otevøené. Èarodìjové mohou být ujištìni, že vìzeò nemá žádnou šanci uniknout.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//Vím, co máš v plánu, ale dostat vìznì na svobodu se ti nepodaøí.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Jsem rád, že se celá ta záležitost kolem vraždy vyjasnila.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Proè?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Ti žoldáci by asi jen tak bez boje nepøihlíželi, jak jednoho z nich povìsíme na šibenici.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//V nejhorším pøípadì by na nás zaútoèili. Radìji si ani nechci pøedstavit, co by se stalo potom.
		};
	};
};

