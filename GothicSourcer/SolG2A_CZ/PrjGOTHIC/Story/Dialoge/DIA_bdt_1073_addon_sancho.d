
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
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Sakra, dal�� nov��ek. (sm�ch) Taky sis p��el pro zlato?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Zlato?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(sm�ch) Ned�lej si starosti.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//V�ichni nov��ci, kte�� sem p��jdou, se cht�j� dostat do dolu.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Ale ne�ekej, �e to bude tak jednoduch�!
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
	description = "Jak se dostanu do t�bora?";
};


func int dia_addon_sancho_lager_condition()
{
	return TRUE;
};

func void dia_addon_sancho_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak se dostanu do t�bora?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Jednodu�e p�ejdi most.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Av�ak, jestli se chce� dostat do dolu, mus� proj�t okolo Franca.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Ten ale od ka�d�ho o�ek�v�, �e nejd��v bude chv�li pracovat mimo t�bor.
	};
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"V�ichni nov��ci mus� nejd��v pracovat v ba�in�ch, a� potom jim dovol� vstoupit do dolu.");
};


instance DIA_ADDON_SANCHO_MINE(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 3;
	condition = dia_addon_sancho_mine_condition;
	information = dia_addon_sancho_mine_info;
	permanent = FALSE;
	description = "Pov�z mi v�c o dole ...";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Pov�z mi v�c o dole ...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Mohu ti d�t radu? Pokus se sp��telit s Francem. Tady venku je ��fem on.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//On jedin� rozhoduje, kdo vstoup� do t�bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Ale �ance, �e se tam dostane� jsou nulov�, jestli nebude� d�lat nic jin�ho ne� vysed�vat na sv�m leniv�m zadku.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Tak�e si s n�m promluv a z�skej pr�ci.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco rozhoduje o tom, kdo m��e vstoupit do t�bora. Takt� rozd�v� i pr�ci.");
};


instance DIA_ADDON_SANCHO_FRANCO(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 4;
	condition = dia_addon_sancho_franco_condition;
	information = dia_addon_sancho_franco_info;
	permanent = FALSE;
	description = "Kde m��u naj�t toho Franca?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Kde m��u naj�t toho Franca?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Obvykle post�v� u vchodu do t�bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Ale bu� p��telsk�, nebo dostane� tak zasranou pr�ci jako j�.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco se mot� okolo vstupu do t�bora.");
};


instance DIA_ADDON_SANCHO_SPITZEL(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 5;
	condition = dia_addon_sancho_spitzel_condition;
	information = dia_addon_sancho_spitzel_info;
	permanent = FALSE;
	description = "Mus� tady st�le takhle st�t?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Mus� tady st�le takhle st�t?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Je moji �lohou kontrolvat nov� p��choz�, aby se mezi n�s nedostal ��dnej �peh.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Jakoby se n�kdo zaj�mal o tohle zapomenut� m�sto. P��mo veprost�ed ba�iny.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikdo n�s nena�el, nikdo n�s ani nenajde. Pro� by sem vlastn� n�kdo m�l pos�lat �peha?
};


instance DIA_ADDON_SANCHO_PERM(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 99;
	condition = dia_addon_sancho_perm_condition;
	information = dia_addon_sancho_perm_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//N�co nov�ho?
	if(Npc_IsDead(franco) && (COMMENT_FRANCO == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Sly�el jsem, �e jsi poslal Franca do v��n�ch lovi��. Dobr� pr�ce ...
		if(!Npc_IsDead(carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... ale ten Carlos n�m v�em u� leze p�kn� na nervy. S nik�m se nehodl� bavit ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//U� jsi Carlosovi taky uk�zal cestu do pekel? K�mo, se� skute�n� stroj na zab�jen�. Rad�ji se ke mn� ani nep�ibli�uj.
		};
		COMMENT_FRANCO = TRUE;
	}
	else if(Npc_IsDead(esteban) && (COMMENT_ESTEBAN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Sly�el jsem, �e jsi zabil Estebana. �lov��e, ty si fakt o n�co koleduje�, �e?
		COMMENT_ESTEBAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Ne, zat�m nic nov�ho.
	};
};

