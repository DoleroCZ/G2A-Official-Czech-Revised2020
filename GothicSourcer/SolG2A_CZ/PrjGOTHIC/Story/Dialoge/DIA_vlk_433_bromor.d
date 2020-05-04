
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
	description = "To je tvùj kšeft?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To je tvùj kšeft?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jsem Bromor. Tohle je mùj dùm a tohle jsou moje holky. Mám je rád.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jestli se líbí i tobì, pak za to musíš zaplatit - 50 zlaákù.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//A a tì ani nenapadne dìlat tu nìjaký bordel.
};


instance DIA_ADDON_BROMOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_addon_bromor_missingpeople_condition;
	information = dia_addon_bromor_missingpeople_info;
	description = "Jsou holky vpoøádku?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Jsou holky vpoøádku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Samozøejmì! Myslíš, že bych chtìl být ve vìzení za takovou blbost?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Hm ... Nezmiòuji jejich vìk. Možná nìkterá z nich chybí?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ach tak. Právì jedna z mých dívek zmizela - její jméno je Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Oznámil jsem to i domobranì, ale nebyli schopni sledovat její stoupu pøíliš dlouho.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Jedna z holek z Èervené lucerny v pøístavu se ztratila.");
};


instance DIA_ADDON_BROMOR_LUCIA(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_lucia_condition;
	information = dia_addon_bromor_lucia_info;
	description = "Jak dlouho už ji postrádáš?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak dlouho už ji postrádáš?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Musí to být jen pár dnù. Nevím to ale pøesnì.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Hádám, že utekla s jedním se svých nápadníkù.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//A taky utekla s mým cenným zlatým kalichem.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Kdybych ji chytil ...
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//... dal bych jí co proto, to mi vìø.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Jedna z holek jménem Lucia ukradla svému šéfovi zlaté kalichy. Bromor je chce zpìt.");
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_RUNNING;
};


instance DIA_ADDON_BROMOR_LUCIAGOLD(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_luciagold_condition;
	information = dia_addon_bromor_luciagold_info;
	permanent = TRUE;
	description = "Našel jsem ten kalich, co ti Lucia vzala.";
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
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Našel jsem ten kalich, co ti Lucia vzala.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Skvìlé!
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(BROMOR_HAUSVERBOT == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"A co nìjaká odmìna?",dia_addon_bromor_luciagold_lohn);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Tady jsou tvé kalichy.",dia_addon_bromor_luciagold_einfachgeben);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nechceš vìdìt, kde Lucia je?",dia_addon_bromor_luciagold_lucia);
	};
};

func void dia_addon_bromor_luciagold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Tady jsou tvé kalichy.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Díky, je to od tebe hezké. Chtìl bys nìco dalšího?
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


var int dia_addon_bromor_luciagold_lucia_onetime;

func void dia_addon_bromor_luciagold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nechceš vìdìt, kde je Lucia nyní?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Ne, proè? Kalichy jsou zpìt.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Obchod bìží a já se obejdu i bez ní. Pøece ji nebudu nutit.
	dia_addon_bromor_luciagold_lucia_onetime = TRUE;
};

func void dia_addon_bromor_luciagold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A co tak nìjaká odmìna?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Mùžeš mít jednu moji holku zadarmo. Souhlasíš?
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nechceš vìdìt, kde Lucia je?",dia_addon_bromor_luciagold_lucia);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Tak to ne.",dia_addon_bromor_luciagold_mehr);
	Info_AddChoice(dia_addon_bromor_luciagold,"Dohodnuto, tady jsou tvé kalichy.",dia_addon_bromor_luciagold_geben);
};

func void dia_addon_bromor_luciagold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Tak to ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//Mùžeš to pøijmout nebo se sem už nevracej.
	Info_AddChoice(dia_addon_bromor_luciagold,"Zapomeò na to.",dia_addon_bromor_luciagold_nein);
};

func void dia_addon_bromor_luciagold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Zapomìò na to.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Pak vypadni z mého obchodu, ty kriminálníku.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Neoèekávej, že tì tu nìkdy obsloužím.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	BROMOR_HAUSVERBOT = TRUE;
	BROMOR_PAY = 0;
};

func void dia_addon_bromor_luciagold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Dohodnuto, tady jsou tvé kalichy.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Díky, bìž za Nadjou. Zajde s tebou nahoru...
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
	description = "Chci se trochu pobavit (zaplatit 50 zlaákù)";
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
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fajn (zašklebí se). Na následujících pár hodin nejspíš nikdy v životì nezapomeneš.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Vyjdi s Nadjou po schodech nahoru a užij si to!
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když si ze mì nìkdo dìlá dobrý den. Jestli nemáš na zaplacení, tak odsud vymajzni.
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
	description = "Mùžu tu dostat i nìjaké 'zvláštní' zboží?";
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
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Mùžu tu dostat i nìjaké "zvláštní" zboží?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Jasnì, všechny holky jsou zvláštní (zašklebí se).
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Jestli máš dost zlata, mùžeš jít s Nadjou nahoru.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Jsi v poøádku?";
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
	description = "Ty jsi posedlý.";
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
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ty jsi posedlý.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Cože? O èem to mluvíš? Vypadni odsud!
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(Krádež tohoto klíèe by byla dosti riskantní.)";
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

