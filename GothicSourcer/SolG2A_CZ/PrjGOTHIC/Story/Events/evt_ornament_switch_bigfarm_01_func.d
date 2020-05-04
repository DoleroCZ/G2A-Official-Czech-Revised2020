
func void evt_ornament_switch_bigfarm_01_func()
{
	if(ORNAMENT_SWITCHED_BIGFARM == FALSE)
	{
		Wld_InsertNpc(stoneguardian_ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		Wld_InsertItem(itmi_ornamenteffekt_bigfarm_addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_BIGFARM_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",itmi_ornamenteffekt_bigfarm_addon,itmi_ornamenteffekt_bigfarm_addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",itmi_ornamenteffekt_bigfarm_addon,itmi_ornamenteffekt_bigfarm_addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Aktivoval jsem mechanismus v kamenném kruhu blízko Sekobovy farmy. Ozvala se hlasitá rána a objevil se kamenný strážce.");
		ORNAMENT_SWITCHED_BIGFARM = TRUE;
	};
};

func void evt_ornament_switch_farm_01_func()
{
	if(ORNAMENT_SWITCHED_FARM == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Aktivoval jsem mechanismus v kamenném kruhu u Lobartovy farmy. Nenásledovalo nic víc než malé zemìtøesení.");
		ORNAMENT_SWITCHED_FARM = TRUE;
	};
};

func void evt_ornament_switch_forest_01_func()
{
	if(ORNAMENT_SWITCHED_FOREST == FALSE)
	{
		Wld_InsertNpc(stoneguardian_ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		Wld_InsertItem(itmi_ornamenteffekt_forest_addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_FOREST_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",itmi_ornamenteffekt_forest_addon,itmi_ornamenteffekt_forest_addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",itmi_ornamenteffekt_forest_addon,itmi_ornamenteffekt_forest_addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Aktivoval jsem mechanismus v kamenném kruhu v severovýchodních lesích. Objevil se velký kamenný strážce. Byl dost naštvaný.");
		ORNAMENT_SWITCHED_FOREST = TRUE;
	};
};

