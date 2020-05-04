
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return TRUE;
};

func void dia_jarvis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_HELLO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 1;
	condition = dia_jarvis_hello_condition;
	information = dia_jarvis_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jarvis_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jarvis_hello_info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hej! Neznám tì odnìkud?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//To je monı. Taky jsem byl v kolonii.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Správnì... co chceš?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "Jak to vypadá?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Právì teï máme skuteènı problém. Mezi námi oldáky se vytváøí dvì frakce.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio a jeho lidé pochybují, e Lee se drí správného zámìru.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "Jak to, e jsou tu dvì frakce?";
};


func int dia_jarvis_twofronts_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_twofronts_info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//Jak to, e jsou tu dvì frakce?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Vìtšina z nás se vrátila z kolonie s Leem.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Ale nìkteøí ze oldákù se k nám pøipojili pozdìji.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Nepøišli z kolonie, ale bojovali daleko na jihu se skøety.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Nìjak se dozvìdìli, e Lee potøeboval lidi. Jejich vùdcem byl Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//On souhlasil s tím, e Lee zùstane velitelem, ale nyní se snaí poštvat ostatní oldáky proti nìmu a jeho zámìrùm.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Hodnì Leeovıch lidí si nemyslí, e je to velkej problém. Ale já znám tıpky jako je Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Aby docílil svého, bude to klidnì hnát na ostøí noe.
};


instance DIA_JARVIS_LEESPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 4;
	condition = dia_jarvis_leesplan_condition;
	information = dia_jarvis_leesplan_info;
	permanent = FALSE;
	description = "Víš, co chce Lee dìlat?";
};


func int dia_jarvis_leesplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_leesplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//Víš, co chce Lee dìlat?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee chce, abychom poèkali a nechali paladiny ve mìstì vyhladovìt.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Chce nás všechny dostat z ostrova. A Innos ví, e nemám nic proti tomu odsud vypadnout.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Skuteènì nevím, co pøesnì má za lubem, ale já mu vìøím. Vedl nás doteïka dobøe.
};


instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 5;
	condition = dia_jarvis_sylviosplan_condition;
	information = dia_jarvis_sylviosplan_info;
	permanent = FALSE;
	description = "Víš, co má Sylvio v plánu?";
};


func int dia_jarvis_sylviosplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//Víš, co má Sylvio v plánu?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio zjistil, e nìkteøí z paladinù se pøesunuli do staré kolonie.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//Øíká, e zbytek paladinù by si nás tady neodváil napadnout, a chce z toho vytìit co nejvíc.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Drancování malıch farem, pøepadávání vojenskıch hlídek mimo mìsta, olupování poutníkù, prostì takovéhle vìci.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Ale Lee si myslí, e by to byla ta nejhorší vìc, jakou bychom v naší situaci mohli udìlat.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "Chtìl bych se stát oldákem!";
};


func int dia_jarvis_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_wannajoin_info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Chtìl bych se stát oldákem!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Nejsem si jistej, e je to dobrej nápad.
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//Kde je problém?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//No, buï budu hlasovat pro, nebo proti.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//A v situaci, ve které jsme, bych pro tebe urèitì hlasoval, kdybych si byl jistej, e jsi na Leeho stranì!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "Take co bych mìl dìlat?";
};


func int dia_jarvis_missionko_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_missionko_info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//Take co bych mìl dìlat?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//Jednoduché. Zmla pár Sylviovıch hochù! Tímhle zpùsobem budou obì strany pøesnì vìdìt, kde stojíš.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//A pokud se budeš pøi souboji dret pravidel, dokonce získáš respekt ostatních.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"Jarvis mi dá svùj hlas, pokud se mi podaøí porazit Sylviovy hochy.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "Jaká jsou pravidla pro souboj?";
};


func int dia_jarvis_duellregeln_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_duellregeln_info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Jaká jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//Bì za Torlofem a nech si to vysvìtlit, pokud tì to zajímá.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//Take u si rozumíme: Nezajímá mì, jestli dodruješ pravidla nebo ne. Prostì a ti chlapi leí drkou v bahnì!
	b_logentry(TOPIC_JARVISSLDKO,"A já se ádnımi soubojovımi pravidly øídit nemusím...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "Kteøí ze oldákù jsou Sylviovi mui?";
};


func int dia_jarvis_sylviosmen_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosmen_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Kteøí ze oldákù jsou Sylviovi mui?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Je to šest chlapù. První je Sylvio sám a jeho pravá ruka Bullco.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Zbytek chlapù je buï neutrálních, nebo na Leeovì stranì.
	b_logentry(TOPIC_JARVISSLDKO,"K Sylviovım chlapùm patøí kromì Sylvia ještì jeho velitel Bullco, Rod, Sentenza, Fester a Raoul.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "Kolik Sylviovıch chlapù mám porazit?";
};


func int dia_jarvis_howmany_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_howmany_info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//Kolik Sylviovıch chlapù mám porazit?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Pokud srazíš tøi z nich k zemi, pak nám dokáeš, na které jsi stranì.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Koho z nich si vybereš, to je tvoje vìc.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Alespoò jedna malá rada: Tohle není o tom dokázat si kurá. Nechoï pøímo proti Sylviovi samotnému - nadìlal by z tebe sekanou.
	b_logentry(TOPIC_JARVISSLDKO,"Postaèí, kdy porazím tøi Sylviovy kumpány - se Sylviem samotnım bych se do køíku radši pouštìt nemìl.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "Kolik Sylviovıch muù mám ještì na seznamu?";
};


func int dia_jarvis_howmanyleft_condition()
{
	if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
	{
		return TRUE;
	};
};

func void dia_jarvis_howmanyleft_info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Kolik Sylviovıch muù mám ještì na seznamu?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Porazil jsem Bullca.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//Slyšel jsem. To nebylo zlı.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod vypadá trochu unavenì.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza se pokusil ze mne dostat nìjakou zlatku - to nebylo chytrı.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Sundal jsem Sentenzu.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//Fester se mì pokusil oblafnout - to byla velká chyba.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester dostal to, co si zaslouil.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//A to samé Raoul...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Byl jsem se na Raoula podívat...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//A?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Potøeboval poøádnou nakládaèku.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Doteï jsi nesloil jedinıho Sylviova chlapa.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Dobøe - jen pokraèuj.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//Oèekávám od tebe, e zøídíš alespoò tøi z nich.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//To staèí, to staèí.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Ty jsi skuteènì napráskal kadımu z nich, jo?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Udìlal jsi na mì dojem - a se mì Lee zeptá, budu bez váhání hlasovat pro tebe.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"Kdy se budu chtít pøipojit k oldákùm, Jarvis bude pro.");
	};
};


var int jarvis_guildcomment;
var int jarvis_sylviocomment;

instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = FALSE;
	description = "Co je nového?";
};


func int dia_jarvis_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Co je nového?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Teï jsi jeden z nás. To je dobøe.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Vybral sis špatnì, mohl ses stát jedním z nás.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Poslední dobou Sylviovi lidé dost zkrotli. (divokı smích)
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Sylvio je koneènì pryè. Po tom, co slyšel o dracích, on a jeho pár chlapù smìøovali do tìaøské kolonie.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Pravdìpodobnì si myslel, e by tam mohlo bıt nìco víc.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nic, teï u je všechno v klidu. Nemohu se doèkat toho, a uvidím, jak tohle všechno dopadne.
		};
	};
};


instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 900;
	condition = dia_jarvis_pickpocket_condition;
	information = dia_jarvis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jarvis_pickpocket_condition()
{
	return c_beklauen(41,55);
};

func void dia_jarvis_pickpocket_info()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
};

