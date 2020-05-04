
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
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Odkud znáš moje jméno?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Hledá tì soudce. Utekl jsi z vìzení.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Tak cos teda provedl: Ukradls mu penìženku?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Jemu ne. Místodržícímu. Ale byli jsme v soudcových službách.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//Potom, co jsme místodržícího obrali, se nechtìl s námi podìlit o koøist, a tak nás strèil za møíže.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Nechtìli jsme se houpat na šibenici, tak jsme utekli.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//Mám dojem, že ztratili naši stopu. Vypadá to, že je z ní nìkdo svedl.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"Pøestaò fòukat a radši tas zbraò.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"Co mu provedeme?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"Soudce mi naøídil, abych tì zabil.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"Našel jsem Morgaharda, vùdce uprchlíkù.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Soudce mi naøídil, abych tì zabil.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Jo, jasnì. Proto seš tady, ne?
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Co mu provedeme?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Vùbec nic. Sedí si v horní èásti mìsta jako pavouk uprostøed sítì a nikdo na nìj nemùže.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Tak jsem to nemyslel. Jen bysme potøebovali nìjaký dùkaz o jeho provinìní v tý vìci s místodržícím.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Tak dùkaz, øíkáš? Nìco by se u mì i našlo. Ale kdo by poslouchal trestanýho kriminálníka?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Dej mi ten dùkaz a já se postarám o to, aby vás už nechali na pokoji.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Urèitì? Tak jo. Tady, vezmi si tenhle dopis. Je na nìm soudcùv podpis.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//I když mì to nezbaví obvinìní, mìlo by to staèit jako dùkaz jeho spoluúèasti na tý vìci.
	b_logentry(TOPIC_RICHTERLAKAI,"Morgahard mi pøedal jistý soudní dokument, který jasnì dokazuje, že soudce místodržícího Laria prachsprostì okradl. Myslím, že pøesnì tohle po mnì chtìl Lee.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Pøestaò skuèet a chop se zbranì. Skonèíme to hned.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Máš pravdu, stejnì nemám co ztratit.
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
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//Ta soudnická svinì - jednou se bude houpat na šibenici.
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
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Proè se prostì neztratíš?
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

