
instance DIA_ANDRE_EXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_exit_condition;
	information = dia_andre_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_andre_exit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_firstexit_condition;
	information = dia_andre_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_andre_firstexit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_andre_firstexit_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(wulfgar,"START");
};


var int andre_steckbrief;

func void b_andre_steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//Jeden z mých mužù mi øekl, že bandité roznášejí plakáty s vypsanou odmìnou a že je na nich tvoje tváø.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//Také mi øekl, žes to nejdøív popøel.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//Takže o co tady jde?
	AI_Output(other,self,"DIA_Andre_Add_15_03");	//Nevím, proè mì ti lidé hledají...
	AI_Output(self,other,"DIA_Andre_Add_08_04");	//Pro tvoje vlastní dobrou doufám, že øíkáš pravdu.
	AI_Output(self,other,"DIA_Andre_Add_08_05");	//Nechci v domobranì nikoho, kdo nemá èistý rejstøík.
	AI_Output(self,other,"DIA_Andre_Add_08_06");	//Vìtšina z tìch banditù jsou bývalí vìzni z tìžaøské kolonie.
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//Doufám, že ses s tìmi hrdloøezy nijak nezapletl!
	ANDRE_STECKBRIEF = TRUE;
};


var int andre_cantharfalle;

func void b_andre_cantharfalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//Byl tady kupec Canthar. Povídal, že jsi uprchlý trestanec z tìžaøské kolonie.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//Nevím, jestli to je pravda, a radši bych se tì neptal, ale mìl bys to nìjak objasnit.
	b_removenpc(sarah);
	b_startotherroutine(canthar,"MARKTSTAND");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
	{
		CANTHAR_SPERRE = TRUE;
	};
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	ANDRE_CANTHARFALLE = TRUE;
};


instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_cantharfalle_condition;
	information = dia_andre_cantharfalle_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_cantharfalle_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		return TRUE;
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		return TRUE;
	};
};

func int dia_andre_cantharfalle_info()
{
	if(ANDRE_STECKBRIEF == FALSE)
	{
		b_andre_steckbrief();
	};
	if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
	{
		b_andre_cantharfalle();
	};
};


var int andre_lastpetzcounter;
var int andre_lastpetzcrime;

instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_pmschulden_condition;
	information = dia_andre_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_andre_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Pøišel jsi zaplatit svou pokutu?
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//Už jsem se sám sebe ptal, jestli budeš mít dost odvahy sem pøijít!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Zdá se, že se poèet žalob na tebe ještì znásobil!
		if(ANDRE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Varoval jsem tì! Pokuta, kterou musíš zaplatit, je ještì vyšší!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
			};
			if(ANDRE_SCHULDEN > 1000)
			{
				ANDRE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,ANDRE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//Vážnì jsi mì zklamal!
		};
	}
	else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Objevilo se pár nových vìcí.
		if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Už není nikdo, kdo by tì obviòoval z vraždy.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//Už si nikdo nevzpomíná, že by tì vidìl pøi krádeži.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//Už nejsou žádní svìdkové, kteøí by tvrdili, že tì vidìli úèastnit se rvaèky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Zdá se, že se všechna obvinìní proti tobì nakonec vyjasnila.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Nevím, jak se to stalo, ale varuji tì: nehraj si se mnou.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Každopádnì jsem se rozhodl odpustit ti tvoje dluhy.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Dej si pozor, aby ses nedostal do žádných dalších potíží.
			ANDRE_SCHULDEN = 0;
			ANDRE_LASTPETZCOUNTER = 0;
			ANDRE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Jedno si vyjasnìme: tak jako tak budeš muset zaplatit pokutu v plné výši.
			b_say_gold(self,other,ANDRE_SCHULDEN);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Tak, kolik to dìlá?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_andre_pmschulden);
		Info_ClearChoices(dia_andre_petzmaster);
		Info_AddChoice(dia_andre_pmschulden,"Nemám dost penìz!",dia_andre_petzmaster_paylater);
		Info_AddChoice(dia_andre_pmschulden,"Kolik že to bylo?",dia_andre_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
		{
			Info_AddChoice(dia_andre_pmschulden,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
		};
	};
};

func void dia_andre_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_pmschulden,"Nemám dost penìz.",dia_andre_petzmaster_paylater);
	Info_AddChoice(dia_andre_pmschulden,"Kolik že to bylo?",dia_andre_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_pmschulden,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
	};
};


