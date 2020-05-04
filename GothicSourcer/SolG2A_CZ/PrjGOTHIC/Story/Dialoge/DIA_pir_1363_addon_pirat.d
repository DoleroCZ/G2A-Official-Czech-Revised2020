
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
	description = "Co se d�je?";
};


func int dia_addon_benchpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_hello_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Co se d�je?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg u� je kone�n� zp�tky. Byla to ot�zka �asu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Se�e� Francise, aby n�m donesl n�jak� d�evo na palis�du. On to m� na starosti.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Pro m� za m�, banditi te� m��ou klidn� p�ij�t. S Gregem na na�� stran� n�s nem��e nic porazit!
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, ��f t�bora, je idiot. Nicm�n�, nikdo ho nebere v�n�.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg v��� Francisovi, proto�e on je p��li� blb� na to, aby ho nap�lil! Ale d�t mu kv�li tomu velen� ...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Jestli se Greg brzo nevr�t� a j� se nedostanu zase do cviku, bude ze m� suchozemsk� krysa.
	};
};


instance DIA_ADDON_BENCHPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 11;
	condition = dia_addon_benchpirate_anheuern_condition;
	information = dia_addon_benchpirate_anheuern_info;
	permanent = FALSE;
	description = "M�l bys mi pomoct.";
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
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//M�l bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//Greg�v rozkaz?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Jo, p�esn� tak.
};


instance DIA_ADDON_BENCHPIRATE_COMEON(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 12;
	condition = dia_addon_benchpirate_comeon_condition;
	information = dia_addon_benchpirate_comeon_info;
	permanent = TRUE;
	description = "Ka�on �ek�...";
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
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Ka�on �ek�...
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//P�esn�! Ano, vr�t�m se TAM zp�tky ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//�, �, kapit�n!
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
	description = "U� t� v�c nepot�ebuji.";
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
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//U� t� v�c nepot�ebuji.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Jsem zp�t v t�bo�e, kapit�ne!
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
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Jsme p��li� daleko od t�bora.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Tohle se mi v�bec nel�b�.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Vr�t�m se do t�bora!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//J� a chlapci se vr�t�me do t�bora!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

