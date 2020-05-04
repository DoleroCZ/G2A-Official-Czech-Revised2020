
instance DIA_ADDON_BENCHPIRATE_EXIT(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 999;
	condition = dia_addon_benchpirate_exit_condition;
	information = dia_addon_benchpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_benchpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BENCHPIRATE_HELLO(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 1;
	condition = dia_addon_benchpirate_hello_condition;
	information = dia_addon_benchpirate_hello_info;
	permanent = TRUE;
	description = "Co se dìje?";
};


func int dia_addon_benchpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_hello_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Co se dìje?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg už je koneènì zpátky. Byla to otázka èasu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Sežeò Francise, aby nám donesl nìjaké døevo na palisádu. On to má na starosti.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Pro mì za mì, banditi teï mùžou klidnì pøijít. S Gregem na naší stranì nás nemùže nic porazit!
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, šéf tábora, je idiot. Nicménì, nikdo ho nebere vážnì.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg vìøí Francisovi, protože on je pøíliš blbý na to, aby ho napálil! Ale dát mu kvùli tomu velení ...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Jestli se Greg brzo nevrátí a já se nedostanu zase do cviku, bude ze mì suchozemská krysa.
	};
};


instance DIA_ADDON_BENCHPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 11;
	condition = dia_addon_benchpirate_anheuern_condition;
	information = dia_addon_benchpirate_anheuern_info;
	permanent = FALSE;
	description = "Mìl bys mi pomoct.";
};


func int dia_addon_benchpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//Mìl bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//Gregùv rozkaz?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Jo, pøesnì tak.
};


instance DIA_ADDON_BENCHPIRATE_COMEON(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 12;
	condition = dia_addon_benchpirate_comeon_condition;
	information = dia_addon_benchpirate_comeon_info;
	permanent = TRUE;
	description = "Kaòon èeká...";
};


func int dia_addon_benchpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_benchpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Kaòon èeká...
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//Pøesnì! Ano, vrátím se TAM zpátky ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Á, Á, kapitán!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BENCHPIRATE_GOHOME(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 13;
	condition = dia_addon_benchpirate_gohome_condition;
	information = dia_addon_benchpirate_gohome_info;
	permanent = TRUE;
	description = "Už tì víc nepotøebuji.";
};


func int dia_addon_benchpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//Už tì víc nepotøebuji.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Jsem zpìt v táboøe, kapitáne!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BENCHPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 14;
	condition = dia_addon_benchpirate_toofar_condition;
	information = dia_addon_benchpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_benchpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Jsme pøíliš daleko od tábora.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Tohle se mi vùbec nelíbí.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Vrátím se do tábora!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//Já a chlapci se vrátíme do tábora!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

