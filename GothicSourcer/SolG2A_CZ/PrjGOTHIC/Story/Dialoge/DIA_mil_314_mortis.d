
instance DIA_MORTIS_EXIT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 999;
	condition = dia_mortis_exit_condition;
	information = dia_mortis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mortis_exit_condition()
{
	return TRUE;
};

func void dia_mortis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORTIS_HALLO(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_hallo_condition;
	information = dia_mortis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mortis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Co chceš? Peck tady není. Takže nic nedostaneš. Pøijï pozdìji.
};


instance DIA_MORTIS_WAFFE(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_waffe_condition;
	information = dia_mortis_waffe_info;
	permanent = FALSE;
	description = "Kde je Peck?";
};


func int dia_mortis_waffe_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_waffe_info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//Kde je Peck?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Jsi u nás nový, co? V tom pøípadì vítej mezi námi.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Peck už je ve mìstì vážnì dost dlouho. Vsadím se, že se zase motá kolem té slaïouèké Vanji u Èervené lucerny.
};


instance DIA_MORTIS_PAKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_paket_condition;
	information = dia_mortis_paket_info;
	permanent = FALSE;
	description = "Co víš o tom balíku trávy z bažin?";
};


func int dia_mortis_paket_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_paket_info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Co víš o tom balíku trávy z bažin?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Hm... když jsem byl poslednì v pøístavní krèmì, slyšel jsem, jak se o nìm baví Kardif s nìjakým dalším chlapíkem.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Kdo byl ten druhej chlápek?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Nemám tušení. Ale øíkal, že pro své rostlinky našel nejlepší možné místo - pak se oba zaèali chlámat jako opilí skøeti.
	b_logentry(TOPIC_WAREHOUSE,"Mortis zaslechl, jak se hospodský Kardif v pøístavní krèmì domlouvá s nìjakým dalším mužem o balíku trávy. Dohadovali se o tom, kde ji uskladnit.");
};


instance DIA_MORTIS_REDLIGHT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_redlight_condition;
	information = dia_mortis_redlight_info;
	permanent = FALSE;
	description = "Co víš o pøístavní ètvrti?";
};


func int dia_mortis_redlight_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_redlight_info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Co víš o pøístavní ètvrti? Rád bych našel toho, kdo tu trávu z bažin prodává.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Nooo, ti chlápci odtamtud toho moc nenamluví, a rozhodnì neøeknou nic nìkomu, kdo je od mìstské stráže.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Jestli chceš tam dole nìco zjistit, mìl bys - ne, MUSÍŠ - si sundat brnìní.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Dobrá, a potom?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Nejlepší asi bude zajít do krèmy a bordelu. Jestli se nìkde nìco dozvíš, tak právì tam.
	b_logentry(TOPIC_REDLIGHT,"Mortis se domnívá, že když si budu chtít v pøístavu koupit trávu, radši bych na sobì nemìl mít žádnou zbroj. Nejspíš bych to mìl zkusit v krèmì nebo v nevìstinci.");
};


instance DIA_MORTIS_CANTEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 5;
	condition = dia_mortis_canteach_condition;
	information = dia_mortis_canteach_info;
	permanent = TRUE;
	description = "Chci se stát silnìjším.";
};


func int dia_mortis_canteach_condition()
{
	if(MORTIS_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_mortis_canteach_info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Chci se stát silnìjším.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Jasnì. Jestli jsi dost zkušený, mùžu ti pomoci s tréninkem.
		MORTIS_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Jasnì, že bys chtìl. Ale protože nejsi ani jeden z nás, ani paladin, tak z toho nic nebude.
	};
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Mortis, pøíslušník mìstské gardy, mi mùže pomoci zvýšit sílu.");
};


instance DIA_MORTIS_TEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 100;
	condition = dia_mortis_teach_condition;
	information = dia_mortis_teach_info;
	permanent = TRUE;
	description = "Chci se stát silnìjším.";
};


func int dia_mortis_teach_condition()
{
	if(MORTIS_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_mortis_teach_info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Chci se stát silnìjším.
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Už jsi dost silný. Jestli bys chtìl trénovat dál, musíš se poohlédnout po nìkom jiném.
	};
	Info_ClearChoices(dia_mortis_teach);
};

func void dia_mortis_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};


instance DIA_MORTIS_PICKPOCKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 900;
	condition = dia_mortis_pickpocket_condition;
	information = dia_mortis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_mortis_pickpocket_condition()
{
	return c_beklauen(38,60);
};

func void dia_mortis_pickpocket_info()
{
	Info_ClearChoices(dia_mortis_pickpocket);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_BACK,dia_mortis_pickpocket_back);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_PICKPOCKET,dia_mortis_pickpocket_doit);
};

func void dia_mortis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mortis_pickpocket);
};

func void dia_mortis_pickpocket_back()
{
	Info_ClearChoices(dia_mortis_pickpocket);
};

