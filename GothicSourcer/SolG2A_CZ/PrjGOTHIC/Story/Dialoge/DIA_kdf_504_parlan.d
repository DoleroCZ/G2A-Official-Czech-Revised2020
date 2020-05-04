
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(p¯ÌsnÏ) PoËkej chvÌli, synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//ÿÌk· se, ûe ze svatynÏ 'zmizel' cenn˝ artefakt.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Ani o tom nechci slyöet nic dalöÌho - p¯edpokl·d·m, ûe se vr·tÌ na svÈ mÌsto.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Poruöil jsi z·kona naöeho spoleËenstvÌ.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//A i kdyû jsi uû byl obvinÏn, provinil ses jeötÏ vÌc.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Tv· vina m˘ûe b˝t smyta jen vÏtöÌm darem kl·öteru.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Kdo si myslÌö, ûe jsi? Modli se k Innosovi za odpuötÏnÌ sv˝ch skutk˘!
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Tvoje situace se zmÏnila.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Nejsou uû û·dnÌ svÏdkovÈ tvÈ vraûdy!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikdo uû nebude svÏdËit, ûe tÏ vidÏl kr·st!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Uû tÏ nikdo neobviÚuje z toho, ûe by ses pral!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Vöechna obvinÏnÌ proti tobÏ byla staûena!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Moûn· se ti poda¯Ì mÏ oö·lit - ale Innos zn· tvÈ pravÈ skutky!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//TvÈ h¯Ìchy jsou nynÌ odpuötÏny.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//A snaû se, aby to tak takÈ z˘stalo!
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//ZaplatÌö svou pokutu - takov· je v˘le Innosova!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//OsvoboÔ se od svÈ viny!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"Nem·m dost penÏz!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"Kolik ûe to bylo?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Kolik ûe to bylo?
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"Nem·m dost penÏz!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"Kolik ûe to bylo?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//JeötÏ jsme spolu nemluvili, a uû na sobÏ m·ö b¯emeno viny!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Provinil ses nejhoröÌm ze vöech zloËin˘! Vraûdou!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A zatÌûil ses jeötÏ dalöÌ vinou!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Kdyby z·leûelo na mnÏ, na mÌstÏ bych tÏ odsoudil, vrahu!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Ale kdyû za sv˘j zloËin zaplatÌö pokutu, zbavÌm tÏ tvÈ viny.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Kr·deû je poruöenÌm z·kon˘ kl·ötera!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//KromÏ toho jsi poruöil i dalöÌ z·kony.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Tyto proh¯eöky musÌ b˝t potrest·ny. Tak znÌ Innosovo p¯ik·z·nÌ.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//ZaplatÌö kl·öteru p¯imÏ¯enou pokutu.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//V kl·öte¯e netolerujeme rvaËky. TakovÈ chov·nÌ se protivÌ naöim z·kon˘m.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//A proË zabÌjÌö naöe ovce?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//éijeme tady podle p¯ik·z·nÌ. A ta se vztahujÌ i na tebe.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za sv˘j zloËin musÌö d·t kl·öteru dar.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabil jsi naöe ovce. Za to zaplatÌö odökodnÈ!
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Kolik?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"Nem·m dost penÏz!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"Chci tu pokutu zaplatit!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//P¯ijÌm·m tv˘j dar. TvÈ h¯Ìchy jsou odpuötÏny. Nechù ti Innos d· moudrost, abys stejnÈ chyby jiû vÌckr·t neopakoval.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nem·m dost penÏz!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Na to jsi mÏl myslet, neû ses sv˝ch proh¯eök˘ dopustil.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Moûn· se z toho ponauËÌö. NedÏlej û·dnÈ dalöÌ potÌûe, nebudeö muset platit.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void b_dia_parlan_welcome_gofortribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Aû to udÏl·ö, promluvÌme si o tvÈ pr·ci tady v kl·öte¯e.
};

