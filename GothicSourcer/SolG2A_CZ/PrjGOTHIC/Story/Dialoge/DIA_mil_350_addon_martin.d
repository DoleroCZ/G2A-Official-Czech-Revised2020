
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
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//Tak ty jsi ten nov� chlap�k? V�tej mezi n�mi, brat�e "Kruhu".
		DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Be� a pod�vej se za Vatrasem. Mo�n� na tebe budu m�t �as pozd�ji.
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
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty. Ty tu nem� co pohled�vat. Pouze paladinov� a domobrana tam m��e.
};


instance DIA_ADDON_MARTIN_WASMACHSTDU(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_wasmachstdu_condition;
	information = dia_addon_martin_wasmachstdu_info;
	description = "Co je tam k vid�n�?";
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
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//Co je tam k vid�n�?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Stoj� na p�d� kr�lovsk�ch paladin�.
	if((other.guild == GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//J� zde vel�m a jsem zodpov�dn� za to, �e se nic z paladinsk�ch v�c� neztrat�. A ty tu nejsi v�t�n.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Tak dr� sv� prsty rad�ji d�l, jinak t� p�es n� klepnu.
	};
};


instance DIA_ADDON_MARTIN_PRETRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_pretrade_condition;
	information = dia_addon_martin_pretrade_info;
	description = "Nem��e� mi prodat n�jak� paladinsk� v�ci?";
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
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nem��e� mi prodat n�jak� paladinsk� v�ci?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chce� n�co koupit? Ud�l�me to takto: Kdy� m� od�kodn� za pot�e, kter� mi nastanou, pokud se znova n�co ztrat�, pak mo�n� budeme moci spolu obchodovat.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Je toho hodn�, co se ztratilo?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//D�stojn�ci ��kaj�, �e je v�e v po��dku. Ne, nic nechyb�.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Vid�m.
};


instance DIA_ADDON_MARTIN_FARIM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_farim_condition;
	information = dia_addon_martin_farim_info;
	description = "Ryb�� Farim m� probl�m s domobranou. Fraj�rci ho okr�daj�.";
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
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Ryb�� Farim m� probl�m s domobranou. Fraj�rci ho okr�daj�.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//A pro� by m� to m�lo zaj�mat?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//M� zde jist� vliv mezi paladiny.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim pot�ebuje tvou ochranu. R�d ti d� ��st sv�ho �lovku jako od�kodn�.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//V�m, co t�m mysl�.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//(sarkasticky) Ryby! Jako bych se nem�l o co starat.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//�ekni mu, a� p�ijde ke mn�. Chci p�esn� v�d�t, jak to s tou domobranou bylo.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Pod�v�m se na to.
	b_logentry(TOPIC_ADDON_FARIMSFISH,"D�stojn�k Martin to pro�et��.");
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
	description = "Co mi nab�dne�?";
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
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi nab�dne�?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Poj� se pod�vat bl�.
};


instance DIA_ADDON_MARTIN_RANGERHELP(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_rangerhelp_condition;
	information = dia_addon_martin_rangerhelp_info;
	description = "Lares m� poslal. �ekl, �e mi pom��e�.";
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
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Lares m� poslal. �ekl, �e mi pom��e�.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Opravdu? Tak to tu m�me. Co bys ode m� cht�l?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chci se p�idat k domobran�.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(sm�je se) Opravdu bys to cht�l? Obvykle nep�ij�m�me takov� hlup�ky jako jsi ty. Ne bez dobr�ho d�vodu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Hmmm musel bys prvn� ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Nech hloupost�. �ekni mi, co mus�m ud�lat, abys m� tam dostal.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(p�ekvapen�) Ok. Poslouchej.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//B�t d�stojn�kem je peklo, to ti ��k�m. Organizovat v�echno tyhle bedny a pytle na tomto molu je �patn� dost samo o sob�.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Ale kdykoliv si zajdu ve�er ke Kardifovi do hospody, n�kdo poh�be s bednami a kdy� jsem r�no zp�tky, n�co chyb�.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(nevrle) Divn�, paladinov� nikdy nikoho nevyp�trali.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//(rozzloben�) Ka�lu na to. Nem��u tu p�ece z�stat celou noc jako nejak� idiot.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Nicm�n� ty ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//A, beru to. P�edpokl�d�m, �e tu budu str�it celou noc, zat�mco ty bude� v hospod� odpo��vat.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Ber nebo nech b�t.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Budu dohl�et na Martinovy bedny v noci. Jestli�e chyt�m toho, kdo bere bedny, Martin mi pom��e p�idat se k domobran�.");
};


