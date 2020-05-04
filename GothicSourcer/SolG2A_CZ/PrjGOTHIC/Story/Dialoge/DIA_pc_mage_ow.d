
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Podívejme, kdo se vrátil! Náš hrdina od bariéry!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Rád tì vidím, Miltene.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"Mìl bych je znát?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Vzpomínáš si na Gorna, Diega a Lestera?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Rád tì vidím, Miltene. Poøád chvíli tady a chvíli tam?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Poøád. Co padla bariéra, vstoupil jsem do kláštera ohnivıch mágù.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Ale jakmile se ukázalo, e sem chtìjí pøijít paladinové, pøišly k duhu moje zkušenosti a znalost okolí.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Rozhodli se tedy, e mì povìøí svatım posláním poskytnout této vıpravì magickou podporu.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Samozøejmì, e si kluky pamatuju.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Ta jména mi vánì nic neøíkají.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Mìl bych je znát?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Asi toho máš za sebou dost, co?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Samozøejmì, e si kluky pamatuju.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Ta jména mi vánì nic neøíkají.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Samozøejmì, e si kluky pamatuju.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//No, Gorn a Diego se daleko nedostali. Sebrali je paladinové tady v údolí.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Ale Lester zmizel - vùbec netuším, kde by se tak mohl flákat.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//S Lesterem jsem se setkal - je teï s Xardasem.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Aspoò jedna dobrá zpráva.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//No, já ádné dobré zprávy nemám.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Ta jména mi vánì nic neøíkají.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Hodnì jsi toho zapomnìl, co? No, nechme minulost odpoèívat v pokoji a vìnujme se tomu, co máme pøed sebou.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//I kdy nemám nic pøíjemného, co bych mohl nahlásit.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "A co bys rád nahlásil?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//A co bys rád nahlásil?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Pøišli sem paladinové a chtìjí odvézt magickou rudu.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Ale kdy si vezmu všechny ty draky a skøety, netuším, jak chtìjí paladinové rudu dostat a pak se taky dostat pryè.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Ne, u Innose - cítím pøítomnost nìèeho temného... roste tu nìjaké zlo. Vychází to z tohohle údolí.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Za zlikvidování Spáèe jsme zaplatili vysokou cenu. Pád bariéry poznamenal i tohle místo.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Budeme mít opravdu velké štìstí, kdy to pøeijeme.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "Kolik rudy jste zatím nashromádili?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Kolik rudy jste zatím nashromádili?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Kolik rudy...? Ani jedinou bednu! U pøed nìjakou dobou jsme ztratili kontakt s kopáèi.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Vùbec by mì nepøekvapilo, kdyby byli dávno mrtví. A ke všemu na nás útoèí draci a oblehli nás skøeti!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Celá tahle expedice je naprostá katastrofa.
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "Kde jsou teï Gorn a Diego?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Kde jsou teï Gorn a Diego?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Inu, Gorn sedí tady v aláøi - bránil se zatèení.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Diega pøiøadili ke skupinì kopáèù - kdy tak se zeptej paladina Parcivala, ten dával ty skupiny dohromady.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "Pojïme osvobodit Gorna!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Pojïme osvobodit Gorna!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//No, je tady jeden malı problém - Gorn je usvìdèenı vìzeò.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Ale kdy budeme mít štìstí, podaøí se nám domluvit se s Garondem a vykoupit ho.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Ano, moná...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Udruj mì v obraze.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Velitel Garond nechal Gorna zavøít. Snad tak trochu naletìl, a tak bychom mu mìli pomoci z nesnází.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Garond chce za Gorna 1000 zlatıch.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond chce za Gorna 1000 zlatıch.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Hezká sumièka. Mùu pøispìt 250 zlatımi.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Milten mi dal 250 zlaákù, abych zaplatil za Gornovo propuštìní.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "Pokud mám Gorna vykoupit, budu potøebovat víc zlata.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Pokud mám Gorna vykoupit, budu potøebovat víc zlata.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Víc zlata... hm. Diego o takovıch vìcech ví dost - ale ten tady není.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Moná si Gorn sám schoval nìjaké zlato na horší èasy - mìli bychom se na to podívat.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Napíšu mu vzkaz. Zkus mu ho nìjak propašovat do aláøe.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Milten mi pøedal zprávu pro Gorna. Kdy mu ji nìjak propašuji do vìzení, mùe nám prozradit, jestli nemá nìkde ulité nìjaké zlato.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Mohl bys mi dát nìjakou vıbavu?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Mohl bys mi dát nìjakou vıbavu? Garond mì poádal, jestli bych se nevypravil do dolù.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//A kde bych to tak asi mìl sehnat? Jediné, co ti mùu dát, je cennı runovı kámen.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "Mám odpovìï od Gorna... ";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Mám odpovìï od Gorna. Øíká, e zlato je u jiní brány.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(trpce) Chtìl jsi øíct u bıvalé jiní brány. Ten drak z ní udìlal hromadu suti.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Jak se tam dostanu?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Je to poblí skøetího beranidla. Jiní brána byla napravo od nìj.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Nebude to nijak snadné - buï opatrnı a pospìš si.
	b_logentry(TOPIC_RESCUEGORN,"Bıvalá jiní brána leí pøímo naproti skøetím zátarasùm. Gornovo zlato by mìlo bıt nìkde tam.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Dobøe. Mìli bychom si promyslet, co bude dál.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "Mùeš mì nìèemu nauèit?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Mùeš mì nìèemu nauèit?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Mohu tì nauèit trochu magie z Druhého magického kruhu, pøípadnì ti také mohu pomoci zvıšit magické síly.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Jestli jsi pøipravenı na zvıšení magické síly, mohu tì zaèít uèit.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "Nauè mì Druhı magickı kruh!";
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Nauè mì Druhı magickı kruh!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//Vìtšinou to je privilegium vyhrazené uèitelùm našeho øádu.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Ale myslím, e v tomto pøípadì mùeme udìlat vıjimku.
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Nevím, jestli si pamatuju ta oficiální slova správnì...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Vstup nyní do Druhého kruhu. Ehm... Ukáe ti smìr - cestu však budou tvoøit skutky tvé - nebo tak nìjak to bylo...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Myslím, e víš, co to má znamenat...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "Chci se nauèit nìjaká nová kouzla.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Chci se nauèit nìjaká nová kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Ještì jsi nevstoupil do Druhého magického kruhu. Nemùu tì nic nauèit.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "Chtìl bych posílit svoji magickou moc.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Chtìl bych posílit svoji magickou moc.
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Tvoje magická síla je veliká. Pøíliš velká na to, abych ti ji mohl pomoci ještì zvıšit.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "Co tady máš za úkol?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//Co tady máš za úkol?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Pùvodnì jsem mìl provádìt rozbor magické rudy. Zatím jsme jí ale moc nedostali.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Teï se soustøeïuji na studium alchymie.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "Co máš v plánu?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Co máš v plánu?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Vrátím se. Chvíli ještì poèkám, ale teï, kdy je Gorn na svobodì, mùu vyrazit spoleènì s ním.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Je naprosto nezbytné, aby se Pyrokar dozvìdìl, jak to tady vypadá.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Kdy myslíš.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Doufám, e lord Hagen rozpozná, co za hrozbu vychází z tohoto údolí. Lepší si nepøedstavovat, co by se stalo, kdyby skøeti pøešli pøes prùsmyk.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//No, v tom pøípadì ti pøeju bezpeènou cestu.
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(Ukrást tenhle lektvar bude dosti obtíné.)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

