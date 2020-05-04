
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	description = "Co tady pohled�v�?";
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Co tady pohled�v�?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//P�ich�z�m z hradu. Poslali m�, abych na�el ty poh�e�ovan� a zkontroloval tuhle oblast.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "Poh�e�ovan�?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Poh�e�ovan�?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//N�kter�m se poda�ilo uniknout, kdy� za�to�ili draci. V�t�ina z nich to nestihla - a nen� divu!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Ale pokud n�kdo p�e�il, vezmu ho s sebou zp�tky.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "M��e� mi pomoct dostat se do hradu?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//M��e� mi pomoct dostat se do hradu?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Jasn�, ale mus� mi prok�zat laskavost.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Jestli se ti poda�� dostat se do hradu, promluv si s paladinem Oricem. Vy�i� mu, �e jeho bratr to tady v pr�smyku koupil.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"A� se dostanu do hradu, mus�m Oricovi vy��dit, �e jeho bratr se z��til z pr�smyku.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "Co bych m�l v�d�t o t�to oblasti?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	if(JERGAN_TELL == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co bych m�l v�d�t o t�to oblasti?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Jestli chce� ��t, vra� se, odkud jsi p�i�el.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Zelenoko�ci obl�haj� hrad u� t�dny - a n�kde se tu ukr�vaj� draci.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Cel� Hornick� �dol� se hem�� sk�ety - a� m� nam��eno kamkoliv, nebude to proch�zka r��ovou zahradou.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "Jak se dostanu do hradu?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak se dostanu do hradu?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Na p��mou cestu rovnou zapome�. Ale pokud obejde� hrad, mo�n� se tam dostane� zezadu.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//M�l bys z�stat mimo cestu a vyu��t �eku. Nejlep�� bude, kdy� poplave� po proudu. Odtud by to m�lo b�t snaz��.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Sk�eti p�ed hradem postavili beranidlo. M��e� se dostat dovnit� t�mto zp�sobem - p�ipl�� se k t�m bastard�m, jak jen to bude mo�n�, a potom bude� upalovat, co to jen p�jde.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Pokud bude� dostate�n� rychl�, m�l bys to zvl�dnout.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jsem zv�d. Toul�m se po kraji. Ale v�ichni ti ch�apavci mi to zt�uj�.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//Je vhodn� doba k z�sk�n� n�jak�ch trofej� - za p�edpokladu, �e v�, co d�l�.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Nau�� m�, jak na to?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Nau�� m�, jak na to?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//M��u ti uk�zat, jak z jejich mrtvol vytrhnout dr�py.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(Nau�it se vyj�mat dr�py.)";
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Uka� mi, jak vytrhnout dr�py.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//D�le�it� je odstranit dr�py �kubnut�m. P��li� nev�hej a ner�pej �epel�.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//T�mto zp�sobem nevytrhne� dr�py jenom ch�apavc�m, ale tak� je�t�r�m a st�nov�m �elm�m.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "V�, kam se pod�l Diego?";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//V�, kam se pod�l Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? Byl jedn�m ze Silvestrov�ch kop���. Ale vypa�il se.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Vid�l jsem ho nedaleko odtud se dv�mi ryt��i a krabic�.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Vid� tady tu starou str�n� v�? Jdi t�m sm�rem a potom k hradu.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Cesta vede sk�lami vpravo. To je ta cesta, kterou �li.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Tak ty jsi zabil v�dce bandy. A z�skal jsi z t� bestie dr�py?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Ano.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Ty mus� m�t jist� velkou cenu. Je tu n�kolik chlap�k�, kte�� takov� v�ci sb�raj�.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Pokud najde� spr�vn�ho kupce, dostane� za to kopec zlata.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Ne.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//M�l bys to ud�lat. Jsem si jist, �e za n� dostane� majlant.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};