instance DIA_ADDON_MARTIN_AUFTRAG(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_auftrag_condition;
	information = dia_addon_martin_auftrag_info;
	description = "Nespust�m dnes ve�er o�i z tv�ch dopravn�ch beden.";
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
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Nespust�m dnes ve�er o�i z tv�ch dopravn�ch beden.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//(pot�en�) V�born�.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Jdu tedy ke Kardifovi do baru. A ne aby n�co chyb�lo, jak se vr�t�m.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Dobr�. P�i� ve�er a dohl�ej na cel� molo. J� budu u Kardifa v hospod�.
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
	description = "Hled� mu�e, kter� prod�v� zbran� bandit�m?";
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
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Hled� mu�e, kter� prod�v� zbran� bandit�m?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//��k� kdo?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//��k� Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Oh. Co o tom v�?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Ne mnoho, ale mohl bych zjistit v�ce.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//(uv�dom�le) Uvid�m, co �ekne� ...
};


instance DIA_ADDON_MARTIN_TELLALL(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_tellall_condition;
	information = dia_addon_martin_tellall_info;
	description = "�ekne� mi, co v� o tom dealerovi zbran�?";
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
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//�ekne� mi, co v� o tom dealerovi zbran�?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Ok, poslouchej. V�me, �e za t�m stoj� n�kdo z Horn� �tvrti.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//N�kter� zbran� dokonce poch�zej� ze zbrojnice domobrany.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Ale nev�me kdo se p�esn� za t�m skr�v�.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Kdybys m�l dost odvahy zbouchat skupinu aspo� p�ti bandit�, pak bys mo�n� zjistil v�ce ...
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Prodejce zbran� je podle Martina n�kdo z Horn� �tvrti.");
};


instance DIA_ADDON_MARTIN_ABOUTBANDITS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_aboutbandits_condition;
	information = dia_addon_martin_aboutbandits_info;
	description = "Co v� o banditech?";
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
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//Co v� o banditech?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//V�me, �e banditi se skr�vaj� po cest� mezi farm��i a m�stem.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//A tak� v�me, �e jim musela ned�vno doj�t dod�vka zbran�.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Mo�n� najdeme n�jakou stopu mezi bandity, kter� by n�s dovedla k dealerovi zbran�.
	MIS_MARTIN_FINDTHEBANDITTRADER = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Banditi se skr�vaj� na cest� mezi farm��i a p��stavn�m m�stem. Mo�n� u nich najdu n�jakou stopu vedouc� k dopaden� dealera zbran�.");
};


