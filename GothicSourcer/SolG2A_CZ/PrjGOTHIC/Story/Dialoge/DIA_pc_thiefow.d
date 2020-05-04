
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	return TRUE;
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, myslel jsem si, že jsi mrtvý.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Ano... to jsem také byl.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale teï jsem zpátky a hledám dùkaz o tom, že tady jsou draci.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Proè to dìláš?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Pracuji pro lorda Hagena. S pomocí paladinù se nám urèitì podaøí draky zastavit.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladinové? Nìco ti øeknu. Když se mi odsud podaøilo uprchnout, šel jsem do Khorinisu.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Chtìl jsem paladiny varovat pøed draky. Nebesa vìdí, proè jsem to vùbec zkoušel.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nadutec Lothar mì ani neposlouchal - a už vùbec mì nenechal si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Místo toho mì poslali zpátky s touhle výpravou. Takže o paladinech mi vùbec nemluv.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Dùležité je zastavit draky, dokud máme èas - a vùbec nezáleží na tom, kdo nám k tomu pomùže.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Zastavit je? Mìli bychom vypadnout z tohohle údolí, dokud máme èas aspoò na to.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Øekni, jak se ti podaøilo dostat se pøes prùsmyk? Myslel jsem, že se to tam hemží skøety.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Skrz opuštìný dùl vede cesta, kterou skøeti nehlídají.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//To je dobré vìdìt. V tom pøípadì se brzy vydám do Khorinisu - mám tam pár nevyøízených úètù.
};


instance DIA_DIEGOOW_BEWEISE(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_beweise_condition;
	information = dia_diegoow_beweise_info;
	description = "Poslouchej, potøebuju ten dùkaz.";
};


func int dia_diegoow_beweise_condition()
{
	return TRUE;
};

func void dia_diegoow_beweise_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Poslouchej, potøebuju ten dùkaz.
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobrá, udìlám pro tebe, co bude v mých silách. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Dobrá, pokud to je smysl tvojí cesty - bìž si promluvit s velitelem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Pokud nìkdo ví nìco o útocích drakù, tak to jsou hoši z hradu.
	};
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Jsem na cestì z Garondova rozkazu. Potøebuje vìdìt, kolik rudy jste zatím vykutali.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A pak ti dá ten dùkaz, po kterém tak toužíš?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//Pøesnì tak. Takže co - mùžeš mi nìco øíct?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//A když budeš na hradì, možná bys mohl Garondovi øíct nìco, co by ho mohlo velmi zajímat.
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Tady vzadu v jeskyni jsou ÈTYØI bedny s rudou. Narubali ji Silvestrovi chlapi.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Jen a si pro ni Garond pøijde a vezme si ji - ale to už já tady nebudu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//Nedaleko odsud v jeskyni jsou schované ÈTYØI bedny plné rudy, kterou vykopali Silvestrovi muži.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Garondovi nic nebrání, aby si pro nì pøišel. Mnì by na nic nebyly ...
	};
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego dopravil ÈTYØI bedny rudy, kterou vytìžili Silvestrovi muži, do bezpeèí.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "Jak to, že jsi u rudy právì ty?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_beweise))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//Jak to, že jsi u rudy právì ty?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Byl jsem v Silvestrovì skupinì. Tìžili jsme nìkolik dní a pak zaèal být Silvestro z nièeho nic strašnì nervózní.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Øekl, že bychom mìli ukrýt rudu na nìjaké bezpeèné místo.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//No, a protože jsem se tehdy už stejnì chystal k útìku, nabídl jsem se, že rudu schovám.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//A to bylo moje jediné štìstí. Horníci totiž narazili na pár dùlních èervù. Žádný z nich nepøežil.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 4;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "Co ti dva mrtví rytíøi pøed tvou skrýší?";
};


