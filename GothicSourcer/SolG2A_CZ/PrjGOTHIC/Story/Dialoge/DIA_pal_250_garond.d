
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Nemáme se o èem bavit, dokud nezaplatíš pokutu.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//A ta podle posledních obvinìní zase stoupla.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Zdá se, že ses zapletl do dalších potíží.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Ale doufám, že to koneènì všechno zaplatíš! Dohromady to dìlá...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Vážnì jsi mì zklamal. Tvoje pokuta je...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Objevilo se pár nových skuteèností.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Z nièeho nic už nejsi obvinìný z vraždy.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Nikdo si nevzpomíná, že by tì vidìl krást.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//Už není nikdo, kdo by tvrdil, že tì vidìl zapleteného do nìjaké rvaèky.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Zdá se, že všechna obvinìní proti tobì byla stažena.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Netuším, o co tam šlo, ale varuju tì: nepøehánìj to!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Rozhodl jsem se zapomenout na tvé dluhy.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//A už se na hradì nezaplétej do žádných potíží!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//Jedno si vyjasnìme: tak jako tak budeš muset zaplatit pokutu v plné výši.
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//No, takže co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"Nemám dost penìz!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"Kolik že to bylo?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"Nemám dost penìz!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"Kolik že to bylo?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Takže to jsi ty, kdo dìlá na hradì problémy.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//Øíkal jsem si, kdy za mnou koneènì zavítáš.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Vražda je pøesnì to poslední, co tady potøebujeme.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Potøebuji každého ze svých lidí - a teï mám o jednoho míò!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//A to nemluvím o tìch dalších vìcech, do kterých ses zapletl.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Nìco ti vysvìtlím. Všichni jsme tady ve stejné pasti.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//A zoufale potøebuji každého ze svých mužù. Vèetnì tebe.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Pokud chceš mermomocí nìkoho zabít, staèí, když odejdeš z hradu. Je tam spousta skøetù.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Ukládám ti pokutu - i když mì vážnì štve, že se musím zabývat vìcmi jako je tohle.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Šušká se, že si tu a tam pøilepšíš z vìcí, které ti neøíkají pane.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//A to nemluvím o dalších vìcech, které se ke mnì donesly.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Z toho se jen tak nevyvlíkneš. Zdá se, že nechápeš vážnost naší situace.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Budeš muset zaplatit pokutu, která by vyrovnala tvé zloèiny!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Rvaèky mezi mužstvem nevidím rád.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//A to s tou ovcí bylo také zcela zbyteèné.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Takže budeš muset zaplatit pokutu!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Ty jen tak zabíjíš ovce? Patøí nám všem.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Zaplatíš mi za to maso.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Kolik?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"Nemám dost penìz!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"Chci tu pokutu zaplatit!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Dobrá, øeknu chlapcùm, aby se uklidnili. Ale bìda ti, jestli tì ještì jednou pøistihnu pøi nìèem takovém!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//Nemám dost penìz!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//V tom pøípadì by sis mìl nìjaké rychle sehnat.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//A varuju tì: jestli se zapleteš ještì do nìèeho, tak se ta èástka ještì zvýší!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Odkud jsi pøišel? Nejsi žádný z horníkù a ani žádný z mých mužù. No?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Pøišel jsem skrz prùsmyk.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Skrz prùsmyk...? Ty jsi vážnì prošel - u Innose!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Proè jsi tu cestu podstupoval, mágu?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Jaké jsou tvoje rozkazy, vojáku?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Vrtá mi hlavou, proè by chtìl žoldák nìco takového. Co tady dìláš?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "Pøicházím od lorda Hagena. Chce, abych mu donesl dùkaz o pøítomnosti drakù.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Pøicházím od lorda Hagena. Chce, abych mu donesl dùkaz o pøítomnosti drakù.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//A to jsi pøišel jen proto, abys jej sebral a zase zmizel?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Pøesnì to jsem mìl v plánu.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//Takže on chce dùkaz? Mùže ho mít. Ale nemùžu tì poslat zpátky za lordem Hagenem, aniž bych mu øekl o rudì.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Poslouchej - lord Hagen se musí bezpodmíneènì dozvìdìt o zdejší situaci a o tom, kolik rudy se nám podaøilo vydolovat.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//Dobrá, co chceš, abych pro tebe udìlal?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//Mám tam tøi skupiny horníkù, ale ještì jsem od nich nevidìl ani zrnko.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Obejdi všechny doly a nahlas mi, kolik rudy už mají.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Pak ti napíšu dopis, který doneseš zpátky lordu Hagenovi.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Dobrá. Zdá se, že nemám na výbìr.
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Ještì než mì velitel Garond pošle zpátky, chce, abych nalezl tøi skupiny kopáèù a zjistil, kolik rudy už získali.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Velitel Garond mì povìøil dalším posláním. Už pøed èasem vyslal tøi oddíly kopáèù, kteøí mìli pátrat po magické rudì, ale nikdo z nich s dosud nevrátil.");
	b_logentry(TOPIC_SCOUTMINE,"Musím ty ztracené oddíly najít a zjistit, kolik rudy už se jim podaøilo vytìžit.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "Ale proè zrovna já?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Ale proè zrovna já?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Protože víš, jak proklouznout mezi skøety. Moji chlapci by tam byli beznadìjnì ztracení.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//Ty jsi mezi nimi ale už jednou prošel - to je nejlepší dùkaz, že jsi pro tenhle úkol ten pravý.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "Potøebuji nìjaké vybavení.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Potøebuji nìjaké vybavení.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Promluv si s mágem Miltenem, je tady na hradì. On bude vìdìt, co by se ti mohlo hodit.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Promluv si o tom s Tandorem. Dá ti všechno, co budeš potøebovat.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Tandor na hradì obchoduje se zbranìmi.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "Kolik mi dáš, když tvùj úkol splním?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Kolik mi dáš, když tvùj úkol splním?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(pohnìvanì) Nejsem zvyklý dohadovat se se žoldáky.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Dobrá, zdá se, že nemám na výbìr. Když se o to postaráš jak je tøeba, dám ti 500 zlatých.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Kde najdu ty doly?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Kde najdu ty doly?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Vezmi si tuhle mapu. Jsou na ní zakreslené dvì oblasti, ve kterých jsou doly.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Pokud bys mìl ještì nìjaké dotazy, zeptej se Parcivala. Øekne ti všechno, co bys mìl vìdìt o hornících.
	b_logentry(TOPIC_SCOUTMINE,"Informace o kopáèích mohu získat od paladina Parcivala.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Zatracenì! Co se to tam dìje? To nás pøišel vyhladit samotný Beliar?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Moji muži jsou témìø mrtví a s tou trochou rudy, co máme, bychom nezastavili JEDINÉHO SKØETA, NATOŽ CELOU ARMÁDU!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Celá výprava je odsouzená k záhubì.
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "Promluvil jsem si s Fajethem.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Promluvil jsem si s Fajethem.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Co má na srdci?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Jeho lidé vydolovali dvì bedny rudy.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmm... dvì bedny? Nepotøebuju dvì bedny - potøebuju DVÌ STOVKY.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Mám ti vyøídit, že potøebuje víc mužù.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Cože? To mám poslat další lidi na jistou smrt? Na to mùže zapomenout.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "Co se Silvestrova dolu týèe...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (SILVESTRO_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Co se Silvestrova dolu týèe...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Vidìl jsi ho? Mluvil jsi s ním?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Všichni zemøeli. Pøekvapili je dùlní èervi.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//A co ruda? Víš, kolik jí vytìžili?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Podaøilo se jim zachránit pár beden. Jsou v jeskyni poblíž cesty mezi hradem a dolem.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Zatracenì! Byli to vážnì dobøí chlapi - nech se Innos slituje nad jejich dušemi.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "Setkal jsem se s Marcosem.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Setkal jsem se s Marcosem.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//A? Co hlásí? Kolik rudy pro nás má?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Ètyøi bedny. Opustil dùl, aby dostal rudu do bezpeèí.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Teï ty bedny hlídá v malém údolíèku za skøetími liniemi. Žádá ale o posily.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Cože? Jenom ètyøi bedny - a opustil dùl? Sakra, to není dobré.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//A teï chce ještì další muže? No dobrá, pošlu mu dva chlapy.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "A co ten dopis pro lorda Hagena?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//A co ten dopis pro lorda Hagena?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//Máme dohromady deset beden rudy - a ztratili jsme dvakrát tolik dobrých mužù.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Dostaneš svùj dopis. Lord Hagen se o tom MUSÍ dozvìdìt. Tohle údolí je prokleté - hnízdí tady zlo.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Velitel Garond mi dal dopis, který by mìl být dostateèným dùkazem. Musím jej ukázat lordu Hagenovi.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "A co moje mzda?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//A co moje mzda?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//No jo, dobrá. Ještì ti vlastnì dlužím nìjaké zlato. Tady je tvoje odmìna.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Jak to vypadá?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Teï už jen èekám na zprávy z posledního dolu - a doufám, že to budou dobré zprávy.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Potøebuji zprávy o tom, jak to vypadá v dalších dvou dolech. Pak se uvidí.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Mìl by ses vydat hledat ty doly. Zoufale potøebuji zprávy o tom, jak to vypadá s dobýváním rudy.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "Chci, abys pustil Gorna.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Chci, abys pustil Gorna.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//Nemùžu ho propustit. Spáchal mnoho zloèinù, za které musí pykat.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Mùžu za nìj zaplatit jeho pokutu?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//To by možná šlo - ale rozhodnì to nebude levné. Za Gorna budu chtít 1000 zlatých.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//To je hodnì penìz.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Gorn se také musí zodpovídat za hodnì vìcí. Pøines mi ty peníze a já Gorna propustím.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Garond žádá za Gornovo propuštìní tisíc zlaákù.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "Chtìl bych vykoupit Gorna.";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Chtìl bych vykoupit Gorna.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Dobrá. Bìž za Geroldem a øekni mu, a na mùj rozkaz Gorna propustí.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Zaplatil jsem Garondovi. Teï se Gorn mùže dostat z lochu - strážce Gerold ho pustí.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//V tom pøípadì mi pøines 1000 zlatých.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "Co budeš dìlat teï?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Co budeš dìlat teï?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Mám už všeho dost. Moje jediná nadìje jsi teï ty - a že mi lord Hagen pošle posily.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Budeme stát pevnì jako skála a modlit se k Innosovi, aby nás v této temné hodinì nenechal klesnout na mysli.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Zatracenì. Co se tady flákáš? Potøebuju ty zatracené posily!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Dokonce i Milten opustil hrad. Ale já nepotøebuju míò lidí - potøebuju jich víc!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "Jsem zpìt.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Jsem zpìt.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//No to vidím. Kde jsou ty posily?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen pøijde, jakmile vyøídí všechny nezbytné záležitosti. Hodnì se toho stalo.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//To mì nezajímá. Mì zajímají vojáci. Skøetù je èím dál tím víc a moc dlouho se už neudržíme.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Muži jsou unavení a dochází nám proviant.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Pøijelo pár dobrovolníkù.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Myslíš sebe a tìch tvých pár drakobijcù, co? Mùžete nám sice pomoci, ale poøád vás není dost.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Myslíš ty drakobijce na dvoøe? Ti nám sice mohou pomoci, ale poøád jich není dost.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Jestli Hagen co nejdøív nepošle nìjaké muže, pak za nic neruèím.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "Mám zprávy o dracích...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"Garond se musí zajímat o to, jak to s draky vypadá, i když pùsobí dojmem, že ve skuteènosti mu to mùže být ukradené.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//Mám zprávy o dracích.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Podej hlášení.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Zabil jsem draka v bažinì na východ odsud.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Drak ve skalní pevnosti na jihu je mrtvý.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Ohnivý drak v sopce na jihu už nebude tropit žádné potíže.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Vydal jsem se do zmrzlé oblasti na západì a zlikvidoval tamního draka.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//To jsou dobré zprávy. Tady. Vezmi si nìjaké peníze na doplnìní výbavy.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Mùžeš mi dát nìjaké další informace o dracích?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Vrásky mi teï dìlají jiné vìci. Oric, mùj dùstojník pøes strategické vìci, ti o tom øekne víc.
		b_logentry(TOPIC_DRACHENJAGD,"Garondùv strategický dùstojník Oric by pro mì mohl mít nìjaké užiteèné informace.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Provedli draci mezitím nìjaký další útok?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Naštìstí ne. Prozatím se drží zpátky.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "Všichni draci jsou mrtví.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(nevìøícnì) Všichni? Takže zlo bylo navždy zažehnáno?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Ne, to bohužel ne. Ještì poøád zbývá jejich vùdce.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Copak nebyli draci veliteli skøetù?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Ano, to ano, ale mají svého vlastního pána. Toho se musíme také zbavit.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Zatracenì, do toho jít nemùžu. Musím hlídat rudu, a ještì navíc tu jsou poøád ti skøeti.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Budeš se o to muset postarat sám. Nemùžu ti pomoci.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Nech tì Innos ochraòuje.
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "Máme problém s kováøem.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//Máme problém s kováøem.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Jakým kováøem? Pøed chvílí tu byl.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//On se vrátil? V tom pøípadì mu øekni...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Ne, já mluvím o Janovi.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//Je to drakobijec jako já, a je to dobrý kováø.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Jeden z drakobijcù. Je to kováø.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//To je dobøe. Náš pøedchozí kováø zmizel, srab jeden.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan se o kovárnu rád postará.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Aha. Takže si myslíš, že bych mu mìl vìøit.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Ano.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Pokud si jsi tak jistý, mùžeš se za nìj zaruèit.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Jestliže bude dìlat nìjaké potíže, budeš se za to zodpovídat ty. Souhlasíš?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"Budu o tom pøemýšlet.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"Zaruèím se za Jana.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Budu o tom pøemýšlet.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Jak mu mám vìøit já, když mu nedùvìøuješ ani ty sám?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Pokud se za toho tvého Jana nikdo nepostaví, bude muset držet ruce od výhnì dál.
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Zaruèím se za Jana.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Dobrá. V tom pøípadì mùže kovárnu používat. Samozøejmì také bude muset udìlat meèe pro mé muže.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Jak to vypadá?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Zatracenì! Nìjaký parchant nechal hlavní bránu otevøenou. Teï je z nás krmení pro vlky.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Až dostanu toho zrádce do rukou...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Pokud Hagen nepøijde co nejdøív, pochcípáme tady jako mouchy.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

