
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
		b_logentry(TOPIC_HALLENVONIRDORATH,"Na�el jsem tu n�co, co snad kdysi b�valo chr�mem a ob�vala to spousta nemrtv�ch. V�echno mi �iv� p�ipom�n� zatracen� sk�et� chr�m a Sp��e. Tentokr�t ale nesel�u - te� u� ne!");
		evt_archoldead_func_onetime = TRUE;
	};
};

