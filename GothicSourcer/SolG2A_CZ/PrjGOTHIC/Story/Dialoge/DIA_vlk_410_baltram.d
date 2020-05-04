
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Vítej, cizinèe, jmenuji se Baltram. Pøišel ses zásobit jídlem?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Obávám se, že tì zklamu. Moc toho právì teï na skladì nemám.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale každým dnem bych mìl dostat nové zboží.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Pokud jsi pøišel ke mnì nakoupit jídlo, mùžeš jít klidnì zase pryè.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Nemyslím si o vás žoldácích nic dobrého! Zpùsobujete mi jen samé problémy.
	};
};


instance DIA_ADDON_BALTRAM_LARESABLOESE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_addon_baltram_laresabloese_condition;
	information = dia_addon_baltram_laresabloese_info;
	important = TRUE;
};


func int dia_addon_baltram_laresabloese_condition()
{
	if(Npc_IsInState(self,zs_talk) && (SCISWEARINGRANGERRING == TRUE) && (MIS_LARES_BRINGRANGERTOME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_laresabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Proè vypadáš tak skepticky?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Vidím, že máš znamení 'Kruhu Vody'.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Jsi jedním z nich?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//A pokud by to byl ten pøípad?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//To bych ti pak øekl, že Lares chce nìkoho jiného, kdo se postará o jeho úkol v pøístavu.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Ok. Pokusím se najít nìkoho, kdo bude ochoten to udìlat.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//Mám to.
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Baltram, obchodník na tržišti, se postará o Laresùv ornament. Možná bude moci Lares KONEÈNÌ opustit pøístav.");
	SC_KNOWSBALTRAMASRANGER = TRUE;
	BALTRAM_EXCHANGE4LARES = TRUE;
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "Máš pro mì práci?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Máš pro mì práci?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Ne, poslíèka už mám. Zkus to u jiného obchodníka.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Hledáš práci?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasnì, o co jde?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Mùj poslíèek se ještì nevrátil zpátky a já èekám dodávku od farmáøe Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A kolik mi za to dáš?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dám ti 50 zlaákù.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Dobrá, to beru.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Dobrá, jenom øekni Akilovi, že tì posílám. Dá ti balík. Pøines mi ho.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"Baltram mì zamìstnal jako poslíèka. Mám mu pøinést nìjakou zásilku z Akilova statku.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"Když Beltramovi doruèím jeho zásilku, zaplatí mi 50 zlaákù.");
};


var int baltram_tradelog;

instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Ukaž mi své zboží.
	if(BALTRAM_TRADELOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Baltram prodává na tržišti potraviny.");
		BALTRAM_TRADELOG = TRUE;
	};
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nemìli to nechat dojít tak daleko. Teï jeden ze žoldákù zavraždil paladina.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Nìco by se mìlo stát!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Lidé jako ty ode mne nic nedostanou.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Proè?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Nejdøív znesváøíte farmáøe a potom dìláte, jako by se nic nestalo.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Teï vypadni, odháníš mi zákazníky.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_BALTRAM_SKIP(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skip_condition;
	information = dia_addon_baltram_skip_info;
	description = "Mimochodem, ty jsi v kontaktu s piráty?";
};


func int dia_addon_baltram_skip_condition()
{
	if(SCKNOWSBALTRAMASPIRATETRADER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skip_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(náhodile) Mimochoem, ty jsi v kontaktu s piráty?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(cítí se odhalen) Co? Kdo to øíkal?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Mluvil jsem s jedním. Vypadá to, že na tebe èeká ve svém zálivu.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//Dobøe, a co bych mìl teda dìlat? Tìžké èasy, vždy víš. Musím se nìjak živit.
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Nebojíš se, že tì pøitom chytí?",dia_addon_baltram_skip_erwischen);
	Info_AddChoice(dia_addon_baltram_skip,"Budeš muset èelit dùsledkùm svých èinù!",dia_addon_baltram_skip_mil);
};

func void dia_addon_baltram_skip_back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Ok, to je vše, co jsem chtìl vìdìt.
	Info_ClearChoices(dia_addon_baltram_skip);
};

func void dia_addon_baltram_skip_mil()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//Budeš muset èelit dùsledkùm svých èinù!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Hej, poslouchej. Øeknu ti všechno, co vím a ty to na mì na oplátku neøekneš, dobøe?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Jaké zboží vymìòuješ?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co víš o pirátech?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Nebojíš se, že tì pøitom chytí?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//No, mùže se to stát. Nakonec ty jsi to pøece zjistil.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Ale ty to nikomu neøekneš, že ne?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Jaké zboží vymìòuješ?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co víš o pirátech?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//(tvrdì) Jaké zboží vymìòuješ?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//Obvykle jídlo.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//A výmìnou za to dostávám ten nejlepší rum, jaký mùžes v Khorinisu dostat.
	Info_AddChoice(dia_addon_baltram_skip,"Ok, to je vše, co jsem chtìl vìdìt.",dia_addon_baltram_skip_back);
	Info_AddChoice(dia_addon_baltram_skip,"Mohl bych ti pomoci.",dia_addon_baltram_skip_ich);
};

