
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Hal�, cizin�e!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Mus� m�t po��dn� hlad a ��ze� - mohl bych ti snad uk�zat sv� zbo��?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "Pot�ebuju si promluvit s paladiny.";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//Pot�ebuju si promluvit s paladiny.
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//Tak to m� jen malou nad�ji. Od t� doby, co paladinov� zabrali horn� ��st m�sta, se tam jen tak n�kdo nedostane.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "M��e� mi pomoci proniknout do horn� �tvrti?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//M��e� mi pomoci proniknout do horn� �tvrti?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//J�? Ne, nem�m tady p��li� velk� slovo!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//V doln� ��sti m�sta je jen p�r lid�, kte�� maj� dostate�n� vliv, aby se dostali p�es str�e.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Matteo, m�j p�n, je jedn�m z nich. Mo�n� by sis s n�m m�l promluvit.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Jestli se m�m dostat do horn� �tvrti, mus� mi v tom pomoci n�jac� vlivn� ob�an� z doln� ��sti m�sta.");
	b_logentry(TOPIC_OV,"Jedn�m z vlivn�ch ob�an� doln� ��sti m�sta je obchodn�k Matteo.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "Kde najdu Mattea?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Kde najdu Mattea?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Stoj� p��mo p�ed jeho kr�mkem. Sta�� jen vej�t. Je tam skoro po��d.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matte�v obchod le�� u ji�n� m�stsk� br�ny. Prod�v� r�zn� vybaven�, zbran� a z�soby.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "A co ti ostatn� vlivn� m욝an�?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//A co ti ostatn� vlivn� m욝an�?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Obchodn�ci a mistr tesa� tady na hlavn� ulici jsou nejvlivn�j��mi osobami ve m�st�.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//M�l by ses pokusit o p�ijet� za u�edn�ka u jednoho z nich - jako j�.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Od t� doby, co pracuju pro Mattea, se ke mn� lid� ve m�st� chovaj� s �ctou!
	b_logentry(TOPIC_OV,"M�l bych vstoupit do u�en� k n�kter�mu z m�stn�ch �emeslnick�ch mistr�.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "Pot�ebuju trochu pen�z a poohl��m se po pr�ci.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Pot�ebuju trochu pen�z a poohl��m se po pr�ci.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//Sly�el jsem, �e m� probl�my se sv�m n�stupcem. Jeho d�lna je p��mo naproti.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//��k� se, �e plat� velice slu�n�.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "Co m� na prodej?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Co m� na prodej?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//Te� zrovna nem�m moc velk� v�b�r.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Ten zatracenej velkostatk�� u� nechce d�l doru�ovat sv� zbo�� a to, co z�sk�me od mal�ch statk���, nesta�� pokr�t po�adavky m�sta ani n�hodou.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_cheese) < 5)
	{
		CreateInvItems(self,itfo_cheese,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Uka� mi sv� zbo��.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Mus�m t� po��dat o shov�vavost nad mou chudou nab�dkou. �lov�k tv�ho postaven� je ur�it� zvykl� na lep��.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "�ekni mi o t� rolnick� vzpou�e v�c.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//�ekni mi o t� rolnick� vzpou�e v�c.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//To je docela jednoduch�: velkostatk�� Onar u� nechce d�l m�stu odv�d�t dan�.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//No jen si to p�edstav! Jsme ve v�lce se sk�ety a ten tlustej lenoch chce v�echno jen pro sebe!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Norm�ln� by v takov�ch p��padech domobrana sjednala po��dek.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Ale te� p�ich�z� to nejlep��: ��k� se, �e Onar najal �old�ky, aby dr�eli voj�ky z m�sta na uzd�!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//�OLD�CI! Cel� tahle v�c skon�� n�jakou zatracenou v�lkou! Jako kdyby JEDNA v�lka nesta�ila!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "Co v� o Onarov�ch �oldn���ch?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Co v� o Onarov�ch �oldn���ch?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//Zaslechl jsem, �e v�t�inou se jedn� o b�val� v�zn� z hornick� kolonie.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//A jejich velitel m�l �dajn� bejt n�jak� velk� zv��e z kr�lova okol� - gener�l nebo co, kter�ho potrestali za zradu!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Jsou te� stra�n� �asy.
};

