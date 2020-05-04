
instance DIA_WASILI_EXIT(C_INFO)
{
	npc = bau_907_wasili;
	nr = 999;
	condition = dia_wasili_exit_condition;
	information = dia_wasili_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wasili_exit_condition()
{
	return TRUE;
};

func void dia_wasili_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WASILI_HALLO(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_hallo_condition;
	information = dia_wasili_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wasili_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wasili_hallo_info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Neodvažuj se ani pomyslet na to, že bys tu mohl nìco ukrást. Jinak slízneš ránu do hlavy, jasný?
};


instance DIA_WASILI_JOB(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_job_condition;
	information = dia_wasili_job_info;
	permanent = FALSE;
	description = "Co je tvoje práce?";
};


func int dia_wasili_job_condition()
{
	return TRUE;
};

func void dia_wasili_job_info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//Co je tvoje práce?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Onar po mnì chce, abych celý den dohlížel na jeho vìci.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//Dìlá si starosti, že se nìco pokazí. A já taky - na tomhle místì...
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//Vìtšina z tìch žoldákù, co najal, jsou bývalí vìzni z trestanecké kolonie.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//Když se nikdo z nás nekouká, odnesou všechno, co není pøišroubovaný.
};


instance DIA_WASILI_SAMMLER(C_INFO)
{
	npc = bau_907_wasili;
	nr = 4;
	condition = dia_wasili_sammler_condition;
	information = dia_wasili_sammler_info;
	permanent = FALSE;
	description = "Je tady spousta haraburdí.";
};


func int dia_wasili_sammler_condition()
{
	return TRUE;
};

func void dia_wasili_sammler_info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//Je tady spousta haraburdí.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//Jo, a spousta z nìj je hodnì drahá. Onar sbírá cennosti.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//Obyèejný èlovìk jako já si takový luxus nemùže dovolit. Záleží mi na jiných vìcech.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//A to jako?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//Sbírám staré mince.
	MIS_WASILI_BRINGOLDCOIN = LOG_RUNNING;
};


instance DIA_WASILI_FIRSTOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_firstoldcoin_condition;
	information = dia_wasili_firstoldcoin_info;
	permanent = TRUE;
	description = "Mám tady pár starých mincí.";
};


var int wasili_bringoldcoin_nomore;

func int dia_wasili_firstoldcoin_condition()
{
	if((MIS_WASILI_BRINGOLDCOIN == LOG_RUNNING) && (WASILISOLDCOINOFFER == 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int wasilisoldcoinoffer;
var int firstoldcoin_angebotenxp_onetime;
var int dia_wasili_firstoldcoin_mehr_onetime;

func void dia_wasili_firstoldcoin_info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//Mám tady pár starých mincí.
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Mmh. Ukaž.
	};
	b_giveinvitems(other,self,itmi_oldcoin,1);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Hm, jo. To by ti na trhu moc nevyneslo.
	};
	if(DIA_WASILI_FIRSTOLDCOIN_MEHR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//Dám ti za nì zlaák. Pøesnì tolik, jaká je jejich hodnota.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//Ty moc dobøe víš, kolik jsem za nì ochoten zaplatit, ty pse. Jeden zlatý. Nic víc.
	};
	Info_ClearChoices(dia_wasili_firstoldcoin);
	Info_AddChoice(dia_wasili_firstoldcoin,"No, mám dojem, že si to teda vezmu.",dia_wasili_firstoldcoin_nein);
	Info_AddChoice(dia_wasili_firstoldcoin,"To nestaèí. Co takhle 2? ",dia_wasili_firstoldcoin_mehr);
	Info_AddChoice(dia_wasili_firstoldcoin,"Dohodnuto.",dia_wasili_firstoldcoin_ok);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_giveplayerxp(XP_BRINGOLDCOIN);
		FIRSTOLDCOIN_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_wasili_firstoldcoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Dobrá.
	if(WASILISOLDCOINOFFER == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Tady jsou dva zlaté.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//Kdybys jich mìl takových víc, víš, kde mì najdeš.
		WASILISOLDCOINOFFER = 1;
	};
	CreateInvItems(self,itmi_gold,WASILISOLDCOINOFFER);
	b_giveinvitems(self,other,itmi_gold,WASILISOLDCOINOFFER);
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//To nestaèí. Co takhle 2?
	if(dia_wasili_firstoldcoin_mehr_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Nezájem! Nejsem blázen! Zmizni.
		dia_wasili_firstoldcoin_mehr_onetime = TRUE;
		b_giveinvitems(self,other,itmi_oldcoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Arrh. Sakra. Dobrá. 2 zlaté za každou starou minci, kterou mi pøineseš. To je moje poslední nabídka.
		WASILISOLDCOINOFFER = 2;
		Info_AddChoice(dia_wasili_firstoldcoin,"V tom pøípadì nejsou 3 tak špatné.",dia_wasili_firstoldcoin_zumteufel);
	};
};

func void dia_wasili_firstoldcoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//No, mám dojem, že si to teda vezmu.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//Nemaj pro tebe žádnou hodnotu. Však ty se vrátíš.
	b_giveinvitems(self,other,itmi_oldcoin,1);
	WASILISOLDCOINOFFER = 0;
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_zumteufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//V tom pøípadì nejsou 3 tak špatné.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//Táhni do pekel, ty bastarde.
	AI_StopProcessInfos(self);
	WASILI_BRINGOLDCOIN_NOMORE = TRUE;
	WASILISOLDCOINOFFER = 0;
};


