
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Jsem Onarova ena, Maria.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Co tady chceš?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "Jen jsem si to chtìl tady prohlédnout.";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Jen jsem si to chtìl tady prohlédnout.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//S tolika chlapama na farmì se teï nemùu uvnitø domu moc zdrovat.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Prostì sem jen tak vpadli.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Obtìují tì ti oldáci?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Obtìují tì ti oldáci?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Hele, zapomeò na to, co jsem právì øekla - je tu teï mnohem bezpeènìji, co se ti chlapi objevili.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//No, pøinejmenším je tu teï, co jsou tu oldáci, mnohem bezpeènìji.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Dokud jsme tu byli sami, pokadé pøišla domobrana z mìsta a sebrala naši úrodu.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Sebrali nejlepší èást úrody. A taky si vzali pár ovcí. Nedali nám za to vùbec nic.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Nìkteøí z tìch nièemù se tu dokonce odváili krást.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Nevysvìtluj si to nijak zle, vojáku. Vím, e takoví nejsou všichni.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "Tak co ti ukradli?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//Tak co ti ukradli?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//Vìtšinou zlato a støíbro. Taky nám sebrali svatební dar. Zlatı tác.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Vsadím se, e teï se na nìm usazuje prach v truhle nìjakého mizerného mìstského stráného.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "Mám u sebe zlatı talíø. Není náhodou tvùj?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Mám u sebe zlatı talíø. Není náhodou tvùj?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Ano! To je on! Tisíceré díky!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "A co takhle nìjakou odmìnu?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//A co takhle nìjakou odmìnu?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Pracuješ pro mého manela jako oldnéø, ne?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Správnì.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Kolik ti platí?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//To tedy moc není. Zajdi za ním a øekni mu, a ti pøidá.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//A myslíš, e to udìlá?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Ví, co by se stalo, kdyby ne. Vìø mi.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Chceš se tady na farmì nechat najmout jako oldák?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"Ne - vánì ne.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Ano.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Tady, vezmi si to. Zaslouíš si to.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Ne - vánì ne.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Tak si na oplátku vezmi tohle zlato. Zaslouil sis to.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Ano.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Dobrá, pokud tady pracuješ, tak dohlédnu na to, abys dostával slušnı old.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Vra se, a si s mım manelem promluvíš o tvém platu.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "Øekni mi nìco o Onarovi.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Øekni mi nìco o Onarovi.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Je to fajn chlap. Trochu nabruèenı a hodnì netrpìlivı, ale všichni máme své chyby.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Øekla jsem svému mui, proè ty vojáky necháš se sebou takhle zacházet?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//Dìlej nìco, øíkám.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//Tak najal oldnéøe. Teï se cítím jako uprostøed války.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Ale mi vlastnì jsme ve válce, nebo ne?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Stalo se poslední dobou nìco zajímavého?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Stalo se poslední dobou nìco zajímavého?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Prošli tudy paladinové.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Nejdøív jsme si mysleli, e pøišli napadnout farmu, ale ve skuteènosti mìli namíøeno do Hornického údolí.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Wasili naèapal pøed pár dny v noci zlodìje. Jinak je tady klid.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//Je to tu mnohem klidnìjší, co nìkteøí ze oldnéøù odešli.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

