
instance DIA_ADDON_LOGAN_EXIT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 999;
	condition = dia_addon_logan_exit_condition;
	information = dia_addon_logan_exit_info;
	permanent = TRUE;
	description = "Vr�t�m se pozd�ji ...";
};


func int dia_addon_logan_exit_condition()
{
	return TRUE;
};

func void dia_addon_logan_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Vr�t�m se pozd�ji ...
	if(((!MIS_HLPLOGAN == LOG_RUNNING) || (!MIS_HLPLOGAN == LOG_SUCCESS)) && (LOGAN_INSIDE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(bru��) Jasn�, ute�. J� tu budu st�t a zastav�m v�echno a v�echny, kte�� se opov�� p�ibl�it.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LOGAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 900;
	condition = dia_addon_logan_pickpocket_condition;
	information = dia_addon_logan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_logan_pickpocket_condition()
{
	return c_beklauen(59,50);
};

func void dia_addon_logan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_BACK,dia_addon_logan_pickpocket_back);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_PICKPOCKET,dia_addon_logan_pickpocket_doit);
};

func void dia_addon_logan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_logan_pickpocket);
};

func void dia_addon_logan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
};


instance DIA_ADDON_BDT_1072_LOGAN_MINE(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_mine_condition;
	information = dia_addon_logan_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_logan_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Zvl�dl jsi to, co? Dob�e, je fajn, �e mi tady pom�h�.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LOGAN_HOW2(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_how2_condition;
	information = dia_addon_logan_how2_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_logan_how2_condition()
{
	if((LOGAN_INSIDE == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_how2_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Celkem dob�e, aspo� �e jsem tady. Lucie d�l� fakt drsnou ko�alku.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Ale Esteban m� nechce pustit do dolu. Aspo� ne te�. Dostal jsem toti� jin� �kol.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//Tak�e? Co chce abys ud�lal?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//N�kdo se pokusil Estebana zavra�dit. A on by r�d v�d�l, kdo za t�m stoj�.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(�ept�) Esteban v���, �e Snaf je do toho zapleten�. M�m na n�ho d�vat pozor ...
};


instance DIA_ADDON_LOGAN_ATTENTAT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_attentat_condition;
	information = dia_addon_logan_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_logan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && (LOGAN_INSIDE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Tak�e, ty hled� chl�pky, kte�� jsou za to zodpov�dn�?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//No, j� o tom nic nev�m. M�l bych? Kdy� se to stalo, tak j� jsem sed�l celou dobu v ba�in�.
};


instance DIA_ADDON_LOGAN_HI(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_hi_condition;
	information = dia_addon_logan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_hi_condition()
{
	if((LOGAN_INSIDE == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_logan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Hele, jestli to nen� nov� tv��.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Pl�nuje� tady st�t celou dobu, nebo mi p�jde� pomoct?
	if(Npc_KnowsInfo(other,dia_addon_franco_hi))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franco se zm�nil. Mysl� si, �e by se ti hodila n�jak� pomoc. Tak co?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Z�le�� na tom, jakou p�esn� pot�ebuje� pomoc?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Mo��lov� �raloci jsou na m�j vkus p��li� bl�zko. M�li bychom jich p�r zab�t.
	Log_CreateTopic(TOPIC_ADDON_LOGAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LOGAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LOGAN,"Logan chce, abych s n�m �el lovit mo��lov� �raloky.");
};


instance DIA_ADDON_LOGAN_WHY(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_why_condition;
	information = dia_addon_logan_why_info;
	permanent = FALSE;
	description = "A co za to dostanu?";
};


func int dia_addon_logan_why_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_why_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostanu?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(bru��) Franco t� tu nech� shn�t, jestli nebud� u�ite�n�.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chce� do t�bora? No, nap�ed tu mus� trochu pomoct. Samotn� slova ti nepom��ou dos�hnout tv�ho c�le.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Tak�e, mohl bych ti uk�zat, jak zpracovat tyhle monstra.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Ale ve skute�nosti si nemysl�m, �e by t� Franco pustil jenom proto, �e jsme tu zabili p�r mo��lov�ch �ralok�.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Tady venku jsou lid�, kte�� �ekaj� daleko d�le.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//A lep�� bude, p�ipojit se tak� k t�boru ... (bru��)
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Logan m� m��e nau�it, jak z�skat ze zabit�ch zv��at k��i, dr�py a zuby.");
};


instance DIA_ADDON_LOGAN_LAGER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_lager_condition;
	information = dia_addon_logan_lager_info;
	permanent = FALSE;
	description = "Co je p�esn� v t�bo�e?";
};


func int dia_addon_logan_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Co je p�esn� v t�bo�e?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(bru��) Ot�zka sp� je, co NEN� v t�bo�e. ��dn� mo��lov� �raloci, ��dn� pitom� ba�inat� d�ra ... zkr�tka, ��DN� ba�ina, ch�pe�.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Nejenom �e tam maj� chlast a zlato, ale pokud si dob�e pamatuju, tak jsou tam i �eny, u� rozum�?
};


instance DIA_ADDON_LOGAN_MIS(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 99;
	condition = dia_addon_logan_mis_condition;
	information = dia_addon_logan_mis_info;
	permanent = FALSE;
	description = "Poj�me zab�t p�r mo��lov�ch �ralok�.";
};


func int dia_addon_logan_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Poj�me zab�t p�r mo��lov�ch �ralok�.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(bru��) Vypad� to, �e jsi pochopil, jak to tady chod�. To se mi l�b�. Do prdele ... sly�el jsi to? Sly��m je!
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//M�me to - a co budeme d�lat te�?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//P�ich�zej�. A jde jim o to, aby si z n�s ukousli po��dn� kousek. Tak�e, poj�me se mrknout kdo z koho. Na n�.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HLPLOGAN = LOG_RUNNING;
	Wld_InsertNpc(mis_addon_swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(mis_addon_swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(mis_addon_swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_ADDON_LOGAN_TOT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_tot_condition;
	information = dia_addon_logan_tot_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_tot_condition()
{
	if(Npc_IsDead(mis_addon_swampshark_01) && Npc_IsDead(mis_addon_swampshark_02) && Npc_IsDead(mis_addon_swampshark_03) && Npc_KnowsInfo(other,dia_addon_logan_mis))
	{
		return TRUE;
	};
};

func void dia_addon_logan_tot_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Mrtv� �ralok, dobr� �ralok. To by m�lo b�t varov�n� pro ostatn�.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Ok, je�t� n�co? Jinak odejdu.
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Je�t� ne. V�, kde hledat jestli se bude� cht�t n�co nau�it.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HLPLOGAN = LOG_SUCCESS;
	b_checklog();
	b_logentry(TOPIC_ADDON_FRANCO,"Pomohl jsem Loganovi. Je �as se j�t mrknout, jestli je Franco spokojen�.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_LOGAN_LERN(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 100;
	condition = dia_addon_logan_lern_condition;
	information = dia_addon_logan_lern_info;
	permanent = FALSE;
	description = "Uka� mi, jak zpracovat zv��ata ...";
};


func int dia_addon_logan_lern_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lern_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Uka� mi, jak zpracovat zv��ata ...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Jestli chce� v�d�t v�c o krvav�ch mouch�ch, zeptej se sp� Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Jestli chce� v�d�t, jak zpracovat mo��lov� �raloky nebo je�t�rky, tak by bylo dobr� v�d�t, jak jim st�hnout k��i a od��znout jim zuby. Tohle ti m��u uk�zat.
};


instance DIA_ADDON_LOGAN_ALLG(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_allg_condition;
	information = dia_addon_logan_allg_info;
	permanent = TRUE;
	description = "Chci se nau�it ...";
};


func int dia_addon_logan_allg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_logan_allg_info()
{
	Info_ClearChoices(dia_addon_logan_allg);
	Info_AddChoice(dia_addon_logan_allg,DIALOG_BACK,dia_addon_logan_allg_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Vytahov�n� zub�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_logan_allg_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Odseknut� dr�p�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_addon_logan_allg_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("St�hnout k��i",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_addon_logan_allg_fur);
	};
};

func void dia_addon_logan_allg_back()
{
	Info_ClearChoices(dia_addon_logan_allg);
};

func void dia_addon_logan_allg_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void dia_addon_logan_allg_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void dia_addon_logan_allg_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};


var int logan_lohn;

instance DIA_ADDON_LOGAN_HACKER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_hacker_condition;
	information = dia_addon_logan_hacker_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_addon_logan_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_logan_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, mus�m ti pod�kovat! M�m povolen� ke vstupu do dolu!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Moc toho o kop�n� zlata nev�m, ale n�jak ho dostanu.
	if(LOGAN_LOHN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//U� um�m z�klady. Zap�i se siln� nohama a bouchni tak siln�, jak jen m��e�!
		b_upgrade_hero_hackchance(10);
		LOGAN_LOHN = TRUE;
	};
};

