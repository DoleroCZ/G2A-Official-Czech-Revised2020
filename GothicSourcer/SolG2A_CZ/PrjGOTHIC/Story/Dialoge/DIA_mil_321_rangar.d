
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle klíè lze snadno ukrást)";
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "Zdar, jak se vede?";
};


func int dia_rangar_hallo_condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Zdar, jak se vede?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Než mi paladinové dají nìjaké další pøíkazy, mùžu si tady v klidu dát nìkolik piv. Co víc by si jeden mohl pøát? (zašklebí se)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracuješ pro paladiny?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Jo, podávám jim hlášení o dìní ve mìstì. Momentálnì je tady docela klid.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "Jak to vypadá se skøety?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak to vypadá se skøety?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Není dùvod si dìlat tìžkou hlavu - my z mìstské stráže a paladinové máme všechno pod kontrolou.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Bìž domù a nech nás dìlat naši práci. Dohlížíme na mìsto a jeho obèany. -ŠKYT-
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "Dal by sis ještì pivo?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Dal by sis ještì pivo?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ááá - nic se nevyrovná správnì vychlazenýmu pivku.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Chystal ses øíct nìco o skøetech.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Jo, no jo, jasnì. Skøeti nepøedstavují pro mìsto vùbec žádnou hrozbu.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Obsadili Hornické údolí. A prùsmyk drží paladinové.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Neproklouzne kolem nich ani myš.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Poøádnou pintu rozhodnì neodmítnu.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Dokonce vidìli skøeta hned za mìstem.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//No jo, jasnì, nebezpeèný skøet za mìstem. Opravdu pøíšerný skøet. Urèitì co nevidìt zaútoèí na mìsto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Poslouchej, toho tlustýho skøeta nakopeme do toho jeho tlustýho zadku ve chvíli, kdy se moc pøiblíží k mìstu. Jasan?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Aha.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Dobrý hoøký pivko je to nejlepší, co mùže být.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Víš, nenarazíš èasto na nìkoho, kdo by tì pozval na pivo. Jsi docela fajn.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasnì, že si ještì dám pivo. Jedno pro mì.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RANGAR_ERWISCHT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 5;
	condition = dia_addon_rangar_erwischt_condition;
	information = dia_addon_rangar_erwischt_info;
	description = "Co tady dìláš?";
};


var int dia_addon_rangar_erwischt_onetime;

func int dia_addon_rangar_erwischt_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_ADDON_RANGAR_ERWISCHT_ONETIME == FALSE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_erwischt_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(cítí se pøistižen) Eeehm. Já...eh..to tì nemusí zajímat. Ztra se.
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin bude rád, až mu povím, kdo se šoural v jeho vìcech mezi tím, co byl pryè.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(výsmìšnì) Udìlej, co chceš. Pùjdu ještì jednou, chlapèe.
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GOTRANGAR = TRUE;
};


instance DIA_ADDON_RANGAR_NACHHAKEN(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_addon_rangar_nachhaken_condition;
	information = dia_addon_rangar_nachhaken_info;
	permanent = TRUE;
	description = "Asi si myslíš, že tì nechám uniknout trestu?";
};


func int dia_addon_rangar_nachhaken_condition()
{
	if((SC_GOTRANGAR == TRUE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_nachhaken_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Asi si myslíš, že tì nechám uniknout trestu?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(lhostejnì) Nedìlej tak velké dùsledky kvùli trošce zásob a potravin.
};

