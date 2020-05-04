
instance DIA_ADDON_MARTIN_EXIT(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 999;
	condition = dia_addon_martin_exit_condition;
	information = dia_addon_martin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_martin_exit_condition()
{
	return TRUE;
};

func void dia_addon_martin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_PICKPOCKET(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 900;
	condition = dia_addon_martin_pickpocket_condition;
	information = dia_addon_martin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_martin_pickpocket_condition()
{
	return c_beklauen(65,77);
};

func void dia_addon_martin_pickpocket_info()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_BACK,dia_addon_martin_pickpocket_back);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_PICKPOCKET,dia_addon_martin_pickpocket_doit);
};

func void dia_addon_martin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_martin_pickpocket);
};

func void dia_addon_martin_pickpocket_back()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
};


instance DIA_ADDON_MARTIN_MEETINGISRUNNING(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 1;
	condition = dia_addon_martin_meetingisrunning_condition;
	information = dia_addon_martin_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_martin_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_martin_meetingisrunning_onetime;

func void dia_addon_martin_meetingisrunning_info()
{
	if(DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//Tak ty jsi ten nový chlapík? Vítej mezi námi, bratøe "Kruhu".
		DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Bež a podívej se za Vatrasem. Možná na tebe budu mít èas pozdìji.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_HALLO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_hallo_condition;
	information = dia_addon_martin_hallo_info;
	important = TRUE;
};


func int dia_addon_martin_hallo_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS) && (SC_ISRANGER == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_addon_martin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty. Ty tu nemáš co pohledávat. Pouze paladinové a domobrana tam mùže.
};


instance DIA_ADDON_MARTIN_WASMACHSTDU(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_wasmachstdu_condition;
	information = dia_addon_martin_wasmachstdu_info;
	description = "Co je tam k vidìní?";
};


func int dia_addon_martin_wasmachstdu_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void dia_addon_martin_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//Co je tam k vidìní?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Stojíš na pùdì královských paladinù.
	if((other.guild == GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Já zde velím a jsem zodpovìdný za to, že se nic z paladinských vìcí neztratí. A ty tu nejsi vítán.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Tak drž své prsty radìji dál, jinak tì pøes nì klepnu.
	};
};


instance DIA_ADDON_MARTIN_PRETRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_pretrade_condition;
	information = dia_addon_martin_pretrade_info;
	description = "Nemùžeš mi prodat nìjaké paladinské vìci?";
};


func int dia_addon_martin_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_pretrade_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nemùžeš mi prodat nìjaké paladinské vìci?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chceš nìco koupit? Udìláme to takto: Když mì odškodníš za potíže, které mi nastanou, pokud se znova nìco ztratí, pak možná budeme moci spolu obchodovat.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Je toho hodnì, co se ztratilo?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Dùstojníci øíkají, že je vše v poøádku. Ne, nic nechybí.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Vidím.
};


instance DIA_ADDON_MARTIN_FARIM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_farim_condition;
	information = dia_addon_martin_farim_info;
	description = "Rybáø Farim má problém s domobranou. Frajírci ho okrádají.";
};


func int dia_addon_martin_farim_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};

func void dia_addon_martin_farim_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Rybáø Farim má problém s domobranou. Frajírci ho okrádají.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//A proè by mì to mìlo zajímat?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//Máš zde jistý vliv mezi paladiny.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim potøebuje tvou ochranu. Rád ti dá èást svého úlovku jako odškodné.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Vím, co tím myslíš.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//(sarkasticky) Ryby! Jako bych se nemìl o co starat.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Øekni mu, a pøijde ke mnì. Chci pøesnì vìdìt, jak to s tou domobranou bylo.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Podívám se na to.
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Dùstojník Martin to prošetøí.");
	MARTIN_KNOWSFARIM = TRUE;
	b_giveplayerxp(XP_ADDON_FARIMSCHUTZ);
};


