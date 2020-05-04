
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
	description = "Je všechno v poøádku?";
};


func int dia_grom_hallo_condition()
{
	return TRUE;
};

func void dia_grom_hallo_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Je všechno v poøádku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Á, nìjaký neznámý poutník. Mám moc práce, tak co chceš?
	Info_ClearChoices(dia_grom_hallo);
	Info_AddChoice(dia_grom_hallo,"Co je tu zajímavého k vidìní?",dia_grom_hallo_waszusehen);
	Info_AddChoice(dia_grom_hallo,"Co tady dìláš?",dia_grom_hallo_was);
};

func void dia_grom_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Co je tu zajímavého k vidìní?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Zajímavé je slabé slovo. Když se vydáš hloubìjš do lesa, narazíš na poøádnì odporný chlapíky.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Jsou okolo deseti stop vysoký, chlupatý a maj fakt špatnou náladu. Jestli na nì nejsi dost silný, tak tam radìji ani nechoï.
};

func void dia_grom_hallo_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//To, co døevorubci a lovci obvykle dìlávají.
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
	description = "Mùžeš mì nauèit nìco o lovu?";
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
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Mùžeš mì nauèit nìco o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasnì. Ale nejdøív mi dej nìco poøádnýho na zub. Umírám tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Dal bych si láhev mlíka, bochník chleba a tlustou šunku. Pak tì nauèím, èemu budeš chtít.
	Log_CreateTopic(TOPIC_GROMASKTEACHER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMASKTEACHER,LOG_RUNNING);
	b_logentry(TOPIC_GROMASKTEACHER,"Lovec Grom se se mnou podìlí o své poznatky, pokud mu pøinesu láhev mléka, krajíc chleba a šunku.");
};


instance DIA_GROM_PAYTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 11;
	condition = dia_grom_payteacher_condition;
	information = dia_grom_payteacher_info;
	description = "Tady máš jídlo, cos chtìl.";
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
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Tady máš jídlo, cos chtìl.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Výbornì. A teï?
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
	description = "Rád bych se nauèil nìjakým loveckým technikám.";
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
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Rád bych se nauèil nìjakým loveckým technikám.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Co chceš vìdìt?
		Info_AddChoice(dia_grom_teachhunting,DIALOG_BACK,dia_grom_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Stahování z kùže",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_grom_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmutí zubù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_grom_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmutí srdce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_grom_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Vyjmutí kusadel",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grom_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Roh stínové šelmy ",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_grom_teachhunting_shadowhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nemùžu tì nauèit nic, co bys ještì neznal.
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
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Veï øez kolem konèetin tak, abys mohl stáhnout kùži. Dìlej to od hlavy k ocasu, ne naopak.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Když chceš oddìlit zuby, musíš dávat dobrý pozor, aby se pøi odlamování od lebky nezlomily.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Srdce získáš tak, že šikovnì øízneš do hrudi zvíøete. Ale obvykle to stoji za to jen v pøípadì, že se jedná zvíøe magického pùvodu.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Kusadla dùlních èervù a polních škùdcù lze získat jen za pomoci velmi silné kovové páky, protože jsou zaklínìny hluboko v pevných tkáních hlavy.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Abys získal roh stínové šelmy, opøi se vší silou o lebku a zároveò tahej za roh. Pak tu vìc tvrdou èepelí uøízni.
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

