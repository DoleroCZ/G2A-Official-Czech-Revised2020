
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hej, nemám èas tady s tebou klábosit. Jestli chceš nìjaké informace, promluv si s Kardifem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Hele, chlape, prostì mì nech na pokoji, dobrá?
		AI_StopProcessInfos(self);
	};
};


var int nagurhack;

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//Nemám dojem, že bych tì nepoznal jen proto, že máš jiný hadry!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(spiklenecky) Ty rád strkáš nos co vìcí, do kterých ti nic není, co?!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Ztra se!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	NAGURHACK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Kardif øíkal, že pro mì možná budeš mít nìjakou práci.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif øíkal, že pro mì možná budeš mít nìjakou práci.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//Tady v pøístavu není pro klášterní panáky na práci vùbec nic (smích).
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Tady v pøístavu není pro královské vojáky na práci vùbec nic.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(zkoumavì) Dobrá, dobrá, tak ty se poohlížíš po nìjaké speciální pøácièce. Ale hraje se podle mejch pravidel, jasný?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Co to znamená?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//To znamená to, že udìláš, co ti øeknu, a dostaneš tøetinu zisku.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Jestli se ti to nelíbí, nic pro tebe nemám.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"Jsme obchodní partneøi, takže hezky fifty-fifty.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"Dobrá, ty jsi šéf.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//Dobrá, ty jsi šéf.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Fajn, dej mi vìdìt, až budeš pøipravenej na nahrabání hromady penìz.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Jsme paráci, takže fifty-fifty.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Jo, jasnì, stejnì jsem si myslel, že to tak bude. Samozøejmì, že se spravedlivì rozdìlíme.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "Fajn, jakej je plán?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job) && (MIS_NAGUR_BOTE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Fajn, jakej je plán?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Znáš obchodníka Baltrama, ne? Jestli ne, tak je naèase si s ním promluvit.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//Ten Baltram má poslíèka, kterej ho zásobuje zbožím z Akilovy farmy.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//Teda, MÌL poslíèka, dokud jsem ho nepodøíz. A teï si Baltram shání nového. A tím budeš ty.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Necháš se Baltramem najmout a vezmeš tu dodávku od Akila.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Pøineseš mi ji a já ji pak prodám jednomu zajímavýmu zákazníkovi. Dá nám za to poøádnou sumièku zlata.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//A nepokoušej se to prodat sám. Je ti všechno jasný?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Tak dobrá, jdeme na to. (KONEC)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Kde najdu Baltrama?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"Kdy si mám s Baltramem promluvit?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Kde je Akilova farma?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"Kolik nám z toho kouká?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Kde je Akilova farma?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Opustíš mìsto východní branou. Je to ta pøímo u tržištì.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Když pùjdeš po cestì napravo, brzo narazíš na nìkolik stupòù vytesaných do skály.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Vyjdi po nich a narazíš na Akilovu farmu.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//Kolik nám z toho kouká?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Pøesnì tìžko øíct. Ale tak kolem 400 zlatých.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Kde najdu Baltrama?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Má svùj stánek na tržišti.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Kdy si mám s Baltramem promluvit?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//Mùžeš jít hned teï. Už by mìl vìdìt, že se jeho poslíèek už nikdy neukáže. (sprostý smích)
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Tak teda dobrá, jdu na to.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Fajn, tak jdi - ale jestli se mì pokusíš podvést, budeš úplnì stejnì mrtvej jako ten poslíèek! Nezapomeò na to!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"Musím Baltrama pøimìt, aby mì pøijal jako nového poslíèka. Pak musím pøebrat zásilku od farmáøe Akila a pøedat ji Nagurovi.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "Pøinesl jsem ten balík.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Pøinesl jsem ten balík.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Dobrá práce. Zkusím to prodat. Vra se zítra.
	b_logentry(TOPIC_NAGUR,"Nagur pøijal zásilku. Zaplatí mi zítra.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "Prodal jsi teda to zboží?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Prodal jsi teda to zboží?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Jo, ale za míò, než jsem myslel. Dostal jsem jen 300 zlatých.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Kus z toho je pro moje zamìstnance.
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//A Kardif dostane svùj obvyklý podíl - plus zlato na tvoji provizi.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Což nakonec dìlá 240 zlatých. Rozdìlíme si to, jak jsme se dohodli. Tady je tvùj díl.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Odvedl jsi dobrou práci. Nechal jsem na to svých zamìstnancích.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Co se na tom vydìlá, už nijak neovlivním.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Ne, ještì ne. Tahle vìc chce svùj èas. Chci po tom všem dostat dobrou cenu.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Kdo jsou tví zamìstnanci?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Kdo jsou tví zamìstnanci?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Vážnì si nemyslíš, že ti to øeknu, že ne?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE) && (NAGURHACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Ten kšeft dopadnul dobøe, ale o svých lidech nemluvím. Takže klídek.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Podvedl jsi mì! To byla velká chyba - jdi do hajzlu!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(Pøedvést zlodìjský signál.)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Dokázals to. Teï víš, kdo jsou mí zamìstnanci.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Drž se toho, co ti øekla Cassia - nestaráme se o to, kdo jsou ti ostatní. Jsi jedním z nás, a na nièem jiným nesejde.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Podívej se po nìkom jiném. Potlouká se tu kolem dost lidí. Už pro tebe nic dalšího nemám.
	AI_StopProcessInfos(self);
};