instance DIA_ADDON_MARTIN_TRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 80;
	condition = dia_addon_martin_trade_condition;
	information = dia_addon_martin_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi nabídneš?";
};


func int dia_addon_martin_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};


var int dia_addon_martin_trade_onetime;

func void dia_addon_martin_trade_info()
{
	if(DIA_ADDON_MARTIN_TRADE_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_MARTINTRADE);
		DIA_ADDON_MARTIN_TRADE_ONETIME = TRUE;
	};
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi nabídneš?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Pojï se podívat blíž.
};


instance DIA_ADDON_MARTIN_RANGERHELP(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_rangerhelp_condition;
	information = dia_addon_martin_rangerhelp_info;
	description = "Lares mì poslal. Øekl, že mi pomùžeš.";
};


func int dia_addon_martin_rangerhelp_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Lares mì poslal. Øekl, že mi pomùžeš.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Opravdu? Tak to tu máme. Co bys ode mì chtìl?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chci se pøidat k domobranì.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(smìje se) Opravdu bys to chtìl? Obvykle nepøijímáme takové hlupáky jako jsi ty. Ne bez dobrého dùvodu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Hmmm musel bys prvnì ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Nech hloupostí. Øekni mi, co musím udìlat, abys mì tam dostal.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(pøekvapenì) Ok. Poslouchej.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Být dùstojníkem je peklo, to ti øíkám. Organizovat všechno tyhle bedny a pytle na tomto molu je špatné dost samo o sobì.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Ale kdykoliv si zajdu veèer ke Kardifovi do hospody, nìkdo pohýbe s bednami a když jsem ráno zpátky, nìco chybí.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(nevrle) Divné, paladinové nikdy nikoho nevypátrali.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//(rozzlobenì) Kašlu na to. Nemùžu tu pøece zùstat celou noc jako nejaký idiot.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Nicménì ty ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//A, beru to. Pøedpokládám, že tu budu strážit celou noc, zatímco ty budeš v hospodì odpoèívat.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Ber nebo nech být.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Budu dohlížet na Martinovy bedny v noci. Jestliže chytím toho, kdo bere bedny, Martin mi pomùže pøidat se k domobranì.");
};


instance DIA_ADDON_MARTIN_AUFTRAG(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_auftrag_condition;
	information = dia_addon_martin_auftrag_info;
	description = "Nespustím dnes veèer oèi z tvých dopravních beden.";
};


func int dia_addon_martin_auftrag_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};


var int mis_addon_martin_getrangar_day;

func void dia_addon_martin_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Nespustím dnes veèer oèi z tvých dopravních beden.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//(potìšenì) Výbornì.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Jdu tedy ke Kardifovi do baru. A ne aby nìco chybìlo, jak se vrátím.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Dobrá. Pøiï veèer a dohlížej na celé molo. Já budu u Kardifa v hospodì.
	};
	b_startotherroutine(mil_321_rangar,"PrePalCampKlau");
	Info_ClearChoices(dia_addon_martin_auftrag);
	Info_AddChoice(dia_addon_martin_auftrag,"(weiter)",dia_addon_martin_auftrag_weiter);
};

func void dia_addon_martin_auftrag_weiter()
{
	MIS_ADDON_MARTIN_GETRANGAR = LOG_RUNNING;
	MIS_ADDON_MARTIN_GETRANGAR_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(mil_321_rangar,"PalCampKlau");
};


instance DIA_ADDON_MARTIN_FROMVATRAS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fromvatras_condition;
	information = dia_addon_martin_fromvatras_info;
	description = "Hledáš muže, který prodává zbranì banditùm?";
};


func int dia_addon_martin_fromvatras_condition()
{
	if(VATRAS_TOMARTIN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_martin_fromvatras_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Hledáš muže, který prodává zbranì banditùm?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//Øíká kdo?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Øíká Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Oh. Co o tom víš?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Ne mnoho, ale mohl bych zjistit více.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//(uvìdomìle) Uvidím, co øekneš ...
};


instance DIA_ADDON_MARTIN_TELLALL(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_tellall_condition;
	information = dia_addon_martin_tellall_info;
	description = "Øekneš mi, co víš o tom dealerovi zbraní?";
};


func int dia_addon_martin_tellall_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_fromvatras))
	{
		return TRUE;
	};
};

