
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Co tady dìláš?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Snaím se splnit úkoly, které mi dal klášter ke tvé spokojenosti.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Jsem novic z kláštera. Vykonávám pochùzky pro mágy a také pro paladiny.
		AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//Zásobil jsem tøi hostinské ve mìstì vínem z kláštera.
	};
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Kdo jsou ti tøi krèmáøi?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Kdo jsou ti tøi krèmáøi?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Jeden z nich je ten dobrı mu tady za barem.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Pak je tady Caragon, kterı má svou tavernu na chrámovém námìstí, a Kardif, majitel nálevny v pøístavní ètvrti.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "Co mi mùeš øíct o klášteru?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Co mi mùeš øíct o klášteru?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//My novicové hledáme osvícení v modlitbách k Innosovi a od mágù se uèíme základùm víry.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//Tím, e jim slouíme, slouíme Innosovi a pøipravujeme se na splynutí s Ohnìm.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Odveï mì do kláštera.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Odveï mì do kláštera.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Na to zapomeò. Víš, kolika pøíšerám jsem se musel cestou sem vyhıbat?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Kdy pomyslím na všechny ty vlky, skøety a další potvory, jsem rád, e u odsud nemusím.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Kromì toho se do kláštera stejnì nedostaneš.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Proè ne?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Vstup je povolen jen mágùm, paladinùm a novicùm.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "Jak se mùu stát novicem?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Jak se mùu stát novicem?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Kdy èlovìk cítí hlubokou touhu...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Hele - øekni mi jenom ty základní podmínky.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Musíš pøinést dar. Ovci a...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"Chci-li se stát novicem v Innosovì svatyni, potøebuji ovci a 1000 zlaákù.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "Jak mám asi sehnat tolik penìz?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Jak mám asi sehnat tolik penìz?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Protoe evidentnì neznáš nikoho, kdo by tu èástku sloil za tebe, nezbıvá ti, ne zaèít pracovat.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Kde najdu ovci?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Kde najdu ovci?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//U farmáøù, pochopitelnì. Ale nedostaneš ji jen tak.
	b_logentry(TOPIC_KLOSTER,"Ovci mohu získat od nìkterého sedláka.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hele, víš, co se stalo?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Byl jsi vybrán.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//No bezva. Pøesnì ve chvíli, kdy si chci loknout pìknì vyhlazeného piva, vynoøí se zpoza rohu Daron a øekne mi, e jsem byl vyvolenı.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Kdo by to kdy øekl? Vùle Innosova je nevyzpytatelná. A co tì sem pøivádí?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Poádal jsem o Zkoušku ohnì.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//To pøece není moné?! Chlapèe, jsi zatracenì odvánı. Znamená to také, e budeš hledat "to, co vìøící najde za cestou"?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Vypadá to tak.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "U jsi nìco našel?";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//U jsi nìco našel?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//No, jenom jsem sledoval Agona - ale ztratil jsem ho.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//A teï... co to øíkají? Sleduj Innosova znamení. Nerozumím tak úplnì tomu kousku o cestì.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//No co, budu hledat dál.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Hej, ty mì sleduješ?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hej, ty mì sleduješ?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Nesmysl. Prostì jen náhodou jdu stejnım smìrem.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "Pøestaò za mnou bìhat!";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Pøestaò za mnou bìhat!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Já tì nesleduji. Ale prosím, pokud si to myslíš, pùjdu tedy jinudy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Take se opìt setkáváme. Víš, pøemıšlel jsem. Vìøím, e touha stát se mágem je ve mnì hluboko zakoøenìná.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Ale no tak - nedìlej to.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//Nemám na vıbìr. ivot novice není pro mì.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Prostì se musím stát mágem. Potom bude všechno v poøádku. A teï si vezmu to, k èemu jsem oprávnìn.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Máš nìjaká poslední slova?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"Pøestaò, nechci tì zabít.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Pojïme pøímo k jádru vìci - potøebuji se dostat zpátky do kláštera.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"Nemáš nìco ke kouøení?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Pøestaò, nechci tì zabít.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Velká huba. Ale víš, e proti mnì nemáš šanci! Tak jedem!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Pojïme pøímo k jádru vìci - potøebuji se dostat zpátky do kláštera.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//U nikam nepùjdeš!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Nemáš nìco ke kouøení?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Máš štìstí. Nìco bych tu mìl.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Pojïme na to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Hele, vánì si myslíš, e jdeme dobøe? Nìkde tady ije trol.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Myslím, e bychom se radši mìli vydat jinım smìrem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};

