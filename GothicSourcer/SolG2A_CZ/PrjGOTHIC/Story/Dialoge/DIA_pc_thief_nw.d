
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 998;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "Jak jdou obchody?";
};


func int dia_diegonw_perm_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Mizernì. Nìkdo mi mìl øíct, že to s Khorinisem šlo k šípku.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nevím. Já to mìsto znám jenom takhle.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Mìl jsi ho vidìt pøed pár lety. To by se ti vážnì líbilo.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	if(DIEGO_ISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Netvaø se tak pøekvapenì.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(smìje se) Ty jsi si opravdu myslel, že jsem se mrtvý?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Byl jsem chvíli v bezvìdomí. Nicménì žiji, jak sis mohl všimnout.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//A nyní jsme spolu. A to se poèítá.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Potøebuji tvou pomoc.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dobøe že jsi tady. Budeš mi muset pomoci.
	};
	Info_ClearChoices(dia_diegonw_needhelp);
	if(diegoow.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
	};
	Info_AddChoice(dia_diegonw_needhelp,"Co je tohle za šaty?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"Co tady dìláš?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"Co jako?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Pozoroval jsem stráže. Jsou poøád na nohou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Øekl bych, že proklouznout mezi nimi nebude nijak snadné.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Asi to bude mými šaty. Stráže mì nechtìjí pustit do mìsta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Proto jsem pøed mìstem koupil od jednoho obchodníka tyhle hadry. Doufám, že si na mì už vzpomínáš. Jsem Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Tenkrát v base jsem tì nauèil všechno, co jsi potøeboval vìdìt, abys pøežil.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Pøece jsi to všechno nemohl zapomenout.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ehm... co všechno se vlastnì stalo?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//No to mì omyj, ty si vážnì nic nepamatuješ.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Hele, vážnì teï nemám èas ti všechno vysvìtlovat. Øeknu to takhle: bývali jsme zatracenì dobøí pøátelé a nìkolikrát jsem ti zachránil život.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A teï potøebuji tvou pomoc.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co je tohle za šaty?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Koupil jsem je pøed mìstem od jednoho obchodníka. Stráže mì poprvé nechtìli pustit dovnitø.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Také není nutné, aby celý svìt vìdìl, odkud jsem.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//To je fakt.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Také to tak vidím. Ale i když jsem zahodil svùj hábit Stínu, jsem poøád tím, kým jsem byl vždycky.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//A s tímhle mìstem mám velké plány.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Co jako?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Hodnì vìcí se zmìnilo, co jsem odešel. Musím se znovu postavit na nohy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//V èem je problém?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Musím se dostat do horní èásti mìsta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Nejsem ale obèanem mìsta a nemám dost penìz, abych podplatil stráže. Ale naštìstí tady jsi ty!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Takže po mnì chceš, abych ti pùjèil nìjaké peníze?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nesmysl. Nìjaké zlato mám - dokonce spoustu zlata! Bohužel ho nemám s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Takže mi to moje zlato pøineseš.
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Na to nemám èas.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(dia_diegonw_needhelp,"Co z toho budu mít?",dia_diegonw_needhelp_problem_reward);
	Info_AddChoice(dia_diegonw_needhelp,"Dobrá, pomùžu ti.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Na to nemám èas.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hele, já myslel, že jsme kámoši! Byl jsem to konec koncù já, kdo ti zachránil kejhák, když tì hodili do kolonie.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Pøeháníš.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Vážnì? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysvìtlil, jak se chovat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Rudní baroni by si tì dali k snídani, èekala by tì mizerná smrt v dolech.
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Ptal jsem se snad nìkdy já tebe, co dostanu na oplátku? Jsme pøátelé, copak to je málo?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Dobrá, pomùžu ti.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Dobrá, poslouchej: Když ještì stála bariéra, schoval jsem si malý poklad.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Poèkej chvíli. To je to, co jsem si zapomnìl vzít s sebou.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Ale musím zde zùstat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Abych to zkrátil, prostì bìž do Hornického údolí a pøines mi moje zlato.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto v Hornickém údolí. Potøebuje se dostat mezi smetánku, a tak mì pro nì poslal.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Co chceš s tím zlatem dìlat?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Kde jsi to zlato získal?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Kam jsi to zlato ukryl?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co chceš s tím zlatem dìlat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//V horní èásti mìsta je obchodník, kterému musím zaplatit dluh. Potøebuju to dát koneènì do poøádku.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A pak budu moci zaèít zcela nový život!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Kde jsi to zlato získal?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Jsem snad jediný, kdo si v Hornickém údolí šetøil pro strýèka Pøíhodu?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Štípnout pár nugetù byla hraèka. Dìlal jsem to prostì pro pøípad, že bychom se nakonec dostali ven.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Každý se staral pouze o rudu, nikdo se nestaral o zlato ...
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Kam jsi to zlato ukryl?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Je pøímo na tržnici. Nad opuštìným dolem. Jsou v kožené kabele.
	if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Ale ticho. Myslím, že si toho nikdo nevšiml.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Prostì vezmi váèek a dones mi ho.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Nezapomeò se ale pøesvìdèit, že tam opravdu je, a se nevracíš s prázdnou.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak to poznám?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Ten vak je plný zlata. Je to spousta zlata!
	Info_AddChoice(dia_diegonw_needhelp,"Zkusím to tvoje zlato najít.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto kdesi na staré obchodní cestì, nad opuštìným dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zboží.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Zkusím to tvoje zlato najít.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(zašklebí se) Jen do toho. Budeme si kvit.
	Info_ClearChoices(dia_diegonw_needhelp);
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "Dobrá, pøece jenom ti pomùžu.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Dobrá, pøece jenom ti pomùžu.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Vìdìl jsem to.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Fajn, pøejdìme rovnou k vìci.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Takže. V Hornickém údolí jsem si schoval poklad, a ty mi ho pøineseš.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//Já mezitím zùstanu tady a všechno pøipravím.
	dia_diegonw_needhelp_problem_willhelpyou_wheregold();
	dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto kdesi na staré obchodní cestì, nad opuštìným dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zboží.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "Našel jsem tvoje zlato!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OPENEDDIEGOSBAG == TRUE) || (Npc_HasItems(other,itse_diegostreasure_mis) >= 1)) && (MIS_HELPDIEGONW == LOG_RUNNING) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Prefekt. Gerbrandt by se mìl radši mít na pozoru.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Našel jsem tvoje zlato!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Výbornì. Ukaž.
	if(Npc_HasItems(other,itse_diegostreasure_mis) >= 1)
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold) < DIEGOSTREASURE)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to není všechno! Nevìøíš mi? Potøebuju všechno.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Pokud mùj plán vyjde, zbude dost i na tebe.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Takže se snaž, aby nic nechybìlo. Je to dùležité!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if((Npc_IsDead(gerbrandt) == FALSE) && (DIEGOSREVENGE == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Poslouchej, ještì se musím postarat o ty stráže.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Chtìl bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z tìch tlustých obchodníkù v horní ètvrti.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Pozdravuj ho ode mne. Pak se s tebou setkám pøed Gerbrandtovým domem.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Diego mi pøedal dopis pro obchodníka Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "Doruèil jsem ten dopis.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Doruèil jsem ten dopis.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Velmi dobøe. Jak to Gerbrandt vzal?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Vypadal docela šokovanì a okamžitì se ztratil.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(spokojenì) To bych øekl.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Obávám se, že ze všeho nejdøív budu muset dohlédnout na vybavení svého nového domu. Pokud si dobøe pamatuju, tak Gerbrandt mìl strašný vkus, co se nábytku týèe.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"A jak jsi to vlastnì udìlal?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"Takže ten dùm je tvùj?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//A co Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Už si užíval toho pohodlného života pøíliš dlouho.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//On si žil tady, uprostøed luxusu, zatímco já dlabal v dolech vývar z krys.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Netuším, kam mìl namíøeno, ale do Khorinisu už nikdy nevkroèí - na to dohlédnu.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Kdybys ho hledal, najdeš ho asi v pøístavní ètvrti.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Takže ten dùm je tvùj?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Ano, od sklepa až po pùdu, vèetnì všeho nábytku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po nìkolika letech strávených v krajnì nevyhovujících podmínkách se tìším, až se vyspím v posteli s nebesy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A k snídani si pak dám dobré víno a šavnatou šunèièku.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Chytáš štìstí za paèesy, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Se vsaï.
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//A jak jsi to vlastnì udìlal?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Myslíš snad, že Gerbrandt pøišel ke všemu tomu bohatství poctivým obchodem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Když pøišlo na nìjakou levotu, tak si sám ruce pochopitelnì nikdy nezašpinil. Na to mìl pomocníka.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Samozøejmì, že jsem tu a tam nìco pochytil. Gerbrandt se mì nakonec zbavil. Nejspíš se bál, že toho vím pøíliš.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//O tom jsi mi nikdy neøekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nikdy ses neptal.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co mùj podíl?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co Gerbrandt?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co mùj podíl?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Zdá se, že jsi nakonec pøece jenom nezapomnìl na všechno, co jsem tì nauèil.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale máš pravdu, bez tebe bych to nedokázal. Tady je tvùj díl.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "Mùžeš mì nìèemu nauèit?";
};


func int dia_diegonw_canyouteach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Mùžeš mì nìèemu nauèit?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Ale jistì. Jen mi øekni, až budeš pøipraven.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Nejdøív se musím postarat o vlastní záležitosti.
	};
};


