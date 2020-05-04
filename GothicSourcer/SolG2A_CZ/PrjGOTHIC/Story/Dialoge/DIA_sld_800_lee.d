
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Hm. Dobøe, že jsi pøišel.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//Tohle jsem našel ve staré kapli.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//Je to magická runa. Myslím, že tì teleportuje rovnou na farmu.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//Napadlo mì, že by se ti mohla hodit.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Pøišel jsi dát Onarovi peníze?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Už jsem ti øíkal, že se nemáš snažit o žádné hlouposti.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar zjistil, že sis zase stihl vylepšit záznamy.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Bude tedy po tobì chtít také víc penìz.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Kolik?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Myslel jsem si o tobì, že jsi chytøejší.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//V tom pøípadì pro tebe mám dobré zprávy.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Už není nikdo, kdo by tvrdil, že tì vidìl spáchat vraždu.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Nikdo už nebude svìdèit, že tì vidìl krást.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Už není nikdo, kdo by VIDÌL, jak jsi zmlátil jednoho z farmáøù.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Vypadá to, že se všechna obvinìní proti tobì rozplynula jako pára nad hrncem.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//I takhle je možné se vypoøádávat s problémy.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Tak nebo tak, platit už nemusíš.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Pøíštì si ale dávej pozor.
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Jedno je jisté: tak jako tak musíš zaplatit pokutu v plné výši.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//No, takže co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"Nemám dost penìz!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"Kolik že to bylo?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"Nemám dost penìz!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"Kolik že to bylo?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Kýho èerta - (pøekvapenì) - to jsi TY ten nováèek, který jde z jednoho maléru do druhého?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Slyšel jsem do Gorna, že jsi poøád naživu, ale že pøijdeš sem... no...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Dobøe, že jsi za mnou pøišel, než to zaèalo být pro tebe ještì horší.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Žoldáci jsou tvrdí hoši a farmáøi také nejsou žádná oøezávátka, ale chodit po okolí a zabíjet na potkání? To prostì nejde.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//A to nemluvím o dalších potížích, do kterých ses dostal.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Mùžu ti pomoci dostat se z téhle šlamastyky s èistým štítem.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Ale bude tì to nìco stát. Onar je poøádný lakomec, ale pokud se má na celou vìc zapomenout, musí to být ON, kdo pøimhouøí oko.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Dobøe že jsi pøišel. Slyšel jsem, že jsi prý nìco ukradl.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//A mlátil farmáøe hlava nehlava.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//A KROMÌ TOHO ještì zabil pár ovcí.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//To tady prostì dìlat nemùžeš. V takových pøípadech Onar požaduje, abych s viníkem zúètoval.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//To znamená, že ty zaplatíš a kapsu si namastí on. Na celou vìc se tak ale zapomene.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Když se zapleteš do souboje s nìkterým ze žoldnéøù, je to nìco jiného.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Ale když zmlátíš farmáøe, pobìží rovnou za Onarem. A ode mì se bude oèekávat, že nìjak zakroèím.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Nemluvì o tom, že je docela háklivý na to, když mu nìkdo zabíjí ovce.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Budeš muset zaplatit pokutu. Onar si pokaždé shrábne peníze do vlastní kapsy - ale jinak ta vìc urovnat nejde.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar ode mì oèekává, že budu chránit jeho farmu. A to zahrnuje i jeho ovce.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Budeš mu muset zaplatit odškodné!
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Kolik?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"Nemám dost penìz!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"Chci tu pokutu zaplatit!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Dobrá! Dohlédnu na to, aby Onar své peníze dostal. Mùžeš považovat celou vìc za vyøízenou.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//Nemám dost penìz!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//V tom pøípadì si je co nejrychleji sežeò.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Ale nemysli si, že je mùžeš ukrást tady na farmì. Kdyby tì chytili, bylo by to pro tebe ještì horší.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Kýho èerta - (pøekvapenì) - Co tady dìláš? Myslel jsem, že jsi mrtvý!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//Proè si to myslíš?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn mi øekl, žes to byl ty, kdo strhnul bariéru.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Ano, byl jsem to já.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Nikdy bych neøekl, že nìkdo mùže nìco takového pøežít. Co tì sem pøivádí? Nejsi tu jen tak pro nic za nic.
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "Potøebuju si nutnì promluvit s paladiny z mìsta.";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Potøebuju si nutnì promluvit s paladiny z mìsta. Mùžeš mi pomoci nìjak se k nim dostat?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(nedùvìøivì) Co kuješ s paladiny?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//To je dlouhý pøíbìh...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//Já mám èas.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(povzdychneš si) Posílá mì Xardas. Chce, abych získal mocný amulet, Innosovo oko.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Takže poøád ještì držíš s tím nekromantem. Aha. A ten amulet mají paladinové?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Pokud vím, tak ano.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Mùžu ti pomoct dostat se k paladinùm. Ale nejdøív se musíš stát jedním z nás.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "Jak mi mùžeš pomoct dostat se k paladinùm?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Jak mi mùžeš pomoct dostat se k paladinùm?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Vìø mi. Mám plán. Myslím, že jsi na to ten pravý.
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Já tì dostanu k paladinùm a ty mi na oplátku prokážeš jednu službièku. Nejdøív ale vstup do našich øad!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "Co pøesnì tady dìláte?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//Co pøesnì tady dìláte?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Je to prosté: postarám se o to, abychom se všichni dostali z tohohle ostrova pryè.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Onar si nás najal, abychom chránili jeho farmu, a pøesnì to budeme dìlat.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Ale naší odmìnou bude víc, než jen náš žold. Tím, že pomáháme farmáøùm, jsme mìstu pøerušili zásobování.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//A èím míò toho budou mít paladinové k jídlu, tím døíve budou ochotni naslouchat, až k nim pøijdu s nabídkou k pøímìøí.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Škoda, že ses ze všech možných lidí spolèil zrovna s nimi.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Jak bude ta tvoje nabídka vypadat?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//V zásadì se bude jednat o naši milost a volný prùchod na pevninu. Víc se dozvíš, až pøijde èas.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "Rád bych se k vám pøidal!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Rád bych se k vám pøidal!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Doufal jsem, že to øekneš! Každá ruka je tady dobrá.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//Ty žoldáci, co jsem najal poslednì, dìlali jenom trable!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//V zásadì mùžeš zaèít okamžitì. No, ještì tady je pár vìcí, kterými musíš projít, ale není to nic zvláštního.
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "Èím musím 'projít', než se k vám budu moci pøidat?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Èím musím 'projít', než se k vám budu moci pøidat?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Zamìstnává nás Onar, zdejší statkáø. Mùžeš na farmì zùstat, jen když to on schválí.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//A pak tady jsou naši hoši. Mohu tì pøijmout jen v pøípadì, že s tím bude souhlasit vìtšina žoldákù.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Ale nechoï za Onarem, dokud to nebude jisté. Je to velmi popudlivý chlapík.
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"Mám-li být pøijat mezi žoldnéøe, musí mi mùj vstup do jejich øad nejdøíve schválit Onar.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "Jak mám žoldnéøe pøesvìdèit, aby mì pøijali?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Jak mám žoldnéøe pøesvìdèit, aby mì pøijali?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Øekl bych, že tím, že se budeš chovat jako žoldnéø.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Promluv si s Torlofem. Vìtšinou postává venku pøed domem. Ozkouší si tì.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Pokud tou zkouškou projdeš, mìl by sis vysloužit velkou èást potøebného respektu.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Øekne ti všechno ostatní, co bys mìl vìdìt.
	b_logentry(TOPIC_BECOMESLD,"Aby mì žoldnéøi pøijali mezi sebe, musím podstoupit zkoušku, kterou mi zadá Torlof, a vysloužit si respekt ostatních.");
};


