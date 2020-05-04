
instance DIA_ROSI_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_exit_condition;
	information = dia_rosi_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_rosi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_HALLO(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_hallo_condition;
	information = dia_rosi_hallo_info;
	description = "Jsi v po��dku?";
};


func int dia_rosi_hallo_condition()
{
	return TRUE;
};

func void dia_rosi_hallo_info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//Jsi v po��dku?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Dobr�, je to tak, tak. Bol� m� z�da ze v�� t� tvrd� d�iny. Co tady d�l�? N�v�t�vn�ky tu nem�me p��li� �asto.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Kdy� u�, tak ty hrdlo�ezy z hor nebo voj�ky z m�stsk� domobrany.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Posledn� dobou rabujou na�� farmu ��m d�l t�m �ast�ji. Ale ty nevypad� jako jeden z nich, nebo se pletu?
	};
};


instance DIA_ROSI_WASMACHSTDU(C_INFO)
{
	npc = bau_936_rosi;
	nr = 4;
	condition = dia_rosi_wasmachstdu_condition;
	information = dia_rosi_wasmachstdu_info;
	description = "Co tady d�l�?";
};


func int dia_rosi_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_rosi_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//Co tady d�l�?
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//Tak to se pt�m sama sebe u� n�kolik let. Sekob, m�j man�el, u� se tady poh�dal snad s ka�d�m.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//V�ude m� dluhy. Proto krade zbo�� z Onarov�ch z�sob a prod�v� je ve m�st�.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Ale te� u� z t� sv� podfuka�iny m� cel� jm�n�.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//A d�e na�e d�ln�ky, dokud jim nezni�� z�da. Jeho vlastn� lid� mu u� ne�eknou jinak ne� otrok��.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Nejsem v�bec py�n� na to, �e se m��u naz�vat Sekobovou �enou, to mi v��. Ob�as si p�eju, aby bari�ra z�stala st�le na sv�m m�st�.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Nem� z�jem o n�co k j�dlu nebo n�co, co by se ti hodilo pro lov v les�ch?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,"Rosi handelt mit verschiedenen Waren, auf dem Hof von Sekob.");
};


instance DIA_ROSI_WAREZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 2;
	condition = dia_rosi_warez_condition;
	information = dia_rosi_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mi m��e� nab�dnout?";
};


func int dia_rosi_warez_condition()
{
	if((Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)) || Npc_IsDead(sekob)) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_rosi_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Co mi m��e� nab�dnout?
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//Co chce�?
};


instance DIA_ROSI_BARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 6;
	condition = dia_rosi_barriere_condition;
	information = dia_rosi_barriere_info;
	description = "Bari�ra?";
};


func int dia_rosi_barriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_barriere_info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Bari�ra?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//Jo, kopule, kter� uzav�rala Hornick� �dol�.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Svrhli tam spoustu lid�, co se dopustili n�jak� nez�konn� �innosti. A n�kte�� z nich u� se nikdy nevr�tili zp�t.
};


instance DIA_ROSI_DUINBARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 10;
	condition = dia_rosi_duinbarriere_condition;
	information = dia_rosi_duinbarriere_info;
	description = "Byla jsi n�kdy za bari�rou?";
};


func int dia_rosi_duinbarriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_barriere))
	{
		return TRUE;
	};
};

func void dia_rosi_duinbarriere_info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Byla jsi n�kdy za bari�rou?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Ne. Jen jsme o n� sly�eli. Bengar, farm�� z n�horn�ch pastvin, ti o tom ur�it� pov� v�c.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Jeho farma nen� p��li� daleko od Hornick�ho �dol�.
};


instance DIA_ROSI_BENGAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 11;
	condition = dia_rosi_bengar_condition;
	information = dia_rosi_bengar_info;
	description = "Jak se dostanu na Bengarovu farmu?";
};


func int dia_rosi_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_duinbarriere) && (Npc_IsDead(balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_bengar_info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//Jak se dostanu na Bengarovu farmu?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//B� se zeptat Balthazara. To je n� ov��k. Ob�as svoje zv��ata vod� na pastvu nahoru na Bengarovy pozemky.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//M�l by b�t schopen ti ��ct, jak se tam dostat.
};


instance DIA_ROSI_MILIZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 7;
	condition = dia_rosi_miliz_condition;
	information = dia_rosi_miliz_info;
	description = "Pro� v�s domobrana na farm� napad�? ";
};


func int dia_rosi_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_rosi_miliz_info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//Pro� v�s domobrana na farm� napad�?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Proto�e tu nen� nikdo, kdo by zabr�nil tomu, �e se zbo�� m�sto nakoupen� jednodu�e ukradne.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Kr�l je daleko a n�m nezb�v� ne� d��t pro Onara a doufat, �e Onar po�le pomoc, kdy� to bude opravdu zapot�eb�.
};


instance DIA_ROSI_ONAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 8;
	condition = dia_rosi_onar_condition;
	information = dia_rosi_onar_info;
	description = "V �em ta Onarova pomoc spo��v�?";
};


func int dia_rosi_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_miliz))
	{
		return TRUE;
	};
};

func void dia_rosi_onar_info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//V �em ta Onarova pomoc spo��v�?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Ob�as se k n�m dostane varov�n�, �e se k n�m chyst� p�r voj�k� z domobrany, aby se n�s pokusili okr�st na vlastn� p�st.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Pak po�leme k velkostatk��i n�koho pro pomoc.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//A pak to obvykle netrv� dlouho, ne� se sem �old�ci dostanou a vypo��daj� se s domobranou.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Ale kdy� je po v�em, nechovaj� se �old�ci o nic l�p.
};


