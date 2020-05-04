
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hej, tys v tomhle mìstì novı co?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Ano, a co ty?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Pøišel jsem z pevniny a teï se tu jen tak poflakuju. U mi skoro došly peníze, take mi nejspíš nezbude nic jiného, ne se pøidat k domobranì.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Ale já tam nechci. Nemíním se nechat ve jménu krále zabít nìjakımi špinavımi skøety.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "Co bys mi øekl o domobranì?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Co bys mi øekl o domobranì?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Vede ji jeden z paladinù, jistı Lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Pokouší se zmobilizovat pùlku mìsta pro pøípad, e by nás napadli skøeti.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Ale chceš-li se nechat najmout, musíš se napøed stát obèanem mìsta.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Pokud vím, tak ty nejsi zdejším obèanem, take i kdy budeš cvièit sebevíc, stejnì tì oficiálnì nepøijmou.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "Co dalšího mi ještì mùeš prozradit o lordu Andrem?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Co dalšího mi ještì mùeš prozradit o lordu Andrem?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Také tu zastává funkci soudce.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Pokud ve mìstì nìco provedeš, budeš se zodpovídat jemu.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Jednou jsem se takhle s nìkım popral.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//On si pak šel stìovat lordu Andremu a udal mì.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//Celá ta záleitost mì pøišla na 50 zlaákù.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//A to jsem mìl kliku, e se to stalo v noci, a tak u toho nebyli ádní svìdkové.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Èím víc lidí si na tebe toti stìuje, tím vyšší pokutu pak musíš zaplatit.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "S kım jsi bojoval?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//S kım jsi bojoval?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//S chlápkem jménem Valentino - èasto se poflakuje kolem putyky poblí chrámu.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Já tedy nejsem ádnı násilník, ale TENHLE maník si zaslouí, aby mu nìkdo poøádnì zmaloval ciferník.
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "Setkal jsem se s Valentinem...";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Setkal jsem se s Valentinem...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//A?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Dal jsem mu pár facek.
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(smìje se) Zaslouil si to.
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Tumáš - tenhle prsten jsem od nìj získal, kdy se náš malı spor urovnal.
		b_giveinvitems(self,other,itri_valentinosring,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(køení se) Mùeš ho pak vìnovat prvnímu, kdo mu dá pár pøes hubu.
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "Stalo se tu nìco zajímavého?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Stalo se tu nìco zajímavého?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Dalo by se to tak øíct.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Okradli vırobce lukù Bospera - takovou drzost aby pohledal!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Ten maník prostì za bílého dne vešel do krámu a rychle èmajznul jeden z lukù.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//A Bosper hned za ním a hulákal "Stùj, ty zlodìji!" Ale lupiè byl rychlejší.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//Ale pak nìjakı poctivı nálezce vrátil ukradenı luk zpátky Bosperovi.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//To je divné - èlovìk by si myslel, e se dnes kadı stará jen sám o sebe, ale tenhle chlap byl jinı a luk vrátil.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//No, všechno je v klidu. Poèítám, e a sem pøitáhnou skøeti, urèitì si jich všimneme.
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Nakonec zjistili, e ten oldák je nevinnı, a museli ho pustit.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen musí bıt vzteky bez sebe.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Je toho plné mìsto. Pamatuješ se na paladina Lothara?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Moná.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Tak ten je mrtvı. Zabili ho pøímo na ulici a samozøejmì z toho obvinili oldáky, jak jinak.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "Pokouším se najít posádku na cestu po moøi.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Pokouším se najít posádku na cestu po moøi.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//Tak s tím ti nepomùu. Nejspíš by ses mìl porozhlédnout po pøístavu nebo se poptat nìkde v hospodì.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Jestli tu zùstali ještì nìjací námoøníci, urèitì je najdeš tam.
};

