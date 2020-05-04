
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(pøemítá) ... Zvláštní. Pøipadáš mi povìdomı, cizinèe ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//No ... nesmírné jsou tajemství èasu a vesmíru ... ah, omluv mou nezdvoøilost, synu trpìlivosti. Ještì jsem tì ani nepøivítal ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Vítej, pøíteli. Sedni si na koberec a vychutnej si vodní dımku.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Jmenuju se Abú Dín ibn Dadír ibn Omar Chalíd ben Hádí al-Šarídí. Jsem vìštcem a prorokem, astrologem a dodavatelem tabáku.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "Jakı druh tabáku nabízíš?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Jakı druh tabáku nabízíš?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Mé dımky jsou naplnìny pikantním a osvìujícím jableènım tabákem.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Poslu si, kdykoli budeš chtít, syne dobrodruství.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "Máš i jinı tabák?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//Máš i jinı tabák?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Nabízím pouze ten nejlepší tabák. Tato jableèná smìs má podobné vlastnosti jako tabák z mé domoviny, Jiních ostrovù.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Ale samozøejmì se nijak nebráním vyzkoušet jakıkoli jinı druh - pokud tedy nìkdo dokáe vyrobit opravdu dobrı tabák.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//Jak se to dìlá?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Jako základ doporuèuju mùj jableènı tabák. A pak mùeš vyzkoušet kombinace s dalšími ingrediencemi.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Vıroba probíhá v alchymistické kolonì a vyaduje základní znalosti alchymie.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Kde se dá sehnat jableènı tabák?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Kde se dá sehnat jableènı tabák?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Dám ti dvì dávky. Je jen na tvé moudrosti, jak s ním naloíš.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Pokud budeš chtít další, zajdi pøímo za Zuridem, mistrem lektvarù. Dìlá si svùj vlastní tabák a také ho samozøejmì prodává.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Nech mì ten tabák vyzkoušet.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Ne, obávám se, e mi tahle smìs nebude vyhovovat. Ale moná se ti podaøí nalézt nìkoho jiného, kdo ehm... ocení takovou delikatesu.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "Mám novou smìs tabáku.";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Mám novou smìs tabáku.
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_KRAUT,dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_PILZ,dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_DOPPEL,dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_HONIG,dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Nech mì ten tabák vyzkoušet.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Chutná to pøímo neuvìøitelnì! Nikdy jsem v celém svém ivotì nic lepšího nekouøil!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Jak jsi tu smìs pøipravil?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Smíchal jsem tabák s medem.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//To se ti opravdu povedlo, otèe umìní mísení. Byl bych potìšen, kdybych smìl své nuzné dımky naplnit tak vzácnou smìsí.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Tak je naplò.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Díky, synu velkorysosti. ádná jiná smìs nemùe bıt tak dobrá jako tato. Koupím od tebe veškerou smìs tohoto druhu, co mi pøineseš.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "Mám pro tebe trochu medového tabáku.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Mám pro tebe trochu medového tabáku.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Obchodovat s tebou je mi neskonalım potìšením.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Zajímal by tì tenhle balíèek drog?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Zajímal by tì tenhle balíèek drog?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Balík bylinek - neøíkej, e to je tráva z bain. Ó, dej to pryè, synu lehkovánosti.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Jestli mì s tím chytí mìstské stráe, pošlou mì rovnou za møíe - a ty nedopadneš o moc lépe!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Pokud chceš tu zásobu prodat, dám ti jednu radu - opus tohle mìsto.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Pokus se toho zbavit nìkde za hradbami. Všechno, co za to mùeš dostat tady, je spousta trablù.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Dokáeš mi pøedpovìdìt budoucnost?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Dokáeš mi pøedpovìdìt budoucnost?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Za menší poplatek jsem ti k slubám, ó otèe velkorysosti.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Kolik chceš?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//Za pouhıch 25 zlatıch budu kvùli tobì riskovat pohled skrze èas.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Ale pamatuj - budoucnost je vdycky nejistá. Vše, co mohu udìlat, je zbìnì prolétnout nìkolik útrkù èasu.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "Pøedpovìz mi budoucnost (zaplatit 25 zlaákù).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Pøedpovìz mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Dobrá, hledaèi vìdomostí. Teï se musím dostat do hypnotického stavu. Jsi pøipraven?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"Jsem pøipraven!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//Ó, otèe mincí, ádám tì o 25 zlatıch, za to, e nahlédnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(V transu)... Skøeti... hlídají vstup... stará chodba... Hornické údolí...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(V transu)... Mu v záøivé zbroji... mág... je s ním tvùj pøítel... èeká na tebe...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(V transu)... Oheò! Útok... mocná stvoøení... plameny... mnoho... jich zemøe...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(v tranzu) ... co je to ... ? Mìsto ... ruiny ... Quarhodron v Jharkendaru ...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(v tranzu) ... nazıvá se ... Quarhodron v Jharknedru!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Je mi líto, ale vize je u konce. U tu není nic, co bych mohl spatøit.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "Mùeš mi udìlat ještì další proroctví?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Mùeš mi udìlat ještì další proroctví?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//Ó synu záhadné budoucnosti, není v mé moci poodhalit závoj èasu.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Pouze pokud mi èas sešle další znamení, budu schopen se do nìj podívat znovu.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//A kdy to bude?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//A se budoucnost stane pøítomností a ty budeš pokraèovat ve své cestì.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Mùeš mi pøedpovìdìt budoucnost?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Ano, èas postoupil a já ti na oplátku za nìkolik mincí sdìlím proroctví.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Kolik?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "Mùeš vìštit mou budoucnost?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//Za pouhıch 100 zlatıch budu kvùli tobì riskovat pohled skrze èas.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "Pøedpovìz mi budoucnost (zaplatit 100 zlaákù).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Pøedpovìz mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Dobrá, synu udatnosti. Teï se dostanu do hypnotického stavu. Jsi pøipraven?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"Jsem pøipraven!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//Ó otèe mincí, ádám tì o 100 zlatıch za to, e nahlédnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(V transu)... oldák... bude tì potøebovat... strašná vrada... Oko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(V transu)... zlovìstní stoupenci... pøicházejí... hledají tebe... stráce padne...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(V transu)... ale tøi se spojí... jedinì pak získáš, co ti náleí...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//To je vše. Není nic, co bych ještì mohl spatøit.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "Mùeš vìštit mou budoucnost?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//Za pouhıch 250 zlatıch budu kvùli tobì riskovat pohled skrze èas.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "Pøedpovìz mi budoucnost (zaplatit 250 zlaákù).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Pøedpovìz mi budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Dobrá, synu vìdomostí. Teï se dostanu do hypnotického stavu. Jsi pøipraven?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"Jsem pøipraven!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//Ó otèe mincí, ádám tì o 250 zlatıch za to, e nahlédnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(V transu)... musíš donutit... co není osud nikoho jiného, pouze tvùj...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(V transu)... pøes sníh a oheò... pøes led a plameny...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(V transu)... Mui v podivné zbroji... bainy... ještìrani... èekají na tebe...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//To je vše. Není nic, co bych ještì mohl spatøit.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "Mùeš vìštit mou budoucnost?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//Za pouhıch 500 zlatıch budu kvùli tobì riskovat pohled skrze èas.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "Pøedpovìz mi budoucnost (zaplatit 500 zlaákù).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Pøedpovìz mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Dobrá, synu vìdomostí. Teï se dostanu do hypnotického stavu. Jsi pøipraven?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"Jsem pøipraven!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//Ó otèe mincí, ádám tì o 500 zlatıch za to, e nahlédnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(V transu)... místo vìdomostí... jiná zemì... temné místo široko daleko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(V transu)... udatní spoleèníci... musíš zvolit...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(V transu)... chrám... leí osamocen v Adanovì øíši... skrytı v mlze...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//To je vše. Není nic, co bych ještì mohl spatøit.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "Mùeš vìštit mou budoucnost?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//Za pouhıch 1000 zlatıch budu kvùli tobì riskovat pohled skrze èas.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "Pøedpovìz mi budoucnost (zaplatit 1000 zlaákù).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Pøedpovìz mi mou budoucnost.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Dobrá, synu vìdomostí. Teï se dostanu do hypnotického stavu. Jsi pøipraven?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"Jsem pøipraven!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Ó, otèe mincí, ádám tì o 1000 zlatıch za to, e nahlédnu do budoucnosti.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(V transu)... Temnota pohltí zemi... zlo zvítìzí...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(V transu)... král prohraje válku se skøety...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(V transu)... vrátíš se, ale nenalezneš klidu...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//To je vše. Není nic, co bych ještì mohl spatøit.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