instance DIA_ANDRE_PETZMASTER(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_petzmaster_condition;
	information = dia_andre_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_info()
{
	ANDRE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ty musíš být ten nový chlapík, který tady ve mìstì dìlá tolik problémù.
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//Dobøe, že jsi za mnou pøišel, než to zaèalo být pro tebe ještì horší.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Vražda je vážný zloèin!
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//A to nemluvím o tìch dalších vìcech, které jsi napáchal.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//Strážní mají rozkazy trestat každého vraha hned na místì.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//A vìtšina obèanù nehodlá vraždy na území mìsta tolerovat!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//Nemám žádný zájem na tom tì povìsil. Jsme ve válce a potøebujeme každého muže.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//Ale nebude lehké pøesvìdèit lidi, aby o tobì smýšleli zase lépe.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//Mìl bys projevit svou lítost zaplacením pokuty - pochopitelnì pøimìøenì vysoké.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//Dobøe, že jsi pøišel! Jsi obvinìný z krádeže! Jsou na to svìdci!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//A to nemluvím o dalších vìcech, které se mi donesly.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//Takové chování nebudu ve mìstì tolerovat!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//Abys odèinil svùj zloèin, musíš zaplatit pokutu.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//Je nìco jiného, když se popereš s lùzou v pøístavu...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//Ale jakmile zaútoèíš na obèany nebo královské vojáky, musíš jít pøed soud.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//A to s tou ovcí bylo také zcela zbyteèné.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//Kdybych tì nechal odejít jen tak, bude si tady za chvíli každý dìlat, co se mu zlíbí.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//Takže zaplatíš pøimìøenou pokutu - a na celou vìc zapomeneme.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//Slyšel jsem, že sis zasedl na naše ovce.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//Uvìdom si, že to nemohu nechat být jen tak.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//Budeš muset zaplatit náhradu škody!
		ANDRE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Kolik?
	if(ANDRE_SCHULDEN > 1000)
	{
		ANDRE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_petzmaster,"Nemám dost penìz.",dia_andre_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_petzmaster,"Chci tu pokutu zaplatit!",dia_andre_petzmaster_paynow);
	};
};

func void dia_andre_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Dobrá! Postarám se o tom, aby se o tom dozvìdìl každý ve mìstì - tím se tvoje povìst zase trošku vylepší.
	b_grantabsolution(LOC_CITY);
	ANDRE_SCHULDEN = 0;
	ANDRE_LASTPETZCOUNTER = 0;
	ANDRE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_andre_petzmaster);
	Info_ClearChoices(dia_andre_pmschulden);
};

func void dia_andre_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//Nemám dost penìz.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Tak si nìjaké co nejrychleji sežeò.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//A varuji tì: jestli se proviníš ještì nìèím, jen si to zhoršíš.
	ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HALLO(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_hallo_condition;
	information = dia_andre_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hallo_info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Innos tì provázej, cizinèe! Co tì ke mnì pøivádí?
};


instance DIA_ANDRE_MESSAGE(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_message_condition;
	information = dia_andre_message_info;
	permanent = FALSE;
	description = "Mám dùležitou zprávu pro lorda Hagena.";
};


func int dia_andre_message_condition()
{
	if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_andre_message_info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//Mám dùležitou zprávu pro lorda Hagena.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//No, stojíš pøed jedním z jeho mužù. Èeho se to týká?
	Info_ClearChoices(dia_andre_message);
	Info_AddChoice(dia_andre_message,"To mohu øíct jen lordu Hagenovi.",dia_andre_message_personal);
	Info_AddChoice(dia_andre_message,"Skøetímu vojsku velí DRACI!",dia_andre_message_dragons);
	Info_AddChoice(dia_andre_message,"Týká se to posvátného artefaktu - Innosova oka.",dia_andre_message_eyeinnos);
};

func void b_andre_lordhagennichtzusprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Lord Hagen pøijímá jen paladiny a ty, kdo jsou u paladinù ve službì.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Je pod jeho dùstojnost ztrácet èas s bìžnými lidmi.
};

func void dia_andre_message_eyeinnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//Týká se to posvátného artefaktu - Innosova oka.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Innosovo oko - nikdy jsem o nìm neslyšel. Ale to ještì nemusí nic znamenat.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Pokud nìjaký artefakt tohoto jména opravdu existuje, stejnì o nìm vìdí jen nejvyšší èlenové našeho øádu.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Proto si musím promluvit se samotným lordem Hagenem.
	ANDRE_EYEINNOS = TRUE;
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};

func void dia_andre_message_dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Zástupy skøetù vedou DRA-
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(pøeruší tì) JÁ VÍM, že armáda skøetù je èím dál tím silnìjší.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Nesnažíš se mi naznaèit, že to je TO, co chceš nahlásit lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Ten by ti utrhl hlavu za to, že mrháš jeho èasem takovými historkami.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//A jsem si jist, že jsi dost chytrý na to, abys to vìdìl sám.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Takže o co ve skuteènosti jde?
};

func void dia_andre_message_personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//To mohu øíct jen lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Jak myslíš. Ale jedno bys mìl vìdìt:
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};


instance DIA_ANDRE_PALADINE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladine_condition;
	information = dia_andre_paladine_info;
	permanent = FALSE;
	description = "Proè jsou ve mìstì paladinové?";
};


