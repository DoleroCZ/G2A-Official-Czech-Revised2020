
instance DIA_ADDON_ALLIGATORJACK_EXIT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 999;
	condition = dia_addon_alligatorjack_exit_condition;
	information = dia_addon_alligatorjack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_alligatorjack_exit_condition()
{
	return TRUE;
};


var int dia_addon_alligatorjack_exit_info_onetime;

func void dia_addon_alligatorjack_exit_info()
{
	if((MIS_KROKOJAGD == LOG_SUCCESS) && (dia_addon_alligatorjack_exit_info_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Jestliže mì budeš hledat, jsem obvykle nìkde blíž mého tábora blízko palisád.
		if(pir_1354_addon_henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palisády?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Prostì jdi na západ. Pochopíš, co myslím.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		dia_addon_alligatorjack_exit_info_onetime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ALLIGATORJACK_PICKPOCKET(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 900;
	condition = dia_addon_alligatorjack_pickpocket_condition;
	information = dia_addon_alligatorjack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_alligatorjack_pickpocket_condition()
{
	return c_beklauen(100,333);
};

func void dia_addon_alligatorjack_pickpocket_info()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_BACK,dia_addon_alligatorjack_pickpocket_back);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_PICKPOCKET,dia_addon_alligatorjack_pickpocket_doit);
};

func void dia_addon_alligatorjack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};

func void dia_addon_alligatorjack_pickpocket_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};


instance DIA_ADDON_ALLIGATORJACK_HELLO(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_hello_condition;
	information = dia_addon_alligatorjack_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_hello_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_hello_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Kdo tedy MÙŽEŠ být? Nevypadáš jako ostatní.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Jací další?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Myslím mágy, kteøí si vykraèují v tìch ruinách nahoøe.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Patøíš do toho spolku?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//Pìknì odvážný, že se tu potuluješ sám.
};


instance DIA_ADDON_ALLIGATORJACK_WERBISTDU(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_werbistdu_condition;
	information = dia_addon_alligatorjack_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_addon_alligatorjack_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_alligatorjack_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Pravdìpodobnì si už o mì slyšel.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(pyšnì) Já jsem Alligator Jack.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Obávaný ve všech zemích. Já a ostatní jsme nejnebezpeènìjší piráti v okolí.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Spoleènì s naším kapitánem Gregem jsme vylupovali obchodní lodì.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Stojíš pøed živoucí legendou a to je co øíct.
};


instance DIA_ADDON_ALLIGATORJACK_VORSCHLAG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_vorschlag_condition;
	information = dia_addon_alligatorjack_vorschlag_info;
	description = "Znáš nìkoho, kdo se jmenuje Raven?";
};


func int dia_addon_alligatorjack_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Znáš nìkoho, kdo se jmenuje Raven?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Jasnì. Je vùdcem banditù na východì.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//Co od NÌJ chceš?
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven a jeho banditi jsou schovaní u východu z údolí.");
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Chci se k nìmu pøipojit.",dia_addon_alligatorjack_vorschlag_join);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Musím ho zabít.",dia_addon_alligatorjack_vorschlag_tot);
};

func void b_alligatorjack_besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//Mám lepší nápad.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//Pøipoj se k nám.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//Dùkladnì si to promysli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//Jen co zkusíš domácí rum, svìt se ti bude zdát mnohem krásnìjší.
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
};

func void dia_addon_alligatorjack_vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Musím ho zabít.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(smìje se) Co? TY? Jak myslíš, že HO odstraníš?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Není ten chlap na tebe trochu velké sousto?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//Vùbec se k nìmu nedostaneš. Bandité, které shromáždil, tì stejmou døív, než ho jen spatøíš.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Nedostneš se ani pøes první pøedsunutou hlídku.
	b_alligatorjack_besser();
};

func void dia_addon_alligatorjack_vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Chci se k nìmu pøipojit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//(opatrnì) Je to tak?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//Nevypadáš, jako nìkdo, kdo by se chtìl pøidat k tìm bláznùm.
	b_alligatorjack_besser();
};


instance DIA_ADDON_ALLIGATORJACK_BDTRUESTUNG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_bdtruestung_condition;
	information = dia_addon_alligatorjack_bdtruestung_info;
	description = "Potøebuji zbroj banditù.";
};


func int dia_addon_alligatorjack_bdtruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_vorschlag) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_bdtruestung_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Potøebuji zbroj banditù.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//A co s NÍ?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Dostaneš se jenom do problémù, jenom co tì nìkdo uvidí ji nosit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Každý si bude myslet, že jsi bandita a bude se tì snažit zabít.
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"Máš nìjaký nápad, kde bych mohl sehnat takové brnìní?",dia_addon_alligatorjack_bdtruestung_wo);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"To zní dobøe.",dia_addon_alligatorjack_bdtruestung_gut);
};

