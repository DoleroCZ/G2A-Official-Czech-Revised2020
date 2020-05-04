
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "Vidím, že ses pøidal k drakobijcùm.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Vidím, že ses pøidal k drakobijcùm.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//Šel jsem se Sylviem do Hornického údolí, protože se tady vyznám ze všech nejlépe a chtìl jsem si udìlat pøesnou pøedstavu o zdejší situaci.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Jedno ti povím. Nìco se tu chystá. Ještì nikdy jsem nevidìl tolik skøetù na jednom místì.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Nedivil bych se, kdyby touhle dobou Garond a všichni paladini z hradu už neutekli nebo nebyli rozsekaní na kousky.
	Info_AddChoice(dia_gorndjg_startcamp,"Uvidíme se.",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"Co chceš dìlat?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Co chceš dìlat?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Nejdøív pùjdu tady s chlapci do Hornického údolí a pak vyrazím.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Rozhodnì musím zjistit, co mají skøeti za lubem.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Uvidíme se.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Dávej na sebe pozor.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "Takže tady ses zašil!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//Takže tady ses zašil!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Není tak snadné se zabít, co?
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "Už jsi nìco chytil?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Už jsi nìco chytil?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Poøád èekám. Øekl bych, že tam v tìch skalních troskách nìco je. V noci se tam svítí a jsou dokonce slyšet nìjaké skøeky.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"Možná to je Lester?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"Drak?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn sitzt am Fuße der Hochebene zur alten Felsenfestung. Von dort aus hat er sowohl die Hochebene als auch die Orkbarriere im Blickfeld.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Možná to je Lester, který se vrátil do svých rozvalin?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//To tìžko. Co vím, Lester tu už nežije.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Drak?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Dost možná. Ta planina je støežená jako nìjaká mizerná královská pokladnice. Ale je to bohužel jediná cesta k pevnosti.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Jako by nestaèilo, že jsou draci dost nepøíjemní sami o sobì. Vypadá to, že mají v záloze ještì pár dalších pøíšer.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"Podle Gorna se ve staré kamenné pevnosti usadil drak.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "Jaké pøíšery to jsou?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//Jaké pøíšery to jsou?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Nevím to úplnì pøesnì, ale chodí vzpøímenì a mají šupinatou kùži. Pohybují se po skalách jako chòapavci, kteøí vycítili obì.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//Tady dole je slyším funìt a supìt. Øekl bych, že zabrali úplnì celou planinu.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "A co skøeti?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//A co skøeti?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Chvíli jsem je sledoval. Za tou ohradou dole se musí nìco ukrývat. Mám podezøení, že se jich tam shromáždil už pìkný zástup.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//Tím chceš øíct, že jich tam je VÍC než tady?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Nepøekvapilo by mì, kdyby jednoho dne tu palisádu strhli a zaplavili celou zemi. Vùbec se mi to nechce líbit.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Pokud se to stane, budu se muset vrátit a varovat Leeho. Stejnì se chce z ostrova zdekovat. Pak bude nejvyšší èas.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "Mùžeš mi pomoci dostat se do pevnosti?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Mùžeš mi pomoci dostat se do pevnosti?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//To vážnì nevím. Bojím se, že skøeti zaútoèí pøesnì ve chvíli, kdy je pustím z oèí.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//To je paranoidní!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Nemùžu si pomoci. Víš, nikdy bych si neodpustil, kdybych pøišel pozdì. Na druhou stranu...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//Vždy je to jedno! Proè jinak bych tady byl? Zaútoème na planinu a prosekejme si cestu do pevnosti.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Troška pohybu nám neuškodí. Kromì toho bych se docela rád podíval na ty bestie víc zblízka.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Dej mi vìdìt, až budeš pøipraven!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn mi chce pomoci proniknout do kamenné pevnosti na planinì.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "Zaútoème!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Zaútoème!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Jako za starých èasù, co? Ale jedno ti øeknu: tohle je moje bitva. Tentokrát jdu vepøedu já!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Byla to hraèka. Tak, pøíteli, o zbytek se už budeš muset postarat ty. Poøádnì jim zatop! Já se vrátím a budu zase dávat pozor na skøety.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//Žádný problém. Ještì se uvidíme!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//To doufám!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn se vrátil zpìt na své pozorovací stanovištì. Chce i nadále sledovat skøety.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "Drak ze skal je mrtvý!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Drak ze skal je mrtvý!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Neslyším žádné další skøeky! Byl jsi v té skalní pevnosti?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Ano!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha ha! To jsem si domyslel. Kdekoliv se objevíš, nezùstane kámen na kameni.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Co budeš dìlat dál?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Ještì chvíli tu zùstanu a pak se vrátím k Leeovi. Možná se tam zase setkáme!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Celá tahle krajina mi zaèíná lézt na nervy. Už je na èase, abychom odsud vypadli.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Uvidíme se pozdìji!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