func int dia_andre_paladine_condition()
{
	if((other.guild != GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladine_info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Proè jsou ve mìstì paladinové?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//Cíle naší mise jsou tajné.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Mohu øíct jen to, že obèané mìsta nejsou v ohrožení.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Nemusíš si dìlat starosti.
};


instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladineagain_condition;
	information = dia_andre_paladineagain_info;
	permanent = FALSE;
	description = "Proè jsou ve mìstì paladinové?";
};


func int dia_andre_paladineagain_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladineagain_info()
{
	if(Npc_KnowsInfo(other,dia_andre_paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Øekneš mi teï, proè jste vy paladinové pøijeli sem do Khorinisu?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Proè jsou ve mìstì paladinové?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Teï patøíš k mìstské stráži, takže jsi také podøízený paladinùm.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//Koneènì tì tedy mohu zasvìtit.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//Pøišli jsme sem na rozkaz krále Rhobara. Se zhroucením bariéry ustaly dodávky rudy.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Proto musíme získat rudu a dopravit ji na pevninu. Z té rudy vykováme nové zbranì a zaženeme skøety zpátky.
	KNOWSPALADINS_ORE = TRUE;
};


instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_asktojoin_condition;
	information = dia_andre_asktojoin_info;
	permanent = FALSE;
	description = "Chci vstoupit do služby k paladinùm!";
};


func int dia_andre_asktojoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_asktojoin_info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Chci vstoupit do služby k paladinùm!
	if(Npc_KnowsInfo(other,dia_andre_message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Dobrá. Hodí se mi každý schopný muž. Nezáleží na dùvodech, proè se k nám chce pøidat.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Pokud vstoupíš do služby k paladinùm, mohl bych ti pomoci zaøídit slyšení u lorda Hagena.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Požadavek hodný uznání.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//Mám však rozkazy pøijímat do domobrany jen obèany mìsta.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//Mùj velitel se bojí, že by se do ní jinak mohli vetøít špehové nebo sabotéøi.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//Tímhle zpùsobem chce to riziko minimalizovat.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Nejprve tedy musíš být obèanem mìsta - mùže sice být sporné, jestli tohle pravidlo má smysl nebo ne, ale rozkazy jsou rozkazy.
	Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
	b_logentry(TOPIC_BECOMEMIL,"Chci-li se stát èlenem mìstské gardy, musím být nejdøív obèanem mìsta.");
};


instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_andre_aboutmiliz_condition;
	information = dia_andre_aboutmiliz_info;
	permanent = FALSE;
	description = "Co mùžu od služby v domobranì èekat?";
};


func int dia_andre_aboutmiliz_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Co mùžu od služby v domobranì èekat?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Jedno si vyjasnìme. Být vojákem v domobranì obnáší mnohem víc, než jen promenádovat se mìstem v uniformì.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Je to špinavá a nìkdy i krvavá práce. Jakmile budeš jedním z nás, bude tì èekat spousta práce.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Ale stojí to za to. Kromì platu budeš mít také možnost stát se jednoho dne Innosovým svatým váleèníkem.
};


instance DIA_ADDON_ANDRE_MARTINEMPFEHLUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_addon_andre_martinempfehlung_condition;
	information = dia_addon_andre_martinempfehlung_info;
	description = "Mám tady pro tebe dopis od tvého vojáka.";
};


func int dia_addon_andre_martinempfehlung_condition()
{
	if(Npc_HasItems(other,itwr_martin_milizempfehlung_addon) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_addon_andre_martinempfehlung_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//Mám tady pro tebe dopis od tvého vojáka.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(nevìøícnì) Cože? Okamžitì mi ho ukaž.
	b_giveinvitems(other,self,itwr_martin_milizempfehlung_addon,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(ohromenì) Já zírám! To ses musel opravdu snažit, abys na nìho udìlal dojem, že? Martin totiž vìtšinou nebývá tak velkorysý v tìhle vìcech.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//Dobøe, dobøe. Tím si mì pøesvìdèil. Když máš podporu Martina, tak já tì budu také akceptovat. Øekni mi, až budeš pøipravený.
	ANDRE_KNOWS_MARTINEMPFEHLUNG = TRUE;
};


instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_alternative_condition;
	information = dia_andre_alternative_info;
	permanent = FALSE;
	description = "Není nìjaký rychlejší zpùsob, jak se k vám pøidat?";
};


func int dia_andre_alternative_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_andre_alternative_info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//Není nìjaký rychlejší zpùsob, jak se k vám pøidat?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Hmm (na chvíli se odmlèí) - ty to asi myslíš vážnì, co?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Dobrá, poslouchej. Mám problém. Když ho za mì vyøešíš, dohlédnu na to, abys byl pøijat do øad domobrany.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//Ale je velice dùležité, abys o tom nikomu neøekl ani slovo!
};


instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_guildofthieves_condition;
	information = dia_andre_guildofthieves_info;
	permanent = FALSE;
	description = "Co máš za problém?";
};


func int dia_andre_guildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_alternative))
	{
		return TRUE;
	};
};

func void dia_andre_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Co máš za problém?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Poslední dobou se ve mìstì stalo množství krádeží. Zatím se nám nepodaøilo nikoho chytit, ti zlodìji jsou prostì pøíliš dobøí.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Ti bastardi se vyznají. Jsem si jistý, že máme co do èinìní s organizovanou bandou.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Nepøekvapilo by mì, kdyby byl tady v Khorinisu zlodìjský cech. Najdi vùdce toho gangu a sejmi ho.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Já se pak postarám o to, abys byl pøijat do domobrany - bez ohledu na to, jestli jsi obèanem mìsta, nebo ne.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Ale nesmíš se o naší dohodì nikomu zmínit ani slovem!
	};
	MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
	b_logentry(TOPIC_BECOMEMIL,"K mìstské gardì se mohu pøidat i jinak, a to tak, že vypátrám a znièím khorinisský zlodìjský cech.");
};


instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_wherethieves_condition;
	information = dia_andre_wherethieves_info;
	permanent = FALSE;
	description = "Kde bych mìl ty zlodìje zaèít hledat?";
};


func int dia_andre_wherethieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_wherethieves_info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Kde bych mìl ty zlodìje zaèít hledat?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Kdybych to vìdìl, udìlám to sám!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//Mùžu ti øíct jenom tohle: Nedávno jsme obrátili celou pøístavní ètvr vzhùru nohama a nenašli jsme nic, vùbec nic.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Lidé odtamtud nejsou zrovna upovídaní, zvláš když na sobì máš paladinské brnìní.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Ale ty nejsi odsud, nebudou k tobì tak nedùvìøiví.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Nejdøív by ses mìl poptat po pøístavu. Ale buï opatrný. Jestli tamním lidem dojde, že pracuješ pro paladiny, nedozvíš se vùbec NIC!
	b_logentry(TOPIC_BECOMEMIL,"S pátráním po zlodìjském cechu mohu zaèít v pøístavní ètvrti.");
};