func void dia_addon_alligatorjack_bdtruestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//To zní dobøe.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Jo, ale pro nìkoho, kdo je sebevrah.
};

func void dia_addon_alligatorjack_bdtruestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//Máš nìjaký nápad, kde bych mohl sehnat takové brnìní?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//Myslím, že máme jednu v pirátském táboøe.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Ale nevím, jestli tam ještì je.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Piráti kdysi mìli zbroj banditù. Aligator Jack mi nemùže øíct jestli ještì existuje.");
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
};


instance DIA_ADDON_ALLIGATORJACK_GREG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_greg_condition;
	information = dia_addon_alligatorjack_greg_info;
	description = "Tvùj kapitán se jmenuje Greg?";
};


func int dia_addon_alligatorjack_greg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_greg_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Tvùj kapitán se jmenuje Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Jo. Je nejvìtší pirát, kterého kdy oceán splodil.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Myslím, že znám tvého kapitána. Potkal jsem ho v Khorinisu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(smìje se) Greg? V khorinisu? Nesmysl!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Greg je pryè na moøském nájezdu s pár chlapci.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//Jediná vìc, která by mohla Grega pøivést do Khorinisu je vìzeòská galéra krále.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Je jedním z nejhledanìjších mùžù v zemi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Nepùjde dobrovolnì do mìsta a nenechá královské stráže, aby ho hodily do kobek.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Když myslíš.
};


instance DIA_ADDON_ALLIGATORJACK_PIRLAGER(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirlager_condition;
	information = dia_addon_alligatorjack_pirlager_info;
	description = "Kde je tvùj pirátský tábor?";
};


func int dia_addon_alligatorjack_pirlager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirlager_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Kde je tvùj pirátský tábor?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Vidíš ten tunel tady? Když ho budeš sledovat a pokraèovat západnì, døív nebo pozdìji dojdeš k naší pláži.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Tam máme naše chatrèe.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Pokud chceš, mùžu ti ukázat cestu. Ale musíš pro mì udìlat malou laskavost.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//A co to má být?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//Pøedtím, než se mùžu vrátit do tábora, musím nalovit nìjaké maso pro kluky.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Jsi silný mladík.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//Mùžu potøebovat pomoc s lovem. Máš zájem?
	Log_CreateTopic(TOPIC_ADDON_RATHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RATHUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RATHUNT,"Alligatorovi Jackovi se mùže hodit pomoc s lovením.");
};


instance DIA_ADDON_ALLIGATORJACK_WASJAGEN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_wasjagen_condition;
	information = dia_addon_alligatorjack_wasjagen_info;
	description = "Co lovíš?";
};


func int dia_addon_alligatorjack_wasjagen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_wasjagen_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//Co lovíš?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Nic, obvykle jen aligatory. Ale nemùžeme je sníst.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//Kromì toho, tu žádní nezbyli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Proto lovím, co se dá jíst. Moèálové krysy.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Vìtšina potvor okolo chutná jako lidská noha, nebo jsou moc tuhý, jako alligatoøí maso.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Tlusté bažinné krysy jsou jediná vìc, co se dá jíst.
	b_logentry(TOPIC_ADDON_RATHUNT,"Jedina vìc, co je tady pravdìpodobnì k jídlu je moèalová krysa.");
};


instance DIA_ADDON_ALLIGATORJACK_PIRATES(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirates_condition;
	information = dia_addon_alligatorjack_pirates_info;
	permanent = FALSE;
	description = "Øekni mi více o pirátech.";
};


func int dia_addon_alligatorjack_pirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirates_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//Øekni mi více o pirátech.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//Žili jsme tu celé roky. Za starých èasù, pøed válkou, každý odsud až po kontinent vìdìl, kdo jsme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Naše vlajka na obzoru staèila, aby vydìsila obchodní lodì.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Ale tyto dny skonèili. Jsou to týdny, co jsme mìli obchodní loï pøed stìžní.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Kapitán Greg se šel podívat znovu, jestli náhodou nemùže jednu polapit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//Zbytek z nás sedí okolo tábora a toèí palcema, dokud se nevrátí.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Doufejme, že pøinese nìjakou dobrou koøist.
};


