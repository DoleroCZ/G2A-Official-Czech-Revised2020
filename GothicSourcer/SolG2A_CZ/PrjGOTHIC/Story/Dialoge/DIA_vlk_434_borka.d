
instance DIA_BORKA_EXIT(C_INFO)
{
	npc = vlk_434_borka;
	nr = 999;
	condition = dia_borka_exit_condition;
	information = dia_borka_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_borka_exit_condition()
{
	return TRUE;
};

func void dia_borka_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_PICKPOCKET(C_INFO)
{
	npc = vlk_434_borka;
	nr = 900;
	condition = dia_borka_pickpocket_condition;
	information = dia_borka_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_borka_pickpocket_condition()
{
	return c_beklauen(80,120);
};

func void dia_borka_pickpocket_info()
{
	Info_ClearChoices(dia_borka_pickpocket);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_BACK,dia_borka_pickpocket_back);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_PICKPOCKET,dia_borka_pickpocket_doit);
};

func void dia_borka_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_borka_pickpocket);
};

func void dia_borka_pickpocket_back()
{
	Info_ClearChoices(dia_borka_pickpocket);
};


instance DIA_BORKA_PISSOFF(C_INFO)
{
	npc = vlk_434_borka;
	condition = dia_borka_pissoff_condition;
	information = dia_borka_pissoff_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_borka_pissoff_condition()
{
	if((KNOWS_BORKA_DEALER != TRUE) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return TRUE;
	};
};

func void dia_borka_pissoff_info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//Hej, ty! Jak se vede? Nez�le�� na tom, co m� v pl�nu - na to bude dost �asu pozd�ji.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//Stoj� p��mo p�ed perlou Khorinisu - �ERVENOU LUCERNOU. Je to ten nejkr�sn�j�� nev�stinec v cel� Myrtan�, to si pi�!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//Kotv� tu n�mo�n�ci ze v�ech kout� zem�, jen aby tu mohli str�vit p�r noc�.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//A te� m� tuhle �anci - ne, �est - pr�v� ty! M��e� str�vit noc s Nadjou, nejv�niv�j��m kv�tem, jak� kdy bohov� stvo�ili!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//Poj� d�l a u�ij si to, o �em se jin�m ani nesnilo!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_TROUBLE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_trouble_condition;
	information = dia_borka_trouble_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_trouble_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ANDRE_REDLIGHT != LOG_RUNNING) && (Npc_IsDead(nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void dia_borka_trouble_info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//Pro� post�v� takhle stranou? Poj� d�l a uvid� na�i v�nivou Nadju.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//Plameny, kter� v tob� tahle no�n� bytost za�ehne, daj� tv�mu �ivotu nov� smysl!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_SMOKE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_smoke_condition;
	information = dia_borka_smoke_info;
	permanent = TRUE;
	description = "Nev�, kde bych si mohl koupit n�jak� ku�ivo - tr�vu nebo n�co takov�ho?";
};


func int dia_borka_smoke_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_smoke_info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//Nev�, kde bych si mohl koupit n�jak� ku�ivo - tr�vu nebo n�co takov�ho?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//Ne, jdi do hajzlu.
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_BUYHERB(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_buyherb_condition;
	information = dia_borka_buyherb_info;
	permanent = TRUE;
	description = "Sly�el jsem, �e prod�v� drogy.";
};


func int dia_borka_buyherb_condition()
{
	if((KNOWS_BORKA_DEALER == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (BORKA_DEAL == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//Sly�el jsem, �e prod�v� drogy.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//Omlouv�m se, pane str�n�k. To mus� b�t n�jak� m�lka, o ��dn�ch drog�ch nic nev�m.
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//To ��k� kdo?
		Info_ClearChoices(dia_borka_buyherb);
		Info_AddChoice(dia_borka_buyherb,"To sem nepat��.",dia_borka_buyherb_egal);
		Info_AddChoice(dia_borka_buyherb,"Nadja.",dia_borka_buyherb_nadja);
	};
};

func void dia_borka_buyherb_egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//To sem nepat��.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//Jenom chci v�d�t, kdo t� pos�l�, abych m�l jistotu, �e jsi v po��dku.
	Info_ClearChoices(dia_borka_buyherb);
	Info_AddChoice(dia_borka_buyherb,"Nadja.",dia_borka_buyherb_nadja);
	Info_AddChoice(dia_borka_buyherb,"Tak chce� uzav��t obchod, nebo ne?",dia_borka_buyherb_deal);
};

func void dia_borka_buyherb_nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//Nadja.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//Co ty v� - pt��ek si prost� za�t�betal. Nem��e� v��it v�emu, co ti ta holka nakuk�.
	NADJA_VICTIM = TRUE;
	UNDERCOVER_FAILED = TRUE;
	Info_ClearChoices(dia_borka_buyherb);
};

func void dia_borka_buyherb_deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//Tak chce� uzav��t obchod, nebo ne?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//...no dob�e... tak tedy budeme obchodovat. Dej mi 50 zla��k� a j� ti je vym�n�m za drogu. A ��dn� smlouv�n�.
	Info_ClearChoices(dia_borka_buyherb);
	BORKA_DEAL = TRUE;
};


instance DIA_BORKA_SECOND_CHANCE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_second_chance_condition;
	information = dia_borka_second_chance_info;
	permanent = TRUE;
	description = "Tak uzav�eme obchod (zaplatit 50 zla��k�).";
};


func int dia_borka_second_chance_condition()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((BORKA_DEAL == TRUE) && (Npc_HasItems(other,itmi_gold) >= 50) && (Hlp_IsItem(heroarmor,itar_mil_l) == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_second_chance_info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//Tak dob�e, tady je to zlato.
	b_giveinvitems(hero,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//Dobr�...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//...tady je �erstv�, prysky�ic� vylep�en� joint.
	b_giveinvitems(self,hero,itmi_joint,1);
	BORKA_DEAL = 2;
	AI_StopProcessInfos(self);
};