instance DIA_ANDRE_WHATTODO(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_whattodo_condition;
	information = dia_andre_whattodo_info;
	permanent = FALSE;
	description = "Co mám udìlat, až najdu nìkterého z tìch zlodìjù?";
};


func int dia_andre_whattodo_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_whattodo_info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Co mám udìlat, až najdu nìkterého z tìch zlodìjù?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Pokud se bude jednat o nìjakého poskoka, pomahaèe nebo malou rybu, bude nejlepší, když to nebudeš hnát na ostøí nože.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Spíš pøijï za mnou a podej mi o tom zprávu. Já se pak postarám o to, aby ten chlapík skonèil za møížemi.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Do pøímého boje by náhodou mohla zakroèit mìstská stráž a tìžko bys pak mìl pøíležitost vysvìtlovat, o co vlastnì jde.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Navíc za každýho zmetka, kterej skonèí pod zámkem, dostaneš odmìnu.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Ale jestli se ti podaøí najít skrýš jejich vùdcù - no - pak se boji už asi nevyhneš.
	b_logentry(TOPIC_BECOMEMIL,"Pokud chytnu nìkterého z pøisluhovaèù zlodìjského cechu, mám ho pøedvést pøímo pøed lorda Andreho. Jestliže mám ale znièit celý cech, musím zjistit, kde se skrývají.");
};


instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 200;
	condition = dia_andre_auslieferung_condition;
	information = dia_andre_auslieferung_info;
	permanent = TRUE;
	description = "Pøišel jsem si vybrat odmìnu za zloèince.";
};


func int dia_andre_auslieferung_condition()
{
	if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_auslieferung_info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//Pøišel jsem si vybrat odmìnu za zloèince.
	Info_ClearChoices(dia_andre_auslieferung);
	Info_AddChoice(dia_andre_auslieferung,"Vrátím se pozdìji. (ZPÌT)",dia_andre_auslieferung_back);
	if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Rengaru okradl obchodníka Joru.",dia_andre_auslieferung_rengaru);
	};
	if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Halvor prodává kradené zboží.",dia_andre_auslieferung_halvor);
	};
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Nagur zabil Baltramova posla.",dia_andre_auslieferung_nagur);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Canthar se pokouší zbavit Sarah!",dia_andre_auslieferung_canthar);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Sarah prodává zbranì Onarovi.",dia_andre_auslieferung_sarah);
	};
};

func void dia_andre_auslieferung_back()
{
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_rengaru()
{
	AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Rengaru okradl kupce Joru. Zkusil prásknout do bot, ale chytil jsem ho.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Dobrá, mí muži ho už sebrali. V nejbližší budoucnosti už nebude nikoho okrádat.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Tady máš své peníze.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	RENGARU_AUSGELIEFERT = TRUE;
	MIS_THIEFGUILD_SUCKED = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
	b_startotherroutine(rengaru,"PRISON");
};

func void dia_andre_auslieferung_halvor()
{
	AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Halvor je pøekupník. Prodává zboží, které bandité ukradnou kupcùm.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Takže on za tím vìzí. Mí muži ho okamžitì zatknou.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//Neøekl bych, že bude dìlat nìjaké problémy. Hned ti dám tvou odmìnu.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(halvor,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	HALVOR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_nagur()
{
	AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Nagur zabil Baltramova posla. Pokusil se použít mì jako nového posla, aby zachytil Akilovu zásilku.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//Na toho chlapíka èeká trest. Okamžitì ho nechám zavøít.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Tady máš odmìnu, kterou sis po právu zasloužil.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(nagur,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	NAGUR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_canthar()
{
	AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Kupec Canthar se snaží zbavit Sarah!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Sarah? Té prodavaèky zbraní z tržištì?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//Mìl jsem jí podstrèit falešný dopis, ve kterém tvrdí, že dodává zbranì Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//Aha. Za toho parchanta ti rád vyplatím odmìnu. Jako by už byl za møížemi.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(canthar,"KNAST");
	MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
	b_checklog();
	CANTHAR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_sarah()
{
	AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Sarah prodává zbranì Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Sarah? Ta prodavaèka zbraní z tržištì? Máš nìjaký dùkaz?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//Má ve své kapse dopis, ve kterém jsou podrobnosti o dodávce zbraní k nìmu.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//To jí neprojde. Nechám ji zatknout.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(sarah,"KNAST");
	b_startotherroutine(canthar,"MARKTSTAND");
	SARAH_AUSGELIEFERT = TRUE;
	MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};


instance DIA_ANDRE_DGRUNNING(C_INFO)
{
	npc = mil_311_andre;
	nr = 4;
	condition = dia_andre_dgrunning_condition;
	information = dia_andre_dgrunning_info;
	permanent = TRUE;
	description = "Co se týèe toho cechu zlodìjù...";
};


func int dia_andre_dgrunning_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_dgrunning_info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//Co se týèe toho cechu zlodìjù...
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//Mùžeš to pustit z hlavy. Poslal jsem dolù do stok pár chlapù.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//Cech zlodìjù je už jen smutná kapitola v historii tohoto mìsta.
		MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
		if(MIS_CASSIAKELCHE == LOG_RUNNING)
		{
			MIS_CASSIAKELCHE = LOG_OBSOLETE;
		};
		if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
		{
			MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Ano?
	Info_ClearChoices(dia_andre_dgrunning);
	Info_AddChoice(dia_andre_dgrunning,"Pracuji na tom ...",dia_andre_dgrunning_back);
	if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
	{
		Info_AddChoice(dia_andre_dgrunning,"Všechny jsem je dostal!",dia_andre_dgrunning_success);
	};
	if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
	{
		Info_AddChoice(dia_andre_dgrunning,"Našel jsem úkryt cechu zlodìjù!",dia_andre_dgrunning_verrat);
	};
};

func void dia_andre_dgrunning_back()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Pracuji na tom.
	if(DIEBESGILDE_VERRATEN == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Dobrá. Dám ti na splnìní toho úkolu trochu víc èasu.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Dobrá! Dej mi o všem vìdìt.
	};
	Info_ClearChoices(dia_andre_dgrunning);
};

func void dia_andre_dgrunning_verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Našel jsem úkryt cechu zlodìjù!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Kde?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//Ve stokách pod mìstem.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Cože? Všechny kanály jsme zapeèetili.
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Zdá se, že to jim nebrání v tom, aby si dole v klidu vegetovali.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Zneškodnil jsi ty kriminálníky?
	DIEBESGILDE_VERRATEN = TRUE;
	DG_GEFUNDEN = TRUE;
};

func void dia_andre_dgrunning_success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//Všechny jsem je dostal!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Prokázal jsi mìstu cennou službu.
	DG_GEFUNDEN = TRUE;
	MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
	b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		MIS_CASSIAKELCHE = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Jestli máš poøád zájem o místo v domobranì, staèí øíct.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Splnil jsi svou povinnost, jak se sluší na Innosova služebníka a královského vojáka.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//Právem ti náleží odmìna za ty bandity. Tady je.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
	Info_ClearChoices(dia_andre_dgrunning);
};


instance DIA_ANDRE_JOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_join_condition;
	information = dia_andre_join_info;
	permanent = TRUE;
	description = "Jsem pøipraven pøidat se k domobranì!";
};