instance DIA_ADDON_ALLIGATORJACK_LETSGOHUNTING(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_letsgohunting_condition;
	information = dia_addon_alligatorjack_letsgohunting_info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int dia_addon_alligatorjack_letsgohunting_condition()
{
	if((MIS_KROKOJAGD == FALSE) && Npc_KnowsInfo(other,dia_addon_alligatorjack_wasjagen) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_letsgohunting_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Jdeme na lov.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Dobøe. I pro dva je to dost práce.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Jsi pøipraven?
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Ne, ještì ne.",dia_addon_alligatorjack_letsgohunting_no);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Ano.",dia_addon_alligatorjack_letsgohunting_yes);
};


const int ALLIGATORJACK_INTER1 = 1;
const int ALLIGATORJACK_KESSEL = 2;
const int ALLIGATORJACK_INTER2 = 3;
const int ALLIGATORJACK_CANYON = 4;

func void dia_addon_alligatorjack_letsgohunting_yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Dobøe. Drž se za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER1;
	MIS_KROKOJAGD = LOG_RUNNING;
};

func void dia_addon_alligatorjack_letsgohunting_no()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Ne, ještì ne.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Pak si pospìš.
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER1(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter1_condition;
	information = dia_addon_alligatorjack_alligatorjackinter1_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter1_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter1_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Roklina.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//Tady možná najdeme nìjaká zvíøata.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Pojï za mnou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_KESSEL;
};


instance DIA_ADDON_ALLIGATORJACK_THEHUNT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_thehunt_condition;
	information = dia_addon_alligatorjack_thehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_thehunt_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_KESSEL) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_thehunt_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//To je to, èeho jsem se obával.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Masa z tìch potvor je jenom polovina, než potøebuju.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Teï musíme jít také do kaòonu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//Dávej bacha. Hloubìji v kaòonu už je to trochu nebezpeènìjší.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Pokud máš rád svùj život, tak se mì drž.
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(dia_addon_alligatorjack_thehunt);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"CO je v kaòonu?",dia_addon_alligatorjack_thehunt_enough);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"Dobrá, jdeme.",dia_addon_alligatorjack_thehunt_running);
};

func void dia_addon_alligatorjack_thehunt_enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//CO je v kaòonu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Pokud to bude možné, tak se tomu vyhneme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Jsou tam bøitvy. Pìknì vytrvalý. Drž se od nich dál, pokud chceš žít.
};

func void dia_addon_alligatorjack_thehunt_running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Dobrá, jdeme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Jasnì.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER2;
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER2(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter2_condition;
	information = dia_addon_alligatorjack_alligatorjackinter2_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter2_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter2_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Pojï sem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_CANYON;
};


instance DIA_ADDON_ALLIGATORJACK_HUNTEND(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_huntend_condition;
	information = dia_addon_alligatorjack_huntend_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_huntend_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_CANYON) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_huntend_info()
{
	if(ALLIGATORJACK_KROKOSKILLED == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Teï mi øekni, proè jsem tì vlastnì bral sebou?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Nezabil jsi ani jednu moèálovou krysu.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Hmm, dobrá, možná se ukážeš víc potøebný pøíštì.
	}
	else if(ALLIGATORJACK_KROKOSKILLED == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Velmi dobøe! Mùžeme potøebovat nìkoho, jako si ty.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//Na tvém prvním lovu jsi ulovil jednu z tìch potvor. To není špatné.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//Máš opravdový talent.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//Zatracenì, pokud budeš pokraèovat jako teï, mùžu zùstat v táboøe.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Tady, vem tohle krysí maso a dones to tomu povaleèi Morganovi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Najdeš ho v našem táboøe.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Pravdìpodobnì se povaluje nìkde okolo pláže. Myslím, že tì už oèekává.
	if(pir_1354_addon_henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//U vchodu do tábora najdeš pravdìpodobnì Henryho. Stará se o hlídáni v pøípadì, že by zaútoèili bandité.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Jestli tì nepustí dovnitø, tak mu øekni, že tì posílám.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//To by ho mìlo udìlat pøípustnìjším.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry mùže být trochu nepøíjemný a rád šéfuje.
	};
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Alligator Jack mi dal 10 kouskù masa. Mám je pøinést Morganovi.");
	b_logentry(TOPIC_ADDON_RATHUNT,"Lov byl uspìšný. Zabyli jsme nìkolik bažinných krys.");
	b_giveinvitems(self,other,itfomuttonraw,10);
	MIS_KROKOJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_KROKOJAGD);
};


instance DIA_ADDON_ALLIGATORJACK_ANGUS(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_angus_condition;
	information = dia_addon_alligatorjack_angus_info;
	permanent = FALSE;
	description = "Znáš Anguse a jeho kamaráda Hanka?";
};