instance DIA_WASILI_BRINGOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_bringoldcoin_condition;
	information = dia_wasili_bringoldcoin_info;
	permanent = TRUE;
	description = "Máš zájem o další staré mince?";
};


func int dia_wasili_bringoldcoin_condition()
{
	if((WASILISOLDCOINOFFER > 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int oldcoincounter;

func void dia_wasili_bringoldcoin_info()
{
	var int oldcoincount;
	var int xp_bringoldcoins;
	var int oldcoingeld;
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//Máš zájem o další staré mince?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Jasnì. Máš ještì nìjaké?
	oldcoincount = Npc_HasItems(other,itmi_oldcoin);
	if(oldcoincount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//Jednu.
		b_giveplayerxp(XP_BRINGOLDCOIN);
		b_giveinvitems(other,self,itmi_oldcoin,1);
		OLDCOINCOUNTER = OLDCOINCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//Pár.
		b_giveinvitems(other,self,itmi_oldcoin,oldcoincount);
		xp_bringoldcoins = oldcoincount * XP_BRINGOLDCOIN;
		OLDCOINCOUNTER = OLDCOINCOUNTER + oldcoincount;
		b_giveplayerxp(xp_bringoldcoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//Díky. Tady jsou tvoje peníze. Pøines mi všechno, co najdeš.
	oldcoingeld = oldcoincount * WASILISOLDCOINOFFER;
	CreateInvItems(self,itmi_gold,oldcoingeld);
	b_giveinvitems(self,other,itmi_gold,oldcoingeld);
};


instance DIA_WASILI_PERM(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_perm_condition;
	information = dia_wasili_perm_info;
	permanent = TRUE;
	description = "Už se nìkdo pokusil nìco ukrást?";
};


func int dia_wasili_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wasili_job))
	{
		return TRUE;
	};
};

func void dia_wasili_perm_info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//Už se nìkdo pokusil nìco ukrást?
	if(KAPITEL <= 2)
	{
		if(PETZCOUNTER_FARM_THEFT > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//Myslíš kromì tebe?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//Párkrát! A vždycky jsem je chytil!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//Pøed pár dny se v noci jeden ze žoldnéøù plížil po domì.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//Mìl na sobì èernou róbu s kapucí, takže jsem ho nemohl poznat.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//Ale pøinutil jsem ho, aby utekl.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//Ne. Poslední dobou ne.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//Ti žoldnéøi vypadají, jako by byli pøipraveni rozbít tábor.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//Je mi jedno, jestli Lee se svými hochy pøes noc opustí ostrov.
	};
};


instance DIA_WASILI_PICKPOCKET(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_pickpocket_condition;
	information = dia_wasili_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wasili_pickpocket_condition()
{
	return c_beklauen(55,90);
};

func void dia_wasili_pickpocket_info()
{
	Info_ClearChoices(dia_wasili_pickpocket);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_BACK,dia_wasili_pickpocket_back);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_PICKPOCKET,dia_wasili_pickpocket_doit);
};

func void dia_wasili_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wasili_pickpocket);
};

func void dia_wasili_pickpocket_back()
{
	Info_ClearChoices(dia_wasili_pickpocket);
};