func int dia_andre_join_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_join_info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//Jsem pøipraven pøidat se k domobranì!
	if(ANDRE_KNOWS_MARTINEMPFEHLUNG == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//Martin za tebe ruèí a dokonce tì i doporuèil. To mi bude staèit.
	}
	else if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//Dodržím svou èást úmluvy a pøijímám tì do øad domobrany, aèkoliv nejsi obèanem mìsta.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//Ale nikomu na svìtì o tom neøekni ani slovo! Èím ménì lidí bude o této výjimce vìdìt, tím ménì to budu muset pozdìji obhajovat.
	}
	else if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//Takže ses stal obèanem Khorinisu?
		if(PLAYER_ISAPPRENTICE == APP_HARAD)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//Kováø mì pøijal za uèedníka.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Harad? Znám ho. Pracuje pro nás. Je to dobrý chlap.
		};
		if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//Jsem alchymistùv uèeò!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//V domobranì nemáme zrovna moc uèencù. Možná by se nám mohly tvoje schopnosti hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//Moc toho o tom alchymistovi nevím. Ale lidé øíkají, že to je èestný muž.
		};
		if(PLAYER_ISAPPRENTICE == APP_BOSPER)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//Výrobce lukù Bosper mì vzal do uèení.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Takže víš také nìco o životì v divoèinì? To je dobøe, protože èlenové domobrany plní i úkoly mimo okruh mìstských hradeb.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//Lidé, kteøí se vyznají v divoèinì, se nám budou urèitì hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//A ten výrobce lukù je pro mìsto velice významný èlovìk.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//Pokud pro tebe bude hlasovat, nestojí nic v cestì tvému pøijetí do domobrany.
		if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Navíc se ti podaøilo zbavit nás toho cechu zlodìjù. Už jen za to bych tì do domobrany pøijal.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//To je možné - ale stále nejsi obèanem našeho mìsta a já mám své rozkazy.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//Mùžeš se k nám pøidat, jestli chceš. Ale tvé rozhodnutí bude koneèné.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//Jakmile na sobì budeš mít zbroj domobrany, nebudeš si ji moci jen tak sejmout a pøestat patøit mezi nás.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Jsi pøipraven spoleènì s námi bojovat za Innose a krále?
	Info_ClearChoices(dia_andre_join);
	Info_AddChoice(dia_andre_join,"Ještì si nejsem tak úplnì jistý ...",dia_andre_join_no);
	Info_AddChoice(dia_andre_join,"Jsem pøipraven!",dia_andre_join_yes);
};

func void dia_andre_join_yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//Jsem pøipraven!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Tak budiž. Vítej v domobranì.
	Npc_SetTrueGuild(other,GIL_MIL);
	other.guild = GIL_MIL;
	Snd_Play("LEVELUP");
	Npc_ExchangeRoutine(lothar,"START");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Tady máš svou zbroj.
	b_giveinvitems(self,other,itar_mil_l,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Nos ji hrdì a dùstojnì.
	SLD_AUFNAHME = LOG_OBSOLETE;
	KDF_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_SUCCESS;
	b_giveplayerxp(XP_BECOMEMILIZ);
	Info_ClearChoices(dia_andre_join);
};

