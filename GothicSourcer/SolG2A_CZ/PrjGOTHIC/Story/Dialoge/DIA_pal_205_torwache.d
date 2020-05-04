
instance DIA_PAL_205_TORWACHE_EXIT(C_INFO)
{
	npc = pal_205_torwache;
	nr = 999;
	condition = dia_pal_205_torwache_exit_condition;
	information = dia_pal_205_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_205_torwache_exit_condition()
{
	return TRUE;
};

func void dia_pal_205_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_CHECKPOINT = "NW_CITY_CITYHALL_IN";

var int pal_205_schonmalreingelassen;

instance DIA_PAL_205_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 1;
	condition = dia_pal_205_torwache_firstwarn_condition;
	information = dia_pal_205_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,PAL_205_CHECKPOINT) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (PAL_205_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//STÁT!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Porušil bych svou svatou povinnost, kdybych nechal vejít vraha.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jsi obvinìn z krádeže. Dokud naøèení trvá, nemùžeš vstoupit!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Jsi známý jako rváè. Nepustím tì dovnitø.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Bìž za lordem Andrem a urovnej celou tu záležitost!
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Na radnici mohou vejít jen ti, kdo jsou v královských službách.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance DIA_PAL_205_TORWACHE_SECONDWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_secondwarn_condition;
	information = dia_pal_205_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Ještì jeden krok a pøísahám k Innosovi, že to bude krok poslední!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_ATTACK(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_attack_condition;
	information = dia_pal_205_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_PAL_205_TORWACHE_HAGEN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_hagen_condition;
	information = dia_pal_205_torwache_hagen_info;
	permanent = TRUE;
	description = "Musím mluvit s lordem Hagenem!";
};


func int dia_pal_205_torwache_hagen_condition()
{
	if(PAL_205_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_hagen_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Musím mluvit s lordem Hagenem!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Víš, kolikrát jsem to už slyšel? Dovnitø nemùžeš. Když to ale pøece jenom zkusíš, budu tì muset zabít.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMIL(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmil_condition;
	information = dia_pal_205_torwache_passasmil_info;
	permanent = TRUE;
	description = "Jsem èlenem domobrany.";
};


func int dia_pal_205_torwache_passasmil_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Jsem èlenem domobrany.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//Dobrá, mùžeš dovnitø.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmage_condition;
	information = dia_pal_205_torwache_passasmage_info;
	permanent = TRUE;
	description = "Jsem mág ohnì.";
};


func int dia_pal_205_torwache_passasmage_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Jsem mág ohnì.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Ano, samozøejmì. Odpus, vyvolený, konám jen svou povinnost.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASSLD(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passassld_condition;
	information = dia_pal_205_torwache_passassld_info;
	permanent = TRUE;
	description = "Pus mì dovnitø, pøináším vzkaz od žoldnéøù.";
};


func int dia_pal_205_torwache_passassld_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_SLD) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Pus mì dovnitø, pøináším vzkaz od žoldnéøù.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Dobrá, ale varuju tì. Jestli zkusíš dìlat nìjaké problémy, nebudeš mít ani èas toho litovat.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PERM(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_perm_condition;
	information = dia_pal_205_torwache_perm_info;
	permanent = TRUE;
	description = "Jak jde služba?";
};


func int dia_pal_205_torwache_perm_condition()
{
	if((PAL_205_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_perm_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Jak jde služba?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Máme všechno pod kontrolou.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Má služba mì plnì uspokojuje, Vyvolený.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Mazej dovnitø a sklapni.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Co chceš?
	};
	AI_StopProcessInfos(self);
};

