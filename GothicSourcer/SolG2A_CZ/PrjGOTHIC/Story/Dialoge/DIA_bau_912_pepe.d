
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(otrávenì) Hlídám ovce! (vzdychá) A pokud je to moné, vyhıbám se problémùm.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Moc to nefunguje, co?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Pff, zvláš s tìmi oldáky. Jsem opravdu rád, e mùu bıt tady na pastvinì. I kdy to mùe bıt nebezpeèné tak jako tak.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "Co je tak nebezpeèného na pastvinì?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//Co je tak nebezpeèného na pastvinì?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Po okolí se tu potuluje smeèka vlkù. Poslední dobou sem ty zatracenı bestie pøicházej serat nìkterou z mejch ovcí skoro kadej den.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Ještì pøed pár dny jsem mìl dvakrát tolik ovcí. Nechci ani pomyslet na to, co se mnou Onar udìlá, a na to pøijde.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Proè jsi o tìch vlcích neøekl oldákùm? Mìl jsem dojem, e pro vás pracují.";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Proè jsi o tìch vlcích neøekl oldákùm? Mìl jsem dojem, e pro vás pracují.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Jo, já vim. Mìl jsem to udìlat. Ale nestalo se, sakra.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//A teï, kdy je tolik ovcí pryè, mám strach o tom nìkomu cokoli øíct.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Ale právì jsi to øekl MNÌ.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(zlostnì) U toho taky lituju.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "Co kdy ty vlky zabiju?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Co kdy ty vlky zabiju?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(posmìšnì) Ty? A sám? Ha ha. Tomu nevìøím. To døív uvìøil tomu, e to udìlá mùj chlebodárce.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Zapomeò na to. Byl to jen návrh. Zajdu za chlapama a uvidím, co tomu øeknou ONI.
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(vydìšenì) Poèkej chvilku. Fajn, fajn! Ehm... Jsi nejvìtší ze všech nejvìtších a klidnì zvládneš sto vlkù najednou. ádnı problém!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Nejèastìji se skrıvají mezi stromy poblí pastviny. (stranou) Mám dojem, e jsou jen ètyøi.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Pepeho ovce ohroují ètyøi vlci. Mìl bych je zahnat. ");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "Oddìlal jsem ty vlky.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Oddìlal jsem ty vlky.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(uasle) Dokázals to! Díky Innosovi!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Ale ještì poøád nevím, jak øíct Onarovi, e pøišel o tolik ovcí.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(pro sebe) Všechno je to chyba toho zatraceného Bullca!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//Nedìlej si ze mì blázny. Ty bestie ještì nejsou všechny mrtvé.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "Cos to øíkal o tom Bullcovi?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Cos to øíkal o tom Bullcovi?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Je to jeden ze oldákù. Je to vlastnì jeho práce, hlídat pastviny.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Ale místo toho se se svım kámošem Sylviem jen celı dny flákaj kolem Thekly v kuchyni.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Je to chyba tìch bastardù, e kvùli tìm ovcím nedostanu tejdenní mzdu.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Kdybych mu alespoò mohl za to dát do zubù. Ale proti nìmu nikdo nemá ádnou šanci. Ten chlap je zabiják.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Bullco se mìl o Pepeho ovce líp starat. Pepe teï chce nìkomu dát poøádnì za vyuèenou.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Bullco dostal, co si zaslouil. Postaral jsem se o to.";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullco dostal, co si zaslouil. Postaral jsem se o to.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Ta svinì si to zaslouila.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "Jak se máš? A co tvoje ovce?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Jak se máš? A co tvoje ovce?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//V pohodì. A stejnì tak ovce. Ty, co tu poøád ještì jsou, se mají dobøe.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Fajn. Ale ty vlci se jednou vrátìj. A asi jich bude ještì víc!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Slyšel jsem hodnì divnı vìci. Nìjakı hrozivì vypadající postavy otravují u Sekoba. Obklíèily jeho dùm.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Slyšel jsem, e se na Lobartovì farmì rozvalují nìjací oldáci. Nìkdo by jim moná mìl pomoct.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "Mùu si koupit ovci?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Mùu si koupit ovci?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Kdykoli, kdy za ni dáš dost penìz. Jedna ovce stojí 100 zlatıch.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Kdy zaplatíš, mùeš si ovci vzít. Ale musíš se o ni dobøe postarat.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Tady je 100 zlatıch. Tak mi dej ovci.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Tady je 100 zlatıch. Tak mi dej ovci.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Fajn. Tak si vezmi Betsy - najdeš ji na pastvinì.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Prostì øekni, a jde za tebou. Na ovci je docela chytrá. Starej se o ni dobøe!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Zase? Fajn. Vezmi si Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? Ale u ta minulá ovce se jmenovala Betsy.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Všechny ovce se jmenují Betsy.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Samozøejmì kromì beranù.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//A jak se jmenují oni?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//Nemáš dost zlata. Nemùu ti tu ovci dát levnìji.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

