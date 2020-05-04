
instance DIA_ADDON_EROL_EXIT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 999;
	condition = dia_addon_erol_exit_condition;
	information = dia_addon_erol_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_erol_exit_condition()
{
	return TRUE;
};

func void dia_addon_erol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EROL_PICKPOCKET(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 900;
	condition = dia_addon_erol_pickpocket_condition;
	information = dia_addon_erol_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_erol_pickpocket_condition()
{
	return c_beklauen(43,42);
};

func void dia_addon_erol_pickpocket_info()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_BACK,dia_addon_erol_pickpocket_back);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_PICKPOCKET,dia_addon_erol_pickpocket_doit);
};

func void dia_addon_erol_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_erol_pickpocket);
};

func void dia_addon_erol_pickpocket_back()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
};


instance DIA_ADDON_EROL_HALLO(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_hallo_condition;
	information = dia_addon_erol_hallo_info;
	description = "Co se dìje?";
};


func int dia_addon_erol_hallo_condition()
{
	return TRUE;
};

func void dia_addon_erol_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co se dìje?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(rozmrzele) Co se dìje? Podívej se na ten nepoøádek tam pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(rozmrzele) Za celý život jsem nevidìl nic podobného. Nìkdo by je z tama mìl vykouøit, to ti øeknu.
};


instance DIA_ADDON_EROL_WHAT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_what_condition;
	information = dia_addon_erol_what_info;
	description = "Co se stalo?";
};


func int dia_addon_erol_what_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_what_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Byl jsem na cestách se svými asistenty, když nìjací pøíšerní muži skoèili na mùj vozík a každého srazili dolù.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Díky bohu se umím trochu bránit, a tak mì nedostali.
	Log_CreateTopic(TOPIC_ADDON_EROL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_EROL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_EROL,"Obchodník Erol byl pøepaden bandity. Vzali mu veškeré jeho zboží. Bandité pod mostem nedaleko hospody U mrtvé harpyje stále mají jeho cenné kamenné desky. Erol by je chtìl získat zpìt");
	MIS_ADDON_EROL_BANDITSTUFF = LOG_RUNNING;
	Info_ClearChoices(dia_addon_erol_what);
	Info_AddChoice(dia_addon_erol_what,"To pod mostem je tvé?",dia_addon_erol_what_dein);
	Info_AddChoice(dia_addon_erol_what,"Co to bylo za muže?",dia_addon_erol_what_wer);
};

func void dia_addon_erol_what_back()
{
	Info_ClearChoices(dia_addon_erol_what);
};

func void dia_addon_erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//To pod mostem je tvé?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Kára, zboží, prostì vše.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Vzal jsem nìco ze tvého zboží ...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Nech si to. Nic z toho pro mì nemá žádnou cenu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z toho pro mì nemá žádnou cenu.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Jedinou pro mì nenahraditelnou vìcí jsou tøi kamenné desky. Samozøejmì, že mi je vzali.
	Info_AddChoice(dia_addon_erol_what,DIALOG_BACK,dia_addon_erol_what_back);
	Info_AddChoice(dia_addon_erol_what,"Kamenné desky?",dia_addon_erol_what_was);
};

func void dia_addon_erol_what_was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Mágové Vody ve mìstì je chtìjí ode mì koupit a já jsem jim je slíbil.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Musím je mít zpìt za každou cenu, nebo velice poškodí moji dobrou reputaci.
	Info_AddChoice(dia_addon_erol_what,"Kde jsi získal tyto kamenné desky?",dia_addon_erol_what_woher);
	Info_AddChoice(dia_addon_erol_what,"Co s nimi chtìjí Mágové vody dìlat?",dia_addon_erol_what_kdw);
};

func void dia_addon_erol_what_kdw()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Co s nimi chtìjí mágové Vody dìlat?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Chtìjí je studovat a povìøili mì, abych jim je pøinesl.
};

func void dia_addon_erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Odkud máš tyto kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Našel jsem je blízko starých budov vypadajících jako mausolea a ostatní v nìkterých jeskyních.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Do dnes jsem byl schopen dodat mnoho vìcí, o které mágové žádali.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Tady dole jsou celkem vzácné. Severovýchodnì od Khorinisu jsem jich ale našel spoustu.
	Info_AddChoice(dia_addon_erol_what,"Proè prostì nenajdeš další?",dia_addon_erol_what_neue);
};

