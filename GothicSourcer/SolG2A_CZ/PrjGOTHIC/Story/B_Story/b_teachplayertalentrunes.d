
func int b_teachplayertalentrunes(var C_NPC slf,var C_NPC oth,var int spell)
{
	var int kosten;
	var C_NPC scrolltrader;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
	b_logentry(TOPIC_TALENTRUNES,"K vytvoøení runy potøebuji svitek s daným kouzlem a potøebné ingredience. S jejich pomocí pak mohu podle runové tabulky na èistém runovém kameni zvolenou runu vytvoøit.");
	if(Npc_IsDead(gorax) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(gorax);
	}
	else if(Npc_IsDead(isgaroth) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(isgaroth);
	}
	else if(Npc_IsDead(engor) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(engor);
	}
	else if(Npc_IsDead(orlan) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(orlan);
	}
	else if(Npc_IsDead(cronos_adw) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(cronos_adw);
	};
	if(spell == SPL_PALLIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
	};
	if(spell == SPL_PALLIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
	};
	if(spell == SPL_PALHOLYBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
	};
	if(spell == SPL_PALMEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
	};
	if(spell == SPL_PALREPELEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
	};
	if(spell == SPL_PALFULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] = TRUE;
	};
	if(spell == SPL_PALDESTROYEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] = TRUE;
	};
	if(spell == SPL_PALTELEPORTSECRET)
	{
		PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
	};
	if(spell == SPL_TELEPORTSEAPORT)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTSEAPORT] = TRUE;
	};
	if(spell == SPL_TELEPORTMONASTERY)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTMONASTERY] = TRUE;
	};
	if(spell == SPL_TELEPORTFARM)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTFARM] = TRUE;
	};
	if(spell == SPL_TELEPORTXARDAS)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTXARDAS] = TRUE;
	};
	if(spell == SPL_TELEPORTPASSNW)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTPASSNW] = TRUE;
	};
	if(spell == SPL_TELEPORTPASSOW)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTPASSOW] = TRUE;
	};
	if(spell == SPL_TELEPORTOC)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTOC] = TRUE;
	};
	if(spell == SPL_LIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHT] = TRUE;
		CreateInvItems(scrolltrader,itsc_light,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy SVÌTLO: 1 zlatá mince.");
	};
	if(spell == SPL_FIREBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_FIREBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_firebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy OHNIVÝ ŠÍP: 1 síra.");
	};
	if(spell == SPL_ICEBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_ICEBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_icebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LEDOVÝ ŠÍP: 1 ledový køemen.");
	};
	if(spell == SPL_LIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightheal,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LÉÈBA LEHKÝCH ZRANÌNÍ: 1 léèivá rostlina.");
	};
	if(spell == SPL_SUMMONGOBLINSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgobskel,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VYVOLÁNÍ GOBLINÍHO KOSTLIVCE: 1 kost z goblina.");
	};
	if(spell == SPL_INSTANTFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_instantfireball,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy OHNIVÁ KOULE: 1 pryskyøice.");
	};
	if(spell == SPL_ZAP)
	{
		PLAYER_TALENT_RUNES[SPL_ZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_zap,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy MALÝ BLESK: 1 kamenný krystal.");
	};
	if(spell == SPL_SUMMONWOLF)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumwolf,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VYVOLÁNÍ VLKA: 1 vlèí kùže.");
	};
	if(spell == SPL_WINDFIST)
	{
		PLAYER_TALENT_RUNES[SPL_WINDFIST] = TRUE;
		CreateInvItems(scrolltrader,itsc_windfist,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VÌTRNÁ PÌST: 1 uhlík.");
	};
	if(spell == SPL_SLEEP)
	{
		PLAYER_TALENT_RUNES[SPL_SLEEP] = TRUE;
		CreateInvItems(scrolltrader,itsc_sleep,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy SPÁNEK: 1 stéblo trávy. Lze použít i alchymistické náèiní.");
	};
	if(spell == SPL_MEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_mediumheal,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LÉÈBA STØEDNÌ TÌŽKÝCH ZRANÌNÍ: 1 léèivá bylina.");
	};
	if(spell == SPL_LIGHTNINGFLASH)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightningflash,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy BLESK: 1 kamenný krystal a 1 ledový køemen.");
	};
	if(spell == SPL_CHARGEFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_chargefireball,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VELKÁ OHNIVÁ KOULE: 1 síra a 1 pryskyøice.");
	};
	if(spell == SPL_SUMMONSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumskel,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VYVOLÁNÍ KOSTLIVCE: 1 kost z kostlivce.");
	};
	if(spell == SPL_FEAR)
	{
		PLAYER_TALENT_RUNES[SPL_FEAR] = TRUE;
		CreateInvItems(scrolltrader,itsc_fear,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy STRACH: 1 èerná perla.");
	};
	if(spell == SPL_ICECUBE)
	{
		PLAYER_TALENT_RUNES[SPL_ICECUBE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icecube,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LEDOVÝ BLOK: 1 ledový køemen a 1 akvamarín.");
	};
	if(spell == SPL_CHARGEZAP)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_thunderball,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy KULOVÝ BLESK: 1 síra a 1 kamenný krystal.");
	};
	if(spell == SPL_SUMMONGOLEM)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgol,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VYVOLÁNÍ KAMENNÉHO GOLEMA: 1 srdce kamenného golema.");
	};
	if(spell == SPL_DESTROYUNDEAD)
	{
		PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] = TRUE;
		CreateInvItems(scrolltrader,itsc_harmundead,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy NIÈENÍ NEMRTVÝCH: 1 svìcená voda.");
	};
	if(spell == SPL_PYROKINESIS)
	{
		PLAYER_TALENT_RUNES[SPL_PYROKINESIS] = TRUE;
		CreateInvItems(scrolltrader,itsc_pyrokinesis,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VELKÁ OHNIVÁ BOUØE: 1 síra a 1 jazyk ohnivého ještìra.");
	};
	if(spell == SPL_FIRESTORM)
	{
		PLAYER_TALENT_RUNES[SPL_FIRESTORM] = TRUE;
		CreateInvItems(scrolltrader,itsc_firestorm,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy MALÁ OHNIVÁ BOUØE: 1 síra a 1 pryskyøice.");
	};
	if(spell == SPL_ICEWAVE)
	{
		PLAYER_TALENT_RUNES[SPL_ICEWAVE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icewave,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LEDOVÁ VLNA: 1 ledový køemen a 1 akvamarín.");
	};
	if(spell == SPL_SUMMONDEMON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumdemon,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VYVOLÁNÍ DÉMONA: 1 srdce démona.");
	};
	if(spell == SPL_FULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_FULLHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_fullheal,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy LÉÈBA TÌŽKÝCH ZRANÌNÍ: 1 léèivý koøen.");
	};
	if(spell == SPL_FIRERAIN)
	{
		PLAYER_TALENT_RUNES[SPL_FIRERAIN] = TRUE;
		CreateInvItems(scrolltrader,itsc_firerain,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy OHNIVÝ DÉŠ: 1 pryskyøice a 1 jazyk ohnivého ještìra.");
	};
	if(spell == SPL_BREATHOFDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_breathofdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy DECH SMRTI: 1 uhlík a 1 èerná perla.");
	};
	if(spell == SPL_MASSDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_MASSDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_massdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy VLNA SMRTI: 1 kost z kostlivce a 1 èerná perla.");
	};
	if(spell == SPL_ARMYOFDARKNESS)
	{
		PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] = TRUE;
		CreateInvItems(scrolltrader,itsc_armyofdarkness,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy ARMÁDA TEMNOT: 1 kost z kostlivce, 1 èerná perla, 1 srdce kamenného golema a 1 srdce démona.");
	};
	if(spell == SPL_SHRINK)
	{
		PLAYER_TALENT_RUNES[SPL_SHRINK] = TRUE;
		CreateInvItems(scrolltrader,itsc_shrink,1);
		b_logentry(TOPIC_TALENTRUNES,"Pøísady pro vytvoøení runy ZMENŠENÍ NESTVÙRY: 1 kost z goblina a 1 trolí tesák.");
	};
	if(spell == SPL_WHIRLWIND)
	{
		PLAYER_TALENT_RUNES[SPL_WHIRLWIND] = TRUE;
		CreateInvItems(scrolltrader,itsc_whirlwind,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_WHIRLWIND);
	};
	if(spell == SPL_WATERFIST)
	{
		PLAYER_TALENT_RUNES[SPL_WATERFIST] = TRUE;
		CreateInvItems(scrolltrader,itsc_waterfist,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_WATERFIST);
	};
	if(spell == SPL_ICELANCE)
	{
		PLAYER_TALENT_RUNES[SPL_ICELANCE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icelance,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_ICELANCE);
	};
	if(spell == SPL_GEYSER)
	{
		PLAYER_TALENT_RUNES[SPL_GEYSER] = TRUE;
		CreateInvItems(scrolltrader,itsc_geyser,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_GEYSER);
	};
	if(spell == SPL_THUNDERSTORM)
	{
		PLAYER_TALENT_RUNES[SPL_THUNDERSTORM] = TRUE;
		CreateInvItems(scrolltrader,itsc_thunderstorm,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_THUNDERSTORM);
	};
	PrintScreen(PRINT_LEARNRUNES,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

