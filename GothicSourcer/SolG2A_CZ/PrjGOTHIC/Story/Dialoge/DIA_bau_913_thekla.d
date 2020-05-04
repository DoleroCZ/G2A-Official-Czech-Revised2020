
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Co dìláš tady v kuchyni?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "Nìco tady výbornì voní!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Nìco tady výbornì voní!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//No jasnì! Takové jako ty dobøe znám! Takových se tady po okolí potulují spousty.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Nejdøív se snaží vetøít do tvojí pøíznì a pak, když je potøebuješ, nejsou nikde k nalezení!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "Mám hlad!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Mám hlad!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Neservíruju tulákùm. Jídlo je jen pro lidi, co tu pracují.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(pohrdavì) A pro tu žoldáckou chátru, samozøejmì.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Tady, tvùj dlabanec.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Tady se jídlo vojákùm nepodává.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Jak by se dal odmítnout Innosùv zmocnìnec?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "Hledám práci.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Hledám práci...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Chceš pracovat tady na farmì?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//O tom mùže rozhodnout pouze Onar. Farma patøí jemu, stejnì jako celé údolí.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "Vlastnì jsem se chtìl pøipojit k žoldnéøùm ...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Vlastnì jsem se chtìl pøipojit k žoldnéøùm.
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Takže ty jsi další z tìch lotrù z trestanecké kolonie?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//To se dalo èekat! Nech mì na pokoji! Takových jako ty už je tady v okolí až dost!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "Potøebuju se nìkde vyspat.";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Potøebuju se nìkde vyspat.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Ani nepomysli na to, že by ses mohl vyspat v mojí kuchyni. Najdi si nìco ve stodole.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "Co máš za problémy se žoldáky?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Co máš za problémy se žoldáky?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ach, ti pitomci mi vážnì lezou na nervy! Obzvláš Sylvio a jeho tlustej kámoš Bullco.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Ti dva tu sedí celé dny a ztrpèují mi život.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//Ta polívka je moc horká, maso moc tuhý a tak poøád dokola.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//A proè s tím teda nìco neudìláš?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//A co jako mám dìlat, pane Chytrolín? Praštit je váleèkem? To si mùžu dovolit na farmáøe, ale tihle podlí bastardi mi to prostì vrátí.
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Chceš, abych ty dva nauèil slušným zpùsobùm?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Chceš, abych ty dva nauèil slušným zpùsobùm?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Udìláš líp, když to nebudeš zkoušet, drahoušku. Co vím, tak Sylvio má magickou zbroj. Jeho nemùžeš porazit.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//A co Bullco?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Ten chlap je silnej jako hovado. Co pamatuju, srazil každýho, kdo jemu nebo Sylviovi dìlal potíže.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Vážnì bys mìl nechat Bullca na pokoji, drahoušku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//To musí být poøádná fuška srazit to tlustý prase.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Dostals docela nakládaèku, drahoušku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Neøíkala jsem ti to snad? Teï víš, co jsem mìla na mysli.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Jsem rád, že se dobøe bavíš.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Tak teï tak neprotahuj oblièej. Nejsi první, kdo od toho neøáda dostal napráskáno.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Tady, dej si trochu vývaru, a se ti vrátí síla.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Tady je balík od Sagitty.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Tady je balík od Sagitty.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Díky moc. Tak jsi byl pøece jen k nìèemu dobrý.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "Mùžu dostat ještì trochu toho vývaru?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Mùžu dostat ještì trochu toho vývaru?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Už nic nemám.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Ani malièkou misku?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Ne.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//A mùžu alespoò vylízat hrnec?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Necháš toho?!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Když tak prahneš po mém vývaru, mìl bys pro to nìco udìlat.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Co?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Zajdi za Sagittou, léèitelkou, co žije za Sekobovou farmou, a pøines mi od ní balík bylinek.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Když mi pøineseš ty bylinky, udìlám ti trochu vývaru.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		CreateInvItems(sagitta,itmi_theklaspaket,1);
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"Když Thekle pøinesu byliny od léèitelky Sagitty, uvaøí mi ještì další lektvar. Sagitta pøebývá kousek za Sekobovým statkem.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//Dobrá. Tak budu hodná. Tady. A mi neumøeš hlady pøed oèima.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hej, hej, hej, ne tak rychle! Dám ti vìdìt, až pro tebe najdu nìjakou práci.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//A PAK dostaneš víc vývaru, je to jasný?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//Slyšela jsem, žes pomohl Bennetovi z vìzení. Dobrá práce, hochu.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Ty bastardi od domobrany hodili Benneta do lochu.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Udìlej mi laskavost a dostaò ho odtamtud, jo? A já ti zatím udìlám trochu toho bájeènýho vývaru.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//Už mi nic nezbylo. Vra se pozdìjc.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Ty jsi poøád hladovej, co? A co vlastnì poøád dìláš?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//Sejmul jsem pár drakù.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Ó! Tak to mám dojem, že nadešla chvíle na poøádnej hrnec vývaru.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//Pozdì. Už žádný vývar nezbyl.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Žádné bylinky, žádný vývar - víme?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

