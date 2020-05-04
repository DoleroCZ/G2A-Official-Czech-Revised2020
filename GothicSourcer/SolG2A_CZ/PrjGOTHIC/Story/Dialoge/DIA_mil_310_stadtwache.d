
instance DIA_MIL_310_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 999;
	condition = dia_mil_310_stadtwache_exit_condition;
	information = dia_mil_310_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_310_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_310_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_310_CHECKPOINT = "NW_CITY_ENTRANCE_MAIN";

var int mil_310_personal_absolutionlevel;

instance DIA_MIL_310_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_firstwarn_condition;
	information = dia_mil_310_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_310_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_310_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_310_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//ST�T!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//(vzdychne si) Co je?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//V� dob�e co!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Ve m�st� jsi hled�n pro vra�du!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Nechceme tady ��dn� �pinav� zlod�je!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//V na�em m�st� nepot�ebujeme ��dn� pot�isty!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Pro� mysl�, �e bychom t� m�li nechat j�t d�l?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//Co je?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//TEBE dovnit� nepust�me, chlap�e!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Pro� ne?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//Takov� hadrn�k jako ty ur�it� bude d�lat jenom pot�e!
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//Ve m�st� m�me ch�try dost. Lidi bez pen�z tady nepot�ebujeme.
			Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
			b_logentry(TOPIC_CITY,"Aby m� str�e pustily do m�sta, mus�m vypadat bu� jako boh��, nebo mus�m vykoumat n�jak� jin� zp�sob.");
		}
		else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Co chce� tentokr�t?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Pos�l� m� farm��.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//No a? M� tentokr�t alespo� jeden dobr� d�vod, pro� jsi tady?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Jsi jeden z pracovn�k� na Lobartov� farm�? Nikdy jsem t� tady nevid�l!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Nejsem u Lobarta dlouho.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Co chce� ve m�st�?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(ti�e) Co�e?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Odpus� mi, ale takov� m�me rozkazy.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Sna�� se m� zastavit?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Samoz�ejm� ne. V�ichni �lenov� Innosovy c�rkve jsou v�t�ni.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Jen jsem se na tebe cht�l pod�vat. Zd� se, �e m� pen�ze. M��e� j�t.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			MIL_310_SCHONMALREINGELASSEN = TRUE;
			b_checklog();
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_310_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_mil_310_stadtwache_secondwarn_condition;
	information = dia_mil_310_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//O nic se nepokou�ej. Je�t� jeden krok a rozsek�m t� na kousky!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 3;
	condition = dia_mil_310_stadtwache_attack_condition;
	information = dia_mil_310_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//�ekl sis o to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_310_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 5;
	condition = dia_mil_310_stadtwache_bribe_condition;
	information = dia_mil_310_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Tady je 100 zlat�ch. Nech m� proj�t!";
};


func int dia_mil_310_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Tady je 100 zlat�ch. Nech m� proj�t!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(hami�n�) 100 zlat�ch zn� dob�e. Tak b�.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//A jdi rovnou za lordem Andrem! Jinak t� to bude p��t� st�t dal��ch 100 zlat�ch!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Kde?! Nevid�m ��dn�ch 100 zlat�ch. Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_PASSIERSCHEIN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 4;
	condition = dia_mil_310_stadtwache_passierschein_condition;
	information = dia_mil_310_stadtwache_passierschein_info;
	permanent = FALSE;
	description = "M�m propustku!";
};


