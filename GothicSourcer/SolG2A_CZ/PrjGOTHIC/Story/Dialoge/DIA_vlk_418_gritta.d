
instance DIA_GRITTA_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_exit_condition;
	information = dia_gritta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_gritta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PICKPOCKET(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 900;
	condition = dia_gritta_pickpocket_condition;
	information = dia_gritta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_gritta_pickpocket_condition()
{
	return c_beklauen(20,20);
};

func void dia_gritta_pickpocket_info()
{
	Info_ClearChoices(dia_gritta_pickpocket);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_BACK,dia_gritta_pickpocket_back);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_PICKPOCKET,dia_gritta_pickpocket_doit);
};

func void dia_gritta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gritta_pickpocket);
};

func void dia_gritta_pickpocket_back()
{
	Info_ClearChoices(dia_gritta_pickpocket);
};


instance DIA_GRITTA_HELLO(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 10;
	condition = dia_gritta_hello_condition;
	information = dia_gritta_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_hello_info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Co chceš, cizinèe? Jestli jsi pøišel ebrat, pak tì musím zklamat - jsem jenom chudá vdova.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Jmenuji se Gritta. Od té doby, co mi zemøel manel, vedu domácnost svému strıci Thorbenovi.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "Posílá mì Matteo, prı mu stále dluíš nìjaké peníze.";
};


func int dia_gritta_wantsmoney_condition()
{
	if(MIS_MATTEO_GOLD == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int gritta_wantpay;
var int gritta_threatened;

func void dia_gritta_wantsmoney_info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Posílá mì Matteo, prı mu stále dluíš nìjaké peníze.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//On chce své peníze? A proè? Zboí, které mi dodal, bylo vadné, špatnì utkané a ještì hùøe sešité.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//A vidìl jsi ty barvy? Vùbec se nepodobaly tìm, jaké jsem si objednala! Je to podvod, nic jiného!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Øeknu ti, e kdyby byl naivu mùj mu, Matteo by si nikdy nic takového nedovolil. Ach, mùj ubohı manel...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Nech toho. Kde jsou ty prachy?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Pokraèovat...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...byl to takovı dobrák. Pohlednı, pracovitı a dentlmen ze staré školy. Nic nám nechybìlo - byli jsme bohatí a šastní...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...obèas nás dokonce zvali i do lepší spoleènosti. Samé slavnosti, krásné šaty a úèesy...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...vybraná jídla a zdvoøilá konverzace. Všechno bylo tenkrát lepší. Tehdy by si nikdo nedovolil uráet nebohou vdovu takovımi...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Nech toho. Kde jsou ty prachy?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Pokraèovat...",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...smìšnımi tvrzeními. Co si jen poènu? Moje renta staèí jen taktak na pøeití a èasy jsou èím dál horší. Je to vidìt všude...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...lidé musí šetøit, škudlit a utahovat opasky. U celé tıdny do mìsta nedorazila ádná loï. Mùj mu bıval kapitánem obchodní lodi - vlastnì ji zároveò i vlastnil...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...ze svıch cest mi vdycky vozil dárky - nádherné látky z pevniny, vzácné koøení z jiních zemí...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Nech toho. Kde jsou ty prachy?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Pokraèovat...",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...vìtšina lidí o podobnıch vìcech nikdy neslyšela. Ale jednoho dne jsem dostala zprávu, e Gritta se potopila - ano, naše loï nesla toto jméno, mùj mu tím dával najevo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...lásku, jakou ke mnì choval. Plakala jsem a modlila se, aby mùj drahı to neštìstí pøeil, kadı den jsem doufala, e o nìm tøeba uslyším, ale má touha byla marná...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...ké se Innos smiluje nad jeho duší. A odpoèívá v pokoji. Od té doby tu pøebıvám v tìchto skromnıch podmínkách, a teï mì ten bezcitnı, bezohlednı Matteo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...chce pøipravit o poslední zbyteèek mıch celoivotních úspor. Prosím, smiluj se nad ubohou enou. Kdyby byl naivu mùj mu, nikdy by si nic takového nedovolil. Ach, mùj ubohı manel...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Pøestaò s tím. Kde je to zlato?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Pokraèovat...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Pøestaò s tím. Kde je to zlato?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(vzdorovitì) Ale já to zlato nemám, jsem jenom chudá vdova!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Naval prašule, nebo ti jednu vlepím!",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"Tak to asi budeme muset prodat nìjakı tvùj majetek...",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"Tak já tu sumu zaplatím za tebe.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Tak prostì prodej pár tìch svıch hadøíkù. Urèitì jich máš ve skøíni celou hromadu.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Jak se opovauješ, ty nevychovanèe! No tak dobøe, tady máš to zlato.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(úšklebek) Vida, ani to nebolelo.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(jedovatì) A teï prosím odejdi z mého domu.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Tak já tu sumu zaplatím za tebe.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Opravdu bys to pro mì udìlal? Ach, já vìdìla, e nejsi takovı nenaranı hajzl jako Matteo!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//No jo, to nic.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Vra se, a to zaøídíš - chci se ti nìjak odvdìèit.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(hrozivì) Naval prachy, nebo ti jednu vlepím!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(vyzıvavì) Jsi jenom prachsprostı lump. Jen pojï, vytas zbraò a já zavolám stráe!
	GRITTA_THREATENED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_WINE(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wine_condition;
	information = dia_gritta_wine_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_wine_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GRITTA_WANTPAY == TRUE) && (MIS_MATTEO_GOLD == LOG_SUCCESS) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		return TRUE;
	};
};

