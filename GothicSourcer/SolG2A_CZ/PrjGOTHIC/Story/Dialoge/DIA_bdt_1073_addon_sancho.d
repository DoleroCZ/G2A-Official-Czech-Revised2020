
instance DIA_ADDON_SANCHO_EXIT(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 999;
	condition = dia_addon_sancho_exit_condition;
	information = dia_addon_sancho_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sancho_exit_condition()
{
	return TRUE;
};

func void dia_addon_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SANCHO_PICKPOCKET(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 900;
	condition = dia_addon_sancho_pickpocket_condition;
	information = dia_addon_sancho_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_sancho_pickpocket_condition()
{
	return c_beklauen(50,40);
};

func void dia_addon_sancho_pickpocket_info()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_BACK,dia_addon_sancho_pickpocket_back);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_PICKPOCKET,dia_addon_sancho_pickpocket_doit);
};

func void dia_addon_sancho_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};

func void dia_addon_sancho_pickpocket_back()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};


instance DIA_ADDON_SANCHO_HI(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_hi_condition;
	information = dia_addon_sancho_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_sancho_hi_condition()
{
	return TRUE;
};

func void dia_addon_sancho_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Sakra, dalöÌ nov·Ëek. (smÌch) Taky sis p¯Ìöel pro zlato?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Zlato?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(smÌch) NedÏlej si starosti.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//Vöichni nov·Ëci, kte¯Ì sem p¯Ìjdou, se chtÏjÌ dostat do dolu.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Ale neËekej, ûe to bude tak jednoduch˝!
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_SANCHO_LAGER(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_lager_condition;
	information = dia_addon_sancho_lager_info;
	permanent = FALSE;
	description = "Jak se dostanu do t·bora?";
};


func int dia_addon_sancho_lager_condition()
{
	return TRUE;
};

func void dia_addon_sancho_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak se dostanu do t·bora?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Jednoduöe p¯ejdi most.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Avöak, jestli se chceö dostat do dolu, musÌö projÌt okolo Franca.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Ten ale od kaûdÈho oËek·v·, ûe nejd¯Ìv bude chvÌli pracovat mimo t·bor.
	};
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"Vöichni nov·Ëci musÌ nejd¯Ìv pracovat v baûin·ch, aû potom jim dovolÌ vstoupit do dolu.");
};


instance DIA_ADDON_SANCHO_MINE(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 3;
	condition = dia_addon_sancho_mine_condition;
	information = dia_addon_sancho_mine_info;
	permanent = FALSE;
	description = "PovÏz mi vÌc o dole ...";
};


func int dia_addon_sancho_mine_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//PovÏz mi vÌc o dole ...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Mohu ti d·t radu? Pokus se sp¯·telit s Francem. Tady venku je öÈfem on.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//On jedin˝ rozhoduje, kdo vstoupÌ do t·bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Ale öance, ûe se tam dostaneö jsou nulovÈ, jestli nebudeö dÏlat nic jin˝ho neû vysed·vat na sv˝m leniv˝m zadku.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Takûe si s nÌm promluv a zÌskej pr·ci.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco rozhoduje o tom, kdo m˘ûe vstoupit do t·bora. TaktÈû rozd·v· i pr·ci.");
};


instance DIA_ADDON_SANCHO_FRANCO(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 4;
	condition = dia_addon_sancho_franco_condition;
	information = dia_addon_sancho_franco_info;
	permanent = FALSE;
	description = "Kde m˘ûu najÌt toho Franca?";
};


func int dia_addon_sancho_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_mine) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Kde m˘ûu najÌt toho Franca?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Obvykle post·v· u vchodu do t·bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Ale buÔ p¯·telsk˝, nebo dostaneö tak zasranou pr·ci jako j·.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco se mot· okolo vstupu do t·bora.");
};


instance DIA_ADDON_SANCHO_SPITZEL(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 5;
	condition = dia_addon_sancho_spitzel_condition;
	information = dia_addon_sancho_spitzel_info;
	permanent = FALSE;
	description = "MusÌö tady st·le takhle st·t?";
};


func int dia_addon_sancho_spitzel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_franco) || Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_spitzel_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//MusÌö tady st·le takhle st·t?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Je moji ˙lohou kontrolvat novÏ p¯ÌchozÌ, aby se mezi n·s nedostal û·dnej öpeh.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Jakoby se nÏkdo zajÌmal o tohle zapomenutÈ mÌsto. P¯Ìmo veprost¯ed baûiny.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikdo n·s nenaöel, nikdo n·s ani nenajde. ProË by sem vlastnÏ nÏkdo mÏl posÌlat öpeha?
};


instance DIA_ADDON_SANCHO_PERM(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 99;
	condition = dia_addon_sancho_perm_condition;
	information = dia_addon_sancho_perm_info;
	permanent = TRUE;
	description = "NÏco novÈho?";
};


func int dia_addon_sancho_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_spitzel))
	{
		return TRUE;
	};
};


var int comment_franco;
var int comment_esteban;

func void dia_addon_sancho_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//NÏco novÈho?
	if(Npc_IsDead(franco) && (COMMENT_FRANCO == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Slyöel jsem, ûe jsi poslal Franca do vÏËn˝ch loviöù. Dobr· pr·ce ...
		if(!Npc_IsDead(carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... ale ten Carlos n·m vöem uû leze pÏknÏ na nervy. S nik˝m se nehodl· bavit ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//Uû jsi Carlosovi taky uk·zal cestu do pekel? K·mo, seö skuteËnÏ stroj na zabÌjenÌ. RadÏji se ke mnÏ ani nep¯ibliûuj.
		};
		COMMENT_FRANCO = TRUE;
	}
	else if(Npc_IsDead(esteban) && (COMMENT_ESTEBAN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Slyöel jsem, ûe jsi zabil Estebana. »lovÏËe, ty si fakt o nÏco koledujeö, ûe?
		COMMENT_ESTEBAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Ne, zatÌm nic novÈho.
	};
};

