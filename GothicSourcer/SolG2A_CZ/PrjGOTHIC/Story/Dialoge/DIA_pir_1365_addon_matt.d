
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
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//Á, nováèek? Dobrý. Mùže se hodit každej novej dobrej chlap, ce se k nám pøidá.
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
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//LÉÈIVÝ LEKTVAR! Co tak léèivý lektvar, nerozumíš?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//Vše v poøádku - (cynicky) kapitáne!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Neotravuj mì! Nemáme žádné další lodì.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//Poèkám, abych uvidìl, co Greg udìlá dále.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Nyní je vše v táboøe v poøádku. Mùžu si nyní na chvíli odpoèinout.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//A kdybych byl na tvém místì, doporuèil bych ti to samé.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Od té doby, co zde jsou banditi, vše, co je nám drahé, se mùže rychle zmìnit.
	};
};


instance DIA_ADDON_MATT_BANDITS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 3;
	condition = dia_addon_matt_bandits_condition;
	information = dia_addon_matt_bandits_info;
	description = "Co víš o banditech?";
};


func int dia_addon_matt_bandits_condition()
{
	return TRUE;
};

func void dia_addon_matt_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//Myslíš s vyjímkou toho, že jsou nebezpeènými vrahy a poèetnì nás pøevyšují?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//Mají dost penìz.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//Dobøe, mívávali alespoò dost penìz. Ale nezaplatili nám poslední dodávku.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//Nicménì, pochybuji že to bude, protože ti bastardi spotøebovali všechno zlato.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//Pravdìpodobnì si myslí, že se nyní mùžou dostat pryè s èímkoliv.
};


instance DIA_ADDON_MATT_FRANCIS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 4;
	condition = dia_addon_matt_francis_condition;
	information = dia_addon_matt_francis_info;
	description = "Co víš o Francisovi?";
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
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//Co víš o Francisovi?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//Myslíš kromì toho, že je shnilý a neschpný?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Nech mì chvíli pøemýšlet. Hmmm .... Ne, nic dalšího mì nenapadá.
};


instance DIA_ADDON_MATT_ANHEUERN(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 11;
	condition = dia_addon_matt_anheuern_condition;
	information = dia_addon_matt_anheuern_info;
	permanent = FALSE;
	description = "Pojï.";
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
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//Pojï se mnou.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//Nevidíš, že si zde zkouším odpoèinout?
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Na Gregùv rozkaz.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//(uspìchanì) Proè jsi to neøek døív? Samozøejmì, že pùjdu.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//Kam bychom mìli jít pak?
	Info_ClearChoices(dia_addon_matt_anheuern);
	Info_AddChoice(dia_addon_matt_anheuern,"Drž hubu a pojï.",dia_addon_matt_anheuern_shutup);
	Info_AddChoice(dia_addon_matt_anheuern,"Mìli bychom vyèistit kaòon.",dia_addon_matt_anheuern_clearcanyon);
};

func void dia_addon_matt_anheuern_shutup()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Drž hubu a pojï.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//(mrzutì) Á, Á - (sarkasticky) Kapitán!
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void dia_addon_matt_anheuern_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//Mìli bychom vyèistit kaòon.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//Dìláš si srandu. Tam je kopa pøíšer. A bøitvy, ty jsou nìco.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//Vím o tom, pojï.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//(povzdechne si) Radìji vezmi víc léèivých lektvarù, budeme je potøebovat!
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
	description = "Pojï.";
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
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//Pojï.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//Á, Á - (cynicky) Kapitán!
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
	description = "Už tì nepotøebuji.";
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
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//Už tì nepotøebuji.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//(zbìdovanì) Potøebuji poøádný hlt grogu!
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
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//Mùžeš z tadyma pokraèovat sám, (cynicky) Kapitáne.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//Já a ostatní muži se vrátíme do tábora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//Vrátím se do tábora!
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
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//(cynicky) Haló kapitáne! Mohl bych potøebovat léèivý lektvar!
};

