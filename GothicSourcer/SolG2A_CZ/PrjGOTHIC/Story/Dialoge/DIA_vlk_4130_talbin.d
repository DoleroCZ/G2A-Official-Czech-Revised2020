
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Stùj! Ani hnout!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Jo! Jenom klid!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//No to mì podrž! Další ztracená voveèka, co? Nejdøív jsem tì mìl za jednoho z tìch zlejch šmejdù, co tu poøád vopruzujou.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Ale vidím, že k nim nejspíš nepatøíš. Na to pùsobíš až moc neškodnì!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "Vypadáš jak lovec, který neví, co s èasem.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//Vypadáš jak lovec, který neví, co s èasem.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha-ha! Jo - jedna nula pro tebe. Ale co mám dìlat - pøes prùsmyk se vrátit nemùžu!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Tak tu prostì trèím a dìlám, co se dá.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Je mi ale líto mýho kámoše Engroma.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Pojï blíž k vohni a vohøej se.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"Ale nevypadáš, že by se ti daøilo nìjak špatnì.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Ty jsi bývalý vìzeò, který byl uvržen za bariéru?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Ty jsi bývalý vìzeò, který byl uvržen za bariéru?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Ne, kdepak! Co si myslíš? Vlastnì jsem se tady chtìl jenom trochu napakovat.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Nìkdo mi napovídal, že v tìchhle konèinách ulovím spoustu vìcí.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Že je to tu prostì bohatý na všecko, jestli víš, co myslím.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Ale vod tý doby, co se tu objevili ti zatracení skøeti, tu mùžeš dostat tak akorát pár pøes èuòu, když náhodou popojdeš trochu dál!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//A ti pitomci mì tu nechali poøádnì vydusit.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Takové vtipálky moc dobøe znám!
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Ale nevypadáš, že by se ti daøilo nìjak špatnì.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//No, mohlo to být horší - myslím, že si nemùžu stìžovat. I pøes ty zatracený skøety je oblast kolem øeky nejmíò nebezpeèná.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Vypadá to, že si netroufají moc blízko k vodì, ale možná je to jenom náhoda.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Proè je ti Engroma líto?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Proè je ti Engroma líto?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Protože šel prostì se mnou, a to úplnì bez øeèí.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//A teï jsme se dostali do tohohle srabu. Chamtivost se holt nevyplácí.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "Co tady u øeky lovíš?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//Co tady u øeky lovíš?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//To je ale votázka! Jen se projdi podél koryta a uvidíš, co tu asi tak mùžu lovit. Èíhavce, samozøejmì!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Ty potvory se nechytaj zrovna snadno, ale chutnaj mnohem líp, než se lovìj.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Jednou za èas narazím i na mrchožrouta. A ani nad ním nevohrnuju nos!
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "Myslím, že tvùj kámoš je trošku vystresovaný.";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Myslím, že tvùj kámoš je trošku vystresovaný.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Nech si toho. Radši ho vùbec neprovokuj, nebo mì pøipraví o hlavu. V téhle vìci už prostì nemùžu nic dìlat.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Jednou to ale zvládnu!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "Mùžeš mì nauèit nìco o lovu?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Mùžeš mì nauèit nìco o lovu?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Chápu! Takže jsi dostal taky chu lovit. No dobøe, ale bude tì to nìco stát!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Co za to chceš?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Nemáš náhodou k jídlu nìco jinýho než èíhavèí maso? Tøeba kus sejra. Jo, dal bych hlavu za kus sejra.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Uvidím, co se dá dìlat.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Talbin mì nauèí, jak ze zvíøat získávat trofeje.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Tady máš ten sýr. Budeš mì teï uèit?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Tady máš ten sýr. Budeš mì teï uèit?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Fakt jsi òákej schrastil? Páni, chlape, už je to celý vìky, kdy sem baštil nìco takovýho. Díky. No a co... aha. Nojo. Jasnì!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//Teï u sebe zrovna žádný sýr nemám.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//Je to prostì moc dobrý, než aby to byla pravda. Ale urèitì mi dej vìdìt, až òákej seženeš!
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "Co mì mùžeš nauèit?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Co mì mùžeš nauèit?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//Co bys rád vìdìl?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Vyjmutí drápù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Stažení z kùže",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Roh stínové šelmy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Vyøíznutí srdce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Tak v tom tì musím zklamat. Už znáš všecko, co bych tì mohl nauèit. Ale i tak eštì jednou dìkuju za ten sejr!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Drápy vyndáš pomìrnì jednoduše. Prostì každej popadneš pøímo za kloub a pøitlaèíš dólu.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//A pak už ho jenom vopatrnì vodøízneš nožem.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Èíhavèí kùži nejlehèejc stáhneš tak, že udìláš dlouhej øez podél bøicha...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...pak škubneš za zadní nohy a celou kùži vodzadu dopøedu z tý potvory strhneš.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Rohy stínovejch šelem jsou poøádnì tvrdý - vyrábìj se z nich hlavnì sošky a rùzný nástroje.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Srdce magickejch tvorù jsou setsakramentsky vzácný a získáš je fakt tìžko. Když to zkoušíš, buï poøádnì vopatrnej, zvláš když jde vo golemy.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Nevšiml sis, že by tudy nìkdo prošel?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Nevšiml sis, že by tudy nìkdo prošel?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Jo, nedávno tudy probìhlo pár takovejch divnejch chlápkù. Vykraèovali si v tom svým naleštìným brnìní jak pávi a chovali se, jako dyž sežrali všecku moudrost svìta.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "A co tady ti 'divní chlápkové' chtìli?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//A co tady ti 'divní chlápkové' chtìli?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Chtìli po mnì proviant a vybavení. Chlape, dyk já mám sotva dost pro sebe!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Prý zabíjejí draky a tak. Bùhví vodkuï ti hošani pøišli, ale nevypadali moc dùvìryhodnì!
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"U sídla lovce Talbina se zastavilo nìkolik drakobijcù.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Ty jsi tu v téhle chvíli sám?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Ty jsi tu v téhle chvíli sám?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Jo. Mùj kámoš Engrom už toho mìl dost a zdrhnul. Vèera tvrdil, že mìl òákou vizi, že na nìj prej nìkdo dìsnì jemnì mluvil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Já ale neslyšel ani uk. Prostì jsem si myslel, že už se totálnì zcvoknul a...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...a pak byl najednou pryè. Nemám tušáka, kam se ztratil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Kdybys Engrema náhodou nìkde zahlíd, tak mu vyøiï, že mi ten hajzl eštì furt dluží kùži z èíhavce.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//Mìl jsem ale dojem, že se vocuï nechce hnout, dokud nebudou pryè všichni skøeti.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Jak sem øek - je v tom nìco divnýho.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "Našel jsem tvého kámoše Engroma.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Našel jsem tvého kámoše Engroma.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Fakt? A kde je?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Je mrtvý.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Ani sem nedoufal, že ho eštì nìkdy uvidím.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Tumáš - mìl u sebe tuhle èíhavèí kùži.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Posedli ho Pátraèi.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Pátraèi? A kdo to má jako bejt?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Služebníci z dolních zemí. To oni ve skuteènosti velí všem tìm skøetùm.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//Pøi Innosovi! Musím se vocuï dostat, i kdyby mì to mìlo stát krk! Teï nebo nikdy!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Talbin, lovec z Hornického údolí, probìhl pøes prùsmyk, i když mìl v patách celé roje krvavých much. Myslím, že míøí do Khorinisu.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Kam se vydáš?";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Kam se vydáš?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Proveï mì prùsmykem! Prosím!!!
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"Nemám na tebe èas.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"Bìž dál a projdi prùsmykem.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"Dobrá.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Musím se vocuï dostat, pøes prùsmyk. Jdi mi z cesty!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Dobrá.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Díky ti - prostì bìž napøed a já pudu za tebou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Bìž dál a projdi prùsmykem.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Je tam taková tma - nikdy bych se tam sám nevodvážil.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//Nemám na tebe èas.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Takže ty mì tu necháš, aby mì sežraly vrány. Za tohle se budeš smažit v pekle!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Hej.";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hej.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Zmizni. Zvládnu to i bez tebe, ty parchante!
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

