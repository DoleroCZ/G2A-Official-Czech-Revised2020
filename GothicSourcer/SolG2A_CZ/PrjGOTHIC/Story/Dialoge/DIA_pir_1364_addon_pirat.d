
instance DIA_ADDON_ROASTPIRATE_EXIT(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 999;
	condition = dia_addon_roastpirate_exit_condition;
	information = dia_addon_roastpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_roastpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


var int pir_1364_grog;

instance DIA_ADDON_ROASTPIRATE_GIMMEGROG(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 1;
	condition = dia_addon_roastpirate_gimmegrog_condition;
	information = dia_addon_roastpirate_gimmegrog_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_gimmegrog_condition()
{
	if((Npc_IsInState(self,zs_talk) == TRUE) && (Npc_WasInState(self,zs_roast_scavenger) == TRUE) && (PIR_1364_GROG == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gimmegrog_info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//O, od toho ohnÏ jde horko. M·m ûÌzeÚ.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Hej ty, d·ö mi grog?
	Log_CreateTopic(TOPIC_ADDON_ROASTGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ROASTGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Pir·t u t·borovÈho ohnÏ nutnÏ pot¯ebujÌ grog.");
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Ne, nic nem·m.",dia_addon_roastpirate_gimmegrog_donthaveany);
	if(Npc_HasItems(other,itfo_addon_grog) >= 1)
	{
		Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Tady, dej si hlta.",dia_addon_roastpirate_gimmegrog_hereisgrog);
	};
};

func void dia_addon_roastpirate_gimmegrog_donthaveany()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Ne, nic nem·m.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Sakra, j· snad ûÌznÌ um¯u.
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	AI_StopProcessInfos(self);
};

func void dia_addon_roastpirate_gimmegrog_hereisgrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Tady, dej si hlta.
	b_giveinvitems(other,self,itfo_addon_grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//DÌk.
	b_useitem(self,itfo_addon_grog);
	PIR_1364_GROG = TRUE;
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Zd· se, ûe grog ho zachr·nil od smrti ûÌznÌ.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_ROASTPIRATE_SEICHTESWASSER(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 2;
	condition = dia_addon_roastpirate_seichteswasser_condition;
	information = dia_addon_roastpirate_seichteswasser_info;
	description = "Co dÏl·ö?";
};


func int dia_addon_roastpirate_seichteswasser_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_seichteswasser_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Co dÏl·ö?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//MusÌm nasytit hladovÈ muûstvo.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//To je , proË tu sedÌm ve dne v noci, star˝ vlku.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//NamÌsto toho bych byl mnohem radÏji na mÏlËinÏ u pl·ûe a hledal vyplavenÈ zboûÌ.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Minul˝ t˝den velk· obchodnÌ loÔ najela na kor·lov˝ ˙tes.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//A n·klad je nynÌ vyplavov·n na b¯eh.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Douf·m, ûe odsud jednou vypadnu.
};


instance DIA_ADDON_ROASTPIRATE_FRANCIS(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 3;
	condition = dia_addon_roastpirate_francis_condition;
	information = dia_addon_roastpirate_francis_info;
	permanent = FALSE;
	description = "Co mi m˘ûeö ¯Ìci o Francisovi?";
};


func int dia_addon_roastpirate_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_roastpirate_francis_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mi m˘ûeö ¯Ìci o Francisovi?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Jedn· s n·mi jako by byl n·ö kapit·n, kter˝ ale okamûitÏ zastavÌ, kdyû bude Greg zp·tky.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Pak by se plazil zpÏt pod jeho sk·lu jako rak.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Kdyû se mÏ pt·ö, myslÌm, ûe s n·mi vöemi chce vybÏhnout. Vsadil bych se, ûe pracuje jen pro svou vlastnÌ kapsu.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Tohle ze mÏ nedostaneö. A dokud to nebude podloûenÈ, nechal bych si to pro sebe, b˝t tebou.
};


instance DIA_ADDON_ROASTPIRATE_PERM(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 99;
	condition = dia_addon_roastpirate_perm_condition;
	information = dia_addon_roastpirate_perm_info;
	permanent = TRUE;
	description = "A jinak?";
};


func int dia_addon_roastpirate_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_roastpirate_seichteswasser))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_perm_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//A jinak?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Poslal bych Francise na GregovÏ mÌstÏ do moË·lu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//NynÌ kdyû je Greg zpÏt, pochybuji, ûe na n·s banditi za˙toËÌ.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Greg˘v n·vrat bude urËitÏ znamenat vÌc pr·ce, ale aspoÚ dostaneme dost penÏz.
		};
	}
	else if((randy == 0) && !Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis je velk˝ tluËhuba. Vöe se zde rozpad· od doby, kdy se stal v˘dcem t·bora.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Jen aù banditÈ za˙toËÌ. Budou nemile p¯ekvapeni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Douf·m, ûe se Greg vr·tÌ. ChtÏl bych b˝t zpÏt na otev¯enÈm mo¯i.
	};
};


instance DIA_ADDON_ROASTPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 11;
	condition = dia_addon_roastpirate_anheuern_condition;
	information = dia_addon_roastpirate_anheuern_info;
	permanent = FALSE;
	description = "MÏl bys mi pomoct.";
};


func int dia_addon_roastpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//MÏl bys mi pomoct.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//P¯Ìkaz od Grega.
	b_say(self,other,"$ABS_GOOD");
};


instance DIA_ADDON_ROASTPIRATE_COMEON(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 12;
	condition = dia_addon_roastpirate_comeon_condition;
	information = dia_addon_roastpirate_comeon_info;
	permanent = TRUE;
	description = "PojÔ.";
};


func int dia_addon_roastpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_roastpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//PojÔ.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ROASTPIRATE_GOHOME(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 13;
	condition = dia_addon_roastpirate_gohome_condition;
	information = dia_addon_roastpirate_gohome_info;
	permanent = TRUE;
	description = "Uû tÏ vÌc nepot¯ebuji.";
};


func int dia_addon_roastpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//Uû tÏ vÌc nepot¯ebuji.
	b_say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ROASTPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 14;
	condition = dia_addon_roastpirate_toofar_condition;
	information = dia_addon_roastpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

