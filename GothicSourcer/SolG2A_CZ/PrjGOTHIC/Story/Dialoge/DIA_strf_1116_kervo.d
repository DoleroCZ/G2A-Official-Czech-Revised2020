
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
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Ty se pt�? Jen se kolem sebe pod�vej.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Ty zatracen� ��havci u� zabrali celou �eku.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Nejd��v byli jen dva. Ale od v�erej�ka u� jsem jich potkal minim�ln� p�t.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Nem�m ani tu�en�, jak se odsud dostat.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "Zkou�el ses dostat p�es pr�smyk?";
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
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Zkou�el ses dostat p�es pr�smyk?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Vypad�m snad jako magor? Dokud tam budou ty bestie, nedostane m� tam ani dvacet voj�k�. Nesn��m je.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//(�pln� skl��en�) Jenom je uc�t�m a u� m� pol�v� studen� pot. A z toho jejich neust�l�ho huhl�n� mi tuhne krev v �il�ch.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Jestli tak tou�� po tom, nechat si od nich st�hnout k��i za�iva, tak b� rovnou tam.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"Fajn, v tom p��pad� na to zapome�.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"Ale tady nem��e� z�stat v��n�.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"Co mi d�, kdy� ty v�ci zabiju?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Ale tady nem��e� z�stat v��n�.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Nem�m tu�en�, co po mn� vlastn� chce�, ale jedno ti �eknu: ty m� tady nenech�.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Co mi d�, kdy� ty potvory zabiju?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Hmm. Fajn. Mohlo by sta�it, kdyby zmizeli ty ��havci p�ed jeskyn�.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Na�el jsem pr�zdn� runov� k�men. Jsi m�g, tak�e by se ti mohla hodit.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Na�el jsem hroudu rudy.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//M��u ti ji d�t jako revan�.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Fajn, v tom p��pad� na to zapome�.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Jasn�, vezmu si to.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "Ty ��havci p�ed jeskyn� u� tam nejsou.";
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
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Ty ��havci p�ed jeskyn� u� tam nejsou.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//V�born�. Kone�n� se m��u znova voln� nadechnout.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Tady m�, co jsem ti sl�bil.
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
	description = "Projde� te� t�m pr�smykem?";
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
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Projde� te� t�m pr�smykem?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Na to zapome�, chlape. Kdy� m� chyt�, po�lou m� zp�tky do dol�. Z�stanu tady.
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

