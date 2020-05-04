
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
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Neodva�uj se ani pomyslet na to, �e bys tu mohl n�co ukr�st. Jinak sl�zne� r�nu do hlavy, jasn�?
};


instance DIA_WASILI_JOB(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_job_condition;
	information = dia_wasili_job_info;
	permanent = FALSE;
	description = "Co je tvoje pr�ce?";
};


func int dia_wasili_job_condition()
{
	return TRUE;
};

func void dia_wasili_job_info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//Co je tvoje pr�ce?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Onar po mn� chce, abych cel� den dohl�el na jeho v�ci.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//D�l� si starosti, �e se n�co pokaz�. A j� taky - na tomhle m�st�...
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//V�t�ina z t�ch �old�k�, co najal, jsou b�val� v�zni z trestaneck� kolonie.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//Kdy� se nikdo z n�s nekouk�, odnesou v�echno, co nen� p�i�roubovan�.
};


instance DIA_WASILI_SAMMLER(C_INFO)
{
	npc = bau_907_wasili;
	nr = 4;
	condition = dia_wasili_sammler_condition;
	information = dia_wasili_sammler_info;
	permanent = FALSE;
	description = "Je tady spousta haraburd�.";
};


func int dia_wasili_sammler_condition()
{
	return TRUE;
};

func void dia_wasili_sammler_info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//Je tady spousta haraburd�.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//Jo, a spousta z n�j je hodn� drah�. Onar sb�r� cennosti.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//Oby�ejn� �lov�k jako j� si takov� luxus nem��e dovolit. Z�le�� mi na jin�ch v�cech.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//A to jako?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//Sb�r�m star� mince.
	MIS_WASILI_BRINGOLDCOIN = LOG_RUNNING;
};


instance DIA_WASILI_FIRSTOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_firstoldcoin_condition;
	information = dia_wasili_firstoldcoin_info;
	permanent = TRUE;
	description = "M�m tady p�r star�ch minc�.";
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
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//M�m tady p�r star�ch minc�.
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Mmh. Uka�.
	};
	b_giveinvitems(other,self,itmi_oldcoin,1);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Hm, jo. To by ti na trhu moc nevyneslo.
	};
	if(DIA_WASILI_FIRSTOLDCOIN_MEHR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//D�m ti za n� zla��k. P�esn� tolik, jak� je jejich hodnota.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//Ty moc dob�e v�, kolik jsem za n� ochoten zaplatit, ty pse. Jeden zlat�. Nic v�c.
	};
	Info_ClearChoices(dia_wasili_firstoldcoin);
	Info_AddChoice(dia_wasili_firstoldcoin,"No, m�m dojem, �e si to teda vezmu.",dia_wasili_firstoldcoin_nein);
	Info_AddChoice(dia_wasili_firstoldcoin,"To nesta��. Co takhle 2? ",dia_wasili_firstoldcoin_mehr);
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
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Dobr�.
	if(WASILISOLDCOINOFFER == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Tady jsou dva zlat�.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//Kdybys jich m�l takov�ch v�c, v�, kde m� najde�.
		WASILISOLDCOINOFFER = 1;
	};
	CreateInvItems(self,itmi_gold,WASILISOLDCOINOFFER);
	b_giveinvitems(self,other,itmi_gold,WASILISOLDCOINOFFER);
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//To nesta��. Co takhle 2?
	if(dia_wasili_firstoldcoin_mehr_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Nez�jem! Nejsem bl�zen! Zmizni.
		dia_wasili_firstoldcoin_mehr_onetime = TRUE;
		b_giveinvitems(self,other,itmi_oldcoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Arrh. Sakra. Dobr�. 2 zlat� za ka�dou starou minci, kterou mi p�inese�. To je moje posledn� nab�dka.
		WASILISOLDCOINOFFER = 2;
		Info_AddChoice(dia_wasili_firstoldcoin,"V tom p��pad� nejsou 3 tak �patn�.",dia_wasili_firstoldcoin_zumteufel);
	};
};

func void dia_wasili_firstoldcoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//No, m�m dojem, �e si to teda vezmu.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//Nemaj pro tebe ��dnou hodnotu. V�ak ty se vr�t�.
	b_giveinvitems(self,other,itmi_oldcoin,1);
	WASILISOLDCOINOFFER = 0;
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_zumteufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//V tom p��pad� nejsou 3 tak �patn�.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//T�hni do pekel, ty bastarde.
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
	description = "M� z�jem o dal�� star� mince?";
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
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//M� z�jem o dal�� star� mince?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Jasn�. M� je�t� n�jak�?
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
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//P�r.
		b_giveinvitems(other,self,itmi_oldcoin,oldcoincount);
		xp_bringoldcoins = oldcoincount * XP_BRINGOLDCOIN;
		OLDCOINCOUNTER = OLDCOINCOUNTER + oldcoincount;
		b_giveplayerxp(xp_bringoldcoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//D�ky. Tady jsou tvoje pen�ze. P�ines mi v�echno, co najde�.
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
	description = "U� se n�kdo pokusil n�co ukr�st?";
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
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//U� se n�kdo pokusil n�co ukr�st?
	if(KAPITEL <= 2)
	{
		if(PETZCOUNTER_FARM_THEFT > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//Mysl� krom� tebe?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//P�rkr�t! A v�dycky jsem je chytil!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//P�ed p�r dny se v noci jeden ze �oldn��� pl�il po dom�.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//M�l na sob� �ernou r�bu s kapuc�, tak�e jsem ho nemohl poznat.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//Ale p�inutil jsem ho, aby utekl.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//Ne. Posledn� dobou ne.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//Ti �oldn��i vypadaj�, jako by byli p�ipraveni rozb�t t�bor.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//Je mi jedno, jestli Lee se sv�mi hochy p�es noc opust� ostrov.
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

