
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "Musím jít!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hej, cizinèe!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Vidìl jsem tì pøicházet z hor.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Mùžeš být rád, žes nepøišel pøed tøemi týdny.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Zatkli bychom tì jako uprchlého trestance. A udìlali bychom s tebou krátký proces!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Vypadáš úplnì vyèerpanì.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Když jsi pøišel, vypadal jsi, že vypustíš duši.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Fajn, teï už vypadáš skoro jako èlovìk!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(nedùvìøivì) Co tady chceš?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "V horách mì pøepadli bandité.";
};


func int dia_maleth_bandits_condition()
{
	if((KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//V horách mì pøepadli bandité.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Ti zatracení mizerové! Možná to budou ti, kteøí mi minulou noc ukradli jednu z ovcí!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Mìls obrovské štìstí. Vìtšina lidí se odtamtud nedostala živá.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Ti bandité už vám nebudou dìlat žádné problémy ...";
};


func int dia_maleth_banditsdead_condition()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Ti bandité už vám nebudou dìlat žádné problémy.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Proè? Jsou mrtví?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Vytáhli zbraò na špatného chlapa.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Díky Innosovi! Tady - není to sice moc, ale chci, aby sis to vzal!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Øeknu o tom ostatním!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "Vím, kde mají bandité skrýš.";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Vím, kde mají bandité skrýš.
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Chceš na nì jít? Tak z toho mì vynech! Je to moc nebezpeèný!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//A kromì toho, musím dávat pozor na ovce!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Ale jestli si myslíš, že náš té lùzy mùžeš zbavit, bude ti celá farma vdìèná.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"Jestli se mi podaøí pobít bandity na cestì z Xardasovy vìže na Lobartùv statek, jeho obyvatelé mi budou velmi vdìèní.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "Jsem na cestì do mìsta.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Jsem na cestì do mìsta.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Asi budeš muset podplatit stráže, aby ses dostal, kam chceš.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//A taky musíš vìdìt, co chtìjí slyšet.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Mùžou tì pustit dovnitø - když jim øekneš, co chtìj slyšet.
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//A to jako?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Fajn, napøíklad, že jsi z Lobartovy farmy a potøebuješ jít za mìstským kováøem.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Když strážím u mìstských bran øeknu, že pøicházím z Lobartova statku a že mám namíøeno ke kováøi, pustí mì dovnitø.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Ale asi ti to nebude moc platné. Nevypadáš jako farmáø.
		b_logentry(TOPIC_CITY,"Samozøejmì že napøed musím vypadat taky jako sedlák. ");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Aha.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "Potøebuju lepší vybavení!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Potøebuju lepší vybavení!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//To chápu. Ale øeknu ti rovnou: Nemáme nic, co bychom mohli postrádat!
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Pokud mùžeš zaplatit za to, co chceš, Lobart ti nìco prodá.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Jinak se ho také mùžeš zeptat, jestli by pro tebe nemìl nìjakou práci.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Kde mùžu najít Lobarta?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Kde mùžu najít Lobarta?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//No, na farmì pøece! Patøí mu to tady!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//A nezkoušej si s ním nìco zaèínat! Už hodnì tulákù od nìj dostalo nakládaèku a pak letìli z farmy.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "Nìjaký zmìny poslední dobou?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Nìjaký zmìny poslední dobou?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Sejdi dolù po cestì k mìstu a uvidíš.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Až se potkáš s èernokabátníky, pak uvidíš, co je nového.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Jak se mají ovce?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"Už tì ty èerné kápì navštívily?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Už tì ty èerné kápì navštívily?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Jo. Zùstaly tu nìkolik dní. Jestli to chceš vìdìt, tak pøišly rovnou z pekel.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Jak se mají ovce?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(vztekle) Jako by tì to vùbec zajímalo. Máš jiné problémy.
	Info_AddChoice(dia_maleth_probleme,"Problémy? Co ty o tom víš?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//Problémy? Co ty o tom víš?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(stroze) Patøíš k mìstským strážím, ne? Tak s tìma bastardama v èerných kápích nìco udìlej.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(vztekle) Vy zatracený žoldáci myslíte jen na jedinou vìc: jak z ostatních dostat co nejvíc penìz do vlastní kapsy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Váš vznešený pán kláštera by mìl s tìmi postavami v kápích nìco dìlat.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Hej, dávej si bacha na pusu, kámo.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"Co máš za problém?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//Co máš za problém?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Urèitì za to mùže ta èerná pálenka, co mi Vino pøed nìkolika týdny podstrèil.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Nemùžu si na nic vzpomenout, chlape. Jenom vím, že se mi ztratila moje vycházková hùl.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//A to je to, kvùli èemu dìláš takovej kravál?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//Tobì se to øekne, tvoje nebyla.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth se nìkde ožral jak dìlo a ztratil pøitom vycházkovou hùl. Jak ho znám, nikdy se z Lobartova statku moc nevzdálil. Proto by se ta hùl mìla válet nìkde poblíž.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Hej, dávej si bacha na pusu, kámo.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Jediný, co dovedeš, jsou øeèi. Nejlíp udìláš, když pùjdeš pryè.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "Mám dojem, že tahle hùl patøí tobì.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Mám dojem, že tahle hùl patøí tobì.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//To je ohromný. Já...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Tak moment. Nejdøív za ni zapla.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Ale... Moc toho nemám.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//V tom pøípadì na ni zapomeò.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//SDObrá. A co tohle? Vèera jsem tu vidìl bìžet nìjaký bandity s nìkolika mìšci zlata.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Když ti øeknu, kam schovali svou koøist, vrátíš mi za to moji hùl?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Promiò, ale to mì nezajímá. Chci zlato. ",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"Dobrá.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Dobrá.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Fajn. Jdi odsud na západ k tamtomu kousku lesa. Najdeš tam strž.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//V tý jeskyni urèitì nìco bude.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth mi vyprávìl, že v lesích západnì od Lobartova statku se nachází tábor banditù.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Promiò, ale to mì nezajímá. Chci zlato.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Tady je všechno, co mám. Mìlo by to staèit.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "Nenech se vùbec rušit.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Nenech se vùbec rušit.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(rozèilenì) Zmizni.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