func void dia_addon_erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Proè prostì nenajdeš další?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Vyvrtnul jsem si kotník v boji s bandity.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//Mùžu chodit, ale nechci cestovat tak daleko se špatnou nohou.
};

func void dia_addon_erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Co to bylo za muže?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Banditi. Kdo jiný? Skoèili na mì z mostu.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Každý, kdo chce pøejít most, je jimi okraden.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Vìdìl jsem, že jsou nahoøe, proto jsem šel pod ním.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale mùj vozík a mé zboží asi vzbudily pøíliš mnoho pokušení, zdá se.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ti bastardi skoèili z mostu - pøímo na mùj vozík.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Zkoušel jsem se za nimi v noci plížit ...
};


instance DIA_ADDON_EROL_FERNANDOSWEAPONS(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_fernandosweapons_condition;
	information = dia_addon_erol_fernandosweapons_info;
	description = "Potøebuji informace o zásilkách zbraní banditùm.";
};


func int dia_addon_erol_fernandosweapons_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_erol_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Potøebuji informace o zásilkách zbraní banditùm.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Zásilka zbraní? Jasnì, jedna tu je. Nìjaký hajzl z mìsta jim prodal mnoho zbraní. Taktak je mohli odnést.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Nìkteøí z nich jsou i ti, kteøí na mì zaútoèili u mostu.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Ostatní museli cestovat nìkam na pastvinu za Bengarovou farmou.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Možná chtìli dosáhnout prùsmyku.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
	Info_AddChoice(dia_addon_erol_fernandosweapons,DIALOG_BACK,dia_addon_erol_fernandosweapons_back);
	Info_AddChoice(dia_addon_erol_fernandosweapons,"Kde je ta pastvina?",dia_addon_erol_fernandosweapons_bengar);
};

func void dia_addon_erol_fernandosweapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Kde je ta pastvina?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//Pøibližnì uprostøed ostrova Khorinis leží Orlanova hospoda. Nazývá se "U mrtvé harpyje".
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Z tama vede cesta na jih. Tam nìkde je ta pastvina a poblíž také vchod do Hornického údolí.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};

func void dia_addon_erol_fernandosweapons_back()
{
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};


instance DIA_ADDON_EROL_STONEPLATES(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_stoneplates_condition;
	information = dia_addon_erol_stoneplates_info;
	permanent = TRUE;
	description = "O kamenných deskách ...";
};


func int dia_addon_erol_stoneplates_condition()
{
	if(MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int stoneplatescounter;
const int ADDON_EROLSSTONEPLATESOFFER = 10;

func void dia_addon_erol_stoneplates_info()
{
	var int stoneplatescount;
	var int xp_addon_bringstoneplates;
	var int stoneplatesgeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//O kamenných deskách ...
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1)
	{
		stoneplatescount = Npc_HasItems(other,itwr_stoneplatecommon_addon);
		if(stoneplatescount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//Mám jednu z nich.
			b_giveplayerxp(XP_ADDON_BRINGSTONEPLATE);
			b_giveinvitems(other,self,itwr_stoneplatecommon_addon,1);
			STONEPLATESCOUNTER = STONEPLATESCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//Mám nìkteré z nich.
			if((stoneplatescount + STONEPLATESCOUNTER) >= 3)
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,3 - STONEPLATESCOUNTER);
				xp_addon_bringstoneplates = (3 - STONEPLATESCOUNTER) * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = 3;
			}
			else
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,stoneplatescount);
				xp_addon_bringstoneplates = stoneplatescount * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = STONEPLATESCOUNTER + stoneplatescount;
			};
			b_giveplayerxp(xp_addon_bringstoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Velmi ti dìkuji.
		if(STONEPLATESCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Už pouze dvì chybí.
		}
		else if(STONEPLATESCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Už jen jedna chybí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To staèí, nyní mùžu dodržet svùj slib mágùm Vody ve mìstì a pak jít domù.
			MIS_ADDON_EROL_BANDITSTUFF = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Zaplatím ti za nì, samozøejmì.
		stoneplatesgeld = ADDON_EROLSSTONEPLATESOFFER * Npc_HasItems(self,itwr_stoneplatecommon_addon);
		CreateInvItems(self,itmi_gold,stoneplatesgeld);
		b_giveinvitems(self,other,itmi_gold,stoneplatesgeld);
		Npc_RemoveInvItems(self,itwr_stoneplatecommon_addon,Npc_HasItems(self,itwr_stoneplatecommon_addon));
		if(MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Jdu domù. Jestli chceš, tak se ke mnì mùžeš pøidat.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Možná ti budu schopen nìco prodat, když se dostanu domù.
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(c_schasmagicstoneplate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//A co tyhle?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Ne, tento druh kamenných desek je magicky nabitý.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Mágové Vody tyto bohužel nechtìjí koupit.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Kolik ti jich chybí?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Abych si zachránil svou reputaci ve mìstì u mágù Vody, potøebuji 3 kamenné desky.
	};
};


instance DIA_ADDON_EROL_BUERGER(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_buerger_condition;
	information = dia_addon_erol_buerger_info;
	description = "Jsi obèanem mìsta?";
};


func int dia_addon_erol_buerger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_buerger_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Jsi obèanem mìsta?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Už ne dlouho, mùj synu. Nemám rád tyto zkorumpované lidi z Horní ètvrti v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//Míval jsem velký vliv. Jen abys vìdìl. Ale to bylo pøed mnoha mìsíci.
};


instance DIA_ADDON_EROL_PRETEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_preteach_condition;
	information = dia_addon_erol_preteach_info;
	description = "Tys dokázal zahnat bandity?";
};