func void dia_addon_martin_tellall_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Øekneš mi, co víš o tom dealerovi zbraní?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Ok, poslouchej. Víme, že za tím stojí nìkdo z Horní ètvrti.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Nìkteré zbranì dokonce pocházejí ze zbrojnice domobrany.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Ale nevíme kdo se pøesnì za tím skrývá.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Kdybys mìl dost odvahy zbouchat skupinu aspoò pìti banditù, pak bys možná zjistil více ...
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Prodejce zbraní je podle Martina nìkdo z Horní ètvrti.");
};


instance DIA_ADDON_MARTIN_ABOUTBANDITS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_aboutbandits_condition;
	information = dia_addon_martin_aboutbandits_info;
	description = "Co víš o banditech?";
};


func int dia_addon_martin_aboutbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_tellall))
	{
		return TRUE;
	};
};

func void dia_addon_martin_aboutbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Víme, že banditi se skrývají po cestì mezi farmáøi a mìstem.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//A také víme, že jim musela nedávno dojít dodávka zbraní.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Možná najdeme nìjakou stopu mezi bandity, která by nás dovedla k dealerovi zbraní.
	MIS_MARTIN_FINDTHEBANDITTRADER = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Banditi se skrývají na cestì mezi farmáøi a pøístavním mìstem. Možná u nich najdu nìjakou stopu vedoucí k dopadení dealera zbraní.");
};


instance DIA_ADDON_MARTIN_FERNANDO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fernando_condition;
	information = dia_addon_martin_fernando_info;
	permanent = TRUE;
	description = "O prodejci zbraní ...";
};


func int dia_addon_martin_fernando_condition()
{
	if(MIS_MARTIN_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int martin_irrlichthint;

func void dia_addon_martin_fernando_info()
{
	var int fernandohints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//O dealerovi zbraní ...
	if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Ukaž, co máš ...
		fernandohints = 0;
		if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)))
		{
			if(Npc_HasItems(other,itmw_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Vezmi si tento kord od banditù. Je na nìm vyryto písmeno "F".
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itri_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//Tento prsten je od jednoho z banditù. Vypadá to na zámoøského obchodníka.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Tento seznam zbraní a ostatního zboží doruèeného banditùm jasnì ukazuje na Fernanda.
				fernandohints = fernandohints + 3;
			};
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Navíc Fernando, obchodník v horní ètvrti, se pøiznal, že obchoduje s bandity.
				fernandohints = fernandohints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando se pøiznal, že podporoval bandity zbranìmi.
		};
		if(fernandohints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//Myslím, že je to jasné. Je to Fernando. Pùjde do vìzení.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//Divné. Vždy vypadal jako obèan Horní ètvrti.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Mùžu tì ubezpeèit, že neuvidí denní svìtlo ještì hodnì dlouho.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Udìlal jsi to opravdu dobøe. Velmi dobøe.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras bude potìšen tìmito dobrými zprávami.
			b_startotherroutine(fernando,"Prison");
			FERNANDO_IMKNAST = TRUE;
			MIS_MARTIN_FINDTHEBANDITTRADER = LOG_SUCCESS;
			b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin mì ujistil, že Fernando dostane, co si zasluží. Mìl bych o tom Vatrase informovat.");
			b_giveplayerxp(XP_ADDON_FERNANDOMARTIN);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//Nìco dalšího?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To je vše.
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//(Odmítavì) Velmi pìkné, ale bez pádného dùkazu nemùžu nic udìlat.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nechci ze sebe udìlat hlupáka pøed lordem Hagenem. Musíš najít víc dùkazù.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nestaèí. Mùže to být kdokoliv z Horní ètvrti.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Vypadá to, že budeme muset sledovat bandity a kradené zboží ještì trochu dýl. Dokud nezjistíme, kdo za tím stojí.
				if(MARTIN_IRRLICHTHINT == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Možná bys mìl s Vatrasem promluvit znova.
					MARTIN_IRRLICHTHINT = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Co to, znovu?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Byls povìøen zjistit, kdo stojí za dodávkama zbraní banditùm. Tak mi pøines dùkaz.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//A bude to muset být vážnì obviòující dùkaz, nebo ho nebudeme moci zatknout.
	};
};


instance DIA_ADDON_MARTIN_PERM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 90;
	condition = dia_addon_martin_perm_condition;
	information = dia_addon_martin_perm_info;
	permanent = TRUE;
	description = "Bedny zde stále jsou?";
};


