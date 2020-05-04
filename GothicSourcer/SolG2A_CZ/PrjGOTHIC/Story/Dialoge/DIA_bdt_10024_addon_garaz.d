
instance DIA_ADDON_GARAZ_EXIT(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 999;
	condition = dia_addon_garaz_exit_condition;
	information = dia_addon_garaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garaz_exit_condition()
{
	return TRUE;
};

func void dia_addon_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARAZ_PICKPOCKET(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 900;
	condition = dia_addon_garaz_pickpocket_condition;
	information = dia_addon_garaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_garaz_pickpocket_condition()
{
	return c_beklauen(66,80);
};

func void dia_addon_garaz_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_BACK,dia_addon_garaz_pickpocket_back);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_PICKPOCKET,dia_addon_garaz_pickpocket_doit);
};

func void dia_addon_garaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};

func void dia_addon_garaz_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};


instance DIA_ADDON_GARAZ_PROBLEME(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 2;
	condition = dia_addon_garaz_probleme_condition;
	information = dia_addon_garaz_probleme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_probleme_condition()
{
	return TRUE;
};

func void dia_addon_garaz_probleme_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Poèkej chvíli.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Nìjaký problém?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Dùlní èervi. Je jich pìkná øádka. Vypadá to, jako kdybychom narazili na hnízdo.
};


instance DIA_ADDON_GARAZ_HI(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_hi_condition;
	information = dia_addon_garaz_hi_info;
	permanent = FALSE;
	description = "Proè nezaútoèíme na ty èervy?";
};


func int dia_addon_garaz_hi_condition()
{
	if(!Npc_IsDead(bloodwyn) && (MINECRAWLER_KILLED < 9))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Proè ty èervy neznièíte?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Tomu bych se dost divil. Stráže mají pravdìpodobnì jiné 'dùležité' vìci na práci.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn mi nakázal, zbavit se toho problému.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Tuším, že ve skuteèností nezamýšlíš s èervama bojovat.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Proè bych mìl? Copak takhle se mùžeme dostat ke zlatu v jeskyni?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn bude stejnì vìtšinu chtít. A já rozhodnì nehodlám riskovat svùj zadek pro tu trochu, co by zbyla.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Pokud chceš TY s nimi bojovat - klidnì, bìž dál. Hlavnì je nenalákej sem nahoru.
};


instance DIA_ADDON_GARAZ_BLOODWYN(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 8;
	condition = dia_addon_garaz_bloodwyn_condition;
	information = dia_addon_garaz_bloodwyn_info;
	permanent = FALSE;
	description = "Ještì nìco co mi mùžeš øíct o Bloodwynovi?";
};


func int dia_addon_garaz_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garaz_hi) && (MINECRAWLER_KILLED < 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Ještì nìco, co mi mùžeš øíct o Bloodwynovi?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Jo, je to chamtivý bastard. Kontroluje každou zlatou žilku a hrudku.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Zlato je to, co ho zajímá. Nám by nedal ani hovno.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Ještì nìco?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Myslí si, že je nejlepší. Bloodwyn nedokáže vystát nìkoho, kdo je lepší než on. Jasnì, já bych se mu rozhodnì netroufl vzepøít.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Nejlepší je vyhnout se jeho pøítomnosti a neprovokovat ho - leda že bys ho chtìl fakt nasrat.
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn urèitì opustí chrám, pokud se objeví povídaèky o nalezení nové zlaté žíly tady v dole.");
	b_logentry(TOPIC_ADDON_TEMPEL,"Pokud bude Bloodwyn pøekvapený, pøestane se ovládat. To se mi urèitì bude hodit.");
};


instance DIA_ADDON_GARAZ_SIEG(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_sieg_condition;
	information = dia_addon_garaz_sieg_info;
	permanent = FALSE;
	description = "Èervi jsou mrtví.";
};


func int dia_addon_garaz_sieg_condition()
{
	if((MINECRAWLER_KILLED >= 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Skvìle, to je ono. Èervi jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn je na cestì dolù. To je to, cos chtìl, ne?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Tím myslím - povraždil jsi ty èervy, abys dostal Bloodwyna sem dolù, ne? Takže, cokoliv jsi zamýšlel udìlat, udìlej to teï.
	b_startotherroutine(bloodwyn,"GOLD");
};


instance DIA_ADDON_GARAZ_BLOOD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_blood_condition;
	information = dia_addon_garaz_blood_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_blood_condition()
{
	if(Npc_IsDead(bloodwyn) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_blood_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Dal jsi tomu bastardovi co proto. Dobrá práce.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Nyní se tedy podívám tady okolo.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	b_startotherroutine(thorus,"TALK");
};


instance DIA_ADDON_GARAZ_GOLD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_gold_condition;
	information = dia_addon_garaz_gold_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_gold_condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_gold_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Wow, chlape, tady je spousta zlata.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Potøebovali bychom se nìjak snadno k tomu zlatu nahoøe dostat.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Nicménì, nikdo už žebøíky od pádu bariéry nepoužívá....jaká škoda...
};

