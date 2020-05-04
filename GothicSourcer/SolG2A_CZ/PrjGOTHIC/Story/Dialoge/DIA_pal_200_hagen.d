
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Dobøe že jsi pøišel. Mùžeš hned zaplatit tu pokutu.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Nebereš zákony mìsta moc vážnì, co?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Seznam tvých prohøeškù zase narostl.
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//A neøíkej mi, žes to nevìdìl!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Zaplatíš maximální pokutu.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//No, zdá se, že se situace zmìnila.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Nejsou už žádní svìdkové tvé vraždy!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Nikdo už nebude svìdèit, že tì vidìl krást!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Už nezbyli žádní svìdci té tvé rvaèky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Všechna obvinìní proti tobì byla stažena.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Nevím, co se tam ve mìstì stalo - a ani to vìdìt nechci.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Dávej si prostì pozor, aby ses tady nedostal do problémù.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//Tak nebo tak, rozhodl jsem se prominout ti tvé dluhy.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Dej si pozor, a se nedostaneš do žádných dalších nesnází.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Nakonec stejnì zaplatíš všechny své závazky v plné výši.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Tak co, chceš zaplatit?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"Nemám dost penìz!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"Kolik to bylo?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"Nemám dost penìz!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"Kolik že to bylo?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Tvá povìst tì pøedchází. Porušil jsi zákony mìsta.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Dostal ses do pìkné šlamastyky.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Vražda je vážný zloèin!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Nemluvì o tvých dalších prohøešcích.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Stráže mají pøíkazy na místì popravit každého vraha.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Vražda je v tomto mìstì nepøípustná. Mùžeš však dát svou lítost najevo zaplacením pokuty.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Jsi obvinìn z krádeže!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Nemluvì o dalších vìcech, které se ke mnì donesly.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//To je porušení mìstských zákonù. Za to zaplatíš.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Zapletl ses do rvaèky. Tím pádem jsi porušil zákon.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//A co to bylo s tou ovcí?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Porušení zákonù mìsta je porušením zákonù samotného Innose.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Budeš za to muset zaplatit.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Zasedl sis na naše ovce - poprvé jsem tomu ani nechtìl vìøit.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Proè se musím poøád zaobírat takovými prkotinami?
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Budeš muset zaplatit náhradu škody!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Kolik?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"Nemám dost penìz!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"Chci tu pokutu zaplatit!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Dobrá! Dohlédnu na to, aby se o tom dozvìdìl každý ve mìstì - to ti alespoò èásteènì vylepší reputaci.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//Nemám dost penìz!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Tak si nìjaké co nejrychleji sežeò.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//A varuji tì: jestli se proviníš ještì nìèím, jen si to zhoršíš.
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//Už jsem o tobì slyšel.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar mi oznámil, že prý se mnou chceš mluvit.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Jsi ten cizinec, který se dožaduje Innosova oka.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Jsem lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Královský paladin, váleèník našeho Pána Innose a nejvyšší velitel Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Mám spoustu práce. Takže neplýtvej mým èasem - a radìji mi øekni, proè tu jsi.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "Pøináším návrh pøímìøí od žoldnéøù!";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Pøináším návrh pøímìøí od žoldnéøù!
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(nevrle) Hm - ukaž!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Generála Leeho znám. Vím také o okolnostech, za jakých byl odsouzen k nuceným pracem v kolonii.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Považuji ho za èestného muže. Jsem ochoten mu jeho prohøešky odpustit - ale jenom jemu!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//To se netýká jeho mužù. Vìtšina z nich jsou hanební hrdloøezové a svùj trest si plnì zasluhují!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Jim rozhodnì nic neprominu. Mùžeš jim to oznámit.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Je to všechno?
	};
	b_logentry(TOPIC_FRIEDEN,"Lord Hagen je ochoten zprostit viny Leeho, ale nikoliv ostatní žoldnéøe.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "Nedaleko se shromažïují zástupy zlých stvùr. V Hornickém údolí.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Nedaleko se shromažïují zástupy zlých stvùr. V Hornickém údolí.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//V Hornickém údolí? Vyslali jsme tam výpravu. Neustále nám docházejí zprávy o tom, že prùsmyk okupují skøeti.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Ale o armádì Zla se ke mnì ještì nic nedoneslo.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Není to jen nìjaký ubohý trik, který mì má pøesvìdèit o nezbytnosti spojit síly se žoldnéøi?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Ne.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(skepticky) Co to má být za armádu?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Armáda drakù, která kolem sebe shromáždila zástupy pøisluhovaèù.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Draci? Podle starých spisù to už je nìkolik století, co nìkdo naposledy vidìl draka.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Povìz - proè bych mìl vìøit jedinému tvému slovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Jenomže otázka není, jestli mi mùžeš vìøit. Otázka je, jestli si mùžeš dovolit mi NEVÌØIT v pøípadì, že mluvím pravdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Dokud nebudu mít dùkaz, nemohu tam vyslat více mužù.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = TRUE;
	description = "Takže chceš, abych ti pøinesl nìjaký dùkaz?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (HAGEN_BRINGPROOF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//Takže chceš, abych ti pøinesl nìjaký dùkaz?
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Pøesnì tak. Projdi prùsmykem a dostaò se do Hornického údolí. Až tam budeš, najdi mou výpravu - a až se ti to podaøí, promluv si s velitelem Garondem.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Pokud nìkdo ví, jaká tam panuje situace, tak je to on.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//Jestli tvoje slova potvrdí, jsem pøipraven ti pomoci.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Znamená to, že mi pak dáš Innosovo oko?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Innosovo oko... dobrá. Pøines mi dùkaz a já pak dohlédnu na to, abys smìl nosit ten amulet.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//Mám tedy v tomto ohledu tvoje slovo?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Samozøejmì - máš ho mít.
		HAGEN_BRINGPROOF = TRUE;
	}
	else
	{
		if(hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED_NOV,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED,-1,-1,FONT_SCREEN,2);
		};
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "Co víš o Innosovu oku?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Co víš o Innosovu oku?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//Je to posvátný artefakt. (zadumanì) Ve starých proroctvích se øíká, že je nìjak spojen s draky.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//V tìchto spisech je ale také zmínka o tom, že jej mùže nosit jen Innosùv Vyvolený.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//JÁ jsem Innosùv Vyvolený!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Potom možná budeš moci ten amulet nosit.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "Jak se mám dostat pøes ten prùsmyk?";
};