func void b_dia_parlan_welcome_bringtribute2gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Odnes okamûitÏ sv˘j poplatek kl·öteru Goraxovi. Ten se o to postar·.
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//VÌtej, novici, j· jsem Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//J· jsem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(p¯eruöÌ tÏ)... NOVIC. NenÌ d˘leûitÈ, kdo jsi byl p¯edtÌm. TeÔ jsi Innos˘v sluûebnÌk. To je vöe, na Ëem z·leûÌ.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//A jakmile budeö p¯ijat do Bratrstva ohnÏ, budou vöechny tvÈ p¯edchozÌ proh¯eöky odpuötÏny.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Nechù Innos poûehn· tomuto muûi, kter˝ zasvÏtÌ sv˘j ûivot jeho sluûbÏ, a smyje z nÏj vöechny jeho h¯Ìchy.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//A teÔ?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve budeö plnit svÈ povinnosti novice. Budeö pracovat a slouûit pro blaho Bratrstva.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"Jako novic m·m povinnost plnit ˙koly, kterÈ poslouûÌ celÈmu spoleËenstvÌ.");
	if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE)
	{
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve vöak doveÔ svou ovci k Opolosovi, postar· se o ni.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//SvÈ zlato m˘ûeö d·t Goraxovi, naöemu spr·vci. Najdeö ho ve st·ËÌrnÏ vÌna.
			b_dia_parlan_welcome_gofortribute();
		};
	}
	else if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		b_dia_parlan_welcome_bringtribute2gorax();
		b_dia_parlan_welcome_gofortribute();
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "Hled·m Innosovo oko.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Hled·m Innosovo oko.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//NevÌm, kdo ti o nÏm ¯ekl, ale k tomuto posv·tnÈmu artefaktu nem· nikdo p¯Ìstup.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Kde je Innosovo oko uschov·no?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//»Ìm mÈnÏ lidÌ toto tajemstvÌ zn·, tÌm lÈpe. Hledej ho - a nenajdeö jej.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "ÿekni mi nÏco o InnosovÏ oku.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//ÿekni mi nÏco o InnosovÏ oku.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Dobr·. Innosovo oko obsahuje Ë·st Innosovy svatÈ moci. Nosit tento amulet m˘ûe jen JEDIN› vyvolen˝ Innos˘v sluûebnÌk.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Bylo vytvo¯eno, aby n·s v prav˝ Ëas ochr·nilo p¯ed silami Zla.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "Pot¯ebuji si promluvit s v˘dcem paladin˘!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Pot¯ebuji si promluvit s v˘dcem paladin˘!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen novice nep¯ijÌm· - setkat se s nÌm mohou pouze m·govÈ.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "Jak mohu poslouûit zdejöÌ komunitÏ?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Jak mohu poslouûit zdejöÌ komunitÏ?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve budeö plnit svÈ povinnosti novice. Budeö pracovat a slouûit pro blaho Bratrstva.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve vöak doveÔ svou ovci k Opolosovi, postar· se o ni.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE)
			{
				b_dia_parlan_welcome_bringtribute2gorax();
				b_dia_parlan_welcome_gofortribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//SvÈ zlato m˘ûeö d·t Goraxovi, naöemu spr·vci. Najdeö ho ve st·ËÌrnÏ vÌna.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Aû to udÏl·ö, promluvÌme si o tvÈ pr·ci tady v kl·öte¯e.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Je Ëas klidu. Pr·ce novic˘ zaËÌn· za rozb¯esku a pokraËuje aû do setmÏnÌ.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//MÏl by ses vyspat. P¯ijÔ, aû nadejde Ëas pr·ce.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Promluv si s ostatnÌmi m·gy. Oni ti zadajÌ ˙koly.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//J· budu na tvou pr·ci dohlÌûet, a aû svÈ povinnosti uspokojivÏ splnÌö, dostaneö povolenÌ vstoupit do knihovny a studovat Innosovo uËenÌ.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"Kdyû splnÌm ˙koly pro m·gy, dovolÌ mi pak studovat v knihovnÏ.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "Mohu vstoupit do knihovny?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Mohu vstoupit do knihovny?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Sehnal jsi ohnivÈ kop¯ivy pro bratra Neorase.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Naöel jsi recept bratra Neorase.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Zdolal jsi ËernÈho vlka, kter˝ ohroûoval svatyni.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Poda¯ilo se ti najÌt Ëty¯i novice a tÌm p·dem i uklidit pokoje.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//RozdÏlil jsi jÌdlo mezi novice spravedlivÏ, p¯esnÏ jak ti bratr Gorax nak·zal.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax s tebou nebyl spokojen, protoûe jsi jÌdlo nerozdÏlil spravedlivÏ.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Prodal jsi vÌno ke GoraxovÏ spokojenosti.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//»Ìm mÈnÏ toho bude ¯eËeno o tÈ z·leûitosti s vÌnem, tÌm lÈpe.
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Ano, uû jsi pracoval dost. Nadeöel Ëas, abys studoval Innosovo uËenÌ. Promluv si s mistrem Hyglasem v knihovnÏ.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Zde ti d·v·m klÌË.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Nepracoval jsi m·lo, ale tvou povinnostÌ je d·l slouûit spoleËenstvÌ.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Nejprve splÚ svÈ ˙koly ve sluûbÏ spoleËenstvÌ. Aû budeö se vöÌm hotov, m˘ûeme si o tom promluvit znovu.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "M·ö pro mÏ nÏjak˝ ˙kol?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//M·ö pro mÏ nÏjak˝ ˙kol?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmm... Ano, opravdu tady je nÏco, co bys mohl pro naöi komunitu udÏlat.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Komnaty novic˘ by pot¯ebovaly po¯·dnÏ zamÈst. Postarej se o to.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Ale to bude trvat vÏËnÏ.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//V tom p¯ÌpadÏ bys mÏl zaËÌt co nejd¯Ìv, nezd· se ti?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"Mistr Parlan chce, abych zametl Ëty¯i cely pro novice. To potrv· celou vÏËnost!");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "Co se tÏch komnat novic˘ t˝Ëe...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Co se tÏch komnat novic˘ t˝Ëe...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Poda¯ilo se ti najÌt Ëty¯i novice, aby ti pomohli. MyslÌm, ûe se teÔ mohou zase vr·tit ke svÈ bÏûnÈ pr·ci.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Dobr· pr·ce, novici. Splnil jsi ˙kol, kter˝ jsem ti zadal.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//O tom nenÌ sporu - nenÌ to jednoduch˝ ˙kol. Ale s Innosovou pomocÌ to jistÏ zvl·dneö.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "Jak se mohu nauËit umÏnÌ magie?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak se mohu nauËit umÏnÌ magie?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nejsi zde proto, abys dostal dar magie - jsi zde, abys slouûil Innosovi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Ale mohu ti uk·zat, jak zv˝öit svou magickou moc.
	b_logentry(TOPIC_KLOSTERTEACHER,"Mistr Parlan mi pom˘ûe vylepöit magick· umÏnÌ.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "ChtÏl bych podstoupit Zkouöku ohnÏ.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//ChtÏl bych podstoupit Zkouöku ohnÏ.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Coûe...? Hm... (nalÈhavÏ) MyslÌö to v·ûnÏ?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Trv·m na tom.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Jsi v˝jimeËn˝ novic. Dobr·, pokud jsi rozhodnut, promluv si s mistrem Pyrokarem.
	b_logentry(TOPIC_FIRECONTEST,"Kdybych nÏkdy chtÏl podstoupit Zkouöku ohnÏ, musÌm si promluvit s mistrem Pyrokarem.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "ChtÏl bych posÌlit svoji magickou moc.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//ChtÏl bych posÌlit svoji magickou moc.
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Tvoje magick· sÌla se zv˝öila. D·l uû ti pomoci nemohu.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Jestli se chceö uËit d·l, poû·dej Pyrokara.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Sloûil jsi slib, brat¯e. VÌtej mezi n·mi.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//Aû budeö dostateËnÏ zkuöen˝, budu tÏ uËit v KruzÌch magie.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Na d˘kaz, ûe ve tv˝ch rukou nynÌ d¯Ìm· moc, si vezmi tenhle runov˝ k·men.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = "NauË mÏ prvnÌ Kruh magie.";
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//NauË mÏ prvnÌ Kruh magie.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//V prvnÌm Kruhu magie m˘ûeö pouûÌvat runy, kterÈ jsi s·m vytvo¯il.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Ke stvo¯enÌ run se budeö muset nauËit kouzelnÈ formule.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Kaûd˝ z n·s se soust¯edÌ na jeden okruh magie. Dob¯e si tedy rozmysli, jakÈ by ses chtÏl vÏnovat ty.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = "NauË mÏ druh˝ Kruh magie.";
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//NauË mÏ druh˝ Kruh magie.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Vstup do druhÈho Kruhu a nauË se jeötÏ silnÏjöÌ magii.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Ale mÏj na pamÏti, ûe na sebe bereö zodpovÏdnost. Ne ke mnÏ nebo k Pyrokarovi - ale k Innosovi.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//On ti ukazuje smÏr - cestu vöak tvo¯Ì tvÈ skutky.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//JeötÏ nenadeöel spr·vn˝ Ëas.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = "NauË mÏ t¯etÌ Kruh magie.";
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//NauË mÏ t¯etÌ Kruh magie.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Ano, uû nadeöel ten spr·vn˝ Ëas. Vstup do t¯etÌho Kruhu magie. Nov· kouzla tÏ jiû oËek·vajÌ.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Budeö je pot¯ebovat, protoûe Zlo se stahuje a odrazit jej m˘ûe jen Innosova sÌla.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Uû jsem tÏ nauËil vöem Kruh˘m, jimiû jsem tÏ mohl provÈst. VyööÌ Kruhy tÏ nauËÌ Karas.
			b_logentry(TOPIC_KLOSTERTEACHER,"Bratr Parlan mÏ nauËil prvnÌ t¯i kruhy. Do dalöÌch mÏ uvede bratr Karras.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//JeötÏ nenadeöel prav˝ Ëas, aby ses nauËil t¯etÌ Kruh.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "UË mÏ!";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//UË mÏ!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//V tuhle chvÌli tÏ nemohu nauËit û·dnÈ dalöÌ formule.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Nechù tÏ Innos ochraÚuje.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//VidÌm, ûe ses nakonec rozhodl bojovat po naöem boku. Jsem r·d.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Bude se n·m hodit kaûd· ruka. BÏû si promluvit p¯Ìmo s Mardukem, ten zodpovÌd· za v·s paladiny.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//NetuöÌm, proË ti byl povolen vstup sem do kl·ötera. Jsem Parlan a zodpovÌd·m za v·s nov·Ëky.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nerad bych, abys je zdrûoval od pr·ce sv˝mi hloup˝mi ot·zkami. Je to jasnÈ?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"Budu si dÏlat, co se mi zlÌbÌ.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"JasnÏ.",dia_parlan_iamparlan_ok);
	};
	Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Budu si dÏlat, co se mi zlÌbÌ.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//UrËitÏ je nÏjak˝ d˘vod, proË tu jsi trpÏn, ale vöechno m· svÈ meze.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Kdyû budeö dÏlat problÈmy, zaplatÌö za to. Tak se drû od novic˘ d·l.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//JasnÏ.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//To douf·m.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "M·ö pro mÏ jeötÏ nÏco?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//M·ö pro mÏ jeötÏ nÏco?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Ano. Jakoûto Ëlen knihovny bys mÏl dostat klÌË ke knihovnÏ. Najdeö tam bratry Karase a Hyglase.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Pokud chceö, m˘ûeö si tam s nimi promluvit
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Ale od novic˘ se drû d·l!
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(v˝hr˘ûnÏ) Nerad bych se opakoval. Drû se od novic˘ d·l.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//MÏli by oËistit svÈ duöe fyzickou pracÌ a p¯ipravit se na ûivot v kl·öte¯e.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(r·znÏ) DalöÌ vyruöov·nÌ nebudu tolerovat!
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Kde bych naöel...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Kde bych naöel...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... kostel?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... knihovnu?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... kapli?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... sklepy?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... kostel?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Boûe vöemohoucÌ! Copak tÏ Innos oslepil?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(sarkasticky) Kdepak je kostel? BoûÌËku, kde by asi tak mohl b˝t?
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... knihovnu?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Knihovna je na konci kolon·dy, p¯Ìmo naproti kostelu.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... kapli?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaple je mÌstnost v polovinÏ kolon·dy nalevo. PaladinovÈ se v nÌ modlÌ k Innosovi.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... sklepy?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Vstup do sklep˘ je v polovinÏ kolon·dy napravo.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};

