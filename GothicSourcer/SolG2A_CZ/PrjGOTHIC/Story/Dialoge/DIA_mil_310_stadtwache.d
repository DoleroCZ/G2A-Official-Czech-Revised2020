
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//STÁT!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//(vzdychne si) Co je?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//Víš dobøe co!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Ve mìstì jsi hledán pro vradu!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Nechceme tady ádné špinavé zlodìje!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//V našem mìstì nepotøebujeme ádné potíisty!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Proè myslíš, e bychom tì mìli nechat jít dál?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//Co je?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//TEBE dovnitø nepustíme, chlapèe!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Proè ne?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//Takovı hadrník jako ty urèitì bude dìlat jenom potíe!
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//Ve mìstì máme chátry dost. Lidi bez penìz tady nepotøebujeme.
			Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
			b_logentry(TOPIC_CITY,"Aby mì stráe pustily do mìsta, musím vypadat buï jako boháè, nebo musím vykoumat nìjakı jinı zpùsob.");
		}
		else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Co chceš tentokrát?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Posílá mì farmáø.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//No a? Máš tentokrát alespoò jeden dobrı dùvod, proè jsi tady?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Jsi jeden z pracovníkù na Lobartovì farmì? Nikdy jsem tì tady nevidìl!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Nejsem u Lobarta dlouho.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Co chceš ve mìstì?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(tiše) Coe?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Odpus mi, ale takové máme rozkazy.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Snaíš se mì zastavit?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Samozøejmì ne. Všichni èlenové Innosovy církve jsou vítáni.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Jen jsem se na tebe chtìl podívat. Zdá se, e máš peníze. Mùeš jít.
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//O nic se nepokoušej. Ještì jeden krok a rozsekám tì na kousky!
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//Øekl sis o to.
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
	description = "Tady je 100 zlatıch. Nech mì projít!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Tady je 100 zlatıch. Nech mì projít!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(haminì) 100 zlatıch zní dobøe. Tak bì.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//A jdi rovnou za lordem Andrem! Jinak tì to bude pøíštì stát dalších 100 zlatıch!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Kde?! Nevidím ádnıch 100 zlatıch. Zmiz!
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
	description = "Mám propustku!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Mám propustku!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Vánì? A koho jsi kvùli ní zamordoval, ty vrahoune?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Tak necháte mì projít, nebo ne?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//No, bì dál, ne si to rozmyslím!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Zdá se, e to je v poøádku. Tak bì.
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
	description = "Potøebuji jít za kováøem. Opravit nìjaké nástroje.";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Potøebuji jít za kováøem. Opravit nìjaké nástroje.
	if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(rozzlobenì) Fakt? A proè jsi to neøekl rovnou?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Jen mì zajímalo, jak zareaguješ.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Coe?! Zkus na mì nìco takového ještì jednou a ukáu ti, jak na takové vìci reaguju, ty hloupej vtipálku!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//Dobrá, v poøádku, mùeš jít.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//A jestli uvidíš Lobarta, vyøiï mu, e by mìl své ovce poøádnì krmit, brzy se u nìj zase zastavíme! (zle se zasmìje)
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
	description = "Mám byliny pro Constantina.";
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
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//Mám byliny pro Constantina.
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) || (Npc_HasItems(other,itpl_mana_herb_02) > 0) || (Npc_HasItems(other,itpl_mana_herb_03) > 0) || (Npc_HasItems(other,itpl_health_herb_01) > 0) || (Npc_HasItems(other,itpl_health_herb_02) > 0) || (Npc_HasItems(other,itpl_health_herb_03) > 0) || (Npc_HasItems(other,itpl_dex_herb_01) > 0) || (Npc_HasItems(other,itpl_strength_herb_01) > 0) || (Npc_HasItems(other,itpl_speed_herb_01) > 0) || (Npc_HasItems(other,itpl_temp_herb) > 0) || (Npc_HasItems(other,itpl_perm_herb) > 0) || (Npc_HasItems(other,itpl_beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//(úskoènì) Aha? Pokud je to tak, uka mi co neseš.
		if((Npc_HasItems(other,itpl_mana_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_dex_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_strength_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_speed_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_temp_herb) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_perm_herb) >= MINIMUMPASSAGEPLANTS))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//(souhlasnì) Hmm. Vše v poøádku. Staèí. Mùeš jít dovnitø. Ale nedìlej ádné problémy, jasné?
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
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//Co by alchymista dìlal s touhle øepou? Dìláš ze mì blbce? Odprejskni!
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//Já toho sice o alchymii moc nevím, ale na tenhle trapnı, zašnìrovanı balík zeleniny mùeš zapomenout. Táhni!
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//Jaké byliny? Ty nemáš ádné byliny! Vodpal!
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
	description = "Pøišel jsem, abych vstoupil do domobrany!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//Pøišel jsem, abych vstoupil do domobrany!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//Dobrej vtip! Zkus to u druhé brány - ONI ti to moná spolknou.
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};


instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_paladine_condition;
	information = dia_mil_310_stadtwache_paladine_info;
	permanent = FALSE;
	description = "Potøebuji mluvit s vùdcem paladinù!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Potøebuji mluvit s vùdcem paladinù! Mám pro nìj dùleitou zprávu!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Vánì? Copak to asi mùe bıt za zprávu?
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Brzy zaútoèí na mìsto!",dia_mil_310_stadtwache_paladine_attacksoon);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"V khorinisském údolí se shromaïují síly zla!",dia_mil_310_stadtwache_paladine_evilarmy);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Pøišel jsem si pro Innosovo oko!",dia_mil_310_stadtwache_paladine_eyeinnos);
};

func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//Pøišel jsem si pro Innosovo oko!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Coe? Nikdy jsem o nìèem takovém neslyšel. Co to má bıt?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Je to dùleitı artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Nevypadáš jako èlovìk, kterému by nìkdo svìøoval dùleité zprávy. Máš nìco, èím by ses mohl prokázat?
	if(!Npc_HasItems(other,itwr_passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Ne, nemám!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//Tak pøestaò plıtvat mım èasem!
	};
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};

func void dia_mil_310_stadtwache_paladine_evilarmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//V khorinisském údolí se shromaïují síly zla!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//V Hornickém údolí? Pøišel jsi odtamtud? Vidìl jsi tu armádu?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne - ale posílá mì nìkdo, kdo ji vidìl.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne.",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ano. Byl jsem v khorinisském údolí. Vidìl jsem nìkolik obøích drakù!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_attacksoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Brzy zaútoèí na mìsto!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Coe? Kdo? Skøeti? Vidìl jsi tu armádu?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne - ale posílá mì nìkdo, kdo ji vidìl.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne.",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ano. Byl jsem v khorinisském údolí. Vidìl jsem nìkolik obøích drakù!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_nodragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Ne. Ale vím, e ji vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Jistì! A moje babièka je poradce skøetích generálù.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Nemysli si, e tì necháme jít za lordem Hagenem s takovımi babskımi povídaèkami!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Zmiz!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_nosomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Ne - ale posílá mì nìkdo, kdo ji vidìl.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(nedùvìøivì) KDO tì posílá?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nemám povolení ti ho øíct.",dia_mil_310_stadtwache_paladine_canttellyou);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Jeden paladin.",dia_mil_310_stadtwache_paladine_apaladin);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Jeden mág.",dia_mil_310_stadtwache_paladine_amage);
};

func void dia_mil_310_stadtwache_paladine_yesdragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Ano. Byl jsem v khorinisském údolí. Vidìl jsem nìkolik obøích drakù!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//Lháøi! Prùsmyk do údolí je z obou stran uzavøenı. Nikdo se nedostane skrz!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Vypadni odsud!
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_amage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Jeden mág.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//Máš zprávy od mágù? Pak jistì máš peèe jako dùkaz!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Coe? Mágové VDYCKY dávají svım poslùm peèe.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Tenhle mág ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Nevìøím ti. Jestli jsi opravdu posel, tak vybal ty zprávy, nebo zmiz!
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Mohu ten vzkaz pøedat jen paladinùm!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armádu zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_apaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Jeden paladin.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, to by mohla bıt pravda - paladinové drí prùsmyk do Hornického údolí.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Dej mi ten vzkaz a já tì ohlásím.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Mohu ten vzkaz pøedat jen paladinùm!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armádu zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_canttellyou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Nemám povolení ti ho øíct.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Takhle se ke mnì nechovej, chlapèe! Jsem èlenem mìstské stráe.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//Mùeš mi øíct VŠECHNO. Take - kdo tì posílá?
};

func void dia_mil_310_stadtwache_paladine_depechedragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Armádu zla vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Coe? To nemùe bıt pravda. A já u tì málem pustil dál.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Kdybys pøišel za lordem Hagenem s TAKOVOUHLE pohádkou, nechal by mì zkrátit o hlavu.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Zmiz!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//Mohu ten vzkaz pøedat jen paladinùm!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//Takhle by to nešlo, chlapèe!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Jak bych tì asi tak mohl pustit za lordem Hagenem, kdy si nemùu bıt jist, e nebudeš plıtvat jeho drahocennım èasem?
	PLAYER_KNOWSLORDHAGEN = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Ne. Ten vzkaz je VİHRADNÌ pro paladiny.",dia_mil_310_stadtwache_paladine_only2);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armádu zla vedou draci!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Ne. Ten vzkaz je VİHRADNÌ pro paladiny.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//V tom pøípadì tady tvoje cesta konèí, cizinèe.
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

