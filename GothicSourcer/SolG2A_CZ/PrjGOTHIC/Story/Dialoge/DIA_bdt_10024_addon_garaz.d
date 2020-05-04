
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
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Po�kej chv�li.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//N�jak� probl�m?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//D�ln� �ervi. Je jich p�kn� ��dka. Vypad� to, jako kdybychom narazili na hn�zdo.
};


instance DIA_ADDON_GARAZ_HI(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_hi_condition;
	information = dia_addon_garaz_hi_info;
	permanent = FALSE;
	description = "Pro� neza�to��me na ty �ervy?";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Pro� ty �ervy nezni��te?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Tomu bych se dost divil. Str�e maj� pravd�podobn� jin� 'd�le�it�' v�ci na pr�ci.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn mi nak�zal, zbavit se toho probl�mu.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Tu��m, �e ve skute�nost� nezam��l� s �ervama bojovat.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Pro� bych m�l? Copak takhle se m��eme dostat ke zlatu v jeskyni?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn bude stejn� v�t�inu cht�t. A j� rozhodn� nehodl�m riskovat sv�j zadek pro tu trochu, co by zbyla.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Pokud chce� TY s nimi bojovat - klidn�, b� d�l. Hlavn� je nenal�kej sem nahoru.
};


instance DIA_ADDON_GARAZ_BLOODWYN(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 8;
	condition = dia_addon_garaz_bloodwyn_condition;
	information = dia_addon_garaz_bloodwyn_info;
	permanent = FALSE;
	description = "Je�t� n�co co mi m��e� ��ct o Bloodwynovi?";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Je�t� n�co, co mi m��e� ��ct o Bloodwynovi?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Jo, je to chamtiv� bastard. Kontroluje ka�dou zlatou �ilku a hrudku.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Zlato je to, co ho zaj�m�. N�m by nedal ani hovno.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Je�t� n�co?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Mysl� si, �e je nejlep��. Bloodwyn nedok�e vyst�t n�koho, kdo je lep�� ne� on. Jasn�, j� bych se mu rozhodn� netroufl vzep��t.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Nejlep�� je vyhnout se jeho p��tomnosti a neprovokovat ho - leda �e bys ho cht�l fakt nasrat.
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn ur�it� opust� chr�m, pokud se objev� pov�da�ky o nalezen� nov� zlat� ��ly tady v dole.");
	b_logentry(TOPIC_ADDON_TEMPEL,"Pokud bude Bloodwyn p�ekvapen�, p�estane se ovl�dat. To se mi ur�it� bude hodit.");
};


instance DIA_ADDON_GARAZ_SIEG(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_sieg_condition;
	information = dia_addon_garaz_sieg_info;
	permanent = FALSE;
	description = "�ervi jsou mrtv�.";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Skv�le, to je ono. �ervi jsou mrtv�.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn je na cest� dol�. To je to, cos cht�l, ne?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//T�m mysl�m - povra�dil jsi ty �ervy, abys dostal Bloodwyna sem dol�, ne? Tak�e, cokoliv jsi zam��lel ud�lat, ud�lej to te�.
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
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Dal jsi tomu bastardovi co proto. Dobr� pr�ce.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Nyn� se tedy pod�v�m tady okolo.
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
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Pot�ebovali bychom se n�jak snadno k tomu zlatu naho�e dostat.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Nicm�n�, nikdo u� �eb��ky od p�du bari�ry nepou��v�....jak� �koda...
};