instance DIA_ADDON_LEE_RANGER(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_addon_lee_ranger_condition;
	information = dia_addon_lee_ranger_info;
	description = "Co víš o 'Kruhu Vody'?";
};


func int dia_addon_lee_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_othersld) && (SC_KNOWSRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lee_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Co víš o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(smích)To jsem si mohl myslet. Není nic, kam bys necpal nos.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ale no tak, øekni mi o tom.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Nejsem do toho pøímo zapletený. Vím jen, že existuje tahle tajná frakce, za kterou jsou mágové Vody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Od pádu bariéry, už nejsem vázaný dohodou, kterou jsem uzavøel s mágy Vody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Samozrejmì, že se ti pokusím pomoct, když budeš nìco potøebovat. Avšak, mám málo èasu poslední dobou a své problémy, které mì zaneprázdòují.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Mohl by sis promluvit s Cordem pokud o tom chceš získat nìjaké informace. Pokud vím, tak je jedním z nich.
	RANGERHELP_GILDESLD = TRUE;
	SC_KNOWSCORDASRANGERFROMLEE = TRUE;
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "Jsem pøipraven se k vám pøidat!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Jsem pøipraven se k vám pøidat!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Ne, dokud neprojdeš Torlofovou zkouškou.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Tak co, prošel jsi Torlofovou zkouškou?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Ano.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//To je dobøe.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//Co øíkají ostatní žoldnéøi?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Nevím, jestli jich mám na své stranì dostatek.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//V tom pøípadì si promluv s Torlofem, ten ví o všem, co se tady na farmì šušká.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Vìtšina z nich stojí za mnou.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Dobrá, v tom pøípadì bìž za Onarem. Už jsem s ním o tom mluvil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Žold si ale musíš vysmlouvat sám.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"Teï už potøebuji pouze Onarùv souhlas.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Byl jsi za Onarem?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Souhlasil.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Vítej na palubì, chlapèe!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Tady, nejdøív si vezmi nìjaké poøádné brnìní!
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine(lothar,"START");
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Jsem rád, že jsi mezi námi.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//Hned pro tebe mám první úkol.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Má to co do èinìní s paladiny. Je na èase, aby ses za nimi vypravil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Stejnì jsi mìl v plánu tam jít.
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Vidím, že ses dal do služby paladinù.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Vstoupil jsi do kláštera? (smìje se) Èekal bych všechno, ale tohle ne.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//No, teï už se žoldnéøem stát nemùžeš.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Ale kdo ví, možná bys pro mì mohl jednu nebo dvì vìci udìlat - nebo já pro tebe.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Uvidíme. Tak nebo tak, pøeji ti jen to nejlepší.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Ale nesnaž se mi vìšet bulíky na nos, rozumíš?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "Jak se teï mohu dostat k paladinùm?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//Jak se teï mohu dostat k paladinùm?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Jednoduše. Doneseš jim naši nabídku pøímìøí.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Lorda Hagena, velitele paladinù, znám z dob své služby v královské armádì.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Vím, jakým zpùsobem pøemýšlí - nemá dostatek mužù. Tu nabídku pøijme. Pøinejmenším tì vyslechne.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Napsal jsem dopis - tady je.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//To by mìlo každopádnì staèit, aby tì pustili k veliteli paladinù.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Lee mì posílá, abych lordu Hagenovi pøedal dar na usmíøenou. Tak se mohu dostat mezi paladiny.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "Donesl jsem lordu Hagenovi tvoji nabídku pøímìøí.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Donesl jsem lordu Hagenovi tvoji nabídku pøímìøí.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Co øíkal?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Øekl, že tobì mùže zajistit prominutí tvých èinù, ale ne tvým lidem.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Ten palièatý blázen. Vìtšina mužù v KRÁLOVSKÉ armádì jsou vìtší hrdloøezové než moji chlapi.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Co budeš dìlat dál?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Musím najít jiný zpùsob, jak nás odsud dostat. Pokud to bude nutné, ukradneme loï. Budu si to muset promyslet.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Že bych sám vytáhl krk z oprátky a opustil své muže, to vùbec nepøipadá v úvahu.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Proè tak strašnì chceš na pevninu?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Proè tak strašnì chceš na pevninu?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Jak víš, sloužil jsem králi jako generál.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Ale jeho patolízalové mì zradili, protože jsem vìdìl nìco, co jsem vìdìt nemìl.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Vrazili mì do té tìžaøské kolonie a král to nechal být.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//Mìl jsem dost èasu, abych si to nechal projít hlavou.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Musím se pomstít.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(ohromenì) Králi?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(rozhodnì) Králi! A všem jeho pochlebníkùm. Budou trpce litovat, co mi udìlali.
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "Vydám se do Hornického údolí.";
};


