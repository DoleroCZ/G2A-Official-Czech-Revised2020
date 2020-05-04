
instance DIA_KHALED_EXIT(C_INFO)
{
	npc = sld_823_khaled;
	nr = 999;
	condition = dia_khaled_exit_condition;
	information = dia_khaled_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_khaled_exit_condition()
{
	return TRUE;
};

func void dia_khaled_exit_info()
{
	AI_StopProcessInfos(self);
};


var int khaled_weiter;

instance DIA_KHALED_HALLO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 1;
	condition = dia_khaled_hallo_condition;
	information = dia_khaled_hallo_info;
	permanent = TRUE;
	description = "Jsi v poøádku?";
};


func int dia_khaled_hallo_condition()
{
	if(KHALED_WEITER == FALSE)
	{
		return TRUE;
	};
};

func void dia_khaled_hallo_info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//Jsi v poøádku?
	if(Npc_KnowsInfo(other,dia_lee_wannajoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//Tak co, chceš se k nám tedy pøidat? Máš aspoò nìjakou zbraò?
		KHALED_WEITER = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Khaled obchoduje se zbranìmi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Jestli je to dùležité, promluv si s Leem. Jinak mi dej pokoj.
		AI_StopProcessInfos(self);
	};
};


instance DIA_KHALED_TRADE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 700;
	condition = dia_khaled_trade_condition;
	information = dia_khaled_trade_info;
	permanent = TRUE;
	description = "Jaké zbranì mi mùžeš nabídnout?";
	trade = TRUE;
};


func int dia_khaled_trade_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_trade_info()
{
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Jaké zbranì mi mùžeš nabídnout?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Jenom ty nejlepší, jen si je prohlídni!
};


instance DIA_KHALED_WANNAJOIN(C_INFO)
{
	npc = sld_823_khaled;
	nr = 10;
	condition = dia_khaled_wannajoin_condition;
	information = dia_khaled_wannajoin_info;
	permanent = TRUE;
	description = "Nevadilo by ti, kdybych se k vám pøidal?";
};


func int dia_khaled_wannajoin_condition()
{
	if((KHALED_WEITER == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_khaled_wannajoin_info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Nevadilo by ti, kdybych se k vám pøidal?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Jestli jsi prošel zkouškou, klidnì se za tebe pøimluvím.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//Už jsem všechno splnil.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//No, tak je to teda v cajku.
	};
};


instance DIA_KHALED_WOHER(C_INFO)
{
	npc = sld_823_khaled;
	nr = 3;
	condition = dia_khaled_woher_condition;
	information = dia_khaled_woher_info;
	permanent = FALSE;
	description = "Jak jsi dostal k žoldákùm?";
};


func int dia_khaled_woher_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_woher_info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Jak jsi dostal k žoldákùm?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//Pøišel jsem z jihu spolu se Sylviem. Patøili jsme k žoldnéøské armádì, která bojovala proti skøetùm.
};


instance DIA_KHALED_ABOUTSYLVIO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 4;
	condition = dia_khaled_aboutsylvio_condition;
	information = dia_khaled_aboutsylvio_info;
	permanent = FALSE;
	description = "Co si myslíš o Sylviovi?";
};


func int dia_khaled_aboutsylvio_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Co si myslíš o Sylviovi?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//Je to nebezpeèný chlápek! A spousta žoldákù, co pøišla s ním, ho poøád poslouchá. Radši by ses s ním nemìl pouštìt do køížku.
};


instance DIA_KHALED_ABOUTLEE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 5;
	condition = dia_khaled_aboutlee_condition;
	information = dia_khaled_aboutlee_info;
	permanent = FALSE;
	description = "Jaký máš názor na Leeho?";
};


func int dia_khaled_aboutlee_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutlee_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Jaký máš názor na Leeho?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//Myslím, že jedinì Lee se opravdu stará, abychom se dostali z tohohle ostrova.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Chce se vydat na pevninu, ale nejspíš si tu chce ještì s nìkým nìco vyøídit.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//V každém pøípadì dìlá svou práci daleko líp, než by to kdy dokázal Sylvio.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Krom toho je to dobrý vùdce. Vìtšinou si tu mùžeme dìlat, co chceme.
};


instance DIA_KHALED_PICKPOCKET(C_INFO)
{
	npc = sld_823_khaled;
	nr = 900;
	condition = dia_khaled_pickpocket_condition;
	information = dia_khaled_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_khaled_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_khaled_pickpocket_info()
{
	Info_ClearChoices(dia_khaled_pickpocket);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_BACK,dia_khaled_pickpocket_back);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_PICKPOCKET,dia_khaled_pickpocket_doit);
};

func void dia_khaled_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_khaled_pickpocket);
};

func void dia_khaled_pickpocket_back()
{
	Info_ClearChoices(dia_khaled_pickpocket);
};

