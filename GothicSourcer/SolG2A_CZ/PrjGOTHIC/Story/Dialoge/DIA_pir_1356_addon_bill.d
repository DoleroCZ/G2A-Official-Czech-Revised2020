
instance DIA_ADDON_BILL_EXIT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 999;
	condition = dia_addon_bill_exit_condition;
	information = dia_addon_bill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bill_exit_condition()
{
	return TRUE;
};

func void dia_addon_bill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BILL_PICKPOCKET(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 900;
	condition = dia_addon_bill_pickpocket_condition;
	information = dia_addon_bill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bill_pickpocket_condition()
{
	return c_beklauen(80,205);
};

func void dia_addon_bill_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_BACK,dia_addon_bill_pickpocket_back);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_PICKPOCKET,dia_addon_bill_pickpocket_doit);
};

func void dia_addon_bill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bill_pickpocket);
};

func void dia_addon_bill_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
};


instance DIA_ADDON_BILL_HELLO(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 1;
	condition = dia_addon_bill_hello_condition;
	information = dia_addon_bill_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bill_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//V�e ok?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Co je? Henry t� sem poslal?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//�ekni mu, �e dostane sv� prkna, jakmile je dod�l�m.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//Jestli se mu to nebude l�bit, m��e si je j�t ud�lat s�m.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BILL_PLANKS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 2;
	condition = dia_addon_bill_planks_condition;
	information = dia_addon_bill_planks_info;
	description = "Co d�l� s t�mi deskami?";
};


func int dia_addon_bill_planks_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_planks_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Co d�l� s t�mi deskami?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//Jsou na palis�du.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg si mysl�, �e je dobr� n�pad opevnit t�bor.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Ale kdy� se m� pt�, mo�n� bychom se nem�li ru�it.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Jestli na n�s cht�j� banditi za�to�it, tyto sm�n� palis�dy je jist� nezastav�.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Nikdy jsme je nem�li tolerovat v na�em �dol�.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Kdybych to v�d�l d��v, z�stal bych v Khorinisu.
};


var int bill_perm_once;

instance DIA_ADDON_BILL_PERM(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 4;
	condition = dia_addon_bill_perm_condition;
	information = dia_addon_bill_perm_info;
	permanent = TRUE;
	description = "M��u ti pomoct?";
};


func int dia_addon_bill_perm_condition()
{
	if((GREGISBACK == FALSE) && Npc_WasInState(self,zs_saw))
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//M��u ti pomoct?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Bez starost�, zvl�dnu to s�m.
	if(BILL_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//P�idal jsem sem teprve ned�vno a kdybych nechal d�lat lidi svou pr�ci, dlouho bych tu nebyl. Ch�pe�?
		BILL_PERM_ONCE = TRUE;
	};
};


instance DIA_ADDON_BILL_PERM2(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 5;
	condition = dia_addon_bill_perm2_condition;
	information = dia_addon_bill_perm2_info;
	permanent = TRUE;
	description = "Co d�l�?";
};


func int dia_addon_bill_perm2_condition()
{
	if(GREGISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm2_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Co d�l�?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Zaprv� odpo��v�m.
	if(!Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(radostn�) Francis mi dal mou starou pr�ci.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Pro m�, za m�, m��u tu d�lat desky, dokud peklo nezamrzne.
	};
};


instance DIA_ADDON_BILL_ANGUSNHANK(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 11;
	condition = dia_addon_bill_angusnhank_condition;
	information = dia_addon_bill_angusnhank_info;
	permanent = FALSE;
	description = "Hled�m Anguse a Hanka.";
};


func int dia_addon_bill_angusnhank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushank) && Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_angusnhank_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Hled�m Anguse a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(povzdechne si) Nem�m ani pon�t�, kde by mohli b�t. H�dal bych, �e je dostali banditi.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Byli jste p��tel�, nebo ne?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//V�e, co v�m, je, �e se cht�li setkat s bandity v nedalek� jeskyni.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//M�lo by to b�t n�kde na v�chod od t�bora.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Nev�m ale p�esn� kde. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Nejlep�� se zeptat Aligatora Jacka. Je v�dy n�kde p�ed t�borem.
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Angus a Hank m�li jeskyni na v�chod od t�bora. Aligator Jack by mohl v�d�t v�c.");
};


instance DIA_ADDON_BILL_FOUNDFRIENDS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 12;
	condition = dia_addon_bill_foundfriends_condition;
	information = dia_addon_bill_foundfriends_info;
	permanent = FALSE;
	description = "Na�el jsem tv� p��tele.";
};


