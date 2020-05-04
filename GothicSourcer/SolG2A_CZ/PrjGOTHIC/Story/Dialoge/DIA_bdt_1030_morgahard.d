
instance DIA_MORGAHARD_EXIT(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 999;
	condition = dia_morgahard_exit_condition;
	information = dia_morgahard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_morgahard_exit_condition()
{
	return TRUE;
};

func void dia_morgahard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_HALLO(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_hallo_condition;
	information = dia_morgahard_hallo_info;
	description = "Ty jsi Morgahard.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Ty jsi Morgahard.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Odkud zn� moje jm�no?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Hled� t� soudce. Utekl jsi z v�zen�.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Tak cos teda provedl: Ukradls mu pen�enku?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Jemu ne. M�stodr��c�mu. Ale byli jsme v soudcov�ch slu�b�ch.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//Potom, co jsme m�stodr��c�ho obrali, se necht�l s n�mi pod�lit o ko�ist, a tak n�s str�il za m��e.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Necht�li jsme se houpat na �ibenici, tak jsme utekli.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//M�m dojem, �e ztratili na�i stopu. Vypad� to, �e je z n� n�kdo svedl.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"P�esta� f�ukat a rad�i tas zbra�.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"Co mu provedeme?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"Soudce mi na��dil, abych t� zabil.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"Na�el jsem Morgaharda, v�dce uprchl�k�.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Soudce mi na��dil, abych t� zabil.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Jo, jasn�. Proto se� tady, ne?
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Co mu provedeme?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//V�bec nic. Sed� si v horn� ��sti m�sta jako pavouk uprost�ed s�t� a nikdo na n�j nem��e.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Tak jsem to nemyslel. Jen bysme pot�ebovali n�jak� d�kaz o jeho provin�n� v t� v�ci s m�stodr��c�m.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Tak d�kaz, ��k�? N�co by se u m� i na�lo. Ale kdo by poslouchal trestan�ho krimin�ln�ka?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Dej mi ten d�kaz a j� se postar�m o to, aby v�s u� nechali na pokoji.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Ur�it�? Tak jo. Tady, vezmi si tenhle dopis. Je na n�m soudc�v podpis.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//I kdy� m� to nezbav� obvin�n�, m�lo by to sta�it jako d�kaz jeho spolu��asti na t� v�ci.
	b_logentry(TOPIC_RICHTERLAKAI,"Morgahard mi p�edal jist� soudn� dokument, kter� jasn� dokazuje, �e soudce m�stodr��c�ho Laria prachsprost� okradl. Mysl�m, �e p�esn� tohle po mn� cht�l Lee.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//P�esta� sku�et a chop se zbran�. Skon��me to hned.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//M� pravdu, stejn� nem�m co ztratit.
	AI_StopProcessInfos(self);
	MORGAHARDSUCKED = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_MORGAHARD_PERM(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm_condition;
	information = dia_morgahard_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_morgahard_hallo) && (MORGAHARDSUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//Ta soudnick� svin� - jednou se bude houpat na �ibenici.
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PERM2(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm2_condition;
	information = dia_morgahard_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm2_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MORGAHARDSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm2_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Pro� se prost� neztrat�?
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PICKPOCKET(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 900;
	condition = dia_morgahard_pickpocket_condition;
	information = dia_morgahard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_morgahard_pickpocket_condition()
{
	return c_beklauen(73,45);
};

func void dia_morgahard_pickpocket_info()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_BACK,dia_morgahard_pickpocket_back);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_PICKPOCKET,dia_morgahard_pickpocket_doit);
};

func void dia_morgahard_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_morgahard_pickpocket);
};

func void dia_morgahard_pickpocket_back()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
};

