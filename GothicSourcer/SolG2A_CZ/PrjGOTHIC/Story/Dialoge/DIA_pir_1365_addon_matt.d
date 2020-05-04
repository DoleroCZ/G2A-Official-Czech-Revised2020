
instance DIA_ADDON_MATT_EXIT(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 999;
	condition = dia_addon_matt_exit_condition;
	information = dia_addon_matt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_matt_exit_condition()
{
	return TRUE;
};

func void dia_addon_matt_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_PICKPOCKET(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 900;
	condition = dia_addon_matt_pickpocket_condition;
	information = dia_addon_matt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_matt_pickpocket_condition()
{
	return c_beklauen(55,91);
};

func void dia_addon_matt_pickpocket_info()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_BACK,dia_addon_matt_pickpocket_back);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_PICKPOCKET,dia_addon_matt_pickpocket_doit);
};

func void dia_addon_matt_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_matt_pickpocket);
};

func void dia_addon_matt_pickpocket_back()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
};


instance DIA_ADDON_MATT_HELLO(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 1;
	condition = dia_addon_matt_hello_condition;
	information = dia_addon_matt_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//�, nov��ek? Dobr�. M��e se hodit ka�dej novej dobrej chlap, ce se k n�m p�id�.
};


instance DIA_ADDON_MATT_PERM(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 2;
	condition = dia_addon_matt_perm_condition;
	information = dia_addon_matt_perm_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_addon_matt_perm_condition()
{
	return TRUE;
};

func void dia_addon_matt_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//Jak to jde?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//L��IV� LEKTVAR! Co tak l��iv� lektvar, nerozum�?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//V�e v po��dku - (cynicky) kapit�ne!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Neotravuj m�! Nem�me ��dn� dal�� lod�.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//Po�k�m, abych uvid�l, co Greg ud�l� d�le.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Nyn� je v�e v t�bo�e v po��dku. M��u si nyn� na chv�li odpo�inout.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//A kdybych byl na tv�m m�st�, doporu�il bych ti to sam�.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Od t� doby, co zde jsou banditi, v�e, co je n�m drah�, se m��e rychle zm�nit.
	};
};


instance DIA_ADDON_MATT_BANDITS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 3;
	condition = dia_addon_matt_bandits_condition;
	information = dia_addon_matt_bandits_info;
	description = "Co v� o banditech?";
};


func int dia_addon_matt_bandits_condition()
{
	return TRUE;
};

func void dia_addon_matt_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//Co v� o banditech?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//Mysl� s vyj�mkou toho, �e jsou nebezpe�n�mi vrahy a po�etn� n�s p�evy�uj�?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//Maj� dost pen�z.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//Dob�e, m�v�vali alespo� dost pen�z. Ale nezaplatili n�m posledn� dod�vku.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//Nicm�n�, pochybuji �e to bude, proto�e ti bastardi spot�ebovali v�echno zlato.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//Pravd�podobn� si mysl�, �e se nyn� m��ou dostat pry� s ��mkoliv.
};


instance DIA_ADDON_MATT_FRANCIS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 4;
	condition = dia_addon_matt_francis_condition;
	information = dia_addon_matt_francis_info;
	description = "Co v� o Francisovi?";
};


func int dia_addon_matt_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_matt_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//Co v� o Francisovi?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//Mysl� krom� toho, �e je shnil� a neschpn�?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Nech m� chv�li p�em��let. Hmmm .... Ne, nic dal��ho m� nenapad�.
};


instance DIA_ADDON_MATT_ANHEUERN(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 11;
	condition = dia_addon_matt_anheuern_condition;
	information = dia_addon_matt_anheuern_info;
	permanent = FALSE;
	description = "Poj�.";
};


func int dia_addon_matt_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_matt_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//Poj� se mnou.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//Nevid�, �e si zde zkou��m odpo�inout?
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Na Greg�v rozkaz.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//(usp�chan�) Pro� jsi to ne�ek d��v? Samoz�ejm�, �e p�jdu.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//Kam bychom m�li j�t pak?
	Info_ClearChoices(dia_addon_matt_anheuern);
	Info_AddChoice(dia_addon_matt_anheuern,"Dr� hubu a poj�.",dia_addon_matt_anheuern_shutup);
	Info_AddChoice(dia_addon_matt_anheuern,"M�li bychom vy�istit ka�on.",dia_addon_matt_anheuern_clearcanyon);
};

func void dia_addon_matt_anheuern_shutup()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Dr� hubu a poj�.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//(mrzut�) �, � - (sarkasticky) Kapit�n!
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void dia_addon_matt_anheuern_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//M�li bychom vy�istit ka�on.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//D�l� si srandu. Tam je kopa p��er. A b�itvy, ty jsou n�co.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//V�m o tom, poj�.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//(povzdechne si) Rad�ji vezmi v�c l��iv�ch lektvar�, budeme je pot�ebovat!
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_MATT_COMEON(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 12;
	condition = dia_addon_matt_comeon_condition;
	information = dia_addon_matt_comeon_info;
	permanent = TRUE;
	description = "Poj�.";
};


func int dia_addon_matt_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_matt_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_matt_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//Poj�.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//�, � - (cynicky) Kapit�n!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_MATT_GOHOME(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 13;
	condition = dia_addon_matt_gohome_condition;
	information = dia_addon_matt_gohome_info;
	permanent = TRUE;
	description = "U� t� nepot�ebuji.";
};


func int dia_addon_matt_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_matt_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//U� t� nepot�ebuji.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//(zb�dovan�) Pot�ebuji po��dn� hlt grogu!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_MATT_TOOFAR(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 14;
	condition = dia_addon_matt_toofar_condition;
	information = dia_addon_matt_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_matt_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//M��e� z tadyma pokra�ovat s�m, (cynicky) Kapit�ne.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//J� a ostatn� mu�i se vr�t�me do t�bora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//Vr�t�m se do t�bora!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_HEALING(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 15;
	condition = dia_addon_matt_healing_condition;
	information = dia_addon_matt_healing_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_healing_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void dia_addon_matt_healing_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//(cynicky) Hal� kapit�ne! Mohl bych pot�ebovat l��iv� lektvar!
};