func void dia_gritta_wine_info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//To od tebe bylo opravdu šlechetné, es to za mì zaplatil. Chtìla bych se ti nìjak odmìnit.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Tuhle láhev vína mi manel - nech Innos dopøeje pokoj jeho duši - pøivezl z jiních ostrovù.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Také jsem to všude rozhlásila. Aspoò nìkdo tu má v tìle kouska cti.
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//No jo, to nic.
	b_giveplayerxp(XP_PAYFORGRITTA);
	b_giveinvitems(self,other,itfo_wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PERM(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 3;
	condition = dia_gritta_perm_condition;
	information = dia_gritta_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gritta_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_gritta_wantsmoney) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_gritta_perm_info()
{
	if(Npc_KnowsInfo(other,dia_gritta_wine) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Dokud jsou ve mìstì mui jako ty, stále mohu v srdci chovat nadìji, e se vše v dobré obrátí.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Vra se, a urovnáš tu záleitost s Matteem.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Co na mì tak blbì èumíš? Stejnì si na mì netroufneš zaútoèit!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Co ještì chceš? Moje zlato jsi u dostal, tak vypadni!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_KAP3_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_kap3_exit_condition;
	information = dia_gritta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_gritta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int grittaxp_once;

instance DIA_GRITTA_PERM3U4U5(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 31;
	condition = dia_gritta_perm3u4u5_condition;
	information = dia_gritta_perm3u4u5_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Jak se vede?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Všecko jde od desíti k pìti. A se podíváš, kam se podíváš, všude vládne zloèin a násilí. Jen si pøedstav - dokonce zabili jednoho z paladinù!
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"To je válka - takové vìci se stávají.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"To bude v poøádku.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"Co jsi zaslechla?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Ach, lord Hagen toho oldáka pustil - to mì tak dojalo!
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//A co to má spoleèného s tebou?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Jen se nad tím zamysli. Vìøíš, e by oldáci jen tak stáli a dívali se, jak jim vìší kamaráda?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Urèitì by se ho pokusili osvobodit, a z toho by koukalo poøádné krveprolití. Mohu tedy pouze dìkovat Innosovi.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Paladinové jsou pøipraveni a vypadá to, e se brzy vydají na cestu.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Všechno pøi starém, ale nechci si stìovat.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//To je válka - takové vìci se stávají.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Ano, za všechno mùe tahle strašná válka. Kadı nìjak trpí a zajímá ho, jak se s tím vším vypoøádají.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Obèas se ptám sama sebe, zaè nás Innos takhle trestá.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//To bude v poøádku.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//To je od tebe hezké, e mì chceš povzbudit.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Co jsi zaslechla?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Jenom to, co si vyprávìjí lidé na ulici.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Prı u chytli toho vraha, ale neøeknu ti, jestli je to pravda.
};

