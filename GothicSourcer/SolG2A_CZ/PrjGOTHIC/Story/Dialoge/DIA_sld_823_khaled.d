
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
	description = "Jsi v po��dku?";
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
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//Jsi v po��dku?
	if(Npc_KnowsInfo(other,dia_lee_wannajoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//Tak co, chce� se k n�m tedy p�idat? M� aspo� n�jakou zbra�?
		KHALED_WEITER = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Khaled obchoduje se zbran�mi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Jestli je to d�le�it�, promluv si s Leem. Jinak mi dej pokoj.
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
	description = "Jak� zbran� mi m��e� nab�dnout?";
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
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Jak� zbran� mi m��e� nab�dnout?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Jenom ty nejlep��, jen si je prohl�dni!
};


instance DIA_KHALED_WANNAJOIN(C_INFO)
{
	npc = sld_823_khaled;
	nr = 10;
	condition = dia_khaled_wannajoin_condition;
	information = dia_khaled_wannajoin_info;
	permanent = TRUE;
	description = "Nevadilo by ti, kdybych se k v�m p�idal?";
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
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Nevadilo by ti, kdybych se k v�m p�idal?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Jestli jsi pro�el zkou�kou, klidn� se za tebe p�imluv�m.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//U� jsem v�echno splnil.
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
	description = "Jak jsi dostal k �old�k�m?";
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
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Jak jsi dostal k �old�k�m?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//P�i�el jsem z jihu spolu se Sylviem. Pat�ili jsme k �oldn��sk� arm�d�, kter� bojovala proti sk�et�m.
};


instance DIA_KHALED_ABOUTSYLVIO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 4;
	condition = dia_khaled_aboutsylvio_condition;
	information = dia_khaled_aboutsylvio_info;
	permanent = FALSE;
	description = "Co si mysl� o Sylviovi?";
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
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Co si mysl� o Sylviovi?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//Je to nebezpe�n� chl�pek! A spousta �old�k�, co p�i�la s n�m, ho po��d poslouch�. Rad�i by ses s n�m nem�l pou�t�t do k��ku.
};


instance DIA_KHALED_ABOUTLEE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 5;
	condition = dia_khaled_aboutlee_condition;
	information = dia_khaled_aboutlee_info;
	permanent = FALSE;
	description = "Jak� m� n�zor na Leeho?";
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
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Jak� m� n�zor na Leeho?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//Mysl�m, �e jedin� Lee se opravdu star�, abychom se dostali z tohohle ostrova.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Chce se vydat na pevninu, ale nejsp� si tu chce je�t� s n�k�m n�co vy��dit.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//V ka�d�m p��pad� d�l� svou pr�ci daleko l�p, ne� by to kdy dok�zal Sylvio.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Krom toho je to dobr� v�dce. V�t�inou si tu m��eme d�lat, co chceme.
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

