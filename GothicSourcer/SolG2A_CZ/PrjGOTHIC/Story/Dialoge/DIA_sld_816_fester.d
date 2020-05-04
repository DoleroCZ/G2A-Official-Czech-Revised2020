
instance DIA_FESTER_EXIT(C_INFO)
{
	npc = sld_816_fester;
	nr = 999;
	condition = dia_fester_exit_condition;
	information = dia_fester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fester_exit_condition()
{
	return TRUE;
};

func void dia_fester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_HELLO(C_INFO)
{
	npc = sld_816_fester;
	nr = 1;
	condition = dia_fester_hello_condition;
	information = dia_fester_hello_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_fester_hello_condition()
{
	return TRUE;
};

func void dia_fester_hello_info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//P�ipravuju se na boj.
};


instance DIA_FESTER_AUFTRAG(C_INFO)
{
	npc = sld_816_fester;
	nr = 2;
	condition = dia_fester_auftrag_condition;
	information = dia_fester_auftrag_info;
	permanent = FALSE;
	description = "Pro�?";
};


func int dia_fester_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_hello))
	{
		return TRUE;
	};
};

func void dia_fester_auftrag_info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Pro�?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Posledn� dobou maj� sedl�ci ��m d�l v�t�� probl�my s poln�mi �k�dci.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//Jen p�r se jich n�jak u�iv�.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//Tlust�mu Onarovi to ale zrovna z�bavn� nep�ipad�. Nikdo z n�s u� p�es t�den nedostal v�platu.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//A v�cem�n� to byla moje chyba. Lee te� chce, abych s�m zlikvidoval hn�zdo t�ch potvor.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//A ostatn� kluci se s�zej�, jestli to p�e�iju, nebo ne.
};


instance DIA_FESTER_YOUFIGHT(C_INFO)
{
	npc = sld_816_fester;
	nr = 3;
	condition = dia_fester_youfight_condition;
	information = dia_fester_youfight_info;
	permanent = FALSE;
	description = "Jsi dobr� bojovn�k?";
};


func int dia_fester_youfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_hello) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_youfight_info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Jsi dobr� bojovn�k?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//S me�em to celkem um�m, ale s lukem zach�z�m mnohem l�p. Pro� se pt�?
};


instance DIA_FESTER_WONEST(C_INFO)
{
	npc = sld_816_fester;
	nr = 4;
	condition = dia_fester_wonest_condition;
	information = dia_fester_wonest_info;
	permanent = FALSE;
	description = "Kde je to hn�zdo?";
};


func int dia_fester_wonest_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_auftrag) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_wonest_info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Kde je to hn�zdo?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//Tady vedle pole, v t� mal� jeskyni.
};


var int fester_choice;
const int FC_GOLD = 0;
const int FC_JOIN = 1;

instance DIA_FESTER_TOGETHER(C_INFO)
{
	npc = sld_816_fester;
	nr = 5;
	condition = dia_fester_together_condition;
	information = dia_fester_together_info;
	permanent = FALSE;
	description = "Tak na to hn�zdo m��eme za�to�it spole�n�.";
};


func int dia_fester_together_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_auftrag))
	{
		return TRUE;
	};
};

func void dia_fester_together_info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//Tak na to hn�zdo m��eme za�to�it spole�n�.
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//Ty mi chce� pomoct? Pro�?
	Info_ClearChoices(dia_fester_together);
	Info_AddChoice(dia_fester_together,"R�d bych vid�l n�jak� pra�ule!",dia_fester_together_gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_fester_together,"R�d bych se k v�m p�idal!",dia_fester_together_join);
	};
};

func void dia_fester_together_join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//R�d bych se k v�m p�idal!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Aha, tak je to tedy. Chce� dok�zat, jak jsi dobr�.
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(vychytrale) Dob�e, tak na to hn�zdo za�to��me spole�n�.
	FESTER_CHOICE = FC_JOIN;
	Info_ClearChoices(dia_fester_together);
};

func void dia_fester_together_gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//R�d bych vid�l n�jak� pra�ule!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(sm�je se) Ty hajzle! Chce� t�it z m� situace, co?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//Bu� ti ale zaplat�m, nebo budu brzo �r�t hl�nu.
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//No dob�e. D�m ti 50 zla��k� - v�c nem�m.
	FESTER_CHOICE = FC_GOLD;
	Info_ClearChoices(dia_fester_together);
};


var int fester_losgeh_day;

instance DIA_FESTER_TOGETHERNOW(C_INFO)
{
	npc = sld_816_fester;
	nr = 6;
	condition = dia_fester_togethernow_condition;
	information = dia_fester_togethernow_info;
	permanent = TRUE;
	description = "Tak poj�me na to hn�zdo!";
};


func int dia_fester_togethernow_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_together) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_togethernow_info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Tak poj�me na to hn�zdo!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//Potm�? Ne ne, rad�i bychom to m�li ud�lat ve dne.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Te�? Nepot�ebuje� se nejd��v trochu vybavit?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//M�l by sis je�t� doj�t na statek.
		Info_ClearChoices(dia_fester_togethernow);
		Info_AddChoice(dia_fester_togethernow,"No dob�e, tak tedy je�t� chv�li po�kejme.",dia_fester_togethernow_later);
		Info_AddChoice(dia_fester_togethernow,"Jindy u� nebude takov� p��le�itost.",dia_fester_togethernow_now);
	};
};

