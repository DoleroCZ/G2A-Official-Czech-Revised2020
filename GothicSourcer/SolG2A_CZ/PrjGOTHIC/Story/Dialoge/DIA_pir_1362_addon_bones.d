
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
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Je mi líto, ale nemám èas.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Musím trénovat.
};


instance DIA_ADDON_BONES_ANHEUERN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 1;
	condition = dia_addon_bones_anheuern_condition;
	information = dia_addon_bones_anheuern_info;
	description = "Kaòon èeká.";
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
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Kaòon èeká.
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
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//V pohodì. Je to trochu nuda, ale aspoò nemusím pracovat.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Právì se pøipravuji na další úkol, kterı mi Greg dá.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Jakı úkol?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//To ti nemùu øíct.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Bez uráky kámo, pracoval jsem dlouho a nechci tuto práci ztratit.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BONES_TRAIN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_train_condition;
	information = dia_addon_bones_train_info;
	permanent = FALSE;
	description = "Mùeš mì nìco nauèit?";
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
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//Mùeš mì nìco nauèit?
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_TEACHER(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_teacher_condition;
	information = dia_addon_bones_teacher_info;
	permanent = FALSE;
	description = "Kdo mì tu mùe nìco nauèit?";
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
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Kdo mì tu mùe nìco nauèit?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry a Morgan øídí stravování našich lidí.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Ti tì mohou nauèit, jak lépe bojovat.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//Všichni Henryho lidé umí zacházet s obouruèními zbranìmi.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan dává pøednost rychlejším jednoruèním zbraním.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Kdo dál?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Nemám páru, já se o toto nezajímám.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Nicménì jsem si jist, e Alligator Jack nebo Samuel by ti mohli nìjakı trik ukázat.
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
	description = "Co mi mùeš øíct o Francisovi?";
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
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Co mi mùeš øíct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Jen se rozhlédni kolem. Jediní lidé, co nìco dìlají, jsou Henry a jeho chlapi.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan stráví celı den v posteli nebo chlastá.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//Nedìlá vùbec nic. A kdo se neøídí podle nìj, má problém!
};


instance DIA_ADDON_BONES_WANTARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_wantarmor_condition;
	information = dia_addon_bones_wantarmor_info;
	permanent = TRUE;
	description = "Dej mi brnìní bandity.";
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
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Dej mi brnìní bandity.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Nejsem blázen, Greg by mi sal hlavu.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//Øíkál, e bez jeho rozkazu nemùu nikomu dát to brnìní.
	if(GREGISBACK == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Nemùu ti ho dát. Aspoò dokud není zpìt.
	};
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bones mi nechce dát brnìní banditù bez Gregova svolení.");
};


instance DIA_ADDON_BONES_GIVEARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_givearmor_condition;
	information = dia_addon_bones_givearmor_info;
	permanent = FALSE;
	description = "Gregùv rozkaz je, e mi máš dát brnìní.";
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
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Gregùv rozkaz je, e mi máš dát brnìní.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//Gregùv pøíkaz? Puh, a myslím, e bych pak musel jít sám.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//Bıt špionem v tom táboøe je holá sebevrada.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Radìji strpím Gregovo vìzení, ne aby mì zabili banditi.
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//Brnìní.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Tady to máš.
	b_giveinvitems(self,other,itar_bdt_m,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Ale nezahrávej si s tìma chlápkama.
	self.flags = 0;
	pir_1320_addon_greg.flags = 0;
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Zdá se, e gregùv rozkaz mùe dìlat zázraky. Mám brnìní banditù!");
	b_giveplayerxp(XP_BONES_GETBDTARMOR);
};