func int dia_addon_alligatorjack_angus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_angusnhank) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_angus_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Znáš Anguse a jeho kamaráda Hanka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Docela dlouho jsem je nevidìl.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//Vlastnì si myslím, že se už znovu neobjeví.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Proè?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Tihle idioti se jen poflakovali kolem jezera a byli stále vydìšení.
};


instance DIA_ADDON_ALLIGATORJACK_LAKE(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_lake_condition;
	information = dia_addon_alligatorjack_lake_info;
	permanent = FALSE;
	description = "U kterého jezera se potloukali?";
};


func int dia_addon_alligatorjack_lake_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_alligatorjack_angus) == TRUE) && (MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_lake_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//U kterého jezera se potloukali?
	if(MIS_KROKOJAGD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Pamatuješ náš lov?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Ano.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Jezero v roklinì. Tam jsem je vìtšinou vidìl.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Na jezeru ve velké kotlinì.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Jenom jdi na východ z našeho tábora. Nemùžeš to minout.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//Má to hodnì malých vodopádù.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Ale buï opatrný. Jestli nic nemáš, ale cítíš suchý písek pod svýma nohama,tak si se špatnì otoèil a vstoupil do kaòonu.
	};
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Jak se zdá jeskynì je na východ od tábora. Na pravo jezera.");
};


instance DIA_ADDON_ALLIGATORJACK_CANLEARN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_canlearn_condition;
	information = dia_addon_alligatorjack_canlearn_info;
	permanent = TRUE;
	description = "Mùžeš mì nìco nauèit?";
};


func int dia_addon_alligatorjack_canlearn_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == FALSE)
	{
		if((Npc_KnowsInfo(other,dia_addon_alligatorjack_huntend) == TRUE) || (GREGISBACK == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_alligatorjack_canlearn_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//Mùžeš mì nìco nauèit?
	if(MIS_KROKOJAGD > LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Jasnì, jsem dobrý lovec.Mùžu ti ukázat jak stáhnout zvíøata a jak vyndat jejich zuby.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//Mùži ti to ukázat, jestli chceš.
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,"Alligator Jack mì mùže nauèit jak stáhnout ze zvíøat kùži a vyndat jejich zuby. Mùže mì také nauèit støílet z luku.");
		ALLIGATORJACK_ADDON_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Nejdøiv mi musíš ukázat, jak si pøipravený na lov.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Když budeme na lovu spoleènì, možná to zvládnu.
	};
};

func void b_aj_teach()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
	Info_AddChoice(dia_addon_alligatorjack_teach,DIALOG_BACK,dia_addon_alligatorjack_teach_back);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_alligatorjack_teach_bow_5);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_alligatorjack_teach_bow_1);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Stahování kùže",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_REPTILESKIN)),dia_addon_alligatorjack_teach_fur);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Výjmutí zubù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_alligatorjack_teach_teeth);
};


instance DIA_ADDON_ALLIGATORJACK_TEACH(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_teach_condition;
	information = dia_addon_alligatorjack_teach_info;
	permanent = TRUE;
	description = "Uè mì!";
};


func int dia_addon_alligatorjack_teach_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_teach_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//Uè mì!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Co chceš vìdìt?
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
};

func void dia_addon_alligatorjack_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_fur()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_REPTILESKIN] == FALSE)
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_REPTILESKIN))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//Vždy jediný øez podél bøicha, nebo to znièí kvalitu.
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void b_allijack_alliklar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Jasnì.
};


instance DIA_ADDON_ALLIGATORJACK_ANHEUERN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 11;
	condition = dia_addon_alligatorjack_anheuern_condition;
	information = dia_addon_alligatorjack_anheuern_info;
	permanent = FALSE;
	description = "Pojïme lovit.";
};


func int dia_addon_alligatorjack_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Pojïme lovit.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	b_addon_piratesfollowagain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_ALLIGATORJACK_COMEON(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 12;
	condition = dia_addon_alligatorjack_comeon_condition;
	information = dia_addon_alligatorjack_comeon_info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int dia_addon_alligatorjack_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_alligatorjack_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Jdeme na lov.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_allijack_alliklar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ALLIGATORJACK_GOHOME(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 13;
	condition = dia_addon_alligatorjack_gohome_condition;
	information = dia_addon_alligatorjack_gohome_info;
	permanent = TRUE;
	description = "Už tì nepotøebuji";
};


func int dia_addon_alligatorjack_gohome_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//Už tì nepotøebuji.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ALLIGATORJACK_TOOFAR(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 14;
	condition = dia_addon_alligatorjack_toofar_condition;
	information = dia_addon_alligatorjack_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_alligatorjack_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