instance DIA_ADDON_MARTIN_FERNANDO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fernando_condition;
	information = dia_addon_martin_fernando_info;
	permanent = TRUE;
	description = "O prodejci zbran� ...";
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
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//O dealerovi zbran� ...
	if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Uka�, co m� ...
		fernandohints = 0;
		if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)))
		{
			if(Npc_HasItems(other,itmw_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Vezmi si tento kord od bandit�. Je na n�m vyryto p�smeno "F".
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itri_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//Tento prsten je od jednoho z bandit�. Vypad� to na z�mo�sk�ho obchodn�ka.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Tento seznam zbran� a ostatn�ho zbo�� doru�en�ho bandit�m jasn� ukazuje na Fernanda.
				fernandohints = fernandohints + 3;
			};
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Nav�c Fernando, obchodn�k v horn� �tvrti, se p�iznal, �e obchoduje s bandity.
				fernandohints = fernandohints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando se p�iznal, �e podporoval bandity zbran�mi.
		};
		if(fernandohints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//Mysl�m, �e je to jasn�. Je to Fernando. P�jde do v�zen�.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//Divn�. V�dy vypadal jako ob�an Horn� �tvrti.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//M��u t� ubezpe�it, �e neuvid� denn� sv�tlo je�t� hodn� dlouho.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Ud�lal jsi to opravdu dob�e. Velmi dob�e.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras bude pot�en t�mito dobr�mi zpr�vami.
			b_startotherroutine(fernando,"Prison");
			FERNANDO_IMKNAST = TRUE;
			MIS_MARTIN_FINDTHEBANDITTRADER = LOG_SUCCESS;
			b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin m� ujistil, �e Fernando dostane, co si zaslu��. M�l bych o tom Vatrase informovat.");
			b_giveplayerxp(XP_ADDON_FERNANDOMARTIN);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//N�co dal��ho?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To je v�e.
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//(Odm�tav�) Velmi p�kn�, ale bez p�dn�ho d�kazu nem��u nic ud�lat.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nechci ze sebe ud�lat hlup�ka p�ed lordem Hagenem. Mus� naj�t v�c d�kaz�.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nesta��. M��e to b�t kdokoliv z Horn� �tvrti.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Vypad� to, �e budeme muset sledovat bandity a kraden� zbo�� je�t� trochu d�l. Dokud nezjist�me, kdo za t�m stoj�.
				if(MARTIN_IRRLICHTHINT == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Mo�n� bys m�l s Vatrasem promluvit znova.
					MARTIN_IRRLICHTHINT = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Co to, znovu?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Byls pov��en zjistit, kdo stoj� za dod�vkama zbran� bandit�m. Tak mi p�ines d�kaz.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//A bude to muset b�t v�n� obvi�uj�c� d�kaz, nebo ho nebudeme moci zatknout.
	};
};


instance DIA_ADDON_MARTIN_PERM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 90;
	condition = dia_addon_martin_perm_condition;
	information = dia_addon_martin_perm_info;
	permanent = TRUE;
	description = "Bedny zde st�le jsou?";
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
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Bedny zde st�le jsou?
	if((MIS_ADDON_MARTIN_GETRANGAR_DAY <= (Wld_GetDay() - 2)) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(rozzloben�) Ty zkurvysyne. Byl jsi pov��en hl�dat bedny. Nyn� chyb� n�co dal��ho.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//(hlasit�) P�jde� k skladi�ti na druh� stran� p��stavu a dostane� toho hajzla, kter� m� okradl.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//Dnes ve�er se bude� d�vat po��dn�, jak odejdu. Rozum�ls?
		};
	}
	else if((MIS_ADDON_MARTIN_GETRANGAR != 0) || (hero.guild != GIL_NONE) || (SC_ISRANGER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//�, �, sm�je se jak jen m��e. R�d se budu d�vat, jak zde stoj� po cel� den, a zkou�� ud�lat po��dek v tomto svinstvu.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladinov� rozv�ej�c� binec, jak deprimuj�c�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Na nic ne�ahej nebo zavol�m str�e, sly�els m�?
	};
};


instance DIA_ADDON_MARTIN_GOTRANGAR(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_gotrangar_condition;
	information = dia_addon_martin_gotrangar_info;
	description = "Na�el jsem toho zlod�je.";
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
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Najdu toho zlod�je.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//Je to Rangar, kdo rozeb�r� v� sklad.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Kone�n�, aspo� v�m, na koho si m�m po�kat. Ten dareb�k. Ten dostane lekci, a� ho dostanu do rukou.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Ale opravdu by m� zaj�malo, pro� paladinov� nic nevid�li.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//A? Pro�?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Nen� to z�ejm�. Ti blbci n�m nemohou ��ci nic o domobran�. P�esto se jim div�m.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Byla to ale dobr� pr�ce, k�mo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Kdyby bylo cokoliv, s ��m bych ti mohl pomoci, jen dej v�d�t.
	MIS_ADDON_MARTIN_GETRANGAR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR_REPORT);
};


instance DIA_ADDON_MARTIN_GETMILIZ(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_getmiliz_condition;
	information = dia_addon_martin_getmiliz_info;
	description = "Ty v�, co chci.";
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
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Ty v�, co chci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Ano, samoz�ejm�. Chce� se p�idat k domobran�, nen�li� pravda?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Prok�zal jsi dob�e sv� schopnosti.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Oh, dob�e, ud�l�me to takto. Rad�i bych v�d�l, zdali jsi na na�� stran�, nebo na n��� jin�.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//To je pro� jsem ti pom�hal. Vezmi si tento doporu�uj�c� dopis a uka� ho Andremu, na�emu vel�c�mu paladinu.
	CreateInvItems(self,itwr_martin_milizempfehlung_addon,1);
	b_giveinvitems(self,other,itwr_martin_milizempfehlung_addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Najde� ho v kas�rn�ch. Jsem si jist, �e vyu�ije chlapa jako ty.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Martin mi dal doporu�uj�c� list pro vel�cho paladina Andreho. Andre m� nyn� p�ijme k domobran�. M��u ho nal�zt v kas�rn�ch.");
};