func int dia_mil_310_stadtwache_passierschein_condition()
{
	if(Npc_HasItems(other,itwr_passierschein) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_passierschein_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//M�m propustku!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//V�n�? A koho jsi kv�li n� zamordoval, ty vrahoune?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Tak nech�te m� proj�t, nebo ne?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//No, b� d�l, ne� si to rozmysl�m!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Zd� se, �e to je v po��dku. Tak b�.
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_ZUMSCHMIED(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 3;
	condition = dia_mil_310_stadtwache_zumschmied_condition;
	information = dia_mil_310_stadtwache_zumschmied_info;
	permanent = FALSE;
	description = "Pot�ebuji j�t za kov��em. Opravit n�jak� n�stroje.";
};


func int dia_mil_310_stadtwache_zumschmied_condition()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE)) && Npc_KnowsInfo(other,dia_maleth_tothecity) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_zumschmied_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Pot�ebuji j�t za kov��em. Opravit n�jak� n�stroje.
	if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(rozzloben�) Fakt? A pro� jsi to ne�ekl rovnou?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Jen m� zaj�malo, jak zareaguje�.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Co�e?! Zkus na m� n�co takov�ho je�t� jednou a uk�u ti, jak na takov� v�ci reaguju, ty hloupej vtip�lku!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//Dobr�, v po��dku, m��e� j�t.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//A jestli uvid� Lobarta, vy�i� mu, �e by m�l sv� ovce po��dn� krmit, brzy se u n�j zase zastav�me! (zle se zasm�je)
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIL_310_STADTWACHE_CONSTANTINO(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_addon_mil_310_stadtwache_constantino_condition;
	information = dia_addon_mil_310_stadtwache_constantino_info;
	permanent = TRUE;
	description = "M�m byliny pro Constantina.";
};


func int dia_addon_mil_310_stadtwache_constantino_condition()
{
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_RUNNING) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_310_stadtwache_constantino_info()
{
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//M�m byliny pro Constantina.
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) || (Npc_HasItems(other,itpl_mana_herb_02) > 0) || (Npc_HasItems(other,itpl_mana_herb_03) > 0) || (Npc_HasItems(other,itpl_health_herb_01) > 0) || (Npc_HasItems(other,itpl_health_herb_02) > 0) || (Npc_HasItems(other,itpl_health_herb_03) > 0) || (Npc_HasItems(other,itpl_dex_herb_01) > 0) || (Npc_HasItems(other,itpl_strength_herb_01) > 0) || (Npc_HasItems(other,itpl_speed_herb_01) > 0) || (Npc_HasItems(other,itpl_temp_herb) > 0) || (Npc_HasItems(other,itpl_perm_herb) > 0) || (Npc_HasItems(other,itpl_beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//(�sko�n�) Aha? Pokud je to tak, uka� mi co nese�.
		if((Npc_HasItems(other,itpl_mana_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_dex_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_strength_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_speed_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_temp_herb) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_perm_herb) >= MINIMUMPASSAGEPLANTS))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//(souhlasn�) Hmm. V�e v po��dku. Sta��. M��e� j�t dovnit�. Ale ned�lej ��dn� probl�my, jasn�?
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			MIL_310_SCHONMALREINGELASSEN = TRUE;
			MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_SUCCESS;
			b_checklog();
			b_giveplayerxp(XP_ADDON_PICKFORCONSTANTINO);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03");	//Co to? Co je tohle?
			if(Npc_HasItems(other,itpl_beet) >= MINIMUMPASSAGEPLANTS)
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//Co by alchymista d�lal s touhle �epou? D�l� ze m� blbce? Odprejskni!
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//J� toho sice o alchymii moc nev�m, ale na tenhle trapn�, za�n�rovan� bal�k zeleniny m��e� zapomenout. T�hni!
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//Jak� byliny? Ty nem� ��dn� byliny! Vodpal!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_MILIZWERDEN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_mil_310_stadtwache_milizwerden_condition;
	information = dia_mil_310_stadtwache_milizwerden_info;
	permanent = FALSE;
	description = "P�i�el jsem, abych vstoupil do domobrany!";
};


func int dia_mil_310_stadtwache_milizwerden_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_milizwerden_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//P�i�el jsem, abych vstoupil do domobrany!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//Dobrej vtip! Zkus to u druh� br�ny - ONI ti to mo�n� spolknou.
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};


instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_paladine_condition;
	information = dia_mil_310_stadtwache_paladine_info;
	permanent = FALSE;
	description = "Pot�ebuji mluvit s v�dcem paladin�!";
};


func int dia_mil_310_stadtwache_paladine_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_paladine_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Pot�ebuji mluvit s v�dcem paladin�! M�m pro n�j d�le�itou zpr�vu!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//V�n�? Copak to asi m��e b�t za zpr�vu?
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Brzy za�to�� na m�sto!",dia_mil_310_stadtwache_paladine_attacksoon);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"V khorinissk�m �dol� se shroma��uj� s�ly zla!",dia_mil_310_stadtwache_paladine_evilarmy);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"P�i�el jsem si pro Innosovo oko!",dia_mil_310_stadtwache_paladine_eyeinnos);
};