func int dia_addon_bill_foundfriends_condition()
{
	if(!Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_foundfriends_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Na�el jsem tv� p��tele.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//A? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Jsou mrtv�.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(na�tvan�) To byli ti proklet� banditi!
	if(SC_KNOWS_JUANMURDEREDANGUS == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Mo�n�.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Ti hnusn� bastardi. P�eji si, aby ode�li do pekla.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//(k sob�, na�tvan�) R�d bych znal jm�na t�ch, co to ud�lali ...
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLJUAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLJUAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Bill byl �pln� rozru�en, kdy� jsem mu pov�d�l o smrti Angude a Hanka. Chce zn�t jm�na vrah�.");
};


instance DIA_ADDON_BILL_JUANMURDER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 13;
	condition = dia_addon_bill_juanmurder_condition;
	information = dia_addon_bill_juanmurder_info;
	description = "V�m, kdo zabil Angude a Hanka.";
};


func int dia_addon_bill_juanmurder_condition()
{
	if((MIS_ADDON_BILL_SEARCHANGUSMURDER == LOG_RUNNING) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_juanmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//V�m, kdo zabil Angude a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//(rozru�en�) Kdo? Kdo to byl?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//Jeho jm�no je Juan a je jedn�m z bandit�.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Budu ho pron�sledovat a� do konce, sly�� m�?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Nesm� se odtud dostat �iv�!
	b_logentry(TOPIC_ADDON_KILLJUAN,"J� zabiju Juana. Pomst�m Anguse a Hanka.");
};


instance DIA_ADDON_BILL_KILLEDESTEBAN(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 14;
	condition = dia_addon_bill_killedesteban_condition;
	information = dia_addon_bill_killedesteban_info;
	description = "O Juana je postar�no.";
};


func int dia_addon_bill_killedesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_juanmurder) && Npc_IsDead(juan))
	{
		return TRUE;
	};
};

func void dia_addon_bill_killedesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//O Juana je postar�no.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//(horliv�) A? Trp�l?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Nech to b�t.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(povzdechne si) M� pravdu. Kone�n� je mrtev.
	b_logentry(TOPIC_ADDON_KILLJUAN,"Juan je mrtev. Bill je celkem pot�en.");
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_BILL_KILLANGUSMURDER);
};


instance DIA_ADDON_BILL_KHORINIS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 21;
	condition = dia_addon_bill_khorinis_condition;
	information = dia_addon_bill_khorinis_info;
	description = "B�v�vals v Khorinisu?";
};


func int dia_addon_bill_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_planks))
	{
		return TRUE;
	};
};

func void dia_addon_bill_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//B�v�vals v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Ano, b�val jsem mal�m kapesn�m zlod�jem a podvodn�kem.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Ale kdy� p�ij�d�lo m�n� a m�n� lod�, obchod trp�l.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//A nemohl jsem v�d�t, jak domobrana prahne po p�n�z�ch.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//Tak jsem se p�idal k Gregovi. A nyn� jsem zde.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(povzdechne si) �e�u cel� den desky na palis�du, kter� bude stejn� k ni�emu.
	};
};


instance DIA_ADDON_BILL_TEACHPLAYER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 22;
	condition = dia_addon_bill_teachplayer_condition;
	information = dia_addon_bill_teachplayer_info;
	description = "M��e� m� n�co nau�it?";
};


func int dia_addon_bill_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_bill_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//M��e� m� n�co nau�it?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//M��u t� nau�it, jak vypr�zdnit kapsy ostatn�m, ani� by si toho v�imli.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Ale mus� b�t aspo� trochu obratn�, jinak to nem� v�znam.
	BILL_ADDON_TEACHPICKPOCKET = TRUE;
};


instance DIA_ADDON_BILL_LEARNTALENT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 23;
	condition = dia_addon_bill_learntalent_condition;
	information = dia_addon_bill_learntalent_info;
	permanent = TRUE;
	description = "Uka� mi, jak vyb�rat kapsy(10 LP).)";
};


func int dia_addon_bill_learntalent_condition()
{
	if((BILL_ADDON_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_learntalent_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Uka� mi, jak vyb�rat kapsy.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Kdy� bude� cht�t n�koho okr�st, ujisti se, �e jsi v bezpe�� a �e t� nikdo nesleduje.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//P�ijde� k nim a norm�ln� s nimi promluv�.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Kdy� n�co bere�, ujisti si, �e si ob� ni�eho nev�imla.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//N�co dal��ho?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Ano, zlep�uj se v obratnosti. ��m jsi obratn�j��, t�m l�pe ti to p�jde.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//A hlavn� se nenech chytit.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//To je v�e, co se t��e teorie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Zapome� na to, jsi p��li� nemotorn�.
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Bu� se sta� obratn�j��m nebo si se�e� lep��ho u�itele.
	};
};

