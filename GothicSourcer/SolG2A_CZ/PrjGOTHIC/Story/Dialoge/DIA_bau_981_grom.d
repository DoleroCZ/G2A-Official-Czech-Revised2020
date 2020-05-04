
instance DIA_GROM_EXIT(C_INFO)
{
	npc = bau_981_grom;
	nr = 999;
	condition = dia_grom_exit_condition;
	information = dia_grom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grom_exit_condition()
{
	return TRUE;
};

func void dia_grom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GROM_HALLO(C_INFO)
{
	npc = bau_981_grom;
	nr = 3;
	condition = dia_grom_hallo_condition;
	information = dia_grom_hallo_info;
	description = "Je v�echno v po��dku?";
};


func int dia_grom_hallo_condition()
{
	return TRUE;
};

func void dia_grom_hallo_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//�, n�jak� nezn�m� poutn�k. M�m moc pr�ce, tak co chce�?
	Info_ClearChoices(dia_grom_hallo);
	Info_AddChoice(dia_grom_hallo,"Co je tu zaj�mav�ho k vid�n�?",dia_grom_hallo_waszusehen);
	Info_AddChoice(dia_grom_hallo,"Co tady d�l�?",dia_grom_hallo_was);
};

func void dia_grom_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Co je tu zaj�mav�ho k vid�n�?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Zaj�mav� je slab� slovo. Kdy� se vyd� hloub�j� do lesa, naraz� na po��dn� odporn� chlap�ky.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Jsou okolo deseti stop vysok�, chlupat� a maj fakt �patnou n�ladu. Jestli na n� nejsi dost siln�, tak tam rad�ji ani necho�.
};

func void dia_grom_hallo_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//To, co d�evorubci a lovci obvykle d�l�vaj�.
	Info_AddChoice(dia_grom_hallo,DIALOG_BACK,dia_grom_hallo_back);
};

func void dia_grom_hallo_back()
{
	Info_ClearChoices(dia_grom_hallo);
};


instance DIA_GROM_ASKTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 10;
	condition = dia_grom_askteacher_condition;
	information = dia_grom_askteacher_info;
	description = "M��e� m� nau�it n�co o lovu?";
};


func int dia_grom_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_hallo))
	{
		return TRUE;
	};
};

func void dia_grom_askteacher_info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//M��e� m� nau�it n�co o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasn�. Ale nejd��v mi dej n�co po��dn�ho na zub. Um�r�m tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Dal bych si l�hev ml�ka, bochn�k chleba a tlustou �unku. Pak t� nau��m, �emu bude� cht�t.
	Log_CreateTopic(TOPIC_GROMASKTEACHER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMASKTEACHER,LOG_RUNNING);
	b_logentry(TOPIC_GROMASKTEACHER,"Lovec Grom se se mnou pod�l� o sv� poznatky, pokud mu p�inesu l�hev ml�ka, kraj�c chleba a �unku.");
};


instance DIA_GROM_PAYTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 11;
	condition = dia_grom_payteacher_condition;
	information = dia_grom_payteacher_info;
	description = "Tady m� j�dlo, cos cht�l.";
};


func int dia_grom_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_askteacher) && Npc_HasItems(other,itfo_milk) && Npc_HasItems(other,itfo_bread) && Npc_HasItems(other,itfo_bacon))
	{
		return TRUE;
	};
};

func void dia_grom_payteacher_info()
{
	b_giveinvitems(other,self,itfo_milk,1);
	b_giveinvitems(other,self,itfo_bread,1);
	b_giveinvitems(other,self,itfo_bacon,1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Tady m� j�dlo, cos cht�l.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//V�born�. A te�?
	GROM_TEACHANIMALTROPHY = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GROM_TEACHHUNTING(C_INFO)
{
	npc = bau_981_grom;
	nr = 12;
	condition = dia_grom_teachhunting_condition;
	information = dia_grom_teachhunting_info;
	permanent = TRUE;
	description = "R�d bych se nau�il n�jak�m loveck�m technik�m.";
};


func int dia_grom_teachhunting_condition()
{
	if(GROM_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};

func void dia_grom_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//R�d bych se nau�il n�jak�m loveck�m technik�m.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Co chce� v�d�t?
		Info_AddChoice(dia_grom_teachhunting,DIALOG_BACK,dia_grom_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Stahov�n� z k��e",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_grom_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmut� zub�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_grom_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmut� srdce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_grom_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmut� kusadel",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grom_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Roh st�nov� �elmy ",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_grom_teachhunting_shadowhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nem��u t� nau�it nic, co bys je�t� neznal.
	};
};

func void dia_grom_teachhunting_back()
{
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Ve� �ez kolem kon�etin tak, abys mohl st�hnout k��i. D�lej to od hlavy k ocasu, ne naopak.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Kdy� chce� odd�lit zuby, mus� d�vat dobr� pozor, aby se p�i odlamov�n� od lebky nezlomily.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Srdce z�sk� tak, �e �ikovn� ��zne� do hrudi zv��ete. Ale obvykle to stoji za to jen v p��pad�, �e se jedn� zv��e magick�ho p�vodu.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Kusadla d�ln�ch �erv� a poln�ch �k�dc� lze z�skat jen za pomoci velmi siln� kovov� p�ky, proto�e jsou zakl�n�ny hluboko v pevn�ch tk�n�ch hlavy.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Abys z�skal roh st�nov� �elmy, op�i se v�� silou o lebku a z�rove� tahej za roh. Pak tu v�c tvrdou �epel� u��zni.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};


instance DIA_GROM_PICKPOCKET(C_INFO)
{
	npc = bau_981_grom;
	nr = 900;
	condition = dia_grom_pickpocket_condition;
	information = dia_grom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_grom_pickpocket_condition()
{
	return c_beklauen(75,40);
};

func void dia_grom_pickpocket_info()
{
	Info_ClearChoices(dia_grom_pickpocket);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_BACK,dia_grom_pickpocket_back);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_PICKPOCKET,dia_grom_pickpocket_doit);
};

func void dia_grom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grom_pickpocket);
};

func void dia_grom_pickpocket_back()
{
	Info_ClearChoices(dia_grom_pickpocket);
};