func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//P�i�el jsem si pro Innosovo oko!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Co�e? Nikdy jsem o n��em takov�m nesly�el. Co to m� b�t?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Je to d�le�it� artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Nevypad� jako �lov�k, kter�mu by n�kdo sv��oval d�le�it� zpr�vy. M� n�co, ��m by ses mohl prok�zat?
	if(!Npc_HasItems(other,itwr_passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Ne, nem�m!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//Tak p�esta� pl�tvat m�m �asem!
	};
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};

func void dia_mil_310_stadtwache_paladine_evilarmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//V khorinissk�m �dol� se shroma��uj� s�ly zla!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//V Hornick�m �dol�? P�i�el jsi odtamtud? Vid�l jsi tu arm�du?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne - ale pos�l� m� n�kdo, kdo ji vid�l.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne.",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ano. Byl jsem v khorinissk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_attacksoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Brzy za�to�� na m�sto!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Co�e? Kdo? Sk�eti? Vid�l jsi tu arm�du?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne - ale pos�l� m� n�kdo, kdo ji vid�l.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne.",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ano. Byl jsem v khorinissk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_nodragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Ne. Ale v�m, �e ji vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Jist�! A moje babi�ka je poradce sk�et�ch gener�l�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Nemysli si, �e t� nech�me j�t za lordem Hagenem s takov�mi babsk�mi pov�da�kami!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Zmiz!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_nosomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Ne - ale pos�l� m� n�kdo, kdo ji vid�l.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(ned�v��iv�) KDO t� pos�l�?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nem�m povolen� ti ho ��ct.",dia_mil_310_stadtwache_paladine_canttellyou);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Jeden paladin.",dia_mil_310_stadtwache_paladine_apaladin);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Jeden m�g.",dia_mil_310_stadtwache_paladine_amage);
};

func void dia_mil_310_stadtwache_paladine_yesdragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Ano. Byl jsem v khorinissk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//Lh��i! Pr�smyk do �dol� je z obou stran uzav�en�. Nikdo se nedostane skrz!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Vypadni odsud!
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_amage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Jeden m�g.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//M� zpr�vy od m�g�? Pak jist� m� pe�e� jako d�kaz!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Co�e? M�gov� V�DYCKY d�vaj� sv�m posl�m pe�e�.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Tenhle m�g ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Nev���m ti. Jestli jsi opravdu posel, tak vybal ty zpr�vy, nebo zmiz!
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Mohu ten vzkaz p�edat jen paladin�m!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Arm�du zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_apaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Jeden paladin.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, to by mohla b�t pravda - paladinov� dr�� pr�smyk do Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Dej mi ten vzkaz a j� t� ohl�s�m.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Mohu ten vzkaz p�edat jen paladin�m!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Arm�du zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_canttellyou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Nem�m povolen� ti ho ��ct.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Takhle se ke mn� nechovej, chlap�e! Jsem �lenem m�stsk� str�e.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//M��e� mi ��ct V�ECHNO. Tak�e - kdo t� pos�l�?
};

func void dia_mil_310_stadtwache_paladine_depechedragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Arm�du zla vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Co�e? To nem��e b�t pravda. A j� u� t� m�lem pustil d�l.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Kdybys p�i�el za lordem Hagenem s TAKOVOUHLE poh�dkou, nechal by m� zkr�tit o hlavu.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Zmiz!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//Mohu ten vzkaz p�edat jen paladin�m!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//Takhle by to ne�lo, chlap�e!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Jak bych t� asi tak mohl pustit za lordem Hagenem, kdy� si nem��u b�t jist, �e nebude� pl�tvat jeho drahocenn�m �asem?
	PLAYER_KNOWSLORDHAGEN = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne. Ten vzkaz je V�HRADN� pro paladiny.",dia_mil_310_stadtwache_paladine_only2);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Arm�du zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Ne. Ten vzkaz je V�HRADN� pro paladiny.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//V tom p��pad� tady tvoje cesta kon��, cizin�e.
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_PERM(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 5;
	condition = dia_mil_310_stadtwache_perm_condition;
	information = dia_mil_310_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Mazej!
	AI_StopProcessInfos(self);
};

