
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
	description = "(Kr�de� tohoto kl��e by byla dosti riskantn�.)";
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
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Hele, m�m dost pr�ce. Nech m� b�t.
	AI_StopProcessInfos(self);
};


instance DIA_PECK_FOUND_PECK(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_found_peck_condition;
	information = dia_peck_found_peck_info;
	permanent = FALSE;
	description = "Hej, je nejvy��� �as vyrazit.";
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
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Hej, je nejvy��� �as vyrazit.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Co chce�? Nevid�, �e m�m pr�ci?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Pot�ebuji zbra�, tak�e se vra� do kas�ren.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Sakra, tvoje zbra� m��e po�kat.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Poj�, Andre se u� po tob� taky ptal.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Hmpf... sakra. Dobr�, v�dy� u� jdu - ale a� bude� Andremu pod�vat hl�en�, ne��kej mu, �e jsem byl tady.
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
	description = "Mus�m si pro zbra�.";
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
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Mus�m si pro zbra�.
	if(MIS_ANDRE_PECK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Nejd��v jdi za Andrem a podej mu hl�en�.
	}
	else
	{
		if(MIS_ANDRE_PECK == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//No, pod�vejme, kdo tady je. N� nov� koleg��ek. A chce zbra�.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Ne�ekl jsi Andremu, �e jsem byl v �erven� lucern�. Jsi docela fajn. Na, tady m� me�.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//Je to nejlep��, jak� tady m�m.
			b_giveinvitems(self,hero,itmw_schwert1,1);
		}
		else if(MIS_ANDRE_PECK == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Nezapomn�l jsem na tebe. Kdo napr�skal Andremu, �e jsem byl v �erven� lucern�?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//A te� ode mne je�t� chce� me�... dobr�, tady jeden m�. Vezmi si ho. A te� zmiz.
			b_giveinvitems(self,hero,itmw_1h_misc_sword,1);
		};
		DIA_PECK_WEAPON_PERM = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Jestli chce� lep�� zbra�, jdi na trh ke kupc�m.
	};
	AI_StopProcessInfos(self);
};

func void b_peck_leckmich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Polib mi! A s rozb�hem!
};


instance DIA_PECK_WEAPON2(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon2_condition;
	information = dia_peck_weapon2_info;
	permanent = TRUE;
	description = "Nem�l bys pro m� lep�� zbra�?";
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
	AI_Output(self,other,"DIA_Peck_Add_15_01");	//Nem�l bys pro m� lep�� zbra�?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Nezapomn�l jsem, �es m� pr�sknul lordu Andremu.
		b_peck_leckmich();
	}
	else if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Te� zrovna ne...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Dob�e �e se pt�. Od Onarov�ch �old�k� m�me p�r opravdu slu�n�ch kousk�.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Jim samotn�m u� nebudou k ni�emu. (o�kliv� se zasm�je)
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
	description = "Jsi v po��dku?";
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
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//Jsi v po��dku?
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
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Ne tak docela. D�laj� mi starosti ti �old�ci. Konkr�tn� to, �e se te� ur�it� pokus� vysvobodit sv�ho kamar�da z v�zen�.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Moc by m� nepot�ilo, kdybych se musel postavit band� zku�en�ch rv���.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//No samoz�ejm�! V�ichni m�me o�i otev�en�. �arod�jov� mohou b�t uji�t�ni, �e v�ze� nem� ��dnou �anci uniknout.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//V�m, co m� v pl�nu, ale dostat v�zn� na svobodu se ti nepoda��.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Jsem r�d, �e se cel� ta z�le�itost kolem vra�dy vyjasnila.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Pro�?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Ti �old�ci by asi jen tak bez boje nep�ihl�eli, jak jednoho z nich pov�s�me na �ibenici.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//V nejhor��m p��pad� by na n�s za�to�ili. Rad�ji si ani nechci p�edstavit, co by se stalo potom.
		};
	};
};