func int dia_lee_rescuegorn_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Vydám se do Hornického údolí.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Nemyslel jsem si, že bys zùstal tady na farmì nìjak dlouho.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Jestli pùjdeš zpátky do kolonie, zkus najít Gorna. Paladinové ho drží jako vìznì.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn je dobrý chlapík a mnì by se tady hodil, takže kdybys mìl šanci ho osvobodit, tak vùbec neváhej.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Ano, už mi to øekl. Dobrá práce.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Stojí za víc, než Sylvio a jeho chlapci dohromady.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Gorn ti o mnì øekl?? Co se mu stalo?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Gorn ti o mnì øekl?? Co se mu stalo?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Pamatuješ si ho, že?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Nech mì hádat ...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Jasnì.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Jasnì.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Chytili ho paladinové a poslali ho s kolonou trestancù zpátky do Hornického údolí.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Kdyby nebyla cesta do Hornického údolí plná paladinù a skøetù, dávno bych tam poslal pár svých hochù, aby ho osvobodili.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Ale protože to vypadá tak, jako to vypadá, nemìlo by to smysl. Chudák.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Nech mì hádat.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Velký, tmavý, sprostý, s velkou sekerou - tenkrát v kolonii spolu s tebou dobyl zpátky náš rudný dùl.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "Onar teï má díky Bullcovi o pár ovcí míò.";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Onar teï má díky Bullcovi o pár ovcí míò.
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Ale no tak, nechoï za mnou s takovými kravinami! Už takhle mám starostí nad hlavu.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//Já taky. Zdá se, že Bullco má problémy se mnou. Chce, abych opustil farmu.
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//No a? Stùj si na svém.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Mohl bys mu øíct, aby se držel na uzdì, jinak mu ty ovce strhnu ze žoldu.
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "Vrátil jsem se z Hornického údolí...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Vrátil jsem se z Hornického údolí. Na hrad zaútoèili draci!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Takže to je pravda! Lares øíkal, že po mìstì kolují zprávy o dracích. Nemùžu tomu uvìøit...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//Co paladinové?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Jsou úplnì zdecimovaní.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Výbornì! Možná by lord Hagen mohl znovu zvážit mou nabídku.
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//A jestli ne... (ostøe) Pak najdeme jiný zpùsob, jak se odsud dostat.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Výbornì! Možná to lorda Hagena donutí pøesunout se do Hornického údolí se zbytkem svých mužù.
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Èím míò paladinù tady zùstane, tím lépe.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "Co takhle nìjaké lepší brnìní?";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//Co takhle nìjaké lepší brnìní?
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Splnil jsi svùj úkol.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//Mám tady pro tebe nìjaké lepší brnìní. Tedy pokud máš hotovost.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Torlof dostal od Onara úkol, o který se mìl již pøed èasem postarat.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Takže to nejdøív zaøiï - pak si mùžeme promluvil o lepším brnìní!
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "Koupit si støednì tìžkou žoldnéøskou zbroj. Ochrana: zbranì 50, šípy 50, cena 1000 zlaákù.";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Dej mi to brnìní.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Tady je. Vážnì dobrá zbroj.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Ale není to žádný dárek! Nejdøív chci vidìt zlato!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "Nemìl bys pro mì nìjakou lepší zbroj?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//Nemìl bys pro mì nìjakou lepší zbroj?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Samozøejmì.
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Koupit tìžkou žoldnéøskou zbroj. Ochrana: zbranì 80, šípy 80, cena: 2500 zlaákù.";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Dej mi to tìžké brnìní.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Tady je. Velice dobrá zbroj. Je stejná, jakou mám i já.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Víš, jak to chodí. Nejdøív peníze!
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "Nemáš pro mì nic dalšího na práci?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Nemáš pro mì nic dalšího na práci?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Nikdy nemáš dost, co? Už takhle máš problémù až až. Co dalšího bys ještì chtìl?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Další úkol. Jsem žoldák, zapomnìls?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Dobrá. Nìco by tu bylo. Je to pøesnì pro tebe.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Musím u jednoho soudce z mìsta vyrovnat dluh. Rád bych to samozøejmì vyøídil osobnì.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Ale paladinové mì k jeho domu nepustí na vzdálenost, co bys kamenem dohodil.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Celou záležitost musíš provést opatrnì. Takže dávej pozor. Pùjdeš za soudcem a nabídneš mu svoje služby.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Pokus se získat jeho dùvìru a dìlej pro nìj špinavou práci, dokud na nìj nìco nenajdeš.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Ta svinì už udìlala tolik prasáren, že se ten smrad line až k nebesùm.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Pøines mi nìco, s èím bych mohl jeho jméno pošpinit pøed domobranou. Zbytek života bude hnít v base.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Rozhodnì ale nechci, abys ho zabil. To by bylo pøíliš rychlé. Chci, aby trpìl. Rozumíš?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Myslíš, že to zvládneš?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Lee chce, abych našel nìjaký inkriminující dùkaz proti khorinisskému soudci. Mám mu proto nabídnout své služby a pøitom mít oèi na stopkách.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"Nic takového neudìlám.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"Bez problémù. Kolik?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Bez problémù. Kolik?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Tvoje odmìna závisí na tom, co mi doneseš. Takže se snaž.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Tohle dìlat nebudu. Nebudu si hrát pøed tou sviní na nìjakého patolízala.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Jen se neèerti. Ostatnì, byl to právì on, kdo tì nechal zavøít a hodit skrz bariéru. Nebo jsi na to snad už zapomnìl?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Dìlej co chceš, ale myslím, že se nakonec rozhodneš správnì.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "Našel jsem nìco na toho soudce.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Našel jsem nìco na toho soudce.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Vážnì? A co?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Najal si pár ranaøù, aby pøepadli místodržícího Khorinisu.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Krátce poté je nechal zatknout a sám shrábl peníze, které ukradli.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Jako dùkaz jsem ti pøinesl pøíkaz, který soudce tìm rváèùm dal.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Ukaž mi ho.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Koneènì. To by mìlo staèit, aby trpce litoval. Udìlal jsi na mì dojem.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Za tohle se rád plácnu pøes kapsu. Tady je tvoje odmìna.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//A nikomu o tom ani muk, jasné?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//To je vynikající. Ale celá vìc se už vyøešila sama. Soudce je mrtvý.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Nìjaký idiot ho rozmašíroval. No dobrá. To mi také docela staèí.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Tady máš pár mincí. Za víc mi ta zpráva už nestojí.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "Co je s Bennetem?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Co je s Bennetem?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Takže jsi už o tom slyšel. Ti bastardi ho zavøeli, jen tak pro nic za nic.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Jako kdybych nemìl dost starostí se svými vlastními lidmi - teï abych se staral ještì o paladiny.
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "Co budeš s tou Bennetovou záležitostí dìlat?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Co budeš s tou Bennetovou záležitostí dìlat?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Ještì nevím. Pár chlapcù by rádo vtrhlo do mìsta povyráželi lordu Hagenovi všechny zuby, jeden po druhém.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Na podobnou akci naštìstí nemáme dost lidí, nemluvì o tom, že to není mùj styl.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//Takže tady budeš jen tak sedìt a klidnì pøihlížet tomu, co se stane?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//To rozhodnì ne.
	b_logentry(TOPIC_RESCUEBENNET,"Když dostateènì rychle neprokážu Bennetovu nevinu, Lee za další následky už neponese zodpovìdnost. Jeho lidé bez váhání kdykoliv napadnou mìsto a Benneta se zbaví násilím.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares je ještì ve mìstì a snaží se zjistit, jak bychom odtamtud mohli Benneta dostat.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//Já se mezitím snažím trochu uklidnit svoje lidi. Jenom doufám, že to nebude Laresovi trvat moc dlouho.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Ano, a abych nezapomnìl... Buster s tebou chce mluvit. Nechtìl mi øíct, o co jde. Možná by ses mìl za ním stavit!
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Mohl bych ti s tou záležitostí kolem Benneta pomoci?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Mohl bych ti s tou záležitostí kolem Benneta pomoci?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Jasnì, troška inteligence a rozvahy nemùže být na škodu.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos ví, že kolem pobíhá až pøíliš pitomcù.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Bìž do mìsta a mrkni se, jestli nenajdeš nìjaký zpùsob, jak odtamtud Benneta dostat.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Ale moc se nezdržuj, nevím, jak dlouho ještì udržím své chlapy na uzdì.
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "Nìjaké novinky o Bennetovi?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Nìjaké novinky o Bennetovi?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Když už nic jiného, tak se zdá, že se ve vìzení nedoèkal žádné úhony.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Dobrá práce.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Ne, ještì poøád nevíme dost.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "Co se stalo, zatímco jsem tu nebyl?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Co se stalo, zatímco jsem tu nebyl?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Ten parchant Sylvio se doslechl o dracích v Hornickém údolí a udìlal z farmy totální blázinec.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Snažil se kluky pøesvìdèit, aby s ním šli do Hornického údolí. Sliboval jim slávu, pocty, zlato a další ptákoviny.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Spousta z nich se nechtìla nechat pro Sylvia zabít, ale našlo se pár idiotù, kteøí mu na ty kecy skoèili.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Nakonec si nechali dát od Benneta výstroj a vyrazili na cestu.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(pohrdavì) No. Nakonec jsem docela rád, že Sylvio odsud z farmy koneènì vypadl.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "Mùžeš mì uèit?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Mùžeš mì uèit?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Mùžu ti ukázat, jak bojovat s obouruèákem.
	if(other.hitchance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Ale nemám èas tì uèit zároveò základy.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Až se dostaneš na urèitou úroveò, vezmu si tì na starost. Do té doby si budeš muset najít jiného uèitele.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Slyšel jsem, že jsi docela dobrý. Vsadím se ale, že bych tì poøád mohl pár vìcí nauèit.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			LEE_TEACHPLAYER = TRUE;
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Lee mì nauèí bojovat s obouruèními zbranìmi.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Takže jestli chceš, mùžu si tì vzít do parády. Ale bude tì to nìco stát.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Kolik?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 zlatých a mùžeme si plácnout.
			Info_ClearChoices(dia_lee_canteach);
			Info_AddChoice(dia_lee_canteach,"To je pro mì moc drahé.",dia_lee_canteach_no);
			if(Npc_HasItems(other,itmi_gold) >= 1000)
			{
				Info_AddChoice(dia_lee_canteach,"Dohodnuto. Tady jsou peníze.",dia_lee_canteach_yes);
			};
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//To je pro mì moc drahé.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Nech si to projít hlavou. Uèitele mého kalibru jen tak nenajdeš.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Dohodnuto. Tady jsou peníze.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Dobrá. Mùžeš si být jist, že za to stojím.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Lee mì nauèí bojovat s obouruèními zbranìmi.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Zaènìme s tréninkem.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Zaènìme s tréninkem.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Teï jsi skuteèný mistr v boji s obouruèními zbranìmi.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Už žádného uèitele nepotøebuješ.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Teï jsi skuteèný mistr v boji s obouruèními zbranìmi.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Už žádného uèitele nepotøebuješ.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "Ještìrani roznášejí draèí vejce po celé zemi.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Ještìrani roznášejí draèí vejce po celé zemi.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Mìlo mì to napadnout. Je na èase vypadnout.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//Co s nimi tedy mám dìlat?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Rozbij je. Co jiného?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Ze skoøápek by možná šlo dìlat brnìní nebo tak nìco.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Vypadají docela pevnì. Promluv si o tom s Bennetem.
		b_logentry(TOPIC_DRACHENEIER,"S draèím vejcem toho Lee moc nenadìlá - poslal mì proto za kováøem Bennetem.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "Jak to jde na farmì?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Jak to jde na farmì?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//No, co odešel Sylvio, tady byl koneènì docela klid.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//To nezní špatnì.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Práce bohužel neubylo. Muži jsou èím dál tím nespokojenìjší, protože musejí pracovat i za Sylviovy muže.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Ale s tím si hlavu nelámej. Já si nìjak poradím.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "Nenapadá tì, jak bych mohl získat loï paladinù?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Nenapadá tì, jak bych mohl získat loï paladinù?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Myslíš, že bych tady ještì byl, kdybych to vìdìl? Tu hlídají ještì líp než transporty rudy ve Starém táboøe.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Musí existovat nìjaký zpùsob, jak se na loï dostat.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Jistì. Dostat se na palubu není nic tìžkého.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Konec koncù máme soudce ve své moci. Zkus za ním jít a vymáèknout z nìj dopis, který by tì k tomu opravòoval.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Lee se domnívá, že nejlepší zpùsob, jak se dostat na palubu paladinské lodi, je obdržet od soudce plnou moc. Není ale pøíliš pravdìpodobné, že mi nìco takového vydá jen tak.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//Mám tady falešné oprávnìní. S jeho pomocí tì nechají stráže projít.
		b_logentry(TOPIC_SHIP,"Starý dobrý Lee. Má u sebe padìlaný dopis, s jehož pomocí se mùžu dostat na palubu paladinské lodi.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Ale to není všechno. Na samotnou plavbu budeš potøebovat kapitána, posádku a tak.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Je toho spousta, bez èeho se neobejdeš.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"Koho bych mìl najmout do posádky?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Neznáš nìkoho, kdo by mohl loï øídit?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Neznáš nìkoho, kdo by mohl loï øídit?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Pokud vím, tak Torlof se na moøi vyzná. Ví, co je co a tak.
	b_logentry(TOPIC_CAPTAIN,"Torlof je starý námoøník, možná by chtìl být mým kapitánem.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Koho bych mìl najmout do posádky?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//To si musíš rozhodnout sám. Já bych s sebou ale bral jenom toho, komu mohu vìøit. Máš dost lidí, kterým mùžeš dùvìøovat?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Pokud bys potøeboval do posádky nìjakého kováøe, zkus se zeptat Benneta. Je ten nejlepší, jakého mùžeš najít.
	b_logentry(TOPIC_CREW,"Ve vìci posádky pro mì toho Lee moc udìlat nemohl. Ale poradil mi, že bych mìl najmout jen lidi, kterým mohu vìøit. Mám se zeptat ještì Benneta, mohlo by ho to zajímat.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "To povolení zafungovalo. Loï je teï moje...";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//To povolení zafungovalo. Loï je teï moje. Spolupráce s tím soudcem byla jedna radost.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Vida. To ponižování pøed tím parchantem se ti nakonec pøece jenom vyplatilo.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "Chci tu loï ukrást.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Chci tu loï ukrást.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//A jak to chceš provést?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Bude to hraèka - pùjdu tam, ukážu jim ty papíry, vezmu si loï.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Když øíkáš. Vezmi si je. Doufám, že víš, co dìláš.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "Poplavíš se se mnou?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Poplavíš se se mnou?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Dìláš si srandu? Jasnì, že do toho jdu. Mám na pevninì pár nevyøízených úètù.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Kromì toho tì mùžu uèit boj s jednoruèními a obouruèními zbranìmi. Mohl bych se ti hodit.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Lee už se nemùže doèkat, až uvidí pevninu. Nabídl mi veškerou podporu - tak dobrého uèitele bojových umìní bych nenašel široko daleko.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Loï je momentálnì plná, ale pokud se tam najde místo, tak se vrátím.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"Dám ti vìdìt, jestli tì budu potøebovat.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"Tak si bìž sbalit!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Tak si bìž sbalit!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Cože? Teï hned?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Ano, chci odsud vypadnout, takže jestli máš v plánu jet se mnou, bìž do pøístavu. Setkáme se na lodi.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Na tuhle chvíli jsem èekal hezky dlouho. Budu tam.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Dám ti vìdìt, jestli tì budu potøebovat.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Sám musíš vìdìt, co chceš. Ale dobrých bojovníkù nebudeš mít nikdy dost.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(zašklebí se) Leda naprostých pitomcù jako Sylvio.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "Pøece jenom bys mi k nièemu nebyl!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Pøece jenom bys mi k nièemu nebyl!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Jak je libo, když tak víš, kde mì najít!
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "Pøece jenom bys mi k nìèemu mohl být!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Pøece jenom bys mi k nìèemu mohl být!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Vìdìl jsem, že mì budeš potøebovat! Setkáme se na lodi.
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Víš co, bìž do háje. Nejdøív mi øekneš, abych s tebou jel, pak mì zase pošleš pryè.
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Najdi si nìjakého jiného pitomce!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

