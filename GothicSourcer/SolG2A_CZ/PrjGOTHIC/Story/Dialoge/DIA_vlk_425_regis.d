
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
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hej, tys v tomhle m�st� nov� co?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Ano, a co ty?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//P�i�el jsem z pevniny a te� se tu jen tak poflakuju. U� mi skoro do�ly pen�ze, tak�e mi nejsp� nezbude nic jin�ho, ne� se p�idat k domobran�.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Ale j� tam nechci. Nem�n�m se nechat ve jm�nu kr�le zab�t n�jak�mi �pinav�mi sk�ety.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "Co bys mi �ekl o domobran�?";
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
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Co bys mi �ekl o domobran�?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Vede ji jeden z paladin�, jist� Lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Pokou�� se zmobilizovat p�lku m�sta pro p��pad, �e by n�s napadli sk�eti.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Ale chce�-li se nechat najmout, mus� se nap�ed st�t ob�anem m�sta.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Pokud v�m, tak ty nejsi zdej��m ob�anem, tak�e i kdy� bude� cvi�it sebev�c, stejn� t� ofici�ln� nep�ijmou.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "Co dal��ho mi je�t� m��e� prozradit o lordu Andrem?";
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
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Co dal��ho mi je�t� m��e� prozradit o lordu Andrem?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Tak� tu zast�v� funkci soudce.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Pokud ve m�st� n�co provede�, bude� se zodpov�dat jemu.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Jednou jsem se takhle s n�k�m popral.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//On si pak �el st�ovat lordu Andremu a udal m�.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//Cel� ta z�le�itost m� p�i�la na 50 zla��k�.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//A to jsem m�l kliku, �e se to stalo v noci, a tak u toho nebyli ��dn� sv�dkov�.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//��m v�c lid� si na tebe toti� st�uje, t�m vy��� pokutu pak mus� zaplatit.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "S k�m jsi bojoval?";
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
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//S k�m jsi bojoval?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//S chl�pkem jm�nem Valentino - �asto se poflakuje kolem putyky pobl� chr�mu.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//J� tedy nejsem ��dn� n�siln�k, ale TENHLE man�k si zaslou��, aby mu n�kdo po��dn� zmaloval cifern�k.
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
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Dal jsem mu p�r facek.
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(sm�je se) Zaslou�il si to.
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Tum� - tenhle prsten jsem od n�j z�skal, kdy� se n� mal� spor urovnal.
		b_giveinvitems(self,other,itri_valentinosring,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(k�en� se) M��e� ho pak v�novat prvn�mu, kdo mu d� p�r p�es hubu.
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
	description = "Stalo se tu n�co zaj�mav�ho?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Stalo se tu n�co zaj�mav�ho?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Dalo by se to tak ��ct.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Okradli v�robce luk� Bospera - takovou drzost aby pohledal!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Ten man�k prost� za b�l�ho dne ve�el do kr�mu a rychle �majznul jeden z luk�.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//A Bosper hned za n�m a hul�kal "St�j, ty zlod�ji!" Ale lupi� byl rychlej��.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//Ale pak n�jak� poctiv� n�lezce vr�til ukraden� luk zp�tky Bosperovi.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//To je divn� - �lov�k by si myslel, �e se dnes ka�d� star� jen s�m o sebe, ale tenhle chlap byl jin� a luk vr�til.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//No, v�echno je v klidu. Po��t�m, �e a� sem p�it�hnou sk�eti, ur�it� si jich v�imneme.
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Nakonec zjistili, �e ten �old�k je nevinn�, a museli ho pustit.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen mus� b�t vzteky bez sebe.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Je toho pln� m�sto. Pamatuje� se na paladina Lothara?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Mo�n�.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Tak ten je mrtv�. Zabili ho p��mo na ulici a samoz�ejm� z toho obvinili �old�ky, jak jinak.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "Pokou��m se naj�t pos�dku na cestu po mo�i.";
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
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Pokou��m se naj�t pos�dku na cestu po mo�i.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//Tak s t�m ti nepom��u. Nejsp� by ses m�l porozhl�dnout po p��stavu nebo se poptat n�kde v hospod�.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Jestli tu z�stali je�t� n�jac� n�mo�n�ci, ur�it� je najde� tam.
};

