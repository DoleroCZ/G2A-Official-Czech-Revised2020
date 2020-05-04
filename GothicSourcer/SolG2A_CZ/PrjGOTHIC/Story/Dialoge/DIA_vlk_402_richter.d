
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Proè mì obtìžuješ? Kdo vlastnì jsi?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Já, ehm...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//Øekni, neznáme se odnìkud?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Co si pamatuju, tak ne.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Možná ano.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Co si pamatuju, tak ne.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To je zvláštní. Pøísahal bych, že už jsme se nìkde vidìli.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Nevadí, však jsi jen ubohý šupák. Všichni vypadáte stejnì.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Možná ano.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Chtìlo by to trochu uctivìjší tón! S kým si vùbec myslíš, že mluvíš?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//To nejmenší, co mùžeš udìlat, je mluvit se mnou odpovídajícím tónem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A teï mi ztra z oèí!
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak se vede?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Radìji bys mìl vypadnout, ty mizernej žoldáku, než zavolám stráže.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Klídek. Nepøišel jsem tì okrást. Hledám práci.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Á. Tak ty pro mì chceš pracovat. Tak to je samozøejmì jiná.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Ale má to jeden háèek. Nevím, jestli ti mohu vìøit. Budeš mi muset nejprve prokázat svou loajalitu.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Neøekl jsem snad jasnì, že s tebou nechci nic mít?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Ne, ne tolika slovy.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Tak to samozøejmì doufám, že ti to došlo teï.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Otestuj si mì.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Otestuj si mì.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmh. Dobrá. Poslouchej. Pøines mi od ohnivých mágù posvátné kladivo. Ukrývají ho nìkde v podzemí svého kláštera.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jestli to dokážeš splnit, možná budu uvažovat o tom, že bych si tì najal jako svého osobního strážce.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"To mám jako okrást mágy? Nejsi trochu mimo?",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"Dobrá.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"Soudce mi nevìøí. Musím mu prokázat svou loajalitu - ukrást ze sklepení kláštera ohnivých mágù posvátné kladivo a pøinést mu je.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//To mám jako okrást mágy? Nejsi trochu mimo?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//V tom pøípadì táhni do pekel a pøestaò plýtvat mým èasem.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Dobrá.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Fajn. Ale pamatuj - jestli tì chytí, nikdy jsem o tobì neslyšel.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Tady je posvátné kladivo mágù.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Tady je posvátné kladivo mágù.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jsem opravdu pøekvapen. Ty to myslíš vážnì, co? Tady je tvá odmìna.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Fajn. Když se to má takhle, tak to mám pro tebe ještì další úkol.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Pøed nìkolika dny uteklo ze zdejšího vìzení pár trestancù.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Ti zkurvysyni se schovali v horách. Nìkde smìrem ke Xardasovì nové vìži.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Jejich vùdce se jmenuje Morgahard. Chci, abys ho zabil.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Pospìš si, než nám proklouzne.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"Nìkteøí vìzni unikli spravedlnosti. Já je mám dostihnout a zabít jejich velitele Morgaharda. Nejspíš se ukrývají v horách, kdesi smìrem ke Xardasovì nové vìži.");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Morgahard je mrtvý.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard je mrtvý.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Á. Jsi dobrej chlap. Tady je tvá odmìna.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"Soudce byl zprávou o Morgahardovì smrti oèividnì nadšen. No, nechme ho být. Nesmím odboèovat od poslání, kterým mì povìøil Lee.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "Mùžu pro tebe ještì nìco udìlat?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Mùžu pro tebe ještì nìco udìlat?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Teï zrovna ne. Možná pozdìji.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Dej mi písemné povìøení pro paladinskou loï.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Dej mi písemné povìøení pro paladinskou loï.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(smích) Ty ses musel zbláznit. Co to po mnì chceš?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Slyšel jsi dobøe. Dej mi to písemné oprávnìní, nebo tì prásknu domobranì.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(vrèí) Nenechám se vydírat! Ne od tebe! Nechám tì sežrat vlkùm, ty mizernej šmejde.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard napadl místodržícího tvým jménem. Mám dokument, který to dokazuje.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(vrèí) Arrh.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Toho budeš litovat. Nikdo mì nebude vydírat, aniž by z toho vyváz se zdravou kùží.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Tady je to tvé oprávnìní. A teï vypadni. Vyøídím si to s tebou pozdìji.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"S plnou mocí v kapse mohu získat loï, než bys øekl švec. Jsem zvìdavý, co tomu øekne Lee.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Ztra se mi z oèí.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle klíè lze snadno ukrást)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};