var int diegonw_merke_dex;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "Uè mì.";
};


func int dia_diegonw_teach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Uè mì.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Nauèím tì, jak být o nìco obratnìjší.
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Už jsi obratnìjší. Jen tak dál!
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Odcházím z Khorinisu.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Odcházím z Khorinisu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Moudré rozhodnutí. Pøál bych si jít s tebou. Tohle mìsto se pøíliš rychle zmìnilo - èasy, kdy jsi mohl rychle zbohatnout, už jsou pryè.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Mohl bych tì uèit v luèištnictví, páèení zámkù a navyšování obratnosti.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Navíc by se ti urèitì hodil nìjaký slušný zlodìj.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Diego chce jít samozøejmì se mnou. Vidí to tak, že èím døív Khorinis opustí, tím líp. Mohl by mi ukázat, jak se stát obratnìjším a vycvièit mì v lukostøelbì. Také se se mnou podìlí o umìní páèit zámky.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Nechám si to projít hlavou. Momentálnì je moje posádka v plném stavu.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Rozmysli si to. Tak jako tak mì najdeš tady.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Snad ti dám vìdìt, až pøijde ten pravý èas.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Nechceš jít taky?",dia_diegonw_knowwhereenemy_yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Tak pojeï se mnou setkáme se v pøístavu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmm. Máš pravdu, Khorinis je žumpa. Jdu s tebou.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Poèkej, za okamžik budu pøipraven.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Tak, jsem pøipraven. Uvidíme se u lodi.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Možná ti dám vìdìt, až nadejde èas.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Jak myslíš. A možná s tebou dokonce i pùjdu. Kdo ví?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "Dohlídni radši na mìsto.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Dohlídni radši na mìsto.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Vážnì? Už mì nepotøebuješ? No dobrá. Nezapomeò se stavit, až budeš zpátky ve mìstì.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Myslíš, že se ještì setkáme?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nikdy nezapomenu na ten výraz, který jsi mìl ve tváøi, když ses válel po zemi po té ránì od Bullita a my se poprvé setkali.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Nemají šanci sehnat nìkoho lepšího, než jsi ty. MÌLI bychom se znovu setkat. Dávej na sebe pozor.
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Chci, abys šel se mnou.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Rozmyslel jsem si to. Chci, abys šel se mnou.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Kam se podìlo tvé odhodlání, pøíteli? Jasnì, že s tebou pùjdu - ale už se sakra rozhodni.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Poèkej, za okamžik budu pøipraven.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobrá, mùžeme jít.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

