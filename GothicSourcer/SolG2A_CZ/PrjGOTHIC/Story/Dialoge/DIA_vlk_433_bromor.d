
instance DIA_BROMOR_EXIT(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 999;
	condition = dia_bromor_exit_condition;
	information = dia_bromor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bromor_exit_condition()
{
	return TRUE;
};

func void dia_bromor_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_GIRLS(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_girls_condition;
	information = dia_bromor_girls_info;
	permanent = FALSE;
	description = "To je tv�j k�eft?";
};


func int dia_bromor_girls_condition()
{
	if(NPCOBSESSEDBYDMT_BROMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_bromor_girls_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To je tv�j k�eft?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jsem Bromor. Tohle je m�j d�m a tohle jsou moje holky. M�m je r�d.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jestli se l�b� i tob�, pak za to mus� zaplatit - 50 zla��k�.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//A a� t� ani nenapadne d�lat tu n�jak� bordel.
};


instance DIA_ADDON_BROMOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_addon_bromor_missingpeople_condition;
	information = dia_addon_bromor_missingpeople_info;
	description = "Jsou holky vpo��dku?";
};


func int dia_addon_bromor_missingpeople_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_bromor_girls))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Jsou holky vpo��dku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Samoz�ejm�! Mysl�, �e bych cht�l b�t ve v�zen� za takovou blbost?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Hm ... Nezmi�uji jejich v�k. Mo�n� n�kter� z nich chyb�?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ach tak. Pr�v� jedna z m�ch d�vek zmizela - jej� jm�no je Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Ozn�mil jsem to i domobran�, ale nebyli schopni sledovat jej� stoupu p��li� dlouho.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Jedna z holek z �erven� lucerny v p��stavu se ztratila.");
};


instance DIA_ADDON_BROMOR_LUCIA(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_lucia_condition;
	information = dia_addon_bromor_lucia_info;
	description = "Jak dlouho u� ji postr�d�?";
};


func int dia_addon_bromor_lucia_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_addon_bromor_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_lucia_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak dlouho u� ji postr�d�?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Mus� to b�t jen p�r dn�. Nev�m to ale p�esn�.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//H�d�m, �e utekla s jedn�m se sv�ch n�padn�k�.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//A taky utekla s m�m cenn�m zlat�m kalichem.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Kdybych ji chytil ...
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//... dal bych j� co proto, to mi v��.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Jedna z holek jm�nem Lucia ukradla sv�mu ��fovi zlat� kalichy. Bromor je chce zp�t.");
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_RUNNING;
};


instance DIA_ADDON_BROMOR_LUCIAGOLD(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_luciagold_condition;
	information = dia_addon_bromor_luciagold_info;
	permanent = TRUE;
	description = "Na�el jsem ten kalich, co ti Lucia vzala.";
};


func int dia_addon_bromor_luciagold_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING) && Npc_HasItems(other,itmi_bromorsgeld_addon))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_luciagold_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Na�el jsem ten kalich, co ti Lucia vzala.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Skv�l�!
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(BROMOR_HAUSVERBOT == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"A co n�jak� odm�na?",dia_addon_bromor_luciagold_lohn);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Tady jsou tv� kalichy.",dia_addon_bromor_luciagold_einfachgeben);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nechce� v�d�t, kde Lucia je?",dia_addon_bromor_luciagold_lucia);
	};
};

func void dia_addon_bromor_luciagold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Tady jsou tv� kalichy.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//D�ky, je to od tebe hezk�. Cht�l bys n�co dal��ho?
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


var int dia_addon_bromor_luciagold_lucia_onetime;

func void dia_addon_bromor_luciagold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nechce� v�d�t, kde je Lucia nyn�?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Ne, pro�? Kalichy jsou zp�t.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Obchod b�� a j� se obejdu i bez n�. P�ece ji nebudu nutit.
	dia_addon_bromor_luciagold_lucia_onetime = TRUE;
};

func void dia_addon_bromor_luciagold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A co tak n�jak� odm�na?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//M��e� m�t jednu moji holku zadarmo. Souhlas�?
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nechce� v�d�t, kde Lucia je?",dia_addon_bromor_luciagold_lucia);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Tak to ne.",dia_addon_bromor_luciagold_mehr);
	Info_AddChoice(dia_addon_bromor_luciagold,"Dohodnuto, tady jsou tv� kalichy.",dia_addon_bromor_luciagold_geben);
};

func void dia_addon_bromor_luciagold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Tak to ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//M��e� to p�ijmout nebo se sem u� nevracej.
	Info_AddChoice(dia_addon_bromor_luciagold,"Zapome� na to.",dia_addon_bromor_luciagold_nein);
};

func void dia_addon_bromor_luciagold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Zapom�� na to.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Pak vypadni z m�ho obchodu, ty krimin�ln�ku.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Neo�ek�vej, �e t� tu n�kdy obslou��m.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	BROMOR_HAUSVERBOT = TRUE;
	BROMOR_PAY = 0;
};

func void dia_addon_bromor_luciagold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Dohodnuto, tady jsou tv� kalichy.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//D�ky, b� za Nadjou. Zajde s tebou nahoru...
	BROMOR_PAY = 1;
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


instance DIA_BROMOR_PAY(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_pay_condition;
	information = dia_bromor_pay_info;
	permanent = TRUE;
	description = "Chci se trochu pobavit (zaplatit 50 zla��k�)";
};


func int dia_bromor_pay_condition()
{
	if((BROMOR_PAY == FALSE) && (BROMOR_HAUSVERBOT == FALSE) && Npc_KnowsInfo(other,dia_bromor_girls) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (Npc_IsDead(nadja) == FALSE))
	{
		return TRUE;
	};
};


var int dia_bromor_pay_onetime;

func void dia_bromor_pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chci se trochu pobavit.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fajn (za�kleb� se). Na n�sleduj�c�ch p�r hodin nejsp� nikdy v �ivot� nezapomene�.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Vyjdi s Nadjou po schodech nahoru a u�ij si to!
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesn��m, kdy� si ze m� n�kdo d�l� dobr� den. Jestli nem� na zaplacen�, tak odsud vymajzni.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_DOPE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 3;
	condition = dia_bromor_dope_condition;
	information = dia_bromor_dope_info;
	permanent = FALSE;
	description = "M��u tu dostat i n�jak� 'zvl�tn�' zbo��?";
};


func int dia_bromor_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (BROMOR_HAUSVERBOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bromor_dope_info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//M��u tu dostat i n�jak� "zvl�tn�" zbo��?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Jasn�, v�echny holky jsou zvl�tn� (za�kleb� se).
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Jestli m� dost zlata, m��e� j�t s Nadjou nahoru.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Jsi v po��dku?";
};


func int dia_bromor_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_bromor_obsession_gotmoney;

func void dia_bromor_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_BROMOR_HEILUNG(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 55;
	condition = dia_bromor_heilung_condition;
	information = dia_bromor_heilung_info;
	permanent = TRUE;
	description = "Ty jsi posedl�.";
};


func int dia_bromor_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_bromor_heilung_info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ty jsi posedl�.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Co�e? O �em to mluv�? Vypadni odsud!
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(Kr�de� tohoto kl��e by byla dosti riskantn�.)";
};


func int dia_bromor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bromor_pickpocket_info()
{
	Info_ClearChoices(dia_bromor_pickpocket);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_BACK,dia_bromor_pickpocket_back);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_PICKPOCKET,dia_bromor_pickpocket_doit);
};

func void dia_bromor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_bromor,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bromor_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bromor_pickpocket_back()
{
	Info_ClearChoices(dia_bromor_pickpocket);
};