func void dia_andre_join_no()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Ještì si nejsem tak úplnì jistý.
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Pokud máš stále nìjaké pochyby o svém rozhodnutí, nemohu tì pøijmout do øad domobrany.
	Info_ClearChoices(dia_andre_join);
};


instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_lordhagen_condition;
	information = dia_andre_lordhagen_info;
	permanent = FALSE;
	description = "Mohu teï koneènì jít za lordem Hagenem?";
};


func int dia_andre_lordhagen_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_lordhagen_info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Mohu teï koneènì jít za lordem Hagenem?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Nyní jsi ve službách paladinù. Vpustí tì dovnitø. Ale ve vlastním zájmu bys mìl mít na srdci nìco opravdu dùležitého.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//To také mám, nemìj obavy.
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Mìj na pamìti, že budeš mluvit s velitelem paladinù. Chovej se podle toho. Nebudeš tam stát jen za sebe, ale za celou domobranu.
};


instance DIA_ANDRE_WAFFE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_waffe_condition;
	information = dia_andre_waffe_info;
	permanent = FALSE;
	description = "Dostanu také nìjakou zbraò?";
};


func int dia_andre_waffe_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_waffe_info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//Dostanu také nìjakou zbraò?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Samozøejmì. Obvykle se o to stará Peck. Ale zdá se mi, že jsem ho už nìjakou dobu nevidìl.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Zjisti, kde se zašívá, a pøiveï ho sem. Pak od nìj nafasuješ zbraò.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//A pokud bys chtìl spát, mùžeš si lehnout na nìkterou z postelí v kasárnách.
	MIS_ANDRE_PECK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
	b_logentry(TOPIC_PECK,"Peck se toulá nìkde po mìstì. Pokud ho pøivedu zpátky do kasáren, mohu od nìj dostat zbraò.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_peck_condition;
	information = dia_andre_found_peck_info;
	permanent = FALSE;
	description = "Podaøilo se mi najít Pecka.";
};


func int dia_andre_found_peck_condition()
{
	if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_found_peck_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//Podaøilo se mi najít Pecka.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Ano, už je zpìt na svém místì a plní své povinnosti. Kde jsi ho našel?
	Info_ClearChoices(dia_andre_found_peck);
	Info_AddChoice(dia_andre_found_peck,"Zkøížil mi cestu...",dia_andre_found_peck_somewhere);
	Info_AddChoice(dia_andre_found_peck,"U Èervené lucernièky...",dia_andre_found_peck_redlight);
};

func void dia_andre_found_peck_somewhere()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//Narazil jsem na nìj ve mìstì.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//Dobrá, tak jdi za ním a vyzvedni si zbraò.
	MIS_ANDRE_PECK = LOG_OBSOLETE;
	b_giveplayerxp(XP_FOUNDPECK);
	Info_ClearChoices(dia_andre_found_peck);
};

func void dia_andre_found_peck_redlight()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//Byl u "Èervené lucerny".
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//Aha, takže místo aby se staral o své povinnosti, vysedává s dìvèaty.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//Asi s ním budu muset prohodit pár slov.
	b_giveplayerxp(XP_FOUNDPECK * 2);
	MIS_ANDRE_PECK = LOG_SUCCESS;
	Info_ClearChoices(dia_andre_found_peck);
};

func void b_andresold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Tady máš svùj plat.
	b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};


instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_firstmission_condition;
	information = dia_andre_firstmission_info;
	permanent = FALSE;
	description = "Máš pro mì nìjaký úkol?";
};


func int dia_andre_firstmission_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_andre_firstmission_info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//Máš pro mì nìjaký úkol?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//V poslední dobì stoupl ve mìstì prodej trávy z bažin.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//Nemùžeme dopustit, aby se to tady nìjak rozmohlo.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//Jinak by každý zaèal kouøit a nikdo by nebyl schopný pracovat, natož udržet zbraò.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//To si nemùžeme dovolit zvláš teï, když hrozí útok skøetù nebo žoldákù.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//Mám podezøení, že za tím jsou ti žoldáci. Vsadím se, že to jsou oni, kdo to svinstvo pøináší do mìsta.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//Co je na práci?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Mortis, jeden z našich mužù, v pøístavní krèmì zaslechl, že nìkam do pøístavní ètvrti mìl dorazit balík trávy z bažin.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Porozhlédni se kolem a ten balík mi dones.
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
	b_logentry(TOPIC_WAREHOUSE,"Do pøístavu dorazil balík trávy z bažin - Mortis se o tom dozvìdìl v místní hospodì. Já mám tu zásilku najít a donést lordu Andreovi.");
};


instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_stuff_condition;
	information = dia_andre_found_stuff_info;
	permanent = TRUE;
	description = "Co se toho balíku týèe...";
};


func int dia_andre_found_stuff_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_found_stuff_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//Co se toho balíku týèe...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Našel jsi ho?
	if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
	{
		Info_ClearChoices(dia_andre_found_stuff);
		if(Npc_HasItems(other,itmi_herbpaket) > 0)
		{
			Info_AddChoice(dia_andre_found_stuff,"Ano, tady je.",dia_andre_found_stuff_ja);
		};
		Info_AddChoice(dia_andre_found_stuff,"Hodil jsem ho do pøístavní zátoky.",dia_andre_found_stuff_becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Zatím ne.
	};
};

func void dia_andre_found_stuff_ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Ano, tady je.
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Dobrá práce. Budeme tu trávu dobøe støežit.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_CIPHER_PAKET = LOG_FAILED;
	b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
	Info_ClearChoices(dia_andre_found_stuff);
};

