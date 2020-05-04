
func int c_snapperdeath()
{
	if(Npc_IsDead(newmine_snapper1) && Npc_IsDead(newmine_snapper2) && Npc_IsDead(newmine_snapper3) && Npc_IsDead(newmine_snapper4) && Npc_IsDead(newmine_snapper5) && Npc_IsDead(newmine_snapper6) && Npc_IsDead(newmine_snapper7) && Npc_IsDead(newmine_snapper8))
	{
		return TRUE;
	};
};


instance DIA_FAJETH_EXIT(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 999;
	condition = dia_fajeth_exit_condition;
	information = dia_fajeth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fajeth_exit_condition()
{
	return TRUE;
};

func void dia_fajeth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_FIRST(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_first_condition;
	information = dia_fajeth_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_first_condition()
{
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_fajeth_first_info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Kdo jsi a co tady dìláš?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Jsem na cestì z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//V tom pøípadì by ses mìl pokusit dostat do hradu. Je tam velitel Garond. Má na povel celou naši výpravu.
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_HALLO(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_hallo_condition;
	information = dia_fajeth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_hallo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_hallo_info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Odkud jsi pøišel?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Pøicházím jménem Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//To je skvìlé. Další muži se mi vždycky hodí.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Nejsem zde proto, abych vám pomáhal.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Ne? A proè jsi tedy pøišel?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//Mám za úkol zjistit, kolik rudy jste už vydolovali.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//Ctihodný mágu. Tvoje pøítomnost dodává mnì a mým mužùm jistotu.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Hodilo by se nám, kdybys nám nìjak pomohl prostøednictvím své síly darované Innosem.
		Info_AddChoice(dia_fajeth_hallo,"Co pro tebe mùžu udìlat?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Moje poslání je dùležitìjší.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//A mým úkolem je udìlat všechno pro to, abych vytìžil co nejvíc rudy a ochránil ji.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//To zahrnuje i verbování mužù. Jsi v Innosových službách - budeš tedy poslouchat mé rozkazy.
		Info_AddChoice(dia_fajeth_hallo,"Co pro tebe mùžu udìlat?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Už své pøíkazy mám, od Garonda.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//Poslouchej - netuším, proè ke mnì Garond poslal žoldáka. Ale urèitì k tomu musel mít dobrý dùvod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Avšak než ti dám zprávu pro Garonda, nìco pro mì udìláš.
		Info_AddChoice(dia_fajeth_hallo,"Všechno má svou cenu.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"Ne, nemám èas...",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Co pro tebe mùžu udìlat?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Už nìkolik dní se kolem tábora potuluje smeèka chòapavcù. Vypadá to, že èekají jen na ideální pøíležitost k útoku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Nikdo neví, kdy k tomu dojde - ale dokud jsou tady, nebude v táboøe klid.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Ten Fed, mimo jiné, je strachy úplnì bez sebe. Znepokojuje ostatní odsouzence.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//Tak koho mám poslat? Bilgota? Ha - to je taky troska.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//A Tengron? Umí sice bojovat, ale moc se nevyzná.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Jsi tedy jediný, kdo to dokáže. Chci, aby ses na ty bestie vydal a pobil je.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Fajeth mi vysvìtlil, jak úèinnì lovit chòapavce, kteøí se už pár dní potulují kolem tábora.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Mám mnohem dùležitìjší úkol. Nemùžu ti pomoci.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Pochopitelnì, ctihodnosti. Podám ti všechny informace, které budeš chtít.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//Už své pøíkazy mám, od Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//A také je splníš. Ale až poté, co tì propustím.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Jediné, co od tebe chci slyšet, je 'Co pro tebe mùžu udìlat?' Rozumìno?
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//Všechno má svou cenu. Když mi zaplatíš, nechám si to projít hlavou.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Nejsem zvyklý dohadovat se se žoldáky. Nesnáším smlouvání o lepší cenu.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Ale pokud pro mì budeš pracovat, dám ti na dùkaz své dobré vùle 100 zlatých.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Tak co, dohodnuto?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"Co pro tebe mùžu udìlat?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"Ne, nemám èas...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Ne, nemám èas starat se o tvoje problémy.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Odmítáš tak snadno vydìlané peníze? To bych od žoldáka nikdy neèekal.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Protože nám nechceš pomoci, pøedpokládám, že budeš chtít co nejrychleji získat odpovìdi na své otázky a pak hned vypadneš.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};


instance DIA_FAJETH_LEADER(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_leader_condition;
	information = dia_fajeth_leader_info;
	permanent = FALSE;
	description = "Zabil jsem vùdce smeèky.";
};


func int dia_fajeth_leader_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) && Npc_IsDead(newmine_leadsnapper) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_fajeth_leader_info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Zabil jsem vùdce smeèky.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Dobrá. Bez vùdce už nejsou zdaleka tak nebezpeèní. Myslím, že už na nás nezaútoèí.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//Tady jsou tvé peníze - jak jsme se domluvili.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_SNAPPER_KILLED(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_snapper_killed_condition;
	information = dia_fajeth_snapper_killed_info;
	permanent = TRUE;
	description = "S chòapavci jsem skoncoval.";
};


func int dia_fajeth_snapper_killed_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && (c_snapperdeath() == TRUE))
	{
		return TRUE;
	};
};

func void dia_fajeth_snapper_killed_info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//S chòapavci jsem skoncoval.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Dobrá práce. O zbytek bychom už mìli být schopni se postarat sami.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Zasloužil sis svùj plat - tady máš 100 zlatých, jak jsme se domluvili.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_RUNNING(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_running_condition;
	information = dia_fajeth_running_info;
	permanent = TRUE;
	description = "Jak to vypadá s morálkou tvých mužù?";
};


func int dia_fajeth_running_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fajeth_running_info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Jak to vypadá s morálkou tvých mužù?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Chceš vìdìt, jak to vypadá s morálkou? Strachy sotva pracují!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Postarej se o ty chòapavce, jinak to špatnì dopadne!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "Povìz mi, kolik rudy jste už vydolovali.";
};


func int dia_fajeth_belohnung_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) || (MIS_FAJETH_KILL_SNAPPER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_fajeth_belohnung_info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Povìz mi, kolik rudy jste už vydolovali.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Nahlas Garondovi, že zatím se nám podaøilo získat jenom DVÌ bedny rudy.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Kvùli neustálým nájezdùm jsem už pøišel o spoustu mužù.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Pokud by nám Garond poslal více mužù, mìli bychom rudy víc.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Jasnì. Vyøídím mu to.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Dobrá. Teï je to na tobì. Budeme držet pozice tak dlouho, jak to jen pùjde.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Fajethovi kopáèi už vydolovali DVÌ bedny rudy.");
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_PERM2(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_perm2_condition;
	information = dia_fajeth_perm2_info;
	permanent = TRUE;
	description = "Jak to vypadá s dolováním rudy?";
};


func int dia_fajeth_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_perm2_info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Jak to vypadá s dolováním rudy?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Špatnì. Vùbec to nejde.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Když jsme pøijeli, bylo to v poøádku - ale pak mí hoši nedokázali vydolovat nic než zbytky. Nic poøádného.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Ale nevzdáváme se - alespoò ne dokud tomu tady velím já.
};


instance DIA_FAJETH_ERZABBAU(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 11;
	condition = dia_fajeth_erzabbau_condition;
	information = dia_fajeth_erzabbau_info;
	permanent = TRUE;
	description = "Jak to vypadá s tìžbou?";
};


func int dia_fajeth_erzabbau_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_fajeth_erzabbau_info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Jak to vypadá s tìžbou?
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Nìjak se všechno uklidnilo. Èím to je?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Draci jsou mrtví.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//No, v tom pøípadì doufám, že už brzy bude po všem. Už jsem si pøestával dìlat nadìje.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Vidíš sám. Nic moc.
	};
};


instance DIA_FAJETH_PICKPOCKET(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 900;
	condition = dia_fajeth_pickpocket_condition;
	information = dia_fajeth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fajeth_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_fajeth_pickpocket_info()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_BACK,dia_fajeth_pickpocket_back);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_PICKPOCKET,dia_fajeth_pickpocket_doit);
};

func void dia_fajeth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fajeth_pickpocket);
};

func void dia_fajeth_pickpocket_back()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
};

