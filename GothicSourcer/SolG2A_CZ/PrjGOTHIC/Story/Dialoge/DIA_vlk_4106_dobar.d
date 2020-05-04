
instance DIA_DOBAR_EXIT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 999;
	condition = dia_dobar_exit_condition;
	information = dia_dobar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dobar_exit_condition()
{
	return TRUE;
};

func void dia_dobar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DOBAR_HALLO(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_hallo_condition;
	information = dia_dobar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dobar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dobar_hallo_info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//(nevrle) Co chceš?
};


instance DIA_DOBAR_TALENT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_talent_condition;
	information = dia_dobar_talent_info;
	permanent = FALSE;
	description = "Vím pár vìci o kovaøinì.";
};


func int dia_dobar_talent_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void dia_dobar_talent_info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//Vím pár vìci o kovaøinì.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//Fajn, a co má být?
};


instance DIA_DOBAR_SCHMIEDE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_schmiede_condition;
	information = dia_dobar_schmiede_info;
	permanent = FALSE;
	description = "Mohu si u tebe v kovárnì nìco vyrobit?";
};


func int dia_dobar_schmiede_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_schmiede_info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//Mohu si u tebe v kovárnì nìco vyrobit?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//Teï zrovna nevím, kam døív skoèit, jenom bychom si tu pøekáželi. Poèkej, až se setmí.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//Pak pùjdeme s Parlafem na kutì a ty budeš mít volné pole pùsobnosti.
};


instance DIA_DOBAR_BEIBRINGEN(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_beibringen_condition;
	information = dia_dobar_beibringen_info;
	permanent = FALSE;
	description = "Mùžeš mì nìèemu nauèit?";
};


func int dia_dobar_beibringen_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_beibringen_info()
{
	AI_Output(other,self,"DIA_Dobar_beibringen_15_00");	//Mùžeš mì nìèemu nauèit?
	AI_Output(self,other,"DIA_Dobar_beibringen_08_01");	//Základy už máš. Mùžu ti teda ukázat, jak svou práci ještì vylepšit.
	AI_Output(self,other,"DIA_Dobar_beibringen_08_02");	//Pak budeš moci vyrábìt lepší zbranì.
	DOBAR_LEARNSMITH = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Dobar mì nauèí kout lepší zbranì.");
};


instance DIA_DOBAR_TEACH(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_teach_condition;
	information = dia_dobar_teach_info;
	description = b_buildlearnstring("Ukaž mi, jak vykovat kvalitní meè!",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01));
	permanent = TRUE;
};


func int dia_dobar_teach_condition()
{
	if((DOBAR_LEARNSMITH == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE))
	{
		return TRUE;
	};
};

func void dia_dobar_teach_info()
{
	AI_Output(other,self,"DIA_Dobar_Teach_15_00");	//Ukaž mi, jak vykovat kvalitní meè!
	if(b_teachplayertalentsmith(self,hero,WEAPON_1H_SPECIAL_01))
	{
		AI_Output(self,other,"DIA_Dobar_Teach_08_01");	//Pokud má daná zbraò za nìco stát, musíš nejdøív peèlivì a stejnomìrnì rozžhavit ocel.
		AI_Output(self,other,"DIA_Dobar_Teach_08_02");	//Když to budeš mít na pamìti, èepele, které vykováš, budou tvrdší a ostøejší.
		AI_Output(self,other,"DIA_Dobar_Teach_08_03");	//Víc už vìdìt nepotøebuješ. Jestli chceš tady na hradì nìkde sehnat ocel, promluv si s Engorem.
	};
};


instance DIA_DOBAR_WAFFE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 80;
	condition = dia_dobar_waffe_condition;
	information = dia_dobar_waffe_info;
	permanent = FALSE;
	description = "Mohl bys mi vyrobit zbraò?";
};


func int dia_dobar_waffe_condition()
{
	return TRUE;
};

func void dia_dobar_waffe_info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//Mohl bys mi vyrobit zbraò?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//Na to nemám èas. Zbranì rozdìluje Tandor - já je pouze vyrábím a Parlaf je pak brousí.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor prodává na hradì zbranì.");
};


instance DIA_DOBAR_NEWS(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_news_condition;
	information = dia_dobar_news_info;
	permanent = TRUE;
	description = "Jak jde práce?";
};


func int dia_dobar_news_condition()
{
	return TRUE;
};

func void dia_dobar_news_info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//Jak jde práce?
	if(DOBAR_EINMALIG == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//Zrovna kovám zbranì pro rytíøe na hradì. Od té doby, co jsme tady, musím se èinit, co mi síly staèí.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//A taky že je to zapotøebí. Ukážeme tìm zatraceným skøetùm, jak ostré jsou naše bøity!
		if(Npc_IsDead(parlaf) == FALSE)
		{
			b_turntonpc(self,parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(volá) Hej, Parlafe - a jsou tyhle meèe pìkné a ostré! Skøeti jsou sakra tuzí protivníci!
			b_turntonpc(self,other);
		};
		DOBAR_EINMALIG = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//Mohlo by to být lepší. Kdybys mì furt nerušil, urèitì bych už mìl hotovo aspoò nìco.
	};
};


instance DIA_DOBAR_PICKPOCKET(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_pickpocket_condition;
	information = dia_dobar_pickpocket_info;
	permanent = TRUE;
	description = "(Krádež jeho hrudky rudy by byla dosti riskantní.)";
};


func int dia_dobar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itmi_nugget) >= 1) && (other.attribute[ATR_DEXTERITY] >= (79 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_dobar_pickpocket_info()
{
	Info_ClearChoices(dia_dobar_pickpocket);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_BACK,dia_dobar_pickpocket_back);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_PICKPOCKET,dia_dobar_pickpocket_doit);
};

func void dia_dobar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 79)
	{
		b_giveinvitems(self,other,itmi_nugget,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_dobar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_dobar_pickpocket_back()
{
	Info_ClearChoices(dia_dobar_pickpocket);
};

