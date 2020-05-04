
func void evt_teleportstation_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUSED_TELEPORTER = TRUE;
	if(CURRENTLEVEL == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_TAVERNE");
			if(SCUSED_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSNW,"Teleporta�n� k�men v jeskyni v�chodn� od m�sta vede k 'Mrtv� harpyji'.");
			};
			SCUSED_NW_TELEPORTSTATION_CITY = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_TAVERNE") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_MAYA");
			if(SCUSED_NW_TELEPORTSTATION_TAVERNE == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSNW,"Teleporta�n� k�men u 'Mrtv� harpyje' vede k port�lu v s�ni stavitel�.");
			};
			SCUSED_NW_TELEPORTSTATION_TAVERNE = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_MAYA") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_CITY");
			if(SCUSED_NW_TELEPORTSTATION_MAYA == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSNW,"Teleporta�n� k�men v s�ni stavitel� vede do jeskyn� v�chodn� do m�sta.");
			};
			SCUSED_NW_TELEPORTSTATION_MAYA = TRUE;
		}
		else
		{
			AI_Teleport(hero,"MARKT");
		};
		if((SCUSED_NW_TELEPORTSTATION_MAYA == TRUE) && (SCUSED_NW_TELEPORTSTATION_TAVERNE == TRUE) && (SCUSED_NW_TELEPORTSTATION_CITY == TRUE) && (SCUSED_ALLNWTELEPORSTSTONES == FALSE))
		{
			SCUSED_ALLNWTELEPORSTSTONES = TRUE;
			b_giveplayerxp(XP_ADDON_ALLNWTELEPORSTSTONES);
		};
	}
	else if(CURRENTLEVEL == ADDONWORLD_ZEN)
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_NORTH_WP"))
		{
			AI_Teleport(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_PORTALTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSADW,"Aktivoval jsem teleporta�n� k�men bl�zko port�lu, co vede k Khorinisu.");
				b_giveplayerxp(XP_AMBIENT);
			};
			SCUSED_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_EAST_WP"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_ADANOSTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSADW,"Dok�zal jsem aktivovat teleporta�n� k�men v t�bo�e bandit�.");
				b_giveplayerxp(XP_AMBIENT);
			};
			SCUSED_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHEAST_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_SOUTHEAST == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSADW,"Aktivoval jsem teleporta�n� k�men jihov�chodn� od t�bora bandit� v ba�in�ch.");
				b_giveplayerxp(XP_AMBIENT);
			};
			SCUSED_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHWEST_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_SOUTHWEST == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSADW,"Na�el jsem teleporta�n� k�men jihoz�padn� odtud. ");
				b_giveplayerxp(XP_AMBIENT);
			};
			SCUSED_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_WEST_WP"))
		{
			AI_Teleport(hero,"ADW_PIRATES_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_PIRATES == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_TELEPORTSADW,"Aktivoval jsem teleporta�n� k�men v ka�onu.");
				b_giveplayerxp(XP_AMBIENT);
			};
			if((MIS_KROKOJAGD == LOG_SUCCESS) && (SCUSED_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE))
			{
				Wld_InsertNpc(gobbo_black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(gobbo_black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(giant_desertrat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(giant_desertrat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc(blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				SCUSED_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};
			SCUSED_ADW_TELEPORTSTATION_PIRATES = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUSED_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
			};
			SCUSED_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
		}
		else
		{
			AI_Teleport(hero,"ADW_ENTRANCE");
		};
	};
};


var int triggeredteleporteradw;
var int adw_portaltempel_focus_func_onetime;

func void adw_portaltempel_focus_func()
{
	Npc_RemoveInvItems(hero,itmi_focus,1);
	TRIGGEREDTELEPORTERADW = TRIGGEREDTELEPORTERADW + 1;
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	if(TRIGGEREDTELEPORTERADW >= 5)
	{
		SC_ADW_ACTIVATEDALLTELEPORTSTONES = TRUE;
	};
	if((adw_portaltempel_focus_func_onetime == FALSE) && (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000))
	{
		if((Npc_IsDead(stoneguardian_nailedportaladw1) == FALSE) && (stoneguardian_nailedportaladw1.aivar[AIV_ENEMYOVERRIDE] == TRUE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		b_awake_stoneguardian(stoneguardian_nailedportaladw1);
		adw_portaltempel_focus_func_onetime = TRUE;
	};
};

