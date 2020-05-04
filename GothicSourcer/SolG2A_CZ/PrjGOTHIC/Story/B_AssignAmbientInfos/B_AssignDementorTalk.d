
instance DIA_AMBIENTDEMENTOR_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ambientdementor_exit_condition;
	information = dia_ambientdementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ambientdementor_exit_condition()
{
	return TRUE;
};

func void dia_ambientdementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	b_scisobsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	}
	else
	{
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	};
};


instance DIA_AMBIENTDEMENTOR(C_INFO)
{
	nr = 1;
	condition = dia_ambientdementor_condition;
	information = dia_ambientdementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ambientdementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_ambientdementor_info()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random(4);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//Pøišel jsi nás rušit v obøadu? Jeho duše náleží nám. Teï už ho nezachráníš, mágu.
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dragonisle_keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//(smìje se) Pøišel jsi, abys pošpinil mé jméno i mou práci? Udìlal jsi osudovou chybu.
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//Nikomu se ještì nepodaøilo projít mou kryptou. Mìl by ses vrátit, protože do posvátných Irdorathských síní se nikdy nedostaneš.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//Už ji zašel moc daleko, mrzký èerve. Nikdy se do naší tajné svatynì nedostaneš.
			};
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//Zùstaò stát, kde jsi. Už ani krok!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//Dostal ses daleko, ale pøes mì nepøejdeš.
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//Pøišel jsi zmìøit síly s Pánem, ale nejdøíve se musíš dostat pøes mì.
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//Ubohej rádobykouzelníèku, tvá síla se nikdy nebude moci mìøit s Pánovou mocí.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//Vybral sis cestu magie, abys nás mohl porazit. Chytrý tah. Ale ve tvém podání je stejnì k nièemu.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//Nemùžeš nás zastavit ani jako mág.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//Mùj Pán tì znièí. Tvá ubohá komediantská kouzla tì nemùžou zachránit.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//Zachraò se, dokud mùžeš. Dál už není úniku.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//Teï pocítíš Pánovu moc. Nemùžeš jí uniknout.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//Pán si žádá tvou hlavu. Teï už tì nic nezachrání.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//Chytil ses nám do pasti a teï nastal èas, abychom tì odstranili z tohoto svìta.
		};
	};
};

func void b_assigndementortalk(var C_NPC slf)
{
	if((slf.guild == GIL_DMT) && (slf.npctype == NPCTYPE_AMBIENT))
	{
		dia_ambientdementor_exit.npc = Hlp_GetInstanceID(slf);
		dia_ambientdementor.npc = Hlp_GetInstanceID(slf);
	};
};