func void dia_addon_baltram_skip_ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(s úsmìvem) Mohl bych ti pomoci.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//To není špatný nápad. Teï zrovna nemùžu opustit Khorinis.
	CreateInvItems(self,itmi_packet_baltram4skip_addon,1);
	b_giveinvitems(self,other,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Tady, vezmi si tento balíèek a øekni Skipovi, a tentokrát s tím rumem nešetøí.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Nemìlo by to být míò než 3 flašky.
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Baltram mi dal balíèek. Mìl bych ho doruèit Skipovi.");
	MIS_ADDON_BALTRAM_PAKET4SKIP = LOG_RUNNING;
};

func void dia_addon_baltram_skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//(tvrdì) Co víš o pirátech?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//(spìšnì) Žijí nìkde schovaní na ostrovì.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//Pokud vím, tak se tam dá dostat jedinì lodí.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Obèané Khorinisu se jich bojí. Oprávnìnì. V podstatì je to banda smradlavých hrdloøezù.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Na druhou stranu si myslím, že poøád nejsou tak strašní jako banditi.
};


instance DIA_ADDON_BALTRAM_SKIPSRUM(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skipsrum_condition;
	information = dia_addon_baltram_skipsrum_info;
	description = "Mám ten rum. Bohužel mi Skip dal jen 2 flašky.";
};


func int dia_addon_baltram_skipsrum_condition()
{
	if((SKIP_RUM4BALTRAM == TRUE) && (MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && (Npc_HasItems(other,itfo_addon_rum) >= 2))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skipsrum_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//Mám ten rum. Bohužel mi Skip dal jen 2 flašky.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(naštvanì) Zatracenì drahé. Co si o sobì ten Skip vùbec myslí? Ale dobøe, dej to sem.
	b_giveinvitems(other,self,itfo_addon_rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Nemùžu ti za to dát mnoho. To je vše, co mám.
	CreateInvItems(self,itmi_gold,10);
	b_giveinvitems(self,other,itmi_gold,10);
	TOPIC_END_BALTRAMSKIPTRADE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Projdi východní branou a drž se cesty vedoucí na jihovýchod.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chvíli pøijdeš ke kamennému schodišti. Vyjdi nahoru a odtud už uvidíš Akilovu farmu.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "Mám Akilovu dodávku.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mám Akilovu dodávku.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Výbornì. Koneènì zase mùžu nabízet èerstvé zboží. Tady máš 50 zlatých.
	b_giveinvitems(other,self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "Mohli bychom po tom všem spolu uzavøít obchod?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Mohli bychom po tom všem spolu uzavøít obchod?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Poslouchej, když mi pøineseš 10 šunek a 10 lahví vína, potom s tebou budu zase obchodovat.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Uvidím, co se dá dìlat.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "Mám tvé zboží.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mám tvé zboží.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Ukaž mi to.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Dohodli jsme se snad na 10 šunkách. Pøijï, až jich budeš mít dost.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co 10 lahví vína? Na ty jsi zapomnìl?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmm, není to sice nejlepší kvalita, ale v tìchto dobách nemùžeš být moc vybíravý.
		b_giveinvitems(other,self,itfo_bacon,10);
		b_giveinvitems(other,self,itfo_wine,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Teï nám nic nebrání v uzavøení obchodu.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};