func void dia_andre_found_stuff_becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//Hodil jsem ho do pøístavní zátoky.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//Vážnì? No, hlavnì že už nemùže padnout do špatných rukou.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	b_giveplayerxp(XP_WAREHOUSE_SUPER);
	Info_ClearChoices(dia_andre_found_stuff);
};


instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_find_dealer_condition;
	information = dia_andre_find_dealer_info;
	permanent = FALSE;
	description = "Máš pro mì nìjakou další práci?";
};


func int dia_andre_find_dealer_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_find_dealer_info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//Máš pro mì nìjakou další práci?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//Stáhnul jsi ten balík trávy z obìhu - to je dobøe.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//Rád bych ale zjistil, kdo to rozšiøuje mezi lidi.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//Musí to být nìkdo z pøístavní ètvrti.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//Kdyby do mìsta nìkdo pravidelnì pøicházel zvenèí, už bychom ho dávno chytili.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//Co pøesnì mám udìlat?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Najdi toho dealera a nech si od nìj nìjakou tu trávu prodat. Nebude to snadné, ale jinak ho nemùžeme zatknout.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Promluv si s Mortisem, vyzná se v pøístavní ètvrti. Možná by ti mohl nìjak pomoci.
	MIS_ANDRE_REDLIGHT = LOG_RUNNING;
	b_startotherroutine(nadja,"SMOKE");
	Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
	b_logentry(TOPIC_REDLIGHT,"Mám najít chlápka, co v pøístavišti kšeftuje s trávou z bažin. Musím ho pøimìt, aby mi nìco ze svých zásob prodal. Mortis mi v tom mùže pomoci.");
};


instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_redlight_success_condition;
	information = dia_andre_redlight_success_info;
	permanent = TRUE;
	description = "Co se té trávy týèe...";
};


func int dia_andre_redlight_success_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_redlight_success_info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//Co se té trávy týèe...
	if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//Nemyslím, že bychom se v pøístavní ètvrti nìco dozvìdìli.
		if(Npc_IsDead(borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Ne, když je ten vyhazovaè mrtvý.
		};
		if(NADJA_VICTIM == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//Ta dívka z Èervené lucerny, Nadja, je mrtvá. Musela to být nìjaká podivná nehoda.
			b_removenpc(nadja);
		};
		if(UNDERCOVER_FAILED == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//Nebyl jsi dostateènì opatrný.
		};
		MIS_ANDRE_REDLIGHT = LOG_FAILED;
		b_checklog();
	}
	else if(BORKA_DEAL == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//Vím, kdo tu trávu ve mìstì prodává. Je to Borka, dveøník od Èervené lucerny.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//Vážnì? Máme nìjaký dùkaz?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//Trochu té trávy mi prodal.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//Výbornì, to nám staèí. Okamžitì ho nechám zatknout.
		b_startotherroutine(borka,"PRISON");
		MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
		b_giveplayerxp(XP_REDLIGHT);
		b_andresold();
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//... Ještì na tom pracuju.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Dobrá, a nezapomeò, že musíš toho chlapíka pøesvìdèit, aby s tebou uzavøel obchod.
	};
};


instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_hilfbauerlobart_condition;
	information = dia_andre_hilfbauerlobart_info;
	description = "Máš pro mì nìjaký další úkol?";
};


func int dia_andre_hilfbauerlobart_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_hilfbauerlobart_info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//Máš pro mì nìjaký další úkol?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//Farmáø Lobart má na svých polích nìjaké problémy.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//Pokud mu pomùžeme, upevníme jeho vztahy s mìstem. Jdi tedy za ním a zjisti, co se dìje.
	Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
	b_logentry(TOPIC_FELDRAEUBER,"Andre mì poslal na Lobartùv statek. Mám mu pomoci ho dát znovu do poøádku.");
	MIS_ANDREHELPLOBART = LOG_RUNNING;
	Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
	b_startotherroutine(vino,"BUGSTHERE");
	b_startotherroutine(lobartsbauer1,"BUGSTHERE");
	b_startotherroutine(lobartsbauer2,"BUGSTHERE");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_lobart_success_condition;
	information = dia_andre_lobart_success_info;
	description = "Pomohl jsem Lobartovi.";
};


func int dia_andre_lobart_success_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_lobart_success_info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//Pomohl jsem Lobartovi.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//Výbornì. Pokud bude Lobart spokojený, bude mìstu i nadále prodávat své tuøíny.
	b_giveplayerxp(XP_LOBARTBUGS);
	b_andresold();
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople_condition;
	information = dia_addon_andre_missingpeople_info;
	description = "Co je s tìmi chybìjícími lidmi?";
};


func int dia_addon_andre_missingpeople_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//Co je s tìmi chybìjícími lidmi?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//Co by?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//Nesnažíte se je najít?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//Dostal jsem rozkaz od lorda Hagena chránit mìsto a jeho okolí.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//A to znamená, že budu chránit lidi, kteøí jsou stále TADY.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//Hlídky domobrany jsou každou noc v ulicích. Nemùžu udìlat víc.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//A TY se budeš starat o ten úkol, co jsem ti dal, rozumìls?
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE2(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople2_condition;
	information = dia_addon_andre_missingpeople2_info;
	description = "Ohlednì tìch chybìjících lidí ...";
};


