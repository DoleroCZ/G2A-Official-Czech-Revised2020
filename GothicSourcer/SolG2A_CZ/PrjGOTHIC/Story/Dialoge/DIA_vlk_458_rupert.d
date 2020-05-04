
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
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Haló, cizinèe!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Musíš mít poøádný hlad a žízeò - mohl bych ti snad ukázat své zboží?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "Potøebuju si promluvit s paladiny.";
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
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//Potøebuju si promluvit s paladiny.
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//Tak to máš jen malou nadìji. Od té doby, co paladinové zabrali horní èást mìsta, se tam jen tak nìkdo nedostane.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "Mùžeš mi pomoci proniknout do horní ètvrti?";
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
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Mùžeš mi pomoci proniknout do horní ètvrti?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Já? Ne, nemám tady pøíliš velké slovo!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//V dolní èásti mìsta je jen pár lidí, kteøí mají dostateèný vliv, aby se dostali pøes stráže.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Matteo, mùj pán, je jedním z nich. Možná by sis s ním mìl promluvit.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Jestli se mám dostat do horní ètvrti, musí mi v tom pomoci nìjací vlivní obèané z dolní èásti mìsta.");
	b_logentry(TOPIC_OV,"Jedním z vlivných obèanù dolní èásti mìsta je obchodník Matteo.");
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
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Stojíš pøímo pøed jeho krámkem. Staèí jen vejít. Je tam skoro poøád.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matteùv obchod leží u jižní mìstská brány. Prodává rùzné vybavení, zbranì a zásoby.");
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
	description = "A co ti ostatní vlivní mìšané?";
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
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//A co ti ostatní vlivní mìšané?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Obchodníci a mistr tesaø tady na hlavní ulici jsou nejvlivnìjšími osobami ve mìstì.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Mìl by ses pokusit o pøijetí za uèedníka u jednoho z nich - jako já.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Od té doby, co pracuju pro Mattea, se ke mnì lidé ve mìstì chovají s úctou!
	b_logentry(TOPIC_OV,"Mìl bych vstoupit do uèení k nìkterému z místních øemeslnických mistrù.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "Potøebuju trochu penìz a poohlížím se po práci.";
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
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Potøebuju trochu penìz a poohlížím se po práci.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//Slyšel jsem, že má problémy se svým nástupcem. Jeho dílna je pøímo naproti.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//Øíká se, že platí velice slušnì.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "Co máš na prodej?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Co máš na prodej?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//Teï zrovna nemám moc velký výbìr.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Ten zatracenej velkostatkáø už nechce dál doruèovat své zboží a to, co získáme od malých statkáøù, nestaèí pokrýt požadavky mìsta ani náhodou.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
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
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Ukaž mi své zboží.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Musím tì požádat o shovívavost nad mou chudou nabídkou. Èlovìk tvého postavení je urèitì zvyklý na lepší.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "Øekni mi o té rolnické vzpouøe víc.";
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
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Øekni mi o té rolnické vzpouøe víc.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//To je docela jednoduché: velkostatkáø Onar už nechce dál mìstu odvádìt danì.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//No jen si to pøedstav! Jsme ve válce se skøety a ten tlustej lenoch chce všechno jen pro sebe!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Normálnì by v takových pøípadech domobrana sjednala poøádek.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Ale teï pøichází to nejlepší: øíká se, že Onar najal žoldáky, aby drželi vojáky z mìsta na uzdì!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//ŽOLDÁCI! Celá tahle vìc skonèí nìjakou zatracenou válkou! Jako kdyby JEDNA válka nestaèila!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "Co víš o Onarových žoldnéøích?";
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
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Co víš o Onarových žoldnéøích?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//Zaslechl jsem, že vìtšinou se jedná o bývalé vìznì z hornické kolonie.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//A jejich velitel mìl údajnì bejt nìjaký velký zvíøe z králova okolí - generál nebo co, kterýho potrestali za zradu!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Jsou teï strašné èasy.
};

