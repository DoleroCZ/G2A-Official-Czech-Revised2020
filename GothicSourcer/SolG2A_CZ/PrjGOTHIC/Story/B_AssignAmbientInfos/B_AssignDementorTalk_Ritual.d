
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Pøišel jsi pøíliš pozdì.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Znièili jsme Innosovo oko, takže už nemùže nikdy znovu nabýt svou moc.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Teï ti ukážeme pošetilost tvých snah postavit se Pánu.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Ti hrozní chlapi mi pìknì hrají na nervy - znièili Innosovo oko a já teï netuším, jak je spravit.");
		b_logentry(TOPIC_TRAITORPEDRO,"Našel jsem Innosovo oko, ale po Pedrovi nebylo nikde ani vidu, ani slechu. Dal se do spolku s tìmi èernými mágy.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Teï pocítíš naši moc.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za Pána.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Nemùžeš se skrýt.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Zabijeme tì.
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

