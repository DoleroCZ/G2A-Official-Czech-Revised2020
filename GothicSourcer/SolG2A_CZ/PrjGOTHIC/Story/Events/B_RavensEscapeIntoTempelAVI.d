
var int b_ravensescapeintotempelavi_onetime;

func void b_ravensescapeintotempelavi()
{
	if(b_ravensescapeintotempelavi_onetime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RAVENISINTEMPEL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RAVENKDW,"Proniknul jsem do Ravenova s�dla. Spat�il jsem ho, jak pr�v� vch�z� do velk� br�ny. Nebyl jsem schopen ho n�sledovat. Tu��m, �e br�na vede do Adanosova chr�mu. Mus�m to ozn�mit Saturasovi.");
		b_ravensescapeintotempelavi_onetime = TRUE;
	};
};

