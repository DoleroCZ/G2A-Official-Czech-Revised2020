
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//P�i�el jsi p��li� pozd�.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Zni�ili jsme Innosovo oko, tak�e u� nem��e nikdy znovu nab�t svou moc.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Te� ti uk�eme po�etilost tv�ch snah postavit se P�nu.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Ti hrozn� chlapi mi p�kn� hraj� na nervy - zni�ili Innosovo oko a j� te� netu��m, jak je spravit.");
		b_logentry(TOPIC_TRAITORPEDRO,"Na�el jsem Innosovo oko, ale po Pedrovi nebylo nikde ani vidu, ani slechu. Dal se do spolku s t�mi �ern�mi m�gy.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Te� poc�t� na�i moc.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za P�na.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Nem��e� se skr�t.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Zabijeme t�.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void b_assigndementortalk_ritual_exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

