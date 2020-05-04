
instance DIA_DJG_715_FERROS_EXIT(C_INFO)
{
	npc = djg_715_ferros;
	nr = 999;
	condition = dia_djg_715_ferros_exit_condition;
	information = dia_djg_715_ferros_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_djg_715_ferros_exit_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_FERROS_HELLO(C_INFO)
{
	npc = djg_715_ferros;
	nr = 4;
	condition = dia_djg_715_ferros_hello_condition;
	information = dia_djg_715_ferros_hello_info;
	permanent = FALSE;
	description = "Odkud jsi pøišel?";
};


func int dia_djg_715_ferros_hello_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_hello_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//Odkud jsi pøišel?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//Z pevniny. Pøiplul jsem sem se svými lidmi.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//Situace se poøád zhoršuje. Skøeti za sebou nechávají jen vypálené vesnice.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//Král už nemá žádnou moc.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//Pokud to chceš vìdìt, tak jste vy paladinové zklamali na plné èáøe.
	};
};


instance DIA_DJG_715_FERROS_FRIENDS(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_djg_715_ferros_friends_condition;
	information = dia_djg_715_ferros_friends_info;
	permanent = FALSE;
	description = "Kde jsou tví lidé teï?";
};


func int dia_djg_715_ferros_friends_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_friends_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//Kde jsou tví lidé teï?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//Opustil jsem je.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//Mìli dojem, že si mùžou brát, co se jim zlíbí, a bylo jim jedno, komu to patøí. Zbavili se mì.
};


instance DIA_DJG_715_FERROS_WAR(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_war_condition;
	information = dia_djg_715_ferros_war_info;
	permanent = FALSE;
	description = "Co dalšího víš o válce?";
};


func int dia_djg_715_ferros_war_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_war_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//Co dalšího víš o válce?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//Už jsi svého krále nevidìl pìknì dlouho, co?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//Skøeti jsou za branami hlavního mìsta. Ale jestli už padlo, to nevím.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//Poslední vìc, co jsem slyšel, byla, že král padl. Ale já tomu nevìøím.
};


instance DIA_DJG_715_FERROS_OLDCAMP(C_INFO)
{
	npc = djg_715_ferros;
	nr = 7;
	condition = dia_djg_715_ferros_oldcamp_condition;
	information = dia_djg_715_ferros_oldcamp_info;
	permanent = FALSE;
	description = "Co dìláš tady na hradì?";
};


func int dia_djg_715_ferros_oldcamp_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_oldcamp_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//Co dìláš tady na hradì?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//Zaslechl jsem o dracích a chtìl jsem pomoct v boji proti nim.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//Bohužel jsem ztratil svùj meè, když jsem se plížil kolem skøetù. Teï jsem tady jak v pasti.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//Bez meèe se odsud nemùžu dostat a ty meèe, co se tu dají koupit, jsou ty nejhorší krámy, co jsem kdy vidìl.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"Pøeju ti hodnì štìstí pøi hledání.",dia_djg_715_ferros_oldcamp_no);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"Co mi dáš za to, když ti seženu meè?",dia_djg_715_ferros_oldcamp_price);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"Najdu tvùj meè.",dia_djg_715_ferros_oldcamp_yes);
	Wld_InsertItem(itmw_1h_ferrossword_mis,"FP_OW_ITEM_08");
	MIS_FERROSSWORD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FERROSSWORD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERROSSWORD,LOG_RUNNING);
	b_logentry(TOPIC_FERROSSWORD,"Kdesi u skøetù ztratil Feros svùj meè - to bylo poøádnì hloupé.");
};

func void dia_djg_715_ferros_oldcamp_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//Pøeju ti hodnì štìstí pøi hledání.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//Asi bych se mìl sám sebe ptát, proè jsem vlastnì tady.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//Co mi dáš za to, když ti seženu meè?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//Bohužel ti nemùžu dát nic. Svoje poslední peníze jsem utratil za ten meè.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//Najdu tvùj meè.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//To by bylo výborné. Mìl bys ho hledat na tom strmém srázu na jihu.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//Pravdìpodobnì jsem ho ztratil poblíž skøetích stanù.
	b_logentry(TOPIC_FERROSSWORD,"Feros svùj meè nejspíš ztratil na vysokém útesu na jihu - tam, kde si skøeti rozbili své stany.");
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};


instance DIA_DJG_715_FERROS_FERROSANYSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferrosanysword_condition;
	information = dia_djg_715_ferros_ferrosanysword_info;
	permanent = FALSE;
	description = "Možná bych pro tebe mìl jiný meè.";
};


