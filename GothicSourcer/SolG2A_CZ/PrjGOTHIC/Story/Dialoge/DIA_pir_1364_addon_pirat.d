
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
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//O, od toho ohn� jde horko. M�m ��ze�.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Hej ty, d� mi grog?
	Log_CreateTopic(TOPIC_ADDON_ROASTGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ROASTGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Pir�t u t�borov�ho ohn� nutn� pot�ebuj� grog.");
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Ne, nic nem�m.",dia_addon_roastpirate_gimmegrog_donthaveany);
	if(Npc_HasItems(other,itfo_addon_grog) >= 1)
	{
		Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Tady, dej si hlta.",dia_addon_roastpirate_gimmegrog_hereisgrog);
	};
};

func void dia_addon_roastpirate_gimmegrog_donthaveany()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Ne, nic nem�m.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Sakra, j� snad ��zn� um�u.
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	AI_StopProcessInfos(self);
};

func void dia_addon_roastpirate_gimmegrog_hereisgrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Tady, dej si hlta.
	b_giveinvitems(other,self,itfo_addon_grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//D�k.
	b_useitem(self,itfo_addon_grog);
	PIR_1364_GROG = TRUE;
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Zd� se, �e grog ho zachr�nil od smrti ��zn�.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_ROASTPIRATE_SEICHTESWASSER(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 2;
	condition = dia_addon_roastpirate_seichteswasser_condition;
	information = dia_addon_roastpirate_seichteswasser_info;
	description = "Co d�l�?";
};


func int dia_addon_roastpirate_seichteswasser_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_seichteswasser_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Co d�l�?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//Mus�m nasytit hladov� mu�stvo.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//To je , pro� tu sed�m ve dne v noci, star� vlku.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//Nam�sto toho bych byl mnohem rad�ji na m�l�in� u pl�e a hledal vyplaven� zbo��.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Minul� t�den velk� obchodn� lo� najela na kor�lov� �tes.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//A n�klad je nyn� vyplavov�n na b�eh.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Douf�m, �e odsud jednou vypadnu.
};


instance DIA_ADDON_ROASTPIRATE_FRANCIS(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 3;
	condition = dia_addon_roastpirate_francis_condition;
	information = dia_addon_roastpirate_francis_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ci o Francisovi?";
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
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mi m��e� ��ci o Francisovi?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Jedn� s n�mi jako by byl n� kapit�n, kter� ale okam�it� zastav�, kdy� bude Greg zp�tky.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Pak by se plazil zp�t pod jeho sk�lu jako rak.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Kdy� se m� pt�, mysl�m, �e s n�mi v�emi chce vyb�hnout. Vsadil bych se, �e pracuje jen pro svou vlastn� kapsu.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Tohle ze m� nedostane�. A dokud to nebude podlo�en�, nechal bych si to pro sebe, b�t tebou.
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
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Poslal bych Francise na Gregov� m�st� do mo��lu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Nyn� kdy� je Greg zp�t, pochybuji, �e na n�s banditi za�to��.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Greg�v n�vrat bude ur�it� znamenat v�c pr�ce, ale aspo� dostaneme dost pen�z.
		};
	}
	else if((randy == 0) && !Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis je velk� tlu�huba. V�e se zde rozpad� od doby, kdy se stal v�dcem t�bora.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Jen a� bandit� za�to��. Budou nemile p�ekvapeni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Douf�m, �e se Greg vr�t�. Cht�l bych b�t zp�t na otev�en�m mo�i.
	};
};


instance DIA_ADDON_ROASTPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 11;
	condition = dia_addon_roastpirate_anheuern_condition;
	information = dia_addon_roastpirate_anheuern_info;
	permanent = FALSE;
	description = "M�l bys mi pomoct.";
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
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//M�l bys mi pomoct.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//P��kaz od Grega.
	b_say(self,other,"$ABS_GOOD");
};


instance DIA_ADDON_ROASTPIRATE_COMEON(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 12;
	condition = dia_addon_roastpirate_comeon_condition;
	information = dia_addon_roastpirate_comeon_info;
	permanent = TRUE;
	description = "Poj�.";
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
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//Poj�.
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
	description = "U� t� v�c nepot�ebuji.";
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
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//U� t� v�c nepot�ebuji.
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