func int dia_addon_erol_preteach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what))
	{
		return TRUE;
	};
};

func void dia_addon_erol_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Tys dokázal zahnat bandity?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Ano. Jsem si jist, že jsou stále na mostì.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Mùžeš mi ukázat, jak udìøit tak tvrdì jako ty?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Jistìže mùžu.
	EROL_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_EROL_TEACH);
};


instance DIA_ADDON_EROL_PRETRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_pretrade_condition;
	information = dia_addon_erol_pretrade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_addon_erol_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_pretrade_info()
{
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Nemùžu ti nic prodat, všechno, co jsem mìl, leží pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Mùžu zaèít prodávat znova, až se vrátím domù.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale dokud nedostanu zpìt mé kamenné desky, nemùžu odsud odejít.
	};
};


instance DIA_ADDON_EROL_SLD(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_sld_condition;
	information = dia_addon_erol_sld_info;
	description = "To je TVÙJ dùm?";
};


func int dia_addon_erol_sld_condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int erol_isathome;

func void dia_addon_erol_sld_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(pøekvapenì) To je TVÙJ dùm?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Ano. Proè? Co je na tom špatného?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nemáš problémy se žoldáky?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Dokud jsem nevyrušoval je a jejich práci, nechávali mì napokoji.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//Kromì toho, jsou tam mí dobøí zákazníci a já jsem jim zaplatil, aby dohlídli na mùj majetek, zatímco jsem pryè.
	b_giveplayerxp(XP_AMBIENT);
	if(EROL_ISATHOME == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_trade_condition;
	information = dia_addon_erol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi, co nabízíš.";
};


func int dia_addon_erol_trade_condition()
{
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int dia_addon_erol_trade_onetime;

func void dia_addon_erol_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Nabídka není moc velká.
	if(EROL_ISATHOME == FALSE)
	{
		Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
		b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_EROLTRADE);
		Npc_ExchangeRoutine(self,"Home");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 99;
	condition = dia_addon_erol_teach_condition;
	information = dia_addon_erol_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak udeøit tvrdìji.";
};


func int dia_addon_erol_teach_condition()
{
	if(EROL_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_erol_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Ukaž mi jak udìøit tvrdìji.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Chci nìco vrátit.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachránit mou reputaci tím, že mi vrátíš kamenné desky.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//A já ti ukážu, jak lépe využít svou sílu v souboji.
	}
	else if(EROL_BONUS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dobøe, sleduj, znám jeden dobrý trik.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Když bouchneš, použij sílu celého tìla, ne pouze paže.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Otoè se bokem, natáhni rameno dopøedu a souèasnì vymršti svou paži.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(smìje se) Když to udìláš správnì, poznáš ten rozdíl!
		b_raiseattribute(other,ATR_STRENGTH,1);
		EROL_BONUS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Jestli chceš být ještì lepší, musíš na sobì ještì více pracovat ...
		Info_ClearChoices(dia_addon_erol_teach);
		Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
	};
};

func void dia_addon_erol_teach_back()
{
	Info_ClearChoices(dia_addon_erol_teach);
};

func void dia_addon_erol_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

func void dia_addon_erol_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