func void dia_fester_togethernow_now()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//Jindy u� nebude takov� p��le�itost.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//Fajn, tak uvid�me, co v tob� je.
	Npc_ExchangeRoutine(self,"GUIDE");
	FESTER_LOSGEH_DAY = b_getdayplus();
	MIS_FESTER_KILLBUGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FESTERRAUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FESTERRAUBER,LOG_RUNNING);
	b_logentry(TOPIC_FESTERRAUBER,"Spolu s Festerem zni��me hn�zdo poln�ch �k�dc�.");
	Info_ClearChoices(dia_fester_togethernow);
	AI_StopProcessInfos(self);
};

func void dia_fester_togethernow_later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//No dob�e, tak tedy je�t� chv�li po�kejme.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//V�, kde m� najde�.
	Info_ClearChoices(dia_fester_togethernow);
};


instance DIA_FESTER_INCAVE(C_INFO)
{
	npc = sld_816_fester;
	nr = 7;
	condition = dia_fester_incave_condition;
	information = dia_fester_incave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fester_incave_condition()
{
	if((MIS_FESTER_KILLBUGS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
		return TRUE;
	};
};

func void dia_fester_incave_info()
{
	if(Wld_GetDay() > FESTER_LOSGEH_DAY)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Kde k �ertu v�z�?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//Tak�e sem zavl�kaj� mrtv� sedl�ky. To je ale humus.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//My jsme ale s t�mi �pinav�mi zr�dami skoncovali.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Vra�me se!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_WASMITABMACHUNG(C_INFO)
{
	npc = sld_816_fester;
	nr = 8;
	condition = dia_fester_wasmitabmachung_condition;
	information = dia_fester_wasmitabmachung_info;
	permanent = FALSE;
	description = "A co na�e dohoda?";
};


func int dia_fester_wasmitabmachung_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_incave))
	{
		return TRUE;
	};
};

func void dia_fester_wasmitabmachung_info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//A co na�e dohoda?
	if(FESTERS_GIANT_BUG_KILLED == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//D�l� si srandu? V�dy� jsi neud�lal v�bec nic!
	}
	else if(FESTER_CHOICE == FC_JOIN)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//No, m��u ti pomoct, abychom t� vzali mezi sebe, ale neud�l�m to.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//A pro�?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//Kdybych n�komu vy�vanil, �es mi pomohl, dali by mi n�jakou jinou pr�ci.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//Ur�it� ch�pe�, �e to by se mi zrovna nel�bilo.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//No, je to sm�la, hochu. Ur�it� ale najde� n�koho jin�ho, kdo ti pom��e.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Hej, tys cht�l t�it z m� situace. Tak�e te� zase trochu j� zneu�iju t� tv�.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//Ber to ale z t� lep�� str�nky: z�skals cennou zku�enost, a to za to p�ece stoj�, ne?
	};
	MIS_FESTER_KILLBUGS = LOG_OBSOLETE;
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int fester_duell_day;
var int fester_fightverarscht;
var int fester_fightsylvio;

instance DIA_FESTER_PERMPRUEGEL(C_INFO)
{
	npc = sld_816_fester;
	nr = 9;
	condition = dia_fester_permpruegel_condition;
	information = dia_fester_permpruegel_info;
	permanent = TRUE;
	description = "Mysl�m, �e ti trochu zmaluju h�bet.";
};


func int dia_fester_permpruegel_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) || Npc_KnowsInfo(other,dia_jarvis_missionko) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_fester_permpruegel_info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//Mysl�m, �e ti trochu zmaluju h�bet.
	if(FESTER_DUELL_DAY < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,itmi_gold,random);
		FESTER_DUELL_DAY = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) && (FESTER_FIGHTVERARSCHT == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//Nem�m r�d, kdy� si ze m� n�kdo d�l� �oufky.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//U� se boj�m, u� se boj�m!
		FESTER_FIGHTVERARSCHT = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//Neud�lals dob�e, �e ses spol�il se Sylviem.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//Tys jeden z t�ch Leeov�ch vlezdoprdelk�, co? Tak tos narazil na toho neprav�ho!
		FESTER_FIGHTSYLVIO = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//Co po mn� k �ertu chce�?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//Jenom se mi l�b�, kdy� si m�ch� hubu v bl�t�!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//Ty to nech�pe�, co?
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_FESTER_PICKPOCKET(C_INFO)
{
	npc = sld_816_fester;
	nr = 900;
	condition = dia_fester_pickpocket_condition;
	information = dia_fester_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fester_pickpocket_condition()
{
	return c_beklauen(27,45);
};

func void dia_fester_pickpocket_info()
{
	Info_ClearChoices(dia_fester_pickpocket);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_BACK,dia_fester_pickpocket_back);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_PICKPOCKET,dia_fester_pickpocket_doit);
};

func void dia_fester_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fester_pickpocket);
};

func void dia_fester_pickpocket_back()
{
	Info_ClearChoices(dia_fester_pickpocket);
};

