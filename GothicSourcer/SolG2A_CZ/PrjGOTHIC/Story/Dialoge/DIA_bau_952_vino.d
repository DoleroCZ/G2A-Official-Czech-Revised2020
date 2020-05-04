
instance DIA_VINO_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_exit_condition;
	information = dia_vino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_vino_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_HALLO(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_hallo_condition;
	information = dia_vino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_hallo_info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//A jak jde práce?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//Jako vždycky. Spousta døiny, málo penìz a s trochou smùly zejtra pøijdou skøeti a srovnají naši farmu se zemí.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//Královští paladinové obsadili celé mìsto. Ale nechce se mi vìøit, že by odtamtud zvedli ty svý velebný zadky a šli nám pomoct, až nás napadnou skøeti.
	};
};


instance DIA_VINO_SEEKWORK(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_seekwork_condition;
	information = dia_vino_seekwork_info;
	permanent = FALSE;
	description = "Mùžu ti pomoct? Hledám práci.";
};


func int dia_vino_seekwork_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_worknow) || Npc_KnowsInfo(other,dia_lobart_kleidung)) && !Npc_IsDead(lobart) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_seekwork_info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Mùžu ti pomoct? Hledám práci.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//Víš nìco o polních pracech?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//Co je tom tak složitého?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Ach! V tom pøípadì... Mám dojem, že si vystaèíme sami. Díky.
		if(!Npc_IsDead(lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//Pokud chceš pro Lobarta pracovat jako nádeník, musím tì varovat. Lidem jako ty platí fakt mizernì!
			if(((Mob_HasItems("CHEST_LOBART",itar_bau_l) == TRUE) || (Npc_HasItems(lobart,itar_bau_l) > 0)) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (Npc_KnowsInfo(other,dia_lobart_kleidung) || Npc_KnowsInfo(other,dia_lobart_worknow)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//Nabídl, že mi prodá nìjaké šaty se slevou, když mu pomùžu na farmì.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Hmm. Nemám pro tebe nic, ale mùžeš mnì a chlapùm pøinést nìco k pití.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//Pøines mi láhev vína a já øeknu Lobartovi, žes nám opravdu pomohl (s výsmìšným úšklebkem).
				MIS_VINO_WEIN = LOG_RUNNING;
				Log_CreateTopic(TOPIC_VINO,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_VINO,LOG_RUNNING);
				b_logentry(TOPIC_VINO,"Jestli Vinovi pøinesu láhev vína, poví Lobartovi, že jsem mu pomohl.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//Ale ode mì to nemáš, jasný?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//Neøekl bych. Nìkdo tvého postavení nemùže mít zájem o takový druh práce, co nabízím.
	};
};


instance DIA_VINO_BRINGWINE(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_bringwine_condition;
	information = dia_vino_bringwine_info;
	permanent = FALSE;
	description = "Tady je to víno.";
};


func int dia_vino_bringwine_condition()
{
	if((MIS_VINO_WEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_bringwine_info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//Tady je to víno.
	b_giveinvitems(other,self,itfo_wine,1);
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//Radìji se nemám ptát, kdes ho sebral, co? (smích) Koho to zajímá?
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Jinak díky.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Lobart o tobì uslyší jen to nejlepší.
		};
	};
	MIS_VINO_WEIN = LOG_SUCCESS;
	b_giveplayerxp(XP_VINOWEIN);
};


instance DIA_VINO_TOTHECITY(C_INFO)
{
	npc = bau_952_vino;
	nr = 3;
	condition = dia_vino_tothecity_condition;
	information = dia_vino_tothecity_info;
	permanent = FALSE;
	description = "Mám namíøeno do mìsta.";
};


func int dia_vino_tothecity_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_vino_tothecity_info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//Mám namíøeno do mìsta.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//A?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Mùžeš mi o mìstì øíct nìco zajímavého?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Ne. Ale Maleth tam obèas zajde - snad se od nìj nìco dozvíš - myslím nìco, co by tì mohlo zajímat.
};


var int vino_gossip_orks;
var int vino_gossip_bugs;

instance DIA_VINO_PERM(C_INFO)
{
	npc = bau_952_vino;
	nr = 10;
	condition = dia_vino_perm_condition;
	information = dia_vino_perm_info;
	permanent = TRUE;
	description = "Nìjaké zajímavé novinky?";
};


func int dia_vino_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vino_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_perm_info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Nìjaké zajímavé novinky?
	if(VINO_GOSSIP_ORKS == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//Pøísahal bych, že jsem pøede dvìma dny na kraji lesa zahlédl skøeta.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//Od té doby mám v noci vždycky alespoò jedno oko otevøené.
		VINO_GOSSIP_ORKS = TRUE;
		KNOWS_ORK = TRUE;
	}
	else if((VINO_GOSSIP_BUGS == FALSE) && (MIS_ANDREHELPLOBART == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//Ti obrovští odporní brouci už jsou vážnì hodnì otravní. Jsou všude. Sežerou, co uvidí, když na to nedáš pozor.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//Pøed nìkolika dny jsem ležel v trávì, myslel si na své, chvilku jsem si zdøímnul a najednou koukám, jak mi jedna z tìch zatracenejch vìcí ožužlává botu!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//Mìls mì vidìt, jak jsem mazal. Od tý doby se nemùžu ani poøádnì vyspat.
		VINO_GOSSIP_BUGS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Ale jinak, co ti mám povídat? Nic.
	};
};


instance DIA_VINO_KAP3_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap3_exit_condition;
	information = dia_vino_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_vino_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_DMTAMSTART(C_INFO)
{
	npc = bau_952_vino;
	nr = 31;
	condition = dia_vino_dmtamstart_condition;
	information = dia_vino_dmtamstart_info;
	permanent = TRUE;
	description = "A jak je to s tebou?";
};


func int dia_vino_dmtamstart_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_vino_dmtamstart_onetime;

func void dia_vino_dmtamstart_info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//A jak je to s tebou?
	if((FOUNDVINOSKELLEREI == TRUE) && (DIA_VINO_DMTAMSTART_ONETIME == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//Je to mizérie. Domobrana našla mojí palírnu.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//Doufám, že nikdy nezjistí, že patøí mnì.
		b_giveplayerxp(XP_AMBIENTKAP3);
		DIA_VINO_DMTAMSTART_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//Ti bastardi v èerných kápích jsou snad všude. Nìkdo by jim ty jejich kápì mìl omotat kolem krku.
	};
};


instance DIA_VINO_OBESESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 32;
	condition = dia_vino_obesessed_condition;
	information = dia_vino_obesessed_info;
	permanent = TRUE;
	description = "Co je s tebou?";
};


func int dia_vino_obesessed_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == FALSE) && (KAPITEL >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_vino_obesessed_info()
{
	if(Npc_IsDead(dmt_vino1) && Npc_IsDead(dmt_vino2) && Npc_IsDead(dmt_vino3) && Npc_IsDead(dmt_vino4))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//Co je s tebou?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(øve) Zatracenì, zmizni. Jinak mì zabijou.
		AI_StopProcessInfos(self);
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_VINO_HEILUNG(C_INFO)
{
	npc = bau_952_vino;
	nr = 55;
	condition = dia_vino_heilung_condition;
	information = dia_vino_heilung_info;
	permanent = TRUE;
	description = "Ty vùbec nejsi pøi smyslech.";
};


func int dia_vino_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vino_heilung_onetime;

func void dia_vino_heilung_info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//Ty vùbec nejsi pøi smyslech.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//Moje hlava... Už to nemùžu dýl vydržet.
	if(DIA_VINO_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//Mìli bychom zajít do kláštera. Pyrokar, nejvyšší mág, ti snad pomùže.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Myslíš? Fajn. Tak to zkusíme.
		b_npcclearobsessionbydmt(self);
		b_startotherroutine(vino,"Kloster");
		b_logentry(TOPIC_DEMENTOREN,"Vino je posedlý. Poslal jsem ho do kláštera, kde ho snad vyléèí. Doufám, že tam v poøádku dorazí.");
		b_giveplayerxp(XP_VINOFREEFROMDMT);
		DIA_VINO_HEILUNG_ONETIME = TRUE;
	};
};


instance DIA_VINO_KAP4_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap4_exit_condition;
	information = dia_vino_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_vino_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PERM4OBSESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 41;
	condition = dia_vino_perm4obsessed_condition;
	information = dia_vino_perm4obsessed_info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int dia_vino_perm4obsessed_condition()
{
	if((hero.guild == GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int dia_vino_perm4obsessed_xp_onetime;

func void dia_vino_perm4obsessed_info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Jo, jo, už je to v poøádku. Mám dojem, že mi tihle chlapci mùžou pomoct. Ale ještì je mi dost divnì.
	if(DIA_VINO_PERM4OBSESSED_XP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//Ale musím uznat, že jejich víno je to nejlepší, co jsem zatím mìl možnost ochutnat.
		b_giveplayerxp(XP_AMBIENT);
		DIA_VINO_PERM4OBSESSED_XP_ONETIME = TRUE;
	};
};


instance DIA_VINO_PERM45UND6(C_INFO)
{
	npc = bau_952_vino;
	nr = 42;
	condition = dia_vino_perm45und6_condition;
	information = dia_vino_perm45und6_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vino_perm45und6_condition()
{
	if((KAPITEL >= 4) && (hero.guild != GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vino_perm45und6_info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Co je nového?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//Poèet skøetù se v okolí nepøíjemnì zvýšil.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//Vy paladinové s nima zatoèíte, ne?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Bojím se, že už brzy budeme muset všeho nechat a pøidat se k vám, žoldákùm na Onarovì farmì.
	};
	if((FOUNDVINOSKELLEREI == TRUE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//Bohužel, domobrana mì ještì nepøestala hledat. Jen doufám, že mì nechytí.
	};
};


instance DIA_VINO_KAP5_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap5_exit_condition;
	information = dia_vino_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vino_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_KAP6_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap6_exit_condition;
	information = dia_vino_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_vino_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PICKPOCKET(C_INFO)
{
	npc = bau_952_vino;
	nr = 900;
	condition = dia_vino_pickpocket_condition;
	information = dia_vino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_vino_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_vino_pickpocket_info()
{
	Info_ClearChoices(dia_vino_pickpocket);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_BACK,dia_vino_pickpocket_back);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_PICKPOCKET,dia_vino_pickpocket_doit);
};

func void dia_vino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vino_pickpocket);
};

func void dia_vino_pickpocket_back()
{
	Info_ClearChoices(dia_vino_pickpocket);
};