func int dia_djg_715_ferros_ferrosanysword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && ((Npc_HasItems(other,itmw_1h_special_01) >= 1) || (Npc_HasItems(other,itmw_1h_special_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferrosanysword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//Možná bych pro tebe mìl jiný meè.
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,DIALOG_BACK,dia_djg_715_ferros_ferrosanysword_back);
	if(Npc_HasItems(other,itmw_1h_special_01) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_01.name,dia_djg_715_ferros_ferrosanysword_silverblade);
	};
	if(Npc_HasItems(other,itmw_1h_special_02) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_02.name,dia_djg_715_ferros_ferrosanysword_oreblade);
	};
};

func void dia_djg_715_ferros_ferrosanysword_back()
{
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void b_ferros_ferrosanysword_give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//Je to dobrá èepel. Opravdu výjimeèná práce.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//Jseš si jistý, že mi nìco takového chceš dát?
};

func void dia_djg_715_ferros_ferrosanysword_silverblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Ne, potøebuju ho pro sebe.",dia_djg_715_ferros_ferrosanysword_silverblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Jo, vezmi si to.",dia_djg_715_ferros_ferrosanysword_silverblade_yes);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Ne, potøebuju ho pro sebe.",dia_djg_715_ferros_ferrosanysword_oreblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Jo, vezmi si to.",dia_djg_715_ferros_ferrosanysword_oreblade_yes);
};

func void b_ferros_ferrosanysword_yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//Jo, vezmi si to.
};

func void b_ferros_ferrosanysword_yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//Díky, máš to u mì.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//Na oplátku ti ukážu spoustu trikù, které ti v boji umožní lépe využívat svou sílu a obratnost.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Feros mi pomùže vylepšit sílu a obratnost.");
};

func void b_ferros_ferrosanysword_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Ne, potøebuju ho pro sebe.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Tak tomu rozumím.
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_01,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_02,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};


instance DIA_DJG_715_FERROS_FERROSHISSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferroshissword_condition;
	information = dia_djg_715_ferros_ferroshissword_info;
	permanent = FALSE;
	description = "Našel jsem tvùj meè.";
};


func int dia_djg_715_ferros_ferroshissword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && (Npc_HasItems(other,itmw_1h_ferrossword_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferroshissword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//Našel jsem tvùj meè.
	b_giveinvitems(other,self,itmw_1h_ferrossword_mis,1);
	b_ferros_ferrosanysword_yes2();
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};


instance DIA_FERROS_TEACH(C_INFO)
{
	npc = djg_715_ferros;
	nr = 1;
	condition = dia_ferros_teach_condition;
	information = dia_ferros_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak mùžu posílit své schopnosti.";
};


func int dia_ferros_teach_condition()
{
	if(MIS_FERROSSWORD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ferros_teach_info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//Ukaž mi, jak mùžu posílit své schopnosti.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//Po tìch skøetích útocích jsem s tím skonèil. Jsem rád, že jsem zùstal naživu, chlape.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//Dobrý bojovník by se mìl nauèit, jak své schopnosti pøevést pøímo na zbraò.
		Info_ClearChoices(dia_ferros_teach);
		Info_AddChoice(dia_ferros_teach,DIALOG_BACK,dia_ferros_teach_back);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
	};
};

func void dia_ferros_teach_back()
{
	Info_ClearChoices(dia_ferros_teach);
};

func void dia_ferros_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
};

func void dia_ferros_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
};

func void dia_ferros_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
};

func void dia_ferros_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
};


instance DIA_FERROS_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_ferros_alldragonsdead_condition;
	information = dia_ferros_alldragonsdead_info;
	permanent = FALSE;
	description = "Všichni draci jsou mrtví.";
};


func int dia_ferros_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_ferros_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//Dobrá práce! Kdybychom mìli víc takových lidí, nejspíš by se to nikdy nedostalo tak daleko.
};


instance DIA_FERROS_PICKPOCKET(C_INFO)
{
	npc = djg_715_ferros;
	nr = 900;
	condition = dia_ferros_pickpocket_condition;
	information = dia_ferros_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ferros_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_ferros_pickpocket_info()
{
	Info_ClearChoices(dia_ferros_pickpocket);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_BACK,dia_ferros_pickpocket_back);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_PICKPOCKET,dia_ferros_pickpocket_doit);
};

func void dia_ferros_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ferros_pickpocket);
};

func void dia_ferros_pickpocket_back()
{
	Info_ClearChoices(dia_ferros_pickpocket);
};

