
var int b_ravensescapeintotempelavi_onetime;

func void b_ravensescapeintotempelavi()
{
	if(b_ravensescapeintotempelavi_onetime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RAVENISINTEMPEL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RAVENKDW,"Proniknul jsem do Ravenova sídla. Spatøil jsem ho, jak právì vchází do velké brány. Nebyl jsem schopen ho následovat. Tuším, že brána vede do Adanosova chrámu. Musím to oznámit Saturasovi.");
		b_ravensescapeintotempelavi_onetime = TRUE;
	};
};