func int dia_addon_martin_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Bedny zde stále jsou?
	if((MIS_ADDON_MARTIN_GETRANGAR_DAY <= (Wld_GetDay() - 2)) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(rozzlobenì) Ty zkurvysyne. Byl jsi povìøen hlídat bedny. Nyní chybí nìco dalšího.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//(hlasitì) Pùjdeš k skladišti na druhé stranì pøístavu a dostaneš toho hajzla, který mì okradl.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//Dnes veèer se budeš dívat poøádnì, jak odejdu. Rozumìls?
		};
	}
	else if((MIS_ADDON_MARTIN_GETRANGAR != 0) || (hero.guild != GIL_NONE) || (SC_ISRANGER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Á, Á, smìje se jak jen mùže. Rád se budu dívat, jak zde stojíš po celý den, a zkoušíš udìlat poøádek v tomto svinstvu.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladinové rozvážející binec, jak deprimující.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Na nic nešahej nebo zavolám stráže, slyšels mì?
	};
};


instance DIA_ADDON_MARTIN_GOTRANGAR(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_gotrangar_condition;
	information = dia_addon_martin_gotrangar_info;
	description = "Našel jsem toho zlodìje.";
};


func int dia_addon_martin_gotrangar_condition()
{
	if((MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING) && (SC_GOTRANGAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_gotrangar_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Najdu toho zlodìje.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//Je to Rangar, kdo rozebírá váš sklad.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Koneènì, aspoò vím, na koho si mám poèkat. Ten darebák. Ten dostane lekci, až ho dostanu do rukou.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Ale opravdu by mì zajímalo, proè paladinové nic nevidìli.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//A? Proè?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Není to zøejmé. Ti blbci nám nemohou øíci nic o domobranì. Pøesto se jim divím.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Byla to ale dobrá práce, kámo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Kdyby bylo cokoliv, s èím bych ti mohl pomoci, jen dej vìdìt.
	MIS_ADDON_MARTIN_GETRANGAR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR_REPORT);
};


instance DIA_ADDON_MARTIN_GETMILIZ(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_getmiliz_condition;
	information = dia_addon_martin_getmiliz_info;
	description = "Ty víš, co chci.";
};


func int dia_addon_martin_getmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_gotrangar))
	{
		return TRUE;
	};
};

func void dia_addon_martin_getmiliz_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Ty víš, co chci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Ano, samozøejmì. Chceš se pøidat k domobranì, neníliž pravda?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Prokázal jsi dobøe své schopnosti.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Oh, dobøe, udìláme to takto. Radši bych vìdìl, zdali jsi na naší stranì, nebo na nìèí jiné.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//To je proè jsem ti pomáhal. Vezmi si tento doporuèující dopis a ukaž ho Andremu, našemu velícímu paladinu.
	CreateInvItems(self,itwr_martin_milizempfehlung_addon,1);
	b_giveinvitems(self,other,itwr_martin_milizempfehlung_addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Najdeš ho v kasárnách. Jsem si jist, že využije chlapa jako ty.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Martin mi dal doporuèující list pro velícho paladina Andreho. Andre mì nyní pøijme k domobranì. Mùžu ho nalézt v kasárnách.");
};