instance DIA_ROSI_PERMKAP1(C_INFO)
{
	npc = bau_936_rosi;
	nr = 80;
	condition = dia_rosi_permkap1_condition;
	information = dia_rosi_permkap1_info;
	permanent = TRUE;
	description = "No tak, trochu kur�e.";
};


func int dia_rosi_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)))
	{
		return TRUE;
	};
};

func void dia_rosi_permkap1_info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//No tak, trochu kur�e.
	if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//B� si sko�it do jezera.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//D�vej na sebe pozor a nedej se.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP3_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap3_exit_condition;
	information = dia_rosi_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_rosi_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP4_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap4_exit_condition;
	information = dia_rosi_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_rosi_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP5_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap5_exit_condition;
	information = dia_rosi_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_rosi_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_FLEEFROMSEKOB(C_INFO)
{
	npc = bau_936_rosi;
	nr = 50;
	condition = dia_rosi_fleefromsekob_condition;
	information = dia_rosi_fleefromsekob_info;
	description = "Co d�l� tady v divo�in�?";
};


func int dia_rosi_fleefromsekob_condition()
{
	if((KAPITEL == 5) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_fleefromsekob_info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Co d�l� tady v divo�in�?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Na Sekobov� farm� u� se to nedalo vydr�et. Sekob dost�val jeden hysterick� z�chvat za druh�m.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//Nakonec u� se s n�m nedalo v�bec mluvit. Nakonec na v�echny akor�t �val.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Musela jsem se odtamtud dostat, ale nev�m, kam se vrtnout.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Nem� z�jem o men�� dohodu?
	b_giveplayerxp(XP_AMBIENT);
	ROSIFOUNDKAP5 = TRUE;
};


instance DIA_ROSI_HILFE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 51;
	condition = dia_rosi_hilfe_condition;
	information = dia_rosi_hilfe_info;
	description = "Vezmu t� odsud pry�.";
};


func int dia_rosi_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_fleefromsekob) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_hilfe_info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Vezmu t� odsud pry�.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//Mohl bych t� vz�t do m�sta.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Vezmu t� na farmu velkostatk��e.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//Tak odejdi do kl�tera. Bude� tam v�t�na.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//Nikdy ti nezapomenu, cos pro m� ud�lal. Samoz�ejm� ti zaplat�m.
	if(Npc_IsDead(till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//B� prvn�, budu t� n�sledovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//B� prvn�, budeme t� n�sledovat.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		b_startotherroutine(till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		b_startotherroutine(till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		b_startotherroutine(till,"FollowKloster");
	};
	Log_CreateTopic(TOPIC_ROSISFLUCHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ROSISFLUCHT,LOG_RUNNING);
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi u� to nemohla na Sekobov� statku d�le vydr�et a te� nev�, kam j�t. Vyvedu ji ven z divo�iny.");
	MIS_ROSISFLUCHT = LOG_RUNNING;
};


instance DIA_ROSI_ANGEKOMMEN(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_angekommen_condition;
	information = dia_rosi_angekommen_info;
	important = TRUE;
};


func int dia_rosi_angekommen_condition()
{
	if((KAPITEL == 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && (hero.guild == GIL_PAL)) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG)) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void dia_rosi_angekommen_info()
{
	var int xpforboth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Cestu u� najdu sama.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//D�ky. Nev�m, co bych si bez tebe po�ala.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_BRINGROSIBACKTOSEKOB = LOG_OBSOLETE;
	MIS_ROSISFLUCHT = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Pros�m, vezmi si tenhle skromn� d�rek jako vyj�d�en� m�ch d�k�.
	CreateInvItems(rosi,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,450);
	if(Npc_IsDead(till))
	{
		b_giveplayerxp(XP_SAVEDROSI);
	}
	else
	{
		xpforboth = XP_SAVEDROSI + XP_AMBIENT;
		b_giveplayerxp(xpforboth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		b_startotherroutine(till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"BIGFARM") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		b_startotherroutine(till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		b_startotherroutine(till,"KLOSTER");
	};
};


instance DIA_ROSI_TRAIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_trait_condition;
	information = dia_rosi_trait_info;
	description = "Tak zase doma, co?";
};


func int dia_rosi_trait_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_trait_info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Tak zase doma, co?
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ty jsi ten nejhnusn�j�� k�bl hnoje, co jsem kdy ve sv�m �ivot� potkala, ty mizern� svin�.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_ROSISFLUCHT = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_MINENANTEIL(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_minenanteil_condition;
	information = dia_rosi_minenanteil_info;
	description = "Prod�vat neleg�ln� d�ln� akcie - nestyd� se??";
};


func int dia_rosi_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rosi_minenanteil_info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//Prod�vat neleg�ln� d�ln� akcie - nestyd� se?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Ne. Z n��eho ��t mus�m. A taky nejsem jedin�, kdo je pustil do ob�hu.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_KAP6_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap6_exit_condition;
	information = dia_rosi_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_rosi_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_PICKPOCKET(C_INFO)
{
	npc = bau_936_rosi;
	nr = 900;
	condition = dia_rosi_pickpocket_condition;
	information = dia_rosi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rosi_pickpocket_condition()
{
	return c_beklauen(30,75);
};

func void dia_rosi_pickpocket_info()
{
	Info_ClearChoices(dia_rosi_pickpocket);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_BACK,dia_rosi_pickpocket_back);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_PICKPOCKET,dia_rosi_pickpocket_doit);
};

func void dia_rosi_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rosi_pickpocket);
};

func void dia_rosi_pickpocket_back()
{
	Info_ClearChoices(dia_rosi_pickpocket);
};