func int dia_lord_hagen_pass_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Jak se mám dostat pøes ten prùsmyk?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Dám ti klíè od vrat v prùsmyku. Budeš si ale muset najít zpùsob, jak proklouznout mezi vojskem skøetù.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Nech tì Innos ochraòuje.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Lord Hagen si žádá dùkaz, že armáda zla skuteènì existuje. Musím se vydat do Hornického údolí a promluvit si s velitelem Garondem.");
	if(FERNANDO_IMKNAST == FALSE)
	{
		b_startotherroutine(fernando,"WAIT");
	};
	Wld_InsertNpc(bdt_1020_bandit_l,"NW_TROLLAREA_PATH_47");
};


instance DIA_ADDON_LORD_HAGEN_ORNAMENT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 10;
	condition = dia_addon_lord_hagen_ornament_condition;
	information = dia_addon_lord_hagen_ornament_info;
	description = "Hledám kovovou ozdobu. Mìla by být u kamenného kruhu blízko Lobartovy farmy.";
};


func int dia_addon_lord_hagen_ornament_condition()
{
	if((MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING) && (LORD_HAGEN_GOTORNAMENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lord_hagen_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//Hledám kovovou ozdobu. Mìla by být u kamenného kruhu blízko Lobartovy farmy.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//Pokud myslíš tenhle kus tady ... mysleli jsme si, že by to mohla být magicka runa, ale ta vìc je úplnì bezcenná.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//Múžeš si to vzít. Nemám pro to žádne využití.
	CreateInvItems(self,itmi_ornament_addon,1);
	b_giveinvitems(self,other,itmi_ornament_addon,1);
	LORD_HAGEN_GOTORNAMENT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Proè jste pøišli do Khorinisu?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Proè jste pøišli do Khorinisu?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Plníme dùležitý úkol ve prospìch království. Naše rozkazy pocházejí pøímo od krále Rhobara.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//Øekl jsem ti, že jsme poslali výpravu do Hornického údolí. Proto tu jsme.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "Co dìlají vaši muži v Hornickém údolí?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//Co dìlají vaši muži v Hornickém údolí?
	if(HAGEN_BRINGPROOF == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Nevidím dùvod, proè bych ti mìl øíkat nìco takového!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//Byl jsi tam. Mìl bys to vìdìt.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//Dobrá, protože tam máš tak jako tak namíøeno, tak ti to mùžu øíct.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Jde o magickou rudu. Mùže rozhodnout o výsledku války.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Bez dostatku zbraní ukutých z magické rudy nemá královská armáda ani tu nejmenší šanci obstát v boji proti elitním skøetím váleèníkùm.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//A doly tady na ostrovì jsou poslední, ke kterým ještì máme pøístup.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Jakmile naši loï plnì naložíme rudou, vrátíme se zpátky na pevninu.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//Válka se skøety se tedy nevyvíjí moc dobøe, co?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//Už tak jsem toho øekl víc, než je zdrávo.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "Hledám mistra meèe.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Hledám mistra meèe.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//Vážnì? Jednoho jsi právì našel.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Lord Hagen mì zasvìtí do tajù boje s obouruèními zbranìmi.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Tak zaènìme (osvojit si dovednost obouruèního boje).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Zaènìme.
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Teï jsi sám dobrým mistrem meèe. Už tì nemohu dál uèit.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Nech tvé další skutky provádí moudrost mistra meèe.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "Chtìl bych vstoupit do služby øádu.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Chtìl bych vstoupit do služby øádu.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Dobrá, už jsi dokázal, že máš dost odvahy, schopnosti a zkušeností, abys mohl sloužit Innosovi.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Tvé skutky jsou dostateèným dùkazem èistého srdce.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Je-li to tvé pøání, vítám tì v našem øádu.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"Ještì si nejsem tak úplnì jistý.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"Jsem pøipraven!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Být Innosovým váleèníkem znamená zasvìtit všechny své èiny Innosovým zámìrùm.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Do øádu jsou pøijati jen nejèestnìjší a nejstateènìjší váleèníci.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Pokud jsi pevnì rozhodnut stát se paladinem, musíš nejprve prokázat, že jsi toho hoden.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Ještì si nejsem tak úplnì jistý.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Tak jdi a oèisti své srdce od pochybností. Vra se, až budeš pøipraven.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Jsem pøipraven!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(vážnì) Tak budiž dle tvé vùle!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//(vážnì) Mnoho mužù se vydalo touto cestou a položili své životy ve jménu Innose.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//(vážnì) Pøísaháš, že tvé skutky budou dìlat jejich smrti èest a budou hlásat slávu Innosovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Pøísahám!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Od této chvíle tì tedy prohlašuji èlenem našeho spoleèenstva.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Zároveò tì ustanovuji Innosovým váleèníkem.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Dávám ti zbranì a zbroj rytíøe. Nos je s hrdostí, rytíøi!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//Dále, na základì tvé hodnosti ti dovoluji pøístup do kláštera.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht tì nauèí naší magii, staèí, když za ním pùjdeš a promluvíš si s ním.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//A jsou ti samozøejmì otevøeny naše ubikace na horním konci mìsta.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "Jak mohu dokázat, že jsem toho hoden?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Jak mohu dokázat, že jsem toho hoden?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//To prokáží tvé skutky.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//Bojujeme v Innosovu jménu za svobodu a spravedlnost.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Bojujeme proti Beliarovi a jeho pohùnkùm, kteøí chtìjí znièit Innosùv øád.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Rozumím.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Vùbec nièemu nerozumíš! Naše èest je náš život a náš život je Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Každý paladin, jenž se spravedlivì bije, šíøí dál slávu Innose a mnozí z nás již položili život na oltáø vìèného boje dobra a zla.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//My všichni ctíme tuto tradici. Pokud selžeme, pošpiníme skutky našich padlých druhù.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Jen ten, kdo tohle beze zbytku pochopí, je hoden stát se paladinem.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jak to vypadá?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Musím najít zpùsob, jak tuhle výpravu zachránit.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Musíme s tìmi draky nìco udìlat.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(k sobì) Možná by nás teï mohlo zachránit Innosovo oko.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Asi jsem pøišel o rozum. Jsem voják, ne byrokrat.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//S tímhle vším papírováním, které mám na krku, si sotva dokážu vzpomenout, jaké to je tøímat meè.
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "Já Oko mám - ale je rozbité.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Já Oko mám - ale je rozbité.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//COŽE? U Innose! Cos to udìlal? To Oko potøebujeme!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Promluv si s Pyrokarem! Musí existovat nìjaký zpùsob, jak jej zase opravit.
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "Pøináším novinky od Garonda. Dal mi pro tebe tenhle dopis.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Pøináším novinky od Garonda. Dal mi pro tebe tenhle dopis.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Naše postavení je horší, než jsem se obával. Ale podej mi hlášení o situaci v Hornickém údolí.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Paladinové jsou obklíèeni na hradì v Hornickém údolí, všude kolem jsou skøeti.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Pøi dolování byly obrovské ztráty a skoro žádná ruda už nezbývá.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//No, pokud mùžu øíct svùj názor, tak když tìm chlapíkùm nikdo nepomùže, jsou ztraceni. Tak to alespoò vypadá.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Najdu zpùsob, jak tu výpravu zachránit. Udìlal jsi toho pro nás tolik. Innos se ti odvdìèí.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Nechci jeho vdìènost. Chci jeho oko.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Ano, samozøejmì. Plním své sliby. Vezmi si tenhle dopis. Otevøe ti brány kláštera.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Promluv si s Pyrokarem, nejvyšším ohnivým mágem, a prokaž se mu touhle listinou. Zaøídí ti pøístup k Innosovu oku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//A ještì nìco, než pùjdeš.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//Na dùkaz mé vdìènosti si vezmi tuhle runu. Pøenese tì bezpeènì zpátky do mìsta, kdykoliv si zamaneš.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Lord Hagen mi pøedal zprávu, která pøimìje mistra Pyrokara, aby mi v klášteøe vydal Innosovo oko.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "Potøeboval bych si s tebou promluvit o Bennetovi.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Potøeboval bych si s tebou promluvit o Bennetovi.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Ale to je pøece ten žoldák, co zavraždil jednoho z mých mužù.
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Jak si mùžeš být tak jistý, že je vrahem právì Bennet?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Vìøím, že je Bennet nevinný.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Bennet by nám mohl pomoci opravit Innosovo oko.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Bennet by nám mohl pomoci opravit Innosovo oko.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//I kdyby dokázal pøitáhnout na zem moc samotného Innose...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//Zavraždil paladina. Za to bude popraven!
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Jak si mùžeš být tak jistý, že je vrahem právì Bennet?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//Máme svìdka.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Jak vidíš, není o vinì toho žoldáka žádných pochyb.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Kdo je tím svìdkem?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, tajemník místodržícího. On tu vraždu vidìl.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Jeho popis padne bez jakýchkoliv pochyb na Benneta. Co se mì týèe, vìc je vyøízena.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Ten žoldák bude viset za velezradu.
	b_logentry(TOPIC_RESCUEBENNET,"Svìdkem je tajemník místodržícího, Cornelius. Tvrdí, že celou vraždu vidìl.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//Vìøím, že je Bennet nevinný.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Dùkazy jsou jasné. Je vinen.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//A co když je dùkaz mylný?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Dávej pozor, co øíkáš. Vznášíš vážné obvinìní.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Pokud mi nemùžeš pøedložit dùkazy o tom, že svìdek lhal, radìji mlè.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Cornelius lhal.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius lhal.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Jak to víš?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Mám jeho deník. Je v nìm všechno.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(zuøivì) Ten slizký bastard!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//Pod vahou nových dùkazù mi nic jiného nezbývá.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Z moci úøadu svìøeného mi králem a církví prohlašuji...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//... že vìzeò Bennet je zbaven všech obvinìní a tudíž svobodný èlovìk.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Cornelius bude s okamžitou platností vzat do vazby pro køivopøísežnictví.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Ušetøi si námahu. Cornelius je mrtvý.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//V tom pøípadì se mu již dostalo spravedlivého trestu. Dobrá práce.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Ukrývá se.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Døíve nebo pozdìji se objeví. Pak ho zatkneme.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Tvé skutky jsou ke cti nás všech.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "Pøináším Oko!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Pøináším Oko!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(uctivì) Neseš Oko!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//A dal jsi jej zpìt dohromady!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//V tom pøípadì jsi Innosùv Vyvolený!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Vyrazím na cestu a zabiju všechny draky v Hornickém údolí!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Nech tì Innos doprovází a svou mocí znièí Zlo!
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "Na zemi útoèí elitní skøetí váleèníci.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Na zemi útoèí elitní skøetí váleèníci.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Zpravil jsem lorda Hagena o postupujících tlupách skøetích nájezdníkù.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Co tì k tomu vede?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Mluvil jsem s jedním z nich. Padlo tvoje jméno.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Nesmysl. Moji lidé zatím žádnou masivní invazi skøetù nehlásili.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Možná se v nedalekých lesích ztratil nìkterý z jejich zvìdù.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Nebyli to žádní zvìdové. Jednomu z nich jsem vzal tento prsten.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Ukaž mi ho.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Hmm. Tak to je docela znepokojivé.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//Tohle je znamení jejich moci. Takže skøeti opustili své palisády a bojují na otevøeném prostranství.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Zatím jsem jich moc nevidìl. Hlavnì jejich velitele a jen pár bojovníkù.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Vážnì? V tom pøípadì musejí mít za lubem nìco jiného. To mi ke skøetùm moc nesedne, že by jejich vùdci sami opustili své ochranné palisády.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Mohla by to však být ideální pøíležitost, jak jim uštìdøit citelný úder.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Pokud by pøišli o své velitele, spadne jim morálka na bod mrazu.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//Máš nový úkol, rytíøi. Zabij všechny skøetí velitele, které v téhle oblasti najdeš.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Pøines mi jejich prsteny. To by mohlo skøety srazit na kolena.
		b_logentry(TOPIC_ORCELITE,"Podaøilo se mi pøinést lordu Hagenovi dùkaz - prsten skøetího vojevùdce. Požádal mì, abych mu pøinesl všechny, které najdu.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Poraï se s Ingmarem. Mùže ti prozradit pár taktik, které by se ti pøi bojích se skøetími veliteli mohly hodit.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Skøetí elitní bojovníci jsou jeho specialita. Mìl s nimi èasto co do èinìní.
			b_logentry(TOPIC_ORCELITE,"Elitní skøetí váleèníci jsou Ingmarovou specialitou.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Tvoje pouhé tvrzení, že jsi zabil jednoho ze skøetích velitelù, mi nestaèí.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Pokud to nemám brát na lehkou váhu, potøebuji nìjaký hmatatelnìjší dùkaz.
		b_logentry(TOPIC_ORCELITE,"Hagen mi poøád nechce vìøit. Žádá dùkaz, že elitní váleèníci skuteènì útoèí na civilizované kraje. No, spíš by mì pøekvapilo, kdyby to bylo naopak.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "Je tady ještì jedna vìc, kterou musím ohlednì tìch skøetích velitelù nahlásit.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Je tady ještì jedna vìc, kterou musím ohlednì tìch skøetích velitelù nahlásit.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Tak povídej.
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Mám pro tebe další skøetí prsten.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Mám pro tebe další skøetí prsteny.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Jsem na tebe hrdý. Jen tak dál!
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//Možná tam ještì nìkde nìjaký je.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Brzy je srazíme na kolena.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Vážnì by mì pøekvapilo, kdyby se jich tu potulovalo o mnoho víc.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Jejich prsteny mi samozøejmì mùžeš nosit i nadále, ale myslím, že skøeti už náš vzkaz pochopili.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Vezmi si. Tady máš nìjaké zlato na své vybavení.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "Draci jsou mrtví.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Draci jsou mrtví.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Vìdìl jsem, že ti Innos dá sílu porazit draky!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Kde je ruda?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Skøeti ještì poøád obléhají hrad v Hornickém údolí. Garond nemá žádnou šanci opevnìní opustit, dokud obléhání neskonèí.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(zuøivì) Zatracenì!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Jestliže Garond nedokáže tu situaci zvládnout, budu se o to muset postarat sám.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//Pár skøetù mì nezastaví! Mì ne!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Už jsem informoval své muže. Jsme pøipraveni k odjezdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Pojedeme VŠICHNI. Nechám na lodi jen nezbytnou posádku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//To by mìlo staèit na to, abychom s tìmi skøety koneènì zametli!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "Potøebuji loï.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Potøebuji loï.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//To hodnì lidí, vojáku.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//(zasmìje se) To slyším skoro každý den, ctihodnosti. Ale...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//Nemáš dokonce ani kapitána, o posádce nemluvì.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//Co ta loï v pøístavu?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Ta je moje a moje také zùstane. Až nadejde èas, odvezeme s ní rudu.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Ale až to bude za námi, mùžeš se mì zeptat znovu.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "Skøeti vtrhli do hradu v Hornickém údolí!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Skøeti vtrhli do hradu v Hornickém údolí!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//U Innose! Co pøesnì se tam stalo?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Nìjak se musela otevøít brána.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Nìjak?! Jak by to bylo možné... Na hradì musí být zrádce!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "Na co èekáš?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Na co èekáš?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Èekáme na výstroj a proviant. Pak vyrazíme!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Teï, když jsou na hradì skøeti, potøebujeme proviantu ještì víc než pøedtím.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//To ale náš odchod o moc nezdrží.
	};
};

