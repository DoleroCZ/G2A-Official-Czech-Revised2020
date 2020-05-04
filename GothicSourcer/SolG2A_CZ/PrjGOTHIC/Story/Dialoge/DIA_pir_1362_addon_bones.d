
instance DIA_ADDON_BONES_EXIT(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 999;
	condition = dia_addon_bones_exit_condition;
	information = dia_addon_bones_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bones_exit_condition()
{
	return TRUE;
};

func void dia_addon_bones_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BONES_PICKPOCKET(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 900;
	condition = dia_addon_bones_pickpocket_condition;
	information = dia_addon_bones_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bones_pickpocket_condition()
{
	return c_beklauen(75,104);
};

func void dia_addon_bones_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_BACK,dia_addon_bones_pickpocket_back);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_PICKPOCKET,dia_addon_bones_pickpocket_doit);
};

func void dia_addon_bones_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void dia_addon_bones_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void b_addon_bones_keinezeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Je mi l�to, ale nem�m �as.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Mus�m tr�novat.
};


instance DIA_ADDON_BONES_ANHEUERN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 1;
	condition = dia_addon_bones_anheuern_condition;
	information = dia_addon_bones_anheuern_info;
	description = "Ka�on �ek�.";
};


func int dia_addon_bones_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Ka�on �ek�.
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_HELLO(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_hello_condition;
	information = dia_addon_bones_hello_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_bones_hello_condition()
{
	return TRUE;
};

func void dia_addon_bones_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//V pohod�. Je to trochu nuda, ale aspo� nemus�m pracovat.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Pr�v� se p�ipravuji na dal�� �kol, kter� mi Greg d�.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Jak� �kol?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//To ti nem��u ��ct.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Bez ur�ky k�mo, pracoval jsem dlouho a nechci tuto pr�ci ztratit.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BONES_TRAIN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_train_condition;
	information = dia_addon_bones_train_info;
	permanent = FALSE;
	description = "M��e� m� n�co nau�it?";
};


func int dia_addon_bones_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_train_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//M��e� m� n�co nau�it?
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_TEACHER(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_teacher_condition;
	information = dia_addon_bones_teacher_info;
	permanent = FALSE;
	description = "Kdo m� tu m��e n�co nau�it?";
};


func int dia_addon_bones_teacher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_train) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_teacher_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Kdo m� tu m��e n�co nau�it?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry a Morgan ��d� stravov�n� na�ich lid�.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Ti t� mohou nau�it, jak l�pe bojovat.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//V�ichni Henryho lid� um� zach�zet s obouru�n�mi zbran�mi.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan d�v� p�ednost rychlej��m jednoru�n�m zbran�m.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Kdo d�l?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Nem�m p�ru, j� se o toto nezaj�m�m.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Nicm�n� jsem si jist, �e Alligator Jack nebo Samuel by ti mohli n�jak� trik uk�zat.
	KNOWS_HENRYSENTERTRUPP = TRUE;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
};


instance DIA_ADDON_BONES_FRANCIS(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 3;
	condition = dia_addon_bones_francis_condition;
	information = dia_addon_bones_francis_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o Francisovi?";
};


func int dia_addon_bones_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_bones_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Co mi m��e� ��ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Jen se rozhl�dni kolem. Jedin� lid�, co n�co d�laj�, jsou Henry a jeho chlapi.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan str�v� cel� den v posteli nebo chlast�.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//Ned�l� v�bec nic. A kdo se ne��d� podle n�j, m� probl�m!
};


instance DIA_ADDON_BONES_WANTARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_wantarmor_condition;
	information = dia_addon_bones_wantarmor_info;
	permanent = TRUE;
	description = "Dej mi brn�n� bandity.";
};


func int dia_addon_bones_wantarmor_condition()
{
	if((GREG_GAVEARMORTOBONES == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_bones_wantarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Dej mi brn�n� bandity.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Nejsem bl�zen, Greg by mi s�al hlavu.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//��k�l, �e bez jeho rozkazu nem��u nikomu d�t to brn�n�.
	if(GREGISBACK == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Nem��u ti ho d�t. Aspo� dokud nen� zp�t.
	};
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bones mi nechce d�t brn�n� bandit� bez Gregova svolen�.");
};


instance DIA_ADDON_BONES_GIVEARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_givearmor_condition;
	information = dia_addon_bones_givearmor_info;
	permanent = FALSE;
	description = "Greg�v rozkaz je, �e mi m� d�t brn�n�.";
};


func int dia_addon_bones_givearmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_givearmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Greg�v rozkaz je, �e mi m� d�t brn�n�.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//Greg�v p��kaz? Puh, a mysl�m, �e bych pak musel j�t s�m.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//B�t �pionem v tom t�bo�e je hol� sebevra�da.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Rad�ji strp�m Gregovo v�zen�, ne� aby m� zabili banditi.
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//Brn�n�.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Tady to m�.
	b_giveinvitems(self,other,itar_bdt_m,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Ale nezahr�vej si s t�ma chl�pkama.
	self.flags = 0;
	pir_1320_addon_greg.flags = 0;
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Zd� se, �e greg�v rozkaz m��e d�lat z�zraky. M�m brn�n� bandit�!");
	b_giveplayerxp(XP_BONES_GETBDTARMOR);
};