func int dia_diegoow_ritter_condition()
{
	if((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Co ti dva mrtví rytíøi pøed tvou skrýší?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Našla si je zubatá bìhem bitvy se skupinou chòapavcù.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//No, Hornické údolí má svoje vlastní zákony. Øíkal jsem jim to. Ale nechtìli mì poslouchat.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 5;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = FALSE;
	description = "Co bych mìl o údolí vìdìt?";
};


func int dia_diegoow_perm_condition()
{
	return TRUE;
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co bych mìl o údolí vìdìt?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od pádu bariéry se tady pár vìcí zmìnilo. Hlavní slovo tu teï mají skøeti.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//My lidé nejsme nic jiného než žrádlo pro skuteèné pány údolí: draky.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Drž se stranou od všeho, co je nad tvoje síly - a vyhýbej se všemu, co vypadá jako drak.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 6;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Chtìl bych vykoupit Gornovi svobodu...";
};


func int dia_diegoow_gorn_condition()
{
	if(MIS_RESCUEGORN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chtìl bych vykoupit Gornovi svobodu, ale Garond za to chce 1000 zlatých.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Hezká sumièka. Mám u sebe 300 zlatých, klidnì si je vezmi. Ale zbytek je na tobì.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego mi zaplatil 300, abych Gornovi pomohl na svobodu.");
};


var int diego_merkedex;
var int diego_merkestr;

instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 100;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = TRUE;
	description = "Mùžeš mì nìèemu nauèit?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mùžeš mì nìèemu nauèit?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Jistì, co bys rád vedìl?
	DIEGO_MERKEDEX = other.attribute[ATR_DEXTERITY];
	DIEGO_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > DIEGO_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Tvá obratnost se zlepšila.
	};
	if(other.attribute[ATR_STRENGTH] > DIEGO_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(pochvalnì) Dobøe. Tvá síla se zlepšila.
	};
	Info_ClearChoices(dia_diegoow_teach);
};

func void dia_diegoow_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};


instance DIA_ADDON_THIEFOW_TOGETHER(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_addon_thiefow_together_condition;
	information = dia_addon_thiefow_together_info;
	description = "Pojïme spolu.";
};


func int dia_addon_thiefow_together_condition()
{
	return TRUE;
};

func void dia_addon_thiefow_together_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//Pojïme spolu.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//K prùsmyku? Proè ne ...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//Jdi napøed. Potom se tady setkáme.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Ale nechoïme blízko hradu nebo skøetí palisády.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Taky bychom se mìli vyhnout všem paladinským táborùm.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Právì jsem utekl a nechci se nechat znovu chytit a zase makat v dole.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//A je ti zøejmì jasné, že se musíme vyhnout drakùm.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Jen mi øekni, jakmile budeš pøipraven.
};


instance DIA_ADDON_THIEFOW_COMEON(C_INFO)
{
	npc = pc_thiefow;
	nr = 12;
	condition = dia_addon_thiefow_comeon_condition;
	information = dia_addon_thiefow_comeon_info;
	permanent = TRUE;
	description = "Pojïme.";
};


func int dia_addon_thiefow_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,dia_addon_thiefow_together) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Pojïme.
	if(c_diegotoofar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//To je špatný smìr!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//V poøádku.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_THIEFOW_GOHOME(C_INFO)
{
	npc = pc_thiefow;
	nr = 13;
	condition = dia_addon_thiefow_gohome_condition;
	information = dia_addon_thiefow_gohome_info;
	permanent = TRUE;
	description = "Zùstaò tu a poèkej.";
};


func int dia_addon_thiefow_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Zùstaò tu a poèkej.
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Dobrá.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Budu èekat venku u veže.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Budu èekat blízko dolu.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//Budu èekat pøed dolem.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//Poèkám nedaleko.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//Ne, vrátím se do jeskynì.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Mùžeš mì znova navštívit, až dodìláš svou práci.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Nicménì když ti to bude trvat dlouho, vrátím se do jeskynì.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//Dìláš si srandu. Rozdìlit se tady???
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Nikdy!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//Mùžeme jít prùsmykem spolu.
	};
};

func void b_addon_diego_willwaitoutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Poèkám nedaleko, jestli se tam chceš porozhlédnout.
};

func void b_addon_diego_passotherdirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Musíme jít jinama, abychom se dostali do prùsmyku.
};


var int diego_toofarcomment;
var int diego_burgvariation;
var int diego_fajethvariation;
var int diego_silvestrovariation;
var int diego_grimesvariation;
var int diego_xardasvariation;
var int diego_icevariation;

instance DIA_ADDON_THIEFOW_TOOFAR(C_INFO)
{
	npc = pc_thiefow;
	nr = 14;
	condition = dia_addon_thiefow_toofar_condition;
	information = dia_addon_thiefow_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_thiefow_toofar_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_diegotoofar(0))
		{
			if(DIEGO_TOOFARCOMMENT == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			DIEGO_TOOFARCOMMENT = FALSE;
		};
	};
};

