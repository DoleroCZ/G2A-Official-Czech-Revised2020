
var int evt_archoldead_func_onetime;

func void evt_archoldead_func()
{
	if(Npc_IsDead(skeleton_lord_archol))
	{
		skeleton_archol1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol5.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol6.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(evt_archoldead_func_onetime == FALSE)
	{
		b_logentry(TOPIC_HALLENVONIRDORATH,"Našel jsem tu nìco, co snad kdysi bývalo chrámem a obývala to spousta nemrtvých. Všechno mi živì pøipomíná zatracený skøetí chrám a Spáèe. Tentokrát ale neselžu - teï už ne!");
		evt_archoldead_func_onetime = TRUE;
	};
};