func int dia_addon_andre_missingpeople2_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild != GIL_MIL) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople2_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//Ohlednì tìch chybìjících lidí ...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//Klidnì se o ty fámy starej. Já mám vlastních problémù dost.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_RETURNEDMISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_returnedmissingpeople_condition;
	information = dia_addon_andre_returnedmissingpeople_info;
	description = "Podaøilo se mi pár tìch chybìjících lidí zachránit.";
};


func int dia_addon_andre_returnedmissingpeople_condition()
{
	if((MISSINGPEOPLERETURNEDHOME == TRUE) && (MIS_ADDON_ANDRE_MISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_andre_returnedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//Podaøilo se mi pár tìch chybìjících lidí zachránit.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//Už mì zaèínalo zajímat, kde ses tak dlouho toulal!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//Ty jsi èlen domobrany! Takové vìci se tì netýkají!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//Ale ...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//Kolik lidí jsi našel?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//Všechny, kteøí byli ještì naživu ...
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//Všechny?! Já ... on ...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//Jsem na tebe hrdý! Jsem nadšený, že jsem tì sem pøijal.
		b_andresold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//Byl to tìžký úkol.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ANDRE_MISSINGPEOPLE);
};

func void b_andre_gotolordhagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//Mìl bys jít pøímo za ním.
};


instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachen_condition;
	information = dia_andre_berichtdrachen_info;
	permanent = FALSE;
	description = "Byl jsem v Hornickém údolí a vidìl jsem draky!";
};


func int dia_andre_berichtdrachen_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachen_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//Byl jsem v Hornickém údolí a vidìl jsem draky!
	if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//Mám dopis od velitele Garonda, který má slova potvrzuje.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//To bude lorda Hagena zajímat!
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_bennetinprison_condition;
	information = dia_andre_bennetinprison_info;
	permanent = TRUE;
	description = "A co Bennet, ten kováø?";
};


func int dia_andre_bennetinprison_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_bennetinprison_info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//A co Bennet, ten kováø?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//Myslíš toho žoldáka? Sedí ve vìzení, kam patøí.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Mohu s ním mluvit?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Jistì, jak je libo. Ale pokud se pokusíš pomoci mu k útìku, skoèíš tam také.
};


instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_cornelius_liar_condition;
	information = dia_andre_cornelius_liar_info;
	permanent = TRUE;
	description = "Myslím, že Cornelius lže.";
};


func int dia_andre_cornelius_liar_condition()
{
	if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_cornelius_liar_info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//Myslím, že Cornelius lže.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Jsi si jistý?
	Info_ClearChoices(dia_andre_cornelius_liar);
	Info_AddChoice(dia_andre_cornelius_liar,"Ne. O tom se musí dozvìdìt lord Hagen.",dia_andre_cornelius_liar_no);
	Info_AddChoice(dia_andre_cornelius_liar,"Ano.",dia_andre_cornelius_liar_yes);
};

func void dia_andre_cornelius_liar_no()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//V tom pøípadì bys nemìl své podezøení tak zeširoka roztrubovat.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Cornelius je vlivný muž. Mohl by ti udìlat ze života peklo, kdyby chtìl.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//Pokud nemáš žádný dùkaz, nemohu ti pomoci.
	Info_ClearChoices(dia_andre_cornelius_liar);
};

func void dia_andre_cornelius_liar_yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//Co za dùkaz máš?
	if(CORNELIUS_ISLIAR == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//Èetl jsem jeho deník! Podplatili ho. Všechno je jen snùška lží.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//Pokud to je skuteènì tak, musíš jít okamžitì za lordem Hagenem.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Ukaž mu ten deník. On už se postará o zbytek.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Ehm, no, myslím...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//Potøebuji dùkaz, ne podezøení. Sežeò dùkaz, pak pro tebe budu moci nìco udìlat.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//Do té doby by sis mìl radìji dávat pozor na jazyk.
	};
	Info_ClearChoices(dia_andre_cornelius_liar);
};


instance DIA_ANDRE_PALADIN(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_paladin_condition;
	information = dia_andre_paladin_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_paladin_condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_andre_paladin_info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//Takže nyní jsi paladin! Gratuluji!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//Už od zaèátku jsem si myslel, že nezùstaneš u domobrany dlouho.
};


instance DIA_ANDRE_PERM(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_perm_condition;
	information = dia_andre_perm_info;
	permanent = TRUE;
	description = "Jak to vypadá ve mìstì?";
};


func int dia_andre_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_perm_info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//Jak to vypadá ve mìstì?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//Všechno je pod kontrolou.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Pokraèuj ve svém poslání.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//Od této chvíle se hlásíš pøímo lordu Hagenovi. Bìž si s ním promluvit.
	};
};


instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachentot_condition;
	information = dia_andre_berichtdrachentot_info;
	permanent = FALSE;
	description = "Pobil jsem všechny draky v Hornickém údolí!";
};


func int dia_andre_berichtdrachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachentot_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//Pobil jsem všechny draky v Hornickém údolí!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//Pokud to je pravda, musíš o tom øíct lordu Hagenovi.
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichttorauf_condition;
	information = dia_andre_berichttorauf_info;
	permanent = FALSE;
	description = "Na hrad v Hornickém údolí zaútoèili skøeti!";
};


func int dia_andre_berichttorauf_condition()
{
	if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
	{
		return TRUE;
	};
};

func void dia_andre_berichttorauf_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//Na hrad v Hornickém údolí zaútoèili skøeti!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//Ne! O tom se musí dozvìdìt lord Hagen.
	b_andre_gotolordhagen();
};