func void dia_addon_thiefow_toofar_info()
{
	if(c_diegotoofar(1000) == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//Nemám rád tady tu hrobku.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Šel bych radìji kolem.
	}
	else if(c_diegotoofar(1000) == LOC_ICE)
	{
		if(DIEGO_ICEVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//To je vstup do bývalého Nového tábora.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//Pøedpokládám, že je tam drak.
			b_addon_diego_passotherdirection();
			DIEGO_ICEVARIATION = 1;
		}
		else
		{
			b_addon_diego_passotherdirection();
		};
	}
	else if(c_diegotoofar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//Ten moèál je mrtvý.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Nebyl bych pøekvapen, kdyby tam na nás èekal drak.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Mìli bychom se od takového místa držet dál.
	}
	else if(c_diegotoofar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Vsadil bych se, že tam nahoøe bychom potkali draka.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//A víš vùbec, že bych rád dorazil do Khorinisu živý?
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Vyberme si nìjakou jinou cestu.
	}
	else if(c_diegotoofar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//To jezero nás nikam nedovede.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Prùsmyk je na opaèné stranì.
	}
	else if(c_diegotoofar(1000) == LOC_XARDAS)
	{
		if(DIEGO_XARDASVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//To je stará Xrdasova vìž. Už ji ale samozøejmì opustil.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Nebyl bych pøekvapen, kdyby na nás ještì èekaly nìjaké nemilé pøekvapení.
			b_addon_diego_willwaitoutside();
			DIEGO_XARDASVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else if(c_diegotoofar(1000) == LOC_FAJETHMINE)
	{
		if(DIEGO_FAJETHVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//Fajethùv dùl je tam dole.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Dolù?! Ne se mnou!
			DIEGO_FAJETHVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Volil bych radìji cestu mimo ten dùl.
		};
	}
	else if(c_diegotoofar(1000) == LOC_SILVESTROMINE)
	{
		if(DIEGO_SILVESTROVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//To je dùl, kde jsem byl nucen pracovat, když jsem se vrátil s kolonou vìzòù.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Jsem si zcela jist, že tam nikdo nepøežil.
			b_addon_diego_willwaitoutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Když ti to bude trvat dlouho, vrátím se do jeskynì.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Chceš abych zde zùstal a poèkal, až se vrátíš.
			DIEGO_SILVESTROVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(c_diegotoofar(1000) == LOC_GRIMESMINE)
	{
		if(DIEGO_GRIMESVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//Toto je jeden z nových paladinských dolù.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Nikdy - nechci na tom nic mìnit.
			DIEGO_GRIMESVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Dal bych pøednost vyhnout se tomu dolu.
		};
	}
	else if(c_diegotoofar(1000) == LOC_BURG)
	{
		if(DIEGO_BURGVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Jsi blbý? Ne k hradu!
			DIEGO_BURGVARIATION = 1;
		}
		else if(DIEGO_BURGVARIATION == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//Ty kašleš na mé rady? Ne k hradu!
			DIEGO_BURGVARIATION = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//Øíkám ne k hradu. Rozumíš?
			DIEGO_BURGVARIATION = 1;
		};
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Nemožné. Cesta kolem palisády je velice nebezpeèná.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Myslím, že bude nejlepší jít na západ a zkusit najít odtud lepší cestu.
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Dostaneme se ke skøetí palisádì, pokud pùjdeme tudy.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Pøejdeme prùsmyk!
	};
	DIEGO_TOOFARCOMMENT = TRUE;
};

func void b_diego_wirsindda()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//Pùjdu chvíli sám ...
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Musím ještì nìco udìlat, než se vrátím do Khorinisu.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Díky pøíteli, uvidíme se ve mìstì.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	DIEGO_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_THIEFOW_ANGEKOMMEN(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_angekommen_condition;
	information = dia_addon_thiefow_angekommen_info;
	important = TRUE;
};


func int dia_addon_thiefow_angekommen_condition()
{
	if(Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_angekommen_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Dobrá, pùjdeme.
	b_giveplayerxp(500);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_NOSTALGIE(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_nostalgie_condition;
	information = dia_addon_thiefow_nostalgie_info;
	important = TRUE;
};


func int dia_addon_thiefow_nostalgie_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_nostalgie_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Vzpomínáš?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//Vra se zpìt, kde jsme se potkali poprvé.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//Poèkej ...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//A mìlo by tam být nìco dalšího v té oblasti - sakra - nemùžu si vzpomenout.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Cokoliv ...
	b_giveplayerxp(500);
	hero.exp = hero.exp + 500;
	PrintScreen(ConcatStrings(NAME_ADDON_NOSTALGIEBONUS,IntToString(500)),-1,60,FONT_SCREEN,2);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_addon_thiefow_perm_condition;
	information = dia_addon_thiefow_perm_info;
	permanent = TRUE;
	description = "Vše v poøádku?";
};


func int dia_addon_thiefow_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_perm) && Npc_KnowsInfo(other,dia_addon_thiefow_together))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Vše v poøádku?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Neškodil by nìjaký léèivý lektvar. Nemáš nejaký?
	}
	else if((diegoow.aivar[AIV_PARTYMEMBER] == FALSE) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Jen mi øekni, jak nás budeš chtít odvést jinam.
	}
	else if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//V pohodì. Pouze si beru krátkou pøestávku.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Dobøe.
	};
};

