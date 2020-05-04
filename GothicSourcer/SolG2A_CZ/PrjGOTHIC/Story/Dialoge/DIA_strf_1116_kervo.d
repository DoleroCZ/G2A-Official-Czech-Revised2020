
instance DIA_KERVO_EXIT(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 999;
	condition = dia_kervo_exit_condition;
	information = dia_kervo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kervo_exit_condition()
{
	return TRUE;
};

func void dia_kervo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_WASIST(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 4;
	condition = dia_kervo_wasist_condition;
	information = dia_kervo_wasist_info;
	description = "Co je s tebou?";
};


func int dia_kervo_wasist_condition()
{
	return TRUE;
};

func void dia_kervo_wasist_info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//Co je s tebou?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Ty se ptáš? Jen se kolem sebe podívej.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Ty zatracený èíhavci už zabrali celou øeku.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Nejdøív byli jen dva. Ale od vèerejška už jsem jich potkal minimálnì pìt.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Nemám ani tušení, jak se odsud dostat.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "Zkoušel ses dostat pøes prùsmyk?";
};


func int dia_kervo_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_kervo_wasist))
	{
		return TRUE;
	};
};

func void dia_kervo_hilfe_info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Zkoušel ses dostat pøes prùsmyk?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Vypadám snad jako magor? Dokud tam budou ty bestie, nedostane mì tam ani dvacet vojákù. Nesnáším je.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//(úplnì sklíèenì) Jenom je ucítím a už mì polévá studený pot. A z toho jejich neustálýho huhlání mi tuhne krev v žilách.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Jestli tak toužíš po tom, nechat si od nich stáhnout kùži zaživa, tak bìž rovnou tam.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"Fajn, v tom pøípadì na to zapomeò.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"Ale tady nemùžeš zùstat vìènì.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"Co mi dáš, když ty vìci zabiju?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Ale tady nemùžeš zùstat vìènì.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Nemám tušení, co po mnì vlastnì chceš, ale jedno ti øeknu: ty mì tady nenecháš.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Co mi dáš, když ty potvory zabiju?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Hmm. Fajn. Mohlo by staèit, kdyby zmizeli ty èíhavci pøed jeskyní.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Našel jsem prázdný runový kámen. Jsi mág, takže by se ti mohla hodit.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Našel jsem hroudu rudy.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//Mùžu ti ji dát jako revanš.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Fajn, v tom pøípadì na to zapomeò.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Jasnì, vezmu si to.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "Ty èíhavci pøed jeskyní už tam nejsou.";
};


func int dia_kervo_lurkerplatt_condition()
{
	if((MIS_KERVO_KILLLURKER == LOG_RUNNING) && Npc_IsDead(kervo_lurker1) && Npc_IsDead(kervo_lurker2) && Npc_IsDead(kervo_lurker3) && Npc_IsDead(kervo_lurker4) && Npc_IsDead(kervo_lurker5) && Npc_IsDead(kervo_lurker6))
	{
		return TRUE;
	};
};

func void dia_kervo_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Ty èíhavci pøed jeskyní už tam nejsou.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Výbornì. Koneènì se mùžu znova volnì nadechnout.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Tady máš, co jsem ti slíbil.
		if(hero.guild == GIL_KDF)
		{
			b_giveinvitems(self,other,itmi_runeblank,1);
		}
		else
		{
			b_giveinvitems(self,other,itmi_nugget,1);
		};
	};
	b_giveplayerxp(XP_KERVOKILLLURKER);
	MIS_KERVO_KILLLURKER = LOG_SUCCESS;
};


instance DIA_KERVO_VERGISSES(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_vergisses_condition;
	information = dia_kervo_vergisses_info;
	permanent = TRUE;
	description = "Projdeš teï tím prùsmykem?";
};


func int dia_kervo_vergisses_condition()
{
	if(MIS_KERVO_KILLLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_kervo_vergisses_info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Projdeš teï tím prùsmykem?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Na to zapomeò, chlape. Když mì chytí, pošlou mì zpátky do dolù. Zùstanu tady.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_PICKPOCKET(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 900;
	condition = dia_kervo_pickpocket_condition;
	information = dia_kervo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kervo_pickpocket_condition()
{
	return c_beklauen(34,10);
};

func void dia_kervo_pickpocket_info()
{
	Info_ClearChoices(dia_kervo_pickpocket);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_BACK,dia_kervo_pickpocket_back);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_PICKPOCKET,dia_kervo_pickpocket_doit);
};

func void dia_kervo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kervo_pickpocket);
};

func void dia_kervo_pickpocket_back()
{
	Info_ClearChoices(dia_kervo_pickpocket);
};

